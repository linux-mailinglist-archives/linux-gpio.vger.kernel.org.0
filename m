Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43597545204
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jun 2022 18:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344751AbiFIQbE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jun 2022 12:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344645AbiFIQbD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jun 2022 12:31:03 -0400
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8206834EC66;
        Thu,  9 Jun 2022 09:31:01 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id p63so914409qkd.10;
        Thu, 09 Jun 2022 09:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Az71qbAOeXQ9hyp2dfegB03vpOtX4xliBhC+bEyndMU=;
        b=0UC0ovy+Zk4o91dRybryw4csEm+iQ+y4YwSwB3GgM+B/bb5aZZMvCgBYDGXAp5hGpG
         HMSNusRsk5j/EQC1FzuTDw9Y+U72rMZ4gvJdJ+Z2QbiNbb6vzWTFhRGJmZCk6lS0H8Jt
         H63rJ4bJmfIaNVGxR+9wOiVIKG6zvh5d5prIHa4naBQnVpeHvbRpWK2f7o/UXLaifwI6
         J9iVRQHscRvmwwSlC304niJbrLHYMQEGJlxAKi76ZWTm4MJgRie81j6pceYXD4jYAr3f
         0OpO0i0yogIIBY3MIKyttgE3Itp5ZtqdvvnzeNTnoaKp+HfYa6pI5foSEZaOtYbsNa0u
         /qAg==
X-Gm-Message-State: AOAM53350u6walP2gYT2jZVohYQiA48zKs2sOGT/HjJUoLsIMg7ohSdz
        nfRBCoeXWrb5EtL7RYDzfVLifMsK6u/Qbw==
X-Google-Smtp-Source: ABdhPJxqhbR6yxiCCOQtQ9RPNGvm+btexSNG0zf/UH/xKX+XtFaa9HwOf5LdjYYSApKiGR3yaZ9JAg==
X-Received: by 2002:a05:620a:458c:b0:6a5:b92e:7406 with SMTP id bp12-20020a05620a458c00b006a5b92e7406mr26639368qkb.387.1654792260337;
        Thu, 09 Jun 2022 09:31:00 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id v186-20020a3793c3000000b0069fc13ce1f3sm18743223qkd.36.2022.06.09.09.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 09:31:00 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id v22so42665477ybd.5;
        Thu, 09 Jun 2022 09:31:00 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr41733789ybu.604.1654792259767; Thu, 09
 Jun 2022 09:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <87zgipgu3s.wl-kuninori.morimoto.gx@renesas.com> <87tu8xgu1f.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tu8xgu1f.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Jun 2022 18:30:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUeRtBYp_B_EKd4UkVoUQeOqwAuBCdSeaiiFJdhYS6_nQ@mail.gmail.com>
Message-ID: <CAMuHMdUeRtBYp_B_EKd4UkVoUQeOqwAuBCdSeaiiFJdhYS6_nQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] pinctrl: renesas: r8a779g0: Add pins, groups and functions
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Morimoto-san,

On Tue, Jun 7, 2022 at 3:08 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Phong Hoang <phong.hoang.wz@renesas.com>
>
> This patch adds SCIF, I2C, EthernetAVB, HSCIF, MMC, QSPI,
> MSIOF, PWM, CAN-FD, Ethernet-TSN, PCIe pins, groups, and functions
>
> [Morimoto merged above patches into one]
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> Signed-off-by: CongDang <cong.dang.xn@renesas.com>
> Signed-off-by: Kazuya Mizuguch <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Tho Vu <tho.vu.wh@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c

> +/* - CANFD5 ----------------------------------------------------------------- */
> +static const unsigned int canfd5_data_pins[] = {
> +       /* CANFD5_TX, CANFD5_RX */
> +       RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
> +};
> +static const unsigned int canfd5_data_mux[] = {
> +       CANFD5_TX_MARK, CANFD5_RX_MARK,
> +};

Missing CANFD5 B on GP1_[89].

