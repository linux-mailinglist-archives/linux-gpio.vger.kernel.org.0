Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE6F424BB7
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Oct 2021 04:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbhJGCQY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Oct 2021 22:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbhJGCQY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Oct 2021 22:16:24 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EFEEC061746;
        Wed,  6 Oct 2021 19:14:31 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id m14so3978379pfc.9;
        Wed, 06 Oct 2021 19:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zE7hlODd6NPyiXnEakuG69lfP+QvHTUKQl/iJbEFaPM=;
        b=GD3SSn1gy0zxUJnMRAdQxxFXRtoyqFzb+PfuuIo93r/swOQI+Pxq2p0ETTrJAGEYME
         eRJOxeDqvK1xuIaICv9ssQU9qB4InEa1eOBgDGLzaptRcOUpu0diCXIm0ZH6kQYrIlDe
         O7bzhOuXiQJj1zcl++uBAxnavege+K2jBQ2T9PsreKjQ80RpeSbxBSUUONxbnDumjADS
         cs+XPUxA0M61EC04lzXvTdcUSlX0wMCCow4lBbyumG+0HTSF7k4LMbfnLL6rSnK9h4K5
         /Eup7rTxlqWGmcvOj8qHjBTx63krdk061r3stfp4tC2YdcFEspxaMg05bsYPEflTHa4M
         ROUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zE7hlODd6NPyiXnEakuG69lfP+QvHTUKQl/iJbEFaPM=;
        b=pDPexeX45v91TISINLYLa0g7qJQ5bmwwCFeqb9l3sdmKcEUBgaNXtIqDbtFPyfiz3R
         K+xuc1jXjSyKduNCjpDQrDBoGtESQ2Ppa4oFH7B9iGiIPvTIwmQTohBNUcxJHwvNOm4L
         zjmIQU/RbifVAIroUCaHkuIDrytUBSx/dGzQXtCLJzdPA26v+a4veGgYzRzKrC154mP8
         ZYcziVOOMLdPWCindVG55KmGyhbJPeIQN8XStkA7vUKtjT5B8d+RpfocJl10oFpDEtMg
         syPliY/CoryfwM7946t09w7zfLa093QLYA4S9kEQFinMNPyzQygAb3ld05j0MW/7FGQx
         qEHA==
X-Gm-Message-State: AOAM530zd+0dwJN/FLNVqc9mT4bq9dcuYT069HTYIcMiPcWv0kgKP9vn
        tTkRvU+qYxASvsZohAaSIgQ=
X-Google-Smtp-Source: ABdhPJxQqVylmn8imZ+r34wMCfcyjjPD2wtrRwePCKvKmyEhmxq2TLGobVaYx+eNuIcfRkhEMzBZ9w==
X-Received: by 2002:a05:6a00:b4d:b0:44c:b7a7:cab2 with SMTP id p13-20020a056a000b4d00b0044cb7a7cab2mr1480805pfo.20.1633572871034;
        Wed, 06 Oct 2021 19:14:31 -0700 (PDT)
Received: from sol (106-69-170-56.dyn.iinet.net.au. [106.69.170.56])
        by smtp.gmail.com with ESMTPSA id z4sm22772247pfz.99.2021.10.06.19.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 19:14:30 -0700 (PDT)
Date:   Thu, 7 Oct 2021 10:14:24 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     lakshmi.sowjanya.d@intel.com,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, mgross@linux.intel.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        tamal.saha@intel.com, bala.senthil@intel.com
Subject: Re: [RFC PATCH v1 02/20] gpio: Add GPIO polling interface to GPIO lib
Message-ID: <20211007021424.GA13920@sol>
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
 <20210824164801.28896-3-lakshmi.sowjanya.d@intel.com>
 <CAMpxmJWeZP-f-3BoWwX7PkWNZySn5RP=rc4cVyLEwYmSb6if+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJWeZP-f-3BoWwX7PkWNZySn5RP=rc4cVyLEwYmSb6if+w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 22, 2021 at 12:03:53PM +0200, Bartosz Golaszewski wrote:
> On Tue, Aug 24, 2021 at 6:48 PM <lakshmi.sowjanya.d@intel.com> wrote:
> >
> > From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> >
> > Some Intel Timed I/O devices do not implement IRQ functionality. Augment
> > read() interface to allow polling.
> >
> > Add two GPIO device methods: setup_poll() and poll():
> > - setup_poll() configures the GPIO interface e.g. capture rising edges
> > - poll() checks for events on the interface
> >
> > To implement polling, the driver must implement the two functions above
> > and should either leave to_irq() method NULL or return irq 0.
> >
> > setup_poll() should configure the hardware to 'listen' for input events.
> >
> > poll() driver implementation must return the realtime timestamp
> > corresponding to the event and -EAGAIN if no data is available.
> >
> > Co-developed-by: Christopher Hall <christopher.s.hall@intel.com>
> > Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
> > Signed-off-by: Tamal Saha <tamal.saha@intel.com>
> > Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> > Reviewed-by: Mark Gross <mgross@linux.intel.com>
> > ---
> 
> Interesting. So the idea is to allow user-space to read line events as
> if they were generated by interrupts handled in the kernel. While this
> whole series has a long way to go and this patch looks wrong to me in
> several places at first glance, I find the idea interesting. Cc'ing
> Kent who's the author of most of this code - Kent: what do you think?
> 

It is interesting that we're seeing more hardware that provides more
detailed edge info than we get from irq.  The hte patch series can also
provide hardware timestamps, but the Timed I/O could even provide the
sequence numbers.
It might be worth abstracting the edge detection so edge events could be
more easily driven by subsystems other than irq, without festooning cdev
with special cases.

I'm not a fan of the polling here though, particularly from userspace.
If polling can't be avoided (why did they not provide an irq??) then I
would do the polling in kernel and place any resulting events in the
cdev kfifo for userspace to read as per the existing events.

Of course that is without knowing a whole lot about the hardware or use
cases.  The Intel datasheet doesn't provide much in the way of data :|.

Cheers,
Kent.
