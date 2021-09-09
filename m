Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2F14046EE
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Sep 2021 10:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbhIIIWL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Sep 2021 04:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbhIIIWG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Sep 2021 04:22:06 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B02C061575
        for <linux-gpio@vger.kernel.org>; Thu,  9 Sep 2021 01:20:57 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id v24so1513115edi.10
        for <linux-gpio@vger.kernel.org>; Thu, 09 Sep 2021 01:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SvrhCft4WJ9v1j20I5g17SKwQjTzLlIAfKKSZrc47do=;
        b=kqiYc6Tu/FDx9Q6+Oz24BDaI0fvKXENOSKC+PaAtE3KL0CpoeDxVibz/3pBLTo+96W
         vAZXgg60LtgDnnogtObaRq6LeTMffVFxJxUhHLMWztX3NvTEU4slIfHeu4Hm2te9o057
         FlHE7vc44opYPa79aBDK8z5hQoCW+cYRk3mn/FAqAY87vQqORjxUUvcUg1HmpWiLc6EU
         7foFoSN7qnqMgrkYYpn75zmVyUWL7jwb2WCGNKKL0dUGNoPf6DrwIBQTTKyO8FLYLdPb
         uAV+QI2wuRAUcdP15730LQX8D919zgS0uCf8Y0olKVO9NoWkg4Mtnse+iODTHNLVQyvA
         /gog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SvrhCft4WJ9v1j20I5g17SKwQjTzLlIAfKKSZrc47do=;
        b=feT7zDu1iOfopnO6aAFB+eU9zG/kThLpkdZNWTVlWSFp1RKtWi3lZH4HJE4Uv1erSu
         pG0XXcnUfbIeadhdsVIYRPZbyzEEePwFk765TxVUBAc0Wdt42eIUi7WP5N9afw+QjKNp
         YiHNuF36/gYBHDUzkpSLn7gkUuQaw1zV11o6GtJum1sltdbJ0ltaHx7hBI/pWFDS/2yL
         xRTyGDpQ++JVfqwSONSYAAAzrVIQbRYyLk63stxbh17neUqrlwSEgFdLJZbRYrC+C616
         We/oTfcFQcVc4+Whl9ySyyvhH8yPL44h3ZLyh/cfX4uId94u4bzgQCsuTPytNneRLxBR
         Osag==
X-Gm-Message-State: AOAM533+1izNYVycXZ6PhND2/NLjWO+np3GqrIFqLOgb4Kk/BhaPA3LL
        9mjFr2Ul7unbIevs6jFR+iIxE5NLRJ2FE4MX6mQRRZDE+hr40w==
X-Google-Smtp-Source: ABdhPJwpKricuE923hrFJhiYKWDOIkNuagYs9ttqL9obtOgrfk16PST+0biaczW+Z+30lEUE+hKaGlM0H1uIik3PfQw=
X-Received: by 2002:a50:fc1a:: with SMTP id i26mr1929838edr.172.1631175655726;
 Thu, 09 Sep 2021 01:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <8a49314e-f727-aace-9c54-122b038d1fad@acrios.com>
In-Reply-To: <8a49314e-f727-aace-9c54-122b038d1fad@acrios.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 9 Sep 2021 10:20:45 +0200
Message-ID: <CAMRc=MeMhxv60r4M-Obi1TYo97n0YaYYyRNR7HNLT5ousbUYAg@mail.gmail.com>
Subject: Re: [libgpiod] Add Lua 5.1 binding for libgpiod v1.0.x branch
To:     "Marek Novak | ACRIOS Systems s.r.o." <novak@acrios.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 7, 2021 at 6:10 PM Marek Novak | ACRIOS Systems s.r.o.
<novak@acrios.com> wrote:
>
>  From ca1b5688de2d1cb63bb9823e28b87c52f23df449 Mon Sep 17 00:00:00 2001
> From: Marek NOVAK <novak@acrios.com>
> Date: Fri, 3 Sep 2021 18:41:02 +0200
> Subject: [PATCH] Adding Lua 5.1 bindings as 'gpiod' Lua module
>
> - Adding bindings directory with wrapper code
> - Adding Makefile.am for building and distributing as a Lua module
> - Adding --enable-bindings-lua option for autogen.sh
> - Adding examples with basic lua gpioset and gpioget implementation
> - Output, input and event input with new(), get(), set() and wait()
>    methods are implemented.
>
> Signed-off-by: Marek NOVAK <novak@acrios.com>
> ---

Hi Marek!

Thanks for the patch, any new bindings are much appreciated! However
the 1.0.x branch has been unsupported for over 3 years. Why did you
decide to base your work on this one?

The currently supported branch for the 1.x series is 1.6.x but even
then I don't really want to add new features to it as we're currently
developing the 2.0 version which will become the new preferred base
for all new work. Any chance you could base your work on the
next/libgpiod-2.0 branch just like Viresh did with his Rust bindings?

Bartosz