> +/* - HSCIF1 ----------------------------------------------------------------- */
> +static const unsigned int hscif1_data_pins[] = {
> +       /* HRX1, HTX1 */
> +       RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 14),
> +};
> +static const unsigned int hscif1_data_mux[] = {
> +       HRX1_MARK, HTX1_MARK,
> +};
> +static const unsigned int hscif1_clk_pins[] = {
> +       /* HSCK1 */
> +       RCAR_GP_PIN(0, 18),
> +};
> +static const unsigned int hscif1_clk_mux[] = {
> +       HSCK1_MARK,
> +};
> +static const unsigned int hscif1_ctrl_pins[] = {
> +       /* HRTS1#, HCTS1# */
> +       RCAR_GP_PIN(0, 17), RCAR_GP_PIN(0, 16),
> +};
> +static const unsigned int hscif1_ctrl_mux[] = {
> +       HRTS1_N_MARK, HCTS1_N_MARK,
> +};

Missing alternative set on GP1_{0[6-7],10}.
How to name it? The CANFD5 alternative set is called "B", the HSCIF3
alternative set is called "A"?

> +/* - HSCIF3 ----------------------------------------------------------------- */
> +static const unsigned int hscif3_data_pins[] = {
> +       /* HRX3, HTX3 */
> +       RCAR_GP_PIN(1, 24), RCAR_GP_PIN(1, 28),
> +};
> +static const unsigned int hscif3_data_mux[] = {
> +       HRX3_MARK, HTX3_MARK,
> +};
> +static const unsigned int hscif3_clk_pins[] = {
> +       /* HSCK3 */
> +       RCAR_GP_PIN(1, 25),
> +};
> +static const unsigned int hscif3_clk_mux[] = {
> +       HSCK3_MARK,
> +};
> +static const unsigned int hscif3_ctrl_pins[] = {
> +       /* HRTS3#, HCTS3# */
> +       RCAR_GP_PIN(1, 26), RCAR_GP_PIN(1, 27),
> +};
> +static const unsigned int hscif3_ctrl_mux[] = {
> +       HRTS3_N_MARK, HCTS3_N_MARK,
> +};

Missing HSCIF3 A on GP1_0[0-4].

> +static const unsigned int mmc_ds_mux[] = {
> +       MMC_DS_MARK,
> +};
> +
> +/* - QSPI0 ------------------------------------------------------------------ */

General comment (also applies below): please sort modules
alphabetically.

[...]

> +/* - MSIOF0 ----------------------------------------------------------------- */

> +/* - MSIOF2 ----------------------------------------------------------------- */
> +static const unsigned int msiof2_clk_pins[] = {
> +       /* MSIOF2_SCK */
> +       RCAR_GP_PIN(0, 17),
> +};
> +static const unsigned int msiof2_clk_mux[] = {
> +       MSIOF2_SCK_MARK,
> +};
> +static const unsigned int msiof2_sync_pins[] = {
> +       /* MSIOF2_SYNC */
> +       RCAR_GP_PIN(0, 15),
> +};
> +static const unsigned int msiof2_sync_mux[] = {
> +       MSIOF2_SYNC_MARK,
> +};
> +static const unsigned int msiof2_ss1_pins[] = {
> +       /* MSIOF2_SS1 */
> +       RCAR_GP_PIN(0, 14),
> +};
> +static const unsigned int msiof2_ss1_mux[] = {
> +       MSIOF2_SS1_MARK,
> +};
> +static const unsigned int msiof2_ss2_pins[] = {
> +       /* MSIOF1_SS2 */

MSIOF2_SS2

> +       RCAR_GP_PIN(0, 13),
> +};
> +static const unsigned int msiof2_ss2_mux[] = {
> +       MSIOF2_SS2_MARK,
> +};
> +static const unsigned int msiof2_txd_pins[] = {
> +       /* MSIOF1_TXD */

MSIOF2_TXD

> +       RCAR_GP_PIN(0, 16),
> +};
> +static const unsigned int msiof2_txd_mux[] = {
> +       MSIOF2_TXD_MARK,
> +};
> +static const unsigned int msiof2_rxd_pins[] = {
> +       /* MSIOF1_RXD */

MSIOF2_RXD

> +       RCAR_GP_PIN(0, 18),
> +};
> +static const unsigned int msiof2_rxd_mux[] = {
> +       MSIOF2_RXD_MARK,
> +};

