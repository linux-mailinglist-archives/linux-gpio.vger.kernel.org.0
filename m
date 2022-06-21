Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62D44552B0E
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jun 2022 08:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344171AbiFUGhM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jun 2022 02:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242106AbiFUGhL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jun 2022 02:37:11 -0400
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D264193F8;
        Mon, 20 Jun 2022 23:37:10 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id o73so9362814qke.7;
        Mon, 20 Jun 2022 23:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VuRgP6aC8spFcsTB2boTGraadu1JcWeDwC1bw6V+Hq8=;
        b=eScEb7J2K97futC1gHOC2IUE2viGEnKmu+eTL216uZsOscmTmYHJK3daPSXuv8aFXE
         x02jg1wP7eLvA2y5Egu4LB5QvOw6dXN9vRAxuTrxFAmkXNS7zpAK8KBdYaCrQqw1Um89
         ZOGj7NMtejK7+Y7nN+xD2aWd0oGg19uFjab4CfOCOymSZw+cVSlM//Y5r86cMH0nIzhU
         zcsBrM6BNOKNFIYeV1ghHE6AVGX7WtRbkkjfNLkOY7dPdaBKmJKKXNwq1KjpvRsgI0Lo
         toicmkgJJ6BWghLDTzuMrLzxLsZUfe5WFCU558s1OnX8kaMWojdQ7ZsUuA8uTcNmY4r4
         5ijA==
X-Gm-Message-State: AJIora+blaPAOcrqOwA7QXTWX18kEwTj6NJCqxhyzwxxgtKeB+rKCc7W
        m8hPT6WeUZmLAGThZJM96nsXrXQHieIEkg==
X-Google-Smtp-Source: AGRyM1vhQsEc5zLCbC5j9tsGuaWyRpcfDwdR/mF3pVxce/+PWpSXUVR4paug2rjtDF7gsppzYvvqDQ==
X-Received: by 2002:a05:620a:4107:b0:6a6:e13e:5b84 with SMTP id j7-20020a05620a410700b006a6e13e5b84mr19671996qko.24.1655793429606;
        Mon, 20 Jun 2022 23:37:09 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id d7-20020ac86687000000b00304e47b9602sm11778102qtp.9.2022.06.20.23.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 23:37:09 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-3177f4ce3e2so97050097b3.5;
        Mon, 20 Jun 2022 23:37:09 -0700 (PDT)
X-Received: by 2002:a81:7c1:0:b0:317:897d:ea90 with SMTP id
 184-20020a8107c1000000b00317897dea90mr5012151ywh.283.1655793428952; Mon, 20
 Jun 2022 23:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
 <87tu8nkcp7.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdVV6z-nCTvJyG_TV3Dj65QU8K=x85JAKDStQVnP3edO3w@mail.gmail.com>
 <87czf2ub6f.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87czf2ub6f.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 21 Jun 2022 08:36:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGbDXCypVNWDU0mC29K0AuXvwL+zzCtvr5Ngxtj1n08w@mail.gmail.com>
Message-ID: <CAMuHMdWGbDXCypVNWDU0mC29K0AuXvwL+zzCtvr5Ngxtj1n08w@mail.gmail.com>
Subject: Re: [PATCH v3 07/21] pinctrl: renesas: r8a779g0: remove not used
 MOD_SELx definitions
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

On Tue, Jun 21, 2022 at 2:12 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > Current V4H PFC code has many MOD_SELx definitions with all 0.
> > > But these have no meaning. This patch removes these, but keep
> > > its definition to avoid unreadable PINMUX_MOD_SELS.
> >
> > You can just replace them with blanks, keeping the structure of the
> > PINMUX_MOD_SELS table alive.
>
> Sorry, but I don't understand this. Maybe "blanks" and "alive".

blanks = TABs, i.e. a hole in the table structure
perhaps s/alive/intact/?

> Do you mean
> 1) "remove unnecessary MOD_SELx, and update PINMUX_MOD_SELS table"
>    (= need update on v4)
>
> or
>
> 2) "use NULL #define, and keep PINMUX_MOD_SELS" (= no update on v4)

I meant 1).

E.g.

-#define MOD_SEL7_1

and

-MOD_SEL4_1             MOD_SEL5_1              MOD_SEL6_1
 MOD_SEL7_1              MOD_SEL8_1      \
+MOD_SEL4_1             MOD_SEL5_1              MOD_SEL6_1
                         MOD_SEL8_1      \

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
