Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1418FB3633
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2019 10:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbfIPILG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Sep 2019 04:11:06 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:35066 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbfIPILG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Sep 2019 04:11:06 -0400
Received: by mail-io1-f54.google.com with SMTP id q10so4765613iop.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Sep 2019 01:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Vpkji+JaSz8WauXq5p1d5+uSD1o7MPQqNS/E6NcvLes=;
        b=dGU3CUz1XZDQI5igtcYed8l3aJWxGmtzeHjGLAEpHMpRAoho7xCS3JLKyXRoUxa9ly
         8Hvnf5zA5Jdkg56voJ2BOw0B2hTKYwXRNvATAL8FH1N0WE9tf8CpkZkDt3GKksGl7Pj1
         YXgWStCv+KNiDEPElbGItYD/ylhDmaJABUM0LnqG0foIjFdr1Prropwm1+uZG+mgrwlx
         uq9t2Y3XYeN1MtNH9PsXC2SKXmDbz/q8ku/luEmt4myyHvZlyFzBWyPWy7ZqUGNXOMZT
         i9DMlaKO1HCDFkgZyGqrKf4KVEn+HxPnKDPvfwiRZ/0zMG7bpEZj+U8DEq9HH03EfDIc
         j3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=Vpkji+JaSz8WauXq5p1d5+uSD1o7MPQqNS/E6NcvLes=;
        b=AWQlaYzGXzOe7UyXmSAgatwX/ifCUZZ2Xiw3+ii74WJeRWMeTEUXxip9y3v3r4qyZr
         +aHBf1j6kxudtLyzlxQa/Jtcx2hnxDNJlyeWr6NZFmmuvxAKh0qGVvYCQZsjjOg+eCpY
         be/jNeds1SxYoMhAGkbV05Udns+urjiZjF3OPSQ9FeqYQTvwQSe56zAgYEclZmGh89Fx
         mvRPN9HPV2E8yASXoa0EMrDaciOL/On2/jE/nmGPAewiZEv50TQ/pSqEqc58tMXwK0kg
         2Qeb1IEaEqdaqkCoZ/yxmgny+ZdWySzAD64pQM5QGKqzFlcrj+88AxF3N5UG+4oDGiHf
         /F9A==
X-Gm-Message-State: APjAAAX59AOJYqWAdTepBEs8fNIbGfKkwl8W9LQSnKLj3TAOFsNTy34E
        AuJyvaMwZkpNlyURB2qw6LicwD/0i2Y2rCNmCIxj3W9B
X-Google-Smtp-Source: APXvYqylhYLBxONH7E1tIemkfqZTalhIrOULPw2p4/vS4ULquVVTESrYTVkcQWpmCqGNeSs3EYP2FrNHdUdG3ljlG2U=
X-Received: by 2002:a02:cc83:: with SMTP id s3mr13992300jap.93.1568621464012;
 Mon, 16 Sep 2019 01:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <a2ad7284-b31c-a152-aebf-01efc4a36765@freenet.de> <CAMRc=Mez=0L8jemxC5r_+1pkT1vmpyZdoTws00ssf0kq_ELDXw@mail.gmail.com>
In-Reply-To: <CAMRc=Mez=0L8jemxC5r_+1pkT1vmpyZdoTws00ssf0kq_ELDXw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 16 Sep 2019 10:10:53 +0200
Message-ID: <CAMRc=MdjzVZOi9YA8WSt6ag8XGkTg+zia3BzpjT4g+t3+oHV1Q@mail.gmail.com>
Subject: Re: [libgpiod] python binding decidedly unpythonic
To:     Darrien <darrien@freenet.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sob., 14 wrz 2019 o 10:42 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(=
a):
>
> pt., 13 wrz 2019 o 15:05 Darrien <darrien@freenet.de> napisa=C5=82(a):
> >
> > Hello,
> >
>
> Hi Darrien,
>
> > I just started working with python3-libgpiod and noticed that it is
> > decidedly unpythonic.
> >
>
> I'm not really sure what that means. A quick google search yields many
> answers but not necessarily with regard to what should or should not
> be handled as properties.
>
> > For example the Line object functions active_state, consumer, direction=
,
> > is_open_drain, is_open_source, is_requested, is_used, name, offset and
> > owner should be properties, and set_value/get_value should be merged
> > into one property.
> >
>
> For the first part: you may be right that it would be somehow "better"
> or more standardized (I didn't really find any official documentation
> that would suggest always using properties when possible - mostly some
> stackoverflow posts), but I decided at the time of writing that when
> in C, methods cause less churn. Also: these methods make the object
> call underlying C code, so I considered it more of "telling the object
> what to do". I may have been wrong - python is not my main language.
>
> As for get/set values: this leads to execution of underlying code that
> can fail, it's definitely not a property but an operation on the
> object conceptually.
>
> > Line.direction should probably also be writable for bidirectional pin u=
se.
> >
>
> Definitely not. Direction can be changed by an external actor or by
> the current process when it runs the request operation. Even as a
> property it should be read-only.
>
> > Regards
> >
> > Darrien
> >
>
> Let's say I'd want to convert the methods you listed to properties:
> this would be a backward incompatible change of the interface. I'd say
> it's the right thing to do if the API was fundamentally broken and
> didn't work but it's not the case. I'd prefer not to force people to
> change their existing code without a very strong reason.
>
> In other words - if ever there'll be a change of API major version to
> 2, I'll be sure to address python bindings as well. For now I believe
> we should leave it like it is.
>
> Best regards,
> Bartosz Golaszewski

We discussed the python bindings off list with Darrien and he
convinced me that it's worth improving them and doing it earlier will
impact less people. At the same time I don't want to break the
existing, already released interface. The plan is to implement a new
module with the API that is more 'pythonic' and converting the current
gpiod module into a compatibility layer that will be deprecated over
time and eventually removed. This isn't however going to happen very
soon as I'm busy with other things ATM and also I'd really like to get
this right this time.

Bart