> +/* - PWM0 ------------------------------------------------------------------- */
> +static const unsigned int pwm0_pins[] = {
> +       /* PWM0 */
> +       RCAR_GP_PIN(1, 15),

How confusing, the datasheet calls this PWM0_A, but there is no PWM0_B.

> +};
> +static const unsigned int pwm0_mux[] = {
> +       PWM0_MARK,
> +};
> +
> +/* - PWM1 ------------------------------------------------------------------- */
> +static const unsigned int pwm1_pins[] = {
> +       /* PWM1 */
> +       RCAR_GP_PIN(2, 13),

This is PWM1_B, and PWM1_A is on GP3_13.

> +};
> +static const unsigned int pwm1_mux[] = {
> +       PWM1_MARK,
> +};
> +
> +/* - PWM2 ------------------------------------------------------------------- */
> +static const unsigned int pwm2_pins[] = {
> +       /* PWM2 */
> +       RCAR_GP_PIN(2, 14),

This is PWM2_B, and PWM2_A is on GP3_14.

> +};
> +static const unsigned int pwm2_mux[] = {
> +       PWM2_MARK,
> +};
> +
> +/* - PWM3 ------------------------------------------------------------------- */
> +static const unsigned int pwm3_pins[] = {
> +       /* PWM3 */
> +       RCAR_GP_PIN(1, 22),

This is PWM3_A, and PWM3_B is on GP2_15.

> +};
> +static const unsigned int pwm3_mux[] = {
> +       PWM3_MARK,
> +};
> +
> +/* - PWM4 ------------------------------------------------------------------- */
> +static const unsigned int pwm4_pins[] = {
> +       /* PWM4 */
> +       RCAR_GP_PIN(2, 16),
> +};
> +static const unsigned int pwm4_mux[] = {
> +       PWM4_MARK,
> +};
> +
> +/* - PWM5 ------------------------------------------------------------------- */
> +static const unsigned int pwm5_pins[] = {
> +       /* PWM5 */
> +       RCAR_GP_PIN(2, 17),
> +};
> +static const unsigned int pwm5_mux[] = {
> +       PWM5_MARK,
> +};
> +
> +/* - PWM6 ------------------------------------------------------------------- */
> +static const unsigned int pwm6_pins[] = {
> +       /* PWM6 */
> +       RCAR_GP_PIN(2, 18),
> +};
> +static const unsigned int pwm6_mux[] = {
> +       PWM6_MARK,
> +};
> +
> +/* - PWM7 ------------------------------------------------------------------- */
> +static const unsigned int pwm7_pins[] = {
> +       /* PWM7 */
> +       RCAR_GP_PIN(2, 19),
> +};
> +static const unsigned int pwm7_mux[] = {
> +       PWM7_MARK,
> +};
> +
> +/* - PWM8 ------------------------------------------------------------------- */
> +static const unsigned int pwm8_pins[] = {
> +       /* PWM8 */
> +       RCAR_GP_PIN(1, 13),

The datasheet calls this PWM8_A (but there is no PWM8_B?).

> +};
> +static const unsigned int pwm8_mux[] = {
> +       PWM8_MARK,
> +};
> +
> +/* - PWM9 ------------------------------------------------------------------- */
> +static const unsigned int pwm9_pins[] = {
> +       /* PWM9 */
> +       RCAR_GP_PIN(1, 14),

The datasheet calls this PWM9_A (but there is no PWM9_B?).

> +};
> +static const unsigned int pwm9_mux[] = {
> +       PWM9_MARK,
> +};
> +
> +/* - TSN0 ------------------------------------------------ */
> +static const unsigned int tsn0_link_pins[] = {
> +       /* TSN0_LINK */
> +       RCAR_GP_PIN(4, 4),
> +};
> +static const unsigned int tsn0_link_mux[] = {
> +       TSN0_LINK_MARK,
> +};
> +static const unsigned int tsn0_phy_int_pins[] = {
> +       /* TSN0_PHY_INT */
> +       RCAR_GP_PIN(4, 3),
> +};
> +static const unsigned int tsn0_phy_int_mux[] = {
> +       TSN0_PHY_INT_MARK,
> +};
> +static const unsigned int tsn0_mdio_pins[] = {
> +       /* TSN0_MDC, TSN0_MDIO */
> +       RCAR_GP_PIN(4, 1), RCAR_GP_PIN(4, 0),
> +};
> +static const unsigned int tsn0_mdio_mux[] = {
> +       TSN0_MDC_MARK, TSN0_MDIO_MARK,
> +};
> +static const unsigned int tsn0_rgmii_pins[] = {
> +       /*
> +        * TSN0_TX_CTL, TSN0_TXC, TSN0_TD0, TSN0_TD1, TSN0_TD2, TSN0_TD3,
> +        * TSN0_RX_CTL, TSN0_RXC, TSN0_RD0, TSN0_RD1, TSN0_RD2, TSN0_RD3,
> +        */
> +       RCAR_GP_PIN(4,  9), RCAR_GP_PIN(4, 12),
> +       RCAR_GP_PIN(4, 15), RCAR_GP_PIN(4, 14),
> +       RCAR_GP_PIN(4, 19), RCAR_GP_PIN(4, 18),
> +       RCAR_GP_PIN(4,  7), RCAR_GP_PIN(4, 11),
> +       RCAR_GP_PIN(4, 10), RCAR_GP_PIN(4, 13),
> +       RCAR_GP_PIN(4, 17), RCAR_GP_PIN(4, 16),
> +};
> +static const unsigned int tsn0_rgmii_mux[] = {
> +       TSN0_TX_CTL_MARK,       TSN0_TXC_MARK,
> +       TSN0_TD0_MARK,          TSN0_TD1_MARK,
> +       TSN0_TD2_MARK,          TSN0_TD3_MARK,
> +       TSN0_RX_CTL_MARK,       TSN0_RXC_MARK,
> +       TSN0_RD0_MARK,          TSN0_RD1_MARK,
> +       TSN0_RD2_MARK,          TSN0_RD3_MARK,
> +};
> +static const unsigned int tsn0_txcrefclk_pins[] = {
> +       /* TSN0_TXCREFCLK */
> +       RCAR_GP_PIN(4, 20),
> +};
> +static const unsigned int tsn0_txcrefclk_mux[] = {
> +       TSN0_TXCREFCLK_MARK,
> +};
> +static const unsigned int tsn0_avtp_pps_pins[] = {
> +       /* TSN0_AVTP_PPS0, TSN0_AVTP_PPS1 */
> +       RCAR_GP_PIN(4, 8), RCAR_GP_PIN(4, 2),

The documentation is not very clear on how these are to be used.
Is there a use case where you need only one of PPS0 and PPS1?
If yes, this group should be split.

> +};
> +static const unsigned int tsn0_avtp_pps_mux[] = {
> +       TSN0_AVTP_PPS0_MARK, TSN0_AVTP_PPS1_MARK,
> +};
> +static const unsigned int tsn0_avtp_capture_pins[] = {
> +       /* TSN0_AVTP_CAPTURE */
> +       RCAR_GP_PIN(4, 6),
> +};
> +static const unsigned int tsn0_avtp_capture_mux[] = {
> +       TSN0_AVTP_CAPTURE_MARK,
> +};
> +static const unsigned int tsn0_avtp_match_pins[] = {
> +       /* TSN0_AVTP_MATCH */
> +       RCAR_GP_PIN(4, 5),
> +};
> +static const unsigned int tsn0_avtp_match_mux[] = {
> +       TSN0_AVTP_MATCH_MARK,
> +};

