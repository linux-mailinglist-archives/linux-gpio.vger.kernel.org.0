Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07B874A3C62
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Jan 2022 01:59:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235413AbiAaA7a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Jan 2022 19:59:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbiAaA7a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Jan 2022 19:59:30 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 266B4C061714
        for <linux-gpio@vger.kernel.org>; Sun, 30 Jan 2022 16:59:30 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id a8so11520101pfa.6
        for <linux-gpio@vger.kernel.org>; Sun, 30 Jan 2022 16:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MJ5WmO5qlv0Tr5IVqE4/0kdRGXzYePhARxgCWiL7a4w=;
        b=B+RAqRAce/RS3r+eKRYGDH83H3Uqa57ohbzd7b0Qup4fCENu8Ewjcq7y023Vr7YCSd
         WlzLceYhOPMcHZ0stbUtRqwrrNGRBgdc46gmndT2gStw5F2jTcUym3zbyafNkjRP1tCc
         VBB7ZRd7PBrlBNBcyGSnHqJTlb2pUCbqe/tZJJ65m72QGvaxIqEMsXb1JDiXxRmYrukJ
         nLL1W1dceIjidNPnncwsM3MJuowu/tDzFRMptBJBGeEiOHY3tuzoT0KTrvx2ZnWT4sJA
         D8AF1BYFLH7D7q2moK3FXCX5zuJNuTBijny48s7CwmUNwpsZDJPz2z/vG/ONaXsjbWNc
         UHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MJ5WmO5qlv0Tr5IVqE4/0kdRGXzYePhARxgCWiL7a4w=;
        b=dugy2f13IjXxiPCYx4RhldPeOx9kYVVJyJ2QfSbXXeCQaXZT/99we5zTAvvexSaBa/
         c4Krnzj2fjXJpAfSP0nWdKi3SQRquQ0vJLw5JqnPAztOn/qJUaPRKEtkD+VopiKpEtzD
         OZxFCs0pFQK0miXKzHvlbciMxk1ikMm2h0sVoGWBpHqBxxFnKJrkkpESMT6YNzgZCzzb
         96lNpxjUb2aVFhuoWjqU/ybqdydZ4bQij0g+SxqQ8kjex5ISfsDqvUjvy/dLIAmAsOME
         sKD/OA3aKEU8jpj48DvmyU+CBPoqs0gRO5gE9pHymN25pM0Drrn/A/5oEMgomQSHhdjp
         IgFg==
X-Gm-Message-State: AOAM533cPakdorJJtz/ko1g6csqW9QbMAX9HDMC9DJ4Rq2+oAs8Ftalp
        4aSt6eg70++RdzHhjULo4aw=
X-Google-Smtp-Source: ABdhPJyoOSLAyY9LHIxAnertyT95WMhEoGTPiJfMD7giHiY7M+CbPsZEIwtHL6I4nWW23So3U1wYrg==
X-Received: by 2002:a62:4e4e:: with SMTP id c75mr17832625pfb.55.1643590769372;
        Sun, 30 Jan 2022 16:59:29 -0800 (PST)
Received: from sol (123-243-144-88.static.tpgi.com.au. [123.243.144.88])
        by smtp.gmail.com with ESMTPSA id d9sm15957752pfj.79.2022.01.30.16.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 16:59:28 -0800 (PST)
Date:   Mon, 31 Jan 2022 08:59:24 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Gasai Maple <gasaimaple@gmail.com>
Cc:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        brgl@bgdev.pl
Subject: Re: A problem with gpios on my sunxi board.
Message-ID: <20220131005924.GA11753@sol>
References: <CAA=7Zrk43M3Q_cRnRwoJyyBk-C-3ACqvLg6toMou6eobsua7Uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA=7Zrk43M3Q_cRnRwoJyyBk-C-3ACqvLg6toMou6eobsua7Uw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 28, 2022 at 10:12:13PM +0800, Gasai Maple wrote:
> I posted a question on stackoverflow, it's basically about me having
> problems operating gpio with libgpiod, and a user advised me to drop a
> message, the link is here
> https://stackoverflow.com/questions/70863283/libgpiod-tests-fails-on-pcduino3-nano

It would be helpful to restate your question rather than providing the
link.  But anyway...

My best guess is that your kernel is built with only v2 of the GPIO CDEV ABI.
libgpiod support for v2 is a WIP, and 1.6.3 only supports ABI v1.
The CHIP_INFO ioctl is common to both, so will still work.
But all the line request ioctls changed so they wont.
So libgpiod is probably making ioctl calls that your kernel doesn't
support.

For compatibility with libgpiod v1.6.3, ensure your kernel is built with
these options:

CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y

And the libgpiod tests require that gpio-mockup is available as a loadable
module, so

CONFIG_GPIO_MOCKUP=m

If building a new kernel isn't an option for you then you might want to
try the development branch of libgpiod[1].
Or you could try my Go[2] or Rust[3] libraries that both support both
versions of the ABI and provide tools equivalent to libgpiod.

If you still have issues, try using strace to display the ioctl calls and
we can debug that.

Cheers,
Kent.

[1] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/log/?h=next/libgpiod-2.0
[2] https://github.com/warthog618/gpiod
[3] https://github.com/warthog618/gpiod-rs
