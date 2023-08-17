Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 851CC77F81D
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Aug 2023 15:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351542AbjHQNzA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 17 Aug 2023 09:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351590AbjHQNy3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Aug 2023 09:54:29 -0400
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF9302710;
        Thu, 17 Aug 2023 06:54:27 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-584034c706dso83282327b3.1;
        Thu, 17 Aug 2023 06:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692280466; x=1692885266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Od0Qzw7CBtiU5ngMSqBwpqgivet5MGRtCFcKtapRUzU=;
        b=CNpGmdu6PfvvTwK0nwxwCA7N/jPJubFezL5lEi1byTnLs5zjykcOhtdHOQLvRu6bYw
         Tls6HiFMmU+Fn4/VWJuFyG+nr2ybEaiHJ24puH2qhUj8NWpASAUFVFAFPfTcoB/sMadw
         J1Vd1OEMV6QTRyWT7wQ4KfEZ22Xyeklu+du7RxvFLFgTMMXhe51z46j7cMeudnvkGkeu
         EcrouapjYWv6zzcVkP9auvNEByncw7LWICttxVZbpUmSX+WhVVNLkIx/UWNbRsPgjJs8
         n/c4Kh+sa0vY/8peNVKK+p59WKfjYkLPkZ/Oyg3rvAYjutVu+Ss3ZC5RadWA1QPdcVMQ
         62vQ==
X-Gm-Message-State: AOJu0Yxzq81BYMIel3/m/RV2DZpwc4QmA+Cjj88lTg2lfUd24u/cC5uo
        vCNwms8j0027HRPIMrZ5/gkN/BMudyaeHQ==
X-Google-Smtp-Source: AGHT+IHRucCAYbZP7w2ww/R3DvuD/QjArZu+W3O00dzdcSndGXvFCWwvPz2/crOPkTHt54Nh2LLrLw==
X-Received: by 2002:a25:408a:0:b0:d47:3d16:4afc with SMTP id n132-20020a25408a000000b00d473d164afcmr4659553yba.22.1692280466579;
        Thu, 17 Aug 2023 06:54:26 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id l16-20020a25ad50000000b00d4fc4132653sm3999650ybe.11.2023.08.17.06.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 06:54:26 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d7225259f52so1393539276.0;
        Thu, 17 Aug 2023 06:54:25 -0700 (PDT)
X-Received: by 2002:a25:e691:0:b0:d4a:e40f:d446 with SMTP id
 d139-20020a25e691000000b00d4ae40fd446mr4367322ybh.36.1692280465668; Thu, 17
 Aug 2023 06:54:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230815131558.33787-1-biju.das.jz@bp.renesas.com>
 <20230815131558.33787-2-biju.das.jz@bp.renesas.com> <CAMuHMdV852knZ6UoGO-_B=xir=uUJZx2O1CHL+nsK0_BB_hStg@mail.gmail.com>
 <CACRpkdbWT333HNgSc0HMUvgDBkJdEvb23ZSHsQd-yfCOu3N=Ng@mail.gmail.com>
In-Reply-To: <CACRpkdbWT333HNgSc0HMUvgDBkJdEvb23ZSHsQd-yfCOu3N=Ng@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Aug 2023 15:54:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW658cXSAHow3FoZU1DvXioktP68fBK2nQaGGFw0DDmtg@mail.gmail.com>
Message-ID: <CAMuHMdW658cXSAHow3FoZU1DvXioktP68fBK2nQaGGFw0DDmtg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] pinctrl: renesas: rzg2l: Fix NULL pointer
 dereference in rzg2l_dt_subnode_to_map()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        stable@kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Thu, Aug 17, 2023 at 3:38 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Aug 17, 2023 at 2:44 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > need protection by a lock.  If no one objects, I will back out that
> > change myself, queue this patch in renesas-pinctrl-for-v6.6, and send
> > a PR tomorrow.
>
> Shouldn't this even go in for v6.5?
> Or is it non-urgent?
>
> (Maybe I already asked, I have teflon-memory.)

If you're still taking fixes for v6.5, I can do that.
Else, it will have to wait for a stable backport after v6.6-rc1.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
