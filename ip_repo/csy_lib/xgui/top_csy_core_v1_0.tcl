# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "C_CORE_CLK_FREQUENCY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_NUM_INTR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_SLV_ADDR_BASE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_SLV_ADDR_RANGE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_SYNTHESIS_OPTION" -parent ${Page_0}
  ipgui::add_param $IPINST -name "simulation_g" -parent ${Page_0}


}

proc update_PARAM_VALUE.C_CORE_CLK_FREQUENCY { PARAM_VALUE.C_CORE_CLK_FREQUENCY } {
	# Procedure called to update C_CORE_CLK_FREQUENCY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_CORE_CLK_FREQUENCY { PARAM_VALUE.C_CORE_CLK_FREQUENCY } {
	# Procedure called to validate C_CORE_CLK_FREQUENCY
	return true
}

proc update_PARAM_VALUE.C_NUM_INTR { PARAM_VALUE.C_NUM_INTR } {
	# Procedure called to update C_NUM_INTR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_NUM_INTR { PARAM_VALUE.C_NUM_INTR } {
	# Procedure called to validate C_NUM_INTR
	return true
}

proc update_PARAM_VALUE.C_SLV_ADDR_BASE { PARAM_VALUE.C_SLV_ADDR_BASE } {
	# Procedure called to update C_SLV_ADDR_BASE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_SLV_ADDR_BASE { PARAM_VALUE.C_SLV_ADDR_BASE } {
	# Procedure called to validate C_SLV_ADDR_BASE
	return true
}

proc update_PARAM_VALUE.C_SLV_ADDR_RANGE { PARAM_VALUE.C_SLV_ADDR_RANGE } {
	# Procedure called to update C_SLV_ADDR_RANGE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_SLV_ADDR_RANGE { PARAM_VALUE.C_SLV_ADDR_RANGE } {
	# Procedure called to validate C_SLV_ADDR_RANGE
	return true
}

proc update_PARAM_VALUE.C_SYNTHESIS_OPTION { PARAM_VALUE.C_SYNTHESIS_OPTION } {
	# Procedure called to update C_SYNTHESIS_OPTION when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_SYNTHESIS_OPTION { PARAM_VALUE.C_SYNTHESIS_OPTION } {
	# Procedure called to validate C_SYNTHESIS_OPTION
	return true
}

proc update_PARAM_VALUE.simulation_g { PARAM_VALUE.simulation_g } {
	# Procedure called to update simulation_g when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.simulation_g { PARAM_VALUE.simulation_g } {
	# Procedure called to validate simulation_g
	return true
}


proc update_MODELPARAM_VALUE.C_CORE_CLK_FREQUENCY { MODELPARAM_VALUE.C_CORE_CLK_FREQUENCY PARAM_VALUE.C_CORE_CLK_FREQUENCY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CORE_CLK_FREQUENCY}] ${MODELPARAM_VALUE.C_CORE_CLK_FREQUENCY}
}

proc update_MODELPARAM_VALUE.C_NUM_INTR { MODELPARAM_VALUE.C_NUM_INTR PARAM_VALUE.C_NUM_INTR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_NUM_INTR}] ${MODELPARAM_VALUE.C_NUM_INTR}
}

proc update_MODELPARAM_VALUE.C_SLV_ADDR_BASE { MODELPARAM_VALUE.C_SLV_ADDR_BASE PARAM_VALUE.C_SLV_ADDR_BASE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_SLV_ADDR_BASE}] ${MODELPARAM_VALUE.C_SLV_ADDR_BASE}
}

proc update_MODELPARAM_VALUE.C_SLV_ADDR_RANGE { MODELPARAM_VALUE.C_SLV_ADDR_RANGE PARAM_VALUE.C_SLV_ADDR_RANGE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_SLV_ADDR_RANGE}] ${MODELPARAM_VALUE.C_SLV_ADDR_RANGE}
}

proc update_MODELPARAM_VALUE.C_SYNTHESIS_OPTION { MODELPARAM_VALUE.C_SYNTHESIS_OPTION PARAM_VALUE.C_SYNTHESIS_OPTION } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_SYNTHESIS_OPTION}] ${MODELPARAM_VALUE.C_SYNTHESIS_OPTION}
}

proc update_MODELPARAM_VALUE.simulation_g { MODELPARAM_VALUE.simulation_g PARAM_VALUE.simulation_g } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.simulation_g}] ${MODELPARAM_VALUE.simulation_g}
}

