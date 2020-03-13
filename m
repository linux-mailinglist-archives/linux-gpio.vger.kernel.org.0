Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 088301849DB
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2020 15:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgCMOrk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Mar 2020 10:47:40 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:33504 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbgCMOrk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Mar 2020 10:47:40 -0400
Received: by mail-il1-f195.google.com with SMTP id k29so9169567ilg.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2020 07:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ro1R5ehcYhRf1s0gupnhw5Q+nbHwvID0ows7ral5AwA=;
        b=UULHVhHoV9B8wA8pT06k5F7CEKhKPJTemEriB5P4jsfUl+0MFuocFV+cKfEBUwJOZR
         44SDm19Y7MNYFx7IBYDxU1eeSaW08Y1QdU5wPqJ476lvQgn0/8iH8LZarWTvyzQ8f8Pq
         /yfiAazoYMLLCZA+WD2VvC0CB+j3dinbmK52mQS15VrJHiRU+hrdzgsvFqZQERc3wsoQ
         g+ZBlhE9WbwRtM/eaNTiBOiVTrV5D3Y6m0xAntdjTsJR7LHKx3cw/ImN5JlKvRE2sZTY
         CaoeXluOwsKMbIdEpQHSRSCk8Y3XWPOtb/vcDpCSafXtfOW3R/wFvDbweG9ep+FTXkfs
         6jCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ro1R5ehcYhRf1s0gupnhw5Q+nbHwvID0ows7ral5AwA=;
        b=jEAT/+FPYtYA17Q48DJpjLnNPJnC/5+Ccykd3nO1H8LB9548qpCefGDdpcmFbfTBNR
         BVKaNZuedC2KAcHu4Yq6JUz8co4UeTtP3LUsdskQW/+KnUBSNJEyZK/tSSTGyLQ2QzTZ
         7VfsHJ4AmT4jvABegxrIAplwhwzQsRKBYrI09yR/HibVO0mEnifdSFTedxXQOExTCDNf
         lPZgTFgf39PtKsgTrvpAkg/MmOr6XN86mPtWhMKbuc1Z+ya5ChCRqQOGwrLww4czLzP1
         xleZ1jthQLy2Ul1JLhVeQlmbBenjEdCx3MjXsz3qgLWA0VLHbsBcOBxVbNXwsMRiBcMS
         u7iA==
X-Gm-Message-State: ANhLgQ2gR10IpqLVk3U6xTDVHHpQh23+TFiYCnq5A1+3hKOv7eTmXUuJ
        HhEjL4PTlb0/C6JXdVG4X62qlQheFJEcxAY2S/R8VXn5
X-Google-Smtp-Source: ADFU+vsUQdVDGeuArwH8++3efQ8y7YMk8cNafYrhvyIqxS2kFexBfegk6QvD0SkMs57BFtt65r+sa+KzO6NudDFAdpc=
X-Received: by 2002:a92:d191:: with SMTP id z17mr14076733ilz.287.1584110859057;
 Fri, 13 Mar 2020 07:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200224094158.28761-1-brgl@bgdev.pl> <20200224094158.28761-3-brgl@bgdev.pl>
 <CACRpkdZSooH+mXbimgT-hnaC2gO1nTi+rY7UmUhVg9bk1j+Eow@mail.gmail.com>
In-Reply-To: <CACRpkdZSooH+mXbimgT-hnaC2gO1nTi+rY7UmUhVg9bk1j+Eow@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 13 Mar 2020 15:47:28 +0100
Message-ID: <CAMRc=Mf2Mx+rB7du8D66WP=Js0wuK8x44aT9H2q6JhLJvrOcVQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpiolib: use kref in gpio_desc
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 12 mar 2020 o 11:35 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
>
> Hi Bartosz,
>
> I'm struggling to figure out if this is the right way to count
> references for gpio descriptors.
>
> I cleared up the situation of why we don't want to add kref
> to gpio_chip in the previous message: I think we got that covered.
> (If I'm not wrong about it, and I am frequently wrong.)
>
> This mail is about contrasting the suggested gpio_desc
> kref with the existing managed resources, i.e. the
> devm_* mechanisms.
>
> devm_* macros are elusive because they do not use
> reference counting at all.
>
> Instead they put every devm_* requested resource with
> a destruction function on a list associated with the struct
> device. Functions get put on that list when we probe a
> device driver, and the list is iterated and all release functions
> are called when we exit .probe() with error or after calling the
> optional .remove() function on the module. (More or less.)
>
> This means anything devm_* managed lives and dies
> with the device driver attaching to the device.
> Documentation/driver-api/driver-model/devres.rst
>
> If the intention of the patch is that this action is associated
> with the detachment of the driver, then we are reinventing
> the wheel we already invented.
>

In this case I was thinking about a situation where we pass a
requested descriptor to some other framework (nvmem in this case)
which internally doesn't know anything about who manages this resource
externally. Now we can of course simply not do anything about it and
expect the user (who passed us the descriptor) to handle the resources
correctly. But what happens if the user releases the descriptor not on
driver detach but somewhere else for whatever reason while nvmem
doesn't know about it? It may try to use the descriptor which will now
be invalid. Reference counting in this case would help IMHO.

Bart

> E.g. to devm_* it doesn't really matter if someone else is
> using a struct gpio_desc, or not, but if the current driver
> is using it, it will be kept around until that driver detaches.
> No reference counting needed for that.
>
> So is this related to your problem or do I just get things
> wrong?
