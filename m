Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C637F4786D0
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 10:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234056AbhLQJOS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 04:14:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbhLQJOS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 04:14:18 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC74C06173E
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 01:14:17 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id o20so5237107eds.10
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 01:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=afvs9cxV6+DN35MZPZLfbWczO4mSQLSDs5fWaqi7DIg=;
        b=secagDGADp/iY9V9ymqJ1imVzITkqRHFtVok/Y0hnWA2RupY3QFkcaURVyWWTv+rlw
         IXoeoX3VRdQhXUWa3B24rN4trPU/jtyb2bt4EKxA/HraDA1Log9FUdI+J43CsaBcHD/S
         pZOC5zHjN6gFfQSvJrQnjPYJawCEnDkGzHE83TS6pwvvRk6Jqnl1gyntgbmXrOQYWATZ
         7do6hi16jWqnbOFmp/8BNueOltjMGdj4mA3WvV3Dn2xUeIk8OrTiXKWrMUyhNQR9AJV+
         B5sSm0y7a7ysEKXkRZnF8yfgHj1pLmmG3xxWcWRLoIJINOY+sNsFgawUKNHQc4i46xSN
         WmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=afvs9cxV6+DN35MZPZLfbWczO4mSQLSDs5fWaqi7DIg=;
        b=anMoCl4BKjcYbnm+rchc7s1z0sf+C2tXWGeCYliMjwK7R+s4/k2Wa0FNrEUzCGvbC4
         JB6gVXAPjMqFaEFI0sNC543DWZgr5Q0GU+43BbzA9hOZEil7RAqRJXWH+cER/2+GvzWi
         OrxBulphuN05ffPmRnIwV3I2jPpWpjw+2tCHvfCSE6CAnlFmkJGD6X+O49vkfoncdzfZ
         knjL61LOhBgdBq7D3N68ptvG+JNv27vgXdzEJQ+WtOG30mY7wf3i8Urijii5Veagnt19
         dV9GAMM1bZJxN6DiIro/C0F7B7SNbiunFb/KFRI9snFphXglXxDFsfYo/E19oZVSYIVF
         JVOQ==
X-Gm-Message-State: AOAM53062O4b3oZSjWecHaRH0p5VhuiIRz2H4LDA+b3esTN9N8RqQXK3
        kqqnRDcUmfQElvbsi7To522wMv5gAGKzqwodCw3+Sw==
X-Google-Smtp-Source: ABdhPJzq2gKt6q7R8eSGpv1PxnR3USp3Kk2xUKw1bXXskDXAuoWKtQzCTrsiUSJQgQnyxzBgu686gNH5extokDDr6AQ=
X-Received: by 2002:a17:906:2ac4:: with SMTP id m4mr1847936eje.734.1639732456488;
 Fri, 17 Dec 2021 01:14:16 -0800 (PST)
MIME-Version: 1.0
References: <20211213203112.969238-1-broonie@kernel.org> <b7f4804a-01dd-9dd9-01f1-2187a955cb13@gmail.com>
 <20211217171709.622cbb1d@canb.auug.org.au>
In-Reply-To: <20211217171709.622cbb1d@canb.auug.org.au>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 17 Dec 2021 10:14:05 +0100
Message-ID: <CAMRc=McDv+dF+=5O16TRtPyph0yRNjPNybQ16Jtzkuew9GibvQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the gpio-brgl tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Xiang wangx <wangxiang@cdjrlc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 17, 2021 at 7:17 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Mon, 13 Dec 2021 19:12:05 -0800 Florian Fainelli <f.fainelli@gmail.com> wrote:
> >
> > On 12/13/2021 12:31 PM, broonie@kernel.org wrote:
> > > Hi all,
> > >
> > > After merging the gpio-brgl tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > >
> > > /tmp/next/build/drivers/gpio/gpio-bcm-kona.c:508:34: error: duplicate 'const' declaration specifier [-Werror=duplicate-decl-specifier]
> > >    508 | static const struct of_device_id const bcm_kona_gpio_of_match[] = {
> > >        |                                  ^~~~~
> > > cc1: all warnings being treated as errors
> > >
> > > Caused by commit
> > >
> > >    19784a059cf47b ("gpio: bcm-kona: add const to of_device_id")
> > >
> > > I used the tree from yesterday instead.
> >
> > Doh! Should have double checked the code as the diff was not giving
> > enough context. This patch should simply be dropped, not even build
> > tested by Xiang it seems.
>
> Today, I have reverted that commit.  Please remove or revert it ASAP.
>
> --
> Cheers,
> Stephen Rothwell

Done, sorry for the delay.

Bartosz
