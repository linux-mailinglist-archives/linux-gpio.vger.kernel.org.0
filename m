Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC0C413D1C
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 23:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235673AbhIUV7A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 17:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232304AbhIUV67 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Sep 2021 17:58:59 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27DF3C061574
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 14:57:30 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id h11-20020a4aa74b000000b002a933d156cbso182282oom.4
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 14:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KSlejZYsH7PFQRdlXX+F2TBbNDXFetiOccD1jMJ041k=;
        b=DxytTk3U17SnqCP5B4W+EXOKMt7lV8axv1p8rqwKO/zvjRtkiQqugDEjYuqDV9/gX4
         /bS8Vrg9hYp/1Gp60at3ddgEW7ncCYEcoZIVhELKCDhRxEPFdH+JV2JNo3mjiFnPWkKG
         7fCY2I5RMIGyWQ7pgqxBlPZDT+X7mEE2rb8tK025AXehH3r9a8Ci8hIspeHyao8Vq+5v
         +NxoW1faCmOsHCRZVIUdmyJ8aOAKLanB2pNUSb4VDpK3vsl984ia3KFEo8bLMTg/66yh
         A1+hZh+HaBXVBjn/Gqor8PudNo+alwjUZ+FInuCMkwcnbCB9MQJNLBwQDhhlCNh+DW6r
         1mqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KSlejZYsH7PFQRdlXX+F2TBbNDXFetiOccD1jMJ041k=;
        b=Zc3UpsRZTyMC57InpT6LqOtSzwFcrFnuI+9mBw8BD5ipSc2gs7CN3o1E90INPtBOhl
         jwAm9ar6JUeCsSOLEhTNKyp+4hKOq0TyQ10b6LcaBZMsRA7L7c7zWrVFKUC+B81clAQK
         kEqgX+5w1HV1oMs+OgJQika0DX75TpTKI9JChMSgsB/qHTnSLB5GNVVUieJAZzYt6UrP
         DY4fSvFsvsgoGAcQ/UHyxQaM+q0re3KlakQEdxII/c4Nzw8RDehGFBpo1LP/ecvH/ltT
         k4xYXpkX/f63fCin3NURuGUpkyePchXCWMVMAiJh2C3LjpxDw6yKtCUmVWPGy4d8PZbt
         3h2g==
X-Gm-Message-State: AOAM533gnyWg0UYDLtFlmw4w9B6vfhEGNvhvaID4CF+kcfyAY/hRCcsl
        HRVe2rYK3wk695I4JjmgUI2oetr0uAj6gw==
X-Google-Smtp-Source: ABdhPJx3p5oCstd2JDxdD8Ai9AhxWpLdnb25ebeQEAnrn+tuZUPzLiKSDQ40WyYz+dGywxDfnCdZiA==
X-Received: by 2002:a4a:d883:: with SMTP id b3mr10784771oov.82.1632261449418;
        Tue, 21 Sep 2021 14:57:29 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 186sm70438ood.39.2021.09.21.14.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 14:57:28 -0700 (PDT)
Date:   Tue, 21 Sep 2021 16:57:27 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add QCM2290 pinctrl driver
Message-ID: <YUpVR4Ak6scwkgX4@builder.lan>
References: <20210914074542.12957-1-shawn.guo@linaro.org>
 <20210914074542.12957-3-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914074542.12957-3-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 14 Sep 02:45 CDT 2021, Shawn Guo wrote:
