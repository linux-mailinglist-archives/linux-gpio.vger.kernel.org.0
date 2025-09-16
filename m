Return-Path: <linux-gpio+bounces-26202-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2846EB592B8
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 11:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABFBE1BC4B80
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 09:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32F22BDC1E;
	Tue, 16 Sep 2025 09:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jYyW69hS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE67129BD91
	for <linux-gpio@vger.kernel.org>; Tue, 16 Sep 2025 09:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758016356; cv=none; b=RrUEZbSRXdi9RbzqksUuASPkzemLAAxUmqJbmszo10eulldR34Ja9VjN1+Df21yKJYYQLKfCL+MZQ1E8njzcKSMRzW0VqFhO3f9PgiSmKxYC1375v7TU5oylmmO/bYRFd2akAOdYqaKzLP1dXhiS4lmZudvb6RJGf3JC1zOhQIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758016356; c=relaxed/simple;
	bh=aMG5F7xpbshGg26N6ZjbwilfqXgobZd+0i4J8EC0NG0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XfopCyzWpLYMYKrfPL77HiCvEgX1YZFk1dSAygATzQrK/ZFM5uwBKzumKgR7Ya8sXnvVlNnt2X83MJqC8OMc6/EFiNCywqDjpDMdPn26F5ReDmZY/yz8NWsjj/IKkpYTLcWkHTV/L+RA27yhwiXNHctE9qnG5FhiB9CoBVPBe3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jYyW69hS; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f7c0fb972so5046682e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 Sep 2025 02:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758016353; x=1758621153; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OiOC/M78bEv61Cna7PZSesU2fWMjqsEn6aaaGX6/V3E=;
        b=jYyW69hSu6lcclYx4f+E5zsc/hvOWWAVgFXl5kyEiJAfEsIcqXKMCFfhR0LeaBFurk
         4ZD0w29C8cAtgRDqApcVMCPcPUerjSD/uK0fF8/LHj5aao71Jcm4iXwqaW7cTiEfg613
         9wnFM9fqUp8uAWDDBB+sMBRxvQB51Cxp2j7UUBnsyA3wAhGupvz7AjSIMCojApgrfblq
         +gjgDZ0dS0IjjkHHSRuT7PK/7d16jZ8kfmkaOhVDsl+2mAU9NODyk0iqPAtns7Wk/QcA
         Huj6waHkIVx++B4yJAtTzFOKSXwFQfeHJuSQAHapg/ocQYva7vePgiIETLBYMeq6mSCk
         yVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758016353; x=1758621153;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OiOC/M78bEv61Cna7PZSesU2fWMjqsEn6aaaGX6/V3E=;
        b=BdnFlEcpOszYHMBuRekKMjagze0XpcerXJwzvo4RUIvo2VR+fmgpC0Rwsu6Oxd3WtU
         Fc1PRXXwn6i7+4bsY6mGQz9WJuk7R+VD+ArsXrnkuYk5t74/P8wCzvp/cEim8j4Loo8S
         kF/4bacoG/hgKM0O115yenbAwTQaWrzRHMVWol7XAyKfWbgWB590ywoRT+3N+ioqF3m/
         jV+LHKM2T8F1UNP4pvGvP8nn99lswrFq+cASdB1QocKqtBMS9QFo2obQRihcqMSQ+FKb
         rUAI0tqjFWtfFY1RHbkzQSkOZgFJb9mQe8KhOmXmj3Hy8ca/3NHVa69S5D+OnGLz6e4g
         IjaA==
X-Forwarded-Encrypted: i=1; AJvYcCXISK7c5Oj02GIJVi+ESJgYUvSzdN4Ay/dV5oZr22a0Cdv2asntkIEvCgaE1s2Jy/4+uR8uJXJdsJz/@vger.kernel.org
X-Gm-Message-State: AOJu0YzcAeZbWCW++Gy8rEcgprLxI2OElPqVR0KPWE4LmKqgjL9lf0oV
	cbeVZeo+sdY6PXQUWGPjyvT30quNamKcU/vaD1qpKnPUz8pTZnvjFbIAXaFnAXqjfI6FCoqihkr
	UQD6cdp4XR0SvLXG1ZkeAi5Ig/rJqxObAerStDWZCYg==
