Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2699525FA0F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 14:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729198AbgIGMAg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 08:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729177AbgIGL7s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Sep 2020 07:59:48 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821C9C061573
        for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2020 04:59:47 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id l63so12506623edl.9
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2020 04:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bR2mzR5z4Fp1s//vb7R8PemzbT1nIPea5CxsPeQGbCo=;
        b=sdlgVprv5Ml6FcGFfq4SFwKLBdhqpgt1/tD2prJUf3yezMMf+zk3OqmlSCmjl90GHA
         9J+0bfsuL2zGyEMQv67lgp7Uh5bekpJZkJHE6RCa3MxRx2asJEH0Rqd9mlGTMD/4z6Ur
         rlj+DdN2WEqADLINNVdSYBEhSR/vahUY1tKDlmtHNxKtIAaiKOIlwVeS9MfAxEMbdzNI
         veqHk6YVwBCiYL+JFMHTSCZgP67iVXGNuh01a9SlxoSynu7DM83hrYh4tzt5UwLCwkk9
         giM2ryBZgwbxSSOdWZIXQxuIHht3JyKr6Uv/HaVrENAUpyjSEsHY1RcTVtVySWPD86y2
         ro2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bR2mzR5z4Fp1s//vb7R8PemzbT1nIPea5CxsPeQGbCo=;
        b=UQPmZKu5Tzbp1fA6iHXoZ/lc9wXGp27OCc37dl+cUxDJWHRWc9Hqf0FMfZwUcIRh44
         TOOrErxSATl6XTxEqnci3CVJNNgcig762SYV4eQ+tjFKHz7U1EvRqnnk/FU950xaJJwY
         MLIWsnGD9ospVVl4kJjhiGCTfIXWJZbMzIFaH2Pe/4B8t0OPzEjtXzc+63eW22tPX4ek
         ZAfW/dkdmMVtkaRwC3nByF1XNJTZGqGXpNMaY3s/dq8jy1Ikk2/uSPrDJi9Ty09J27GC
         QptyDdFyvj6TqaXwwtxaWFZh2qmbPxheVAYVIZc3v+x/tddNQtMqY5Fm61ym0TE+KPNf
         cCRw==
X-Gm-Message-State: AOAM530SgfJukZxAlSroF+lrbImUtua2OJ0uUiHYvcZSDXX4w8rphDx9
        oNcrbKDmndHjtDLUdyegxtAglNl/kQPBq9ydKx0EzA==
X-Google-Smtp-Source: ABdhPJyvgUJP0ylxO5qehk4m0jdhpk8hsO0Sw1TL7vejIAJ+s0I1Q151uttBgmbE3hq97WmzbCF8SLXZr4mDtGwGZag=
X-Received: by 2002:a50:f687:: with SMTP id d7mr22155378edn.353.1599479986024;
 Mon, 07 Sep 2020 04:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200904154547.3836-1-brgl@bgdev.pl> <20200904154547.3836-16-brgl@bgdev.pl>
 <20200904164917.GC1891694@smile.fi.intel.com> <CAMRc=MeG8xuB0GNbMLi6+QZTphSN==77Hsw1fjVNU_+Z=Ky2qQ@mail.gmail.com>
 <20200907115051.GY1891694@smile.fi.intel.com>
In-Reply-To: <20200907115051.GY1891694@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 7 Sep 2020 13:59:35 +0200
Message-ID: <CAMpxmJWM265uk39mddEwVUYJdnM+1Stx3Ds8O9-ucYvMnV7hRw@mail.gmail.com>
Subject: Re: [PATCH 15/23] gpio: mockup: use dynamic device IDs
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 7, 2020 at 1:50 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Sep 07, 2020 at 01:04:29PM +0200, Bartosz Golaszewski wrote:
> > On Fri, Sep 4, 2020 at 6:49 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Sep 04, 2020 at 05:45:39PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > We're currently creating chips at module init time only so using a
> > > > static index for dummy devices is fine. We want to support dynamically
> > > > created chips however so we need to switch to dynamic device IDs.
> > >
> > > It misses ida_destroy().
> >
> > No, we always call ida_free() for separate IDs when removing devices
> > and we remove all devices at module exit so no need to call
> > ida_destroy().
>
> Perhaps couple of words about this in the commit message?
>

But ida_destroy() and ida_free() are already well documented. It's
clear that we remove all devices at exit and that every device removes
its ID, there's really no point in mentioning it again.

Bart
