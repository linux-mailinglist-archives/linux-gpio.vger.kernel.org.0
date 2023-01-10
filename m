Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B506663CE6
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jan 2023 10:31:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbjAJJbJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Jan 2023 04:31:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232285AbjAJJa4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Jan 2023 04:30:56 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D58FB5E
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jan 2023 01:30:52 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so15809558pjj.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jan 2023 01:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MPK8Pcd1KnxbIqf6AZnIbTulBe6CihDk4OzBMX0CQsA=;
        b=rSXAadCpOXwSRQXKprH1Oae0tV4q9g6xL1Yfv6tAov/VkM/cUU2Px8vZo69Gfxwae+
         hT5rWatOGwsd80nmtgleJxTssxGu0OUIDYA9N3Kc17b2eeiWrjkmQX+TSzhP5qqlmUsh
         t/sVOMWsSWi5CfDFsoKuTLUyj1m6MSuPkgHEfc5aauUkjd78mZNOH6D+nZbbiXM7unKN
         BZQOMCEs/m0Ij9X0ZyQ0O5hwYOr2i6IGrhRvYV9YhEJ28UV+J7fHtE0BgZehuCQE9b0D
         9tdYhInjbkjqQ/4CwGDQIlV5uDOGOLS+yDnhz0x9MNiE1g0W+7j5/of/bQkIQRmQexaa
         Y1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPK8Pcd1KnxbIqf6AZnIbTulBe6CihDk4OzBMX0CQsA=;
        b=PV9qbAZNb5ZYuhVRhzy/BzI5kXheo33Vb5vI3UG7CZ7ojGPxJBSZ9lRt4Ngv1DWV8D
         YI3dnTXFOFHq+D+0T+eCii9776t3obHJHIanURNDWSwCSld5kwkBD69IAuaLygdAR1HJ
         sBVzTahl3ZbcU+D1MuQjNjhyYypKn3LoYhhR2oNnDif88e40agZXFPyoKwaf1bNTtEFN
         ceO1v/uhIRkXfts1KL6gc0JD8bjjk80ZXfCoDVAXVWK4mgOLS83ikYbzWGkm/NGp9upy
         LM0BSSRu1TsFy7NKsNNBOAvx78Q59Zef4dfI+wW575dSTuncA+pW9sm2naa2lczUGIXu
         mdHg==
X-Gm-Message-State: AFqh2koDvdgIjV/1YMgkg0UdgaU6If1KD67Ut5A3byIH7+/LcIZeBzpH
        yrt+O5kzin50MDwf30tCCPeK/Q==
X-Google-Smtp-Source: AMrXdXuZSa+rV/0+yMaG6ICmG8FWoorYjfeL96GGckbKJke1oTTmQAFftVGi/4o7yksx/xoxLoOO+A==
X-Received: by 2002:a17:902:b713:b0:191:2a9c:52a1 with SMTP id d19-20020a170902b71300b001912a9c52a1mr69151667pls.19.1673343051900;
        Tue, 10 Jan 2023 01:30:51 -0800 (PST)
Received: from x1 ([2601:1c2:1002:ab0:18c0:a4d5:b5ff:3aeb])
        by smtp.gmail.com with ESMTPSA id ik22-20020a170902ab1600b001925d6fdfebsm7505744plb.299.2023.01.10.01.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 01:30:51 -0800 (PST)
Date:   Tue, 10 Jan 2023 01:33:21 -0800
From:   Drew Fustini <dfustini@baylibre.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 0/9] Add RZ/G2L POEG support
Message-ID: <Y70w4ePvt8ycgn4j@x1>
References: <20221215213206.56666-1-biju.das.jz@bp.renesas.com>
 <CACRpkdZCEvpLAWvH7pCLH7KwbDMzz0EN+4HbxVGfFPi_C1b8+g@mail.gmail.com>
 <CAMuHMdU1J46KSzqqCQc-1ZrgvfWh8J2aa6NzRTK_A_ZJs+zRVQ@mail.gmail.com>
 <CACRpkdaL2J7F2sVjVcTtFTfK1exZ3Rmjhc_dYxuo2DfhYq_8gw@mail.gmail.com>
 <CAMuHMdUeazkEXWh+R9iy3TLc16b=OX9rOzAoB1=X=K4wOo9pRA@mail.gmail.com>
 <CACRpkdZC34xdgsxrMzNy++fBtf36M5ppg-FO0uKpy5q=UGS2Ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZC34xdgsxrMzNy++fBtf36M5ppg-FO0uKpy5q=UGS2Ng@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 10, 2023 at 09:09:21AM +0100, Linus Walleij wrote:
> On Mon, Jan 9, 2023 at 2:41 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, Jan 9, 2023 at 2:16 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > On Tue, Jan 3, 2023 at 10:01 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > If this should go into sysfs we should probably create something
> > > > > generic, such as a list of stuff to be exported as sysfs switches.
> > > > >
> > > > > It generally also looks really dangerous, which is another reason
> > > > > for keeping it in debugfs. It's the big hammer to hurt yourself with,
> > > > > more or less.
> > > >
> > > > Yes, generic would be nice.  Anyone familiar with other hardware
> > > > that could make use of this?
> > >
> > > Drew was using this for Beagle Bone IIRC, Drew?
> >
> > Yes, that's what I remember, too.  And I tested it on Koelsch.
> >
> > But again, that's for debugging purposes.  For non-debugging
> > operation, we need something different.
> 
> Actually Drew's usecase wasn't for debugging. It was kind-of production,
> but it was for "one-offs" such as factory lines and other very specific-purpose
> embedded.
> 
> The placement in debugfs was mostly because it is fragile and dangerous.
> 
> Yours,
> Linus Walleij

For the BeagleBone, the use case for selecting pin fuctions from
userspace with pinmux-select in debugfs is to allow for rapid
prototyping situations such as breadboarding. Our Debian install on the
boards has an utility named config-pin that allows the user to select
between defined pinctrl states for each pin on the expansion header.

Some users like this as it means they do not need to constantly be
editing device tree files and rebooting while protoyping. I agree that
this is not a fool-proof scheme but Beaglebones have been shipping with
this functionality for many years without any significant problems that
I'm aware of.

I do admit that it is possible for someone to potentially damage
circuits with this flexibility, so having a warning in the kernel log
like Andy suggested elsewhere in this thread might be a good idea.

Thanks,
Drew
