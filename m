Return-Path: <linux-gpio+bounces-33439-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEiELYimtWks3AAAu9opvQ
	(envelope-from <linux-gpio+bounces-33439-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 19:18:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B3F28E667
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 19:18:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 46551300DF69
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 18:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55001331204;
	Sat, 14 Mar 2026 18:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="13TG+A8D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D80E277CB8
	for <linux-gpio@vger.kernel.org>; Sat, 14 Mar 2026 18:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773512323; cv=none; b=bdjMianpge5MN2QmP0kQH9pPXxckrCiy+wfWt+A2NJiNBLgilJ7hhtCHcxDmuo5wMmHAV9J6vQFYYiwZFPDuUzx3bZDtVcjmaO26omYQsKTFfe1NPLDEA0snwosQLQXt4njZIPpk4EXZZHqtR6URkbTyjji/Xtykfi8V32h1Mfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773512323; c=relaxed/simple;
	bh=i+hiSWMpKcrgrezSSwiwAM2zE/+XHI5eQEa9uY5l89Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BXLFUy/PF3qLDTDzSHzTLeIWay40t3N1VgTwdThv52QeS957rHnS/HERXBdFhj007zG2/brXrRgcNMdUkllQA64HiOEXkMnuKGQcoTKW74iF/gpucmVrb5TQW0uV4s9VHI9a3u4boK5cZ4fUD6ZSIthtfyJptIMo0sjR1M82Bj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=13TG+A8D; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-67bb5f989c4so2033288eaf.1
        for <linux-gpio@vger.kernel.org>; Sat, 14 Mar 2026 11:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773512320; x=1774117120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SK/kmh7PEw2pLUP6UdfntY8BFkF+lE9LaAHgnikGaa8=;
        b=13TG+A8DXRwVx/TolYvZ/3shHW0vM1uWKCuKoYT5iavumvHU5QXWmJ0PIJfnXI0ZB9
         K6IklLcN8oPGe8jnFsqFFzyGvSjG9MYOkBLLC6Hubl1Q7OcdN2+ondJ0BCMBLdnTIDP4
         0KzKcCmFNTpfnW0SB2D2LeUaAlurMbrfAY9GXfxtJJfhRIrh1I3Dv4ep8ah32DPeVoRP
         VB4fyTD8iHTYJkw78H8zcrABmw+UxiLPcntuX0d38E8ZO0K6jLtusWk/1VvVONipaEHU
         jw5Z7gXjkId5nWsYh58gtjWsLOy71RxDfAHwc8SboCK/B7j6hDNaePuxLYep/toNNr6v
         ICLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773512320; x=1774117120;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SK/kmh7PEw2pLUP6UdfntY8BFkF+lE9LaAHgnikGaa8=;
        b=sSimn+FLmxuZHMcc2GRs1CbCAeOV8l4ak+t2nl1jxz6zwAKiKRtCcTM8Q0tfHV0oSQ
         cLBCEgvXbzVih54oAd1pgbXixwM98bvxn2K85fNqjEzQA47cHkAsJWA+x2kOjgWCgirL
         iO4iyDm4RSufVNknXD+tl3M27wnYQA7qEdsX3m0RENMoMvTmjrchDmdRoTCkpEDeGLII
         gJ0eVano9DuAEr4pHo24H31piTIZ/YEbPaTLC6GyziVl3SSYOijiGIE4VuBT1MxpzG+Y
         77byePIxE+RH3VYqDdJ0WU3e7LmzipKAgvMnCrYbMKcdw+GCY4GsIHO+UdWIr1WrLhV1
         ywCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO0j4M4jAgC9Bi/ynxgZ8M1zafnB1L2BlEOrstLBKdc/deBo0QbMvP7D+yAZ4LC92/DpU5Z9YrR+Ay@vger.kernel.org
X-Gm-Message-State: AOJu0YxYwTfbi7wFvftnxxao1pcaZstAEhU5QohoqkWc+WrDWwxLQ5EZ
	hJiMSs5HDgAEZaGzK2sJ8XiF+P4U/n4CtGc1M01evTsCaPxw8VWX1TIUlbBFuH4swos=
X-Gm-Gg: ATEYQzywIZhcT3EzUXLCsmm5SjdtP9Iy+IckKrVB5gs7gayveVl31tqrzrCwI3bq0bC
	DY+O2alx7MTh1uiNCSY6Ud0F7IoKqsR9Mfo0kGJFSW8o0vme5fg3m2RiSS2cO6/84u7Fpx2rpJa
	iUoK+vHwV2L1gBWc9Y47ivmN78wv2l4s8JPFBRfZOblm6dZu7jE8TAvtZqZadY9lf9EGdJEn9aX
	Dkv7H9C027+fYH4OyoZ6THDKcyblW7JQiuLPHYWO7TacBFEE5F9G7L0cNTCQ9dvdIGNRRLdXv/7
	m4YOLq6ckZNGcldXT32OKx6426lKluWxHwcbDOjPYWeZM15lsKY36ll2Y5niuTdk5iihz69MfwH
	YBHZjxGjJcShgO63wNvrOMVhE+AgUGKJ0vw3NIRrKu53G8rdyzjFIxgCQiwbS6YkZJADz0dE0no
	Qj76Rpdf3/L/kwyLqDOLTnhklCA/lEi9JRotDZq2kcFafteEKPMBuE0whdGqd3YP0tpC5gQYvRP
	z7kVSmZUWdQ
X-Received: by 2002:a4a:ec44:0:b0:679:dcdf:1a0f with SMTP id 006d021491bc7-67bdaa92ce2mr4314343eaf.72.1773512320145;
        Sat, 14 Mar 2026 11:18:40 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:14a9:db6c:e65a:4287? ([2600:8803:e7e4:500:14a9:db6c:e65a:4287])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67bc9342ad0sm6716591eaf.15.2026.03.14.11.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 11:18:38 -0700 (PDT)
Message-ID: <e8b34b7c-456c-49cc-9da5-83ccbd11c09a@baylibre.com>
Date: Sat, 14 Mar 2026 13:18:37 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: iio: adc: add bindings for AD4691
 family
To: radu.sabau@analog.com, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20260313-ad4692-multichannel-sar-adc-driver-v3-0-b4d14d81a181@analog.com>
 <20260313-ad4692-multichannel-sar-adc-driver-v3-1-b4d14d81a181@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260313-ad4692-multichannel-sar-adc-driver-v3-1-b4d14d81a181@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33439-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[analog.com,metafoo.de,kernel.org,gmail.com,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,baylibre.com:mid,analog.com:email]
X-Rspamd-Queue-Id: E4B3F28E667
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 5:07 AM, Radu Sabau via B4 Relay wrote:
> From: Radu Sabau <radu.sabau@analog.com>
> 
> Add DT bindings for the Analog Devices AD4691 family of multichannel
> SAR ADCs (AD4691, AD4692, AD4693, AD4694).
> 

...

> +  interrupts:
> +    description:
> +      Interrupt line connected to the ADC GP0 pin. GP0 must be physically
> +      wired to an interrupt-capable input on the SoC. The ADC asserts GP0 as
> +      DATA_READY at end of conversion, used both for non-offload CNV Clock Mode
> +      operation and for SPI Engine offload triggering via '#trigger-source-cells'.
> +      Not used in Manual Mode, where CNV is tied to SPI CS and no DATA_READY
> +      signal is generated.
> +    maxItems: 1
> +
Some chips have 4 GP pins, so there can be up to 4 interrupts.

Also, the DT bindings should not specify which event this is - it is
programmable. We should just say which pin is physically wired. So
interrupt-names should be "gp0", "gp1", "gp2", "gp3".

It will be up to the driver to decide how it wants to use these.


