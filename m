Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 755BB277163
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 14:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbgIXMqd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Sep 2020 08:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727987AbgIXMqL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2020 08:46:11 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2730BC0613D3;
        Thu, 24 Sep 2020 05:46:11 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id v14so1542858pjd.4;
        Thu, 24 Sep 2020 05:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u2R826hNWDvUWxoTX3vKcw74OqKnezw5rqLakbWlfas=;
        b=hmtGpzDHV3+upF1VOsB6pw/E4E8IdF/fK3mj1gRX1FYC/FXdo1S1yLg1OdgO/LQGMS
         po4qTLzH7riF4L1+NQR72MyT1UYvz3PWXrE2R0uh4mtdWqqpuivdIgrro+VBGK5DGT6l
         gL5P9xagaGE0xyfRTGpnVwVEr7l0bM8H917g6OSbIFN8MbrOIusmRLdZ/Mrp1LnB8Asq
         rRV5Nrvx7NJnZ6VOhw2vlS4/cLXoKmzA3MU1n0aK+O0ZmC3tbDRlIKyG+AG/GDNht9La
         bmO3OvQXF1dtejyAEpqAONFConi0rw3/4eESA6OqTaHAOBn+vUaSkjp6cduYvq6k0PTf
         lGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u2R826hNWDvUWxoTX3vKcw74OqKnezw5rqLakbWlfas=;
        b=SZqFI+Kf3fy/+PTrBjZ3railHf1DAT4ijyZfI7ij030WaS8v4HwjWzX2dPkb9REbye
         jNO7HCZT4CRhaBIbzcpOgC90QpK+vsKqZdoF/OPZuF7W1eX5ieEw5XDZcD/fRqElK+GC
         x6fRx1tcXWtkengARNgffXJYxlsh8sUDnIbX8zJ/o4Dy4iQMaJA7+2qCA86TH4eX/u9x
         lOyLFVzkU252X34sm2xjxHxSrbkC9HIVkmx2UihkudS+iXcPeJlnvANHImzh0OniIARi
         iJNkNb1adZcTq71hgITPfX9ZUimi0H/qYdpj1yYUKvWl35e09XIlFg6yoZVGUnb4MPkc
         Xhwg==
X-Gm-Message-State: AOAM533JvumyZVQSBDVkPClKrcwfUxc1UoLRj6Adkx1NHMPMeVx4ghY5
        6zSRXBeX4Fo+Gy99v+ZVX8o=
X-Google-Smtp-Source: ABdhPJz+jl5H7lbkTBrZb3OvoUP58rT5CWBffPToXsGV4FkM8dQwdAD3hGJHlsoQDfbsmO67uO2tXw==
X-Received: by 2002:a17:90a:1548:: with SMTP id y8mr3810358pja.113.1600951570511;
        Thu, 24 Sep 2020 05:46:10 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id b18sm2921189pfr.4.2020.09.24.05.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 05:46:09 -0700 (PDT)
Date:   Thu, 24 Sep 2020 20:46:04 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 11/20] gpiolib: cdev: support
 GPIO_V2_LINE_SET_VALUES_IOCTL
Message-ID: <20200924124604.GA227073@sol>
References: <20200922023151.387447-1-warthog618@gmail.com>
 <20200922023151.387447-12-warthog618@gmail.com>
 <CAHp75Vd6tb09n+okJmoPse992DeoPkJQHReNBo20FQNz1V2c5w@mail.gmail.com>
 <20200924073248.GA17562@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924073248.GA17562@sol>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 24, 2020 at 03:32:48PM +0800, Kent Gibson wrote:
> On Wed, Sep 23, 2020 at 07:18:08PM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 22, 2020 at 5:36 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > Add support for the GPIO_V2_LINE_SET_VALUES_IOCTL.
> > 
> > > +static long linereq_set_values_unlocked(struct linereq *lr,
> > > +                                       struct gpio_v2_line_values *lv)
> > > +{
> > > +       DECLARE_BITMAP(vals, GPIO_V2_LINES_MAX);
> > > +       struct gpio_desc **descs;
> > > +       unsigned int i, didx, num_set;
> > > +       int ret;
> > > +
> > > +       bitmap_zero(vals, GPIO_V2_LINES_MAX);
> > > +       for (num_set = 0, i = 0; i < lr->num_lines; i++) {
> > > +               if (lv->mask & BIT_ULL(i)) {
> > 
> > Similar idea
> > 
> > DECLARE_BITMAP(mask, 64) = BITMAP_FROM_U64(lv->mask);
> > 
> > num_set = bitmap_weight();
> > 
> 
> I had played with this option, but bitmap_weight() counts all
> the bits set in the mask - which considers bits >= lr->num_lines.
> So you would need to mask lv->mask before converting it to a bitmap.
> (I'm ok with ignoring those bits in case userspace wants to be lazy and
> use an all 1s mask.)
> 
> But since we're looping over the bitmap anyway we may as well just
> count as we go.
> 
> > for_each_set_bit(i, mask, lr->num_lines)
> > 
> 
> Yeah, that should work.  I vaguely recall trying this and finding it
> generated larger object code, but I'll give it another try and if it
> works out then include it in v10.
> 

Tried it again and, while it works, it does increase the size of
gpiolib-cdev.o as follows:

          u64   ->   bitmap
x86_64   28360       28616
i386     22056       22100
aarch64  37392       37600
mips32   28008       28016

So for 64-bit platforms changing to bitmap generates larger code,
probably as we are forcing them to use 32-bit array semantics where
before they could use the native u64.  For 32-bit there is a much
smaller difference as they were already using 32-bit array semantics
to realise the u64.

Those are for some of my test builds, so obviously YMMV.

It is also only for changing linereq_get_values(), which has three
instances of the loop.  linereq_set_values_unlocked() has another two,
so you could expect another increase of ~2/3 of that seen here if we
change that as well.

The sizeable increase in x86_64 was what made me revert this last time,
and I'm still satisfied with that choice.  Are you still eager to switch
to for_each_set_bit()?

Cheers,
Kent.

