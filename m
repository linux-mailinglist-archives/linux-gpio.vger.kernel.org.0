Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CECB965BCB5
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Jan 2023 10:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232838AbjACJD6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Jan 2023 04:03:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbjACJD4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Jan 2023 04:03:56 -0500
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9679763F9;
        Tue,  3 Jan 2023 01:03:55 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id x65so17597241vsb.13;
        Tue, 03 Jan 2023 01:03:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/2eYMVYxzIFBJG3qq6AbikGMDNEgdPMpXyBMJ78i1s=;
        b=pUdQSg9mo6+9bbFM+n4+xqhrgYc81R2Gt6dfnXbTdInDmHpVfVZwpJkliOeTEIrEP1
         XJK6NDa+N87GGnCHY+HxE8jjaLOl/WdfU55rD3R7Zu4YRe1Fl+XRMdjebGkKffjQZo71
         RKJWMgmsHfeDC1i5g3PnHOJ0UhyYwt93SZGgTN0m7d1wYfN86yTO9zuRr4m84Tp+Ze2V
         60D5HT9z2lCWliT/g6kV067scbD2fUh9elS2GqX4tEs9sjJCEKH539Jcef7Vm7MDGldU
         kldts0FnBXpx8edX9E0Vh2tzFZALA/ZqwHdnOZG56zfOkjzPRA9AI+d1fuLdC6W+w+L9
         +uUQ==
X-Gm-Message-State: AFqh2kqXZ5X6lVC65blrE3NGCiT6RmOoUupT38rPcdi2M9zkEue4FgDX
        Vuh5ORt5EFgcGesLrqwV/HpWht7XeP7OGA==
X-Google-Smtp-Source: AMrXdXsdAfyqflP3+cl22ZLezBJ6cV4tPhizdC4f+QCflCS6WsOuddvNXtCDMGn9ltGcZvpooLzSiQ==
X-Received: by 2002:a05:6102:116a:b0:3c6:fca5:b8f7 with SMTP id k10-20020a056102116a00b003c6fca5b8f7mr12083979vsg.7.1672736634441;
        Tue, 03 Jan 2023 01:03:54 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id bl33-20020a05620a1aa100b006f474e6a715sm21688310qkb.131.2023.01.03.01.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 01:03:54 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-4a2f8ad29d5so87004697b3.8;
        Tue, 03 Jan 2023 01:03:53 -0800 (PST)
X-Received: by 2002:a05:690c:d8c:b0:4a2:63c5:6c59 with SMTP id
 da12-20020a05690c0d8c00b004a263c56c59mr776343ywb.384.1672736633549; Tue, 03
 Jan 2023 01:03:53 -0800 (PST)
MIME-Version: 1.0
References: <20221215213206.56666-1-biju.das.jz@bp.renesas.com>
 <CACRpkdZCEvpLAWvH7pCLH7KwbDMzz0EN+4HbxVGfFPi_C1b8+g@mail.gmail.com> <CAMuHMdU1J46KSzqqCQc-1ZrgvfWh8J2aa6NzRTK_A_ZJs+zRVQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU1J46KSzqqCQc-1ZrgvfWh8J2aa6NzRTK_A_ZJs+zRVQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 3 Jan 2023 10:03:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVr3U5ABj0Ajz+=iRO6YbR5Ogip718KT9AWnWXeuFR9sA@mail.gmail.com>
Message-ID: <CAMuHMdVr3U5ABj0Ajz+=iRO6YbR5Ogip718KT9AWnWXeuFR9sA@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Add RZ/G2L POEG support
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Drew Fustini <dfustini@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Jan 3, 2023 at 10:01 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Dec 29, 2022 at 2:17 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Thu, Dec 15, 2022 at 10:32 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > This patch series add support for controlling output disable function using sysfs.
> >
> > What's wrong with using the debugfs approach Drew implemented in
> > commit 6199f6becc869d30ca9394ca0f7a484bf9d598eb
> > "pinctrl: pinmux: Add pinmux-select debugfs file"
> > ?
>
> I think the main difference is that debugfs is meant for debugging
> and development features, while this feature is to be configured on
> production systems.  There's just no existing API for it.
>
> > Something driver specific seems like a bit of a hack, does it not?
> >
> > If this should go into sysfs we should probably create something
> > generic, such as a list of stuff to be exported as sysfs switches.
> >
> > It generally also looks really dangerous, which is another reason
> > for keeping it in debugfs. It's the big hammer to hurt yourself with,
> > more or less.
>
> Yes, generic would be nice.  Anyone familiar with other hardware
> that could make use of this?

That's also the reason why I have been rather hesitant in accepting
this driver and bindings (I just saw you applied the bindings): I wanted
to hear your input first ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
