Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0E5030CB78
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Feb 2021 20:27:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239287AbhBBTZy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Feb 2021 14:25:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233403AbhBBTW2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Feb 2021 14:22:28 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F4D6C061573
        for <linux-gpio@vger.kernel.org>; Tue,  2 Feb 2021 11:21:47 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id v15so22314859ljk.13
        for <linux-gpio@vger.kernel.org>; Tue, 02 Feb 2021 11:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ea7rDE3iubBKRZgFdP9Rs4rz7Zn8SR/ombh7E1ZoYnk=;
        b=J8Axea178cTpmY5ApnnZ0gODAQh0DhK4vGyffddZPoBBxGiMvXjdaEl9zpqY4k7UVW
         1H6Krn0JLJHIYornslY8vJtUd1GmtvwloJvdE6OmGt78ckvZWEYagNaMnka4KwiqsALX
         p98ovUQZrr2gPQX1MuD5RkSNZH70tu/cXQ1CYFcrpacO4AkqPBTJrec+i+rKfBKKtgUo
         EfP08CcascMJosb1AqjjxPWRA8b4q9Khfhhz1+HFVqmpLWWnMoHn+U37eDRiaATR06Le
         4G7YSj1JK49cpQpKFWch/FnQrDdQrlT3wQZzekvOVMOkaP3vZd6Jz/vk6lPc4AZXt08H
         tLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ea7rDE3iubBKRZgFdP9Rs4rz7Zn8SR/ombh7E1ZoYnk=;
        b=rO77BkVKyLUcXqBHM7zVlr2VLcgkt5G8x+0URai435vIQEbiDGgt9TRfdk+jtrtnLf
         PK9R/mse2Ssdbyl/rPZ/1ZzzcYwv5QKkRT6ryiQ4jQiWOMSYgnPXqS6JJjhR6kviLBnu
         aLDDoipnvSqy2FioPXWrdT6xYsksFsUB4XSdatWV1DJaMV4YRvEsEK6w427hb8UuWI54
         dx7LFOzSAe1hfajFvKN7UUbpuZjsx8d1UTWY1XWdAyvU2EiR4WCpRlMyOHGZ0Kh/Se9k
         29k10KRc0Av0G2CpKwws2Ms5RusrHg8Xoc64zqbTWfgqlMTaECX7prKOisPVVOLNjkdf
         W9dw==
X-Gm-Message-State: AOAM532Cq8WUJpuVNd+fOK4V4/GZDCJt0HcJc2UZTX1lfI+ifEqQ4HDi
        5aSfWBAcVsXJZl4tA4OYnpk3m9hclzCEU/8GyYwyYA==
X-Google-Smtp-Source: ABdhPJxRPks8UrhrUryzSURHvOWhpqZoQrctb9pBOLnd5Y8LMXB8jGBR2CbBmqxTq5nq+iE7z6wIkLro9xYZvBzXl24=
X-Received: by 2002:a2e:9ec3:: with SMTP id h3mr13841334ljk.200.1612293705742;
 Tue, 02 Feb 2021 11:21:45 -0800 (PST)
MIME-Version: 1.0
References: <20210128153601.153126-1-alban.bedel@aerq.com> <CACRpkdaP8-mnXuBZRKad53tvGrS0BdfTRKNezr0mhRVf8qkYig@mail.gmail.com>
 <93036ef781d20df4c6017178cc545702bd0f42bc.camel@aerq.com>
In-Reply-To: <93036ef781d20df4c6017178cc545702bd0f42bc.camel@aerq.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Feb 2021 20:21:34 +0100
Message-ID: <CACRpkdZhOWxbOdfC3sh9BXj9dWTcm3gPuGjzz+T96==+G2-i2g@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: add support for open drain pins on PCAL6524
To:     "Bedel, Alban" <alban.bedel@aerq.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 2, 2021 at 6:45 PM Bedel, Alban <alban.bedel@aerq.com> wrote:
> On Tue, 2021-02-02 at 14:57 +0100, Linus Walleij wrote:

> > > +       if (out_conf & BIT(offset / BANK_SZ))
> >
> > I suppose this could be written if (out_conf & mask)?
>
> No, the mask in ODENn is per bank (group of 8 pins) and not per pin.

Ah I see it now (confused % for / ...)

> > The datasheet says:
> >
> >   "If the ODENx bit is set at logic 0 (push-pull), any bit set to
> > logic 1
> >   in the IOCRx register will reverse the output state of that pin
> > only
> >   to open-drain. When ODENx bit is set at logic 1 (open-drain), a
> >   logic 1 in IOCRx will set that pin to push-pull."
> >
> > So your logic is accounting for the fact that someone go and set
> > one of the bits in ODENx to 1, but aren't they all by default set
> > to zero (or should be programmed by the driver to zero)
> > so that you can control open drain individually here by simply
> > setting the corresponding bit to 1 for open drain and 0 for
> > push-pull?
>
> Yes the ODENx bits are 0 by default, but the bootloader might have
> changed them for example. Currently the driver doesn't do any reset so
> I think it make sense to correctly handle this case as it doesn't bring
> that much extra complexity.

Hm. I guess you're right if that is the style of the driver overall
(don't touch bootloader/reset defaults).

We don't use that style for interrupt registers because we don't
want interrupts to randomly fire, instead we usually disable them
all so the driver and Linux keeps track on what is enabled. But for
bias etc, I guess it is OK. But consider the option of just writing
0 into all the ODENx registers at probe(). I'm not gonna complain
if you really want it like this though.

Yours,
Linus Walleij
