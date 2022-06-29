Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59CA155F8B1
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 09:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbiF2HQt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 03:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231381AbiF2HQq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 03:16:46 -0400
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF96338A4;
        Wed, 29 Jun 2022 00:16:45 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id b133so11398103qkc.6;
        Wed, 29 Jun 2022 00:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QHnTw+1dh39iLHqR9tM/upSF9rPKTfu4pJ0mDQbSipM=;
        b=bJBiHgnxN3gFCdJ0nMSn0I8Gbgmzz/I65rE6Ss1RW2tgA6wwcZb65OXBRYzMvYH8in
         Xf5d7oEazg+Y6lTPhsT8V6aSOaMZhpi3bdLAd5xi9p1GOGulPVAqSngKfB+HH0jWINnw
         BLyrtplFe9BeZdLvpAL1HTDKGUBfMP6oZDrcL0VPiHB2EmAtvL62hBjltlhvYXmnSGpo
         At0xqdHqIeLtq/1d4KW3AKFqZmuQpNQAxtc3NFtgKjDVuHxZ7Lx8z4zruSEOKrXnV3nx
         CO37PC6FV1hUFm/dyUQTGkZ2ZUNqd01V30bYY1GT+DX0OQq+hN47IGhpmq87KntNAvO7
         wl6w==
X-Gm-Message-State: AJIora+CvGDkEOflQ9eN6JmvwGjg2l8TeViatHLthh4fOm7ReN6sIkKN
        80nzc5nsyBZsFfNiRtsQQRen93s6IY0wZA==
X-Google-Smtp-Source: AGRyM1sn/xFg4j+kAILXah5nPATN/CoZ7OOZ9YSfbXZHkAmUj2K+WErd2Xc1mIwBrDG5FJ9jdCIo/Q==
X-Received: by 2002:a05:620a:294a:b0:6ae:fb7f:831 with SMTP id n10-20020a05620a294a00b006aefb7f0831mr1004462qkp.130.1656487004135;
        Wed, 29 Jun 2022 00:16:44 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id s12-20020a05620a29cc00b006a36b0d7f27sm13510541qkp.76.2022.06.29.00.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 00:16:43 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id q132so26304148ybg.10;
        Wed, 29 Jun 2022 00:16:43 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr1776911ybq.543.1656487003120; Wed, 29
 Jun 2022 00:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
 <87r13rkcos.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdVVPN-dhnjw1y7WqQJjZNO-YG8PjaFjmCvawMAhZJJLsA@mail.gmail.com>
 <87r138jm3r.wl-kuninori.morimoto.gx@renesas.com> <87k090ji9t.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87k090ji9t.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 29 Jun 2022 09:16:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWPWzhBoDeTR-ueS9Y9sBVWx_zUAM+6b168Tb8LYcGxcg@mail.gmail.com>
Message-ID: <CAMuHMdWPWzhBoDeTR-ueS9Y9sBVWx_zUAM+6b168Tb8LYcGxcg@mail.gmail.com>
Subject: Re: [PATCH v3 09/21] pinctrl: renesas: r8a779g0: add missing TCLKx_A/TCLK_B/TCLKx_X
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

On Wed, Jun 29, 2022 at 4:49 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > LGTM, but as the suffixes become part of the DT ABI when defining
> > > pin groups, we should get the conflicts resolved, and this cannot
> > > be applied as-is.
> >
> > It seems HW team / Doc team are now fixuping suffixes.
> > I think I need to use new Doc for v4.
>
> We don't know when new Doc comming,
> and I don't think there is someone who will get DT naming exchange issue for now
> (Because no uses).
>
> So, I'm happy if you can accept my next v4 patch-set (suffix is still using _X).
> and I'm happy to post new incremental patch which is for
> "update PFC to adjust to latest Datasheet" in such case.

My worry is not about the group of pins marked _X, but about its
siblings without _X.  E.g. your patches have SCIF1 and SCIF1_X,
but we do not know yet if SCIF1 should be renamed, too.

I agree it is unlikely to become an issue with TCLK soon, but (H)SCIF1
are more likely to become enabled, also on real products.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