Missing blank line.

> +/* - TPU ------------------------------------------------------------------- */
> +static const unsigned int tpu_to0_pins[] = {
> +       /* TPU0TO0 */
> +       RCAR_GP_PIN(2, 8),
> +};
> +static const unsigned int tpu_to0_mux[] = {
> +       TPU0TO0_MARK,
> +};
> +static const unsigned int tpu_to1_pins[] = {
> +       /* TPU0TO1 */
> +       RCAR_GP_PIN(2, 7),
> +};
> +static const unsigned int tpu_to1_mux[] = {
> +       TPU0TO1_MARK,
> +};
> +static const unsigned int tpu_to2_pins[] = {
> +       /* TPU0TO2 */
> +       RCAR_GP_PIN(2, 12),
> +};
> +static const unsigned int tpu_to2_mux[] = {
> +       TPU0TO2_MARK,
> +};
> +static const unsigned int tpu_to3_pins[] = {
> +       /* TPU0TO3 */
> +       RCAR_GP_PIN(2, 13),
> +};
> +static const unsigned int tpu_to3_mux[] = {
> +       TPU0TO3_MARK,
> +};

Missing A pins on GP2_0[01] and GP1_2[56].

> +/* - SCIF1 ------------------------------------------------------------------ */
> +static const unsigned int scif1_data_pins[] = {
> +       /* RX, TX */

RX1, TX1

> +       RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 14),
> +};
> +static const unsigned int scif1_data_mux[] = {
> +       RX1_MARK, TX1_MARK,
> +};
> +static const unsigned int scif1_clk_pins[] = {
> +       /* SCK1 */
> +       RCAR_GP_PIN(0, 18),
> +};
> +static const unsigned int scif1_clk_mux[] = {
> +       SCK1_MARK,
> +};
> +static const unsigned int scif1_ctrl_pins[] = {
> +       /* RTS1#, CTS1# */
> +       RCAR_GP_PIN(0, 17), RCAR_GP_PIN(0, 16),
> +};
> +static const unsigned int scif1_ctrl_mux[] = {
> +       RTS1_N_MARK, CTS1_N_MARK,
> +};

