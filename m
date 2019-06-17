Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B24947915
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 06:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725788AbfFQEWL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 00:22:11 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46629 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfFQEWL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 00:22:11 -0400
Received: by mail-pf1-f195.google.com with SMTP id 81so4906229pfy.13
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jun 2019 21:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UTgKORxYG5bQtMDMiPkqviSD05JGi9gDjq8N3xnxamw=;
        b=qQUI3+K0gHIw7nz+guUpHBX9fMs+hsaA0FjfBxgSVNPJSEry8yCkqKKWME9mdZHhht
         TWmuzycwiJzXlqR7MojMhFY8kvCQ4fvZG3OKBlU8zFbCQ54ZUJHr0xPmQjMHG0GSZWgD
         Q+mWlTqs2923Lm00ztv+IfclZsvF2eC1tfX9Sft9bURSFWnv6IzWj+wJsLaYjaBg9pEl
         Th3fGIZ/Q5BKd4bmvOKNBbT2hGhC9zCc5A5bCex+Oo5m+PehYOCdRHPE2HIhPGlpwhz7
         GVpzx9PJcJ8+OWfvQgLyx2S4396EJwR9U0J0aRmkmQykhbfwbqHL1Cd08l/5Us+MiOWH
         m+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UTgKORxYG5bQtMDMiPkqviSD05JGi9gDjq8N3xnxamw=;
        b=cx0/BVBddq6WimUHd5wRq/Cl4SkgoN2J0D0FAT5xtzMBgzuDJXskFLV1v9f9L+1t3y
         V7rIw2tZXXcMdOhrgcfb2i4Ua/8F+YotHAW4x+AAWOREJ8fsAD0AuOWHaJWkX74hecU8
         UVTYBPlSBRNM03K6p1wCfnXhJqLkjAiiPuf26pb8GtJYYldjmB33rq+Amt0H9BrPT+nY
         3ciGljwtPqhBHUfv+QbFSymEU8i49f+X1xKJLgZtYK+WKU13v/Cs6y9pWIqzAKhSwjb9
         xnPblpCI30yonth5iXaBbJpVL/+yYnZrk8STBxvow2Try+m8/zi7JjHvgPZLaX04xkke
         oKQA==
X-Gm-Message-State: APjAAAVHQnRTbViVPxJphXzUCbyX+k4PXmPfPttPA4krQLA9phwt05fN
        MHygBAuX88xRSdRIU1QcmodCoZ8x0rk=
X-Google-Smtp-Source: APXvYqzrJdbUKh/3Wwj8kNObe7HfSNQKw5id+/SB2/39vE6OVkQZGyv98n8L5CFv94OTiALpYdhVXg==
X-Received: by 2002:a63:a36f:: with SMTP id v47mr44586608pgn.117.1560745007995;
        Sun, 16 Jun 2019 21:16:47 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m31sm20040590pjb.6.2019.06.16.21.16.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 21:16:47 -0700 (PDT)
Date:   Sun, 16 Jun 2019 21:17:36 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        "Isaac J . Manjarres" <isaacm@codeaurora.org>
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add SM8150 pinctrl driver
Message-ID: <20190617041736.GD750@tuxbook-pro>
References: <20190614053032.24208-1-vkoul@kernel.org>
 <20190614053032.24208-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614053032.24208-2-vkoul@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 13 Jun 22:30 PDT 2019, Vinod Koul wrote:

> From: Prasad Sodagudi <psodagud@codeaurora.org>
> 
> Add initial pinctrl driver to support pin configuration with
> pinctrl framework for SM8150
> 
> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>

I presume you did stuff to make it fit with my upstream tiling, mention
that here.

