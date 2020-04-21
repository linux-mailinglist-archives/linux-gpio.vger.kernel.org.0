Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 385B91B1CAB
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2020 05:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728391AbgDUDYL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Apr 2020 23:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728379AbgDUDYK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Apr 2020 23:24:10 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C9F3C061A0F
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2020 20:24:10 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id h6so9913331lfc.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2020 20:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gYnow4lgnqVidzNOrrK4trA3W3x61HJ60LCEVdafFc0=;
        b=Fo8HYX5sDOdJkIgkcRD+Tb4pGVnsBLFD52e8usv36n0vJOCb80jm37aurSNewkRDrG
         LXM+/kiCIIimovTKZ1Ab/US2HU8hvc63p0pYa9ENrxiw5Hhq2uAX6IPpChJq47k8GFgL
         H2Sb9elGCdbAMeQ90SybJifYkWwekkwfUSxo+G7+HcFFs5HJLEFE61CaccpwUcR7yXFD
         f4hzAHqiWebMcAeX9xan1poPveVYdThRYanLHvA0ZHqBd3UncWt5y8FebLf/FPRoQ6yQ
         3uPAxpy5x72cQtsoRM7HjECmXw7mW0hcUfTYqEY1/4N29PUC3uhpAE57ZN82lGF4GtRG
         8NXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gYnow4lgnqVidzNOrrK4trA3W3x61HJ60LCEVdafFc0=;
        b=bgYmNyA6Hp7AtKG2tQF2DzkwMZWZENvjYC1ni2/kTUncxZ29Prb0Hbx10+2Iiw9m7U
         j98GE0cRB4rUolfvS1kN7X0xNqGAwLpjjMTdZfOxQlEyOsTWg4pz45w6/vu2O2h/7Ht8
         DyMnqwMW2cmcgSmzE1l9wGpH06Azwx02aAPThxsnLFEeZwCGNAdOwmkabCr/w+s9TGCL
         BCZy3jiWtDK6cODHOUxIzeJzTpZr8gnQMgRyI90nbFXgU7jxvGQU8v9E/oioMYqtw2dZ
         4QizCHg9MQf1Ha1NlK/YkAPM19Sz0GA9RXSDd7+ezsX4KoXCixQviidVESGkmK8Jv1ri
         bH1g==
X-Gm-Message-State: AGi0PuYIuaNLF3ikWTPrNsBgjfxyNUp8Yx12YYmGxkJWkmgpOYO2HPdu
        r1DmNNF3WR4dB3QacCbYPOVdpzXMyL/S3sbru/o=
X-Google-Smtp-Source: APiQypKSf/rGnDeu3kPg7nKhNNWX4jQn1wuz8zVSQMA6MQJWgo4PcHsiFZz9WfCY+3KIlYJNgoR3rVNMzCyX8M1WJnk=
X-Received: by 2002:a19:4204:: with SMTP id p4mr12553065lfa.111.1587439448909;
 Mon, 20 Apr 2020 20:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200420172752.33588-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200420172752.33588-1-andriy.shevchenko@linux.intel.com>
From:   Paul Thomas <pthomas8589@gmail.com>
Date:   Mon, 20 Apr 2020 23:23:57 -0400
Message-ID: <CAD56B7da+DDxpMvvntmq_nQaZ8aiJ+up4CY5QQ6t2hz_C8LhjQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] gpio: pca953x: Rewrite ->get_multiple() function
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 20, 2020 at 1:27 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The commit 96d7c7b3e654 ("gpio: gpio-pca953x, Add get_multiple function")
> basically did everything wrong from style and code reuse perspective, i.e.
Hi Andy,

Well your version is certainly elegant and simple, and does better
with code reuse. However there are a couple of other goals I had in
mind.
First, the "lazy" approach of 96d7c7b3e654 is actually faster when
user space sets up a 8-bit linehandle[1]146us (single regmap_read())
vs 172us (pca953x_read_regs()) which incidentally is what we do in our
application. In lazily reading 1 byte at a time it is the fastest
access for that, if user space is always setting up the linehandle for
the whole chip pca953x_read_regs() would be faster. Seeing as
get_multiple has been unimplemented for this chip until now perhaps
our use case deserves some consideration? That being said, the
pca953x_read_regs() is still far better than calling regmap_read() 8
times.

Second, your version does not work with a 5.2 kernel, bitmap_replace
is not there yet and pca953x_read_regs() signature is different. So
perhaps we'll all move on and no one will care about 5.2, but as
that's what we are using that was the basis for the patch. Have you
tested this with actual hardware? I actually didn't do a proper test
just the timing of the pca953x_read_regs().

> - it didn't utilize existing PCA953x internal helpers
> - it didn't utilize bitmap API
> - it misses the point that ilog2(), besides that BANK_SFT is useless,
>   can be used in macros
Yes, I know ilog2() can be used in macros, I didn't think it was worth
including the .h file just to calculate 3. Putting the ilog2(x) in the
comments seemed to be common in other kernel sections, but maybe that
was historic before the macro version? Either way is fine. The shift
is not useless, without that you would go into the if statement for
every bit, but you only want to do a regmap_read() for every byte.

> - it has indentation issues.
It passed checkpatch.pl, and any indentation fixes are fine with me.

thanks,
Paul

[1] Tested using 16-bit max7312
