Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43F7C398503
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 11:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbhFBJOf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 05:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbhFBJOf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 05:14:35 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FAFFC061756
        for <linux-gpio@vger.kernel.org>; Wed,  2 Jun 2021 02:12:52 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id h7so1736529iok.8
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jun 2021 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BrRGZe9S7UVDsoLQx6OlURcsBADt8tx/P1nptvMx8aw=;
        b=QhtwyovIMd9W7sHaWyWMfsGdYxpH2TYSQGdA7nWx+UR/a4gawzbeyB9d7OrrdkulUV
         VIPug0abm74qbHjUUZL7Ss+gPj3//w31STentf1XpPxL/D8AdBV6gHxbs2OTjUu6dNZb
         DElv9lhy+fu62/1UDhpNPSpcmC8HNYnVU52hc5I11ec3CrjyG+8gv5u+A6XsQYG6YAt5
         9/pz6xfxcnygR+BS+5kut+bKBftxa/Ab1Z5gGD775tODljuFVm2hB1Or7ZWV7K6PvzRA
         Uy6Qd1qGGN62TiQ7kvdSyDWa+cBKEzChkIW27+UnO4PvD2Rtlgi4y2Ki/KnraubQkyep
         Ke+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BrRGZe9S7UVDsoLQx6OlURcsBADt8tx/P1nptvMx8aw=;
        b=FqHJ42JlR8yd5UNikdu+qqo1Oua/QAeLX6le1+3FpmzT+B/U2itfYsPEbgVsCbFBzy
         n1XmDDKfxMGp9KDyvJ9f8g1Qx6gPQIHHeSSQvEXpKVHWsgBv71Hqlz7pOeNClvpnVEx8
         pt8GfTMMlAmkmAjAMMOZ7lgXu+p+oG8XxIN+6StfuORp26Mg42yDIIjHAZIsLGMtgtvG
         wNZ/ffR2cU0QTCB8oR0xZPAn5fpjHdjsfMr2voac2xaLot4OQxu+AX/XrphJIC6bp6cy
         MyTvPNSjpi5r+NLGeEg8tzynjykZMd/MU+ah2B+A3ftEBTVfgHyYYG2K1yHWHYPJNkyi
         GG7A==
X-Gm-Message-State: AOAM533IB9oziT/+pngGswMuqqgALTA1zcExA4T9K027XZ7zgdxtqKKN
        aBVg5+eRL5+4zWyDWjL1ZtarLvrzUh2L0M/WSp6HeQ==
X-Google-Smtp-Source: ABdhPJy3dTkiDCd5545R7VQEoXEwzqqJjzwzayxkz22WjIpGQ+1L7bqwlqaH6YQldYb3Thm7FNsjrNmL08JpwCYxb2w=
X-Received: by 2002:a5e:8d16:: with SMTP id m22mr4008387ioj.139.1622625171801;
 Wed, 02 Jun 2021 02:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210524120539.3267145-1-robert.marko@sartura.hr>
 <20210524120539.3267145-3-robert.marko@sartura.hr> <20210524230940.GA1350504@robh.at.kernel.org>
 <20210525074649.GC4005783@dell> <CA+HBbNFxCKbitVctbUisuZXJWxaZp0cswNNNTgD0UxQZ1smJbg@mail.gmail.com>
 <20210526075255.GG4005783@dell> <CA+HBbNGSH9AvRo0Hwa5pWea94u0LwJt=Kj7gWjSAV9fS5VFr0A@mail.gmail.com>
 <20210601081933.GU543307@dell> <50ced58164999f51a8c8b9c8dc01468e@walle.cc>
 <20210601135816.GG543307@dell> <20210601144826.GI543307@dell>
In-Reply-To: <20210601144826.GI543307@dell>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Wed, 2 Jun 2021 11:12:41 +0200
Message-ID: <CA+HBbNFZhF1+B-JsHyeybcF96NQDA+afoWt-pMSKrtYdDYNgZQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: mfd: Add Delta TN48M CPLD drivers bindings
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 1, 2021 at 4:48 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Tue, 01 Jun 2021, Lee Jones wrote:
>
> > On Tue, 01 Jun 2021, Michael Walle wrote:
> >
> > > Am 2021-06-01 10:19, schrieb Lee Jones:
> > > > Why do you require one single Regmap anyway?  Are they register ban=
ks
> > > > not neatly separated on a per-function basis?
> > >
> > > AFAIK you can only have one I2C device driver per device, hence the
> > > simple-mfd-i2c.
> >
> > Sorry, can you provide more detail.
>
> I'd still like further explanation to be sure, but if you mean what I
> think you mean then, no, I don't think that's correct.
>
> The point of simple-mfd-i2c is to provide an I2C device offering
> multiple functions, but does so via a non-separated/linear register-
> set, with an entry point and an opportunity to register its interwoven
> bank of registers via Regmap.
>
> However, if you can get away with not registering your entire register
> set as a single Regmap chunk, then all the better.  This will allow
> you to use the OF provided 'simple-mfd' compatible instead.
>
> Now, if you're talking about Regmap not supporting multiple
> registrations with only a single I2C address, this *may* very well be
> the case, but IIRC, I've spoken to Mark about this previously and he
> said the extension to make this possible would be trivial.

This is my understanding, that you cannot have multiple regmap registration=
s
with on the same I2C address.
At least that is how it was the last time I tested.
That is why I went the MFD way.

Regards,
Robert
>
> So we have to take this on a device-by-device basis an decide what is
> best at the time of submission.
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Senior Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
