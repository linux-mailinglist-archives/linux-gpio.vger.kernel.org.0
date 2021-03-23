Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC5183455D5
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 04:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhCWC74 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 22:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbhCWC7k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 22:59:40 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 101D4C061574;
        Mon, 22 Mar 2021 19:59:40 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id cl21-20020a17090af695b02900c61ac0f0e9so442091pjb.1;
        Mon, 22 Mar 2021 19:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uMQUr5dXJZ2PUI/1EFUOUFrq7m+67408QTDKqlQG9mw=;
        b=pPd+g6Vg1ez+K7jsDPE0l7OQqgdMuxIIWcD5GsDzO+HzJ+QDCx6TXJTpy5CaqT6lD/
         +cTXaybbb0U+Fw4TY/ezI/hZRh8PW5g0jsU4OPbKniAwPNd0h54I5fJ5xRWm50T6yqaW
         ak3bZU+LQhbg3UxSgWFVU5LbKqEyggZz8ZgYJhHB0SCjyNq/adyomTtA1ZRtbpGgQw/6
         11eWloI9zjcMvSt72g8p6Pba7JLlGCBDvLqes6xkq1c93iJM/YJJhSWQzpnLuKZ/5r21
         uiUrHfADm5SuYx7yZwkXjHfw1J3hS7bMYV9NGm7+3MfKvGpZw435FBPgNM8ZcQX5KjXe
         WJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uMQUr5dXJZ2PUI/1EFUOUFrq7m+67408QTDKqlQG9mw=;
        b=gYy0lMvZ+zgdi2yO2tTo/OgF3u9gJ5EU3q03xZt4yDdXvQnziGKsesRBWulhXz98mI
         NIla7NOfPduD27EjQtWkTRf6XqooiFv/lV2k2WCx/lf8698I2l/72bbE70GuIHnWM60n
         s20fOAN+q9uRjWKQRplfpip5Ni9hSrzWPWovDf2j128EGDBi8mOs+N9D0jAuVA4L9pwa
         nFOt+rQFpe7W8AMmq1SMeT242rjjJ7j3rJtvsHfO4a58ZjRDXcLlGBO6lq6AQkZP248i
         bJJFt8w+wnSH548BeTsVwnQ1qk+nMMFNXJLQHola9FZIpucgqAHJBB5l76R/yYCiDVez
         XLEg==
X-Gm-Message-State: AOAM531T6tytHvbDFYXGZhVeBIYmV8vUTfKwKFittXd+L5UGb9Nad2kT
        77BpatZLs1pKYocDA4ZNu0s=
X-Google-Smtp-Source: ABdhPJx0KOTyp5fL1tDSydcezeQsJySAdi05NXolUiLAIIpBt048llAcVtuoDM1MWC/QLlP8cLESyQ==
X-Received: by 2002:a17:90a:f005:: with SMTP id bt5mr2194369pjb.127.1616468379579;
        Mon, 22 Mar 2021 19:59:39 -0700 (PDT)
Received: from sol (106-69-186-212.dyn.iinet.net.au. [106.69.186.212])
        by smtp.gmail.com with ESMTPSA id w17sm13766385pfu.29.2021.03.22.19.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 19:59:38 -0700 (PDT)
Date:   Tue, 23 Mar 2021 10:59:33 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Cochran <richardcochran@gmail.com>
Subject: Re: GTE - The hardware timestamping engine
Message-ID: <20210323025933.GA10669@sol>
References: <4c46726d-fa35-1a95-4295-bca37c8b6fe3@nvidia.com>
 <CACRpkdbmqww6UQ8CFYo=+bCtVYBJwjMxVixc4vS6D3B+dUHScw@mail.gmail.com>
 <20210322060047.GA226745@sol>
 <d48fa7b5-8c17-c3d7-10a9-a9811c410a39@nvidia.com>
 <20210323003208.GA6105@sol>
 <7961d9df-4120-e37c-d042-528655bd0270@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7961d9df-4120-e37c-d042-528655bd0270@nvidia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 22, 2021 at 06:53:10PM -0700, Dipen Patel wrote:
> 
> 
> On 3/22/21 5:32 PM, Kent Gibson wrote:
> > On Mon, Mar 22, 2021 at 01:21:46PM -0700, Dipen Patel wrote:
> >> Hi Linus and Kent,
> >>

[snip]

> > In response to all your comments above...
> > 
> > Firstly, I'm not suggesting that other kernel modules would use the
> > cdev lineevents, only that they would use the same mechanism that
> > gpiolib-cdev would use to timestamp the lineevents for userspace.
> > 
> Sure, I just wanted to mention the different scenarios and wanted to know
> how can we fit all those together. Having said that, shouldn't this serve
> an opportunity to extend the linevent framework to accommodate kernel
> drivers as a clients?
> 
> If we can't, then there is a risk of duplicating lineevent mechanism in all
> of those kernel drivers or at least in GTE framework/infrastructure as far
> as GPIO related GTE part is concerned.
>  

In-kernel the lineevents are just IRQs so anything needing a "lineevent"
can request the IRQ directly.  Or am I missing something?

> > As to that mechanism, my current thinking is that the approach of
> > associating GTE event FIFO entries with particular physical IRQ events is
> > problematic, as keeping the two in sync would be difficult, if not
> > impossible.
> >
> > A more robust approach is to ignore the physical IRQs and instead service
> > the GTE event FIFO, generating IRQs from those events in software -
> > essentially a pre-timestamped IRQ.  The IRQ framework could provide the
> > timestamping functionality, equivalent to line_event_timestamp(), for
> > the IRQ handler/thread and in this case provide the timestamp from the GTE
> > event.
> > 
> 
> I have not fully understood above two paragraphs (except about
> lineevent_event_timestamp related part).
> 
> I have no idea what it means to "ignore the physical IRQs and service the
> GTE event FIFO". Just like GPIO clients, there could be IRQ clients which
> want to monitor certain IRQ line, like ethernet driver wanted to retrieve
> timestamp for its IRQ line and so on.
> 

I mean that in the IRQ framework, rather than enabling the physical IRQ
line it would leave that masked and would instead enable the FIFO line to
service the FIFO, configure the GTE to generate the events for that
line, and then generate IRQs in response to the FIFO events.
That way the client requesting the IRQ is guaranteed to only receive an
IRQ that corresponds to a GTE FIFO event and the timestamp stored in the
IRQ framework would match.

And that is what I mean by this being an IRQ feature.
We need feedback from the IRQ guys as to whether that makes sense to
them.

Cheers,
Kent.

