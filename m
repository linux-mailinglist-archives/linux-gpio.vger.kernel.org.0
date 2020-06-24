Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A413420969C
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2020 00:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732607AbgFXW6M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 18:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728383AbgFXW6M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 18:58:12 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE9AAC061573;
        Wed, 24 Jun 2020 15:58:10 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id d10so1804515pls.5;
        Wed, 24 Jun 2020 15:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5fFSv63vrx2iH/K6v2qc1f863y3U8N/wNCQngVFz1pY=;
        b=bCP/dCOilIiQ3qzUm/oFbudTkYh4ecnU3wkfGZB1rrcrBxtofienEF5mEHGj+F+97e
         GDGVKNTn+KFlQxZI0CFZP3QYOLA4V1vbUIgdPol+1ZI+ZX+Yo5WHsWOE2tw0pphCWTke
         aCnkEkV+vm1SiJUpMwUbtDmjQcKY9CLh5o6Wtx2emU456VNaIiq5wwnVfPppHQpQSnG7
         DjjYUHV7SMS51gFMr5hWe5O5GECrs0Teljd8zQzrnF/iWt2R7/CgnjqVoJSEjIWstg+k
         XN8wdNHKHy1ksCycnrbdNDhHlIGc5Sk6jKiP81GFplZi1vRRrqOpTvdzm9yv6YaTzzrO
         6KhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5fFSv63vrx2iH/K6v2qc1f863y3U8N/wNCQngVFz1pY=;
        b=ft/Ef5jeCxlU/nRONL9xX52y5XFGYb/uHdl7gMsb39A91MYKAQJ19n1ujt/3nGDQEW
         FWMf1H9+A1hTalu1lkaNRkMgxNIT4u4hAOtTbNKrimREWNUvGoicLU1p63DL0KZR7+a7
         1PT3vZxrEGKgbIRKjHwfw/AnAjep8fbGOzkHd/DsHW3T0Np/FTcqOD6tkZtKrJpkGGuK
         qhr/tZAATYvH9qpe9YoVO6G1jgheWkxdeNzfFViLpqFTWaxUdREe9yYQou0e3WvCE84i
         fuCHRh6TwvQGoFRpJUlr3hn0lLa4D4KIE2DGQyCIL2NorohRf9zw89rb579onh6T0u1p
         WcWQ==
X-Gm-Message-State: AOAM532u2uSt/UljQDvJhyG0OQA64gIn378dQFmUU4L8ZROLlRGrIqGi
        33JO31R4rr2BUgbuiCnXxlo=
X-Google-Smtp-Source: ABdhPJwAQfiiSjDCMp1CDUq8F9cf6gWRE3v18/jbXPR2o3424p703EWghl1h0OEej910i+7DIvQRsQ==
X-Received: by 2002:a17:90a:668f:: with SMTP id m15mr102540pjj.32.1593039490207;
        Wed, 24 Jun 2020 15:58:10 -0700 (PDT)
Received: from sol (220-235-99-174.dyn.iinet.net.au. [220.235.99.174])
        by smtp.gmail.com with ESMTPSA id k28sm1856498pfp.82.2020.06.24.15.58.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jun 2020 15:58:09 -0700 (PDT)
Date:   Thu, 25 Jun 2020 06:58:03 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 10/22] gpiolib: cdev: fix minor race in GET_LINEINFO_WATCH
Message-ID: <20200624225803.GA3600@sol>
References: <20200623040107.22270-1-warthog618@gmail.com>
 <20200623040107.22270-11-warthog618@gmail.com>
 <CAHp75VdG4r95ZU8G9TfL+jkT63+Gppb8w5TRvAtCR_pAk0o=NA@mail.gmail.com>
 <20200624155714.GB8622@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624155714.GB8622@sol>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 24, 2020 at 11:57:14PM +0800, Kent Gibson wrote:
> On Wed, Jun 24, 2020 at 05:46:33PM +0300, Andy Shevchenko wrote:
> > On Tue, Jun 23, 2020 at 7:03 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > Merge separate usage of test_bit/set_bit into test_and_set_bit to remove
> > > the possibility of a race between the test and set.
> > >
> > > Similarly test_bit and clear_bit.
> > >
> > > In the existing code it is possible for two threads to race past the
> > > test_bit and then set or clear the watch bit, and neither return EBUSY.
> > 
> > I stumbled over this myself, but...
> > 
> > > -               if (test_bit(hwgpio, gcdev->watched_lines))
> > > +               if (test_and_set_bit(hwgpio, gcdev->watched_lines))
> > >                         return -EBUSY;
> > >
> > >                 gpio_desc_to_lineinfo(desc, &lineinfo);
> > > @@ -897,7 +897,6 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> > >                 if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
> > >                         return -EFAULT;
> > >
> > > -               set_bit(hwgpio, gcdev->watched_lines);
> > >                 return 0;
> > 
> > ...I think it's not an equivalent despite races involved. If you set
> > bit and return error code, you will have the wrong state.
> > 
> 
> Not quite sure what you mean.  There is only an error if the bit is
> already set, so you've changed nothing.
> 
> And the watched state is not part of the lineinfo, so the state returned is
> the same either way.
> 

Perhaps you are referring to the case where the copy_to_user fails?
To be honest I considered that to be so unlikely that I ignored it.
Is there a relevant failure mode that I'm missing?

Cheers,
Kent.
