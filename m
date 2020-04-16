Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA7E1ABF8E
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 13:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505649AbgDPLCi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 07:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505995AbgDPLBr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Apr 2020 07:01:47 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D3EAC061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 04:01:40 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id f8so5205673lfe.12
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 04:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=T2wyP0Kd10FdNuH7V6V7rYHnj1YKbM2dx1dVvWWsY1I=;
        b=rakyXdvmimhJUV5R2B9V7VHpSVsIeOe7OOpMs0AARX+WjKpGxSbVqoo9eC/XifxzyL
         tTqIwyr+PgIhFK+CR+IDL6G6lQ1zjvTTJX03dMjUHZQJcRNgpIgkb7v+1gP+92nA2sk+
         Zc08fh9gsX6eL9jbqhTsU7MdfX9DIgZvO+0c+VVTp8l0k3S6yFiwtQzMJj+uGxR1i8Mo
         n6EtfJZY4/hwr13ALynHUIFGNQX6o9X16QW1NxhgL5zESGYdkQGm/DCaX13EGIOCtFB5
         Q2C8TnvHVzs/u28cmcYovGW0wGQIoiszKwv0qU+7e5yj00+Gg6+BQErpaYPStfumh5Jn
         li+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T2wyP0Kd10FdNuH7V6V7rYHnj1YKbM2dx1dVvWWsY1I=;
        b=asaPfBVN4VXxy9uH6WqjqPBAtOqQL8cfHz2L+uYHqyVT1w2qrYSK4voOxQqX5n4p0c
         Hwdze13yI7z4fV/CLHzqtzuY2wyXE9hqG2MhKrodkikcyB3+vl/5r3aM+0xnNa+w1V0S
         8dZObcU/Q7OqZibMW0/oTmxv2k3zY3h11Ms7+O3eUJuIt4nUoGyP5jAcv9h7h8SWjph9
         RWpyVSm2O009Hcsq5AhjYDAbSouQMtR7GyaUJW3k+srPa+xxpPeTrQncZgOlZDIolfPV
         hmVm88G06jzNBTMpgsZMP4djJ85qvVjDfhPqEMQXMKAfE02cGCAeBiuQ84oPM0igZrT3
         IdTw==
X-Gm-Message-State: AGi0PuZXki3y5gpwYVYtmBwGyF/ozC9w2si6iDW5KloLps6J+lffBa0J
        JQR5pWJJbwm8LuwuNbru4MI=
X-Google-Smtp-Source: APiQypL9ebYejagN6aFDXXPF4TSSa3EDN3cUIGnuFMzC1Q/7jy5msR3Vlm75zJqr3hjN1cnmPWqOcw==
X-Received: by 2002:ac2:46c4:: with SMTP id p4mr5735251lfo.37.1587034898482;
        Thu, 16 Apr 2020 04:01:38 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id z13sm7849808ljn.77.2020.04.16.04.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 04:01:37 -0700 (PDT)
Date:   Thu, 16 Apr 2020 14:01:35 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jan Kiszka <jan.kiszka@siemens.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 08/14] gpio: dwapb: Convert to use IRQ core provided
 macros
Message-ID: <20200416110135.dieh6gctkh3bwyiz@mobilestation>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
 <20200415141534.31240-9-andriy.shevchenko@linux.intel.com>
 <20200415175309.6l6skv7qsdjqsryi@mobilestation>
 <20200416103911.GX185537@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416103911.GX185537@smile.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 16, 2020 at 01:39:11PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 15, 2020 at 08:53:09PM +0300, Serge Semin wrote:
> > On Wed, Apr 15, 2020 at 05:15:28PM +0300, Andy Shevchenko wrote:
> > > IRQ core provides macros such as IRQ_RETVAL().
> > > Convert code to use them.
> 
> > BTW Forgot to mention. Irrelevantly to this patch just so you know seeing
> > you are from Intel and this part is being utilized by the Intel Quark SoC.
> > dwapb_irq_handler_mfd() handler will cause a problem in RT-patched kernel
> > (I've seen such issue in another GPIO-driver). So if PREEMP_RT_FULL patch
> > is applied and the FULL-RT scheduler is enabled all interrupt handlers
> > specified by request_irq()-based methods will be handled by a kernel thread,
> > while generic_handle_irq() is supposed to be called from the atomic context
> > only (with interrupts disabled). As a result an ugly stack dump will be printed
> > to the kernel log by the next code:
> > https://elixir.bootlin.com/linux/latest/source/kernel/irq/handle.c#L152
> > 
> > A way to fix this is described in Documentation/driver-api/gpio/driver.rst
> 
> There is patch from Siemens to fix that [1]. I dunno if they are going to upstream it.
> Jan?
> 
> [1]: https://github.com/siemens/meta-iot2000/blob/master/meta-iot2000-bsp/recipes-kernel/linux/patches/rt-0002-gpio-dwapb-Work-around-RT-full-s-enforced-IRQ-thread.patch

Just to note I wouldn't accept that patch as it is, because it's applied to all
types of IRQ handlers supported by the driver. The chained cascaded IRQ
handlers won't be converted to the kernel threads in RT-patched kernels [1], so
using the wa-lock is redundant in that case. One of the ways to fix it is
to have a conditional wa_lock acquisition depended on the irq_shared flag
state. Alternatively we could create a dedicated handlers for each types of
the IRQs.

[1] Documentation/driver-api/gpio/driver.rst

Regards,
-Sergey

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
