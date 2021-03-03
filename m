Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F49E32BB49
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 22:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236612AbhCCMVJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 07:21:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1842957AbhCCKXA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 05:23:00 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6B7DC08EB29
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 01:43:07 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id 201so15888653pfw.5
        for <linux-gpio@vger.kernel.org>; Wed, 03 Mar 2021 01:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=E0xJWVVymi2A4Wscn2G7JGX8bUyRn3nl/iNfULTK9i0=;
        b=OKe7eovNcAxbwQdgERFVZGUvoWOH6FiCp2ormgVl4hEwuefjaAD6NcgDxdmk8GjorN
         XoLl3f7x/Yff1PiTrE8WpA/nj1NGD02HOAjLf2KGpLEMLSrfDM65I3hh/VFAGtLJxGij
         z2LU4K1WOmE2jK7AADBWNcyDQN1cLn/jSWNHbQsY/Y983Ru0ZJMUYm+vadbr5JvcvPLz
         GuS4PnCUuJaHrRvXpM2Qkmz/+2phUzpkXjK2/7rt87a2Jb5BEuEit/b20OrYkFAgFgJk
         MNN/Ib/5gSbt+GvFRhg0vYEKIt7NFr++1+3vBqMbW2hJGhbLD5ZOhzCk3is6evct6/8q
         /DBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E0xJWVVymi2A4Wscn2G7JGX8bUyRn3nl/iNfULTK9i0=;
        b=F2bFilp+6Z7Mg8UHsMNP13mYiPtjwR28QMeMboHgS3RiWYNjFnna8dKXly1+IL8tHA
         kF5gCa91jgQsEmcRjL0DS4isHm5mRm5Js+LldFpLg51UpHyKmQAg1h8iCb7xL1jQjnvK
         q03dxR7HUIiHXP4MfJjdtaMJxfzzbIXJO9BL+/8NsVl0103g+BnMb78wel0vsnYcjbKV
         4AW8EvXAx66pNrltFI9HPaDRgQb1X7va5gP7u4hsmm3TZ6XWbMHn3L7JLQcdqCjh8WNJ
         v9nQCPokVIWunJmPArOVYHrcErdQuJZKHdoAp5KZ6sajB/rpcAW66qPcEwC0MerEiH/R
         Nn7w==
X-Gm-Message-State: AOAM533tMObz4Kup3grY7hcgfRn+vG6UDMUhsOUHfRA36rCMvByBl6vH
        pMohSxCF4FlLEIZoOpVb7yN6aQ==
X-Google-Smtp-Source: ABdhPJz3L7dDPpmzP7GmF8t8p6rNyRWGV9BCnopbWYgDdy7lvI6tS20b4TAYxiDu7uDYFRRye4fPkA==
X-Received: by 2002:a62:2a4c:0:b029:1ee:1854:1f22 with SMTP id q73-20020a622a4c0000b02901ee18541f22mr7285553pfq.25.1614764587340;
        Wed, 03 Mar 2021 01:43:07 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 138sm1585199pfv.192.2021.03.03.01.43.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 01:43:06 -0800 (PST)
Date:   Wed, 3 Mar 2021 17:43:01 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] gpiolib: acpi: support override broken GPIO number in
 ACPI table
Message-ID: <20210303094300.GB17424@dragon>
References: <20210226033919.8871-1-shawn.guo@linaro.org>
 <CAHp75Vcb=NO9OWjSpBeVC4c+9=aXE=yiDWVBwLD1DnzwdgFD6Q@mail.gmail.com>
 <20210226093925.GA24428@dragon>
 <CAHp75Vc6xYv+197SOrSefQHD2h4Xy_N20gQajW4uF2PU=sJfLg@mail.gmail.com>
 <YDjZOU+VMWasjzUb@smile.fi.intel.com>
 <20210227031944.GB24428@dragon>
 <YDzbQqHspfvpYS7Z@smile.fi.intel.com>
 <20210302002725.GE24428@dragon>
 <YD4twyAGvDDOCv+n@smile.fi.intel.com>
 <abbfcdfa-c287-3828-ed6f-bc1e1f13c6b2@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abbfcdfa-c287-3828-ed6f-bc1e1f13c6b2@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 02, 2021 at 10:02:49PM -0700, Jeffrey Hugo wrote:
> Sorry, just joining the thread now.  Hopefully I'm addressing everything
> targeted at me.
> 
> I used to do kernel work on MSMs, then kernel work on server CPUs, but now I
> do kernel work on AI accelerators.  Never was on the firmware team, but I
> have a lot of contacts in those areas.  On my own time, I support Linux on
> the Qualcomm laptops.
> 
> Its not MS that needs to fix things (although there is plenty of things I
> could point to that MS could fix), its the Qualcomm Windows FW folks.  They
> have told me a while ago they were planning on fixing this issue on some
> future chipset, but apparently that hasn't happened yet.  Sadly, once these
> laptops ship, they are in a frozen maintenance mode.
> 
> In my opinion, MS has allowed Qualcomm to get away with doing bad things in
> ACPI on the Qualcomm laptops.  The ACPI is not a true hardware description
> that is OS agnostic as it should be, and probably violates the spec in many
> ways.  Instead, the ACPI is written against the Windows drivers, and has a
> lot of OS driver crap pushed into it.
> 
> The GPIO description is one such thing.
> 
> As I understand it, any particular SoC will have a number of GPIOs supported
> by the TLMM.  0 - N.  Linux understands this.  However, in the ACPI of the
> Qualcomm Windows laptops, you will likely find atleast one GPIO number which
> exceeds this N.  These are "virtual" GPIOs, and are a construct of the
> Windows Qualcomm TLMM driver and how it interfaces with the frameworks
> within Windows.
> 
> Some GPIO lines can be configured as wakeup sources by routing them to a
> specific hardware block in the SoC (which block it is varies from SoC to
> SoC).  Windows has a specific weird way of handling this which requires a
> unique "GPIO chip" to handle.  GPIO chips in Windows contain 32 GPIOs, so
> for each wakeup GPIO, the TLMM driver creates a GPIO chip (essentially
> creating 32 GPIOs), and assigns the added GPIOs numbers which exceed N.  The
> TLMM driver has an internal mapping of which virtual GPIO number corresponds
> to which real GPIO.
> 
> So, ACPI says that some peripheral has GPIO N+X, which is not a real GPIO.
> That peripheral goes and requests that GPIO, which gets routed to the TLMM
> driver, and the TLMM driver translates that number to the real GPIO, and
> provides the reference back to the peripheral, while also setting up the
> special wakeup hardware.
> 
> So, N+1 is the first supported wakup GPIO, N+1+32 is the next one, then
> N+1+32+32, and so on.

Jeffrey,

Thanks so much for these great information!

May I ask a bit more about how the virtual number N+1+32*n maps back to
the real number (R)?  For example of touchpad GPIO on Flex 5G, I think
we have:

  N+1+32*n = 0x0280
  N = 191
  R = 24

If my math not bad, n = 14.  How does 14 map to 24?

Shawn
