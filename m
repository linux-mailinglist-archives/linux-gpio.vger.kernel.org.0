Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4592192743
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2020 12:36:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbgCYLgH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Mar 2020 07:36:07 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:39572 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbgCYLgH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Mar 2020 07:36:07 -0400
Received: by mail-qk1-f194.google.com with SMTP id b62so2108763qkf.6
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2020 04:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bSc9mBMtLwWQfwKgquoZTlMfgszjByzVoNHeKAodWUs=;
        b=emz1+nz3y4wvNriGJwoIRqoV4ci7HwNm85PTpB/38lXN0Ja9bOf5HMyriN27EMwQkA
         I6/jfJ2upb3hvkU3Ey40vobcv67jc9Q4BvFoGWrN5Yfc7TKXqja99vetjVG4C0w/ktkD
         rCQLMtaYIurWO/vFvXB26Ki2WEoGZFX939E2TfMNSuWy2469Ve/OoBSx4xS86OFaJP7w
         ZfSiWBPzFNPbfu1peFPSPg62RcHnzEDORJMMc6zXOiNQNfNsx0LAHAtW7JhLzrlgeIsb
         Vc1JD73KKDVJVx8EMJNeBpDJMnPyD5oC4kYNJDMp8Z2aO80yd2xLz9Ft9VW6vMc39IRh
         TMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bSc9mBMtLwWQfwKgquoZTlMfgszjByzVoNHeKAodWUs=;
        b=QlOtDgpXN05WOsrx4+4vGP/0RMqvXK3kilTf1Cey43xakE4PoxyjJuB3koSuzGflZd
         0a9UDRAZnj/mAnPnk3tVbCwdHOhaQONCUUjEi4eJjDzrwCisnYZhHmha9joTN0UyNrxZ
         CGaoXKD0SCe7AGnxKZVAAuiuPrH4ROPmHRhZSR/myvVzKQPHZV3mPEbxQgIOsf7z5fbT
         XHRFiEx9hkg+WM0KUjPayzO5kv3bjagEDGEfAvAmPwVpHu0279eHMwsopxT+tmItm/EY
         TEs6ngCMC48d28on/4Bu+QksQRudEdlWCKVuAgsBLzMAQ5YC34LKtoH8/O/czTo7e9i5
         6w8A==
X-Gm-Message-State: ANhLgQ0+aFtL//Lf/Pq/IPpgGE2gpg6OpInEfY3d0LPeEgPZJp7hc62l
        0CWZX2+oTmYApfRfUll4pdOd6ZwJ0nUuhyl5cXN9ZQ==
X-Google-Smtp-Source: ADFU+vulW3rcFWA4Rup1YiyivwdmvSxJzrHPxnTXjr9Wh5EcRjyi8bY3bUNqPEDPbEtw9JdXo/Z4SNjuFFhobVSlFys=
X-Received: by 2002:a37:3c9:: with SMTP id 192mr2446179qkd.330.1585136165908;
 Wed, 25 Mar 2020 04:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200224094158.28761-1-brgl@bgdev.pl> <20200224094158.28761-3-brgl@bgdev.pl>
 <CAMRc=MdbvwQ3Exa2gmY-J0p8UeB-_dKrgqHEBo=S08yU4Uth=A@mail.gmail.com>
 <CACRpkdbBCihyayQ=hPVLY8z4G=n5cxLnUmaPpHRuKedDQPVUyQ@mail.gmail.com>
 <CAMpxmJX_Jqz97bp-nKtJp7_CgJ=72ZxWkEPN4Y-dpNpqEwa_Mg@mail.gmail.com>
 <CACRpkdYpers8Zzh9A3T0mFSyZYDcrjfn9iaQn92RkVHWE+GinQ@mail.gmail.com>
 <CAMRc=MdLYD3CeFtp4jF+-P+4kSmt1sAezrkPFk5rK4=whNEWuA@mail.gmail.com>
 <CAMRc=MfEo6=im5EPHYtht3xN83k+rcRgQDSOB=Ucs52M8RWirg@mail.gmail.com> <CACRpkdY1u2xEFzJPrat73me11wdY9uGCK=FWWWzLkBY505JrUw@mail.gmail.com>
In-Reply-To: <CACRpkdY1u2xEFzJPrat73me11wdY9uGCK=FWWWzLkBY505JrUw@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 25 Mar 2020 12:35:55 +0100
Message-ID: <CAMpxmJXXdmW_2MhUSGYZGy8xWy=oQKgng+cphzU-WDqQUKe=Dw@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpiolib: use kref in gpio_desc
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Khouloud Touil <ktouil@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 25 mar 2020 o 12:16 Linus Walleij <linus.walleij@linaro.org> napi=
sa=C5=82(a):
>
> On Mon, Mar 23, 2020 at 9:44 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
>
> > Hi Linus,
> >
> > what is your decision on this? Because if we don't merge this, then we
> > need to make sure nvmem doesn't call gpiod_put() for descriptors it
> > didn't obtain itself and we should probably fix it this week.
>
> I'm simply just overloaded right now, things related to how the world
> looks etc. Also Torvalds writes in Documentation/process/management-style=
.rst
> that if someone ask you to make a decision, you are screwed :/
>

I see, yeah the times are uncertain for sure. :(

> Your decision is as good as mine, I'm not smarter in any
> way so if it is urgent send me a pull request for the solution that seems=
 best
> to you, I trust you on this.
>

There are no users right now of the broken interface, so I'll just
send a patch with an appropriate comment to Srinivas for the time
being and we can try to fix it in the next release.

Bartosz
