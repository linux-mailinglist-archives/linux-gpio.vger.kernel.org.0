Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A25915A990
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2020 13:58:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbgBLM6w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Feb 2020 07:58:52 -0500
Received: from mail-io1-f46.google.com ([209.85.166.46]:41499 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbgBLM6w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Feb 2020 07:58:52 -0500
Received: by mail-io1-f46.google.com with SMTP id m25so2080659ioo.8
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2020 04:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ACkVsgfX2gOXQYvuAReL8sCvQZOjCfX32rYvRb0YgyI=;
        b=NUdawpqttF9HKpF7HH6J62QVssHTm4QioM6mHReT7rqSo9/PF5pVsBZSHBheJsUo7X
         Y1l4ErV5Mg3O8aaJjhXBUZTVnU92WXQI3tGLCv6mMStNPH4hOAUexUVQeQz1EwEkyWxR
         zRXpvSehcb0aUxDHu4RJe4CYpLZPgb8ajxemiS1mjpldZWZi7BfPty/S+Tf/MxU2N8zu
         10Xr9Aph6VcHLYJcCusVWAc+B324oF/ArcLoih7pHhVwPj7oRw9MQ33kjvCGktJIgONm
         y/6i8OYo5sG4eQfdv/z/GCbws907dz46mSn6RdAdBeQuxyQ6qluHO86C5lMHH1HUKE+c
         FizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ACkVsgfX2gOXQYvuAReL8sCvQZOjCfX32rYvRb0YgyI=;
        b=C/uwhfdpz54NKaQhL6Nf3u8r6TNJgunBj2DB6xTVxoHVZOC0V6/dsWWv3MRlESjPEZ
         aPwkQT5oKNb5B9GmkyJ9oEGWrnS0YnkUBq9iDRhsJrIWiA9oqSmT0AghWAW8qDpl/1Ur
         pGvcdzeQ7K6mtzvLbFJasRKWtlaiHEH/gghzX8HRlBL9ZAKNTMZwI25fIMmQ0gxp6z97
         zlqSHcNuh8i0h2Jr1oqHkcAqr6O9m1Kq99jzuJ9zii9cDE+d0RVv+HZyWxO/CMJed213
         y1IU8bWozDSqmN5ZTTILoaP2yXgyjj2rRHTTevt42qHKgbnNOgLEDTdC9s82eWB9tizv
         nEMw==
X-Gm-Message-State: APjAAAX/zv6teP/y3ipyZPlqwT3lA0Y7R8QVcNr158q2OcV62MHt/exH
        VN3/+0Pcb/PVa7OYCatcysrIeuP1GK3wqGHgmiLIhw==
X-Google-Smtp-Source: APXvYqyctxsLNZQ5FGRgsiyHtR0fcd0ID+VAievvUyFVO3apr+EAuVwOUZPIFA9+ahrIUeVAV2a0exUCwb3i4xXf0pA=
X-Received: by 2002:a5d:9dd9:: with SMTP id 25mr17717494ioo.287.1581512331308;
 Wed, 12 Feb 2020 04:58:51 -0800 (PST)
MIME-Version: 1.0
References: <20200212074243.GA17928@laureti-dev> <CAMRc=Mdj6whafFQ9KN+gi8HhKCSfkhGtqhO-+AM+3JEb5MCQPA@mail.gmail.com>
In-Reply-To: <CAMRc=Mdj6whafFQ9KN+gi8HhKCSfkhGtqhO-+AM+3JEb5MCQPA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 12 Feb 2020 13:58:40 +0100
Message-ID: <CAMRc=Mdcg2hp0VUsQHO2kW_uTiDAvDTCckad9D5Ja002wn1LAA@mail.gmail.com>
Subject: Re: [libgpiod] consider changing the license of the C++ bindings
To:     Helmut Grohne <helmut.grohne@intenta.de>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 12 lut 2020 o 11:00 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=
=82(a):
>
> =C5=9Br., 12 lut 2020 o 08:48 Helmut Grohne <helmut.grohne@intenta.de> na=
pisa=C5=82(a):
> >
> > Hi,
> >
> > I've recently encountered libgpiod and found that its API is nice to
> > work with. Thank you for this piece of software.
> >
> > IANAL
> >
> > The library is licensed LGPL, which makes it available to non-free uses
> > in principle. For the C library, I think this is a good license. For th=
e
> > C++ bindings, LGPL poses a little problem as code can be generated from
> > the header. For instance, libgpiodcxx is using `ctor() =3D default;`.
> > Strict intepretation of the LGPL would mean that a downstream user
> > should be able to recompile the whole product using libgpiodcxx.
> > Effectively, libgpiodcxx can be considered GPL (not LGPL) licensed for
> > practical purposes. You can find more background at:
> >  * https://blogs.msmvps.com/gdicanio/2016/07/11/the-lgpl-and-libraries-=
exposing-a-c-interface/
> >  * Eigen was initially LGPL and was converted to MPL2:
> >    https://eigen.tuxfamily.org/index.php?title=3DNews:Relicensing_to_MP=
L2!
> >  * QT4 has also encountred this:
> >    https://lwn.net/Articles/315251/
> > I think that the LGPL when applied to C++ results in an unclear
> > licensing situation at best and an effective GPL at a strict
> > interpretation. Varying license interpretation rarely results in
> > anything good.
> >
> > For these reasons, I ask you to consider changing the license for
> > libgpiodcxx only (and not for libgpiod nor for the Python bindings). I
> > propose following Eigen and switching to MPL2. If however, the intentio=
n
> > is the strict reading of the non-lesser GPL, consider switching to that
> > instead. Either change improves the clarity of the licensing and makes
> > the intention visible.
> >
>
> Hi Helmut,
>
> thank you for this e-mail. I admit I'm not very well versed in
> software licensing. What you're saying makes sense and the links you
> posted seem to confirm it. I'll still try to get a second opinion on
> this. Anyway: my intention is to make the library available to
> non-free projects - including C++ bindings - so MPL2 makes sense.
>
> There's only one significant contributor (new features, not bug-fixes)
> to C++ bindings other than me (Cc'ed Kent Gibson) from whom I'd need
> an ack on relicensing, so it shouldn't be very difficult to do.
>
> While at it: LGPL is the only license used by all libgpiod components.
> Do you know if it makes sense to use regular GPL for programs that are
> part of the repo and LGPL for libraries only (except C++ bindings)?
>
> Best regards,
> Bartosz Golaszewski

Helmut,

one more thing that's unclear to me: I found this post[1] on the eigen
mailing list and started wondering: what makes MPL2 better than LGPL3?

Bart

[1] https://listengine.tuxfamily.org/lists.tuxfamily.org/eigen/2008/02/msg0=
0003.html
