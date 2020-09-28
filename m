Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55B7327B157
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 18:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgI1QCX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 12:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbgI1QCW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Sep 2020 12:02:22 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78469C0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 09:02:21 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id r25so1689095ioj.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 09:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Beb7AHySGsyjEGIYpYtOQgRUOc+Ox7Lq09Bf6qtNab8=;
        b=XLChYpb+lNHEqVKvw3ag/ZHYaGZefR52QZetHcKGbGil1brBqQgdflZhVGCCq9c7g0
         xyEdBIyB8Hox+di1BXVXMW72/IUG6L9D+rFPyyvTEaWxI6BeRTfD1qqVBIFH6M4E+WG/
         IBKdLMDXZSy6aYMFefJtcrSdSCORUwDgGNjCh+feqiEiVAzW4+v6/WTrZio8ukhIzxz7
         gSB4P6mgH2IdJG8D8qzJtqCW4+dIch0jva42HuIVmaZc++NSBD4jFvEwCwYPMDgXu++W
         b9Lp9UmODqOaf70oOpyYrD7OXooaNhwzHuAACkfILlxO3/+uzQghf7LkRFKiDbyuzs1k
         /TxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Beb7AHySGsyjEGIYpYtOQgRUOc+Ox7Lq09Bf6qtNab8=;
        b=uletn219n8jRG8TNSSW/4iysMS7DcCE8V+dWVUHM5PEUEnQd3NL3QpZPYtkjSF7FIS
         1yijqb3CBbay5TBmomq+xDciK3cyhSihHD+Fh7azKVKIeD63mVmIpsNEbZyrJgOgqoEy
         Qm9mQRd9FfrzgNoKJIzxqUksUu/+GTkKwXuZxZF8ExgaKc3mDftB5Nd1C0VC6DACxsOB
         3ZGh1sBZlbv3XwezZ7pZiuOqO8P6WX7HS4Z8BfGdcQPI/e82l8dMblEXYOLR8LZnNtan
         9AJULaLPoH3G7minr0zmh5TSO80z9wRXQCF0UpnYdbO6F4yZIKi2tyRU9gHPP8pX9tKv
         vcSw==
X-Gm-Message-State: AOAM533SJInepxDySFHSW/PcQt2GwyrmspRY8TuPfV6mX0BqzI35wbzi
        B3U9R//s23+Y3gzEp4OVIYUFo8pyvYG8XgJo+oFWIhj0naQ=
X-Google-Smtp-Source: ABdhPJzz42UKmX7awjxssAkSLiT+5SlH+O8wg4+gU/7bnE+JeDuRKky5DhDRqTCNpn1oF8PeVHiq6cdnbOCCwQl0tU8=
X-Received: by 2002:a05:6638:dc8:: with SMTP id m8mr336154jaj.102.1601308940843;
 Mon, 28 Sep 2020 09:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200928104155.7385-1-brgl@bgdev.pl> <20200928104155.7385-2-brgl@bgdev.pl>
 <2fcfd81f62ec87d9b75cca32468d8b9583faec47.camel@perches.com>
In-Reply-To: <2fcfd81f62ec87d9b75cca32468d8b9583faec47.camel@perches.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 28 Sep 2020 18:02:09 +0200
Message-ID: <CAMRc=Mds0ccYBhRJnCQ0NEPkUpWRGtyX4FKj4+4rxN27_gfobA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] lib: string_helpers: provide kfree_strarray()
To:     Joe Perches <joe@perches.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 28, 2020 at 5:59 PM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2020-09-28 at 12:41 +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > There's a common pattern of dynamically allocating an array of char
> > pointers and then also dynamically allocating each string in this
> > array. Provide a helper for freeing such a string array with one call.
>
> Isn't this also common for things like ring buffers?
> Why limit this to char *[]?
>

I don't want to add APIs nobody is using. What do you suggest?

Bartosz
