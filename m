Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC9D12EF462
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 16:04:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727256AbhAHPC4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 10:02:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbhAHPCz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 10:02:55 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DC60C061380
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jan 2021 07:02:15 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id r4so5771157pls.11
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jan 2021 07:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V0feHpe2aeYh1xbWZdFPIrRKNJ9A3tzDu9kvuI1ySTA=;
        b=fZldcHRrhE8BIpcdIhCX95FEciDad3Z3G321/pkFgiaqKBnXGVt8NLYtTURhdycL78
         hb8xsQLoKsdpzkAhkkawGYjzAnZaFsMSBw6Be2VNkujkuOlXQLYKmwOxoqFdtMUh4H9G
         2Uy8SAraGHb0wr+aAp1R7fo9imYeJvkfKPsb+7BZ2G5xihxObQNHdzv2uW26koilQRzF
         s+NAdugMN7ce/kZKOfXe2e3x40dFYfv4QphuiKlgLXgG86Ei6DAKbyRcvTMTEGbWDfbO
         fnNu7ldLp57yEEpphihHjbjj6AVyBqVNTFPHWdGYUCq46lUweoH5yfqI8bfJlpJWFi1X
         c1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V0feHpe2aeYh1xbWZdFPIrRKNJ9A3tzDu9kvuI1ySTA=;
        b=dSSD9e92vFB8ZmSY4xiFxLIQ6csmnCF13waFQmAlSsteAOY30vjtNIVtSeoJZAAb2H
         RfQblEXtYla+OMCHZatl/LMl3H5romzg9Zk+vbF8j1q2zdgr3JAtLeHuOXlJvWuLsGXc
         X1+c/kgoAI+p4+xosVz1TUadRCbvmPgqrfauIZKcBLNU8kTCaVGaXmPMm7y9F2zcx9ZT
         KxXEh9rZD2m28PBXo8NU7qd7LyH5m4YBGGvFpjFU5K0WmkLLSfuQTHyQ4HKBjm43rMcN
         zO8g3N5YI2oaLdxBKreEMP/ZQ9NqAPIIAlt/DgxOQlLga5QCHvJadaWKiEu5uv/10X7W
         x5Xg==
X-Gm-Message-State: AOAM533akkNGIFJAGQ7TCqNR50zynrHykPpkhGT5k1o9lflg9xxKWZtG
        20pUoDWm+J+M0PHDw1Sf1/HrkgWpcS4rofoIgVo=
X-Google-Smtp-Source: ABdhPJx/3jJAWD6ix5LSi7rXSbA3FHigaK8IcJ+jl2sdXJhrQlhMjydPf1kzupJYvfkiu0+IIXnXaoG9MzMUkz/CODc=
X-Received: by 2002:a17:90a:c592:: with SMTP id l18mr4197714pjt.228.1610118134939;
 Fri, 08 Jan 2021 07:02:14 -0800 (PST)
MIME-Version: 1.0
References: <20210105082758.77762-1-linus.walleij@linaro.org>
 <CAHp75VeXC26KxxhrSbtae2_v4Zqnaaia3nV_1sxY07uUEt3U7g@mail.gmail.com>
 <CACRpkdYixhB6rTw=DK7CetExsXSH4czVzysynZas07OTuQi0vA@mail.gmail.com>
 <CAMpxmJUJnhc9HrZnb=qE5fpZ9e0Xo7VP-hTjdK-LHk0w6n3cMQ@mail.gmail.com>
 <CAHp75VcVN5Af3t-OYdO9MOXk14LV+zYQtusqft8twi_u83yZ6g@mail.gmail.com> <4a7c2f63ec2c4cde9742603e3cbbaee8@asem.it>
In-Reply-To: <4a7c2f63ec2c4cde9742603e3cbbaee8@asem.it>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 8 Jan 2021 17:03:03 +0200
Message-ID: <CAHp75VcCkFyNR+s3gjyP_NivaXtwY=vUJwjFn105a5_nL2Fjxw@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Disallow identical line names in the same chip
To:     Flavio Suligoi <f.suligoi@asem.it>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Johan Hovold <johan@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 8, 2021 at 12:40 PM Flavio Suligoi <f.suligoi@asem.it> wrote:
>
> Hi Andy,
>
> > Flavio, perhaps one more rule to the gpio-line-names property has to
> > be added into documentation (Bart, same to DT docs?):
> >  - names inside one chip must be unique
>
> Just a question: why "inside one chip" only?
> The name should be unique for all gpiochips, since "gpiofind"
> stops at the first name match, and doesn't show other gpios
> names, even if they exist, with the same name, in other gpiochip.
>
> I think that a rule as:
>
> - names must be unique (avoid duplicates in any gpiochips)

Definitely "no". Simple case: you have 2+ chips of the same
functionality. You want to use PinX of each of them. You always don't
know ahead of time how many of them you will have at runtime.


-- 
With Best Regards,
Andy Shevchenko
