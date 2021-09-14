Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E04240AB3D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Sep 2021 11:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbhINJ5h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Sep 2021 05:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbhINJ5h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Sep 2021 05:57:37 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDE34C061762;
        Tue, 14 Sep 2021 02:56:19 -0700 (PDT)
Received: from [192.168.1.101] (83.6.166.65.neoplus.adsl.tpnet.pl [83.6.166.65])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id A2F821F6A2;
        Tue, 14 Sep 2021 11:56:14 +0200 (CEST)
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: Add SM6350 pinctrl driver
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210828172315.55742-1-konrad.dybcio@somainline.org>
 <20210828172315.55742-2-konrad.dybcio@somainline.org>
 <6673399.dA2BYh7nEs@g550jk>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <9ef42060-7cf8-35e6-b7c8-9b51963d378a@somainline.org>
Date:   Tue, 14 Sep 2021 11:56:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6673399.dA2BYh7nEs@g550jk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 13.09.2021 19:23, Luca Weiss wrote:
> Hi Konrad,
>
> based on other reviews on the mailing list/IRC 

Sorry, I wasn't very active for a while:)


> I have some comments here

>
> On Samstag, 28. August 2021 19:23:14 CEST Konrad Dybcio wrote:
>> This adds pincontrol driver for tlmm block found in SM6350 SoC
>>
>> This patch is based on downstream copyleft code.
>>
>> Reviewed-by: AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@somainline.org> Signed-off-by: Konrad Dybcio
>> <konrad.dybcio@somainline.org>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
>> Changes since v2:
>> - Trim the forgotten-about comments
>> - Add Bjorn's r-b
>>
>>  drivers/pinctrl/qcom/Kconfig          |    9 +
>>  drivers/pinctrl/qcom/Makefile         |    1 +
>>  drivers/pinctrl/qcom/pinctrl-sm6350.c | 1593 +++++++++++++++++++++++++
>>  3 files changed, 1603 insertions(+)
>>  create mode 100644 drivers/pinctrl/qcom/pinctrl-sm6350.c
>>
> [SNIP]
>> +DECLARE_MSM_GPIO_PINS(128);
>> +DECLARE_MSM_GPIO_PINS(129);
>> +DECLARE_MSM_GPIO_PINS(130);
>> +DECLARE_MSM_GPIO_PINS(131);
>> +DECLARE_MSM_GPIO_PINS(132);
>> +DECLARE_MSM_GPIO_PINS(133);
>> +DECLARE_MSM_GPIO_PINS(134);
>> +DECLARE_MSM_GPIO_PINS(135);
>> +DECLARE_MSM_GPIO_PINS(136);
>> +DECLARE_MSM_GPIO_PINS(137);
>> +DECLARE_MSM_GPIO_PINS(138);
>> +DECLARE_MSM_GPIO_PINS(139);
>> +DECLARE_MSM_GPIO_PINS(140);
>> +DECLARE_MSM_GPIO_PINS(141);
>> +DECLARE_MSM_GPIO_PINS(142);
>> +DECLARE_MSM_GPIO_PINS(143);
>> +DECLARE_MSM_GPIO_PINS(144);
>> +DECLARE_MSM_GPIO_PINS(145);
>> +DECLARE_MSM_GPIO_PINS(146);
>> +DECLARE_MSM_GPIO_PINS(147);
>> +DECLARE_MSM_GPIO_PINS(148);
>> +DECLARE_MSM_GPIO_PINS(149);
>> +DECLARE_MSM_GPIO_PINS(150);
>> +DECLARE_MSM_GPIO_PINS(151);
>> +DECLARE_MSM_GPIO_PINS(152);
>> +DECLARE_MSM_GPIO_PINS(153);
>> +DECLARE_MSM_GPIO_PINS(154);
>> +DECLARE_MSM_GPIO_PINS(155);
>> +
>> +static const unsigned int sdc1_rclk_pins[] = { 156 };
>> +static const unsigned int sdc1_clk_pins[] = { 157 };
>> +static const unsigned int sdc1_cmd_pins[] = { 158 };
>> +static const unsigned int sdc1_data_pins[] = { 159 };
>> +static const unsigned int sdc2_clk_pins[] = { 160 };
>> +static const unsigned int sdc2_cmd_pins[] = { 161 };
>> +static const unsigned int sdc2_data_pins[] = { 162 };
>> +static const unsigned int ufs_reset_pins[] = { 163 };
> All these numbers don't match anymore after moving ufs_reset to 156
>
> (ref: https://lore.kernel.org/lkml/YNTYvKYDWFxUcb+Y@yoga/ )

Good catch, thanks!


>
>> +
>> +enum sm6350_functions {
>> +	msm_mux_adsp_ext,
>> +	msm_mux_agera_pll,
>> +	msm_mux_atest_char,
>> +	msm_mux_atest_char0,
>> +	msm_mux_atest_char1,
>> +	msm_mux_atest_char2,
>> +	msm_mux_atest_char3,
>> +	msm_mux_atest_tsens,
>> +	msm_mux_atest_tsens2,
>> +	msm_mux_atest_usb1,
>> +	msm_mux_atest_usb10,
>> +	msm_mux_atest_usb11,
>> +	msm_mux_atest_usb12,
>> +	msm_mux_atest_usb13,
>> +	msm_mux_atest_usb2,
>> +	msm_mux_atest_usb20,
>> +	msm_mux_atest_usb21,
>> +	msm_mux_atest_usb22,
>> +	msm_mux_atest_usb23,
> Bjorn mentioned to merge all the atest_usb* functions into a single one.

Will do.



>
>> +	msm_mux_audio_ref,
>> +	msm_mux_btfm_slimbus,
>> +	msm_mux_cam_mclk0,
>> +	msm_mux_cam_mclk1,
>> +	msm_mux_cam_mclk2,
>> +	msm_mux_cam_mclk3,
>> +	msm_mux_cam_mclk4,
>> +	msm_mux_cci_async,
>> +	msm_mux_cci_i2c,
>> +	msm_mux_cci_timer0,
>> +	msm_mux_cci_timer1,
>> +	msm_mux_cci_timer2,
>> +	msm_mux_cci_timer3,
>> +	msm_mux_cci_timer4,
>> +	msm_mux_cri_trng,
>> +	msm_mux_dbg_out,
>> +	msm_mux_ddr_bist,
>> +	msm_mux_ddr_pxi0,
>> +	msm_mux_ddr_pxi1,
>> +	msm_mux_ddr_pxi2,
>> +	msm_mux_ddr_pxi3,
>> +	msm_mux_dp_hot,
>> +	msm_mux_edp_lcd,
>> +	msm_mux_gcc_gp1,
>> +	msm_mux_gcc_gp2,
>> +	msm_mux_gcc_gp3,
>> +	msm_mux_gp_pdm0,
>> +	msm_mux_gp_pdm1,
>> +	msm_mux_gp_pdm2,
>> +	msm_mux_gpio,
>> +	msm_mux_gps_tx,
>> +	msm_mux_ibi_i3c,
>> +	msm_mux_jitter_bist,
>> +	msm_mux_ldo_en,
>> +	msm_mux_ldo_update,
>> +	msm_mux_lpass_ext,
>> +	msm_mux_m_voc,
>> +	msm_mux_mclk,
>> +	msm_mux_mdp_vsync,
>> +	msm_mux_mdp_vsync0,
>> +	msm_mux_mdp_vsync1,
>> +	msm_mux_mdp_vsync2,
>> +	msm_mux_mdp_vsync3,
>> +	msm_mux_mi2s_0,
>> +	msm_mux_mi2s_1,
>> +	msm_mux_mi2s_2,
>> +	msm_mux_mss_lte,
>> +	msm_mux_nav_gpio,
>> +	msm_mux_nav_pps,
>> +	msm_mux_pa_indicator,
>> +	msm_mux_pcie0_clk,
>> +	msm_mux_phase_flag0,
>> +	msm_mux_phase_flag1,
>> +	msm_mux_phase_flag10,
>> +	msm_mux_phase_flag11,
>> +	msm_mux_phase_flag12,
>> +	msm_mux_phase_flag13,
>> +	msm_mux_phase_flag14,
>> +	msm_mux_phase_flag15,
>> +	msm_mux_phase_flag16,
>> +	msm_mux_phase_flag17,
>> +	msm_mux_phase_flag18,
>> +	msm_mux_phase_flag19,
>> +	msm_mux_phase_flag2,
>> +	msm_mux_phase_flag20,
>> +	msm_mux_phase_flag21,
>> +	msm_mux_phase_flag22,
>> +	msm_mux_phase_flag23,
>> +	msm_mux_phase_flag24,
>> +	msm_mux_phase_flag25,
>> +	msm_mux_phase_flag26,
>> +	msm_mux_phase_flag27,
>> +	msm_mux_phase_flag28,
>> +	msm_mux_phase_flag29,
>> +	msm_mux_phase_flag3,
>> +	msm_mux_phase_flag30,
>> +	msm_mux_phase_flag31,
>> +	msm_mux_phase_flag4,
>> +	msm_mux_phase_flag5,
>> +	msm_mux_phase_flag6,
>> +	msm_mux_phase_flag7,
>> +	msm_mux_phase_flag8,
>> +	msm_mux_phase_flag9,
> .. and all the phase_flag* ones.

Sure


>
>> +	msm_mux_pll_bist,
>> +	msm_mux_pll_bypassnl,
>> +	msm_mux_pll_reset,
>> +	msm_mux_prng_rosc,
>> +	msm_mux_qdss_cti,
>> +	msm_mux_qdss_gpio,
>> +	msm_mux_qdss_gpio0,
>> +	msm_mux_qdss_gpio1,
>> +	msm_mux_qdss_gpio10,
>> +	msm_mux_qdss_gpio11,
>> +	msm_mux_qdss_gpio12,
>> +	msm_mux_qdss_gpio13,
>> +	msm_mux_qdss_gpio14,
>> +	msm_mux_qdss_gpio15,
>> +	msm_mux_qdss_gpio2,
>> +	msm_mux_qdss_gpio3,
>> +	msm_mux_qdss_gpio4,
>> +	msm_mux_qdss_gpio5,
>> +	msm_mux_qdss_gpio6,
>> +	msm_mux_qdss_gpio7,
>> +	msm_mux_qdss_gpio8,
>> +	msm_mux_qdss_gpio9,
>> +	msm_mux_qlink0_enable,
>> +	msm_mux_qlink0_request,
>> +	msm_mux_qlink0_wmss,
>> +	msm_mux_qlink1_enable,
>> +	msm_mux_qlink1_request,
>> +	msm_mux_qlink1_wmss,
>> +	msm_mux_qup00,
>> +	msm_mux_qup01,
>> +	msm_mux_qup02,
>> +	msm_mux_qup10,
>> +	msm_mux_qup11,
>> +	msm_mux_qup12,
>> +	msm_mux_qup13_f1,
>> +	msm_mux_qup13_f2,
>> +	msm_mux_qup14,
>> +	msm_mux_rffe0_clk,
>> +	msm_mux_rffe0_data,
>> +	msm_mux_rffe1_clk,
>> +	msm_mux_rffe1_data,
>> +	msm_mux_rffe2_clk,
>> +	msm_mux_rffe2_data,
>> +	msm_mux_rffe3_clk,
>> +	msm_mux_rffe3_data,
>> +	msm_mux_rffe4_clk,
>> +	msm_mux_rffe4_data,
>> +	msm_mux_sd_write,
>> +	msm_mux_sdc1_tb,
>> +	msm_mux_sdc2_tb,
>> +	msm_mux_sp_cmu,
>> +	msm_mux_tgu_ch0,
>> +	msm_mux_tgu_ch1,
>> +	msm_mux_tgu_ch2,
>> +	msm_mux_tgu_ch3,
>> +	msm_mux_tsense_pwm1,
>> +	msm_mux_tsense_pwm2,
>> +	msm_mux_uim1_clk,
>> +	msm_mux_uim1_data,
>> +	msm_mux_uim1_present,
>> +	msm_mux_uim1_reset,
> maybe even uim1_* into uim1?

Not sure about these ones though..


>
>> +	msm_mux_uim2_clk,
>> +	msm_mux_uim2_data,
>> +	msm_mux_uim2_present,
>> +	msm_mux_uim2_reset,
> .. and uim2?

Ditto


>> +	msm_mux_usb_phy,
>> +	msm_mux_vfr_1,
>> +	msm_mux_vsense_trigger,
>> +	msm_mux_wlan1_adc0,
>> +	msm_mux_wlan1_adc1,
>> +	msm_mux_wlan2_adc0,
>> +	msm_mux_wlan2_adc1,
>> +	msm_mux__,
>> +};
>> +
>>
> [SNIP]
>> +
>> +static const struct msm_pinctrl_soc_data sm6350_pinctrl = {
>> +	.pins = sm6350_pins,
>> +	.npins = ARRAY_SIZE(sm6350_pins),
>> +	.functions = sm6350_functions,
>> +	.nfunctions = ARRAY_SIZE(sm6350_functions),
>> +	.groups = sm6350_groups,
>> +	.ngroups = ARRAY_SIZE(sm6350_groups),
>> +	.ngpios = 157,
>> +	.wakeirq_map = sm6350_pdc_map,
>> +	.nwakeirq_map = ARRAY_SIZE(sm6350_pdc_map),
>> +	.wakeirq_dual_edge_errata = true,
>> +};
>> +
>> +static int sm6350_pinctrl_probe(struct platform_device *pdev)
>> +{
>> +	return msm_pinctrl_probe(pdev, &sm6350_pinctrl);
>> +}
>> +
>> +static const struct of_device_id sm6350_pinctrl_of_match[] = {
>> +	{ .compatible = "qcom,sm6350-tlmm", },
>> +	{ },
> No need for a trailing comma here ;)

Heh, true


>
>> +};
>> +
>> +static struct platform_driver sm6350_pinctrl_driver = {
>> +	.driver = {
>> +		.name = "sm6350-pinctrl",
>> +		.of_match_table = sm6350_pinctrl_of_match,
>> +	},
>> +	.probe = sm6350_pinctrl_probe,
>> +	.remove = msm_pinctrl_remove,
>> +};
>> +
>> +static int __init sm6350_pinctrl_init(void)
>> +{
>> +	return platform_driver_register(&sm6350_pinctrl_driver);
>> +}
>> +arch_initcall(sm6350_pinctrl_init);
>> +
>> +static void __exit sm6350_pinctrl_exit(void)
>> +{
>> +	platform_driver_unregister(&sm6350_pinctrl_driver);
>> +}
>> +module_exit(sm6350_pinctrl_exit);
>> +
>> +MODULE_DESCRIPTION("QTI sm6350 pinctrl driver");
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_DEVICE_TABLE(of, sm6350_pinctrl_of_match);
> Some/most(?) newer drivers also use the name tlmm instead of pinctrl in the 
> function names and in the .name of the driver.

I can do the same for consistency.


Konrad
