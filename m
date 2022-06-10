Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4E155469D8
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jun 2022 17:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349434AbiFJPxi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jun 2022 11:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349547AbiFJPx2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jun 2022 11:53:28 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E1227B04;
        Fri, 10 Jun 2022 08:53:27 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id j8so16862116qtn.13;
        Fri, 10 Jun 2022 08:53:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QIQPQERQ4h6a/mn0vM41vP5nYn79+EtRah0A94Bw7/M=;
        b=m4au56NhtX1V8/WpLoCXHOkubotlDE1azvcVe0dFcKRLjD9Pavlk+z0gRD5vMOKgbn
         64oTkecbGm7CmuPzt6p6IK3vRxfAsZni7xcDJuGcbved5JuzPGlbmtPbw3XWGBJSfyMQ
         ima8mv2b07bAVjZzC0fSPccw0v2TySRs899KT98pgWvwiIusLXH/tPDiLjNTjL8sJnGV
         lIATsZMdg7O6zaLgTdWJhfy268x1PR88UWgj+SQZ/BRlOoT/Q8HZ92Pg8N5rNTnDvk/S
         hqjqfyKWip52UoFZ5oKc83slRnxnnL7Xia432OJnyalbDk/adAvkMRGwgaPjhQRdvlVA
         Bw5g==
X-Gm-Message-State: AOAM5319I4VFXM79ZNuRZphKBYky+z6OaefymMuN9ZPKRz8VXx+46ZP2
        QQmZfY9s8VMLa4ad1qwv20DHqmvFEfdzHA==
X-Google-Smtp-Source: ABdhPJxnBwF06xaV0CKrocVgoSe1Tp8d+A1w2mj+LtTl5OtpEHkabpI3uHzGr8T7ZEoCn51qVxCuaA==
X-Received: by 2002:ac8:5e4d:0:b0:304:e82f:9423 with SMTP id i13-20020ac85e4d000000b00304e82f9423mr25874096qtx.173.1654876406643;
        Fri, 10 Jun 2022 08:53:26 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id t69-20020a374648000000b006a71c420460sm5429694qka.22.2022.06.10.08.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 08:53:26 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id w2so47673236ybi.7;
        Fri, 10 Jun 2022 08:53:26 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr46738024ybu.604.1654876406072; Fri, 10
 Jun 2022 08:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <87zgipgu3s.wl-kuninori.morimoto.gx@renesas.com> <87tu8xgu1f.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tu8xgu1f.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 Jun 2022 17:53:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0EsXBRmv36=UFWUetKvUeK6MAUj8zPO9AKdocTcW6Eg@mail.gmail.com>
Message-ID: <CAMuHMdU0EsXBRmv36=UFWUetKvUeK6MAUj8zPO9AKdocTcW6Eg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] pinctrl: renesas: r8a779g0: Add pins, groups and functions
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
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
> ---
>  drivers/pinctrl/renesas/pfc-r8a779g0.c | 1619 +++++++++++++++++++++++-
>  1 file changed, 1618 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
> index 0f4a84283ee8..3a484638038a 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
> @@ -1212,12 +1212,1629 @@ static const struct sh_pfc_pin pinmux_pins[] = {
>         PINMUX_GPIO_GP_ALL(),
>  };
>
> +/* - AVB0 ------------------------------------------------ */
> +static const unsigned int avb0_link_pins[] = {
> +       /* AVB0_LINK */
> +       RCAR_GP_PIN(7, 4),
> +};
> +static const unsigned int avb0_link_mux[] = {
> +       AVB0_LINK_MARK,
> +};
> +static const unsigned int avb0_magic_pins[] = {
> +       /* AVB0_MAGIC */
> +       RCAR_GP_PIN(7, 10),
> +};
> +static const unsigned int avb0_magic_mux[] = {
> +       AVB0_MAGIC_MARK,
> +};
> +static const unsigned int avb0_phy_int_pins[] = {
> +       /* AVB0_PHY_INT */
> +       RCAR_GP_PIN(7, 5),
> +};
> +static const unsigned int avb0_phy_int_mux[] = {
> +       AVB0_PHY_INT_MARK,
> +};
> +static const unsigned int avb0_mdio_pins[] = {
> +       /* AVB0_MDC, AVB0_MDIO */
> +       RCAR_GP_PIN(7, 13), RCAR_GP_PIN(7, 14),
> +};
> +static const unsigned int avb0_mdio_mux[] = {
> +       AVB0_MDC_MARK, AVB0_MDIO_MARK,
> +};
> +static const unsigned int avb0_rgmii_pins[] = {
> +       /*
> +        * AVB0_TX_CTL, AVB0_TXC, AVB0_TD0, AVB0_TD1, AVB0_TD2, AVB0_TD3,
> +        * AVB0_RX_CTL, AVB0_RXC, AVB0_RD0, AVB0_RD1, AVB0_RD2, AVB0_RD3,
> +        */
> +       RCAR_GP_PIN(7, 16), RCAR_GP_PIN(7, 15),
> +       RCAR_GP_PIN(7, 11), RCAR_GP_PIN(7,  7),
> +       RCAR_GP_PIN(7,  6), RCAR_GP_PIN(7,  3),
> +       RCAR_GP_PIN(7, 20), RCAR_GP_PIN(7, 19),
> +       RCAR_GP_PIN(7, 18), RCAR_GP_PIN(7, 17),
> +       RCAR_GP_PIN(7, 12), RCAR_GP_PIN(7,  8),
> +};
> +static const unsigned int avb0_rgmii_mux[] = {
> +       AVB0_TX_CTL_MARK,       AVB0_TXC_MARK,
> +       AVB0_TD0_MARK,          AVB0_TD1_MARK,
> +       AVB0_TD2_MARK,          AVB0_TD3_MARK,
> +       AVB0_RX_CTL_MARK,       AVB0_RXC_MARK,
> +       AVB0_RD0_MARK,          AVB0_RD1_MARK,
> +       AVB0_RD2_MARK,          AVB0_RD3_MARK,
> +};
> +static const unsigned int avb0_txcrefclk_pins[] = {
> +       /* AVB0_TXCREFCLK */
> +       RCAR_GP_PIN(7, 9),
> +};
> +static const unsigned int avb0_txcrefclk_mux[] = {
> +       AVB0_TXCREFCLK_MARK,
> +};
> +static const unsigned int avb0_avtp_pps_pins[] = {
> +       /* AVB0_AVTP_PPS */
> +       RCAR_GP_PIN(7, 0),
> +};
> +static const unsigned int avb0_avtp_pps_mux[] = {
> +       AVB0_AVTP_PPS_MARK,
> +};
> +static const unsigned int avb0_avtp_capture_pins[] = {
> +       /* AVB0_AVTP_CAPTURE */
> +       RCAR_GP_PIN(7, 1),
> +};
> +static const unsigned int avb0_avtp_capture_mux[] = {
> +       AVB0_AVTP_CAPTURE_MARK,
> +};
> +static const unsigned int avb0_avtp_match_pins[] = {
> +       /* AVB0_AVTP_MATCH */
> +       RCAR_GP_PIN(7, 2),
> +};
> +static const unsigned int avb0_avtp_match_mux[] = {
> +       AVB0_AVTP_MATCH_MARK,
> +};

This lacks a set for the RMII pins. The same is true for AVB1.

See e.g. gether_rmii_pins[] on R-Car V3H.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
