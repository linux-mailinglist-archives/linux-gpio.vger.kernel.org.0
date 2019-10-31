Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83A5BEAAF2
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2019 08:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfJaHYh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 03:24:37 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33686 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbfJaHYh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Oct 2019 03:24:37 -0400
Received: by mail-pl1-f195.google.com with SMTP id y8so2306844plk.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2019 00:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Yt4y6bNrf8Nf4Ja+mF7s+zSissyMsbR2J9/ne4ZEk+g=;
        b=HOZXAkISoRejkyv4POhq0GYt76qWBP7KDSlh7b/D+pbKAJTKBRBWSspZ8vsmUf+0D/
         JsHaZ2MyFS9YYU9vqSMNHWMQgRV/cN2Fj2MZ/Snd834XM9DF+QP0enMf4hNSTeXka+sG
         rIrwz7XWyR4O4FxmUS1mndcj3nbRlpmDKZO8InWag0qK9kr2zfu971pb50Uulo4ApJEB
         MwG4z5T2C1yls3bH8Cx9aydne9SQwz95ORN6ispx37cvygIJ5enhCVoQ/guLiShpzQlu
         A/GQn8TcSk2MltVjSmV6v1CkNTh3hY9uEF34SbAygcVbr4eN51+fLqUDvYvLV36fJAER
         2KRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Yt4y6bNrf8Nf4Ja+mF7s+zSissyMsbR2J9/ne4ZEk+g=;
        b=gju2sLlscu3vrgv0b3cowT3NLkNURy7GCfkV59hjwvLs7XGc2JByPo1mvhoDXNmRrT
         BnyDbDgolKfc7fmtwFt2WmXfjYfDq72eZRbFSGlLcL1hsOAjFwqraTuXZR6ofiA+1G+B
         bs0x1DhK6SU8vtas7BYk+6UUjtYNIHVQRAf+IBXsuOgoFlfTzgS54aqkd4W/6uNs0e2F
         7COYGcHF+pUrDn6zFS0eItSOMyUQC+3sUBQU1RLggtKPxG80l7Zd+ZI0YmyMyApbOkk+
         0SnWO6mpOstGgye3OORLgizhbuj2ZbSvmnGmSPKKjd73sRCUew62ZLeHbF+hzr9CMW+4
         FKsQ==
X-Gm-Message-State: APjAAAUhp1kvFVutEKbJdTJ3cNkpe1P/MgnxBFcoPe95eUWtKJHHu4r5
        JC5SbqdkuMEK3NBCVP0E0lU=
X-Google-Smtp-Source: APXvYqxpTVMnYs/H5rmZ6EsCR6eHUvQ6rd4ZDhqoQ/p7ySxHlhClZHWhqQRMLLdjvU7DIUPtC9+HCw==
X-Received: by 2002:a17:902:d68f:: with SMTP id v15mr4659746ply.206.1572506675936;
        Thu, 31 Oct 2019 00:24:35 -0700 (PDT)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id u11sm2381556pgo.65.2019.10.31.00.24.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2019 00:24:35 -0700 (PDT)
Date:   Thu, 31 Oct 2019 15:24:29 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>, drew@pdp7.com
Subject: Re: [PATCH v4 2/5] gpiolib: add support for pull up/down to
 lineevent_create
Message-ID: <20191031072429.GA25839@sol>
References: <20191028073713.25664-1-warthog618@gmail.com>
 <20191028073713.25664-3-warthog618@gmail.com>
 <CAMpxmJXMS6PG3EH_SQmYUBvQ4uB4zMtkaFCRfCEkiAQTYLYUhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJXMS6PG3EH_SQmYUBvQ4uB4zMtkaFCRfCEkiAQTYLYUhA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 31, 2019 at 08:11:12AM +0100, Bartosz Golaszewski wrote:
> pon., 28 paź 2019 o 08:38 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > Add support for pull up/down to lineevent_create.
> > Use cases include receiving asynchronous presses from a
> > push button without an external pull up/down.
> >
> > Also restrict the application of bias to lines
> > explicitly requested as inputs to prevent bias being applied
> > to as-is line requests.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >  drivers/gpio/gpiolib.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index e80e689be2cc..7dfbb3676ee0 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -554,6 +554,12 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
> >              (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
> >                 return -EINVAL;
> >
> > +       /* PULL_UP and PULL_DOWN flags only make sense for input mode. */
> > +       if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
> > +           ((lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP) ||
> > +            (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)))
> > +               return -EINVAL;
> > +
> 
> This is not part of this patch - this must go into 1/5.
> 
Yeah, that would make more sense.  Will relocate it in v5.

Cheers,
Kent.
