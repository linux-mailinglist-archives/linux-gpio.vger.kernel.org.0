Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB30466B4B7
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 00:14:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231604AbjAOXOn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Jan 2023 18:14:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbjAOXOl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Jan 2023 18:14:41 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E974F1E9E8
        for <linux-gpio@vger.kernel.org>; Sun, 15 Jan 2023 15:14:37 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id s22so28349602ljp.5
        for <linux-gpio@vger.kernel.org>; Sun, 15 Jan 2023 15:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SbA0cuEwaHzcW/Aop6bwwRN56GaBWBdBvcbKAZMDdIw=;
        b=SIFZ1e7s7YXKmVUU9lYk/Zo0A/xRevIAwUIgQggYz0Q9R5JjQK+b0Ykrq+RyTHmlxp
         lW+hQmJhaSV7+S3ER5gznNwJ7bLgT9UlZuLfH+dPlhusSz3eET2FD+dsyqfAH1QHLRbK
         +dpmiCm2QoOSKjIWKGyS/oj5YbMchAK4ZUUS/uVjMOJsWGzQlgTN7mYcH0Ntc0nRrt3M
         6hGHQJhtzBLwCcjJ5cCrq/bp1F8SVhI0n69ViT68MLWIcXmeX+ey0CdZcpEqsYV/rpSg
         yQTJgwhRfHJe2EmJ6sb26+NjAUaVLFtVD6C7KG4T4j1p6SwDXsAhc4W6rkWOEwdRduy5
         Mn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SbA0cuEwaHzcW/Aop6bwwRN56GaBWBdBvcbKAZMDdIw=;
        b=oFK6ZN8YCtTHAHBvY2HcsNQos1P/nlRaGG6OE1+8Q1yoiMhkinKU65jdUDWXEQ5HhU
         I+eXTPgxjcd0rRQiB8VPkBEPSGyqLglAUmqk0JMXBmTIaJxgAfChwJXtWvBzT79kZpFx
         Ra/iIA1kfW8fuU+HIWmS/iy4rfktBTxTWpEczZa8CNSxCh5dqIdbpaghDr+FG+q8iBA9
         N3L/EqRJh8SfWPFDDDbJH7SkcuP6VomDWHTg9BFVN8EU3zMW8MoQV/maDLoxjKhhRjvf
         g8uW7eGsjLANqmHtgs7BhUUc4pKsCBE0UTp0i2Rj5aWjC1LmggXs64KvfdiMFLFef7jj
         aQAw==
X-Gm-Message-State: AFqh2krgML+68Vca+ni10/FFwys1YxWdvF1zI9lhpoTIi6HcBEUoSjuj
        xVXBTQLsPGIBt9t90f5ZbY7QUw==
X-Google-Smtp-Source: AMrXdXvHNjSHttY4TC+ahmDU7eYkEumNRIQ8MejT6VDyJGf39tPymNdZsp/HqZh5N/j9uJV2nQZ5yw==
X-Received: by 2002:a2e:b4b7:0:b0:27f:f46c:9335 with SMTP id q23-20020a2eb4b7000000b0027ff46c9335mr12599359ljm.47.1673824475933;
        Sun, 15 Jan 2023 15:14:35 -0800 (PST)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id b13-20020a05651c032d00b00289ad6a94fdsm1575171ljp.102.2023.01.15.15.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 15:14:35 -0800 (PST)
Date:   Mon, 16 Jan 2023 00:14:34 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: renesas: r8a77950: Add VIN[45] pins, groups,
 and functions
