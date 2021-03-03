Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94CFA32BB55
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 22:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348571AbhCCMWG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 07:22:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1843075AbhCCKZT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 05:25:19 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3BA1C0611BE
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 00:45:16 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id d13-20020a17090abf8db02900c0590648b1so2556787pjs.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Mar 2021 00:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iSIb0xgaCgC+aCcwfRzO1TQQvKt5CzxSqRNrFTdkvfQ=;
        b=huJnKgSZDMoWitgZnQc7pXqwd7FRofIR7KDj6HnGtfcYMEb+ozQD5VbFRDxJclNv1s
         e68bkT1XyTvYs6hTdfetK9agvV5yY5T+HSYwXD0oVRaUglKEAWyq/t1FlbFxwlzGTWG9
         xmh+OFL0qoIYhUMx/VvsqRU4MRPZBCjmxfI5WspLnANXTosXcIxJbfP2YaGRkXLhh8SU
         oi/MoZgAKiwIbpH4REM70KfLMTo1SmKPPoSOGZ/2R5qvq2K8wEFavyVVxQRT358qI9k1
         Bo8BnuyIhKGS9XsizWOqF00Wi8cMNR9k5ryyfXOJzlV03vzPmpkUDn0SwS2R3A6sifZc
         SgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iSIb0xgaCgC+aCcwfRzO1TQQvKt5CzxSqRNrFTdkvfQ=;
        b=YFPBmnjcfIycI/xbwCbbPpCPqvAzsQbQ4QbD9t3MM3bdIeFDeqx9EZwwnPBjjfUqgr
         KL6eVrcafIbYaSKKBnAW6mju//ToedvskPP7P/qFnqbWWJbLZryx/F2GrakoDGHJmHyY
         QS3oiiJbn4+4KatAFf3kMgRpDo9Zrmmm00CbMl59Xk5UD3r9iLGZ7mk6/OvfqJ87US4+
         pwwbdg+h25OI0dOvnEp4nudiIHVUiAf73mDDS1giqE9LO0I4CKxKy5wtzqbuaNZH7r+P
         rGzPXVY5NVFW5a0TX8bdgFjxQrvZ1fhz3CJ5dOig3eyrgsrtOPfL3lFu+pRXw4YIyWZ9
         ZxMg==
X-Gm-Message-State: AOAM533vlKyxGTL5S4B0pwWa37wcDDqM630Ukcp/dW0alU6lXUgI9z9l
        iHMZXn5bdMD65YaT0BxdKB6TNuoKXu8ulA==
X-Google-Smtp-Source: ABdhPJxNDp9Ua4ii/mm6SqQgm1n6fnSN3b0KMoyfdZEGT5y6O3miiV+hJpRnr2HSGnoNeI/c+CrD8A==
X-Received: by 2002:a17:90a:d516:: with SMTP id t22mr8782767pju.51.1614761116299;
        Wed, 03 Mar 2021 00:45:16 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id w207sm22324837pff.62.2021.03.03.00.45.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 00:45:15 -0800 (PST)
Date:   Wed, 3 Mar 2021 16:45:09 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] gpiolib: acpi: support override broken GPIO number in
 ACPI table
Message-ID: <20210303084508.GA17424@dragon>
References: <CAHp75Vcb=NO9OWjSpBeVC4c+9=aXE=yiDWVBwLD1DnzwdgFD6Q@mail.gmail.com>
 <20210226093925.GA24428@dragon>
 <CAHp75Vc6xYv+197SOrSefQHD2h4Xy_N20gQajW4uF2PU=sJfLg@mail.gmail.com>
 <YDjZOU+VMWasjzUb@smile.fi.intel.com>
 <20210227031944.GB24428@dragon>
 <YDzbQqHspfvpYS7Z@smile.fi.intel.com>
 <20210302002725.GE24428@dragon>
 <YD4twyAGvDDOCv+n@smile.fi.intel.com>
 <abbfcdfa-c287-3828-ed6f-bc1e1f13c6b2@codeaurora.org>
 <YD9DnWC4ht7AYjb/@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YD9DnWC4ht7AYjb/@smile.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 03, 2021 at 10:06:53AM +0200, Andy Shevchenko wrote:
> Since the mapping of those wake IRQs is totally platform specific, it needs a
> platform driver. On above mentioned x86 platforms we have a one you may take as
> an example (good or bad it's another story):
> drivers/platform/x86/intel_int0002_vgpio.c.
> 
> I think you will need something like this somewhere in ARM platform
> infrastructure in the Linux kernel.

Well, you have the Virtual GPIO controller defined in ACPI as device
"INT0002", but we do not have such a thing.  I'm not sure it makes much
sense to create a baseless driver.

> 
> That said, I don't see that those numbers are "broken", they have their own
> meaning and specific mapping to the real GPIOs and it's so platform specific,
> that we can't treat it as a quirk.

Those numbers have their own meaning only for Windows.  It's OS specific
rather than platform specific.  Snapdragon platform manual has explicit
numbering of every single GPIO pin.  Those broken numbers in ACPI table
violate the hardware specification and are *broken* to Linux which
implements GPIO driver properly.

Shawn
