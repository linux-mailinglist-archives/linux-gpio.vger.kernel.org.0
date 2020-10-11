Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27DA028A83F
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Oct 2020 18:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388107AbgJKQaU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Oct 2020 12:30:20 -0400
Received: from out28-148.mail.aliyun.com ([115.124.28.148]:59082 "EHLO
        out28-148.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388091AbgJKQaU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Oct 2020 12:30:20 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.613643-0.000133524-0.386224;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047212;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.Ihpxocg_1602433813;
Received: from 192.168.1.6(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Ihpxocg_1602433813)
          by smtp.aliyun-inc.com(10.147.41.137);
          Mon, 12 Oct 2020 00:30:14 +0800
Subject: Re: [PATCH] pinctrl: ingenic: Fix invalid SSI pins
To:     Paul Cercueil <paul@crapouillou.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Artur Rojek <contact@artur-rojek.eu>
References: <CACRpkda1B3LcGWc1PhXNgi-6JxapiKY4F_94c6dk4eBLgVGBJg@mail.gmail.com>
 <20201010192509.9098-1-paul@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <f9834433-8905-c9a3-ac97-fc13ecc44a54@wanyeetech.com>
Date:   Mon, 12 Oct 2020 00:30:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20201010192509.9098-1-paul@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Paul,

On 2020/10/11 上午3:25, Paul Cercueil wrote:
> The values for the SSI pins on GPIO chips D and E were off by 0x20.


My bad, I missed a group when calculating the offset. Thanks for fix that.

Reviewed-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>


> Fixes: d3ef8c6b2286 ("pinctrl: Ingenic: Add SSI pins support for JZ4770 and JZ4780.")
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Reported-by: Artur Rojek <contact@artur-rojek.eu>
> ---
>   drivers/pinctrl/pinctrl-ingenic.c | 72 +++++++++++++++----------------
>   1 file changed, 36 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
> index c8e50a58a5e5..621909b01deb 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -635,44 +635,44 @@ static int jz4770_uart3_data_pins[] = { 0x6c, 0x85, };
>   static int jz4770_uart3_hwflow_pins[] = { 0x88, 0x89, };
>   static int jz4770_ssi0_dt_a_pins[] = { 0x15, };
>   static int jz4770_ssi0_dt_b_pins[] = { 0x35, };
> -static int jz4770_ssi0_dt_d_pins[] = { 0x55, };
> -static int jz4770_ssi0_dt_e_pins[] = { 0x71, };
> +static int jz4770_ssi0_dt_d_pins[] = { 0x75, };
> +static int jz4770_ssi0_dt_e_pins[] = { 0x91, };
>   static int jz4770_ssi0_dr_a_pins[] = { 0x14, };
>   static int jz4770_ssi0_dr_b_pins[] = { 0x34, };
> -static int jz4770_ssi0_dr_d_pins[] = { 0x54, };
> -static int jz4770_ssi0_dr_e_pins[] = { 0x6e, };
> +static int jz4770_ssi0_dr_d_pins[] = { 0x74, };
> +static int jz4770_ssi0_dr_e_pins[] = { 0x8e, };
>   static int jz4770_ssi0_clk_a_pins[] = { 0x12, };
>   static int jz4770_ssi0_clk_b_pins[] = { 0x3c, };
> -static int jz4770_ssi0_clk_d_pins[] = { 0x58, };
> -static int jz4770_ssi0_clk_e_pins[] = { 0x6f, };
> +static int jz4770_ssi0_clk_d_pins[] = { 0x78, };
> +static int jz4770_ssi0_clk_e_pins[] = { 0x8f, };
>   static int jz4770_ssi0_gpc_b_pins[] = { 0x3e, };
> -static int jz4770_ssi0_gpc_d_pins[] = { 0x56, };
> -static int jz4770_ssi0_gpc_e_pins[] = { 0x73, };
> +static int jz4770_ssi0_gpc_d_pins[] = { 0x76, };
> +static int jz4770_ssi0_gpc_e_pins[] = { 0x93, };
>   static int jz4770_ssi0_ce0_a_pins[] = { 0x13, };
>   static int jz4770_ssi0_ce0_b_pins[] = { 0x3d, };
> -static int jz4770_ssi0_ce0_d_pins[] = { 0x59, };
> -static int jz4770_ssi0_ce0_e_pins[] = { 0x70, };
> +static int jz4770_ssi0_ce0_d_pins[] = { 0x79, };
> +static int jz4770_ssi0_ce0_e_pins[] = { 0x90, };
>   static int jz4770_ssi0_ce1_b_pins[] = { 0x3f, };
> -static int jz4770_ssi0_ce1_d_pins[] = { 0x57, };
> -static int jz4770_ssi0_ce1_e_pins[] = { 0x72, };
> +static int jz4770_ssi0_ce1_d_pins[] = { 0x77, };
> +static int jz4770_ssi0_ce1_e_pins[] = { 0x92, };
>   static int jz4770_ssi1_dt_b_pins[] = { 0x35, };
> -static int jz4770_ssi1_dt_d_pins[] = { 0x55, };
> -static int jz4770_ssi1_dt_e_pins[] = { 0x71, };
> +static int jz4770_ssi1_dt_d_pins[] = { 0x75, };
> +static int jz4770_ssi1_dt_e_pins[] = { 0x91, };
>   static int jz4770_ssi1_dr_b_pins[] = { 0x34, };
> -static int jz4770_ssi1_dr_d_pins[] = { 0x54, };
> -static int jz4770_ssi1_dr_e_pins[] = { 0x6e, };
> +static int jz4770_ssi1_dr_d_pins[] = { 0x74, };
> +static int jz4770_ssi1_dr_e_pins[] = { 0x8e, };
>   static int jz4770_ssi1_clk_b_pins[] = { 0x3c, };
> -static int jz4770_ssi1_clk_d_pins[] = { 0x58, };
> -static int jz4770_ssi1_clk_e_pins[] = { 0x6f, };
> +static int jz4770_ssi1_clk_d_pins[] = { 0x78, };
> +static int jz4770_ssi1_clk_e_pins[] = { 0x8f, };
>   static int jz4770_ssi1_gpc_b_pins[] = { 0x3e, };
> -static int jz4770_ssi1_gpc_d_pins[] = { 0x56, };
> -static int jz4770_ssi1_gpc_e_pins[] = { 0x73, };
> +static int jz4770_ssi1_gpc_d_pins[] = { 0x76, };
> +static int jz4770_ssi1_gpc_e_pins[] = { 0x93, };
>   static int jz4770_ssi1_ce0_b_pins[] = { 0x3d, };
> -static int jz4770_ssi1_ce0_d_pins[] = { 0x59, };
> -static int jz4770_ssi1_ce0_e_pins[] = { 0x70, };
> +static int jz4770_ssi1_ce0_d_pins[] = { 0x79, };
> +static int jz4770_ssi1_ce0_e_pins[] = { 0x90, };
>   static int jz4770_ssi1_ce1_b_pins[] = { 0x3f, };
> -static int jz4770_ssi1_ce1_d_pins[] = { 0x57, };
> -static int jz4770_ssi1_ce1_e_pins[] = { 0x72, };
> +static int jz4770_ssi1_ce1_d_pins[] = { 0x77, };
> +static int jz4770_ssi1_ce1_e_pins[] = { 0x92, };
>   static int jz4770_mmc0_1bit_a_pins[] = { 0x12, 0x13, 0x14, };
>   static int jz4770_mmc0_4bit_a_pins[] = { 0x15, 0x16, 0x17, };
>   static int jz4770_mmc0_1bit_e_pins[] = { 0x9c, 0x9d, 0x94, };
> @@ -1050,35 +1050,35 @@ static int jz4780_ssi0_dt_a_19_pins[] = { 0x13, };
>   static int jz4780_ssi0_dt_a_21_pins[] = { 0x15, };
>   static int jz4780_ssi0_dt_a_28_pins[] = { 0x1c, };
>   static int jz4780_ssi0_dt_b_pins[] = { 0x3d, };
> -static int jz4780_ssi0_dt_d_pins[] = { 0x59, };
> +static int jz4780_ssi0_dt_d_pins[] = { 0x79, };
>   static int jz4780_ssi0_dr_a_20_pins[] = { 0x14, };
>   static int jz4780_ssi0_dr_a_27_pins[] = { 0x1b, };
>   static int jz4780_ssi0_dr_b_pins[] = { 0x34, };
> -static int jz4780_ssi0_dr_d_pins[] = { 0x54, };
> +static int jz4780_ssi0_dr_d_pins[] = { 0x74, };
>   static int jz4780_ssi0_clk_a_pins[] = { 0x12, };
>   static int jz4780_ssi0_clk_b_5_pins[] = { 0x25, };
>   static int jz4780_ssi0_clk_b_28_pins[] = { 0x3c, };
> -static int jz4780_ssi0_clk_d_pins[] = { 0x58, };
> +static int jz4780_ssi0_clk_d_pins[] = { 0x78, };
>   static int jz4780_ssi0_gpc_b_pins[] = { 0x3e, };
> -static int jz4780_ssi0_gpc_d_pins[] = { 0x56, };
> +static int jz4780_ssi0_gpc_d_pins[] = { 0x76, };
>   static int jz4780_ssi0_ce0_a_23_pins[] = { 0x17, };
>   static int jz4780_ssi0_ce0_a_25_pins[] = { 0x19, };
>   static int jz4780_ssi0_ce0_b_pins[] = { 0x3f, };
> -static int jz4780_ssi0_ce0_d_pins[] = { 0x57, };
> +static int jz4780_ssi0_ce0_d_pins[] = { 0x77, };
>   static int jz4780_ssi0_ce1_b_pins[] = { 0x35, };
> -static int jz4780_ssi0_ce1_d_pins[] = { 0x55, };
> +static int jz4780_ssi0_ce1_d_pins[] = { 0x75, };
>   static int jz4780_ssi1_dt_b_pins[] = { 0x3d, };
> -static int jz4780_ssi1_dt_d_pins[] = { 0x59, };
> +static int jz4780_ssi1_dt_d_pins[] = { 0x79, };
>   static int jz4780_ssi1_dr_b_pins[] = { 0x34, };
> -static int jz4780_ssi1_dr_d_pins[] = { 0x54, };
> +static int jz4780_ssi1_dr_d_pins[] = { 0x74, };
>   static int jz4780_ssi1_clk_b_pins[] = { 0x3c, };
> -static int jz4780_ssi1_clk_d_pins[] = { 0x58, };
> +static int jz4780_ssi1_clk_d_pins[] = { 0x78, };
>   static int jz4780_ssi1_gpc_b_pins[] = { 0x3e, };
> -static int jz4780_ssi1_gpc_d_pins[] = { 0x56, };
> +static int jz4780_ssi1_gpc_d_pins[] = { 0x76, };
>   static int jz4780_ssi1_ce0_b_pins[] = { 0x3f, };
> -static int jz4780_ssi1_ce0_d_pins[] = { 0x57, };
> +static int jz4780_ssi1_ce0_d_pins[] = { 0x77, };
>   static int jz4780_ssi1_ce1_b_pins[] = { 0x35, };
> -static int jz4780_ssi1_ce1_d_pins[] = { 0x55, };
> +static int jz4780_ssi1_ce1_d_pins[] = { 0x75, };
>   static int jz4780_mmc0_8bit_a_pins[] = { 0x04, 0x05, 0x06, 0x07, 0x18, };
>   static int jz4780_i2c3_pins[] = { 0x6a, 0x6b, };
>   static int jz4780_i2c4_e_pins[] = { 0x8c, 0x8d, };
