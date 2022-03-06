Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 163064CED5A
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Mar 2022 20:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233962AbiCFTXX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Mar 2022 14:23:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231760AbiCFTXW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Mar 2022 14:23:22 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8A4DFDC
        for <linux-gpio@vger.kernel.org>; Sun,  6 Mar 2022 11:22:28 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id c19so7390848ede.8
        for <linux-gpio@vger.kernel.org>; Sun, 06 Mar 2022 11:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SOngMayxNHqeCn7OqsqqAr81ndLGcG85KISys/NQnG4=;
        b=NYyocS5AbYbPIrOoLtcvFCPoKGPPTeOAj5Dh5LhglsgILd27MSS55Vn26X3gMtc7jq
         Sb4Stp83M7JNAg8TQBE6coOiY/pHBlbxSkmT5/hVexqLivk7irLYBfXkubnX8LwYCQY4
         mIA+UNidr1Ujs1fiN7hguvwNogGv4VXaJBPPf8Dtd7EL7XWp5TyEVKpB9Kfe8/GUOTZa
         MQhB1naWUgpbMvRG6f83kctMsAgvw6IshZ3q4bjqxuHy2ZgjI2KcvBQAert63efRPXYT
         raM7gNlHNAB/7D5IVe2Qb95kXXVlkDPAWWRo0lt+GKSFNrOjCzWLNEiHPXKAxCBpRGHO
         vs0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SOngMayxNHqeCn7OqsqqAr81ndLGcG85KISys/NQnG4=;
        b=R2JGLLjmXBFy4PA/9LJhICVGA3iLs3IrideDxrUWt2kM+/ofI8RaQpKny7ubyBlwoA
         0t6RqQ701WB1u3D19O/EfIJG42wB0rY5/E89Pd/vtlWcbWYnJyLTjAx96QLtmxoaoZrL
         M3o8OSOpvh4qHKMyASsB8lZuSmi9al07WI1zBWuaBNeFsSrHoGbRoUlXMxjrcTfle8BD
         keUfga+VRIOn5qpIVeHfN6mb/4Lt2f0UCt2T+SxM3JfnILDkHn3HF5bALvw+kbPOuQZW
         XyGs5TKf5UZR1yc9xj7JorMJhc0xfmx7fRC6/A4VSdwL43cW7aFF6sBPdNqkQUPKGvlC
         PKQA==
X-Gm-Message-State: AOAM533qrOZkFtrDYPtYofb+8iRRU3HMF7Vcs6WO+4mvZsmt4sgOcJA7
        G9QUILRQeL6AWvS/TR+V+ZMjINQlaz7p4pCLXOH5qQ==
X-Google-Smtp-Source: ABdhPJzgg2rrbtBDYNWYS1q0Fw02+SQtAyTT+BsxNke0yrYjb6pKShAK0ywNRZJKkcg+86P3IZB7RguVRS7J2deV5IM=
X-Received: by 2002:a05:6402:b3b:b0:416:2e3e:371e with SMTP id
 bo27-20020a0564020b3b00b004162e3e371emr5500559edb.145.1646594547399; Sun, 06
 Mar 2022 11:22:27 -0800 (PST)
MIME-Version: 1.0
References: <20220305154256.278394-1-brgl@bgdev.pl> <CAHp75VefVkNfGoFKtG3-3fF4TEiu33u-EaASEiTUmj_OAm-onA@mail.gmail.com>
In-Reply-To: <CAHp75VefVkNfGoFKtG3-3fF4TEiu33u-EaASEiTUmj_OAm-onA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 6 Mar 2022 20:22:16 +0100
Message-ID: <CAMRc=Md011QRB1z0h=ktYwxKJbH1EQhvZWLnNzU1bhpXuo9sqA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix the size of the ngpios variable
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Mar 5, 2022 at 10:27 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Mar 5, 2022 at 10:14 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > The ngpio fields both in struct gpio_device as well as gpio_chip are
> > 16 bit unsigned integers. Let's not risk an overflow and use the correct
> > size when reading the device property.
>
> ...
>
> > -               ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
> > +               ret = device_property_read_u16(&gdev->dev, "ngpios", &ngpios);
>
> AFAIU DT format you may not do this. The property is ABI-like and it's
> 32-bit (BE!). Reading as u16 will bring you 2 MSB (bytes) out of 4
> from the 32-bit value.
>

Ah right. It's not very obvious from the docs but the DT syntax must
be different for 16 bits. In that case our best shot is to read a
32-bit unsigned integer and check if its value doesn't exceed
UINT16_MAX.

Bart
