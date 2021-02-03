Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7170030D726
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Feb 2021 11:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233629AbhBCKNu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Feb 2021 05:13:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233336AbhBCKNs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Feb 2021 05:13:48 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E57C061573;
        Wed,  3 Feb 2021 02:13:08 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id y205so16337757pfc.5;
        Wed, 03 Feb 2021 02:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2ZcZucdJx6rmZAplqwyhWY8+xXZSXWNkSZSD6NOfjm0=;
        b=tUeZKM0KZ7jUSN/vXx8Bt6/FMS4h8iNDsZpI8gigjMgKLU+HBB96fYCOAabzwafUvr
         w49GcfsMsaEApvT9U7eSpIXSHMMthLkMW3fRNdhA+++6I+jMxGAIBVKCNdP5kCgpSU3I
         DX/H6Fl5mvT4BxEhiV5aKrumplE4bB0f1abU/NR9tk6/6tSKw/chhktinA9UwEOB8rv6
         3b+ndFWMVJWwXY1yXvz0kHdt1iCIZSO718wEBwVRmduMLdr18XKdQX/uPdDEcr8LP2H+
         sxM67zWQZxAmil4vSDxVV7Sq5FAYtFG+1U1VIUvJq7FLzccgKPBoK4xF9+sOXHPBDZ0T
         KSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2ZcZucdJx6rmZAplqwyhWY8+xXZSXWNkSZSD6NOfjm0=;
        b=rrl2NybqlNJcgmFozVTOWKG6xW3E35tED9K6XfInnig2Gg8nMJsI7M9mA/+NQ8JHrc
         aAOUF95J7ufCr6WqGEgWJw/dHv3TOziQwLkP4UCXNPX8LAeoOIPqJ6my+5OHcB4axdWC
         jRhbDDwx7/Zx1lxwr39JlNKrCQCmOFSTvioIF8rodX7A4r9Jjyjc4FkOB6t8UTNNnAln
         4oa0sqIzPHtxiXVUu7eyv/7PPmSx5Xdwf//d5bwQWB/e002FdS8BNL2vMQgnzASP2ZTA
         wA+aI6rYlT0D3AhgSlQDmxeIY7gHghSy/ZQXGwDNmq1z++s4YTk0O3IqFY/HWDPwzyBk
         RERw==
X-Gm-Message-State: AOAM53093Nj60fcTiqIN8lFLw1F2sdsAb3YPa3gBoVJlvQWLZFez2R1n
        pLk60ybv4T81uajB9Kz/2HVxi5UEb5pexhaMjuc=
X-Google-Smtp-Source: ABdhPJxfwd8Su03zjJTjAJjg03uIynx1X2s6dgcdeUr89bn4fJfIV55MwvhA06m7OR+Gk/UEdHJtltzXPk2/5vnCUpM=
X-Received: by 2002:a63:e50:: with SMTP id 16mr2835213pgo.74.1612347188209;
 Wed, 03 Feb 2021 02:13:08 -0800 (PST)
MIME-Version: 1.0
References: <20210128153601.153126-1-alban.bedel@aerq.com> <CAMpxmJXACfOkRB6m-_n_EmUf=6zLjQAie-UcQw+MNr-rTRC2SA@mail.gmail.com>
In-Reply-To: <CAMpxmJXACfOkRB6m-_n_EmUf=6zLjQAie-UcQw+MNr-rTRC2SA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 3 Feb 2021 12:12:52 +0200
Message-ID: <CAHp75VcPeJOrX0A3DLM8Z0v-H2xVd0TrrssEXe5ZMOFcspsrfQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: add support for open drain pins on PCAL6524
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Alban Bedel <alban.bedel@aerq.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 2, 2021 at 1:45 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> On Thu, Jan 28, 2021 at 4:36 PM Alban Bedel <alban.bedel@aerq.com> wrote:
> >
> > From a quick glance at various datasheet the PCAL6524 seems to be the

Oh, even more typos

datasheets

> > only chip in this familly that support setting the drive mode of

supports

> > single pins. Other chips either don't support it at all, or can only
> > set the drive mode of whole banks, which doesn't map to the GPIO API.
> >
> > Add a new flag, PCAL6524, to mark chips that have the extra registers
> > needed for this feature. Then mark the needed register banks as
> > readable and writable, here we don't set OUT_CONF as writable,
> > although it is, as we only need to read it. Finally add a function
> > that configure the OUT_INDCONF register when the GPIO API set the
> > drive mode of the pins.

...

> Maybe call it PCAL6524_TYPE for consistency with the ones below?

In case you continue modifying this driver, I agree with Bart on
PCAL6524_TYPE along with new OF_6524() macro.

-- 
With Best Regards,
Andy Shevchenko
