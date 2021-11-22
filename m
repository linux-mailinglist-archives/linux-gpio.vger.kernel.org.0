Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3757E459730
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 23:13:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233551AbhKVWQt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Nov 2021 17:16:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231771AbhKVWQt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Nov 2021 17:16:49 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 700B5C061574
        for <linux-gpio@vger.kernel.org>; Mon, 22 Nov 2021 14:13:42 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id x6so71185237edr.5
        for <linux-gpio@vger.kernel.org>; Mon, 22 Nov 2021 14:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=xZTlJ2utI9ngeCT9ZWxO9pUftQUihEay2JhC7sODIcM=;
        b=ZN2pruTuVvnAiEKgfmoeemNk/1cjz7szTRRh7/zffi8rPprqpR7LOgci+pr4Qfe65b
         x19933B8bPsF13gsu60BVVfbyPCAoMBZ7mHWgpTVoWh4NL4DCn4+dH1h2cU8M2fhAB61
         Pq87RB537LE73qzGdStP3qEZwbFIYyNvnGGe7JiU+YSqzsgVtooHjILCELPFXhoTdzMv
         6qz3X8edqTf/eM0cf08CfFoHc51Y8KN6JqgC2S8S+AmDqnT/35J4sccBz/dZRxH/Zznq
         GZO1qoX0NkuR9CvIlJ+eeBWWQG8LRNkZpH8Au7pXY5zNRREMQfsycCeiPkScua5E2ssj
         k28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=xZTlJ2utI9ngeCT9ZWxO9pUftQUihEay2JhC7sODIcM=;
        b=wt/1i7wLyx9j3oNDU739mhSPl86gqIyhKtJ5Da1zuKklJ2DHkJfJch8lCZL11442nx
         8OZYriLwD7kq437UR23tEbv2/T5tWjZ8orzp5vqrrZkC/eXfyEO0wNMgQwdMltZUW1q2
         Oc2R574DdupjhgC/8DtBCj62M+wAXaS/9kfkmwqvU1qB8RjXRmi3YID1WqsSxt11s1Ij
         zVvJWzlYqx0tNpyraNwNoZXJv6uBfSG0sHf0xSGpV9pdsCV+8VHX3QRVDiiLLMGqGcs9
         A4b2rXoNEkOEQ/oIXRehVNrfdEMEifmiPv1Eb6p6ngO2HXvS4rl01d0fs6vPElmxDOY0
         iTkg==
X-Gm-Message-State: AOAM532TpcuUKham5BQK6WRyNMQkVDUElc8Y2MnCga//UNq+hE0x6NKF
        poZlcRVLqYBCoLUWxYeYzMTLnLftBobV9N8FFcU=
X-Google-Smtp-Source: ABdhPJzUmUstq/iFuqsnrAf/gZ3eonL6sQTTU6gekA1jX1XEuKDyblUs6lVXZlU0M8MWs7BtImc49P5eArd5ZIL8shE=
X-Received: by 2002:a17:906:ecac:: with SMTP id qh12mr775738ejb.377.1637619220858;
 Mon, 22 Nov 2021 14:13:40 -0800 (PST)
MIME-Version: 1.0
References: <CANqO7_ZUzfmhj9dt1bDW2YmVtr=fRyCErsuoMS+PqSgGkZsjXA@mail.gmail.com>
 <CAHp75Ve7YD3Bq2QgU3-WunB5gHA7pXcSfpoGBt1GASn1WA8C4w@mail.gmail.com> <CANqO7_aZw3dFT-TfjrkQVosHqeBFFE44P6_2SDPnvNe1N04Kpg@mail.gmail.com>
In-Reply-To: <CANqO7_aZw3dFT-TfjrkQVosHqeBFFE44P6_2SDPnvNe1N04Kpg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 23 Nov 2021 00:13:03 +0200
Message-ID: <CAHp75Vc6DdXzyNtiTtQ01djg=aG3fbu3Smr82CXrv_pWZLH0QA@mail.gmail.com>
Subject: Re: [libgpiod] Strange error
To:     James Nugen <jnugen@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Please, reply to all, including the mailing list. (Asn do not top-post!)

On Mon, Nov 22, 2021 at 9:42 PM James Nugen <jnugen@gmail.com> wrote:
>
> 'gpiodetect' output:
> gpiochip0 [INT34BB:00] (312 lines)
> gpiochip1 [ftdi-cbus] (4 lines)
>
> I can try v5.15.

Please do.

> I should mention everything works correctly on a laptop running
> '5.4.0-89-generic'.

> Perhaps, I should try downgrading to 5.4 on the NUC.

It's too far from the current kernels, we wouldn't be able to bisect
in a reasonable time.

> On Mon, Nov 22, 2021 at 11:23 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Mon, Nov 22, 2021 at 9:00 PM James Nugen <jnugen@gmail.com> wrote:
> > >
> > > Hello,
> > >>
> Thanks,
> James Nugen
>

> > > I'm getting a weird error when trying to access GPIOs from my machine.
> > > The "gpioinfo" command is returning this error message:
> > > "gpioinfo: error creating line iterator: Invalid argument"
> > > This happens as a regular user and as root (via sudo).
> > > "gpioget" returns a similar error.
> > > "gpiodetect" works and finds two devices.
> >
> > What's the output of `gpiodetect`?
> >
> > > The machine is an Intel NUC running Ubuntu 20.04.
> > > Here is the "uname" output:
> > > Linux nuc 5.11.0-38-generic #42~20.04.1-Ubuntu SMP Tue Sep 28 20:41:07
> > > UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
> > >
> > > The installed version of "libgpiod" is v1.4,1.
> > > I tried the latest version (v1.6.3) and got the same errors.
> >
> > Is it possible to try the v5.15 kernel on your side?
> >
> > --
> > With Best Regards,
> > Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
