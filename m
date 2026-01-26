Return-Path: <linux-gpio+bounces-31048-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNcfLyYVd2mHbwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31048-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 08:17:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8D284C4F
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 08:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AD2A130022D4
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 07:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE70929A9FE;
	Mon, 26 Jan 2026 07:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsO0SmG7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37062235045
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 07:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769411840; cv=none; b=qYp1nYYSE5Y/B66x83L8bfIQNPJnK1bdnofy+AI5MBvAq7HA+tVZOsx+YuDBDGlUBYtWAqjoWw1H9sYFjG07eBXRqfnt9SGSEz6cGJO6yywqQlHHsx3c9NDLivK6mcD3BmfQU7XVHe9dZNLikFcz9vm527wjlkBft0/yyuSUyKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769411840; c=relaxed/simple;
	bh=nRKIyjN3ArKb8KbD+PUw29Tt98cUT5nKd2HtrkkytWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IVU5RzJPX2/Ezw1EvDVQl/DBXejJxmIOKZ5WoOF1Pwj9PZmaNfId7u7/6yJk5fTxtM2Q4yYcRpYWXYV5RnH93NOpbg7ESnaEgOySA/rsoiZikSc6fm2Go/9Gc7WbsBgFgxquMes39nI2sOsOaq1aCyqdLhG4akN72GWgk0dOeM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsO0SmG7; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59ddf02b00aso4499194e87.0
        for <linux-gpio@vger.kernel.org>; Sun, 25 Jan 2026 23:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769411837; x=1770016637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4pWc0GCD7/xkKAwOl2KWwb0Wzo977naoiOH75fPws/w=;
        b=MsO0SmG71FQdSUlYdTXlPP0mQ15EyAqhOXRwgo5ZjfdD+L6APyw6ALdZRKNbk/64v5
         JL3EYBdFuFOyfeRV8g8ZmGcXxuwM2z6kDjOVwN3Ue005Iv6gEv3dVabIwf2BoGrmUND2
         gXeDj6p++SUaxVLRLOf5Khkc2LdE5UHiHIqoG/U+MlvybjO5Znp35vArM5T3eXxJisVb
         Lo0E1OWyk963lPXXJPyjoeEak2AbALZ7/9ytJqPZkYvXPl+mk8hA7uHYXDBo16G48S6+
         i7Wqgp8yJv5djRKwcOWXn9Z2eqZ2cTmwM8QXqxqzC/iT3qyXTmP3pjPDMAvKzznbJn3B
         JuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769411837; x=1770016637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pWc0GCD7/xkKAwOl2KWwb0Wzo977naoiOH75fPws/w=;
        b=DpcyokWUodZeKfYXTK6/336+m0F0bcAENhXiXNyAPcNqGAukGAz6Lo6Y/P7XC7T3iG
         pjKa8sJl6VAU2bd+uTdJvIYGD968LS12FjwKsxm2MTmAv7kCiGaMJqK+Xvza6bRwSMq1
         vQbKX5/74LiMC0VCTpwU00XDII4W3rGbCShFVsxEonfgkNZQexrDSGkZ/djxdrPFpOoo
         vMnWD/ToyonsX1XjnqSmc8ZTHPLvVsPW1yL1uolVYg0yHpAeLCkx8EHNyz6SzA9QYVeN
         tNYJDfRAtzvU5kBUD352jA/3tX6F2G1gt/m+/KesyWXL3YXhQ78uuprN+6iX1rvEKyvG
         SfHA==
X-Gm-Message-State: AOJu0YzDvUjJeAh2ZfxjlWf45eeygZ/D2ucheOctUsfVZg1BMsfXHnz7
	MbKbZaYx1IeT4CPeccXYY7CDKAKMvYw4dV8p27B567og7+2znvut41kj
X-Gm-Gg: AZuq6aKdzYqR0q3td3Xp6tjhfuXXfEaKvV4EgfbEbJ6tzSx1WjCVV5JhDs3U/bZZtAH
	kop7ecsFn6CS48ywNdhuy04xbw9Fi26FAyl2/tXPYGnkbzmz9efd/0mauUymoTfiBaiHhibHHnJ
	A0DTVPOgvAm3xBFd6jhBvTGfcWCk9WtwbrfwRdwqx7OdVpQBAmHAMPK5bVepnD1Fjrn+KgYb3OG
	NVPzazmzvZ43KSN3tHHi1IjqnsPG4h4lm5UoggPv3lQsnG0TGeRyxsGaiIS/DYKHwV0ELn7NUCc
	CxfyC3STIBhJgtnSj44ZXBQaRIQ7kFHGUoMHqnqHqTJMdnaJFccQuhoao+j+C8v1vr2l141Tqnh
	BMdA0DFxrMgMaqoZqn3ZB7vW6vE9qDUvYAe6KSvjGNlwtNHNjgC2PTaVZ06Ru6miaMFPSqgxBD4
	OdtaRlhw689J+6dLQkIKGWJJ0uYdfBj45B2T9NICY2A7JFOBWT9QYRcVMRzcL5hEYJgZ07drLsM
	0sHRKI=
X-Received: by 2002:a05:6512:3a82:b0:59d:e65e:b38d with SMTP id 2adb3069b0e04-59df3a33971mr1256229e87.45.1769411837087;
        Sun, 25 Jan 2026 23:17:17 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de491ec4esm2429495e87.67.2026.01.25.23.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 23:17:16 -0800 (PST)
Message-ID: <c694399e-4151-431f-9eec-cc006abdb968@gmail.com>
Date: Mon, 26 Jan 2026 09:17:15 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] gpiolib: introduce devm_fwnode_gpiod_get_optional()
 wrapper
To: Michael Tretter <m.tretter@pengutronix.de>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, kernel@pengutronix.de,
 Stefan Kerkmann <s.kerkmann@pengutronix.de>
References: <20260123-gpio-devm_fwnode_gpiod_get_optional-v1-0-fb49905452a6@pengutronix.de>
 <20260123-gpio-devm_fwnode_gpiod_get_optional-v1-1-fb49905452a6@pengutronix.de>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260123-gpio-devm_fwnode_gpiod_get_optional-v1-1-fb49905452a6@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31048-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mazziesaccount@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5F8D284C4F
X-Rspamd-Action: no action

On 23/01/2026 11:51, Michael Tretter wrote:
> From: Stefan Kerkmann <s.kerkmann@pengutronix.de>
> 
> The helper makes it easier to handle optional GPIOs and simplifies the
> error handling code.
> 
> Signed-off-by: Stefan Kerkmann <s.kerkmann@pengutronix.de>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>   include/linux/gpio/consumer.h | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> index cafeb7a40ad1..9328b67e26c0 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -607,6 +607,23 @@ struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
>   					   flags, label);
>   }
>   
> +static inline
> +struct gpio_desc *devm_fwnode_gpiod_get_optional(struct device *dev,
> +						 struct fwnode_handle *fwnode,
> +						 const char *con_id,
> +						 enum gpiod_flags flags,
> +						 const char *label)

I would like to see the kerneldoc for this. Other than that, it looks 
great to me.

> +{
> +	struct gpio_desc *desc;
> +
> +	desc = devm_fwnode_gpiod_get_index(dev, fwnode, con_id, 0,
> +					   flags, label);
> +	if (IS_ERR(desc) && PTR_ERR(desc) == -ENOENT)
> +		return NULL;
> +
> +	return desc;
> +}
> +
>   struct acpi_gpio_params {
>   	unsigned int crs_entry_index;
>   	unsigned short line_index;
> 

Yours,
	-- Matti


-- 
---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

