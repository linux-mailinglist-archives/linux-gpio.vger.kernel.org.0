Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56E66B2A6D
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2019 10:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727184AbfINISn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 14 Sep 2019 04:18:43 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:36206 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727171AbfINISn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Sep 2019 04:18:43 -0400
Received: by mail-io1-f50.google.com with SMTP id b136so67877352iof.3
        for <linux-gpio@vger.kernel.org>; Sat, 14 Sep 2019 01:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zYArlTblKp7qw3ypTNSHe+V1MY+vVcUDKYbqMHtoAws=;
        b=XEmvtN9tMqaFzPKwaZmuNR6xwRPFIrUeuM0rIp5MMcJwP56KHHHz6rzfjiOB7DDw30
         KLKPsthYta1EZduadNUmrnoafXqHbLdcEnlFezwlRWolm9MtmjWpHdwQgVygou0n6LV3
         oK7GLma8+7cUGp3az+e42FFaeJdiGkUG5741hpKriUSrpgbnknoAf2zYZWuOGUBnePVm
         9o/lddsDsfVrBC/rol5t78agseKXu3le6/MyyQzxDdqRj1bZwlQY+ujcwoSee4K5mvrg
         6iBtUQQH+BselJbQXZqtcD+0cxJTdneesmUbWMsNdsMrE5ezo+INuKvIHjSVXZkjYCny
         ZElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zYArlTblKp7qw3ypTNSHe+V1MY+vVcUDKYbqMHtoAws=;
        b=SoYIsHss9wkTY2rUCu9bR96FxKbxRE8NoZG+UfJKtwQmbg/2Dx6z8yBvBHMsumsVTu
         1smXiJhPXFI+BULW7jQ1wzQtA998tZbbm9YTQWMBWMB+he+u/qVgYZyM6l4c39wWzJuc
         tfvD2jY6qYy/YDin8cCgDMSWTH4KvIs1DHmT95KISJNklGYwv7EM5asU/F1URsXbO+il
         /hMWbwW6xPsXLbtMFwPxDqdwzeu6bgONpOljcWoIIbEI3aeGVgJKdkEC9ZdYMMCR3402
         c6ZIwYFD2cOpji+NuKhCykl+CRBkDbm5JGPrJUqiDHbE2PrVeLCZROLJs/mCOUxslHS4
         E6Eg==
X-Gm-Message-State: APjAAAUlXamI/x49TXr9PaVtSIFNei3o/ivUO4FqalZFXPQyc4I9b76S
        vPSVX5tUg/f9/UTFy2B+4qaO8oBbEMnoNaSeMfyCrw==
X-Google-Smtp-Source: APXvYqxVormL8rfbB1X5lO0j4qFp2MQnJn4M5F88KN8mAHIxdApldNO6jSYjPboO2NPgZ8RWExiTHrbknGPcZlTG+ao=
X-Received: by 2002:a6b:7408:: with SMTP id s8mr4967449iog.287.1568449121150;
 Sat, 14 Sep 2019 01:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <08ac3d50-ae2b-060f-0210-4be213b6c97c@korgrd.com>
 <CAMRc=Md9yD6U+_BAEY_pB1vdri6oZuMLwAhvDuAgpee_bQEpVA@mail.gmail.com>
 <CAEf4M_B2RXbv-B2fsU-15iF56bO0_K--UeSdmdXHqgYNjCTbYw@mail.gmail.com> <CACRpkda_oXz0Dv064MiHrctmmPHca3B8LotiHUd8Z3TAuwVLcQ@mail.gmail.com>
In-Reply-To: <CACRpkda_oXz0Dv064MiHrctmmPHca3B8LotiHUd8Z3TAuwVLcQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 14 Sep 2019 10:18:30 +0200
Message-ID: <CAMRc=MdooA26agpg5tUcfcV-0BvHq2fSqih+8kcd5AENE-FQ0Q@mail.gmail.com>
Subject: Re: [libgpiod] hopefully simple question regarding pull-up/down control
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Drew Fustini <pdp7pdp7@gmail.com>,
        Bill Barton <peabody@korgrd.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 12 wrz 2019 o 11:27 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
>
> On Wed, Sep 11, 2019 at 12:19 AM Drew Fustini <pdp7pdp7@gmail.com> wrote:
> > On Fri, Feb 1, 2019 at 4:07 PM Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
> > > As for your question: it's in the pipeline, but it's not a trivial
> > > task. We first need to implement the kernel part, then define a
> > > future-proof kernel-to-user-space interface and then implement the
> > > support in libgpiod. For now it's impossible to enable configurable
> > > pull-up/down resistors from user-space.
> >
> > Hello, I'm curious if there has been any further development towards
> > being able to control pull up or pull down through libgpiod.
>
> I met with Drew yesterdat and we decided he will take a stab at fixing
> this for the benefit of all Adafruits etc.
>
> Yours,
> Linus Walleij

Awesome! Let me know if I can help. I'll make sure this gets supported
in libgpiod as soon as we have an interface exposed by the kernel.

Bart
