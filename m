Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B751D601E
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2020 11:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbgEPJvA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 May 2020 05:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726188AbgEPJu7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 16 May 2020 05:50:59 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85B92C05BD09
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2020 02:50:57 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id u6so4786503ljl.6
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2020 02:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1GD9cgKsC79o9xJsFY0Rns6nb+f4FHwgFZwwSnHIkTc=;
        b=sb2u9OnlDoL8lkNLTwelDEfXi/WEWCJjI3l+P0QcJOHgy9wSzCLwwc1VkUZa/OoGnA
         DUue2YQa+84RNibQpALhfGWyLO8ISaZJBZ1i14d3Bhsg3yV4Xc+OFzhPNdhl4rYe2Djb
         fBewE/WyObg4MkP3XmpHGrl8BoGlq6sLUMPkJciEZ+nkRZgpOy1xSOpdFjmRzqhveq9O
         FHDUEd1RqoBo7lNAbzOR4vGEWR2FTJXpv70HrrPfekZeZEE6PLmHRR7P76kOM+FaQcMK
         2FUlRXgnq+TCik3LC9RMsq2UCen8+25JIeP8m2wepXbgzJzUM6wk076iGwXin06dzd39
         UVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1GD9cgKsC79o9xJsFY0Rns6nb+f4FHwgFZwwSnHIkTc=;
        b=eBGp3ftwakxQ/CxEFu8zb5oxJiPMqOG/vHVfzbiHuBGhqPEeOVu1R9dJOInbttOjfh
         o7LHxG94Sy/O1OiR5UjpGiug0eLNJ6b5luTUgS/jBI45FezICLjCDRgJC3NjjQ6IE2ej
         f0MYHZRdbDJh7mkTy4xYIm1F5ns5Wd2H7XLnCT6lvNje4zb6hvDTge0q+U4AYT7jINO1
         Yvhp7oA53bXUPH7rtV8DV3+FR9S+Z4dJ/A46BGiJG4PrdLRWdZYNRhiZ6M7RaCgMN6/j
         UkMsh3Icy5F8VGxQz9YgHkQr62whZMwm4jPqoivgWgSOVzzqep+ozo1lm2dqfhKSNZ6w
         upaQ==
X-Gm-Message-State: AOAM530h8YxykuP+j5iqtlDkZ0trtRq3WciLhu+5OCznQDrEMHCWwol5
        5tk9NY8xVUTTiVPrbD3CNH3mu76crBqH3RCO/6xKSw==
X-Google-Smtp-Source: ABdhPJwkRrLnDqSZW2Mpi1EcGqJXQJ6amPZbPk+Px2GETB6jrwczKWRBcTjwl8q/ztLfiuhOzxTwXKsTf9W3DppXQkU=
X-Received: by 2002:a05:651c:154:: with SMTP id c20mr4472762ljd.99.1589622655910;
 Sat, 16 May 2020 02:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200224094158.28761-1-brgl@bgdev.pl> <20200224094158.28761-3-brgl@bgdev.pl>
 <CACRpkdZSooH+mXbimgT-hnaC2gO1nTi+rY7UmUhVg9bk1j+Eow@mail.gmail.com>
 <CAMRc=Mf2Mx+rB7du8D66WP=Js0wuK8x44aT9H2q6JhLJvrOcVQ@mail.gmail.com>
 <CACRpkdaPwfpfDJ2CjGCVFbMvXaSnCXaisvb2N-edeZO0Tbkssw@mail.gmail.com>
 <CAMRc=Mf5cYtWxAVeMQmxwyoi9oxtVSidBQsdRV9H2E52H1TqKQ@mail.gmail.com> <CAMRc=MenC3i-jQYPMdnOfpvNvs1GzCo-B5oem3osdaZZ9mULag@mail.gmail.com>
In-Reply-To: <CAMRc=MenC3i-jQYPMdnOfpvNvs1GzCo-B5oem3osdaZZ9mULag@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 16 May 2020 11:50:45 +0200
Message-ID: <CACRpkdaAYox65p9=Aheu5iomJRGPBc7CvnxJqPeqXdNdunAXPg@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpiolib: use kref in gpio_desc
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 14, 2020 at 3:42 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> So this "numbing down" of the chip works - in that I don't see any
> splat in the above use-case but right now if nvmem takes an existing
> GPIO descriptor over nvmem_config, then it will call gpiod_put() on it
> and we'll do the same in the provider driver leading to the following
> warning:

Isn't that the WARN_ON(extra_checks) in gpiod_free()?
What part of the if() clause is causing this? I.e.:
if (desc && desc->gdev && gpiod_free_commit(desc)) ...

I suspect gpiod_free_commit() is causing it by returning nonzero.
We could essentially ignore that if and only if the gpio_chip
has been detached from the gpio_device.

This should fix the problem if I'm right.

Yours,
Linus Walleij
