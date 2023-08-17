Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5785B77F6AB
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Aug 2023 14:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349333AbjHQMrO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 17 Aug 2023 08:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350944AbjHQMqq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Aug 2023 08:46:46 -0400
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F752D62;
        Thu, 17 Aug 2023 05:46:44 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-58ca499456dso18655767b3.1;
        Thu, 17 Aug 2023 05:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692276404; x=1692881204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2zYbZLrZ5v/WooNcrXKbA3lhJQKz8wzr1cmgKWCCu2k=;
        b=aHpapQfqoXp2JTCZL1ZuFWYGqH1DEVd0DWX7yaJk6k8V8G1m/t5WEC3Ja/GW11wST1
         n5skf/tLG63TvNBjaF+HfI8AL8YJpFvpv+LIcH0ahv/76RQWXmFh0tC+hlAowI1wj4Nf
         6jSNgPE7q5tg8nF/OqTGmFNWJ2OVjxr2qLrNxpv/UuwZ/gGd75aiRvE8Loz6e1qKiFaL
         ouZlOpFQ20tu/DyXleAdlre5lnHqIeSlanQZY9fYOQtqh9WfVqh0lquBVnxlrKP79/2p
         qWnN8O7sLuSh4BF7+AyYP8a4PDqdJqYMmsrfQCn8am24Jj2mIzSduCXxeI+A+SVRhLGW
         4w0Q==
X-Gm-Message-State: AOJu0Yyv/qRw8NTbE0TvD6Mbnkfh8yPhjCZfJ0TUNEar0wMe0rU+ymob
        ACq7qb349ZdL3rftklqLyW7zvXhu1RhfFA==
X-Google-Smtp-Source: AGHT+IECEihkJpsN5EPS+kvEzLf2ZXFlPaU0U5b6qG4b2V+C1v0P5u5eMevR6tRuafaloosxULn3pw==
X-Received: by 2002:a0d:e697:0:b0:56c:e70b:b752 with SMTP id p145-20020a0de697000000b0056ce70bb752mr4616452ywe.13.1692276403995;
        Thu, 17 Aug 2023 05:46:43 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id z20-20020a81a254000000b00583b5564c1dsm4568809ywg.135.2023.08.17.05.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 05:46:43 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d62b9bd5b03so7113243276.1;
        Thu, 17 Aug 2023 05:46:43 -0700 (PDT)
X-Received: by 2002:a25:7908:0:b0:d2a:9dba:25d0 with SMTP id
 u8-20020a257908000000b00d2a9dba25d0mr4317317ybc.46.1692276403543; Thu, 17 Aug
 2023 05:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230815131558.33787-1-biju.das.jz@bp.renesas.com>
 <20230815131558.33787-2-biju.das.jz@bp.renesas.com> <CAMuHMdV852knZ6UoGO-_B=xir=uUJZx2O1CHL+nsK0_BB_hStg@mail.gmail.com>
In-Reply-To: <CAMuHMdV852knZ6UoGO-_B=xir=uUJZx2O1CHL+nsK0_BB_hStg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Aug 2023 14:46:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9EWLh0R==3trX-3vVxViNWJZQLXVT-shXVWf3rcHRFw@mail.gmail.com>
Message-ID: <CAMuHMdV9EWLh0R==3trX-3vVxViNWJZQLXVT-shXVWf3rcHRFw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] pinctrl: renesas: rzg2l: Fix NULL pointer
 dereference in rzg2l_dt_subnode_to_map()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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

On Thu, Aug 17, 2023 at 2:44 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Aug 15, 2023 at 3:16 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Fix the below random NULL pointer crash during boot by serializing
> > pinctrl group and function creation/remove calls in
> > rzg2l_dt_subnode_to_map() with mutex lock.
> >
> > Crash logs:
> >  pc : __pi_strcmp+0x20/0x140
> >  lr : pinmux_func_name_to_selector+0x68/0xa4
> >  Call trace:
> >  __pi_strcmp+0x20/0x140
> >  pinmux_generic_add_function+0x34/0xcc
> >  rzg2l_dt_subnode_to_map+0x314/0x44c
> >  rzg2l_dt_node_to_map+0x164/0x194
> >  pinctrl_dt_to_map+0x218/0x37c
> >  create_pinctrl+0x70/0x3d8
> >
> > While at it, add comments for bitmap_lock and lock.
> >
> > Fixes: c4c4637eb57f ("pinctrl: renesas: Add RZ/G2L pin and gpio controller driver")
> > Cc: stable@kernel.org
> > Tested-by: Chris Paterson <Chris.Paterson2@renesas.com>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2->v3:
> >  * Added comment for bitmap_lock and lock.
> >  * Moved map allocation down to reduce lock section.
> >  * Added locks for maps and pinctrl group and function creation/remove
> >    calls
> >  * Added unlock_and_done label for lock error path.
>
> Thanks for the update!
>
> Upon closer look, I noticed that I had missed that the map allocation
> is not global, but local to a specific DT node, so it does not
> need protection by a lock.  If no one objects, I will back out that
> change myself, queue this patch in renesas-pinctrl-for-v6.6, and send
> a PR tomorrow.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Gr{oetje,eeting}s,


                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
