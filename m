Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E806377FB52
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Aug 2023 17:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345588AbjHQP5m convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 17 Aug 2023 11:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353436AbjHQP5U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Aug 2023 11:57:20 -0400
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 792A230FE;
        Thu, 17 Aug 2023 08:57:17 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-58c55d408daso34465227b3.2;
        Thu, 17 Aug 2023 08:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692287836; x=1692892636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYoTZXUCf1mgLspDfiO8MvWSdGhcImID4N9VyIOGIZ4=;
        b=Oxm/BcwfoihmY2FvF+vrYBg/ZvwvHQoRELTyCiJ4B4f/ehe/hTt+bfRFsa1JF0E5Q3
         Ws+XPXwhM/zjnPjtGxjYim4aVWtl4Tbhco20xBfjHHvQAFyFcQlpiQ4jQQpWgV9vmzua
         e05pl89kXiYWZEK87vSBbZkhvYgx3cX9eeqYEPmnw85GdHt/OGNitGfM36FDeovu08+V
         X38XUduWtBUgEzSMlOPvMGx7/cKwocRZjFsqnqVaeVODtV2oPkOLjtOSTD5N1Lduen8A
         0RY6kYAdx526JDdxV6y5wQOa8zwuzmAziFYYJkZHSkEj9+m09caJ/xnouNuE5CVZHmvd
         vqUA==
X-Gm-Message-State: AOJu0YyTL4mf4fXio78NAb3yss1KjbNPTKnF0katfG2UhPePniydbo3s
        efwgYttaMoFCIk0p0LWNzMn4u4+S/wb5NpdC
X-Google-Smtp-Source: AGHT+IHGvklfpCzwrD3NX5R3aAspD6vAs0/AnjSdzPvBzNmwYxRpT4KGcMuUF+1lGD7ESBrHYgk9cw==
X-Received: by 2002:a0d:ea91:0:b0:586:b686:8234 with SMTP id t139-20020a0dea91000000b00586b6868234mr6611399ywe.8.1692287836521;
        Thu, 17 Aug 2023 08:57:16 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id n186-20020a8172c3000000b0058605521e6esm4687447ywc.125.2023.08.17.08.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 08:57:16 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d733844772eso15167276.3;
        Thu, 17 Aug 2023 08:57:15 -0700 (PDT)
X-Received: by 2002:a25:b090:0:b0:d53:f88a:dc09 with SMTP id
 f16-20020a25b090000000b00d53f88adc09mr6207195ybj.2.1692287835140; Thu, 17 Aug
 2023 08:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230815131558.33787-1-biju.das.jz@bp.renesas.com>
 <20230815131558.33787-2-biju.das.jz@bp.renesas.com> <CAMuHMdV852knZ6UoGO-_B=xir=uUJZx2O1CHL+nsK0_BB_hStg@mail.gmail.com>
 <CACRpkdbWT333HNgSc0HMUvgDBkJdEvb23ZSHsQd-yfCOu3N=Ng@mail.gmail.com> <CAMuHMdW658cXSAHow3FoZU1DvXioktP68fBK2nQaGGFw0DDmtg@mail.gmail.com>
In-Reply-To: <CAMuHMdW658cXSAHow3FoZU1DvXioktP68fBK2nQaGGFw0DDmtg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Aug 2023 17:57:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUzNR4vdcu_hxp=mQ0VTWOdcdeg6g5uFw0P2HG+5rGKRg@mail.gmail.com>
Message-ID: <CAMuHMdUzNR4vdcu_hxp=mQ0VTWOdcdeg6g5uFw0P2HG+5rGKRg@mail.gmail.com>
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
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Thu, Aug 17, 2023 at 3:54 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Aug 17, 2023 at 3:38 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Thu, Aug 17, 2023 at 2:44 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > need protection by a lock.  If no one objects, I will back out that
> > > change myself, queue this patch in renesas-pinctrl-for-v6.6, and send
> > > a PR tomorrow.
> >
> > Shouldn't this even go in for v6.5?
> > Or is it non-urgent?
> >
> > (Maybe I already asked, I have teflon-memory.)
>
> If you're still taking fixes for v6.5, I can do that.
> Else, it will have to wait for a stable backport after v6.6-rc1.

IOW, please let me know if I should move these 3 commits to a fixes
branch. BTW, they conflict with commit 060f03e95454a0f4 ("pinctrl:
Explicitly include correct DT includes") in pinctrl/for-next...

https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=renesas-pinctrl

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
