Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D44F565A12
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233345AbiGDPmj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233301AbiGDPmi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:42:38 -0400
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9788011161;
        Mon,  4 Jul 2022 08:42:37 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id bs20so10324487qtb.11;
        Mon, 04 Jul 2022 08:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=64TAw42Pmnx/kZADBfxQYITMQWp/dyoMDdjgFoU428s=;
        b=v8rajXyl4iSbYlK1aGgYfbZiDGtjYRXW2rJUfQud5NFfQt8xOZuhMFrHDoWUYCVV/I
         o+eecA1pWoDLkHpKBilN/dddYINonMP/QmaOk/YUdGbhANuJSyfLZxxXAdBKiQQ5r7ij
         jZ1pkssdQEGS1fG7f1ga2i64dO1G2WmT7XY/n9oerdGSrzsNVAqMni7yhVpMTD4Px8o5
         WEr52IVbsqqafboeOojbjxUxGAbk/rUHwSnkrHtR4i57yrfoR7RWxEitoc9FthJkHdTd
         TAyEI+mdGS+6PpIyJj0ChRyx8HrR2mLWqf+B0uSPb1knNPVAs1EfgDCb4jsYQhmhUbYK
         GeVg==
X-Gm-Message-State: AJIora9BeSQ20tw37Oby041wgui0vYbIrJq9i8WKIWwAQQcpsI+7w4Ek
        swlpPES0K5G6ZYV6OaZmqyEh+gNi+wltuaZ3
X-Google-Smtp-Source: AGRyM1uya+Yq3Z8mzmbQsjNx7nfzjSR/EKfcpTfmHJtrV9ITFMTLWLbinzrD75Q+VQmgGwRanFb81w==
X-Received: by 2002:ad4:5be9:0:b0:470:a252:34fa with SMTP id k9-20020ad45be9000000b00470a25234famr27243562qvc.12.1656949356192;
        Mon, 04 Jul 2022 08:42:36 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id f14-20020a05620a408e00b006a5d2eb58b2sm27543798qko.33.2022.07.04.08.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:42:36 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-31c8340a6f7so44685127b3.4;
        Mon, 04 Jul 2022 08:42:35 -0700 (PDT)
X-Received: by 2002:a81:1090:0:b0:31c:9be5:6c95 with SMTP id
 138-20020a811090000000b0031c9be56c95mr5608991ywq.384.1656949355697; Mon, 04
 Jul 2022 08:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <87bku9ty0b.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bku9ty0b.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:42:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVnB1+48C+N44w=NRfJ0aPYiuUWBu1_ycrAhjCaHGXqfw@mail.gmail.com>
Message-ID: <CAMuHMdVnB1+48C+N44w=NRfJ0aPYiuUWBu1_ycrAhjCaHGXqfw@mail.gmail.com>
Subject: Re: [PATCH v4 04/23] pinctrl: renesas: r8a779g0: Add pins, groups and functions
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
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

On Fri, Jul 1, 2022 at 3:36 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Phong Hoang <phong.hoang.wz@renesas.com>
>
> This patch adds SCIF, I2C, EthernetAVB, HSCIF, MMC, QSPI,
> MSIOF, PWM, CAN-FD, Ethernet-TSN, PCIe pins, groups, and functions
>
> [This patch was created based on Rev.0.51 datasheet]
> [Morimoto merged above patches into one, cleanup white space,
>  sort modules alphabetically, fixup comments]
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> Signed-off-by: CongDang <cong.dang.xn@renesas.com>
> Signed-off-by: Kazuya Mizuguch <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Tho Vu <tho.vu.wh@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
