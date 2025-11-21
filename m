Return-Path: <linux-gpio+bounces-28956-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9836CC7A44A
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 15:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E5E784EDB51
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 14:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C625034E753;
	Fri, 21 Nov 2025 14:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MX7BK1nW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9964F33BBB7
	for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 14:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735444; cv=none; b=Y/d4c1Ya8Ctfq1CQX0If1WczpobQzq+EtSyJLCXoD1/PvsWvHohdO/xhbVP0My7kM61RzOv35n1lHYi2LpJPMCV4Yu6ulmETiGnWfy+99aUjZ2NGV1Uxc4UzsvVoa4qCScgYsGKYu7xe0ORhiGluvWlcEV/5QbAYlSqQK66mZlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735444; c=relaxed/simple;
	bh=KXQOWIjK56bpiQC+8J+0nqxmrVQzLpGeJybi73VWBAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gConP7pFbF86yAOObnch95LuqUcuRU8ti2pSampdzfqjw4QzdEOP400+0xhS/5QKEpajGcAMGjpereRq4EtNMmDtWwJX4+3uv+DjiIIgmwSNJ0Ht4siV/1besQjuVzhvnBEAJoaKYYFdSzKw78eFCpQgkjjVS9xZ728vKjO768c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MX7BK1nW; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7c6e815310aso1186152a34.0
        for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 06:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763735442; x=1764340242; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aKieSb8r0n8ixRGiogCunXYcI3uEu9x/VZT0iJ07YnQ=;
        b=MX7BK1nWcWYDU7qI8bZf8qEpKb8eQGkN3zv6pL8Yr6dQHhHzk5Wj4Dg4ENsmSCKXK3
         FvkmXuiC6RK1DRzE3iw8AMoA7F9wmbg+hDLRl+GvwoRz0iwI0JggQ92ZhHnA+9G5Q5wk
         FrfjRzwvXh8uQRykCsAtjDBYoKjNyK37G1YGLNjmnM5zVEkktvnMoDGNNDEgCUHK5Sg0
         s6FoWQgk/iBivsKPHQmLzHvDrMZxV5BUoTgO78+8pk3hWAJFn7DbrbTJjDv8uGdzmm3V
         0R1PaXq6GA79sYN9AI64fCwt56irJygMDyXrljtzx6QAQH9nTqpXSBOMSWJYH0Nb/Gca
         sT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763735442; x=1764340242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aKieSb8r0n8ixRGiogCunXYcI3uEu9x/VZT0iJ07YnQ=;
        b=Q3mpT8ec31lcGaG6imS7u6caXncxcW5MQ83auq+shVdiRiN3kR3XgFjZ8eNAAgW4z5
         iJZomINyovRiFcbCy7RREQlKH7Df42h0C9CoOWyyEssChVg029VShSxq1q8ha4z807F6
         fN8ue+IjeHPiY6bVPMNeZ0XQ2kUsP1yE2AsvQ8Qed3gWJjqWTe0u5Ig3IiupZ5y7RucV
         6DKCTVPuqJIm9ec7MjpKTpH9f6zfcJ9FO+10Ae91qcWoysLt72YwBbMIdOvMw4jKBAH0
         qGtyhOTsuKDz4AQnEEmtOpjC7s5o0Ft0Xp8ZaGfXNFKZjmlCPenaM30VgeJcYvKi0D5V
         PfLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPoz191G/mUPj0+uuw2U1ZpxkPX6farFNcYJWmj3x6cIa7jD6oesg/qMCGhR5A6t7RLFdTFlq5LbLP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6JirmFckjkYSPYlkywwurvUnBPGuYPhA4CIr9J9D3OG4nhvAz
	B+puSffdkms4xzMRWy5edxW4vzC5CU2DGR84927S7o5e1bv9rG6NNfftE0RBe2QOtg8=
X-Gm-Gg: ASbGnctXqnKCfxVN3YoMFKTseN6x1H7znSFsY/bkWYluKQVz4fhi8Uv+hm3Rtfecffw
	+41ERC4e8Ocucl6dq4TOVABf/TRjC1PDICSZ2d3y+4fiSp1FZFu+9gS1IlI+xldlA5O6gc+caOV
	SDCxY3Hu321LR8kX2HR2pJKRhlNkMIUbY87QomRn3Gg5Ayzg0yfnvKRyRWP+47A2I0bU1rtxy3t
	Ez9+pdacqQmCgiu3sw6MqFKolqml/zDSbkxs8JciALTsiZ+fFRA9yv/2u+AkeT0Ks44b646ujmb
	wIutyNv0OWGkHYK3GMANzEOLxfm3nOqmeIFqqSyMUCyqHjMXi4Iob9ubhQDtRf52RlMJQbRCf/5
	fh3ua9CooexBamIMkjo4ymBVcgNzU8tfDqQgeIfFUadq9DhpoMmN7zNLazt8zAPW8HPCys2dpSA
	A8Uuj+ptchVzrLQL74C9KAjfWs7QKEyXzt3I79kBkH0oKsZla+64RqbQwwVg==
X-Google-Smtp-Source: AGHT+IEqhG1OZuaWnUfCuXYFeEh7s/xKmhR139iET5Mfw4k9VE0RqojiptfYG09T43K9N69S1YlGZw==
X-Received: by 2002:a05:6830:919:b0:7c7:61f1:6fd3 with SMTP id 46e09a7af769-7c798c751eamr1221512a34.9.1763735441620;
        Fri, 21 Nov 2025 06:30:41 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:d761:af7:26f5:f16e? ([2600:8803:e7e4:500:d761:af7:26f5:f16e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c78d428f28sm2293281a34.30.2025.11.21.06.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 06:30:41 -0800 (PST)
Message-ID: <f81e216a-7af0-4779-afb5-3a82f4711cd5@baylibre.com>
Date: Fri, 21 Nov 2025 08:30:40 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mux: gpio: add support for ADG1712 quad SPST switch
To: Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla <srini@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20251121115750.20119-1-antoniu.miclaus@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251121115750.20119-1-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/21/25 5:57 AM, Antoniu Miclaus wrote:
> This series adds support for the Analog Devices ADG1712 quad single-pole/
> single-throw (SPST) switch to the existing GPIO multiplexer driver.
> 
> The ADG1712 contains four independent switches, each controlled by a
> dedicated GPIO pin. Unlike traditional multiplexers that use GPIOs as
> binary-encoded selectors, the ADG1712 treats each GPIO as a direct switch
> controller.
> 
> However, the existing gpio-mux driver architecture handles this perfectly
> by treating the mux state (0-15) as representing all possible combinations
> of the four independent switches. The existing mux_gpio_set() function uses
> gpiod_multi_set_value_cansleep() which treats the state as a bitmap,
> setting each GPIO according to the corresponding bit position.
> 
> For example:
> - State 0 (0000): All switches OFF
> - State 5 (0101): SW1=ON, SW2=OFF, SW3=ON, SW4=OFF
> - State 15 (1111): All switches ON
> 
> This approach allows the ADG1712 to leverage the existing mux framework
> for switch control while reusing all existing gpio-mux infrastructure
> without any code changes beyond adding the compatible string.
> 

This doesn't sound like a mux at all. It sounds like a solid state
relay.

So it probably doesn't need bindings or a driver. You can just use
the gpio that controls it directly since the output will always
follow the gpio state. (And if the 65 ns delay is an issue, there
is "gpio-delay".)

Using a gpiod array gives the same convenience of being able to
use a value 0-15 to control the state of all 4 at the same time if
needed.


