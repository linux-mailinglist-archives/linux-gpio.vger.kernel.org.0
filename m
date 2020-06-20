Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BCF0202683
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2020 22:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbgFTU5P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jun 2020 16:57:15 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38322 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728514AbgFTU5O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jun 2020 16:57:14 -0400
Received: by mail-lf1-f68.google.com with SMTP id d27so7488186lfq.5
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2020 13:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ROHy8PT89Cn+9siMYllBMwwAqBhLcNofbVcwsnhhn8I=;
        b=Zh6LoBBZ3yC1GwNm+3u8GkIWTdtNwbBggK1igC6j3PNYJAhU2jdNvOTKbkOjJpz9+o
         Z5v5f1KOnuZHgpYGVph63hxrK6rvaeLv4STJJJVGx24RW4Gl4zeTJ3XkDxoaC57ng4Pl
         41gCJfrPR4/dDpRWI2PJpv9AiMiw3tTI7ftbbkjjrXe4Rlmp+ELXDuNfXt155ACJFclG
         jY2Cf1oMSTa/2oveAob+BlQWY1Phn3xu3htdqzN0kAqXEkvHdNnbWiCPQ6YIEuXTZlbU
         UzRDL9hdslnMOCClR3EQTpDDkkiqLAthali2GYYOkE5TxJAyq4XLJh72LBoCniMBSL+Y
         pmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ROHy8PT89Cn+9siMYllBMwwAqBhLcNofbVcwsnhhn8I=;
        b=CxBm+goIPMoBw7xGzsiwQjp9A6SIswo6NsJnMMLBffVm9+Eel8FEOVRJG04cBWQzDg
         qD26RFrUbs1qUv7q7JtFalr8e1++XhEb9Ns9ifL+hvEBXXo52KITlqDuFy79hHgUrOV5
         H+TeQ1LHev5NnmKpX85bivhz1qzOVK0qXDUNZortqukdEd72wijq/WrrdLxLHjeKJPkW
         NYD9zrbqGgSxLETNGXppo1qUiC5p4cgv6bnnRjEYphecSa9l/vM9raw5g+owcTeEpGcd
         J/L6g2NkVkkb4cEsdVdU84f9+VnzAmu4sTkN2CR46+/JcLCdW/VBW10nz27GDs/dJNjG
         XsGQ==
X-Gm-Message-State: AOAM533OLdk6xI48ZaimqgJEEVdr/KmYYM8DBViLGgnx9DJYqhszvqFY
        jaKZZSqrLvEQplmEPpvdOR6/nkRDdb/TTdaOYHA5E3a7Ggg=
X-Google-Smtp-Source: ABdhPJwT3d3Xzo+6D6WYQXEAqJJQ61tAXTpGEg1HRUSa4jDSvFFDUTOMRNlEjsw78HLYdmyvdQ2UbnbafURxxQjCQEA=
X-Received: by 2002:a19:ccd0:: with SMTP id c199mr2917354lfg.194.1592686571099;
 Sat, 20 Jun 2020 13:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
 <20200612145006.9145-8-andriy.shevchenko@linux.intel.com> <20200615115927.GG247495@lahna.fi.intel.com>
 <20200615120148.GA2428291@smile.fi.intel.com>
In-Reply-To: <20200615120148.GA2428291@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Jun 2020 22:56:00 +0200
Message-ID: <CACRpkdb0FYcNCJxNqj4sCFykcboe5SdAyVFu__jyLW5YHaqxbA@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] pinctrl: intel: Introduce for_each_requested_gpio()
 macro
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 15, 2020 at 2:01 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Jun 15, 2020 at 02:59:27PM +0300, Mika Westerberg wrote:
> > On Fri, Jun 12, 2020 at 05:50:01PM +0300, Andy Shevchenko wrote:
> > > Introduce for_each_requested_gpio() macro which helps to iterate
> > > over requested GPIO in a range.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > ---
> > >  drivers/pinctrl/intel/pinctrl-intel.h | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
> > > index 4e17308d33e9..c1f312bc28eb 100644
> > > --- a/drivers/pinctrl/intel/pinctrl-intel.h
> > > +++ b/drivers/pinctrl/intel/pinctrl-intel.h
> > > @@ -249,4 +249,8 @@ const struct dev_pm_ops _name = {                                       \
> > >                                   intel_pinctrl_resume_noirq)       \
> > >  }
> > >
> >
> > kernel-doc would be good to have here.
>
> Okay, actually I considered to have this in the gpio/driver.h or so.

Please put it there! It looks generally useful.

Yours,
Linus Walleij