X-Gm-Gg: ASbGncs2YKWp8dfpt2B7xD0jgJKCnz0iQuRFoLuUnnR4igee37Im/QUAVJKgE8OwBBE
	l/CSm7A82+yX/9/HMnE2usa/kgSbwOtE5c1EYX6p1Qfq/MCKAg/2iP97pfe1kG+zZmujl9BJFaR
	GylqiJEWTdTCw63ItaNNAgqGyAxdgRYrDmFk+U4rZ5QTzgOZSaS4S1zIlFxhySDws1uF9ggiH2i
	K2TUPo=
X-Google-Smtp-Source: AGHT+IHX/v2Sv4pNLDqBj2a0T8TLe+4AuuhJRQKT8EtfyDIe0B7CYhCKOOu4ksFfaiZpITJ9Ev2G8Po+8ZM3AqaIkKk=
X-Received: by 2002:a05:6512:3f05:b0:55f:3e4d:fb3b with SMTP id
 2adb3069b0e04-5704d0071c6mr5659388e87.30.1758016352992; Tue, 16 Sep 2025
 02:52:32 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Sep 2025 05:52:31 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Sep 2025 05:52:31 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <DCTDUJO0PS8B.1LD03WTEMNRVP@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
 <20250915122354.217720-5-ioana.ciornei@nxp.com> <DCTDUJO0PS8B.1LD03WTEMNRVP@kernel.org>
Date: Tue, 16 Sep 2025 05:52:31 -0400
X-Gm-Features: AS18NWAbYT5SIpslmbsM29_pX3ylDm2HlYwz1lrLiD9dqodJMb4U8hXy3-TvuOU
Message-ID: <CAMRc=Mf7bnAM=-A4jWrqOvS8-ZetTHPfMaEpmQdbKMt6SWKtQQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] gpio: regmap: add the .fixed_direction_output
 configuration parameter
To: Michael Walle <mwalle@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Sep 2025 14:45:58 +0200, Michael Walle <mwalle@kernel.org> said:
> Hi Ioana,
>
> On Mon Sep 15, 2025 at 2:23 PM CEST, Ioana Ciornei wrote:
>> There are GPIO controllers such as the one present in the LX2160ARDB
>> QIXIS FPGA which have fixed-direction input and output GPIO lines mixed
>> together in a single register. This cannot be modeled using the
>> gpio-regmap as-is since there is no way to present the true direction of
>> a GPIO line.
>>
>> In order to make this use case possible, add a new configuration
>> parameter - fixed_direction_output - into the gpio_regmap_config
>> structure. This will enable user drivers to provide a bitmap that
>> represents the fixed direction of the GPIO lines.
>
> I wonder about the ownership of that allocated memory in the config
> structure (and btw, I guess you leak the memory in your driver) and
> if it's not better and more error proof to allocate and copy the
> bitmap in gpio-regmap too (and maybe use devm_bitmap_alloc()) and
> leave it to the caller to handle the passed bitmap. I.e. it could
> also be on the stack.
>

I was under the impression that whatever is in the config structure for GPIO
regmap init function is only required to stay alive until that call returns?

If so, then yes, a deep copy of everything from this structure is required.

> Otherwise, this looks good.
>

[snip]

>>
>> +	if (offset >= chip->ngpio)
>> +		return -EINVAL;
>
> Not sure this can happen. I tried to look into gpiolib.c but
> couldn't find anything obvious that it can't happen. Maybe Linus or
> Bartosz can comment on that.
>

Indeed, this is handed by GPIO core, please drop it.

[snip]

Bartosz

