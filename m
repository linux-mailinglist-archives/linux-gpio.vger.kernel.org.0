Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5E7E4A4662
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Jan 2022 12:55:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359726AbiAaLzy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Jan 2022 06:55:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378856AbiAaLwq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jan 2022 06:52:46 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D2FC0797A6
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jan 2022 03:39:43 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id a19so6673740pfx.4
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jan 2022 03:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aJl03y4sj7I4fLBHMYSkPGgkmbwZzIw68Hv1wix3JkY=;
        b=P3ZgP+CtMnay7/0V5ddaLgFVVlZYY6B2a6ooBiHoxOEatDz9qtYDQ9SFiMCFPAhe/Z
         TlXWJuMnXNqB7OevqmpLxrNVZ87gAIszPX3v4YTKLF+Ct4bnjApvxmiG1Xq6aQsEyDxg
         WEO5ykZdaLL38GZatTXTxK23pkphsidB7gY+Juq25Pr51B+EqX1WFIJdk1P0S911Z2mU
         4eRvC9C8wDoCVkLoEXgynXK7xD4rHOfv9BmIkPV/m9p2QTaSEkBVrxh/LFX2hNpOGR0L
         4mFAdiqROwyavWrrXL14Kk1aYcM6XTcFBs29I8mQNAvo8TVv2FHzdgC2/unk1IN8whM/
         Hmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aJl03y4sj7I4fLBHMYSkPGgkmbwZzIw68Hv1wix3JkY=;
        b=vQq3rJrvOpLrzCf8Oda/mfjJPGhanh1ikFh+bFRzXg/SjUn0DsSaMOFSqgJSqtSKlU
         aap0Q+YZJ5sDeSM7MyIzalOtUbuRlp/Lto2yG1MTscxDN2V/sxRYBUS46YqfYQ40Q1DT
         pYmrbsT02ltyGKcYqZYBmcC93LA6lM/dXDmXeEJlFa7Q6sj0W5daCFAWbswtYBKy0/Is
         lXwiilWYLaPNhTGGtDzH5gfW8AeOGpn06A0p+XueV0AjJUVlAEWk86Kpi6rzOPsFBzeK
         MPsTpAQBreECyziPJ+1FWNgs7f+PdAAgLpJEGQ/KUBjBsdt6pW0E/MJFGPHhYe+UXKZx
         JY5w==
X-Gm-Message-State: AOAM531VDrcCnwXJfPJ3vwZr1SxQFtVRQX//6z1hZGCV7oMhYsenKjtp
        Zndmba/Vrf/VnCXFGAb8PX1DUYSXW3jJFw==
X-Google-Smtp-Source: ABdhPJwL/3S0oo6E9Zw10OJ8LGZObkmcsGuR3KmQIovrMvIFDuBucv8QTcbyCi3Pp4s2iZqvaFFubQ==
X-Received: by 2002:a63:1665:: with SMTP id 37mr16511425pgw.253.1643629182240;
        Mon, 31 Jan 2022 03:39:42 -0800 (PST)
Received: from sol (123-243-144-88.static.tpgi.com.au. [123.243.144.88])
        by smtp.gmail.com with ESMTPSA id q9sm11129502pjm.20.2022.01.31.03.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 03:39:41 -0800 (PST)
Date:   Mon, 31 Jan 2022 19:39:37 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Gasai Maple <gasaimaple@gmail.com>, linux-gpio@vger.kernel.org,
        brgl@bgdev.pl
Subject: Re: A problem with gpios on my sunxi board.
Message-ID: <20220131113937.GA54861@sol>
References: <CAA=7Zrk43M3Q_cRnRwoJyyBk-C-3ACqvLg6toMou6eobsua7Uw@mail.gmail.com>
 <20220131005924.GA11753@sol>
 <YffHbHRJLlF/kJ8F@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YffHbHRJLlF/kJ8F@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 31, 2022 at 01:26:36PM +0200, Andy Shevchenko wrote:
> On Mon, Jan 31, 2022 at 08:59:24AM +0800, Kent Gibson wrote:
> > On Fri, Jan 28, 2022 at 10:12:13PM +0800, Gasai Maple wrote:
> > > I posted a question on stackoverflow, it's basically about me having
> > > problems operating gpio with libgpiod, and a user advised me to drop a
> > > message, the link is here
> > > https://stackoverflow.com/questions/70863283/libgpiod-tests-fails-on-pcduino3-nano
> > 
> > It would be helpful to restate your question rather than providing the
> > link.  But anyway...
> > 
> > My best guess is that your kernel is built with only v2 of the GPIO CDEV ABI.
> > libgpiod support for v2 is a WIP, and 1.6.3 only supports ABI v1.
> > The CHIP_INFO ioctl is common to both, so will still work.
> > But all the line request ioctls changed so they wont.
> > So libgpiod is probably making ioctl calls that your kernel doesn't
> > support.
> 
> If this the case, can we add some warning to libgpiod tools to tell user that
> the results may be way wrong because of that?
> 

Turns out not to be the case here, but the results wont be "way wrong"
- the ioctl call will just fail as it doesn't exist in the kernel.
Unfortunately that returns a generic EINVAL that can't be distinquished
from other causes of the same error.

Cheers,
Kent.
