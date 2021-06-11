Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2603A3A84
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 05:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231410AbhFKDw6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 23:52:58 -0400
Received: from mail-oo1-f43.google.com ([209.85.161.43]:36662 "EHLO
        mail-oo1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231309AbhFKDw6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 23:52:58 -0400
Received: by mail-oo1-f43.google.com with SMTP id d27-20020a4a3c1b0000b029024983ef66dbso410952ooa.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 20:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qT8MmbssqwjjQy/dKsbd4ZG4G3VdYCwzB+a8OBRE14E=;
        b=ghUtbPQTxBqrpD7B2uYe0PnzoeYicmVcanTih/ataUoqWXctVJmYXKG1m8N0SeIHjX
         veZ74P/XX3DcjVprGpywqlDZjWITyinQ35ybhPjzIYu4wCLxooK1JNP1zfnXINeUybix
         t88I5QR9U+wo6iOfT/8tP5hQWY3jT6fFk5tXEc7d8LPQesQpt/v9e/ix+jdVN1+hELI/
         QrOpyV6e7oBX01byqvv6KSvk8Fps4cu3/IJbjlWhl8PryF9lEYnpAOBRcYXNLZka36qb
         ipNmRpwnExSX1NEP3UalmAvj/clYZs0llE5ymuVtb8MtLqhfGffZn0BOb4TqrTwVSZ8B
         TK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qT8MmbssqwjjQy/dKsbd4ZG4G3VdYCwzB+a8OBRE14E=;
        b=nyNkYc3Sa2DkuxW2pnsCnH/5lzgfFvZ3AvQyiA17v9a3XGVEDvuuXqOzU57pRAdXVy
         q2GBiI3jCrMrvnANPfZu7aESVp97YQ23Co+jUH7P1eg5vdJOr6Nd+kfPnBbujHXuPjW/
         PRxAeMi87iGuj0uIungNYl9RZ7SgIjLgiVSkYBaS7Cov+A+0Qa0wgE/wBUB46Ape4m9A
         wZ8UJe79GLMOnISLtMeU9cvrsiWjr4oMBT6AQbDF9sH/8j8saq1yCB/XbbzNQKjk7cCH
         0Cj3jytaDQ5Sa7cFJUkJfdmc8W5iftEUbbup2HSF0+IC10Hqd+eMpFBOaNUfYdjTZ4g9
         bpKg==
X-Gm-Message-State: AOAM533BYZWRQ5DT04mt5qR3woA/dZw7vhPK/QSmgPVkOSdkKSNCg4//
        NxUTvaKFNhBmELzzYiGsZac6dQ==
X-Google-Smtp-Source: ABdhPJySl/0xQ4SdDaKxtXic4a22b5TUXp7slntxsx3IgTEyWNgw7Lc9ZCtpf3ZpIxOpoBl9QvZPDA==
X-Received: by 2002:a4a:e9b1:: with SMTP id t17mr1369674ood.0.1623383391153;
        Thu, 10 Jun 2021 20:49:51 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l128sm970094oif.16.2021.06.10.20.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 20:49:50 -0700 (PDT)
Date:   Thu, 10 Jun 2021 22:49:48 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add MDM9607 pinctrl driver
Message-ID: <YMLdXFNBhkYF3goe@builder.lan>
References: <20210602080518.1589889-1-konrad.dybcio@somainline.org>
 <20210602080518.1589889-2-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602080518.1589889-2-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 02 Jun 03:05 CDT 2021, Konrad Dybcio wrote:

> Add a pinctrl driver to allow for managing SoC pins.
> 

This looks really good, just a few of small things below.

> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  drivers/pinctrl/qcom/Kconfig           |    8 +
>  drivers/pinctrl/qcom/Makefile          |    1 +
>  drivers/pinctrl/qcom/pinctrl-mdm9607.c | 1124 ++++++++++++++++++++++++
>  3 files changed, 1133 insertions(+)
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-mdm9607.c
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> index 6853a896c476..34a7b9322b9b 100644
> --- a/drivers/pinctrl/qcom/Kconfig
> +++ b/drivers/pinctrl/qcom/Kconfig
> @@ -88,6 +88,14 @@ config PINCTRL_MSM8960
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm TLMM block found in the Qualcomm 8960 platform.
>  
> +config PINCTRL_MDM9607
> +	tristate "Qualcomm 9607 pin controller driver"
> +	depends on GPIOLIB && OF
> +	depends on PINCTRL_MSM
> +	help
> +	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> +	  Qualcomm TLMM block found in the Qualcomm 9607 platform.
> +
>  config PINCTRL_MDM9615
>  	tristate "Qualcomm 9615 pin controller driver"
>  	depends on GPIOLIB && OF
> diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
> index d4301fbb7274..a60b075b3054 100644
> --- a/drivers/pinctrl/qcom/Makefile
> +++ b/drivers/pinctrl/qcom/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_PINCTRL_MSM8996)   += pinctrl-msm8996.o
>  obj-$(CONFIG_PINCTRL_MSM8998)   += pinctrl-msm8998.o
>  obj-$(CONFIG_PINCTRL_QCS404)	+= pinctrl-qcs404.o
>  obj-$(CONFIG_PINCTRL_QDF2XXX)	+= pinctrl-qdf2xxx.o
> +obj-$(CONFIG_PINCTRL_MDM9607)	+= pinctrl-mdm9607.o
>  obj-$(CONFIG_PINCTRL_MDM9615)	+= pinctrl-mdm9615.o
>  obj-$(CONFIG_PINCTRL_QCOM_SPMI_PMIC) += pinctrl-spmi-gpio.o
>  obj-$(CONFIG_PINCTRL_QCOM_SPMI_PMIC) += pinctrl-spmi-mpp.o
> diff --git a/drivers/pinctrl/qcom/pinctrl-mdm9607.c b/drivers/pinctrl/qcom/pinctrl-mdm9607.c
[..]
> +enum mdm9607_functions {
> +	msm_mux_blsp_spi3,

The order of these doesn't matter, so please sort them alphabetically.

> +	msm_mux_gpio,
> +	msm_mux_blsp_uart3,
> +	msm_mux_qdss_tracedata_a,
> +	msm_mux_bimc_dte1,
> +	msm_mux_blsp_i2c3,
> +	msm_mux_qdss_traceclk_a,
> +	msm_mux_bimc_dte0,
> +	msm_mux_qdss_cti_trig_in_a1,
> +	msm_mux_blsp_spi2,
> +	msm_mux_blsp_uart2,
> +	msm_mux_blsp_uim2,
> +	msm_mux_blsp_i2c2,
> +	msm_mux_qdss_tracectl_a,
> +	msm_mux_sensor_int2,
> +	msm_mux_blsp_spi5,
> +	msm_mux_blsp_uart5,
> +	msm_mux_ebi2_lcd,
> +	msm_mux_m_voc,
> +	msm_mux_sensor_int3,
> +	msm_mux_sensor_en,
> +	msm_mux_blsp_i2c5,
> +	msm_mux_ebi2_a,
> +	msm_mux_qdss_tracedata_b,
> +	msm_mux_sensor_rst,
> +	msm_mux_blsp2_spi,
> +	msm_mux_blsp_spi1,
> +	msm_mux_blsp_uart1,
> +	msm_mux_blsp_uim1,
> +	msm_mux_blsp3_spi,
> +	msm_mux_gcc_gp2_clk_b,
> +	msm_mux_gcc_gp3_clk_b,
> +	msm_mux_blsp_i2c1,
> +	msm_mux_gcc_gp1_clk_b,
> +	msm_mux_blsp_spi4,
> +	msm_mux_blsp_uart4,
> +	msm_mux_rcm_marker1,
> +	msm_mux_blsp_i2c4,
> +	msm_mux_qdss_cti_trig_out_a1,
> +	msm_mux_rcm_marker2,
> +	msm_mux_qdss_cti_trig_out_a0,
> +	msm_mux_blsp_spi6,
> +	msm_mux_blsp_uart6,
> +	msm_mux_pri_mi2s_ws_a,
> +	msm_mux_ebi2_lcd_te_b,
> +	msm_mux_blsp1_spi,
> +	msm_mux_backlight_en_b,
> +	msm_mux_pri_mi2s_data0_a,
> +	msm_mux_pri_mi2s_data1_a,
> +	msm_mux_blsp_i2c6,
> +	msm_mux_ebi2_a_d_8_b,
> +	msm_mux_pri_mi2s_sck_a,
> +	msm_mux_ebi2_lcd_cs_n_b,
> +	msm_mux_touch_rst,
> +	msm_mux_pri_mi2s_mclk_a,
> +	msm_mux_pwr_nav_enabled_a,
> +	msm_mux_ts_int,
> +	msm_mux_sd_write,
> +	msm_mux_pwr_crypto_enabled_a,
> +	msm_mux_codec_rst,
> +	msm_mux_adsp_ext,
> +	msm_mux_atest_combodac_to_gpio_native,
> +	msm_mux_uim2_data,
> +	msm_mux_gmac_mdio,
> +	msm_mux_gcc_gp1_clk_a,
> +	msm_mux_uim2_clk,
> +	msm_mux_gcc_gp2_clk_a,
> +	msm_mux_eth_irq,
> +	msm_mux_uim2_reset,
> +	msm_mux_gcc_gp3_clk_a,
> +	msm_mux_eth_rst,
> +	msm_mux_uim2_present,
> +	msm_mux_prng_rosc,
> +	msm_mux_uim1_data,
> +	msm_mux_uim1_clk,
> +	msm_mux_uim1_reset,
> +	msm_mux_uim1_present,
> +	msm_mux_gcc_plltest,
> +	msm_mux_uim_batt,
> +	msm_mux_coex_uart,
> +	msm_mux_codec_int,
> +	msm_mux_qdss_cti_trig_in_a0,
> +	msm_mux_atest_bbrx1,
> +	msm_mux_cri_trng0,
> +	msm_mux_atest_bbrx0,
> +	msm_mux_cri_trng,
> +	msm_mux_qdss_cti_trig_in_b0,
> +	msm_mux_atest_gpsadc_dtest0_native,
> +	msm_mux_qdss_cti_trig_out_b0,
> +	msm_mux_qdss_tracectl_b,
> +	msm_mux_qdss_traceclk_b,
> +	msm_mux_pa_indicator,
> +	msm_mux_modem_tsync,
> +	msm_mux_nav_tsync_out_a,
> +	msm_mux_nav_ptp_pps_in_a,
> +	msm_mux_ptp_pps_out_a,
> +	msm_mux_gsm0_tx,
> +	msm_mux_qdss_cti_trig_in_b1,
> +	msm_mux_cri_trng1,
> +	msm_mux_qdss_cti_trig_out_b1,
> +	msm_mux_ssbi1,
> +	msm_mux_atest_gpsadc_dtest1_native,
> +	msm_mux_ssbi2,
> +	msm_mux_atest_char3,
> +	msm_mux_atest_char2,
> +	msm_mux_atest_char1,
> +	msm_mux_atest_char0,
> +	msm_mux_atest_char,
> +	msm_mux_ebi0_wrcdc,
> +	msm_mux_ldo_update,
> +	msm_mux_gcc_tlmm,
> +	msm_mux_ldo_en,
> +	msm_mux_dbg_out,
> +	msm_mux_atest_tsens,
> +	msm_mux_lcd_rst,
> +	msm_mux_wlan_en1,
> +	msm_mux_nav_tsync_out_b,
> +	msm_mux_nav_ptp_pps_in_b,
> +	msm_mux_ptp_pps_out_b,
> +	msm_mux_pbs0,
> +	msm_mux_sec_mi2s,
> +	msm_mux_pwr_modem_enabled_a,
> +	msm_mux_pbs1,
> +	msm_mux_pwr_modem_enabled_b,
> +	msm_mux_pbs2,
> +	msm_mux_pwr_nav_enabled_b,
> +	msm_mux_pwr_crypto_enabled_b,
> +	msm_mux_NA,
> +};
[..]
> +static const struct msm_pingroup mdm9607_groups[] = {
> +	PINGROUP(0, blsp_uart3, blsp_spi3, NA, NA, NA, NA, NA,
> +		 qdss_tracedata_a, NA),

After doing a few platforms I realized that replacing NA with _ makes
this easier to read.

And please avoid breaking these lines.

> +	PINGROUP(1, blsp_uart3, blsp_spi3, NA, NA, NA, NA, NA,
> +		 qdss_tracedata_a, bimc_dte1),
[..]
> +	PINGROUP(79, sec_mi2s, NA, pwr_crypto_enabled_b, NA, qdss_tracedata_a,
> +		 NA, NA, NA, NA),
> +	SDC_PINGROUP(sdc1_clk, 0x10a000, 13, 6),
> +	SDC_PINGROUP(sdc1_cmd, 0x10a000, 11, 3),
> +	SDC_PINGROUP(sdc1_data, 0x10a000, 9, 0),
> +	SDC_PINGROUP(sdc2_clk, 0x109000, 14, 6),
> +	SDC_PINGROUP(sdc2_cmd, 0x109000, 11, 3),
> +	SDC_PINGROUP(sdc2_data, 0x109000, 9, 0),
> +	SDC_PINGROUP(qdsd_clk, 0x19c000, 3, 0),
> +	SDC_PINGROUP(qdsd_cmd, 0x19c000, 8, 5),
> +	SDC_PINGROUP(qdsd_data0, 0x19c000, 13, 10),
> +	SDC_PINGROUP(qdsd_data1, 0x19c000, 18, 15),
> +	SDC_PINGROUP(qdsd_data2, 0x19c000, 23, 20),
> +	SDC_PINGROUP(qdsd_data3, 0x19c000, 28, 25),
> +};
> +
> +#define NUM_GPIO_PINGROUPS	92

Only 80 of these makes sense to poke through the gpio framework, so this
should be 80...

> +
> +static const struct msm_pinctrl_soc_data mdm9607_pinctrl = {
> +	.pins = mdm9607_pins,
> +	.npins = ARRAY_SIZE(mdm9607_pins),
> +	.functions = mdm9607_functions,
> +	.nfunctions = ARRAY_SIZE(mdm9607_functions),
> +	.groups = mdm9607_groups,
> +	.ngroups = ARRAY_SIZE(mdm9607_groups),
> +	.ngpios = NUM_GPIO_PINGROUPS,
> +};
> +
> +static int mdm9607_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return msm_pinctrl_probe(pdev, &mdm9607_pinctrl);
> +}
> +
> +static const struct of_device_id mdm9607_pinctrl_of_match[] = {
> +	{ .compatible = "qcom,mdm9607-pinctrl", },

qcom,mdm9607-tlmm

> +	{ },

No need to this comma.

Thanks,
Bjorn
