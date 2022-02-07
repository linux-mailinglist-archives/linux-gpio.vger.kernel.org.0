Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE1C4AC1EC
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Feb 2022 15:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233962AbiBGOzz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Feb 2022 09:55:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243347AbiBGOeC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Feb 2022 09:34:02 -0500
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51DA8C0401C1;
        Mon,  7 Feb 2022 06:34:02 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id d22so4854159uaw.2;
        Mon, 07 Feb 2022 06:34:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uHMf/afAoztPucTkA6ZDQ3ZP2SUdh+DTP9NF8vTRtFs=;
        b=YSO5WHusN5OdDlSpMLeufdhU4GwzWHXOLanm/LOi2JqJAcJXJgudBhYHGGTkCr88BQ
         eMvX8FuVD5fWNcxPk6PlmOGJcaQ1gzBWszPmVHvA0y8fibbDrMq5nXxg03zcgTxBiMgp
         SnspP5vPvzJtM5w9b92mA4Co0aSsYSn+CiYa7KhJCqfbTnFySQBOCuUVpqCj9VxVbx2E
         63PElpoxiV+Mv52XrTwYRwmo79TxeHdhAKkf1vRgew6GwQVUHpUT63+4H4w1RFPzuhuG
         OZxiKjA2cHy16YuMMYRxS38ezUMreTSCcGiP0KYB5JUV2T2syn6Cpbl5bR0XeQ7DrZDj
         9CFw==
X-Gm-Message-State: AOAM532G5jAC5Sq2NdjpmWffagvX+shKDtxvhH0snnjeL9NCiG6fUIt7
        M5MMlFCOgjIovxu2evHhBPc+PFLEAIZSKw==
X-Google-Smtp-Source: ABdhPJxqyEyMaAwkRR7kDhZG2sBowEXTgrJJwz8nvdPuciZYJqx2h/i3qSm0ByrRQkOYaWK75W2ziQ==
X-Received: by 2002:ab0:3045:: with SMTP id x5mr3507781ual.17.1644244439933;
        Mon, 07 Feb 2022 06:33:59 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id x64sm2322076vke.40.2022.02.07.06.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 06:33:59 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id v5so12098111uam.3;
        Mon, 07 Feb 2022 06:33:59 -0800 (PST)
X-Received: by 2002:a67:a401:: with SMTP id n1mr4306144vse.38.1644244439218;
 Mon, 07 Feb 2022 06:33:59 -0800 (PST)
MIME-Version: 1.0
References: <20220206194614.13209-1-biju.das.jz@bp.renesas.com> <20220206194614.13209-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220206194614.13209-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Feb 2022 15:33:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWy2aF2hjSQbBtXi0ot2LOutwD0Rm2ecaTExeGhVS73DA@mail.gmail.com>
Message-ID: <CAMuHMdWy2aF2hjSQbBtXi0ot2LOutwD0Rm2ecaTExeGhVS73DA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: renesas: rzg2l: Improve rzg2l_gpio_register()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Sun, Feb 6, 2022 at 8:46 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Update rzg2l_gpio_register() to use driver data for chip->names
> and check for gpio-range. This allows reusing the driver for
> SoC's with different port pin definitions(eg:- RZ/G2UL SoC has
> fewer ports compared to RZ/G2L and port pin definitions are
> different).
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.18.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
