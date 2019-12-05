Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9445113F4B
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 11:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729103AbfLEKXB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Dec 2019 05:23:01 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44602 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728735AbfLEKXB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Dec 2019 05:23:01 -0500
Received: by mail-pl1-f194.google.com with SMTP id d19so1064198pls.11;
        Thu, 05 Dec 2019 02:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ebicAYXy9k2mxJvMhxK27he4zZtnJrB2MXkWfn+pqxY=;
        b=NxjLFuv216NNLaoZNHD5p14KmVz2OeM2dP4/YR+SwNI++oEF/j6KAUDujz2shC1jff
         0Y0TvlPFmRS32w+D0wg3NAfmOOTWrjP4vsh/gM+YiJAZSvwYip57ClpqYhihRrAJu3aR
         UTLLAep3mEXVPEcgg74rcKtd2k795nBMULapu43qhujZXiwtlkr2LBl81kUtFViPUjn2
         zE93kzLmtuqYMKxK1J2v8lWqobDHmMD/3mcusQ99ehN2oS2xmsTkvhbmS8vZq6GJPAuk
         TS0KAm8FZF5LrdxMEkIKogLdT3kKZGdD7fiL44YDLb/B18X3XHaGJyDjDNVKDIixNTsv
         c/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ebicAYXy9k2mxJvMhxK27he4zZtnJrB2MXkWfn+pqxY=;
        b=Ez9QOcCuXotxMP0H1l3E5U577sfXcmegSgNvku8kBBYMF88tSWmf+zoMt6ONRCwD4s
         m0+bnAhOdtg0PkpY1hDouGBwfdqmHM6ahJLCHk1xDhAOZbCJQq6bz21dS6LYu6bbUxt/
         rlzJud3TU6JotwxulQtO0qWNMGtulE7lIpf7DeYXS+xzNz1SWHyA4HVBbkt+ME0QoUDa
         6vlv1acbdD5jLsBY6Ae8Nqn0+dSwVXKTH+q69Xj/98AVRAV5BPE9uvC5OdRfpExGWctF
         2rgl2tv1zFpjliJKpV/PIafZ0mC1KyhAfy1GmMdIcWYEcncRD6u/M+93jNdZogJaLATN
         V5dg==
X-Gm-Message-State: APjAAAURV3vCxK7uZUxG77FZoB7TcBOLymsAoSzRG8oJiDqVKhwQV5Q7
        MB6pOOjKz9+Jswh6B98zAI+DaS6noFnh9tq7Y3M=
X-Google-Smtp-Source: APXvYqzlYKv5Vg9cEBZwbGGt4FWZSvZTiEbuY7wLNZpuixiqxjYrwbG+wrtHghBPqoF7xqz71zKFUax5GxpnrV65HhE=
X-Received: by 2002:a17:90b:3109:: with SMTP id gc9mr8506024pjb.30.1575541380977;
 Thu, 05 Dec 2019 02:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20191204155912.17590-1-brgl@bgdev.pl> <20191204155912.17590-8-brgl@bgdev.pl>
 <CAHp75Vf7+XY8rnrbMfMgNO25EHSemjZVUgvFFp+zvj4vvJ1B8g@mail.gmail.com> <CAMpxmJU-X3JiVZ2+fVq5Y6jipJUkhVSMUyJjFnmjdkny0LRO9Q@mail.gmail.com>
In-Reply-To: <CAMpxmJU-X3JiVZ2+fVq5Y6jipJUkhVSMUyJjFnmjdkny0LRO9Q@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Dec 2019 12:22:51 +0200
Message-ID: <CAHp75VeONTHmK=jvbt5LtRTxtp5gn=8x=JUFOfnwsGcAfvJCgA@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] gpiolib: rework the locking mechanism for
 lineevent kfifo
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 5, 2019 at 11:31 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> =C5=9Br., 4 gru 2019 o 23:25 Andy Shevchenko <andy.shevchenko@gmail.com> =
napisa=C5=82(a):
> > On Wed, Dec 4, 2019 at 6:01 PM Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:

> > > +       spin_lock(&le->wait.lock);
> > >         if (!kfifo_is_empty(&le->events))
> > >                 events =3D EPOLLIN | EPOLLRDNORM;
> > > +       spin_unlock(&le->wait.lock);
> >
> > Sound like a candidate to have kfifo_is_empty_spinlocked().
>
> Yeah, I noticed but I thought I'd just add it later separately - it's
> always easier to merge self-contained series.

...and easier to forget about.
But it's up to you :-)

> > >         struct lineevent_state *le =3D filep->private_data;
> > > -       unsigned int copied;
> > > +       struct gpioevent_data event;
> > >         int ret;
> >
> > > +       if (count < sizeof(event))
> > >                 return -EINVAL;
> >
> > This still has an issue with compatible syscalls. See patch I have
> > sent recently.
> > I dunno how you see is the better way: a) apply mine and rebase your
> > series, or b) otherwise.
> > I can do b) if you think it shouldn't be backported.
> >
>
> Looking at your patch it seems to me it's best to rebase yours on top
> of this one - where I simply do copy_to_user() we can add a special
> case for 32-bit user-space. I can try to do this myself for v3 if you
> agree.

Yea, I'm fine with it.

--=20
With Best Regards,
Andy Shevchenko
