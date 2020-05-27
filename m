Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1FD01E38B0
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 07:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgE0F65 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 01:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgE0F65 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 01:58:57 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B81C061A0F
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 22:58:56 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id w10so27453259ljo.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 22:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GZrxLWEv2RQwIV4nFIWedkkizU0DIsRXfRmjD6gFnTY=;
        b=dJUTgpiMkJ1s0zS0iy9nBJ3IHP5NHvdqW4eA3+0tV/Yadk+ve6GdDgBLTP79aXub38
         ekh0+PedTpGyJNu7HvTuXYznrJlYsAAK1Q4YyDCvkE7JuopBTUyqyQKc3+J9gv5YQKaE
         mPckQgv/SXPxD60SABLLSqZPksIKZy1wYsmvDFgvaor9LdiCR2ferynQ5R9rQF6XOVC9
         cQGBG4Sr9NotnvZY5brGYP4Cg+Yx+/Va9OYrRzmsmNtdWBRSP9UusWScDhgE/pEUJ8VF
         8LK8Kh87YrgFCh1yp7n1iEyOBHg2Uaj/zqt0vUJ3eJecVUPOPauj17f/Zdopj8qfG9oV
         iqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GZrxLWEv2RQwIV4nFIWedkkizU0DIsRXfRmjD6gFnTY=;
        b=V3AKJd0Eh7Zfb+V+mEFZniJBw6YbzG3hhmn5v2nWnPk4AK37HsYR9CS1lxQlvvenKD
         TtIVZh7kbGChlC4f8sxzy5/di/hN31lH/WlSy4PyaP0zrcyXHOY2bn0CM6+cscxFVJb4
         Dct7njhb0jIS3P5hTkR7SyeUsQekIHpJFiA9TZsknOCBpAU6x6tksvRzcd48Uyv4HMjE
         SPeJBsQ2qKOJt6Ae30sJVUb+ICHi3rOfOf4eCwDlvsGmvkySLHACPoRsW1Mri4J4J7pt
         j8y9Cua+mwwNWI1ptRO0OXwLG9SiAZdWBcDgUtY13y1xsxOZJGbsUPqVPzBqSrkCeeOG
         Gdfg==
X-Gm-Message-State: AOAM5323xVwygUpm4FY2vFFepwTHsnnrizJzjeT0LIVJM6gE02SnkrP4
        uccIhu880ktoNDjJX2XYj8H+ob9D5XpNvO1KZZDpo89v
X-Google-Smtp-Source: ABdhPJyGcOO7k15GXBI4U9yp14BYnpfxbNWQD5wYC44Hid+bFIymEYNGNVKU6kUy+bEnmzAzciNLCRQ3ybuZ8NtGOMo=
X-Received: by 2002:a2e:b5b0:: with SMTP id f16mr2362794ljn.100.1590559134977;
 Tue, 26 May 2020 22:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200516064507.19058-1-warthog618@gmail.com> <CACRpkdbputuoHFWL_FhUNR-ZywvJt=qYdaa+i2cLt-Odmgxe2w@mail.gmail.com>
 <20200525141902.GA27938@sol>
In-Reply-To: <20200525141902.GA27938@sol>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 May 2020 07:58:43 +0200
Message-ID: <CACRpkda4PEYd5UGbLkq9w1RBbtOdZxuMQ75k-nu5YfoKTZ_azA@mail.gmail.com>
Subject: Re: [RFC PATCH] gpio: uapi: v2 proposal
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 25, 2020 at 4:19 PM Kent Gibson <warthog618@gmail.com> wrote:

> > > +struct gpioline_config {
> > > +       __u8 default_values[GPIOLINES_MAX];
> >
> > So 32 bytes
> >
>
> Actually that one is 64 bytes, which is the same as v1, i.e. GPIOLINES_MAX
> is the same as GPIOHANDLES_MAX - just renamed.
>
> On the subject of values, is there any reason to use a byte for each line
> rather value than a bit?

Not really, other than making things simple for userspace.

> when adding future fields, the idea was to have a bit
> in the flags that indicates that the corresponding field is now valid.
> If the flag is not set then whatever value is there is irrelevant.

You would need to document that idea, say in the kerneldoc,
else when someone else comes along to do this they will
get it wrong.

> But definitely better to play it safe - will check the padding is
> zeroed as well, as well as any field for which the flag bit is clear.

Yeah better like that. You can write a comment in the code too,
such like "when adding new parameters, update this validation code
to accept it".

> Back on retired ioctls, I notice that 5, 6, and 7 are missing from gpio.
> Have those been retired, or just skipped over by accident?

Just thought it was nice to use jump to 8 for line info.
They should be used when adding generic chip information ioctls().

Yours,
Linus Walleij
