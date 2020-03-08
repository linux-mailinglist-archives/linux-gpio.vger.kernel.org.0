Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 717D217D545
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Mar 2020 18:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbgCHRnW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Mar 2020 13:43:22 -0400
Received: from mail-il1-f179.google.com ([209.85.166.179]:45207 "EHLO
        mail-il1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbgCHRnW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Mar 2020 13:43:22 -0400
Received: by mail-il1-f179.google.com with SMTP id p1so2598362ils.12
        for <linux-gpio@vger.kernel.org>; Sun, 08 Mar 2020 10:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=agpvXQxmezAhH+DvBMusqaS9rHGsnSk75oR84nWZGYE=;
        b=CptpmVD/T8IjIhoS3IIgV3p9Wokj9znUaNfsPMnvVIdwhThROowUEczYTgDBHBXA3S
         jKTh8Pu220/kvYit+Il9smHKdUQuJSU1+zoqq/jbP/P3iW60YiDXO7Wu0RE641p8PtAE
         C/9zRj4cJfyyBIA+F9rppXBJTXUOssb7CwJJO/hwJ3X2TuXaae1wTQySIkMXP80UE577
         Dbjo2REkRIZyJnv2qGLJ4T4pC7d3NJp5AD8wup1erCiWJcaDXRIyS1Cl8V8orDsvstLb
         rEKHOfw7fv8HZHzXEhHROQP4I1ypTCZMgsmmAItIhRP9kRyBrEi1znRbbzIeuA3Kdsxl
         xFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=agpvXQxmezAhH+DvBMusqaS9rHGsnSk75oR84nWZGYE=;
        b=Ho2k81SbovMRYflIpGJ2JbI2Aj3FX1O+mDaGSAVEor+495QlPF7ZlvOcVUvQ40qstr
         UetjFq1T+t3ZCms7skRDHBxQZWGYzCQ/H/0YnKSt8CnP+AavTy8/8I/6q03ZSGcQkjMd
         9HPckjV6pUk7BDGa834xv6w5H9U4QFgRocwiTO3bJ8pix4RKtuNzI/1QxtMSlBkK2Lkn
         uMeKV0tg8gL3Bxp4+SfZkTjj8ErsLRSsTVwbJ699gl3fib8G6spcEDq9dFjz6iZkRqA4
         mUALA6cmgu62qgSO+httcwQJ5pIRAOcTG2+HCnI9uGsU2pDQ3+qDRx+TxVsrZUaejjpA
         wLLQ==
X-Gm-Message-State: ANhLgQ1jWmw+lYYv6XIKMxdoLatvCBOY+/2B15lzWxTIt+FQV1NJN7XS
        bPTa+6b6hBIZFm/FH55KudnyY16NHAYr+a02lq0+HqDG
X-Google-Smtp-Source: ADFU+vuL7hK14sSDPJgySUKA1w6LkqANU5K8ZMaaITS81eAe5z2qV9Mse3kWjizl8Ezp3l5nyU7B6EJWX+xXLEqQKek=
X-Received: by 2002:a92:af8c:: with SMTP id v12mr3952528ill.6.1583689400009;
 Sun, 08 Mar 2020 10:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAP6JJ88N28Tn+j=jonj8fVWmoVCLwK-4_6e-Vn8z+E7WDFHC=A@mail.gmail.com>
 <CAMRc=MfgpwTM54oVkJsQ0ue0uibj0OMEDZHOQPEabPkRPSm6CQ@mail.gmail.com> <CAP6JJ88Uc3zw+r_qxHzsZ-fkwQ1-T+WS-_iNLiTQQFzOkKNd4Q@mail.gmail.com>
In-Reply-To: <CAP6JJ88Uc3zw+r_qxHzsZ-fkwQ1-T+WS-_iNLiTQQFzOkKNd4Q@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 8 Mar 2020 18:43:09 +0100
Message-ID: <CAMRc=MeygWJzaZ9buuEwfc-XT881SXGQ85Jt8K5KSMiKzmObhA@mail.gmail.com>
Subject: Re: libgpiod gpiod_line_request output and keep existing value
To:     Mark Deneen <mdeneen@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 6 mar 2020 o 14:45 Mark Deneen <mdeneen@gmail.com> napisa=C5=82(a):
>
> Hi Bartosz,
>
> Thanks for the response, it is greatly appreciated. I've added a few
> comments below.
>
> On Fri, Mar 6, 2020 at 6:50 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > czw., 5 mar 2020 o 15:57 Mark Deneen <mdeneen@gmail.com> napisa=C5=82(a=
):
> > >
> > > Is it possible to use gpiod_line_request to set a given line as an
> > > output but retain the current state of the line?  I can not use
> > > gpiod_line_get_value to query the state since the line in question ha=
s
> > > not been requested yet.
> >
> > No, because it doesn't make sense. If you're driving the line, you
> > define its state.
>
> I can test this, but does the line state reset when the chip is closed?
>

This depends on your HW and the kernel driver. If the pin is pulled
high/low than it will revert to the default state. If it floats than
its state may be retained.

> > >
> > > Let's say that I have a userspace process which sets a gpio to high
> > > and I restart the process.  I would like for the output to remain hig=
h
> > > when I request the line again in the new process.  This was possible
> > > with gpiolib+sysfs, is it possible with libgpiod?
> > >
> >
> > This was rather a side effect of sysfs keeping the line exported
> > without any user-space process controlling it. This is not the case
> > with a character device where if the process exits, all resources are
> > freed ie. GPIOs are tied to processes rather than to a sysfs
> > interface.
>
> I understand.  For some purposes this is a step backward although it
> is definitely far more deterministic and that's probably a good thing.
>
> Let's say, for example, that a GPIO output is connected to a circuit
> which controls a relay.  My process initialzes this gpio and engages
> the relay.  At some point this process is restarted, possibly due to a
> new version of the software being installed, and I wish for the relay
> to remain engaged during this operation.  I can do this with the sysfs
> interface by initializing the state to a predetermined value if the
> direction had not been set to output yet.  With libgpiod I would have
> to record the last state of the gpio somewhere and use this value when
> requesting the line.
>
> Should I be writing a kernel module instead of using libgpiod if I
> need this sort of control?

Depends on your use-case. Do you have a specific kernel subsystem in
mind? What would the role of this kernel driver be?

Bart
