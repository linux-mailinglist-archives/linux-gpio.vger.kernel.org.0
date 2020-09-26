Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 763F0279822
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Sep 2020 11:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgIZJQh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 26 Sep 2020 05:16:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgIZJQh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Sep 2020 05:16:37 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0660C0613CE;
        Sat, 26 Sep 2020 02:16:37 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id k13so5368360pfg.1;
        Sat, 26 Sep 2020 02:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zUpCZBDmLv3bzzw8GFkhem2DuSrT6Qw9iLrMsD3ggz4=;
        b=XPpvmzifIrhP2levTgvxx7LDo+0rXOJx4H8L24KI6Q5W++VId4h0kTe6CsGBZVHosq
         qwB9g3JwNJjVJFLarxoJqxtDlP4WaL5FiJ1tQpteBFsCj4E216ajuh9TDa6t/3SwLKTd
         meiQyHhSTpBdTc/mGBHQosZtlgkvMeVnPh9jCjAEo5T44MOcPmTn4ZNM1J26DeRDmiGL
         KNLOWA4Q2neHecgK/rK/5hW2v+sZzTkYHZIUIyVpF0TTYbSl0TOdCeGXlmXG0NoRWF5E
         jxXA2FcHDLhDF5xvXtiZVXVBUYgDwS2DGO/+BkVzkSkns7KY6PLGQYakG696okFdJtCV
         J/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zUpCZBDmLv3bzzw8GFkhem2DuSrT6Qw9iLrMsD3ggz4=;
        b=q5G07lCmNOFzZNVscl4kSswDqHJb7Yz6d9JmoVAB1ASVCB7bZbFJncvdcmmQwO+0Q+
         EHQoXMS24jeV8k4PskC35NNVxoORXAzVhEfIKybW8esIRyew8LKY8Ivi0zavvrR78SDR
         lBqZJ0y3eBXrHJ0Lac7iGddZjj2LvJtQl8mwwKSeOBEMCZt9buA8WmLZSNEdSLT7WVfz
         nYunRTgaGzgA52sgNKiK6NiQuH4Ba890F5Fc48k38CcX9JeXlOqY060s0kgrqB0E+bm1
         iBNmnMAnkSGnpZbQkj4cwpS7xi4DX13GXyOXXIS+SWce8g0G5ZIqpy1fIqciLGymbFzF
         nZxg==
X-Gm-Message-State: AOAM533ApvvxVzQt2t0oEymBdzZD6z5SGR+q024X0Pzvar6iuOkc6pOO
        Tej63cNHMIOaeefrTwYemEE=
X-Google-Smtp-Source: ABdhPJxB4BQTuyhw2yB6gi7fkH7QVA2OKr+SS3T/I6CoNZUk7EEQTg8M/K/9eSVJv19aCJEf6iQeYQ==
X-Received: by 2002:a62:178d:0:b029:13e:d13d:a0f8 with SMTP id 135-20020a62178d0000b029013ed13da0f8mr2350555pfx.20.1601111797224;
        Sat, 26 Sep 2020 02:16:37 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id q65sm4069967pga.88.2020.09.26.02.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 02:16:36 -0700 (PDT)
Date:   Sat, 26 Sep 2020 17:16:31 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 07/20] gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL
 and GPIO_V2_LINE_GET_VALUES_IOCTL
Message-ID: <20200926091631.GA89482@sol>
References: <20200922023151.387447-1-warthog618@gmail.com>
 <20200922023151.387447-8-warthog618@gmail.com>
 <CAHp75VdQUbDnjQEr5X5q6WdU6rD=uBNznNn5=Vy=pvdwVj_hEA@mail.gmail.com>
 <20200924080921.GE17562@sol>
 <CAHp75VehvUTt19sBxgPTZszUmxDGZwqGAV7bgW5jVM8Mf63UJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VehvUTt19sBxgPTZszUmxDGZwqGAV7bgW5jVM8Mf63UJA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 25, 2020 at 01:06:02PM +0300, Andy Shevchenko wrote:
> On Thu, Sep 24, 2020 at 11:09 AM Kent Gibson <warthog618@gmail.com> wrote:
> > On Wed, Sep 23, 2020 at 02:11:54PM +0300, Andy Shevchenko wrote:
> > > On Tue, Sep 22, 2020 at 5:35 AM Kent Gibson <warthog618@gmail.com> wrote:
> 

...

> > > > +       /* Make sure this is terminated */
> > > > +       ulr.consumer[sizeof(ulr.consumer)-1] = '\0';
> > > > +       if (strlen(ulr.consumer)) {
> > > > +               lr->label = kstrdup(ulr.consumer, GFP_KERNEL);
> > > > +               if (!lr->label) {
> > > > +                       ret = -ENOMEM;
> > > > +                       goto out_free_linereq;
> > > > +               }
> > > > +       }
> > >
> > > Still don't get why we can\t use kstrndup() here...
> > >
> >
> > I know ;-).
> >
> > Another one directly from v1, and the behaviour there is to leave
> > lr->label nulled if consumer is empty.
> > It just avoids a pointless malloc for the null terminator.
> 
> Again, similar as for bitmap API usage, if it makes code cleaner and
> increases readability, I will go for it.
> Also don't forget the army of janitors that won't understand the case
> and simply convert everything that can be converted.
> 

Hmmm, there is more to it than I thought - gpiod_request_commit(),
which this code eventually calls, interprets a null label (not an
empty string) as indicating that the user has not set the label, in
which case it will set the desc label to "?". So userspace cannot
force the desc label to be empty.

We need to keep that label as null in that case to maintain that
behaviour.

I will add a comment there though.

Hmmm, having said that, does this form work for you:

	if (ulr.consumer[0] != '\0') {
		/* label is only initialized if consumer is set */
		lr->label = kstrndup(ulr.consumer, sizeof(ulr.consumer) - 1, GFP_KERNEL);
        ...

It actually compiles slightly larger, I guess due to the extra parameter
in the kstrndup() call, but may be slightly more readable??

Cheers,
Kent.

