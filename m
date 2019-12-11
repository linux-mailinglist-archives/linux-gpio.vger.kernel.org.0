Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E771B11A491
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 07:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfLKGie (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 01:38:34 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41433 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbfLKGie (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 01:38:34 -0500
Received: by mail-pg1-f194.google.com with SMTP id x8so10267015pgk.8
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2019 22:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wCcHDW9O7Iaab79y+0aXCM6dy3RXkvfoXYtohfVx57g=;
        b=xk/Ld8xmYFb+XOgsxTVb+d66ZWfVAzpl3lEMhPnRsI4DUZB/M06dGtrQyWv6ISmMcm
         57OeuFGVjA9OtVLKIFqIRFyT1qV1M6tgB7ZeprVQFQHpYX2imgr4ANdsgTAt2czzrBeo
         0Y9GsQq9vhL/d/C1TQ0mQIFh+77H/sZlB9xNSu9hmMBUEFVTS1jaNIzrFBq8/bsoBvDZ
         Hof5bxz87V3/o9apFf6kVJEt5PkZScWTf2zzl/kUR/YoxNp1TQd7pPHJsklWBng5JFsv
         Ocro5Hj1frgU8W9pJdVYPofsFDogVE93rP3FzrZwvQY15t/ZtNa0m6Ge2VT3YR8F2LE8
         pGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wCcHDW9O7Iaab79y+0aXCM6dy3RXkvfoXYtohfVx57g=;
        b=oOwEhDw0LQihvFVHERhlxVVzwpfDxXJHbpQe7WgpevQT6y4ChNs6OjQ8aAmTPgLrv2
         B+/DSA8jcahbecO2cJRxTnWmEdy2dMtlPlR5r95GYLJza2CATk2a4Mq7qKNJx9DMJtk+
         HtXP1kFi1hzn3TWwT6D9Op/XkOb0O0+xktX1AXd/i7kTJbTm0EL0KiHy0TGgj8HYJ3im
         cPvlhAnTzdh98Y2RnT4/MiwaYpRScBHJW/M5/OqJu5tnZ+VmL2Au2M790pSbeB48hGDL
         zkF4eQKNqVo7IACwPRkrpo8iRE7d8kdiQj6NPyRknd7V2YKzbzxAstCQxF3PNTHPQRH8
         NDCA==
X-Gm-Message-State: APjAAAWKIT5aJ0S5RVRKmXU3E/tpydPZlLMKhrHkdEjarW5J6dmSJ533
        VOdqRTop6yEkP/I+fSXJ2rbByg==
X-Google-Smtp-Source: APXvYqx0Yu/g8Ci7gEq1qg/N+fFl+X0bsr04TepOdQxEenptEJ8PtkyR3cPG2esolXZ5H9/BmvFyaQ==
X-Received: by 2002:a63:ed56:: with SMTP id m22mr2318632pgk.261.1576046312857;
        Tue, 10 Dec 2019 22:38:32 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l1sm1234792pgs.47.2019.12.10.22.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 22:38:32 -0800 (PST)
Date:   Tue, 10 Dec 2019 22:38:29 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     linus.walleij@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, dianders@chromium.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: sc7180: Add new qup functions
Message-ID: <20191211063829.GC3143381@builder>
References: <1576041834-23084-1-git-send-email-rnayak@codeaurora.org>
 <0101016ef36a9118-f2919277-effa-4cd5-adf8-bbc8016f31df-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016ef36a9118-f2919277-effa-4cd5-adf8-bbc8016f31df-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 10 Dec 21:24 PST 2019, Rajendra Nayak wrote:

> on sc7180 we have cases where multiple functions from the same
> qup instance share the same pin. This is true for qup02/04/11 and qup13.
> Add new function names to distinguish which qup function to use.
> 
> The device tree files for this platform haven't landed in mainline yet,
> so there aren't any users upstream who should break with this change
> in function names, however, anyone using the devicetree files that were
> posted on the lists and using these specific function names will need
> to update their changes.

I don't think this paragraph adds value to the git log, but the patch
looks good.

> 
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-sc7180.c | 60 +++++++++++++++++++++++------------
>  1 file changed, 40 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7180.c b/drivers/pinctrl/qcom/pinctrl-sc7180.c
> index d6cfad7..6247d92 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7180.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7180.c
> @@ -456,14 +456,18 @@ enum sc7180_functions {
>  	msm_mux_qspi_data,
>  	msm_mux_qup00,
>  	msm_mux_qup01,
> -	msm_mux_qup02,
> +	msm_mux_qup02_i2c,
> +	msm_mux_qup02_uart,
>  	msm_mux_qup03,
> -	msm_mux_qup04,
> +	msm_mux_qup04_i2c,
> +	msm_mux_qup04_uart,
>  	msm_mux_qup05,
>  	msm_mux_qup10,
> -	msm_mux_qup11,
> +	msm_mux_qup11_i2c,
> +	msm_mux_qup11_uart,
>  	msm_mux_qup12,
> -	msm_mux_qup13,
> +	msm_mux_qup13_i2c,
> +	msm_mux_qup13_uart,
>  	msm_mux_qup14,
>  	msm_mux_qup15,
>  	msm_mux_sdc1_tb,
> @@ -543,7 +547,10 @@ static const char * const sdc1_tb_groups[] = {
>  static const char * const sdc2_tb_groups[] = {
>  	"gpio5",
>  };
> -static const char * const qup11_groups[] = {
> +static const char * const qup11_i2c_groups[] = {
> +	"gpio6", "gpio7",
> +};
> +static const char * const qup11_uart_groups[] = {
>  	"gpio6", "gpio7",
>  };
>  static const char * const ddr_bist_groups[] = {
> @@ -593,7 +600,10 @@ static const char * const qdss_groups[] = {
>  static const char * const pll_reset_groups[] = {
>  	"gpio14",
>  };
> -static const char * const qup02_groups[] = {
> +static const char * const qup02_i2c_groups[] = {
> +	"gpio15", "gpio16",
> +};
> +static const char * const qup02_uart_groups[] = {
>  	"gpio15", "gpio16",
>  };
>  static const char * const cci_i2c_groups[] = {
> @@ -698,7 +708,10 @@ static const char * const wlan1_adc1_groups[] = {
>  static const char * const atest_usb13_groups[] = {
>  	"gpio44",
>  };
> -static const char * const qup13_groups[] = {
> +static const char * const qup13_i2c_groups[] = {
> +	"gpio46", "gpio47",
> +};
> +static const char * const qup13_uart_groups[] = {
>  	"gpio46", "gpio47",
>  };
>  static const char * const gcc_gp1_groups[] = {
> @@ -848,7 +861,10 @@ static const char * const usb_phy_groups[] = {
>  static const char * const mss_lte_groups[] = {
>  	"gpio108", "gpio109",
>  };
> -static const char * const qup04_groups[] = {
> +static const char * const qup04_i2c_groups[] = {
> +	"gpio115", "gpio116",
> +};
> +static const char * const qup04_uart_groups[] = {
>  	"gpio115", "gpio116",
>  };
>  
> @@ -929,14 +945,18 @@ static const struct msm_function sc7180_functions[] = {
>  	FUNCTION(qspi_data),
>  	FUNCTION(qup00),
>  	FUNCTION(qup01),
> -	FUNCTION(qup02),
> +	FUNCTION(qup02_i2c),
> +	FUNCTION(qup02_uart),
>  	FUNCTION(qup03),
> -	FUNCTION(qup04),
> +	FUNCTION(qup04_i2c),
> +	FUNCTION(qup04_uart),
>  	FUNCTION(qup05),
>  	FUNCTION(qup10),
> -	FUNCTION(qup11),
> +	FUNCTION(qup11_i2c),
> +	FUNCTION(qup11_uart),
>  	FUNCTION(qup12),
> -	FUNCTION(qup13),
> +	FUNCTION(qup13_i2c),
> +	FUNCTION(qup13_uart),
>  	FUNCTION(qup14),
>  	FUNCTION(qup15),
>  	FUNCTION(sdc1_tb),
> @@ -976,8 +996,8 @@ static const struct msm_pingroup sc7180_groups[] = {
>  	[3] = PINGROUP(3, SOUTH, qup01, sp_cmu, dbg_out, qdss_cti, _, _, _, _, _),
>  	[4] = PINGROUP(4, NORTH, sdc1_tb, _, qdss_cti, _, _, _, _, _, _),
>  	[5] = PINGROUP(5, NORTH, sdc2_tb, _, _, _, _, _, _, _, _),
> -	[6] = PINGROUP(6, NORTH, qup11, qup11, _, _, _, _, _, _, _),
> -	[7] = PINGROUP(7, NORTH, qup11, qup11, ddr_bist, _, _, _, _, _, _),
> +	[6] = PINGROUP(6, NORTH, qup11_i2c, qup11_uart, _, _, _, _, _, _, _),
> +	[7] = PINGROUP(7, NORTH, qup11_i2c, qup11_uart, ddr_bist, _, _, _, _, _, _),
>  	[8] = PINGROUP(8, NORTH, gp_pdm1, ddr_bist, _, phase_flag, qdss_cti, _, _, _, _),
>  	[9] = PINGROUP(9, NORTH, ddr_bist, _, phase_flag, qdss_cti, _, _, _, _, _),
>  	[10] = PINGROUP(10, NORTH, mdp_vsync, ddr_bist, _, _, _, _, _, _, _),
> @@ -985,8 +1005,8 @@ static const struct msm_pingroup sc7180_groups[] = {
>  	[12] = PINGROUP(12, SOUTH, mdp_vsync, m_voc, qup01, _, phase_flag, wlan2_adc0, atest_usb10, ddr_pxi3, _),
>  	[13] = PINGROUP(13, SOUTH, cam_mclk, pll_bypassnl, qdss, _, _, _, _, _, _),
>  	[14] = PINGROUP(14, SOUTH, cam_mclk, pll_reset, qdss, _, _, _, _, _, _),
> -	[15] = PINGROUP(15, SOUTH, cam_mclk, qup02, qup02, qdss, _, _, _, _, _),
> -	[16] = PINGROUP(16, SOUTH, cam_mclk, qup02, qup02, qdss, _, _, _, _, _),
> +	[15] = PINGROUP(15, SOUTH, cam_mclk, qup02_i2c, qup02_uart, qdss, _, _, _, _, _),
> +	[16] = PINGROUP(16, SOUTH, cam_mclk, qup02_i2c, qup02_uart, qdss, _, _, _, _, _),
>  	[17] = PINGROUP(17, SOUTH, cci_i2c, _, phase_flag, qdss, _, wlan1_adc0, atest_usb12, ddr_pxi1, atest_char),
>  	[18] = PINGROUP(18, SOUTH, cci_i2c, agera_pll, _, phase_flag, qdss, vsense_trigger, ddr_pxi0, atest_char3, _),
>  	[19] = PINGROUP(19, SOUTH, cci_i2c, _, phase_flag, qdss, atest_char2, _, _, _, _),
> @@ -1016,8 +1036,8 @@ static const struct msm_pingroup sc7180_groups[] = {
>  	[43] = PINGROUP(43, NORTH, qup12, _, _, _, _, _, _, _, _),
>  	[44] = PINGROUP(44, NORTH, qup12, _, phase_flag, qdss_cti, wlan1_adc1, atest_usb13, ddr_pxi1, _, _),
>  	[45] = PINGROUP(45, NORTH, qup12, qdss_cti, _, _, _, _, _, _, _),
> -	[46] = PINGROUP(46, NORTH, qup13, qup13, _, _, _, _, _, _, _),
> -	[47] = PINGROUP(47, NORTH, qup13, qup13, _, _, _, _, _, _, _),
> +	[46] = PINGROUP(46, NORTH, qup13_i2c, qup13_uart, _, _, _, _, _, _, _),
> +	[47] = PINGROUP(47, NORTH, qup13_i2c, qup13_uart, _, _, _, _, _, _, _),
>  	[48] = PINGROUP(48, NORTH, gcc_gp1, _, _, _, _, _, _, _, _),
>  	[49] = PINGROUP(49, WEST, mi2s_1, btfm_slimbus, _, _, _, _, _, _, _),
>  	[50] = PINGROUP(50, WEST, mi2s_1, btfm_slimbus, gp_pdm1, _, _, _, _, _, _),
> @@ -1085,8 +1105,8 @@ static const struct msm_pingroup sc7180_groups[] = {
>  	[112] = PINGROUP(112, NORTH, _, _, _, _, _, _, _, _, _),
>  	[113] = PINGROUP(113, NORTH, _, _, _, _, _, _, _, _, _),
>  	[114] = PINGROUP(114, NORTH, _, _, _, _, _, _, _, _, _),
> -	[115] = PINGROUP(115, WEST, qup04, qup04, _, _, _, _, _, _, _),
> -	[116] = PINGROUP(116, WEST, qup04, qup04, _, _, _, _, _, _, _),
> +	[115] = PINGROUP(115, WEST, qup04_i2c, qup04_uart, _, _, _, _, _, _, _),
> +	[116] = PINGROUP(116, WEST, qup04_i2c, qup04_uart, _, _, _, _, _, _, _),
>  	[117] = PINGROUP(117, WEST, dp_hot, _, _, _, _, _, _, _, _),
>  	[118] = PINGROUP(118, WEST, _, _, _, _, _, _, _, _, _),
>  	[119] = UFS_RESET(ufs_reset, 0x7f000),
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
