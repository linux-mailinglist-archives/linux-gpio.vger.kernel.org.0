Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9EF7748144
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jul 2023 11:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbjGEJor convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Wed, 5 Jul 2023 05:44:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjGEJor (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jul 2023 05:44:47 -0400
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A8111712;
        Wed,  5 Jul 2023 02:44:46 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-579efc32377so41200137b3.1;
        Wed, 05 Jul 2023 02:44:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688550285; x=1691142285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QoA/MKbc06m1yulm9Od2Dbtqo16NHoEsxhBH5wSUfFs=;
        b=AGIMJ7E8nZBjQpq4aSIWAJFe3g1OZxPpZaUHjbNEotgwKa/l/ug+4jblaHczN7z3wd
         FynwX1fLu9lVOysYHkqYSepFBWC3e7ldoKXNUNsSn+aPhascPbsA9x7ljRZDfnPPrAp9
         ABe446sa1ls+dyUCr/G3WVhJ5ZJb83tnjKb5+xduMEgIaTd1w99prcObwekiWQJJWOjW
         0/5ZSt6GngxLbXuZqao4yoaZ9NkkZ1znVcJtz42XY37xTLr3uvRwPd/n6ZDR4RJDlkS3
         MM/8+C19uLDQrSWyuFEv5H9LBM7tKTjkgvtYb/RxOVT8XOkg8JYLhz3WnHHScwQ+XC7Q
         xLJw==
X-Gm-Message-State: ABy/qLbzUl0swHBDhS/8zYusq3V3b8me3gXjBHT72ZynUoLqjrdny3kY
        xK9No+7ezR+XtSJoYKZTvNnBuDwN3cTEWg==
X-Google-Smtp-Source: APBJJlGpz98wRD2pGD7kVJABb/g2KypN4v7A0RvaPFPbLmj9vDd3kceTkndbCkM7RVlpgLrr+/Nbsg==
X-Received: by 2002:a0d:cb8e:0:b0:56d:3327:825 with SMTP id n136-20020a0dcb8e000000b0056d33270825mr13559946ywd.48.1688550285012;
        Wed, 05 Jul 2023 02:44:45 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id cm17-20020a05690c0c9100b005772646629csm3440575ywb.144.2023.07.05.02.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 02:44:44 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-bd0a359ca35so6048971276.3;
        Wed, 05 Jul 2023 02:44:44 -0700 (PDT)
X-Received: by 2002:a25:e714:0:b0:c61:e9b6:82a5 with SMTP id
 e20-20020a25e714000000b00c61e9b682a5mr1452882ybh.39.1688550284040; Wed, 05
 Jul 2023 02:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230704111858.215278-1-biju.das.jz@bp.renesas.com> <ZKU6vQv_i0xQC6_D@surfacebook>
In-Reply-To: <ZKU6vQv_i0xQC6_D@surfacebook>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Jul 2023 11:44:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdc0Ep11vHmn4nqRK_nRC7dQAi7injWdP1ej_N-zQ8Mg@mail.gmail.com>
Message-ID: <CAMuHMdVdc0Ep11vHmn4nqRK_nRC7dQAi7injWdP1ej_N-zQ8Mg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Handle non-unique subnode names
To:     andy.shevchenko@gmail.com
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        stable <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Wed, Jul 5, 2023 at 11:41 AM <andy.shevchenko@gmail.com> wrote:
> Tue, Jul 04, 2023 at 12:18:58PM +0100, Biju Das kirjoitti:
> > Currently, sd1 and sd0 have unique subnode names 'sd1_mux' and 'sd0_mux'.
> > If we change it to a non-unique subnode name such as 'mux' this can lead
> > to the below conflicts as the RZ/G2L pin control driver considers only the
> > names of the subnodes.
> >
> >    pinctrl-rzg2l 11030000.pinctrl: pin P47_0 already requested by 11c00000.mmc; cannot claim for 11c10000.mmc
> >    pinctrl-rzg2l 11030000.pinctrl: pin-376 (11c10000.mmc) status -22
> >    pinctrl-rzg2l 11030000.pinctrl: could not request pin 376 (P47_0) from group mux  on device pinctrl-rzg2l
> >    renesas_sdhi_internal_dmac 11c10000.mmc: Error applying setting, reverse things back
> >
> > Fix this by constructing unique names from the node names of both the
> > pin control configuration node and its child node, where appropriate.
> >
> > Based on the work done by Geert for RZ/V2M pinctrl driver.
>
> ...
>
> > +     if (parent) {
> > +             name = devm_kasprintf(pctrl->dev, GFP_KERNEL, "%pOFn.%pOFn",
> > +                                   parent, np);
>
> Is devm_*() usage appropriate here?

I think so, as this is tied to the lifetime of the pin control driver, which you
cannot really remove/unbind without causing havoc.

Note that several other allocations already use devm_*(), too.

>
> > +             if (!name) {
> > +                     ret = -ENOMEM;
> > +                     goto done;
> > +             }
> > +     } else {
> > +             name = np->name;
> > +     }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
