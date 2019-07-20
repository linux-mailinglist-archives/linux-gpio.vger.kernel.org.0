Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF2C6F046
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jul 2019 20:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbfGTSD0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jul 2019 14:03:26 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46534 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbfGTSDZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jul 2019 14:03:25 -0400
Received: by mail-oi1-f194.google.com with SMTP id 65so26671505oid.13
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jul 2019 11:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fV6Yxz5phWkhQA6DReninzloQxSLe34uuPheQWujNzU=;
        b=VXbYG3+WE8sblpJmTKNLu27EzPYP1iHM+AmcY9VHfuzbAgVjQkz9y0QKaeEEfwrAHz
         rVGvnj49z5kKX5trEK7cFHuxIwjHd2Xf+FBoXjf39hoWGusOH86ZLwQ/G+OBWkAHHxIq
         7gX7zpJWMe4dxmb4EuIA/vnipwgiWI7bmoBaPnvp2OjDy+ID06w0UouPwCIPV6qRTZSn
         u1RUZ4fJzRwfmG+fMyFsNxKodWBMVTDcHHpYmnNdPeGr+KB2Dpskra3FjhMQ44ed8YWK
         ZM5YZlk6fHu/Ju6bkiJH8X/ojj+BsYCRbIMW2iItZ08jFMsy88worwZIg8QRRE/p/cXe
         M3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fV6Yxz5phWkhQA6DReninzloQxSLe34uuPheQWujNzU=;
        b=EzQwIEc4pQEOgBmvYyacoUVwsiz79EhaW8ssC/Db2OFzwfFM8HkIAbuNNl2KHqc8UN
         hTv83rqy+6UGI7+zT0dZqKB26XrQVe4SOxAycZqovf6WpyfEmduNnDHAvJYaz70waz8T
         Mk6M0vtprut0Th4CB7AygUo0/A2UTJOqtRicEXC8u2TZjvGK41ADy2yzWGfB3Vl8bGvZ
         SwrYvCFWkGJxBr34ZdVit2YxsaIA+Shl6GHv6kLb51Qif3O4aV18PSi6ob53/qLBnAoy
         1tqfFvdiS7wslguTGkJasOt3LPG5e+/gp/8EZh8jcJcg1fFBx/4vYWE634FBTSEeGnrT
         S3RQ==
X-Gm-Message-State: APjAAAWHDf3RyXPTWXT2+eB67fBWq7wu8D40zAxIHXlFjFNMtgggdjgk
        cbaqNpy9eDx3uYvfHYveSybVZt/vCFgrIIC8V2/+oA==
X-Google-Smtp-Source: APXvYqwHVk7vHOw+xBU078uF3hkUUhazrYDOeBwuccwt3X+aE2K5ej+DaAT8WkGp2/wh8W/LqW7Xq6xnV+k898hUyjo=
X-Received: by 2002:a05:6808:d4:: with SMTP id t20mr9504688oic.170.1563645804556;
 Sat, 20 Jul 2019 11:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190708082343.30726-1-brgl@bgdev.pl> <CACRpkdb5xKHZja0mkd-wZJ+YHZpGJaDrkA0dv60MNYKXFcPK4w@mail.gmail.com>
 <CAMRc=MfB9R70QDqtjG5a5Roq1roeL78Ss5noytrY-7P=tY1OHA@mail.gmail.com> <CACRpkdaiZgK1EoaUxDtbm_GJHVjZU56e_qBQ-OF0mmwb5W8+tg@mail.gmail.com>
In-Reply-To: <CACRpkdaiZgK1EoaUxDtbm_GJHVjZU56e_qBQ-OF0mmwb5W8+tg@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Sat, 20 Jul 2019 20:03:13 +0200
Message-ID: <CAMpxmJWDTkhuWhfSJ-fkJ6r+7a3kErXafQ_sJLVgMf=cA=1+aQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: don't WARN() on NULL descs if gpiolib is disabled
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Claus H . Stovgaard" <cst@phaseone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 16 lip 2019 o 23:46 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> On Tue, Jul 9, 2019 at 4:20 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > wt., 9 lip 2019 o 15:30 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
>
> > > I was thinking something like this in the stubs:
> > >
> > > gpiod_get[_index]() {
> > >     return POISON;
> > > }
> > >
> > > gpiod_get[_index]_optional() {
> > >    return NULL;
> > > }
> >
> > This is already being done.
>
> Ah it is.
>
> > > This way all gpiod_get() and optional calls are properly
> > > handled and the semantic that only _optional calls
> > > can return NULL is preserved. (Your patch would
> > > violate this.)
> > >
> >
> > Maybe I'm missing something, but I don't quite see how my patch
> > violates this behavior. :(
>
> I missed that we actually do pass a poison from the strict
> *get functions, mea culpa.
>
> Let's apply this, will you send me a pull request or shall I
> just try to apply it?
>
> Yours,
> Linus Walleij

I'll apply it to my local tree and send it for v5.3-rc2.

Bart
