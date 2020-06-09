Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 166391F2C64
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 02:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731019AbgFIAX4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 20:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730513AbgFIAXy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2020 20:23:54 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E064C03E969;
        Mon,  8 Jun 2020 17:23:54 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ga6so577905pjb.1;
        Mon, 08 Jun 2020 17:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ul3C2ynzc7BlycjIPw2bQXJZLzMcXQ8t1H1WnEcp/Pg=;
        b=pQeXUNELeG0+AqLfVUjksVW1sEmwS1UMA65+DHHb171Qq8I41wV6g7S91Z2e9POuht
         DsjlmMCPitArkD3j4FBVX5Dbpq3QuJYPfUw7csuTgj/9KxcKrBO6t2tCohPtpW6l4u4E
         y/8AdNTHnnOJF2tyaa5qj4aytcthjdbFs+f8wu5jVuposaRfji9j0dvLHYoDN8kWwRj8
         m0U9RWIEBKd3R+sjBOoGUPsY9Sp48ihNUYEiI4XMkoUvnNaU0C3OhN2V4D87WTQCDm9s
         EvhJ3yCJSk98zYrmyIOQwUGI6CfZk4pOy3C31PylYUtxPD+p3mfJZL4SY50dsyoKyV3R
         /1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ul3C2ynzc7BlycjIPw2bQXJZLzMcXQ8t1H1WnEcp/Pg=;
        b=ZhP5tsS0XfdzAKUhNuMdhH6NnmlzQnmdsw8cypatg/pnDGGpaLLRgZBluFVgiI0V8T
         Z0iAGtFH2ZlyNlCN7nJwWAxeNT03aSxe2YfbmPjF2AsKrbnr8iePuPHRmRMj+k3bdJRJ
         7PNylm9a5ttUZZ9l6AL/4k6gDT5RuFdSyum2+PBt1RybFJc2xbrEev6JFa02jOWjEHyV
         P7n6v4LJjAWiWT6tUD23P2yZ9QfwDzu8xiJU0UwFcZ/22InUObnKy6HfFmhxty+OBZCy
         Nx1jJS3yGj+z7Btv7+ZGdOjlC0MZOTlJdrWtdwv7z+Ux+r1ee5XMDhYKLPmobiZt5Ww0
         TJYg==
X-Gm-Message-State: AOAM531noxESkxAM6eXG4a/Pn5ok1OjIq+QFQarhUd/kr81fXX7F+Dv2
        uPbcy4CE/tsmF1VfHdkV5qc=
X-Google-Smtp-Source: ABdhPJyonqW97chkteloFa/9u16s5FjdS9VoYBohMHfpQBVjEYM2aGCu1mVou8Ix0APuCp1PRVWKMQ==
X-Received: by 2002:a17:902:bd0a:: with SMTP id p10mr1081713pls.102.1591662233656;
        Mon, 08 Jun 2020 17:23:53 -0700 (PDT)
Received: from sol (220-235-66-207.dyn.iinet.net.au. [220.235.66.207])
        by smtp.gmail.com with ESMTPSA id x190sm6948164pgb.79.2020.06.08.17.23.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 17:23:52 -0700 (PDT)
Date:   Tue, 9 Jun 2020 08:23:46 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 12/13] gpiolib: add new ioctl() for monitoring changes
 in line info
Message-ID: <20200609002346.GA6042@sol>
References: <20191224120709.18247-1-brgl@bgdev.pl>
 <20191224120709.18247-13-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191224120709.18247-13-brgl@bgdev.pl>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 24, 2019 at 01:07:08PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 

[snip!]

> +static int lineinfo_changed_notify(struct notifier_block *nb,
> +				   unsigned long action, void *data)
> +{
> +	struct gpio_chardev_data *priv = to_gpio_chardev_data(nb);
> +	struct gpioline_info_changed chg;
> +	struct gpio_desc *desc = data;
> +	int ret;
> +
> +	if (!test_bit(desc_to_gpio(desc), priv->watched_lines))
> +		return NOTIFY_DONE;
> +
> +	memset(&chg, 0, sizeof(chg));
> +	chg.info.line_offset = gpio_chip_hwgpio(desc);
> +	chg.event_type = action;
> +	chg.timestamp = ktime_get_real_ns();
> +	gpio_desc_to_lineinfo(desc, &chg.info);
> +

Is this call legal?  It can sleep - in fact you recently changed that
very function to move a mutex call outside of a spinlock protected section.
Here it is being called within an RCU lock, as lineinfo_changed_notify
is at the end of an atomic_notifier_call_chain.

I was looking at adding a chg.seqno here and considering what level of
locking would be appropriate for the source counter when I noticed that
call. Hopefully I'm missing something.

Cheers,
Kent.

