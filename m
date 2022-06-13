Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBE8E549BF8
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jun 2022 20:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245730AbiFMSoW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jun 2022 14:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346500AbiFMSnt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2022 14:43:49 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB05EDFD37;
        Mon, 13 Jun 2022 08:19:13 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id 15so4246930qki.6;
        Mon, 13 Jun 2022 08:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LcgDoi8Ks07zUpb/ZR8TTydtN5e8nq+lNn0ycM26yjg=;
        b=gZXI7jpai/YTdNRT3Ksr92tqPDqA9F/ajvyabGggCIAyEVauyRZqcXL6MeyG1Vbc2H
         azC7d0UjS+6PqPjlO2Jpc79vew/MFi0NsBx6vhQQwRaymW1FdhWgfQbLXr9tE/dKNYtG
         R6K0T5BRJyrCU/XG4Q44CVmiKu7JyGar2WbE4hstre0qiXBrAkyClhfOV6Qq2WdmZpNA
         pE5fVHAkFab7eHE6O8gZ3WdXZITL2p/oYPUhTz17JKAmSsICWzgevE1TwueolPeIZie+
         xxRXCSNEj4AM3kixoso7urRJ7sz9MAESDMbCC6xzbm1w2MCeuDD2JjFe+xKSxk9ctXEE
         67iw==
X-Gm-Message-State: AOAM531bA8rEGmVyxMnfN50FH8Mt9ia5jGW4RKk0xaMtEAjsmWktUrc2
        pRaIA998cVAUeKVR60tQa4v9O7OOeJevsQ==
X-Google-Smtp-Source: ABdhPJw6KfdrKkB2U5sttUmCqFYOXPRMrmUqGIEgCVcU2flYNvhHzHJSJT8h8I9ac8zd12PZmJHpGQ==
X-Received: by 2002:ae9:f405:0:b0:6a7:1892:8603 with SMTP id y5-20020ae9f405000000b006a718928603mr337044qkl.293.1655133552655;
        Mon, 13 Jun 2022 08:19:12 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id n7-20020a37a407000000b006a66f3d3708sm6500542qke.129.2022.06.13.08.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jun 2022 08:19:12 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id l204so10372485ybf.10;
        Mon, 13 Jun 2022 08:19:12 -0700 (PDT)
X-Received: by 2002:a25:cc53:0:b0:65c:b19c:fac1 with SMTP id
 l80-20020a25cc53000000b0065cb19cfac1mr68276ybf.89.1655133551763; Mon, 13 Jun
 2022 08:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <87zgipgu3s.wl-kuninori.morimoto.gx@renesas.com>
 <87v8tdgu1t.wl-kuninori.morimoto.gx@renesas.com> <alpine.DEB.2.22.394.2206101756520.828669@ramsan.of.borg>
 <877d5l1lv9.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877d5l1lv9.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Jun 2022 17:18:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWUeynL0YSV4Qr25TymN49guTHLwVe2UgtFcHeyjJvvVg@mail.gmail.com>
Message-ID: <CAMuHMdWUeynL0YSV4Qr25TymN49guTHLwVe2UgtFcHeyjJvvVg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] pinctrl: renesas: Initial R8A779G0 (V4H) PFC support
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

On Mon, Jun 13, 2022 at 1:51 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > From: LUU HOAI <hoai.luu.ub@renesas.com>
> > >
> > > This patch adds initial pinctrl support for the R8A779G0 (V4H) SoC,
> > > including bias, drive strength and voltage control.
> > >
> > > [Morimoto merged Kihara-san's MODSEL8 fixup patch,
> > > and cleanuped white space, care reserved bit on each configs,
> > > fixup setting miss]
> > > Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> > > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >
> > Thanks for your patch!
> >
> > Below is a first set of comments.
> > You can expect a second set of comments after the weekend.
>
> May I suggest ?
>
> v1 patch was almost as-is of working implementation,
> I did was just cleanup.
> v2 patch was tidyup implementation which found via runtime.
> So far, I think we can say "v2 patch is cleanup version of working implementation".
>
> But, v3 needs too many tidyups, and it is related to very deep parts.
> I'm very afraid it breaks working implementation for some reasons.
> In such case, it is very difficult to find and/or fix the issue
> because PFC file is too big and too complicated.
>
> I'm happy to fix all of you pointed, but I want to make it as additional patch.
> But what do you think ?

For missing features (e.g. missing alternative functions, missing
support for using I2C-capable pins as GPIOs, ...) I agree: these can
be added incrementally.

For descriptions that are wrong, I disagree: please try to fix them
in the patch that introduces them, if possible.
This is especially true for descriptions that become user-visible:
e.g. set names (no suffix vs. "_A" vs. "_B" suffixes) become DT ABI
once their pin groups have been defined.

Unfortunately some of the (lack of) set names need confirmation or
clarification from the hardware documentation team.

BTW, do you know which devices and pin groups have been tested on
actual hardware?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