Missing alternative set on GP1_{0[6-7],10}.
> +
> +/* - SCIF3 ------------------------------------------------------------------ */
> +static const unsigned int scif3_data_pins[] = {
> +       /* RX3, TX3 */
> +       RCAR_GP_PIN(1, 1), RCAR_GP_PIN(1, 0),
> +};
> +static const unsigned int scif3_data_mux[] = {
> +       RX3_MARK, TX3_MARK,
> +};
> +static const unsigned int scif3_clk_pins[] = {
> +       /* SCK3 */
> +       RCAR_GP_PIN(1, 4),
> +};
> +static const unsigned int scif3_clk_mux[] = {
> +       SCK3_MARK,
> +};
> +static const unsigned int scif3_ctrl_pins[] = {
> +       /* RTS3#, CTS3# */
> +       RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
> +};
> +static const unsigned int scif3_ctrl_mux[] = {
> +       RTS3_N_MARK, CTS3_N_MARK,
> +};

Missing SCIF3_A on GP1_2[4-8].

> +
> +/* - SCIF4 ------------------------------------------------------------------ */
> +static const unsigned int scif4_data_pins[] = {
> +       /* RX4, TX4 */
> +       RCAR_GP_PIN(8, 13), RCAR_GP_PIN(8, 12),
> +};
> +static const unsigned int scif4_data_mux[] = {
> +       RX4_MARK, TX4_MARK,
> +};
> +static const unsigned int scif4_clk_pins[] = {
> +       /* SCK4 */
> +       RCAR_GP_PIN(8, 8),
> +};
> +static const unsigned int scif4_clk_mux[] = {
> +       SCK4_MARK,
> +};
> +static const unsigned int scif4_ctrl_pins[] = {
> +       /* RTS4#, CTS4# */
> +       RCAR_GP_PIN(8, 10), RCAR_GP_PIN(8, 9),
> +};
> +static const unsigned int scif4_ctrl_mux[] = {
> +       RTS4_N_MARK, CTS4_N_MARK,
> +};
> +
> +/* - SCIF Clock ------------------------------------------------------------- */
> +static const unsigned int scif_clk_pins[] = {
> +       /* SCIF_CLK */
> +       RCAR_GP_PIN(1, 17),
> +};
> +static const unsigned int scif_clk_mux[] = {
> +       SCIF_CLK_MARK,
> +};

Missing SCIF_CLK2 on GP8_11.

> +
>  static const struct sh_pfc_pin_group pinmux_groups[] = {

> +       SH_PFC_PIN_GROUP(msiof5_rxd),
> +
> +       SH_PFC_PIN_GROUP(qspi0_ctrl),
> +       BUS_DATA_PIN_GROUP(qspi0_data, 2),
> +       BUS_DATA_PIN_GROUP(qspi0_data, 4),
> +       SH_PFC_PIN_GROUP(qspi1_ctrl),
> +       BUS_DATA_PIN_GROUP(qspi1_data, 2),
> +       BUS_DATA_PIN_GROUP(qspi1_data, 4),
> +
> +       SH_PFC_PIN_GROUP(pwm0),

Please sort modules alphabetically (more groups and functions
to sort below).

> +       SH_PFC_PIN_GROUP(pwm1),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
