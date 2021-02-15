Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADCB931B5D7
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Feb 2021 09:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbhBOIQV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Feb 2021 03:16:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbhBOIQS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2021 03:16:18 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39533C061574
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2021 00:15:37 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id v10so4325100qtq.7
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2021 00:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2/5aD+Pft1i7EJUD5MLwm2C5HF3OHHKfP2GIeSPDb08=;
        b=EKmetjoOrWqNm2V93BI0cdEQPrYYiuTvtAQGSxnebboGCT/NL8rXAw1b7pm62dreSN
         Go+XUSFcEgHd//dx2ABtrjOLL1Hmc4ZErQwfrqCptofou/LOpkaTvMRdp28w9HyobmTk
         AKaSAvY7geTJU1/YKouf47rcdPCOFdixOiyKieuNgdNkOWINxJDvvNQak1KK0IAzsWle
         POIi8uPtYIU9qR0VIsDTUfhLCrrE8EJDbPwY4MBY5eyJo810tDuSN7jlVOxvXIlJ7Y0J
         j5DoGk2+oqfgMhQYiQ1fqm9Bc5LuMD9mknMAqgbGovkH3jBE3A4diWDqqUPSNZO5k2aq
         +FSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2/5aD+Pft1i7EJUD5MLwm2C5HF3OHHKfP2GIeSPDb08=;
        b=hsWIpgO9KDWeOZhuMooJoVE5GEkAZWjxgq04hDqdlqz6TjALue2lMViFWPeQwHyJTS
         X8hbe86J/TpMFc8bmaV7OLdSILRN4A2l444uPCI+um7ipOmsya+efQ72Cd8UWFBeomIi
         jqoF51XVGMDQUuqBRyHN+37CsxLbhTlSALdb55edLB/gAZp0JJuJiuuGhKDKS87hiWH/
         NZE2iU4y0rCXSkVQDwctZGHfseHRKSC7YGRL5k1OWkaQ3GwFG0afHXX8s23+lwI7kMFF
         y8IrNb3uG4zqFIVajji3fmqEcFez4SVZNT0j0pZIBeefzX5G+LMspeq3EMzkRW+6mHMy
         oh6A==
X-Gm-Message-State: AOAM532dVibecVlUa6z2QxIao9X+VAux6iqPF3/SKttR/t2zlgC8bqNq
        jZGzvYDrjNP21TTeG8tSC0AcIUINPygWGu8d3w/v0t5j6Vg=
X-Google-Smtp-Source: ABdhPJz+c1jNNt0AVzrYm2KLwZ1Re+aJu3vmFNrw/lvbJJb2ePEvGd6JsyhQLYlU1MmqXZYPoMmE3AXKbsAwX6JO6x0=
X-Received: by 2002:ac8:c44:: with SMTP id l4mr13154353qti.155.1613376936127;
 Mon, 15 Feb 2021 00:15:36 -0800 (PST)
MIME-Version: 1.0
References: <CAJAEvhib-M-UQeoCDs+aex-hdE-vJSQk=C5B7z4A9WmR+JcxQQ@mail.gmail.com>
 <20210213002336.GA7405@sol>
In-Reply-To: <20210213002336.GA7405@sol>
From:   Pedro Botella <pbotella@gmail.com>
Date:   Mon, 15 Feb 2021 09:15:00 +0100
Message-ID: <CAJAEvhjQv5hg9GvFXTFotq5ctsKnzXaTdb56KmkqQepAKcfAuA@mail.gmail.com>
Subject: Re: [libgpiod] Bug in python binding when requesting output?
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Okay, got it. I have understood the function incorrectly then.

What I wanted to achieve was for the output to keep its current state
if it was already configured as an output, which I thought would be a
reasonable behavior. So I will instead wrap my requests with this:

def gpiod_safe_request_out(line, consumer):
    if line.direction() == gpiod.Line.DIRECTION_OUTPUT:
        # already an output, request as is and the output value won't
be modified
        line.request(consumer=consumer, type=gpiod.LINE_REQ_DIR_AS_IS)
    else:
        # Read current value
        line.request(consumer=consumer, type=gpiod.LINE_REQ_DIR_IN)
        value = line.get_value()
        line.release()
        # Request as output current value as default value
        line.request(consumer=consumer, type=gpiod.LINE_REQ_DIR_OUT,
default_val=value)

Which won't modify outputs, and if it is currently an input, will keep
the value at the pin.

I don't think I'm the most suitable for providing a patch for the
uninitialized default_vals, I'm not very well versed in providing
patches to the linux source tree, but I can give it a try if you want
me to.

Thanks for your help Kent!

Pedro

On Sat, Feb 13, 2021 at 1:23 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Feb 11, 2021 at 09:54:22PM +0100, Pedro Botella wrote:
> > Hi,
> >
> > I'm experiencing what I think is a bug in the python bindings for libgpiod.
> > I believe a line.request with type gpiod.LINE_REQ_DIR_OUT always
> > results in that line being set to '0'.
>
> That is correct - when requesting a line as output at the kernel uAPI
> the initial value must always be provided.  If you do not provide
> default_vals via the Python API then the output should be defaulted to
> '0' by the Python binding.
>
> > To reproduce:
> > 1. request a line with type gpiod.LINE_REQ_DIR_OUT
> > 2. set the line to '1'
> > 3. release the line
> > 4. request the same line with type gpiod.LINE_REQ_DIR_OUT
> > 5. get the value, it should now be '0'
> >
>
> To clarify, the expected behaviour is that the output is defaulted
> to '0' if default values are not provided.
> So the problem you are seeing is that the output is not consistently '0'?
>
> If you are expecting to see a '1' then you are expecting the lack of
> default_vals in the kwds to leave the output value as is, but that is
> not the case - it should default to '0'.
>
> > I think the issue is in "gpiod_LineBulk_request" in
> > https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/bindings/python/gpiodmodule.c
> > There a call to "gpiod_line_request_bulk" with default_vals being
> > passed as a pointer. Later on in the code, this parameter is checked
> > for NULL, if it is not NULL then the values in the array are used as
> > default_vals.
> > I believe that a NULL pointer should be passed instead if no
> > default_vals have been requested when doing a Line.request from
> > Python.
> >
>
> Agreed - passing default_vals uninitialized to gpiod_line_request_bulk()
> is a bug.
> It should be zeroed, or a NULL pointer should be passed if the
> default_vals were not provided in the kwds. Otherwise the output
> value will be set based on the uninitializezd contents of default_vals.
>
> Would you like to provide a patch?
>
> In the meantime the obvious workaround is to always provide default_vals
> in the kwds.
>
> Cheers,
> Kent.
