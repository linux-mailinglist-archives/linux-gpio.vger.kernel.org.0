Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3480429EEDD
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 15:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727839AbgJ2OzK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 10:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727291AbgJ2OzK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Oct 2020 10:55:10 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60DBEC0613D2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 07:55:09 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id z23so3482052oic.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 07:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vaQMcBVCJJD/JJxT+ZZ+fIMXdbxYyZLYCDfn47ZYa0E=;
        b=mS9uIhUQShUBkkEziKcu+TR/U8DghYVfsadLZ1kIXzwm+4lqzYPZ4zXfy6fMZh227h
         yWnBpoW50KAteRnofRkWxm6k8l2piC3wtlvz3o3VeiE/h41ylkObob1xcV0jUKRRKQHD
         0na4FH8ChQlCm6bPsqMIryFSmAajgMjDDzzWwq9r9XJjP/T2dTwoGBndw261GK+U9894
         x7QOWYJQWTA+Q6hzDmr6UTvgxGor8RRAv1XcuHLi2rFMJ6VgkcjRkQrhbqMwoTe4NLdK
         /5xPwAnuHI+dUoQy1XXQs1bY1ka2557N66QVIWlRbdGqhv5vUDExrq/Q5VzeUWNIv6Qy
         +/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vaQMcBVCJJD/JJxT+ZZ+fIMXdbxYyZLYCDfn47ZYa0E=;
        b=n/uyvyJp0RLVL2TS+c0gtPM8D1fpOCfmWPBZ+oBj2jUxIPhv1aRakiTMW2738jNroj
         Wzw73vo+aDz6RLe/tJQwXC9ZaGIe4oY4/O4u8kN/jsbaixH+1zx8xNphAV6uYmoJMs1/
         7w8amJMIfIw3iykLgQ6KwaZI58eYT2hzSttzGApiFB/Y97ifdyPqCwUPzPmGXsyMBXa6
         dnC0CHiFYaFjRasxJW9BGjHuAdphGPw+RaZsTABR40GCZ1vApJNkUW7TAWlVSeA5hrMO
         CGg7669O33U9NSRPbx7MF9PJaXdSqC4PpNCh92PnhLbjZJYcxlDKjLbAEzcoic/jTNhF
         YpUg==
X-Gm-Message-State: AOAM5334jcu4zR1S6O5ajzjCh2R8F8jYHWxa4nbHIG5/qIVgzii4GDGA
        lewFsYa674k/O64f/fs7B80O1oPKJoaMf80NIQYWZA==
X-Google-Smtp-Source: ABdhPJzKPF9BtphNice5MU505ZS0vyVa3wcrmTYTZHE8EPBAeneBwFHc3ky1Bp5ivj4DrR+4xh+c2MdWohhUdgf1DJs=
X-Received: by 2002:aca:cc01:: with SMTP id c1mr169129oig.128.1603983308507;
 Thu, 29 Oct 2020 07:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201028205101.47583-1-andriy.shevchenko@linux.intel.com>
 <20201028205101.47583-2-andriy.shevchenko@linux.intel.com>
 <CANiDSCtRDwfFo9HE84iujjFe6h9aS6b3B8wkz5Rt0aO8=XMsNg@mail.gmail.com> <20201029144656.GD4077@smile.fi.intel.com>
In-Reply-To: <20201029144656.GD4077@smile.fi.intel.com>
From:   Ricardo Ribalda <ribalda@google.com>
Date:   Thu, 29 Oct 2020 15:54:57 +0100
Message-ID: <CANiDSCuNVT=jr8rLyfWhGKNSOy5OnH7YBZaWSguBDVg219OGvQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] Documentation: firmware-guide: gpio-properties:
 active_low only for GpioIo()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-acpi@vger.kernel.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy

On Thu, Oct 29, 2020 at 3:45 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Oct 28, 2020 at 10:10:42PM +0100, Ricardo Ribalda wrote:
> > Hi Andy
> >
> > Thanks for your patch and super fast response.
> >
> > I think there are two different concepts here:
> >
> > 1) when the pin has a low value, it is  0 or a 1? =>active_low
>
> I'm not sure I have got it. GpioIo() has no such property and
> _DSD active_low is documented as being polarity setting:
>
>         active_low == 1 => active low polarity.
>
> > 2) when do I get an irq, low->high or high->low => irq polarity
>
> IRQ polarity is clearly defined by GpioInt() resource in the ACPI
> specification.
>
> > When I read the acpi spec for GpioInt()
> > https://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf page
> > 934, it has the same problem as for GpioIo(), it does not express the
> > active_low and this is where the _DSD field comes handy.
>
> ActiveLevel field is described in 19.6.55 GpioInt (GPIO Interrupt Connection
> Resource Descriptor Macro).
>
> > Without using the active_low, how can we describe  a pin that is
> > active low and has to trigger an irq on both edges?
>
> This is nonsense.
> What does it mean?

Let me try to explain myself again:

I have a gpio pin that produces IRQs on both edges. so ActiveLevel is Both

The problem is that the value of that pin is inverted: Low means 1 and
high means 0.

How can I describe that the pin "is inverted" without using the _DSD field?

Best regards

>
> --
> With Best Regards,
> Andy Shevchenko
>
>


-- 
Ricardo Ribalda
