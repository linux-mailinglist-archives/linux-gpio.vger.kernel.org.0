Return-Path: <linux-gpio+bounces-27765-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B11C14171
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Oct 2025 11:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B1C83AC436
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Oct 2025 10:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38EE302168;
	Tue, 28 Oct 2025 10:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nK6B7cYK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53A22FF675
	for <linux-gpio@vger.kernel.org>; Tue, 28 Oct 2025 10:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761646988; cv=none; b=c3uXAMVQucwWNnuEPJ0pXKB/4bkB1MR9bhyF17RaMPRegH9k+g+x8SK0AlaM9sQlPQ0+EdnX09MhgphKGlgMufb+mOGL9ZPbZS2I1y2kuWOOlHkxezvioEZyt17RTvLNxMONrzCImCMW2bl0R829fW3tuyMqtfTRMdVeoXmvOF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761646988; c=relaxed/simple;
	bh=+jYHO2zNNdgUJXuN8ugHExdRSw1IDTNhRJAWZCcSHBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KcVQd68aEENsFDiSdUEfrUhRQujJJtMIHIJ3pWRz+oihmiHgsbuTRjDNfViRSdbt13VW4/B3iEx2t8gyL3IAubdgiOz+dG4V/qrLxJYdin3rRIcx9sy9gbEuuRNiB0ExJuxOmTOQSbnzrJ3x5GJNS7+jiygzZ5QbQmwP4NozIuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nK6B7cYK; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 568D31A16F9;
	Tue, 28 Oct 2025 10:22:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 29ADA606AB;
	Tue, 28 Oct 2025 10:22:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 793401179B966;
	Tue, 28 Oct 2025 11:22:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761646959; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=pqtOZsRtH9DHGRp6LR0r+HDjzdovCcKVPZfJ3ZtDVJY=;
	b=nK6B7cYKJ8nuSOGm8w0gYH5wDdp25LHCaubantKLWhuFoVISMm8EGXquu74Kb946JMhzA6
	8f+ZDjnPAWAtaDrwF8uwJ3lUb/DfTRkGRWB22/glf005AU2F4Tv11IIQq3NFtfEqs1da6s
	loVmktq3OPX7tamdJC5q4xkSS8y7C4Mlp1JpOkRQ2brRrD6MgkdH4jnFiF4y76qcbSX6DW
	psf5paisErJ4C2IbAgrJck42vG1sVny6XXWhZM6L2f89LxmMMPZtL/on8kUOJx9LM1oE7r
	FizfJrf66JrdTB9hV2VkDwLRnHHwjKBbcP2yP249y/blS8qO6YIbCf46e5QcRg==
Message-ID: <ce3f0f1a-9cb3-4721-9774-0b73f461a6e9@bootlin.com>
Date: Tue, 28 Oct 2025 11:22:28 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] gpio: add gpio-line-mux driver
To: Peter Rosin <peda@axentia.se>, Jonas Jelonek <jelonek.jonas@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251026231754.2368904-1-jelonek.jonas@gmail.com>
 <20251026231754.2368904-3-jelonek.jonas@gmail.com>
 <50646b88-5746-4665-8085-09e394aa291f@bootlin.com>
 <db36ee25-8a1e-f95c-4ac9-867379a1a5e3@axentia.se>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <db36ee25-8a1e-f95c-4ac9-867379a1a5e3@axentia.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Peter,

On 10/28/25 11:09 AM, Peter Rosin wrote:
> Hi!
> 
> 2025-10-28 at 10:45, Thomas Richard wrote:
>> On 10/27/25 12:17 AM, Jonas Jelonek wrote:
>>> +	ret = mux_control_select(glm->mux, glm->gpio_mux_states[offset]);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	ret = gpiod_get_raw_value_cansleep(glm->shared_gpio);
>>
>> Why ignoring ACTIVE_LOW status ?
>> And cansleep depends on your shared_gpio line, maybe it is not the case.
>>
>>> +	mux_control_deselect(glm->mux);
> 
> *snip*
> 
>>> +	glm->gc.can_sleep = true;
>>
>> depends on your shared_gpio line.
> 
> Does it? In this case, the gpio will always need to be able to
> sleep, since mux_control_select() may sleep. Or, what am I
> missing?

Oh yes you're right, I forgot the mux part.

Best Regards,
Thomas


