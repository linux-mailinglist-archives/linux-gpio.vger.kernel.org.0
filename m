Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35B8A30EFDE
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Feb 2021 10:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233668AbhBDJoo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Feb 2021 04:44:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234863AbhBDJom (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Feb 2021 04:44:42 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C631EC061573
        for <linux-gpio@vger.kernel.org>; Thu,  4 Feb 2021 01:44:01 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id b9so4153309ejy.12
        for <linux-gpio@vger.kernel.org>; Thu, 04 Feb 2021 01:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RvWUGt+ympmL3cWE6ntntn1B23xanMkb9vaTBwRHIxM=;
        b=pdc4ZugEYYdi7y5Yes8jifFdhdtSsLF9R8gGO8rxouBRQrbqoS7JTFU95StPCjzoAK
         /OI+QCTovZoueCzWfs8Q2ljZpJfALcBv0+VIMPNGKQf5ZAt/6HXy4EKnry8gJsf6mml9
         CAIeWOGoZKgAuwzXjixegbM9ntgVFdq9GBDPslT2809Dq6/Ktd8dcXObnPjtmE9038Uk
         Pfot/W8HhDc06T8VQ0sKXJkJZOYBGx5Ob4DZ9FHCqZmvS4B39ctY06T11EM69l3712hi
         z4WQpbB70TaCmP/qncaLkCDrM5L80pOBXnHw3DHKjhYVz+3C4emwy8PBIb/kdsCIebxu
         sUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RvWUGt+ympmL3cWE6ntntn1B23xanMkb9vaTBwRHIxM=;
        b=sBRh/IfhSmneS2pu//0az/JBFPdHckxUMqAPzM3SMsEnea5HW26Bjw4izAAZnMObmx
         wkoeVzgVuxpGz62mgxFVSunkkt/9Z7UKtyJMeOHA/8MEOMhhaErHpMrVtdJuxTu7/0Xh
         bwZxGQTDVbMfAW2ng+JHELney7RW6KbEhQZcQnuA2YpPgBAalc+M+9i+aEhcPeV+7uDo
         JKDWgL+Hn6+otHpplY+ca4RJ+5KsmpmvQeFo80l+oeT/ox6neH5OH4Mg3wW85CRx0VAd
         FhQxeWQyLOLQ9fNJS3ygmN3IX2MgZFolLI75LSM8dq8KJ0wJiQKoV0GdmJqXVnFHpTsT
         LX/A==
X-Gm-Message-State: AOAM532wWAsAsOl2lvTfXL9ZFcG6Ls5/HxosWfzEbGjl92rpu3q4d/4p
        42+YBtJuWxd1ic3hTi6/tf5euJVu4JQG2oFk7DnLELWxkew=
X-Google-Smtp-Source: ABdhPJy95Qv4rXPN+CfjFNzOuIekTyKCVoLLAPBCdrJN+pRtLkmUrRe/7YzTN1snqMFVBZhmYKRioZAdNs4UVn6pCyc=
X-Received: by 2002:a17:906:8053:: with SMTP id x19mr7122092ejw.470.1612431840417;
 Thu, 04 Feb 2021 01:44:00 -0800 (PST)
MIME-Version: 1.0
References: <20210203122325.19427-1-brgl@bgdev.pl> <20210204011923.GA9515@sol>
In-Reply-To: <20210204011923.GA9515@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 4 Feb 2021 10:43:49 +0100
Message-ID: <CAMpxmJX99n4JtUyNVqkAa1kCuSBX3dtee-5CXSe3z4Bf+SnOHQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] COPYING: organize the licenses in a separate
 LICENSES directory
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 4, 2021 at 2:19 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Feb 03, 2021 at 01:23:25PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Add the LICENSES directory as suggested by Greg KH. It will contain the
> > license files relevant to this project that is: LGPL-2.1 for the library
> > and GPL-2.0 & the Linux-syscall-note for the Linux Kernel uAPI header.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> I see you are following the kernel licencing rules wrt license file
> naming and formatting.
> Have you considered following the REUSE spec, as Greg also suggested,
> instead?
>
> Cheers,
> Kent.
>

The library is tightly coupled with the kernel so I thought it's best
to follow the same scheme. Every file also has an SPDX identifier so
together this looks clean to me.

Bart
