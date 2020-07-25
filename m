Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11A6922D473
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 05:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgGYDwK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jul 2020 23:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbgGYDwJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jul 2020 23:52:09 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E832C0619D3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2020 20:52:09 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id k4so5577427pld.12
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2020 20:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=bQivI2KWuf6QsCtu4WYpm/cqse3jOtGZ9zv6Uhe9MH0=;
        b=t9nPHl5KUilDZALXtGbibjXnq/hhM1EQ5Aa1D9KwICK/sKS8DUic55FPYMjgJ5a/dy
         sQLr7DmRdwWOsAYliDkDgimprF/m1QoM8yaIAdiBZzmlSZo+fcfKA/Nnrx5hlU2uojes
         BWvLGFvNIPAejc3zzaBDwH7RQwZLwDeTaV7eSRpI5sOkSLuoAWTeVbQxShNWBT1Dl92U
         ufDi73WqvHWN0kJLIlGcJM1NvNFiIfOIezxJBdmSI6EM4MVA8teSzM2aeuTtcWUeF4ef
         FeLSFyPRnlQo/9aSl8j3lE7wu6adSsn4a+LmxLBtPSp4PPkQGJzZYC4zGVy7l3esWV16
         FQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=bQivI2KWuf6QsCtu4WYpm/cqse3jOtGZ9zv6Uhe9MH0=;
        b=dLmmn2SbW7rjRrZkJSl//mRSuQ3W39cJC2b5+a0pmCOLcWDWZtjsyPEUYD28RtNFZX
         OAVF/pIR23DAhDhwxoD/24Vo0rCspn7CqgtXHe2tRss4UpR/4V54pUzhGgoxgq/XA/uZ
         8yrFhp1Wa0/uzXO0gm2b4luZ5fp3xL5Nm78o1HJQL1GshyNw/COrCoXsvuquwtghpULM
         UlvynGS5MlwKyqFLoc0LdYiReF/SMakmhVDQkYiJFy9YAedq2XEwzR/K4NDQNRfWPs/y
         h7dmM14nW9zVS3MEYRu/RhE3fWqaZZQ1tseSW04RwNi/VjkQcOnzFbpxb2sEuv2yZNkO
         OfYw==
X-Gm-Message-State: AOAM531NHtMfMT4F5JWwQwpZYr+5KA3mN8SUqqXrTOEZu7n6+xymU0ln
        UY+P1DROMvIQpSPJCfGQ2AM=
X-Google-Smtp-Source: ABdhPJz/XGEUgAcXD0EwSmf5StMhgG5deDUBK+8Ks8TR6Y2NfXAhYaLSy/XY2EwH4ABUVv0a9vKtvw==
X-Received: by 2002:a17:90a:1387:: with SMTP id i7mr8772992pja.3.1595649129095;
        Fri, 24 Jul 2020 20:52:09 -0700 (PDT)
Received: from sol (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id y11sm8467570pfp.73.2020.07.24.20.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 20:52:08 -0700 (PDT)
Date:   Sat, 25 Jul 2020 11:52:03 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Maxim Kochetkov <fido_max@inbox.ru>
Subject: Re: gpiolib gpio_chrdev_release duration is about 30 ms
Message-ID: <20200725035203.GA8572@sol>
References: <7eb11c0d-cd11-f873-c336-4ec955a7bdb3@inbox.ru>
 <CACRpkda-pXF71vr5v90yipKubc14tbZW5Ryw1o7rdn4FbWwsTw@mail.gmail.com>
 <190bca20-946f-52f9-64f8-8971da17d38b@inbox.ru>
 <CAHp75VfQdTtbiHjhBuf3czdKAgmiQeALo7CaqW36oEkSGSHUBA@mail.gmail.com>
 <20200718042548.GA43247@sol>
 <7a22761d-c930-3597-6bf1-c799f70a47f8@inbox.ru>
 <CAMRc=MdSMMd5SN2HeicgdHkKsBTHTB_5Cn0cYG5EPggn0Mcukg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdSMMd5SN2HeicgdHkKsBTHTB_5Cn0cYG5EPggn0Mcukg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 24, 2020 at 09:36:03PM +0200, Bartosz Golaszewski wrote:
> On Mon, Jul 20, 2020 at 10:14 AM Maxim Kochetkov <fido_max@inbox.ru> wrote:
> >
> > It works fine with this patch. Thank you so much!
> >
> > 18.07.2020 07:25, Kent Gibson пишет:
> > > On Fri, Jul 17, 2020 at 06:07:04PM +0300, Andy Shevchenko wrote:
> > >> On Fri, Jul 17, 2020 at 5:17 PM Maxim Kochetkov <fido_max@inbox.ru> wrote:
> > >>>
> > >>> I need a small userspace program to do some GPIO magic to communicate
> > >>> other hardware like devmem. This program takes about 2,5 seconds just to
> > >>> find GPIO lines by name.
> > >>>
> > >>> replacing synchronize_rcu to synchronize_rcu_expedited in
> > >>> atomic_notifier_chain_unregister gives the same boost as removing
> > >>> synchronize_rcu
> > >>
> > >> Have you tried to replace an atomic notifier call with a regular one?
> > >> IIRC it's still not clear why atomic is used there.
> > >>
> > >
> > > Indeed, I recently submitted a patch to switch the
> > > atomic_notifier_call_chain to blocking_notifier_call_chain, as some of
> > > the chained calls can sleep.
> > > Not sure if that is related, or if the change would make this case better
> > > or worse, but it would be interesting to find out.
> > > The patch is in the current gpio/devel, btw.
> > >
> > > Cheers,
> > > Kent.
> > >
> 
> Linus,
> 
> I think we should consider submitting this patch for stable then
> because this slow-down was affects previously existing use-cases.
> 

That patch is post the cdev split, so it certainly wont apply to an
older kernel.  I'm happy to backport it if you need it - just
nominate the branch you want it for.

Cheers,
Kent.
