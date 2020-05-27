Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E06571E386A
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 07:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725681AbgE0Fnm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 01:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgE0Fnl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 01:43:41 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54AFFC061A0F
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 22:43:41 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id l15so27020334lje.9
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 22:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NFrUkSVljYa9ZMUWGxD6c3Z0B36die5V+uJnTtexsjQ=;
        b=k7CR6gbLN0yeaPyjgA1IsLZhrr0G/EJKGFjY/dsqI3TOsAqq5kEAOYYBlikFdKEoW0
         aD08GVV72oBElUJGFecwmP+rVw/YHnnrcQOEQSPPA4wIvmA0HjSmHqIKkd+DM/IC5J8q
         esuwXYZPrzPFl2whEzpWg21bGf7YTSDgJ+A8jv9po7Se2GBbpWgrHrW7cbfn+qBOYOff
         4YuC3fSC7728My87FNcVHy2m5Z5s7TKe1cxEe43Uklz3soKs+x9IMAwHyXpI42qpcjaD
         IvkxEx+sth2IkbSRobn6TBog1qaSh4qZCclYbKO07gF2XeNmcuCLWaO3AkcaTOTWdQPI
         T1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NFrUkSVljYa9ZMUWGxD6c3Z0B36die5V+uJnTtexsjQ=;
        b=q2+cfkoWdGHE1OVY3rVRqzfBIV0aTcYPE3U/eO5AIqBr3EGlCnbgxgLiJpOD659SwG
         ODq6xGch9IW99pC07O/eKudU+Fl1mCxCEXHXxzKHSMSQXJdTNbMg6V8Nw3OGPHjBWmzB
         /qrkozYH3x7vYBDRNARs14vS4xOPsP9DPKr7ny9FJGCGZzVkgh7ZOGAEUzbWO4jmcq3Y
         oMYzIoPxoY24q7sS9i29dZLo3Ft53MQFGyXFPArB2G8a1hkbo0237UcV1EeqL3dZKs1T
         08EAYYtMkjzrGWFop4wDMwm8VzijP65kLmWtLgREzmmz5QKtL90dk5ZTmTDtTMvxTD8U
         dkzQ==
X-Gm-Message-State: AOAM530R/7dsH0UBG4VVLhyeW9QfXJlX5kCtsiNmuQtptlXs2BsnvU7a
        NOf5Mi29oZBfubfWyKBK0NNQPCyTpaHgpwuJXaUheg==
X-Google-Smtp-Source: ABdhPJxKI3aQtT7hOkCyvmojgjhUCnwEi5ymiUyIC5WFkrxfIsILosJh61adWmSGCJ0mam+3T1Bzr5g7kGwiKwlXK5Q=
X-Received: by 2002:a2e:8703:: with SMTP id m3mr2297142lji.286.1590558219687;
 Tue, 26 May 2020 22:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200525190845.60959-1-andriy.shevchenko@linux.intel.com>
 <20200526053101.GD247495@lahna.fi.intel.com> <20200526131119.GQ1634618@smile.fi.intel.com>
In-Reply-To: <20200526131119.GQ1634618@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 May 2020 07:43:28 +0200
Message-ID: <CACRpkdYL5TPx1pN4XSY+sV6NdugGtpxTwaYo_jyq1Rx=tSAPPQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: pca953x: Override IRQ for one of the expanders
 on Galileo Gen 2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 26, 2020 at 3:11 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, May 26, 2020 at 08:31:01AM +0300, Mika Westerberg wrote:
> > On Mon, May 25, 2020 at 10:08:45PM +0300, Andy Shevchenko wrote:
>
> ...
>
> > > +   dev_info(dev, "Applying ACPI interrupt quirk (GPIO %d)\n", pin);
> > > +   return gpiod_to_irq(gpio_to_desc(pin));
> >
> > You need to request the GPIO as well, I missed that from my example.
>
> How? I can't find a function to request GPIO by its descriptor in
> include/linux/gpio/*.

If a gpiochip need to request one of its own GPIOs it should use
gpiochip_request_own_desc() but I don't know if you have all
info at hand to use that in this driver.

Yours,
Linus Walleij
