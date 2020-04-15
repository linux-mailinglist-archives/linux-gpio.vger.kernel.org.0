Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0978C1A98BF
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 11:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895446AbgDOJYX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 05:24:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2895440AbgDOJYT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 05:24:19 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44409C061A0C
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 02:24:19 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id x25so16560555wmc.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 02:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=25hsR70J4xkR7QjWib9TX4C/RIJl6X5HgsLKdDMfcIM=;
        b=MZISFk0+SGdYrIGleUjYyNyFlKlBZtpvcsFKyJMVxKBrgMGYtPYkcBrS4bRdkEp/7t
         IW0OdNkkEzJjOHq32c8nyyFfVBOA0CWrvJjsIloNh7+9VO5CUroLlbNB3EdfC+VubzHW
         RKiPdet4ElIC56WiuMenvtixe2coFc0mPjdD569+2OT9S+0GbYhuHmAMDdAJ2/wquaHH
         afuwBSmcYlb9MymeQAxl6jMcXisGmnphb0nXiXzgHpPoKvx7ynmkS1jh5aDHDA3xUcag
         t1mwgvkRTAPwn/Ml63NOIpJfKAurHTPzOMenfettsfMf8meyF+86UE6hMxa9KMhNgPe7
         /dqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=25hsR70J4xkR7QjWib9TX4C/RIJl6X5HgsLKdDMfcIM=;
        b=hrIYHyJkXlp7MrZBPFk2Q1cDEzEWZRa1ay284usf6xJz/m6a83INPn0j7r2AvBNVuq
         Ib2ZUgkbPZblYv6ACxotuiBtLEBOgDfKiVj1ERbf2zUMaCUUhUl4LYvW8ZY786JKIH89
         ubY4VDuYCMvfmQiztPtJMOrPOqSWni+qSVk7Z6cYB0RUUMLbIjAqCyoRlLsP0jGJNvYP
         k9rXTGbyhnfQ7QLPnwWVSQWGHzMMtULoAZr2j0+q82pAjKcD7mJu0w3cCmY90z/izXfw
         uNjP7a/QEFEvZgdy8AmsHVOecWzy79+rMkq53qXQ6M0pm/WwT2xM0ita4ZEUIlYZbc+J
         04sg==
X-Gm-Message-State: AGi0Pubt7eAMBjXA2GiuMSoZhUahvZpcx2DW56M4jYqj3tEsW/B/A2K9
        nSxVnvRVLNDmqo3QcAkm/zgRzA==
X-Google-Smtp-Source: APiQypI1L9Xj03pMeY/s2kTnKETE0bYjImrIZAgEBCHLd+qOzGsuktY5U9KyEtfeFWAbhU8Q4g0UeA==
X-Received: by 2002:a7b:c10d:: with SMTP id w13mr4131241wmi.78.1586942657950;
        Wed, 15 Apr 2020 02:24:17 -0700 (PDT)
Received: from dell ([95.149.164.124])
        by smtp.gmail.com with ESMTPSA id e1sm12258399wrc.12.2020.04.15.02.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 02:24:17 -0700 (PDT)
Date:   Wed, 15 Apr 2020 10:25:17 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        qemu-devel@nongnu.org
Subject: Re: [PATCH v6 3/8] mfd: sm501: Use GPIO_LOOKUP_IDX() helper macro
Message-ID: <20200415092517.GF2167633@dell>
References: <20200324135328.5796-1-geert+renesas@glider.be>
 <20200324135653.6676-1-geert+renesas@glider.be>
 <20200324135653.6676-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200324135653.6676-3-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 24 Mar 2020, Geert Uytterhoeven wrote:

> i801_add_mux() fills in the GPIO lookup table by manually populating an
> array of gpiod_lookup structures.  Use the existing GPIO_LOOKUP_IDX()
> helper macro instead, to relax a dependency on the gpiod_lookup
> structure's member names.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
> While this patch is a dependency for "[PATCH v6 4/8] gpiolib: Add
> support for GPIO lookup by line name", it can be applied independently.
> But an Acked-by would be nice, too.
> 
> Cover letter and full series at
> https://lore.kernel.org/r/20200324135328.5796-1-geert+renesas@glider.be/
> 
> v6:
>   - New.
> ---
>  drivers/mfd/sm501.c | 24 ++++++++----------------
>  1 file changed, 8 insertions(+), 16 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