> diff --git a/drivers/pinctrl/qcom/pinctrl-qcm2290.c b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
[..]
> +enum qcm2290_functions {
> +	msm_mux_qup0,

The order of these aren't significant, so please sort them
alphabetically.

> +	msm_mux_gpio,
> +	msm_mux_ddr_bist,
> +	msm_mux_phase_flag0,
[..]
> +static const struct msm_function qcm2290_functions[] = {
> +	FUNCTION(qup0),

Ditto.

> +	FUNCTION(gpio),
> +	FUNCTION(ddr_bist),
> +	FUNCTION(phase_flag0),
> +	FUNCTION(qdss_gpio8),
> +	FUNCTION(atest_tsens),
> +	FUNCTION(mpm_pwr),
[..]
> +};
> +
> +/* Every pin is maintained as a single group, and missing or non-existing pin
> + * would be maintained as dummy group to synchronize pin group index with
> + * pin descriptor registered with pinctrl core.
> + * Clients would not be able to request these dummy pin groups.
> + */
> +static const struct msm_pingroup qcm2290_groups[] = {
> +	[0] = PINGROUP(0, qup0, m_voc, ddr_bist, _, phase_flag0, qdss_gpio8, atest_tsens, _, _),

Please group all phase_flagN into a single phase_flag function.

Same with qdss_gpioN, atest__tsensN, atest_usbN, atest_charN and
dac_calibN.

> +	[1] = PINGROUP(1, qup0, mpm_pwr, ddr_bist, _, phase_flag1, qdss_gpio9, atest_tsens2, _, _),
> +	[2] = PINGROUP(2, qup0, ddr_bist, _, phase_flag2, qdss_gpio10, dac_calib0, atest_usb10, _, _),
> +	[3] = PINGROUP(3, qup0, ddr_bist, _, phase_flag3, qdss_gpio11, dac_calib1, atest_usb11, _, _),
> +	[4] = PINGROUP(4, qup1, CRI_TRNG0, _, phase_flag4, dac_calib2, atest_usb12, _, _, _),
> +	[5] = PINGROUP(5, qup1, CRI_TRNG1, _, phase_flag5, dac_calib3, atest_usb13, _, _, _),
> +	[6] = PINGROUP(6, qup2, _, phase_flag6, dac_calib4, atest_usb1, _, _, _, _),
> +	[7] = PINGROUP(7, qup2, _, _, _, _, _, _, _, _), [8] = PINGROUP(8, qup3, pbs_out, PLL_BIST, _, qdss_gpio, _, tsense_pwm, _, _),
> +	[9] = PINGROUP(9, qup3, pbs_out, PLL_BIST, _, qdss_gpio, _, _, _, _),
> +	[10] = PINGROUP(10, qup3, AGERA_PLL, _, pbs0, qdss_gpio0, _, _, _, _),
> +	[11] = PINGROUP(11, qup3, AGERA_PLL, _, pbs1, qdss_gpio1, _, _, _, _),
> +	[12] = PINGROUP(12, qup4, tgu_ch0, _, _, _, _, _, _, _),
> +	[13] = PINGROUP(13, qup4, tgu_ch1, _, _, _, _, _, _, _),
> +	[14] = PINGROUP(14, qup5, tgu_ch2, _, phase_flag7, qdss_gpio4, dac_calib5, _, _, _),
> +	[15] = PINGROUP(15, qup5, tgu_ch3, _, phase_flag8, qdss_gpio5, dac_calib6, _, _, _),
> +	[16] = PINGROUP(16, qup5, _, phase_flag9, qdss_gpio6, dac_calib7, _, _, _, _),
> +	[17] = PINGROUP(17, qup5, _, phase_flag10, qdss_gpio7, dac_calib8, _, _, _, _),
> +	[18] = PINGROUP(18, SDC2_TB, CRI_TRNG, pbs2, qdss_gpio2, _, pwm_0, _, _, _),
> +	[19] = PINGROUP(19, SDC1_TB, pbs3, qdss_gpio3, _, _, _, _, _, _),
> +	[20] = PINGROUP(20, cam_mclk, pbs4, qdss_gpio4, _, _, _, _, _, _),
> +	[21] = PINGROUP(21, cam_mclk, adsp_ext, pbs5, qdss_gpio5, _, _, _, _, _),
> +	[22] = PINGROUP(22, cci_i2c, prng_rosc, _, pbs6, phase_flag11, qdss_gpio6, dac_calib9, atest_usb20, _),
> +	[23] = PINGROUP(23, cci_i2c, prng_rosc, _, pbs7, phase_flag12, qdss_gpio7, dac_calib10, atest_usb21, _),
> +	[24] = PINGROUP(24, CCI_TIMER1, GCC_GP1, _, pbs8, phase_flag13, qdss_gpio8, dac_calib11, atest_usb22, _),
> +	[25] = PINGROUP(25, cci_async, CCI_TIMER0, _, pbs9, phase_flag14, qdss_gpio9, dac_calib12, atest_usb23, _),
> +	[26] = PINGROUP(26, _, pbs10, phase_flag15, qdss_gpio10, dac_calib13, atest_usb2, vsense_trigger, _, _),
> +	[27] = PINGROUP(27, cam_mclk, qdss_cti, _, _, _, _, _, _, _),
> +	[28] = PINGROUP(28, cam_mclk, CCI_TIMER2, qdss_cti, _, pwm_1, _, _, _, _),
> +	[29] = PINGROUP(29, cci_i2c, _, phase_flag16, dac_calib14, atest_char, _, _, _, _),
> +	[30] = PINGROUP(30, cci_i2c, _, phase_flag17, dac_calib15, atest_char0, _, _, _, _),
> +	[31] = PINGROUP(31, GP_PDM0, _, phase_flag18, dac_calib16, atest_char1, _, _, _, _),
> +	[32] = PINGROUP(32, CCI_TIMER3, GP_PDM1, _, phase_flag19, dac_calib17, atest_char2, _, _, _),
> +	[33] = PINGROUP(33, GP_PDM2, _, phase_flag20, dac_calib18, atest_char3, _, _, _, _),
> +	[34] = PINGROUP(34, _, _, _, _, _, _, _, _, _),
> +	[35] = PINGROUP(35, _, phase_flag21, _, _, _, _, _, _, _),
> +	[36] = PINGROUP(36, _, phase_flag22, _, _, _, _, _, _, _),
> +	[37] = PINGROUP(37, _, _, char_exec, _, _, _, _, _, _),
> +	[38] = PINGROUP(38, _, _, _, char_exec, _, _, _, _, _),
> +	[39] = PINGROUP(39, _, _, _, _, _, _, _, _, _),
> +	[40] = PINGROUP(40, _, _, _, _, _, _, _, _, _),
> +	[41] = PINGROUP(41, _, _, _, _, _, _, _, _, _),
> +	[42] = PINGROUP(42, _, NAV_GPIO, _, _, _, _, _, _, _),
> +	[43] = PINGROUP(43, _, _, phase_flag23, _, _, _, _, _, _),
> +	[44] = PINGROUP(44, _, _, phase_flag24, _, _, _, _, _, _),
> +	[45] = PINGROUP(45, _, _, phase_flag25, _, _, _, _, _, _),
> +	[46] = PINGROUP(46, _, _, _, _, _, _, _, _, _),
> +	[47] = PINGROUP(47, _, NAV_GPIO, pbs14, qdss_gpio14, _, _, _, _, _),
> +	[48] = PINGROUP(48, _, vfr_1, _, pbs15, qdss_gpio15, _, _, _, _),
> +	[49] = PINGROUP(49, _, PA_INDICATOR, _, _, _, _, _, _, _),
> +	[50] = PINGROUP(50, _, _, _, _, _, _, _, _, _),
> +	[51] = PINGROUP(51, _, _, _, pwm_2, _, _, _, _, _),
> +	[52] = PINGROUP(52, _, NAV_GPIO, pbs_out, _, _, _, _, _, _),
> +	[53] = PINGROUP(53, _, gsm1_tx, _, _, _, _, _, _, _),
> +	[54] = PINGROUP(54, _, _, _, _, _, _, _, _, _),
> +	[55] = PINGROUP(55, _, _, _, _, _, _, _, _, _),
> +	[56] = PINGROUP(56, _, _, _, _, _, _, _, _, _),
> +	[57] = PINGROUP(57, _, _, _, _, _, _, _, _, _),
> +	[58] = PINGROUP(58, _, _, _, _, _, _, _, _, _),
> +	[59] = PINGROUP(59, _, SSBI_WTR1, _, _, _, _, _, _, _),
> +	[60] = PINGROUP(60, _, SSBI_WTR1, _, _, _, _, _, _, _),
> +	[61] = PINGROUP(61, _, _, _, _, _, _, _, _, _),
> +	[62] = PINGROUP(62, _, pll_bypassnl, _, _, _, _, _, _, _),
> +	[63] = PINGROUP(63, pll_reset, _, phase_flag26, ddr_pxi0, _, _, _, _, _),
> +	[64] = PINGROUP(64, gsm0_tx, _, phase_flag27, ddr_pxi0, _, _, _, _, _),
> +	[65] = PINGROUP(65, _, _, _, _, _, _, _, _, _),
> +	[66] = PINGROUP(66, _, _, _, _, _, _, _, _, _),
> +	[67] = PINGROUP(67, _, _, _, _, _, _, _, _, _),
> +	[68] = PINGROUP(68, _, _, _, _, _, _, _, _, _),
> +	[69] = PINGROUP(69, qup1, GCC_GP2, qdss_gpio12, ddr_pxi1, _, _, _, _, _),
> +	[70] = PINGROUP(70, qup1, GCC_GP3, qdss_gpio13, ddr_pxi1, _, _, _, _, _),
> +	[71] = PINGROUP(71, qup2, dbg_out, _, _, _, _, _, _, _),
> +	[72] = PINGROUP(72, uim2_data, qdss_cti, _, pwm_3, _, _, _, _, _),
> +	[73] = PINGROUP(73, uim2_clk, _, qdss_cti, _, _, _, _, _, _),
> +	[74] = PINGROUP(74, uim2_reset, _, _, pwm_4, _, _, _, _, _),
> +	[75] = PINGROUP(75, uim2_present, _, _, pwm_5, _, _, _, _, _),
> +	[76] = PINGROUP(76, uim1_data, _, _, _, _, _, _, _, _),
> +	[77] = PINGROUP(77, uim1_clk, _, _, _, _, _, _, _, _),
> +	[78] = PINGROUP(78, uim1_reset, _, _, _, _, _, _, _, _),
> +	[79] = PINGROUP(79, uim1_present, _, _, _, _, _, _, _, _),
> +	[80] = PINGROUP(80, qup2, dac_calib19, _, _, _, _, _, _, _),
> +	[81] = PINGROUP(81, mdp_vsync_out_0, mdp_vsync_out_1, mdp_vsync, dac_calib20, _, _, _, _, _),
> +	[82] = PINGROUP(82, qup0, dac_calib21, _, pwm_6, _, _, _, _, _),
> +	[83] = PINGROUP(83, _, _, _, _, _, _, _, _, _),
> +	[84] = PINGROUP(84, _, _, _, _, _, _, _, _, _),
> +	[85] = PINGROUP(85, _, _, _, _, _, _, _, _, _),
> +	[86] = PINGROUP(86, qup0, GCC_GP1, atest_bbrx1, _, _, _, _, _, _),
> +	[87] = PINGROUP(87, pbs11, qdss_gpio11, _, _, _, _, _, _, _),
> +	[88] = PINGROUP(88, _, _, _, _, _, _, _, _, _),
> +	[89] = PINGROUP(89, usb_phy, atest_bbrx0, _, pwm_7, _, _, _, _, _),
> +	[90] = PINGROUP(90, mss_lte, pbs12, qdss_gpio12, _, _, _, _, _, _),
> +	[91] = PINGROUP(91, mss_lte, pbs13, qdss_gpio13, _, _, _, _, _, _),
> +	[92] = PINGROUP(92, _, _, _, _, _, _, _, _, _),
> +	[93] = PINGROUP(93, _, _, _, _, _, _, _, _, _),
> +	[94] = PINGROUP(94, _, qdss_gpio14, wlan1_adc0, _, _, _, _, _, _),
> +	[95] = PINGROUP(95, NAV_GPIO, GP_PDM0, qdss_gpio15, wlan1_adc1, _, _, _, _, _),
> +	[96] = PINGROUP(96, qup4, NAV_GPIO, mdp_vsync, GP_PDM1, sd_write, JITTER_BIST, qdss_cti, qdss_cti, _),
> +	[97] = PINGROUP(97, qup4, NAV_GPIO, mdp_vsync, GP_PDM2, JITTER_BIST, qdss_cti, qdss_cti, _, _),
> +	[98] = PINGROUP(98, _, _, _, _, _, _, _, _, _),
> +	[99] = PINGROUP(99, _, _, _, _, _, _, _, _, _),
> +	[100] = PINGROUP(100, atest_gpsadc_dtest0_native, _, _, _, _, _, _, _, _),
> +	[101] = PINGROUP(101, atest_gpsadc_dtest1_native, _, _, _, _, _, _, _, _),
> +	[102] = PINGROUP(102, _, phase_flag28, dac_calib22, ddr_pxi2, _, _, _, _, _),
> +	[103] = PINGROUP(103, _, phase_flag29, dac_calib23, ddr_pxi2, _, _, _, _, _),
> +	[104] = PINGROUP(104, _, phase_flag30, qdss_gpio1, dac_calib24, ddr_pxi3, _, pwm_8, _, _),
> +	[105] = PINGROUP(105, _, phase_flag31, qdss_gpio, dac_calib25, ddr_pxi3, _, _, _, _),
> +	[106] = PINGROUP(106, NAV_GPIO, GCC_GP3, qdss_gpio, _, _, _, _, _, _),
> +	[107] = PINGROUP(107, NAV_GPIO, GCC_GP2, qdss_gpio0, _, _, _, _, _, _),
> +	[108] = PINGROUP(108, NAV_GPIO, _, _, _, _, _, _, _, _),
> +	[109] = PINGROUP(109, _, qdss_gpio2, _, _, _, _, _, _, _),
> +	[110] = PINGROUP(110, _, qdss_gpio3, _, _, _, _, _, _, _),
> +	[111] = PINGROUP(111, _, _, _, _, _, _, _, _, _),
> +	[112] = PINGROUP(112, _, _, _, _, _, _, _, _, _),
> +	[113] = PINGROUP(113, _, _, _, _, _, _, _, _, _),
> +	[114] = PINGROUP(114, _, _, _, _, _, _, _, _, _),
> +	[115] = PINGROUP(115, _, pwm_9, _, _, _, _, _, _, _),
> +	[116] = PINGROUP(116, _, _, _, _, _, _, _, _, _),
> +	[117] = PINGROUP(117, _, _, _, _, _, _, _, _, _),
> +	[118] = PINGROUP(118, _, _, _, _, _, _, _, _, _),
> +	[119] = PINGROUP(119, _, _, _, _, _, _, _, _, _),
> +	[120] = PINGROUP(120, _, _, _, _, _, _, _, _, _),
> +	[121] = PINGROUP(121, _, _, _, _, _, _, _, _, _),
> +	[122] = PINGROUP(122, _, _, _, _, _, _, _, _, _),
> +	[123] = PINGROUP(123, _, _, _, _, _, _, _, _, _),
> +	[124] = PINGROUP(124, _, _, _, _, _, _, _, _, _),
> +	[125] = PINGROUP(125, _, _, _, _, _, _, _, _, _),
> +	[126] = PINGROUP(126, _, _, _, _, _, _, _, _, _),
> +	[127] = SDC_QDSD_PINGROUP(sdc1_rclk, 0x84004, 0, 0),
> +	[128] = SDC_QDSD_PINGROUP(sdc1_clk, 0x84000, 13, 6),
> +	[129] = SDC_QDSD_PINGROUP(sdc1_cmd, 0x84000, 11, 3),
> +	[130] = SDC_QDSD_PINGROUP(sdc1_data, 0x84000, 9, 0),
> +	[131] = SDC_QDSD_PINGROUP(sdc2_clk, 0x86000, 14, 6),
> +	[132] = SDC_QDSD_PINGROUP(sdc2_cmd, 0x86000, 11, 3),
> +	[133] = SDC_QDSD_PINGROUP(sdc2_data, 0x86000, 9, 0),
> +};
> +
> +static const struct msm_pinctrl_soc_data qcm2290_pinctrl = {
> +	.pins = qcm2290_pins,
> +	.npins = ARRAY_SIZE(qcm2290_pins),
> +	.functions = qcm2290_functions,
> +	.nfunctions = ARRAY_SIZE(qcm2290_functions),
> +	.groups = qcm2290_groups,
> +	.ngroups = ARRAY_SIZE(qcm2290_groups),
> +	.ngpios = 127,
> +};
> +
> +static int qcm2290_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return msm_pinctrl_probe(pdev, &qcm2290_pinctrl);
> +}
> +
> +static const struct of_device_id qcm2290_pinctrl_of_match[] = {
> +	{ .compatible = "qcom,qcm2290-pinctrl", },

Please make this qcom,qcm2290-tlmm.

Thanks,
Bjorn

> +	{ },
> +};
> +
> +static struct platform_driver qcm2290_pinctrl_driver = {
> +	.driver = {
> +		.name = "qcm2290-pinctrl",
> +		.of_match_table = qcm2290_pinctrl_of_match,
> +	},
> +	.probe = qcm2290_pinctrl_probe,
> +	.remove = msm_pinctrl_remove,
> +};
> +
> +static int __init qcm2290_pinctrl_init(void)
> +{
> +	return platform_driver_register(&qcm2290_pinctrl_driver);
> +}
> +arch_initcall(qcm2290_pinctrl_init);
> +
> +static void __exit qcm2290_pinctrl_exit(void)
> +{
> +	platform_driver_unregister(&qcm2290_pinctrl_driver);
> +}
> +module_exit(qcm2290_pinctrl_exit);
> +
> +MODULE_DESCRIPTION("QTI QCM2290 pinctrl driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_DEVICE_TABLE(of, qcm2290_pinctrl_of_match);
> -- 
> 2.17.1
> 
