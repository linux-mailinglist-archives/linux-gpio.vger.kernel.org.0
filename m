Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28E8F17DB79
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2020 09:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbgCIIrn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Mar 2020 04:47:43 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:32891 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbgCIIrm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2020 04:47:42 -0400
Received: by mail-wr1-f66.google.com with SMTP id a25so6117930wrd.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2020 01:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yZSkurjpoUr/pyNIQZil7/1iCdhd0AGftcyCBmdbwhY=;
        b=uwzRD8LEGYFDs0zEnvCaBnPoYnvPmF7kxm7eA7NEioXVHbDoH+YBqciUHVRPXdk7+y
         j7b6ATMLE1qyO2bgeX+v3ekMxpayKKyLJAjp0kYViJTxw7D2Cbe+/t8R3+llbB/hnXyA
         5vi4V32NI4YBRqaw6p3YfA1bCRCCxf/ZkOPMSBqA/BXDV+gQPsZ5Hw+vXwLN8srS7aii
         wYXnKwyK50J1xFxVsYbH/YldUa4vaZVJ0yyeK9PI+6IqgPY5Pl8ldDVjyG92KZpd8/Fz
         aasYdczhmBt9JTyLQ0CiL5d94KOt9fi8gBE7cwwWfJNaACOLHZgzKDEsHu4DUrIw2ujK
         Wtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=yZSkurjpoUr/pyNIQZil7/1iCdhd0AGftcyCBmdbwhY=;
        b=p/U9rwKO0DM2UgsxPH8yU5l65G4o+N4knOaARprxJ5pP9r14qEI0KsIr1YGCI8M/nm
         LSpLWKv+AgOFHRFg47eD1TTBFTD3jEMxw+WBioNM98aGPwP3MSV5cG8/SdGNyKAV3dkH
         vkA92eIQ2aIMBSkp/peAfialxoGF8x7SwGgGAaEEktHBuZMcveh8r1vWOpJyjdZK+0kr
         fAjnurJrj9bxNez98+++L55zxr/eyj0MbmTGjLvmxIcRPmlgd8J8p8i31vRNr3v85Qj5
         0QuGyGSW08m/XtxN5G0y2hVvyp4N72m7UuelHyipFElzeqQ6eK4HC4bRLMhzLk/ZSR9y
         DOJg==
X-Gm-Message-State: ANhLgQ1yoc/8Wob7SACozyrRBlOD2yK8I6whh8Cyjo3DDgu3LNcryRpZ
        XuPtndy54DygV0LDpT+YUezHWg==
X-Google-Smtp-Source: ADFU+vu3etELhKv/3Io0PH0BUypRvmNuhWe4I4/L4ROv7FiAkLp9XgLVVJL2uoJ+3++EDuyzAWrudg==
X-Received: by 2002:a05:6000:12d2:: with SMTP id l18mr19169634wrx.240.1583743658130;
        Mon, 09 Mar 2020 01:47:38 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2? ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id o11sm50979101wrn.6.2020.03.09.01.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2020 01:47:37 -0700 (PDT)
Subject: Re: [PATCH v2] pinctrl: meson: add tsin pinctrl for meson
 gxbb/gxl/gxm