Message-ID: <Y8SI2kh8cUlLOtPt@oden.dyn.berto.se>
References: <92c9b3b535d27ea7fcc0aa73d298783d710c214a.1673425207.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92c9b3b535d27ea7fcc0aa73d298783d710c214a.1673425207.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2023-01-11 09:21:38 +0100, Geert Uytterhoeven wrote:
> Add pins, groups, and functions for channels 4 and 5 of the Video Input
> Module (VIN) on the Renesas R-Car H3 ES1.x (R8A77950) SoC, based on
> the version for the R-Car H3 ES2.0+ (R8A77951) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Compile-tested only.
> To be queued in renesas-pinctrl for v6.3.
> ---
>  drivers/pinctrl/renesas/pfc-r8a77950.c | 244 +++++++++++++++++++++++++
>  1 file changed, 244 insertions(+)
> 
> diff --git a/drivers/pinctrl/renesas/pfc-r8a77950.c b/drivers/pinctrl/renesas/pfc-r8a77950.c
> index 4c543ec3a8639393..cc66c6de045c5299 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a77950.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a77950.c
> @@ -3820,6 +3820,186 @@ static const unsigned int usb31_mux[] = {
>  	USB31_PWEN_MARK, USB31_OVC_MARK,
>  };
>  
> +/* - VIN4 ------------------------------------------------------------------- */
> +static const unsigned int vin4_data18_a_pins[] = {
> +	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
> +	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
> +	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
> +	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
> +	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
> +	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
> +	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
> +	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
> +	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
> +};
> +static const unsigned int vin4_data18_a_mux[] = {
> +	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
> +	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
> +	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
> +	VI4_DATA10_MARK, VI4_DATA11_MARK,
> +	VI4_DATA12_MARK, VI4_DATA13_MARK,
> +	VI4_DATA14_MARK, VI4_DATA15_MARK,
> +	VI4_DATA18_MARK, VI4_DATA19_MARK,
> +	VI4_DATA20_MARK, VI4_DATA21_MARK,
> +	VI4_DATA22_MARK, VI4_DATA23_MARK,
> +};
> +static const unsigned int vin4_data18_b_pins[] = {
> +	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
> +	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
> +	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
> +	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
> +	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
> +	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
> +	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
> +	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
> +	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
> +};
> +static const unsigned int vin4_data18_b_mux[] = {
> +	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
> +	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
> +	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
> +	VI4_DATA10_MARK, VI4_DATA11_MARK,
> +	VI4_DATA12_MARK, VI4_DATA13_MARK,
> +	VI4_DATA14_MARK, VI4_DATA15_MARK,
> +	VI4_DATA18_MARK, VI4_DATA19_MARK,
> +	VI4_DATA20_MARK, VI4_DATA21_MARK,
> +	VI4_DATA22_MARK, VI4_DATA23_MARK,
> +};
> +static const unsigned int vin4_data_a_pins[] = {
> +	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
> +	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
> +	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
> +	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
> +	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
> +	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
> +	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
> +	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
> +	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
> +	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
> +	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
> +	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
> +};
> +static const unsigned int vin4_data_a_mux[] = {
> +	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
> +	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
> +	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
> +	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
> +	VI4_DATA8_MARK,  VI4_DATA9_MARK,
> +	VI4_DATA10_MARK, VI4_DATA11_MARK,
> +	VI4_DATA12_MARK, VI4_DATA13_MARK,
> +	VI4_DATA14_MARK, VI4_DATA15_MARK,
> +	VI4_DATA16_MARK, VI4_DATA17_MARK,
> +	VI4_DATA18_MARK, VI4_DATA19_MARK,
> +	VI4_DATA20_MARK, VI4_DATA21_MARK,
> +	VI4_DATA22_MARK, VI4_DATA23_MARK,
> +};
> +static const unsigned int vin4_data_b_pins[] = {
> +	RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
> +	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
> +	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
> +	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
> +	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
> +	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
> +	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
> +	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
> +	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
> +	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
> +	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
> +	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
> +};
> +static const unsigned int vin4_data_b_mux[] = {
> +	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
> +	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
> +	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
> +	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
> +	VI4_DATA8_MARK,  VI4_DATA9_MARK,
> +	VI4_DATA10_MARK, VI4_DATA11_MARK,
> +	VI4_DATA12_MARK, VI4_DATA13_MARK,
> +	VI4_DATA14_MARK, VI4_DATA15_MARK,
> +	VI4_DATA16_MARK, VI4_DATA17_MARK,
> +	VI4_DATA18_MARK, VI4_DATA19_MARK,
> +	VI4_DATA20_MARK, VI4_DATA21_MARK,
> +	VI4_DATA22_MARK, VI4_DATA23_MARK,
> +};
> +static const unsigned int vin4_sync_pins[] = {
> +	/* HSYNC#, VSYNC# */
> +	RCAR_GP_PIN(1, 18), RCAR_GP_PIN(1, 17),
> +};
> +static const unsigned int vin4_sync_mux[] = {
> +	VI4_HSYNC_N_MARK, VI4_VSYNC_N_MARK,
> +};
> +static const unsigned int vin4_field_pins[] = {
> +	/* FIELD */
> +	RCAR_GP_PIN(1, 16),
> +};
> +static const unsigned int vin4_field_mux[] = {
> +	VI4_FIELD_MARK,
> +};
> +static const unsigned int vin4_clkenb_pins[] = {
> +	/* CLKENB */
> +	RCAR_GP_PIN(1, 19),
> +};
> +static const unsigned int vin4_clkenb_mux[] = {
> +	VI4_CLKENB_MARK,
> +};
> +static const unsigned int vin4_clk_pins[] = {
> +	/* CLK */
> +	RCAR_GP_PIN(1, 27),
> +};
> +static const unsigned int vin4_clk_mux[] = {
> +	VI4_CLK_MARK,
> +};
> +
> +/* - VIN5 ------------------------------------------------------------------- */
> +static const unsigned int vin5_data_pins[] = {
> +	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
> +	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
> +	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
> +	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
> +	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
> +	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
> +	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
> +	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
> +};
> +static const unsigned int vin5_data_mux[] = {
> +	VI5_DATA0_MARK, VI5_DATA1_MARK,
> +	VI5_DATA2_MARK, VI5_DATA3_MARK,
> +	VI5_DATA4_MARK, VI5_DATA5_MARK,
> +	VI5_DATA6_MARK, VI5_DATA7_MARK,
> +	VI5_DATA8_MARK,  VI5_DATA9_MARK,
> +	VI5_DATA10_MARK, VI5_DATA11_MARK,
> +	VI5_DATA12_MARK, VI5_DATA13_MARK,
> +	VI5_DATA14_MARK, VI5_DATA15_MARK,
> +};
> +static const unsigned int vin5_sync_pins[] = {
> +	/* HSYNC#, VSYNC# */
> +	RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 9),
> +};
> +static const unsigned int vin5_sync_mux[] = {
> +	VI5_HSYNC_N_MARK, VI5_VSYNC_N_MARK,
> +};
> +static const unsigned int vin5_field_pins[] = {
> +	RCAR_GP_PIN(1, 11),
> +};
> +static const unsigned int vin5_field_mux[] = {
> +	/* FIELD */
> +	VI5_FIELD_MARK,
> +};
> +static const unsigned int vin5_clkenb_pins[] = {
> +	RCAR_GP_PIN(1, 20),
> +};
> +static const unsigned int vin5_clkenb_mux[] = {
> +	/* CLKENB */
> +	VI5_CLKENB_MARK,
> +};
> +static const unsigned int vin5_clk_pins[] = {
> +	RCAR_GP_PIN(1, 21),
> +};
> +static const unsigned int vin5_clk_mux[] = {
> +	/* CLK */
> +	VI5_CLK_MARK,
> +};
> +
>  static const struct sh_pfc_pin_group pinmux_groups[] = {
>  	SH_PFC_PIN_GROUP(audio_clk_a_a),
>  	SH_PFC_PIN_GROUP(audio_clk_a_b),
> @@ -4141,6 +4321,34 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
>  	SH_PFC_PIN_GROUP(usb2),
>  	SH_PFC_PIN_GROUP(usb30),
>  	SH_PFC_PIN_GROUP(usb31),
> +	BUS_DATA_PIN_GROUP(vin4_data, 8, _a),
> +	BUS_DATA_PIN_GROUP(vin4_data, 10, _a),
> +	BUS_DATA_PIN_GROUP(vin4_data, 12, _a),
> +	BUS_DATA_PIN_GROUP(vin4_data, 16, _a),
> +	SH_PFC_PIN_GROUP(vin4_data18_a),
> +	BUS_DATA_PIN_GROUP(vin4_data, 20, _a),
> +	BUS_DATA_PIN_GROUP(vin4_data, 24, _a),
> +	BUS_DATA_PIN_GROUP(vin4_data, 8, _b),
> +	BUS_DATA_PIN_GROUP(vin4_data, 10, _b),
> +	BUS_DATA_PIN_GROUP(vin4_data, 12, _b),
> +	BUS_DATA_PIN_GROUP(vin4_data, 16, _b),
> +	SH_PFC_PIN_GROUP(vin4_data18_b),
> +	BUS_DATA_PIN_GROUP(vin4_data, 20, _b),
> +	BUS_DATA_PIN_GROUP(vin4_data, 24, _b),
> +	SH_PFC_PIN_GROUP_SUBSET(vin4_g8, vin4_data_a, 8, 8),
> +	SH_PFC_PIN_GROUP(vin4_sync),
> +	SH_PFC_PIN_GROUP(vin4_field),
> +	SH_PFC_PIN_GROUP(vin4_clkenb),
> +	SH_PFC_PIN_GROUP(vin4_clk),
> +	BUS_DATA_PIN_GROUP(vin5_data, 8),
> +	BUS_DATA_PIN_GROUP(vin5_data, 10),
> +	BUS_DATA_PIN_GROUP(vin5_data, 12),
> +	BUS_DATA_PIN_GROUP(vin5_data, 16),
> +	SH_PFC_PIN_GROUP_SUBSET(vin5_high8, vin5_data, 8, 8),
> +	SH_PFC_PIN_GROUP(vin5_sync),
> +	SH_PFC_PIN_GROUP(vin5_field),
> +	SH_PFC_PIN_GROUP(vin5_clkenb),
> +	SH_PFC_PIN_GROUP(vin5_clk),
>  };
>  
>  static const char * const audio_clk_groups[] = {
> @@ -4637,6 +4845,40 @@ static const char * const usb31_groups[] = {
>  	"usb31",
>  };
>  
> +static const char * const vin4_groups[] = {
> +	"vin4_data8_a",
> +	"vin4_data10_a",
> +	"vin4_data12_a",
> +	"vin4_data16_a",
> +	"vin4_data18_a",
> +	"vin4_data20_a",
> +	"vin4_data24_a",
> +	"vin4_data8_b",
> +	"vin4_data10_b",
> +	"vin4_data12_b",
> +	"vin4_data16_b",
> +	"vin4_data18_b",
> +	"vin4_data20_b",
> +	"vin4_data24_b",
> +	"vin4_g8",
> +	"vin4_sync",
> +	"vin4_field",
> +	"vin4_clkenb",
> +	"vin4_clk",
> +};
> +
> +static const char * const vin5_groups[] = {
> +	"vin5_data8",
> +	"vin5_data10",
> +	"vin5_data12",
> +	"vin5_data16",
> +	"vin5_high8",
> +	"vin5_sync",
> +	"vin5_field",
> +	"vin5_clkenb",
> +	"vin5_clk",
> +};
> +
>  static const struct sh_pfc_function pinmux_functions[] = {
>  	SH_PFC_FUNCTION(audio_clk),
>  	SH_PFC_FUNCTION(avb),
> @@ -4696,6 +4938,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
>  	SH_PFC_FUNCTION(usb2),
>  	SH_PFC_FUNCTION(usb30),
>  	SH_PFC_FUNCTION(usb31),
> +	SH_PFC_FUNCTION(vin4),
> +	SH_PFC_FUNCTION(vin5),
>  };
>  
>  static const struct pinmux_cfg_reg pinmux_config_regs[] = {
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund
