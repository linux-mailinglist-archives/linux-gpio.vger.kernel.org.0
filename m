Return-Path: <linux-gpio+bounces-27628-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBE0C0C4AE
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 09:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CA67189D2C3
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 08:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AC12E7BD3;
	Mon, 27 Oct 2025 08:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ttwltuwi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F01528A1E6
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 08:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761553599; cv=none; b=c56Y7AnivSz1ouXoUKR5q/0uBQxua6rDIFJTy6WI7+K55pQxn5e2BmcekIOl2qRhLv0sJRbig6+pC+DzsiXJMNEfyAdstYYyPcl2ae4wzrambIc9Kn+V/4eoINW/igXsqd7uNB/CLxnovlY4Tn5JqjkX52kc4m2QNKZjK/ceXi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761553599; c=relaxed/simple;
	bh=gH/jFYL3OQOMsGnxKfmscVPkEFC4139EKkMPyCYuZQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=en+ggwswUDeGxyFA1bMVcB4I0RD0rg6nQdYcbjGbU7DsuPltgGS/f3rkmJB277Mtn+WHKi3BYXewWuP24MRwley15sJf7X3YbN/C5f8r0UxMG95GS1UBNcJJT3O/mcCAW/8IYWfggc4Kk51ToX4xrHzRUlPVkBXFlNRROVBIFzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ttwltuwi; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-63c489f1e6cso6989802a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 01:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761553596; x=1762158396; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zXj47gID0X51rCR7nOHEpCUw1/xTgwSozZGVXHUZwWE=;
        b=TtwltuwilcscY+8dFsPzHBAei/94hCy8jdSfTjGC7mBQ7Zpz/mCwjkjzwYFflPia0E
         ABK/Ev4iRROE1H4WCfsRdO34YHnYpI6MaR2jhFAOQh4jX+WueO9+3Ypq0/SajqCWqfI/
         uflracaczln2rHt9FhyWZnZbCX8eVVa8yLiGQ20dGs7gS50MUqsFUAc4zRQBeYpDvkIr
         xLVKwHe7C8Us9WvA1ai7NVvVjftUQe+8523FGoc2YdjY0GOsxUaqqlibZx2VTS4KsLj+
         pzlbi/6LTQoUtxpdHvrCNryXQipbKLvXJRNQfy050zg9KtZhPA7R98yiIjy3qfmchbCX
         Kf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761553596; x=1762158396;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zXj47gID0X51rCR7nOHEpCUw1/xTgwSozZGVXHUZwWE=;
        b=CVmFQgDp2rkCYkjGS4IXSPGiJhrS98fX3FX9W0gbamHUp2fv8vWzG9LvzDXHeWnZRf
         m4lddVv1Gn4K/JrYGbWAshant1D7RLwfj5+peMXIoGt2Od6eyi59bXApFYxtjJ3eUF/c
         c/1c1TzLdETCSsdJmAZnkUt4U6/NAth47b+Ocj+uhk1pIb/y7a9WJSHXCDkv0XUbeQjf
         ZQ26CwUl5F1XZxch9ulzjJHyXMaZlakRKpgc3tkRgJIBw9a+6aaGyS3b8w4kk3y4DjyK
         XVRt+sjDkvHQI5bhXQBH0R/MVjfTCONTbCdArrImm4VBGHjP+a+Fxb5tL8kLQNGLIbA9
         r2Dw==
X-Gm-Message-State: AOJu0Yzo7bL7YlEV0U/O+lm8CvMls9mdypNveUNvGoCreUYSbLTtlq1/
	F89PMMOg6Eq1bKWIve+XJ7K1aHnXV1BT1yLAKSCU55im4h9qbc4S6B9WITFi/A==
