Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2971BBD33
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 14:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgD1MNf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 08:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726554AbgD1MNf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 08:13:35 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED83C03C1A9
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 05:13:34 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id t11so16655174lfe.4
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 05:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=b2zEr6GSGq6P53PK6N6qDZtN5fHu9nTPoj3KiK/HB20=;
        b=TXcHc84UJDMqMyXkViQc1fvVIpsQvmfjZmNigqUTTvXSU9SblKons3Atq7mYzK36UT
         xed4Fa5XbRISfs99ZrXyVKj1a6j9QNNeMzLdpiE6kuOY7ip8cNhvjB/5ljj9AXXJbRDv
         NzwWYGYUc6R0jbtvYx6vT/kCa3Q3cSJAwE7PJSP96yjtoehnGct9QiZr2QLyEqolXfKl
         X4vHJJ98qpMhsDiuMB3ll+C7Xt8JbeVNiAPmEY6vfqiHuaK9+KmDJODrwHvF51+wLFdw
         wSGRGpN9mjXksG0wm2EVUZxUpg/WHn/zxE1xIkqutAjlA+li+veIIucHoC1Bd5EDYRYg
         fy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=b2zEr6GSGq6P53PK6N6qDZtN5fHu9nTPoj3KiK/HB20=;
        b=GXQwRw5xs49RS1ljSWSBSwhrYkX0VA8b9NR72e088OOxlWUFousDONJsW9Y8SrzDwL
         +yss0zWFvHfnDOV0EupB6SOjPoachwpsNT2TbTTfEmz84lCDT2HS1PQnyC+Ql3CUXOi8
         XTwpMgoyKCXUBNoMslNDqlN4NPjw8InCSUl8vJiz/FtW5gLzHYU01gk3sFg8YJX4GOVZ
         vkhRRiWjzWZpR6ISckNuLbpB10/q9i1SROF07BBnCAX3CxDVQsvdmfYL04jh6cP5dzkD
         CLnWp7JrCsezMT2z4W7erspOsJ9REdxAE6NxuwXnKkzlnWDMMw8dvf6+uR5Lm1LOyLTM
         hMJA==
X-Gm-Message-State: AGi0Puargtrq98lIUy+uLyhXafTCYiNHhsxZmmgNMD7jNMz9y2IsmZW5
        XR/59av5BsZgZjQWdgRjKHQwlrSF9gyavDIiQpiyZdSi
X-Google-Smtp-Source: APiQypLElCjT+nD9xM7fcez5f0aPtDH+ruQba2CrDas7/xdd58VSlxDK1GJzuQlHsFWBVhrLVxlxRiLpUYysrFNgp6w=
X-Received: by 2002:ac2:5c4e:: with SMTP id s14mr19245284lfp.77.1588076013160;
 Tue, 28 Apr 2020 05:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200420172752.33588-1-andriy.shevchenko@linux.intel.com>
 <20200421130300.GK185537@smile.fi.intel.com> <CAMpxmJVVDUN6ei__wt5z+hOJQ0w0r9TZjhN9HCtpCA8Vrud0qg@mail.gmail.com>
In-Reply-To: <CAMpxmJVVDUN6ei__wt5z+hOJQ0w0r9TZjhN9HCtpCA8Vrud0qg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 14:13:21 +0200
Message-ID: <CACRpkdYDHiscnm0BrSTwG6=-SCWZeqVfnEEkMAeQcco77GM8kg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] gpio: pca953x: Rewrite ->get_multiple() function
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Paul Thomas <pthomas8589@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 21, 2020 at 5:42 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> wt., 21 kwi 2020 o 15:03 Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
> >
> > On Mon, Apr 20, 2020 at 08:27:50PM +0300, Andy Shevchenko wrote:
> > > The commit 96d7c7b3e654 ("gpio: gpio-pca953x, Add get_multiple functi=
on")
> > > basically did everything wrong from style and code reuse perspective,=
 i.e.
> > > - it didn't utilize existing PCA953x internal helpers
> > > - it didn't utilize bitmap API
> > > - it misses the point that ilog2(), besides that BANK_SFT is useless,
> > >   can be used in macros
> > > - it has indentation issues.
> > >
> > > Rewrite the function completely.
> >
> > Bart, Linus, please, consider this series to be applied, because it has=
 Uwe's fixes.
> > We may still discuss the approach with ->get_multiple(), though.
> >
>
> Personally I like these patches - if Linus doesn't object in the
> coming days I'll pick them up into my tree as a follow-up to Paul's
> patch.

I don't mind.

I would like that Uwe also agrees that we can merge
these three and use as a base?

I don't mind trying to put in code to optimize use cases
when accessing single bytes here either. But I'd like there
to be explicit comments in the code saying why these
optimizations are there. Can we do those on top of
this (hopefully) known working base?

Yours,
Linus Walleij
