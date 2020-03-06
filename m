Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3E2917BF71
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2020 14:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbgCFNpW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Mar 2020 08:45:22 -0500
Received: from mail-io1-f47.google.com ([209.85.166.47]:46639 "EHLO
        mail-io1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbgCFNpV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Mar 2020 08:45:21 -0500
Received: by mail-io1-f47.google.com with SMTP id f3so2075627ioc.13
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2020 05:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WuApL3X5yvbO+AgnB8xRJgZzd7LGT5xtTda6QvHLxaY=;
        b=U/GdrhO8+8M0w2UagLB2wSAHO4O9O8tVCn0i0+WX1k+2IbSKLFZ93UosKkiFCTzUOA
         t1pQdmFQu8mq6N9dmVgQp3ch9gr8n73/UDA07K4IFiVhe2CwsTxRrIBhmwfR2HCKvwx7
         GGvjnOzL3EZf8YL58QEOAC9GLeI8HYE8lQAN7Xg+oc0EPbhmAIeZhM8K1ewxsbKGXYNY
         D16GR4rmL/JAtEeIGejLnueeewE6J9bVXMhC/yDB8UwUJMHbY7d+Z6Bl961ClLb1kDXS
         Yf2+nzK0xOSZP2QhW3VtEzqpsH5nIC9HKZXfAQWN4P8Ft346IHPjHzItXJ/VoIPhAjWb
         XV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WuApL3X5yvbO+AgnB8xRJgZzd7LGT5xtTda6QvHLxaY=;
        b=AjvAOwkI5c5RxlzxaiuH8nt1RKd5ay9gUxxeuXNclratgsJ1SVIqFjUDarCKrwl5OD
         V8rztmpwaTmh59TQS1CwI/HdQgQGORFuBVkDbG030C8rukC4kLlz6VxrJzOGiYTeRJZT
         1MZoFCWq9kS1D8m3vgN5BbHuRbM7Az8tWM2pn+bMv/769FcD3iDXh5F2c/8LrlPwsZGR
         DJTvhBzpOboD5zbB6ZQ2u3MFDjIo6PvkrVtpjMTZBz7MNY7zeBgHFW6sHJRTUJKSgG0R
         zcg/6sNBnm89CBxHoC4svlUQOrwAv0w6w+3o8kS6Cwdla6sBnrSwAHFVJmWFkBrcYCP2
         p6ag==
X-Gm-Message-State: ANhLgQ2jtIPlf0ZJrtfwXHmxAP3x5/wjxNxXOXFTPjwn8lhGCuT5Sybn
        iSPhGttw13kK7BdC3cb0jXUxejh6hiCbQFTAo+aFToCb
X-Google-Smtp-Source: ADFU+vt2pFYovVS+3IFtAFk/9sFqZ3YUhjravxkYTUNsUDwNHE99ybADxCxCWvN9ycsaayj6NS0S07XssqnFWMACuus=
X-Received: by 2002:a6b:ea0e:: with SMTP id m14mr3018614ioc.135.1583502320947;
 Fri, 06 Mar 2020 05:45:20 -0800 (PST)
MIME-Version: 1.0
References: <CAP6JJ88N28Tn+j=jonj8fVWmoVCLwK-4_6e-Vn8z+E7WDFHC=A@mail.gmail.com>
 <CAMRc=MfgpwTM54oVkJsQ0ue0uibj0OMEDZHOQPEabPkRPSm6CQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfgpwTM54oVkJsQ0ue0uibj0OMEDZHOQPEabPkRPSm6CQ@mail.gmail.com>
From:   Mark Deneen <mdeneen@gmail.com>
Date:   Fri, 6 Mar 2020 08:45:09 -0500
Message-ID: <CAP6JJ88Uc3zw+r_qxHzsZ-fkwQ1-T+WS-_iNLiTQQFzOkKNd4Q@mail.gmail.com>
Subject: Re: libgpiod gpiod_line_request output and keep existing value
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

Thanks for the response, it is greatly appreciated. I've added a few
comments below.

On Fri, Mar 6, 2020 at 6:50 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> czw., 5 mar 2020 o 15:57 Mark Deneen <mdeneen@gmail.com> napisa=C5=82(a):
> >
> > Is it possible to use gpiod_line_request to set a given line as an
> > output but retain the current state of the line?  I can not use
> > gpiod_line_get_value to query the state since the line in question has
> > not been requested yet.
>
> No, because it doesn't make sense. If you're driving the line, you
> define its state.

I can test this, but does the line state reset when the chip is closed?

> >
> > Let's say that I have a userspace process which sets a gpio to high
> > and I restart the process.  I would like for the output to remain high
> > when I request the line again in the new process.  This was possible
> > with gpiolib+sysfs, is it possible with libgpiod?
> >
>
> This was rather a side effect of sysfs keeping the line exported
> without any user-space process controlling it. This is not the case
> with a character device where if the process exits, all resources are
> freed ie. GPIOs are tied to processes rather than to a sysfs
> interface.

I understand.  For some purposes this is a step backward although it
is definitely far more deterministic and that's probably a good thing.

Let's say, for example, that a GPIO output is connected to a circuit
which controls a relay.  My process initialzes this gpio and engages
the relay.  At some point this process is restarted, possibly due to a
new version of the software being installed, and I wish for the relay
to remain engaged during this operation.  I can do this with the sysfs
interface by initializing the state to a predetermined value if the
direction had not been set to output yet.  With libgpiod I would have
to record the last state of the gpio somewhere and use this value when
requesting the line.

Should I be writing a kernel module instead of using libgpiod if I
need this sort of control?