[..]
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8150.c b/drivers/pinctrl/qcom/pinctrl-sm8150.c
[..]
> +static const struct pinctrl_pin_desc sm8150_pins[] = {
[..]
> +	PINCTRL_PIN(178, "UFS_RESET"),

Please follow
https://lore.kernel.org/linux-arm-msm/20190606010249.3538-2-bjorn.andersson@linaro.org/
for ufs_reset.

> +};
[..]
> +enum sm8150_functions {
> +	msm_mux_phase_flag8,

Please sort these alphabetically and please squash all the phase_flag*
into msm_mux_phase_flag.

> +	msm_mux_phase_flag7,
> +	msm_mux_emac_pps,
> +	msm_mux_qup12,
> +	msm_mux_qup16,
> +	msm_mux_tsif1_clk,

Please squash all tsif1 into msm_mux_tsif1.

> +	msm_mux_qup8,
> +	msm_mux_qspi_cs,
> +	msm_mux_tgu_ch3,
> +	msm_mux_tsif1_en,
> +	msm_mux_qspi0,
> +	msm_mux_mdp_vsync0,
> +	msm_mux_mdp_vsync1,
> +	msm_mux_mdp_vsync2,
> +	msm_mux_mdp_vsync3,
> +	msm_mux_tgu_ch0,
> +	msm_mux_tsif1_data,
> +	msm_mux_qspi1,
> +	msm_mux_sdc4_cmd,

Squash sdc4_cmd, sdc4_clk and sdc4{0,1,2,3} into msm_mux_sdc4.

> +	msm_mux_phase_flag31,
> +	msm_mux_tgu_ch1,
> +	msm_mux_wlan1_adc1,
> +	msm_mux_tsif1_sync,
> +	msm_mux_qspi2,
> +	msm_mux_sdc43,
> +	msm_mux_vfr_1,
> +	msm_mux_phase_flag30,
> +	msm_mux_tgu_ch2,
> +	msm_mux_wlan1_adc0,
> +	msm_mux_tsif2_clk,

Please squash all tsif2

> +	msm_mux_qup11,
> +	msm_mux_qspi_clk,
> +	msm_mux_sdc4_clk,
> +	msm_mux_phase_flag27,
> +	msm_mux_wlan2_adc1,
> +	msm_mux_tsif2_en,
> +	msm_mux_qspi3,
> +	msm_mux_sdc42,
> +	msm_mux_phase_flag26,
> +	msm_mux_wlan2_adc0,
> +	msm_mux_tsif2_data,
> +	msm_mux_sdc41,
> +	msm_mux_phase_flag25,
> +	msm_mux_tsif2_sync,
> +	msm_mux_sdc40,
> +	msm_mux_tsif2_error,
> +	msm_mux_phase_flag11,
> +	msm_mux_sd_write,
> +	msm_mux_tsif1_error,
> +	msm_mux_qup7,
> +	msm_mux_ddr_bist,
> +	msm_mux_ddr_pxi3,
> +	msm_mux_atest_usb13,
> +	msm_mux_ddr_pxi1,
> +	msm_mux_pll_bypassnl,
> +	msm_mux_atest_usb12,
> +	msm_mux_pll_reset,
> +	msm_mux_pci_e1,
> +	msm_mux_uim2_data,
> +	msm_mux_uim2_clk,
> +	msm_mux_uim2_reset,
> +	msm_mux_uim2_present,

Please squash uim2.

> +	msm_mux_uim1_data,
> +	msm_mux_uim1_clk,
> +	msm_mux_uim1_reset,
> +	msm_mux_uim1_present,

Please squash uim1.

> +	msm_mux_uim_batt,
> +	msm_mux_usb2phy_ac,
> +	msm_mux_aoss_cti,
> +	msm_mux_qup1,
> +	msm_mux_rgmii_txc,

Please squash all the rmiii_*

> +	msm_mux_phase_flag20,
> +	msm_mux_rgmii_rxc,
> +	msm_mux_phase_flag19,
> +	msm_mux_adsp_ext,
> +	msm_mux_rgmii_rx,
> +	msm_mux_phase_flag18,
> +	msm_mux_rgmii_rxd0,
> +	msm_mux_phase_flag17,
> +	msm_mux_rgmii_rxd1,
> +	msm_mux_phase_flag16,
> +	msm_mux_qup5,
> +	msm_mux_rgmii_rxd2,
> +	msm_mux_phase_flag15,
> +	msm_mux_rgmii_rxd3,
> +	msm_mux_phase_flag14,
> +	msm_mux_rgmii_tx,
> +	msm_mux_phase_flag13,
> +	msm_mux_rgmii_txd0,
> +	msm_mux_phase_flag12,
> +	msm_mux_atest_usb22,
> +	msm_mux_emac_phy,
> +	msm_mux_hs3_mi2s,
> +	msm_mux_sec_mi2s,
> +	msm_mux_qup2,
> +	msm_mux_phase_flag9,
> +	msm_mux_phase_flag4,
> +	msm_mux_phase_flag21,
> +	msm_mux_jitter_bist,
> +	msm_mux_atest_usb21,
> +	msm_mux_pll_bist,
> +	msm_mux_atest_usb20,
> +	msm_mux_atest_char0,
> +	msm_mux_ter_mi2s,
> +	msm_mux_gcc_gp1,
> +	msm_mux_atest_char1,
> +	msm_mux_atest_char2,
> +	msm_mux_atest_char3,
> +	msm_mux_qua_mi2s,
> +	msm_mux_pri_mi2s,
> +	msm_mux_qup3,
> +	msm_mux_phase_flag29,
> +	msm_mux_ddr_pxi0,
> +	msm_mux_pri_mi2s_ws,
> +	msm_mux_phase_flag28,
> +	msm_mux_vsense_trigger,
> +	msm_mux_atest_usb1,
> +	msm_mux_atest_usb11,
> +	msm_mux_ddr_pxi2,
> +	msm_mux_dbg_out,
> +	msm_mux_atest_usb10,
> +	msm_mux_spkr_i2s,
> +	msm_mux_audio_ref,
> +	msm_mux_lpass_slimbus,
> +	msm_mux_tsense_pwm1,
> +	msm_mux_tsense_pwm2,
> +	msm_mux_btfm_slimbus,
> +	msm_mux_hs1_mi2s,
> +	msm_mux_cri_trng0,
> +	msm_mux_hs2_mi2s,
> +	msm_mux_cri_trng1,
> +	msm_mux_cri_trng,
> +	msm_mux_sp_cmu,
> +	msm_mux_prng_rosc,
> +	msm_mux_qup0,
> +	msm_mux_gpio,
> +	msm_mux_qup6,
> +	msm_mux_rgmii_txd1,
> +	msm_mux_rgmii_txd2,
> +	msm_mux_rgmii_txd3,
> +	msm_mux_qup_l6,
> +	msm_mux_rgmii_mdc,
> +	msm_mux_qup_l5,
> +	msm_mux_mdp_vsync,
> +	msm_mux_edp_lcd,
> +	msm_mux_qup10,
> +	msm_mux_m_voc,
> +	msm_mux_edp_hot,
> +	msm_mux_cam_mclk,
> +	msm_mux_qdss_gpio0,

Please squash all qdss_gpio into msm_mux_qdss (iirc qdss_cti is a
separate thing).

> +	msm_mux_qdss_gpio1,
> +	msm_mux_qdss_gpio2,
> +	msm_mux_qdss_gpio3,
> +	msm_mux_cci_i2c,
> +	msm_mux_qdss_gpio4,
> +	msm_mux_phase_flag3,
> +	msm_mux_qdss_gpio5,
> +	msm_mux_phase_flag2,
> +	msm_mux_qdss_gpio6,
> +	msm_mux_phase_flag1,
> +	msm_mux_qdss_gpio7,
> +	msm_mux_cci_timer0,
> +	msm_mux_gcc_gp2,
> +	msm_mux_qdss_gpio8,
> +	msm_mux_cci_timer1,
> +	msm_mux_gcc_gp3,
> +	msm_mux_qdss_gpio,
> +	msm_mux_cci_timer2,
> +	msm_mux_qup18,
> +	msm_mux_qdss_gpio9,
> +	msm_mux_cci_timer3,
> +	msm_mux_cci_async,
> +	msm_mux_qdss_gpio10,
> +	msm_mux_cci_timer4,
> +	msm_mux_qdss_gpio11,
> +	msm_mux_qdss_gpio12,
> +	msm_mux_qup15,
> +	msm_mux_qdss_gpio15,
> +	msm_mux_qdss_gpio13,
> +	msm_mux_qdss_gpio14,
> +	msm_mux_pci_e0,
> +	msm_mux_qup_l4,
> +	msm_mux_agera_pll,
> +	msm_mux_usb_phy,
> +	msm_mux_qup9,
> +	msm_mux_qup13,
> +	msm_mux_qdss_cti,
> +	msm_mux_qup14,
> +	msm_mux_qup4,
> +	msm_mux_qup17,
> +	msm_mux_qup19,
> +	msm_mux_phase_flag5,
> +	msm_mux_phase_flag0,
> +	msm_mux_phase_flag22,
> +	msm_mux_rgmii_mdio,
> +	msm_mux_phase_flag10,
> +	msm_mux_atest_char,
> +	msm_mux_nav_pps,
> +	msm_mux_atest_usb2,
> +	msm_mux_qlink_request,
> +	msm_mux_qlink_enable,
> +	msm_mux_wmss_reset,
> +	msm_mux_atest_usb23,
> +	msm_mux_phase_flag6,
> +	msm_mux_pa_indicator,
> +	msm_mux_phase_flag23,
> +	msm_mux_mss_lte,
> +	msm_mux_phase_flag24,
> +	msm_mux__,
> +};
[..]
> +static const struct msm_function sm8150_functions[] = {
> +	FUNCTION(phase_flag8),

Please sort this array as well.

> +	FUNCTION(phase_flag7),
[..]
> +};
> +
> +/*
> + * Every pin is maintained as a single group, and missing or non-existing pin
> + * would be maintained as dummy group to synchronize pin group index with
> + * pin descriptor registered with pinctrl core.
> + * Clients would not be able to request these dummy pin groups.
> + */
> +static const struct msm_pingroup sm8150_groups[] = {
[..]
> +	[58] = PINGROUP(58, SOUTH, qup17, qup19, qdss_cti, qdss_cti, _, _, _, _, _),

qdss_cti can't be both function 3 and 4 of a single pin.

[..]
> +static struct platform_driver sm8150_pinctrl_driver = {
> +	.driver = {
> +		.name = "sm8150-pinctrl",
> +		.owner = THIS_MODULE,

No .owner in platform_driver

> +		.of_match_table = sm8150_pinctrl_of_match,
> +	},
> +	.probe = sm8150_pinctrl_probe,
> +	.remove = msm_pinctrl_remove,
> +};

Regards,
Bjorn
