Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3EA578267
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 01:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfG1XiN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jul 2019 19:38:13 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40881 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbfG1XiM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Jul 2019 19:38:12 -0400
Received: by mail-lf1-f66.google.com with SMTP id b17so40756933lff.7
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jul 2019 16:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A2YoLjOmjoi0MvPq3QD0hmADDj+Ydfv3BHipfJHYsV4=;
        b=XlhkQmH67dhcBDB/Xr7JvFPOG2VU81DTdMdboPT/HeIYWgB9tdya4Qu7sHgU0WMkaM
         vLenZczcXQneLoQwwIMosVAUQ7eROBagrCowwDdHynkzWR6TG6G/348pyMvV2ko15fAX
         J6eOaYIHqHdN2UumITKAxV05/2xTZbsY0nfOHx2zKefVEAWZk/V94esJyXg+dV04m9ZC
         3T6esDVVvsV2RDBV0sLFBEN22b9i5xaNaCrAxueDIdJQotuNWYkqh9CJdvvAgneQ8VYO
         PxSF+7xqWZhasZ+4KJQhOOybJ6f/GiXAs/huwwXy1rfoOxGb0FkKxX89PQJ4JjNcb5+Z
         0kRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A2YoLjOmjoi0MvPq3QD0hmADDj+Ydfv3BHipfJHYsV4=;
        b=ZA045URUpayiyiHw02NC78YGHixhABTnMPbP0bd1WH8Du1eOAn+SlCYcb+99fBq9nW
         4yYT9BmFJqNgAgnzmYxSu1LniTI6rcGHwoDBYE8u2f1z7xgJYG8ciWZNwxtdyYNut6YO
         fCX+sf7iVbsT2Uv1g6Wrz6an3H2obB++nv7HMNls6qs2txmLMDgkjY9V8FTBevYP1+jF
         hNZyBmhEPeufIHn+gEiM20Sv319l4KTCyrC/zlydcYBxXLpmvFt+q19MC4oPNYSvHbnw
         vG9P0Vk5YRLRX98PyWJGJlY+EDOZyqChw3Jf5O3tyq3BmZUwnpgmozGVwEK9jdGFO14f
         kNDA==
X-Gm-Message-State: APjAAAV6RbVGH2tM80S6iQYF8XKYF7RlTGTw1PXGu4P+2Ntk+DNExDWB
        UiUsyD7qZdmgn9GzjdHo8CJT7cFQTqG3NbegLhbeOw==
X-Google-Smtp-Source: APXvYqzNLF2GKPsxU0k1Fl9UXDm3yiIIWBYWeFyjCRu2eWqJIj+FDChdYuoS6Cmi6P1mJrVQoHtEsToFX8UBgZc9YJM=
X-Received: by 2002:a19:dc0d:: with SMTP id t13mr45895639lfg.152.1564357090803;
 Sun, 28 Jul 2019 16:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <1563564291-9692-3-git-send-email-hongweiz@ami.com> <1563827815-15092-1-git-send-email-hongweiz@ami.com>
In-Reply-To: <1563827815-15092-1-git-send-email-hongweiz@ami.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 01:37:33 +0200
Message-ID: <CACRpkdbkLj7WDMp7vtNDR81yezw-zPq3MWvVRLKvpkvAueo0uw@mail.gmail.com>
Subject: Re: [v5 2/2] gpio: aspeed: Add SGPIO driver
To:     Hongwei Zhang <hongweiz@ami.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 22, 2019 at 10:37 PM Hongwei Zhang <hongweiz@ami.com> wrote:

> As you suspected it correctly, AST2500 utilizes all the 32 bits of the registers
> (data value, interrupt, etc...), such that using 8-bit bands
> [7:0]/[15:8]/23:16]/[31:24] of GPIO_200H for SGPIO_A/B/C/D .
> so registering 10 gpiochip drivers separately will make code more
> complicated, for example gpio_200 register (data_value reg) has to be
> shared by 4 gpiochip instances, and the same is true for gpio204 (interrupt reg),
> and other more registers.
> So we would prefer to keeping current implementation.

OK this is a pretty good argument. My review assumed one
32-bit register was not shared between banks but it is,
I see.

The above situation can be managed by regmap, but that will
just a different complexity so go with this approach then.

Yours,
Linus Walleij
