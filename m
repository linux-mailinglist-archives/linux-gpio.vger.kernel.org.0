Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78F2F468B73
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Dec 2021 15:49:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234990AbhLEOw7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 5 Dec 2021 09:52:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234988AbhLEOw6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Dec 2021 09:52:58 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78744C061714
        for <linux-gpio@vger.kernel.org>; Sun,  5 Dec 2021 06:49:31 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id e3so32498400edu.4
        for <linux-gpio@vger.kernel.org>; Sun, 05 Dec 2021 06:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8KQxPquIcErxyBQU2nlR443aF18MSJtkLsamh4bqGF0=;
        b=e0xL6aQgdP9t2ANyEClIi886RouldMQzPA4AkZfkJQr8Z3aDV8APXgpb2bL3birsgF
         8kyoh0BE1FCT4FDE+TuDA7T/Ck/l8pjk04nLpmw3KjGZd4vEe2AoWAy+zNYZesTdsCTm
         3+Dr0F20ti90Wj6IjiduR4ZND8iCt7N+Yu+Cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8KQxPquIcErxyBQU2nlR443aF18MSJtkLsamh4bqGF0=;
        b=A3RKBYpKyHdlxivZ+NZ1m7szBTQflYZ2CSoGperHu6vN/O35KFQHO6nyWteN0QRyCR
         NF1an/kSxsLKSqLhmMNvZW7yxBCebQGEnwfXxb+DYC06zWl4Q7vVChZ+9iujtVPr0f0b
         x4nIxQ7xy/XJ/1V5hiCK2Jzmr3q6AkT8UeUyr0UdNjhTct0i61uw/yNPzXt9b5Xv+Qlb
         xJLI7KOBwEAsEpHFobge8IBhdnsLtwiaBTONpW0Tx/+9SV5HldhpvV3froghOyt7rgIz
         XSOgNgEl26g+GzEpH3w7AaOyemvpb6vW8dgeaWf7Gi+J893tdsqC71TYD3zNzUbZHT0H
         brEQ==
X-Gm-Message-State: AOAM532pJxJUzMinKbMLEELINK9hFcUS/mNBAjwM33Y5V3bLDhEPDqNN
        vtpisckenn4i9IFSAPAIqjLT+w==
X-Google-Smtp-Source: ABdhPJytV2kBmCcb6yOpjwom8T02jQfVg6utXYjrAKqvrDAyoOnDIaWtHtsVa/0OLhDrKWj0eu12Kg==
X-Received: by 2002:a17:907:6e0d:: with SMTP id sd13mr38903937ejc.90.1638715770099;
        Sun, 05 Dec 2021 06:49:30 -0800 (PST)
Received: from karbon.home.net (78-83-68-78.spectrumnet.bg. [78.83.68.78])
        by smtp.gmail.com with ESMTPSA id s2sm5706994ejn.96.2021.12.05.06.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 06:49:29 -0800 (PST)
Date:   Sun, 5 Dec 2021 16:49:28 +0200
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: gpiod_set_value(): BUG: sleeping function called from invalid
 context
Message-ID: <YazReHfrWDZbm6z9@karbon.home.net>
References: <a06e7c55-f25d-8339-faea-9be6d31d1c87@xs4all.nl>
 <CACRpkdYrZ2pyj+_yS6gn1n-TCQtHMqwrg+4eJRmiKGGyDNPnbQ@mail.gmail.com>
 <1ad23a2a-bd91-526c-ab75-25543c1f4dd5@xs4all.nl>
 <fabc35fb-f0ea-d4a5-e615-66a185e7b7c9@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fabc35fb-f0ea-d4a5-e615-66a185e7b7c9@xs4all.nl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21-12-05 12:59:46, Hans Verkuil wrote:
>

<snip>

> I'm not sure if the pctldev->mutex can be replaced with rcu, I suspect not.

Not in this case. :)

> For something that's supposed to be atomic, there seem to be an awful lot of 
> mutexes...

By looking at the generic gpiolib code, it seems that none of these are supposed 
to be called from atomic context.

> In the case of the bcm2711 the bcm2835_gpio_direction_output() function calls
> pinctrl_gpio_direction_output, which in turn (via pinctrl_gpio_direction()
> and pinmux_gpio_direction()) calls bcm2835_pmx_gpio_set_direction().

Is the aforementioned code mainlined or is it in some other git tree?  I'd like 
to take a quick look.

> It appears to me that bcm2835_gpio_direction_output() can call
> bcm2835_pmx_gpio_set_direction() directly, thus avoiding all the mutexes.
> That's exactly what samsung/pinctrl-samsung.c and qcom/pinctrl-msm.c do,
> from what I can tell.
> 
> Are pinctrl drivers supposed to call pinctrl_gpio_direction_output() from the 
> direction_output() op? Isn't that perhaps the bug?

If direction_output() is supposed to be called from atomic context, then that's 
where the bug is.  Again, i am not familiar with this particular subsystem, but 
these are pretty basic kernel concepts people must pay attention to.  You should 
perhaps focus on Broadcom's code rather than pinctrl's.


		Petko
