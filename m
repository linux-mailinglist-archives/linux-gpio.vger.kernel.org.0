Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9983454F9F4
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 17:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383108AbiFQPQO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 11:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383088AbiFQPQN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 11:16:13 -0400
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C65736697;
        Fri, 17 Jun 2022 08:16:12 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id c83so3361418qke.3;
        Fri, 17 Jun 2022 08:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H2aPop2eqzNTk3EUJRAS6kgGgK8VlPzdN8ZiM4Zd598=;
        b=QlBfeJ2VUxKqjIEJTzuMltn9jsnZp6eM9ae2dOIVGWPIVprQyzpi2Q8t7Lr8Qa8nr1
         euzt/ACfIl+R8vdwYKmvULqr4ayghuS6Q5+ABdrjU57q/0QWIXLyREOc6A9b5qYOZOA5
         fns3ImKX5wJ66Mc35DUhtOxJOZQaRqNtuTIt9UleL+49boZ2cqBzLUiwNDs9CrOGLG8A
         QImx0XDxVuk2wTfxYOwob/ILrWuvc9eoweXYFz8xEyCP67fu3vV0DLHFdbI88VsUSChM
         QLIALD0NLx/jbe6567hfrJUvVx59uq+E3cCvMVtoT9DuihrKOyhDbiXaCxHw40fSaPzH
         jBaA==
X-Gm-Message-State: AJIora9qFFfY3PKMLr58+8ecaDnQU9E0A/yjLWPV8Au/UkUHpibCxr8o
        A9ZWNGy5/DzDlPOcrxlbo/S5L/vh1UDHAQ==
X-Google-Smtp-Source: AGRyM1uTW7QfAzNCAaqfEyg8rUGoRPRhTHj9HA+RadLV3/M1SiRNfuyzShKkUjHUkFQ2OD9rqIBM5Q==
X-Received: by 2002:a05:620a:288c:b0:6a7:9d8c:a8a1 with SMTP id j12-20020a05620a288c00b006a79d8ca8a1mr7463994qkp.199.1655478971075;
        Fri, 17 Jun 2022 08:16:11 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id t10-20020a37ea0a000000b006a8b6848556sm4669326qkj.7.2022.06.17.08.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 08:16:10 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id n144so3724473ybf.12;
        Fri, 17 Jun 2022 08:16:10 -0700 (PDT)
X-Received: by 2002:a25:818c:0:b0:664:a584:fafd with SMTP id
 p12-20020a25818c000000b00664a584fafdmr11150422ybk.543.1655478970399; Fri, 17
 Jun 2022 08:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com> <87y1xzkcq0.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y1xzkcq0.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 17:15:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXit_47qroQzxDm+R8gzKEgOgH70XhDb9ngYD0zkt0K9g@mail.gmail.com>
Message-ID: <CAMuHMdXit_47qroQzxDm+R8gzKEgOgH70XhDb9ngYD0zkt0K9g@mail.gmail.com>
Subject: Re: [PATCH v3 04/21] pinctrl: renesas: r8a779g0: Add pins, groups and functions
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

On Tue, Jun 14, 2022 at 7:58 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Phong Hoang <phong.hoang.wz@renesas.com>
>
> This patch adds SCIF, I2C, EthernetAVB, HSCIF, MMC, QSPI,
> MSIOF, PWM, CAN-FD, Ethernet-TSN, PCIe pins, groups, and functions
>
> [Morimoto merged above patches into one, cleanup white space,
>  sort modules alphabetically, fixup comments]
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

> +/* - SCIF0 ------------------------------------------------------------------ */
> +static const unsigned int scif0_data_pins[] = {
> +       /* RX0, TX0 */
> +       RCAR_GP_PIN(1, 16), RCAR_GP_PIN(1, 12),
> +};
> +static const unsigned int scif0_data_mux[] = {
> +       RX0_MARK, TX0_MARK,
> +};
> +static const unsigned int scif0_clk_pins[] = {
> +       /* SCK0 */
> +       RCAR_GP_PIN(1, 15),
> +};
> +static const unsigned int scif0_clk_mux[] = {
> +       SCK0_MARK,
> +};
> +static const unsigned int scif0_ctrl_pins[] = {
> +       /* RTS0#, CTS0# */
> +       RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 13),
> +};
> +static const unsigned int scif0_ctrl_mux[] = {
> +       RTS0_N_MARK, CTS0_N_MARK,
> +};
> +
> +/* - SCIF1 ------------------------------------------------------------------ */
> +static const unsigned int scif1_data_pins[] = {
> +       /* RX1, TX1 */
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
> +       /* RTS1_N, CTS1_N */

Compared to v2, you changed:

    -+      /* RTS1#, CTS1# */
    ++      /* RTS1_N, CTS1_N */

(same for SCIF3).

While this makes sense, as all but the *_pins[] comments use "_N"
instead of "#", it does make SCIF1/SCIF3 inconsistent with the other
(H)SCIF ports, here and in later patches.


> +       RCAR_GP_PIN(0, 17), RCAR_GP_PIN(0, 16),
> +};
> +static const unsigned int scif1_ctrl_mux[] = {
> +       RTS1_N_MARK, CTS1_N_MARK,
> +};
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
> +       /* RTS3_N, CTS3_N */
> +       RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
> +};
> +static const unsigned int scif3_ctrl_mux[] = {
> +       RTS3_N_MARK, CTS3_N_MARK,
> +};
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

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
