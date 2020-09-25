Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50109277FF2
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 07:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbgIYFcb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 01:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbgIYFcb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2020 01:32:31 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C0D2C0613CE;
        Thu, 24 Sep 2020 22:32:31 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id mn7so1176494pjb.5;
        Thu, 24 Sep 2020 22:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9YgBJlIKi5kmXGbk0XsVG/ud8mkg9qYebNm0xoOIdi0=;
        b=VChKgsATAdkBdE1XrKnOQKz51Gqz2b2fJslaDj+SXF2Dr4fBSSBPNQAHH6S7m/U4J1
         sEWBmJomvj0kTezO7TY18GYjqyPt/HR0uPgWCkkOkW5TOfAKrMxZjXmQE/R1TrvgOSy6
         4UE2Gip5J3BAQvOisQhrYQb3+xRXvP8dOYQROMw204MwqzIGBSgjIGhr+AD2fMpDoyG6
         w+IbiOXNpK3f7b4ad41bcCFhosDG4APCrjmeilSt2WGf2hAw/FgnKp4ihXL0KzJNEDia
         PpN7CeENl6jhKllS27j+lrXIxWpcWSDEU+blAb96Ruf7MBmKRa777D8HLnIyNdKY+L8A
         YJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9YgBJlIKi5kmXGbk0XsVG/ud8mkg9qYebNm0xoOIdi0=;
        b=k0P/axmvwqK7JsY33npQYcuQfRGXMTa7cJOmnEjhGUXPK7QTrEACSkSUbmQFSCmHkJ
         +duMvWKAc+2/M0NDwqILdVJIn6XgQTwenCnrleuCm7qvvMuvCS4ml+YqFXQUbxaxQX3M
         PvrhYbGJXwisMWeRM4+4q+P67uPw4LTRZBOTjdYNKu6VhxpIdC7a3wNm+NSVwBNzB9NN
         raBmbPhBIiPxQbqObWXA77LVVlpv6SnEe02csATuhV1BIx5GoSmUClxQg51g7p+btbEF
         dgYVuxx0KCU7BTCpQwNhZC7O9UUosIYVGUZAb3gAZgB6tO+GWB1VV90kU35gNDYOHtuV
         ei3w==
X-Gm-Message-State: AOAM530neSSk+CbmoPi7EjakPbWGnZgltyQJzxjpPntXW0sjV/bZ/I3A
        cgGo4WVF1EtkUy/W3zME6ws=
X-Google-Smtp-Source: ABdhPJxktPBFy0zLI45c1bR2d5mGct15Ssw7U6M3+gtapIMXSm1Jug8cSSLjsF5p7WDPAxnqUaJ+tw==
X-Received: by 2002:a17:90a:ad8b:: with SMTP id s11mr1111763pjq.40.1601011951109;
        Thu, 24 Sep 2020 22:32:31 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id l21sm840643pjq.54.2020.09.24.22.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 22:32:30 -0700 (PDT)
Date:   Fri, 25 Sep 2020 13:32:25 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 08/20] gpiolib: cdev: support
 GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL
Message-ID: <20200925053225.GA32865@sol>
References: <20200922023151.387447-1-warthog618@gmail.com>
 <20200922023151.387447-9-warthog618@gmail.com>
 <CAHp75Vc05P4-X_ZC6k-EWdDCAXOgPgAJhm4RxF3izvk=vW+X+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vc05P4-X_ZC6k-EWdDCAXOgPgAJhm4RxF3izvk=vW+X+g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 23, 2020 at 06:41:45PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 22, 2020 at 5:35 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Add support for GPIO_V2_GET_LINEINFO_IOCTL and
> > GPIO_V2_GET_LINEINFO_WATCH_IOCTL.
> >
> > +#ifdef CONFIG_GPIO_CDEV_V1
> > +static int lineinfo_ensure_abi_version(struct gpio_chardev_data *cdata,
> > +                                      unsigned int version)
> > +{
> 
> > +       int abiv = atomic_read(&cdata->watch_abi_version);
> > +
> > +       if (abiv == 0) {
> 
> > +               atomic_cmpxchg(&cdata->watch_abi_version, 0, version);
> > +               abiv = atomic_read(&cdata->watch_abi_version);
> 
> atomic_cmpxchng() returns a value.
> Also there are no barriers here...
> 
> > +       }
> > +       if (abiv != version)
> > +               return -EPERM;
> 
> I'm not sure I understand why this is atomic.
> 
> Also this seems to be racy if cdata changed in background.
> 
> Shouldn't be rather
> 
> if (atomic_cmpxchg() == 0) {
>   if (atomic_read() != version)
>     return ...;
> }
> 

Perhaps this is what you had in mind:

static bool lineinfo_is_abi_version(struct gpio_chardev_data *cdata,
				       unsigned int version)
{
	int abiv = atomic_cmpxchg(&cdata->watch_abi_version, 0, version);

	if (abiv == version)
		return true;
	if (abiv == 0)
		/* first (and only) setter sees initial 0 value */
		return true;

	return false;
}

That is functionally equivalent, but slightly shorter.

I was thinking the atomic_cmpxchg() is more expensive than an
atomic_read(), and so initially checked the value with
that, but for the cmp failure case it is probably the same, or at least
not worth the bother - this isn't even vaguely near a hot path.

I've also switched the return value to bool in response to your other
comments.

Cheers,
Kent.