X-Gm-Gg: ASbGncuQgIoYuYQoAZFxSCz8J2H9iOlPvFYAzOuXiDMCUkmJv42OE/w1Td+QUByO/FE
	megn93EOT+Hv2BGjSsn3ROagaPFYdzbJZlhxRK4Fzy9JdTJrtef9GQcQL6wog8ys5PSrQaWz3gg
	Jyo/eFXFPUi4KxZC9IKiP91loQK+ZIj5Zgs7Bdx/t9xIpX0uNY64wOnJgOjWP4DgzIgD7YdMH/Z
	GxhMkAXaEcS84BMFFAok0Zb8XoXEJexGyKEGJuFkytrph7kCtVmvYUtr7U8JeEWCn/BtYMtLj3o
	gIQHg35NCE1I76xv/sc8EovQ4RR2J9fUH3RjnAxoYR9AHtmBqtOJbadq1EH0vtvwKxy0bZyFpvO
	/BvcIWDLgFvXAGlXlPzujk0BhO7A2R4vJFoW/CXtZLdih8CbDrsdNDcMVwaBMXTK+n4MlnrskkN
	JKE58pjUHkXYH8BDlip4LNdBYnqwUXrRo+NFFAf9ZZYId1TAOJdYrIEzgMdDkH5QpLm+Ugrg==
X-Google-Smtp-Source: AGHT+IEMjG+xYcQQQTXDj6szqHKzNz0Wj17GrdO0mEaASDNerRNiTqf6l8LOBEgHWNP6zgMDziFhrQ==
X-Received: by 2002:a05:6402:3456:b0:63c:1ea9:9ebf with SMTP id 4fb4d7f45d1cf-63e5eb4b5a6mr6471394a12.15.1761553595651;
        Mon, 27 Oct 2025 01:26:35 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f10f:3501:4457:58fa:e678:17cf? ([2001:9e8:f10f:3501:4457:58fa:e678:17cf])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7efb8e54sm5578618a12.25.2025.10.27.01.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 01:26:35 -0700 (PDT)
Message-ID: <a7b6b606-4b2c-4dcf-bd79-23711dd97b71@gmail.com>
Date: Mon, 27 Oct 2025 09:26:34 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] gpio: add gpio-line-mux driver
Content-Language: en-US
To: Peter Rosin <peda@axentia.se>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251026231754.2368904-1-jelonek.jonas@gmail.com>
 <20251026231754.2368904-3-jelonek.jonas@gmail.com>
 <bad968a4-37e6-655e-711f-c647becbba5a@axentia.se>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <bad968a4-37e6-655e-711f-c647becbba5a@axentia.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Peter,

On 27.10.25 08:51, Peter Rosin wrote:
>> +static int gpio_lmux_gpio_get(struct gpio_chip *gc, unsigned int offset)
>> +{
>> +	struct gpio_lmux *glm = (struct gpio_lmux *)gpiochip_get_data(gc);
>> +	int ret;
>> +
>> +	if (offset > gc->ngpio)
>> +		return -EINVAL;
>> +
>> +	guard(gpio_lmux)(glm);
>> +
>> +	ret = mux_control_select(glm->mux, glm->gpio_mux_states[offset]);
> Consider using mux_control_select_delay() here, with some suitable
> delay, to allow the mux to settle before reading the gpio line.

Thanks, will fix this.
> This .set implementation is completely broken. It you want to
> set a gpio to outout high/low, you presumably want the gpio to
> stay that way for at least some period of time, while whatever
> else happens that relies on the gpio to be in that state. But in
> this case only the mux select/deselect is protecting that gpio
> state, which is bound to be inadequate for anything real.
>
> Sure, you can probably build something trivial and see that the
> gpio can be manipulated, but the second something else touches
> the mux, the intended state of an output gpio line is
> (potentially) clobbered.
>
> I notice that in your target application, the sfp driver, all
> uses of gpios via the mux are inputs. Input is a much easier
> problem. At least as long as you do not require IRQ, if you
> need IRQs you face similar problems where the mux needs to be
> locked in its position for whatever period of time you can
> expect IRQs.

Yes, that why I left IRQs out here, but somehow I didn't properly
transfer that I have similar issues with output functionality.

>
> TL;DR, this .set implementation needs to be removed, there is
> simply no reasonable way to implement a muxed gpio .set in a
> pure software driver. You need some hardware to preserve the
> state if/when the mux is manipulated.

I see, thanks for pointing it out! I'll drop this in the next iteration
then and make this driver input-only.

> Cheers,
> Peter
>

Best,
Jonas

