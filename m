Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7489A14669
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2019 10:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbfEFIcv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 May 2019 04:32:51 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43723 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfEFIcu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 May 2019 04:32:50 -0400
Received: by mail-lj1-f195.google.com with SMTP id z5so5198575lji.10
        for <linux-gpio@vger.kernel.org>; Mon, 06 May 2019 01:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LG7CMOG7mUXHYvwai7h9jeO/N27B459NZtUJTIfXcXg=;
        b=lsIGX/vdan0lnht6G3ppGCNQfIQw+AJebUOvvU6d/sMtB4ucsMSHfCBbvaVF7/5z36
         Qf8nBzLsnHL44AierZZlvR8Gu3TvgqjdNEfZ/tW/D9mOusYvWcHgZVyvqdhf45WL8RzL
         dNE6OYytr7u/hHNdB4RtFle7h95X9tlOTvCv/JhjgKUs0QJPfJZxi5oC8Ra1nA3ZOosa
         naarg6Tmvkrt2l+IvFbNfVNM4SvXCQJfiKH/fa8WCry6up+vNqyoNuPPLCgkr3a8wvLQ
         zxDJS5+7NWV5G/G2tE4/rKMFY4hiuXp/pN95gU8uX7P9y3STUi9QXa2idg4M+mQJKqUb
         ltBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LG7CMOG7mUXHYvwai7h9jeO/N27B459NZtUJTIfXcXg=;
        b=PFxs3ssc3gJkSAlgZ55XWc15LcPOGPdiz/scZVl8WWIiVMGl5i3kS2U54S4MDvV7/h
         BWPBsxKh1vpwpzJ+a9dJ4pDTXadfMS50U0bSQYH58h4QCoqxTOlzORSsgA4JLyn4aVCX
         0iUUTBO9vKg5ZLLsnlTj61umFr2KvmQM4TfWN80IWOZa9qDv3Ip6NyfxFb0aMZXni0xb
         8/DsUcLytE2ER3Csn84NuteC4Ta9ejozl8g4Xgc9IjH3fotFHEru+m2x1fFTAizPGSQ2
         c8EzLYpsbpC0iZdl5spo6h2Z158xS7gQYXVg/BggsT6MAgn9iJtzRH0S9pHI+WkK3ZyU
         wtzg==
X-Gm-Message-State: APjAAAXOxf23bwFshwsmKl+Xw544Y+atUrHshTrbMte314X/7e6esWLL
        muHzw7DQC0llQb6DYkjPXcQCVsZuQGra14LuWhdF/g==
X-Google-Smtp-Source: APXvYqxJXzzjY6f1QpvdDsyfDGE95O1Nq3cafgO8hsXseCFFYMYvkPQCSohynK9CIqOYuhu5fEUIftfNmONdEqOvrX8=
X-Received: by 2002:a2e:3a17:: with SMTP id h23mr13836773lja.105.1557131568847;
 Mon, 06 May 2019 01:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <1557122501-5183-1-git-send-email-harish_kandiga@mentor.com>
 <1557122501-5183-2-git-send-email-harish_kandiga@mentor.com>
 <CACRpkdZ84hkg_8J+OAYpZD0CFzENkUMeaSZoMyTK+hBdTCKGqA@mail.gmail.com> <ca559ed5-69ac-b578-2b82-fc0a4d532d3d@mentor.com>
In-Reply-To: <ca559ed5-69ac-b578-2b82-fc0a4d532d3d@mentor.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 May 2019 10:32:37 +0200
Message-ID: <CACRpkdYJ930fnO5a1HtUzRL5x1qA9cbgvEJb7mnwC=JLQOKXqQ@mail.gmail.com>
Subject: Re: [PATCH V1 1/2] gpio: make it possible to set active-state on GPIO lines
To:     Harish Jenny K N <harish_kandiga@mentor.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 6, 2019 at 9:57 AM Harish Jenny K N
<harish_kandiga@mentor.com> wrote:

> Can the userspace consumers define the polarity?

Yes. From userspace after opening the GPIO character
device:

#include <linux/gpio.h>

struct gpiohandle_request req;

req.flags = GPIOHANDLE_REQUEST_ACTIVE_LOW | GPIOHANDLE_REQUEST_OUTPUT;
req.lines = 1;
req.lineoffsets[0] = 0;

ret = ioctl(fd, GPIO_GET_LINEHANDLE_IOCTL, &req);
(...)

For more details on how to use the character device see tools/gpio/*
in the kernel tree.

> Intention was to define polarity for lines which are not having consumers from kernelspace.

OK the above should work fine :)

> > Even when using GPIOs from userspace (which I do not
> > recommend) the character device suppors a polarity flag
> > GPIOLINE_FLAG_ACTIVE_LOW so also userspace
> > consumers define polarity.
>
> yes. aware of the GPIOLINE_FLAG_ACTIVE_LOW flag to get the status.

Sorry, I was being unclear,
GPIOHANDLE_REQUEST_ACTIVE_LOW
is what you want to use.

Yours,
Linus Walleij
