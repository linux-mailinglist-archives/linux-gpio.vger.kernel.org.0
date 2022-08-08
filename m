Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85E3658CB0B
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Aug 2022 17:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243445AbiHHPN1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Aug 2022 11:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243010AbiHHPNY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Aug 2022 11:13:24 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49CDCE31;
        Mon,  8 Aug 2022 08:13:20 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id l8so1861805qvr.5;
        Mon, 08 Aug 2022 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=adfgpuYWUXDqhSJ2TsmlbbUB7VFtM/zGeAyvojiUWSk=;
        b=qfXPXgqaPVeRZuidraDkbThG0t/DmtKBfJMXfoZLqDpIfITritahbCZfxZescJ8W2j
         aZOHgjoTdRDNmYMJinrZcPoeYk/iYPJI7m1C2K5e1h/O2K5g8HviiLtOK/0SnhGB6MKv
         LVtuuVoEQH90sirjNtd8zPI3gRiwHnhIhgDYLG++GhB7o4WY4H3MNqqQpyOrc++E61Vy
         LOFTqGIb+xUCs1rwONs+qKUQHJKyQ/ol2w9NyAY9WmK+UkLfSO2lCtRNRxymmCp/Rkko
         M2DyUhE4soVVXi3CDrC5sKQH4BJHG4FSK702E1PJQ49qGyUXsXA00MvqBOfa/KiSC1FC
         WG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=adfgpuYWUXDqhSJ2TsmlbbUB7VFtM/zGeAyvojiUWSk=;
        b=zj7hxn/eF/vn+WCy/cAie6tALT8wC+qO+nGveAkPag/gemMfP5jSgn+V4BK1zXedIx
         75W7icjRF+MjiKRHcvxS1iBviT5EAxOeHsDXmEEdgQzIRm5++D9EQBiqcQoM9U9mJvfA
         uLWNBAyww+9UwCvm4wHCxozjLvjX+ymjoZqkkJ+L86FEhgFNNRv8dPg2fsjNvCCecx9+
         n9kLpbyXQTjcinqGJyYAS0XOGIMBi9bhfL592hU6v2XUgNqJfxu8/lqdmqQUOfhnWu/y
         6IgNevxGRPLGZbIngv535mtRkZaxF2H5h+VbT0GpIkSO1nG3giEf92OS8mBviuyxxMXR
         cXYA==
X-Gm-Message-State: ACgBeo1GO8HgzQWn2DA46Ny8LFy1Fm7oRreokEpzkHVQNCu6hLXuG2Uk
        uGx4FsIOic1bahZ7A0wmiKl/EpbV7j1FhXTAQQ6iPBFsgNI=
X-Google-Smtp-Source: AA6agR5qHuW4nlGRwPs4KtQ5LDO3Ik+7XKT8WTn8VdhXhOD+bfly4eTJ584OleFQgUn06Hr7xI4y9DnSBHAPPB/FMpw=
X-Received: by 2002:a05:6214:e69:b0:476:b991:586f with SMTP id
 jz9-20020a0562140e6900b00476b991586fmr16230845qvb.48.1659971599710; Mon, 08
 Aug 2022 08:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAHvQdo1KEM=Adp3Wd0ckokAs86mmemJbK14xzZuk=zVe0weTUA@mail.gmail.com>
In-Reply-To: <CAHvQdo1KEM=Adp3Wd0ckokAs86mmemJbK14xzZuk=zVe0weTUA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 8 Aug 2022 17:12:43 +0200
Message-ID: <CAHp75Vfyw+3TwoAskD7ok=NaXmBL7A-ZSSxkTJ0ehDVCchq3wg@mail.gmail.com>
Subject: Re: am335x gpiochip numbering changed after 5.10
To:     Johannes Pointner <h4nn35.work@gmail.com>
Cc:     Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 8, 2022 at 1:41 PM Johannes Pointner <h4nn35.work@gmail.com> wrote:
>
> Hello,
>
> I just tried to upgrade a am335x based board from 5.10 LTS to 5.15 LTS
> and this broke an application for me because the gpiochip numbering
> changed:

Don't we have somewhere in the documentation that the GPIO chip device
name should be nothing except name. It seems to me you are relying on
the name to be part of ABI, but it's not. The ABI is the real device
behind no matter what name the associated character device has. To
prevent objection, it's the same as for network cards (old) naming
scheme when eth0 and eth1 can be swapped at boot time.

> <= 5.10:
> gpio0 == gpiochip0
> gpio1 == gpiochip32
> gpio2 == gpiochip64
> gpio3 == gpiochip96
>
> > 5.10
> gpio0 == gpiochip96
> gpio1 == gpiochip0
> gpio2 == gpiochip32
> gpio3 == gpiochip64
>
> This is the same for /dev/gpiochipX

Sure.

...

> Did I configure something wrong or do I have to adjust the devicetree
> for the board somehow?

No, you have to write the application based on `libgpiod` or so with
proper handling of the GPIO chips. Note, that if you run `gpiodetect`
you will see the device instance names for your GPIO chips (IIRC it's
called 'label' in the Linux kernel inside APIs) which should be unique
and that is what your application should rely on.



-- 
With Best Regards,
Andy Shevchenko
