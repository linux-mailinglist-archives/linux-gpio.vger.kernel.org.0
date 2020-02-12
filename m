Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E267115A588
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2020 11:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728952AbgBLKBI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Feb 2020 05:01:08 -0500
Received: from mail-il1-f180.google.com ([209.85.166.180]:43694 "EHLO
        mail-il1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728846AbgBLKBI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Feb 2020 05:01:08 -0500
Received: by mail-il1-f180.google.com with SMTP id o13so1209060ilg.10
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2020 02:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8JyYrsalyFH17fGVZv52F133fCfa2PBO6XlMFKrguQw=;
        b=ycEl0qBVms7ibkxw1apciR3g0v7rAmRSNJulzWiaIp3mN/xXVfzLJJ4xC/UkG8lGOh
         gWJ/mwwxrqUTszOlhMSbEI0m+nx8sE4xJP5e50LCeOjJIUGH+g3PMlJXT9VPSAGAE63o
         MKimlK+JSskMnxQmdMQGoZea88XqW4OqQZ6pprJoAABwHfrmTz2WZIAI7mblmXGXt9y8
         HYrKTLfY1xjy8uxjf7YB/SXCDguDtogJS8BqcTBfIGNh5djqiqx7AFIqV6whpBw1RT6J
         6soVnocmkaCP/HUydaTcJ1WpFE4a8QjVzANefvlO/G26Ez64TTXXLxV21AI2mzAqAV0j
         mQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8JyYrsalyFH17fGVZv52F133fCfa2PBO6XlMFKrguQw=;
        b=YceM2gj4I2gTmLcm5+4Hru6CACUd38BCQCmfnGVPRqtKhg/s6gKapoD51S/Sx4wF89
         IR80Vux8VKSWquQ3g5BRt7FfqREMsu2jE6TXOXLKHM1gTOR0rRImJosNsyDE1pApPnbq
         iUpi1anoIA3RjnnCAK81o0fY3UH/BUyg4VDwV4rGQAT/FkyFKyAMUii/J+dsvARTW3vU
         hhB48BppZxfvj+ZtilvNz5nyP2V1+gcSfv4QKJMSTFKokhceZfqTb/o2a0SJ7Y7Jjeej
         2j/I5X3K2TVkk5uwn6Ha02/feV/LJoPzYC9Jea+2QXpmukGecl4O5+wGVdGeI5gVbdkr
         Zs4g==
X-Gm-Message-State: APjAAAVLxJxp3YevFm61KCbFZ7BVAMnJ8O0KAsd4qC1S4yptxfpEgnui
        CTA9NMMJ7WrpDFMOTWV+1D/Vzxnts86ajLSx5vfoLQ==
X-Google-Smtp-Source: APXvYqw1AZ8T2u2Ab0VolEC5Bc5GOIfuOUaTryXH2/yYIu9MfEKCQDx7QrxesdSWw93S26DKvQyF1qRYHkVKCEpqcp4=
X-Received: by 2002:a92:3d9d:: with SMTP id k29mr10120783ilf.220.1581501667185;
 Wed, 12 Feb 2020 02:01:07 -0800 (PST)
MIME-Version: 1.0
References: <20200212074243.GA17928@laureti-dev>
In-Reply-To: <20200212074243.GA17928@laureti-dev>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 12 Feb 2020 11:00:56 +0100
Message-ID: <CAMRc=Mdj6whafFQ9KN+gi8HhKCSfkhGtqhO-+AM+3JEb5MCQPA@mail.gmail.com>
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

=C5=9Br., 12 lut 2020 o 08:48 Helmut Grohne <helmut.grohne@intenta.de> napi=
sa=C5=82(a):
>
> Hi,
>
> I've recently encountered libgpiod and found that its API is nice to
> work with. Thank you for this piece of software.
>
> IANAL
>
> The library is licensed LGPL, which makes it available to non-free uses
> in principle. For the C library, I think this is a good license. For the
> C++ bindings, LGPL poses a little problem as code can be generated from
> the header. For instance, libgpiodcxx is using `ctor() =3D default;`.
> Strict intepretation of the LGPL would mean that a downstream user
> should be able to recompile the whole product using libgpiodcxx.
> Effectively, libgpiodcxx can be considered GPL (not LGPL) licensed for
> practical purposes. You can find more background at:
>  * https://blogs.msmvps.com/gdicanio/2016/07/11/the-lgpl-and-libraries-ex=
posing-a-c-interface/
>  * Eigen was initially LGPL and was converted to MPL2:
>    https://eigen.tuxfamily.org/index.php?title=3DNews:Relicensing_to_MPL2=
!
>  * QT4 has also encountred this:
>    https://lwn.net/Articles/315251/
> I think that the LGPL when applied to C++ results in an unclear
> licensing situation at best and an effective GPL at a strict
> interpretation. Varying license interpretation rarely results in
> anything good.
>
> For these reasons, I ask you to consider changing the license for
> libgpiodcxx only (and not for libgpiod nor for the Python bindings). I
> propose following Eigen and switching to MPL2. If however, the intention
> is the strict reading of the non-lesser GPL, consider switching to that
> instead. Either change improves the clarity of the licensing and makes
> the intention visible.
>

Hi Helmut,

thank you for this e-mail. I admit I'm not very well versed in
software licensing. What you're saying makes sense and the links you
posted seem to confirm it. I'll still try to get a second opinion on
this. Anyway: my intention is to make the library available to
non-free projects - including C++ bindings - so MPL2 makes sense.

There's only one significant contributor (new features, not bug-fixes)
to C++ bindings other than me (Cc'ed Kent Gibson) from whom I'd need
an ack on relicensing, so it shouldn't be very difficult to do.

While at it: LGPL is the only license used by all libgpiod components.
Do you know if it makes sense to use regular GPL for programs that are
part of the repo and LGPL for libraries only (except C++ bindings)?

Best regards,
Bartosz Golaszewski
