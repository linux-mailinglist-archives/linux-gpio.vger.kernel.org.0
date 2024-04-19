Return-Path: <linux-gpio+bounces-5699-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0771A8AB66F
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Apr 2024 23:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A758B21F88
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Apr 2024 21:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D757E137779;
	Fri, 19 Apr 2024 21:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Il34BblI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33628111A5
	for <linux-gpio@vger.kernel.org>; Fri, 19 Apr 2024 21:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713562169; cv=none; b=PI2KzTzc1WQqzpJL6qkTCDVT3faD9yJ3Ff0LD7CYk2my3iAE7Hvc6gOFkXJwfIggEFnQOw94ki7JQt++cg62Q70HbOLIovBaw6ynejkOwnImBwit4+Vcm19sIV1z/woYTGbjViGvMI8cd4iQzvSH33NOBN6QazdJnih065WdWoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713562169; c=relaxed/simple;
	bh=2GysBCBET65HJHpPRbD59HZPSuc6WYob58y8/gPNikI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p33EASULL+D5vyFLQhk3zQPSaXlM2EoytNSICBYrOLDXsu/gMUdK5qObRZLvjV7yGY8OjIPppzUkUu8PH67vfQ2U98VyEAAzwxrPnYLJGWT1Qrf3bAFUyzq/W1wyxnmvCkhzAskyEUhpbIM8ljrn5H4I2AzMnKgQ/4B86RWqgC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Il34BblI; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-de46da8ced2so2339199276.0
        for <linux-gpio@vger.kernel.org>; Fri, 19 Apr 2024 14:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713562167; x=1714166967; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IIpOYqRh88R0i8LNHu4obmBeVHXo+nptZ2aPcWVTDA4=;
        b=Il34BblIAlN9mkQWFsF4xuAFQ9o70L3F/AfqIdT6G4+COQ4nWSvD4MPPMilKZumz66
         AMNgTDK13/+gv2Tx3DjyqQkRNchFCfEMyf/gtFLBg2BpmyyaOOl5z+ZqPgbvIJ4ur2x8
         614F6AI9GAKdn4MX1bEzHbOZOEuV+aaJSvhvz3be4rxUA94jXe+cIr+sOIKJDoBjmUxJ
         pMY2h2YWaadbZNYdUgsXZF3yy3PqH9A2fQzJ20D679rSFtGIAiDE4CtZWkIJrs/6tpru
         ovDhJh9iRtZNQ8bbH9JoZBQWSZB2/H7h+73FDa3ChxYRt2DR4K3mMfXdMroo50hfyIUQ
         a66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713562167; x=1714166967;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIpOYqRh88R0i8LNHu4obmBeVHXo+nptZ2aPcWVTDA4=;
        b=LxrbkcnlNVg9amJJ8YoEFXKTxlSjhKwBBKvh9XJnBYAwGMugdY72JWQP3brc5vZsjL
         0uQLvyEQzN7S8MB2sA2Tz++xf4ADtZwZyn5MUFGs6ynhv5i1lCDicGdEueClQpVs5nvq
         pN8ObbCjFTTId9FdP+XBHVsbSFtsE1jyzb2CSRgDbZregKhEebWe5VKAS3pL+0KMRodC
         s9ZgJ6+jbuMCn61ipo89Votbb3cFaqlZMpX4Njibn2CtbwL//nd4YRub5zYcuv5zZN5D
         khipW5CnEO7jOmY7sXn8XAB96VGd0cUQKOMNjTRoB1DyxgNg/O2PavOaZNCQ+Xou0Q0b
         RFvg==
X-Forwarded-Encrypted: i=1; AJvYcCXPrWhLo7evmSmKbntu/ccsjm4ufJlk9G34Ko7YPc+kw1H7lp5d4Hhoeav/MmNsTv8eLppSvYrwDR3gywNoboCnZf31mV4KPMLgAg==
X-Gm-Message-State: AOJu0YzfRPebtQ4USJWnwmKG+YhP93l7nsr9xKk7oxKNc/0+hZ9u+1p3
	SID0NoalsxdZpAfcCoD4Ob+dZNrCoWdkW6qwoK07yHBJRDDKUs6uNmXYerf/QdC0j9SW0mU2uhg
	6U/cOQLQZJ41Q7rRDYU4rOvMMikQ1VLE2cuUOUg==
X-Google-Smtp-Source: AGHT+IFq6P5+bwPZWKT2aKGN9XWl5zccC4LReC5Jg0mx18NS/M+8Z3JsMrOAqUuEy0c78dMpwxt2/HmMqmBo1470aWc=
X-Received: by 2002:a25:83ca:0:b0:ddd:6964:40c with SMTP id
 v10-20020a2583ca000000b00ddd6964040cmr3061330ybm.50.1713562167179; Fri, 19
 Apr 2024 14:29:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <02a101da9227$bda04cb0$38e0e610$@trustnetic.com>
In-Reply-To: <02a101da9227$bda04cb0$38e0e610$@trustnetic.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Fri, 19 Apr 2024 23:29:16 +0200
Message-ID: <CACMJSeuGu4nCVsbSnTrJwEdU+RF0BKHbzS7A9Cf2CiM_stJPzg@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] gpio: rework locking and object life-time control
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: brgl@bgdev.pl, andriy.shevchenko@linux.intel.com, elder@linaro.org, 
	geert+renesas@glider.be, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, paulmck@kernel.org, warthog618@gmail.com, 
	wsa@the-dreams.de
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Apr 2024 at 09:04, Jiawen Wu <jiawenwu@trustnetic.com> wrote:
>
> Hi Bartosz Golaszewski,
>
> I ran into a kernel crash problem when I pull the latest net-next.git, and
> finally it was found that is caused by this patch series merged.
>
> The kernel crashed because I got gpio=0 when I called irq_find_mapping()
> and then struct irq_data *d=null, as my driver describes:
>
>         int gpio = irq_find_mapping(gc->irq.domain, hwirq);
>         struct irq_data *d = irq_get_irq_data(gpio);
>
>         txgbe_gpio_irq_ack(d);
>
> The deeper positioning is this line in __irq_resolve_mapping().
>
>         data = rcu_dereference(domain->revmap[hwirq]);
>
> So, is it the addition of SRCU infrastructure that causes this issue?
>

This is irq-specific RCU that I did not add in the GPIO series. Please
provide us with more information. Bisect to the exact commit causing
the issue and post the kernel log (we don't know what kind of crash
you trigger and what the stack trace is).

Bart