To:     Christian Hewitt <christianshewitt@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Igor Vavro <afl2001@gmail.com>, Otto Meier <gf435@gmx.net>
References: <1583377666-13378-1-git-send-email-christianshewitt@gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <f352d398-c805-7fae-64c3-dd674e77ca5c@baylibre.com>
Date:   Mon, 9 Mar 2020 09:47:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1583377666-13378-1-git-send-email-christianshewitt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05/03/2020 04:07, Christian Hewitt wrote:
> From: Igor Vavro <afl2001@gmail.com>
> 
> Add the tsin pinctrl definitions needed for integrated DVB hardware
> support on Meson GXBB/GXL/GXM boards.
> 
> changes in v2
> - fix ordering and numbering of uart_c ping flagged by Otto in [1]
> 
> [1] http://lists.infradead.org/pipermail/linux-amlogic/2020-March/015906.html
> 
> Signed-off-by: Igor Vavro <afl2001@gmail.com>
> [updated commit message]
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 35 ++++++++++++++++++++++++++++++
>  drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 27 +++++++++++++++++++++++
>  2 files changed, 62 insertions(+)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> index 926b999..d130c63 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> @@ -231,10 +231,24 @@ static const unsigned int hdmi_hpd_pins[]	= { GPIOH_0 };
>  static const unsigned int hdmi_sda_pins[]	= { GPIOH_1 };
>  static const unsigned int hdmi_scl_pins[]	= { GPIOH_2 };
>  
> +static const unsigned int tsin_a_d_valid_pins[] = { GPIOY_0 };
> +static const unsigned int tsin_a_sop_pins[]	= { GPIOY_1 };
> +static const unsigned int tsin_a_clk_pins[]	= { GPIOY_2 };
> +static const unsigned int tsin_a_d0_pins[]	= { GPIOY_3 };
> +static const unsigned int tsin_a_dp_pins[]	= {
> +	GPIOY_4, GPIOY_5, GPIOY_6, GPIOY_7, GPIOY_8, GPIOY_9, GPIOY_10
> +};
> +
> +static const unsigned int tsin_a_fail_pins[]	= { GPIOY_11 };
>  static const unsigned int i2s_out_ch23_y_pins[]	= { GPIOY_8 };
>  static const unsigned int i2s_out_ch45_y_pins[]	= { GPIOY_9 };
>  static const unsigned int i2s_out_ch67_y_pins[]	= { GPIOY_10 };
>  
> +static const unsigned int tsin_b_d_valid_pins[] = { GPIOX_6 };
> +static const unsigned int tsin_b_sop_pins[]	= { GPIOX_7 };
> +static const unsigned int tsin_b_clk_pins[]	= { GPIOX_8 };
> +static const unsigned int tsin_b_d0_pins[]	= { GPIOX_9 };
> +
>  static const unsigned int spdif_out_y_pins[]	= { GPIOY_12 };
>  
>  static const unsigned int gen_clk_out_pins[]	= { GPIOY_15 };
> @@ -437,12 +451,22 @@ static struct meson_pmx_group meson_gxbb_periphs_groups[] = {
>  	GROUP(pwm_a_x,		3,	17),
>  	GROUP(pwm_e,		2,	30),
>  	GROUP(pwm_f_x,		3,	18),
> +	GROUP(tsin_b_d_valid,	3,	9),
> +	GROUP(tsin_b_sop,	3,	8),
> +	GROUP(tsin_b_clk,	3,	10),
> +	GROUP(tsin_b_d0,	3,	7),
>  
>  	/* Bank Y */
>  	GROUP(uart_cts_c,	1,	17),
>  	GROUP(uart_rts_c,	1,	16),
>  	GROUP(uart_tx_c,	1,	19),
>  	GROUP(uart_rx_c,	1,	18),
> +	GROUP(tsin_a_fail,	3,	3),
> +	GROUP(tsin_a_d_valid,	3,	2),
> +	GROUP(tsin_a_sop,	3,	1),
> +	GROUP(tsin_a_clk,	3,	0),
> +	GROUP(tsin_a_d0,	3,	4),
> +	GROUP(tsin_a_dp,	3,	5),
>  	GROUP(pwm_a_y,		1,	21),
>  	GROUP(pwm_f_y,		1,	20),
>  	GROUP(i2s_out_ch23_y,	1,	5),
> @@ -601,6 +625,15 @@ static const char * const gpio_periphs_groups[] = {
>  	"GPIOX_20", "GPIOX_21", "GPIOX_22",
>  };
>  
> +static const char * const tsin_a_groups[] = {
> +	"tsin_a_clk", "tsin_a_sop", "tsin_a_d_valid", "tsin_a_d0",
> +	"tsin_a_dp", "tsin_a_fail",
> +};
> +
> +static const char * const tsin_b_groups[] = {
> +	"tsin_b_clk", "tsin_b_sop", "tsin_b_d_valid", "tsin_b_d0",
> +};
> +
>  static const char * const emmc_groups[] = {
>  	"emmc_nand_d07", "emmc_clk", "emmc_cmd", "emmc_ds",
>  };
> @@ -792,6 +825,8 @@ static struct meson_pmx_func meson_gxbb_periphs_functions[] = {
>  	FUNCTION(i2s_out),
>  	FUNCTION(spdif_out),
>  	FUNCTION(gen_clk_out),
> +	FUNCTION(tsin_a),
> +	FUNCTION(tsin_b),
>  };
>  
>  static struct meson_pmx_func meson_gxbb_aobus_functions[] = {
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> index 1b6e864..45d5831 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> @@ -241,6 +241,17 @@ static const unsigned int tsin_a_dp_pins[] = {
>  	GPIODV_1, GPIODV_2, GPIODV_3, GPIODV_4, GPIODV_5, GPIODV_6, GPIODV_7,
>  };
>  
> +static const unsigned int tsin_b_clk_pins[]	= { GPIOH_6 };
> +static const unsigned int tsin_b_d0_pins[]	= { GPIOH_7 };
> +static const unsigned int tsin_b_sop_pins[]	= { GPIOH_8 };
> +static const unsigned int tsin_b_d_valid_pins[] = { GPIOH_9 };
> +
> +static const unsigned int tsin_b_fail_z4_pins[] = { GPIOZ_4 };
> +static const unsigned int tsin_b_clk_z3_pins[]	= { GPIOZ_3 };
> +static const unsigned int tsin_b_d0_z2_pins[]	= { GPIOZ_2 };
> +static const unsigned int tsin_b_sop_z1_pins[]	= { GPIOZ_1 };
> +static const unsigned int tsin_b_d_valid_z0_pins[] = { GPIOZ_0 };
> +
>  static const struct pinctrl_pin_desc meson_gxl_aobus_pins[] = {
>  	MESON_PIN(GPIOAO_0),
>  	MESON_PIN(GPIOAO_1),
> @@ -438,6 +449,11 @@ static struct meson_pmx_group meson_gxl_periphs_groups[] = {
>  	GROUP(eth_txd1,		4,	12),
>  	GROUP(eth_txd2,		4,	11),
>  	GROUP(eth_txd3,		4,	10),
> +	GROUP(tsin_b_fail_z4,	3,	15),
> +	GROUP(tsin_b_clk_z3,	3,	16),
> +	GROUP(tsin_b_d0_z2,	3,	17),
> +	GROUP(tsin_b_sop_z1,	3,	18),
> +	GROUP(tsin_b_d_valid_z0, 3,	19),
>  	GROUP(pwm_c,		3,	20),
>  	GROUP(i2s_out_ch23_z,	3,	26),
>  	GROUP(i2s_out_ch45_z,	3,	25),
> @@ -454,6 +470,10 @@ static struct meson_pmx_group meson_gxl_periphs_groups[] = {
>  	GROUP(i2s_out_lr_clk,	6,	24),
>  	GROUP(i2s_out_ch01,	6,	23),
>  	GROUP(spdif_out_h,	6,	28),
> +	GROUP(tsin_b_d0,	6,	17),
> +	GROUP(tsin_b_sop,	6,	18),
> +	GROUP(tsin_b_d_valid,	6,	19),
> +	GROUP(tsin_b_clk,	6,	20),
>  
>  	/* Bank DV */
>  	GROUP(uart_tx_b,	2,	16),
> @@ -689,6 +709,12 @@ static const char * const tsin_a_groups[] = {
>  	"tsin_a_dp", "tsin_a_fail",
>  };
>  
> +static const char * const tsin_b_groups[] = {
> +	"tsin_b_clk", "tsin_b_sop", "tsin_b_d_valid", "tsin_b_d0",
> +	"tsin_b_clk_z3", "tsin_b_sop_z1", "tsin_b_d_valid_z0", "tsin_b_d0_z2",
> +	"tsin_b_fail_z4",
> +};
> +
>  static const char * const gpio_aobus_groups[] = {
>  	"GPIOAO_0", "GPIOAO_1", "GPIOAO_2", "GPIOAO_3", "GPIOAO_4",
>  	"GPIOAO_5", "GPIOAO_6", "GPIOAO_7", "GPIOAO_8", "GPIOAO_9",
> @@ -764,6 +790,7 @@ static struct meson_pmx_func meson_gxl_periphs_functions[] = {
>  	FUNCTION(spdif_out),
>  	FUNCTION(eth_led),
>  	FUNCTION(tsin_a),
> +	FUNCTION(tsin_b),
>  };
>  
>  static struct meson_pmx_func meson_gxl_aobus_functions[] = {
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
