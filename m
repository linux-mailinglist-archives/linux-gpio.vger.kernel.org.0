Return-Path: <linux-gpio+bounces-35023-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EP0hOpFu2WnGpggAu9opvQ
	(envelope-from <linux-gpio+bounces-35023-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 23:41:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 574DA3DCFFA
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 23:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73BDA3042EAC
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 21:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B9A3AE71E;
	Fri, 10 Apr 2026 21:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="rowVptpZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1760D314B66
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 21:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775857134; cv=none; b=ZcRaVqd855hQNcWzjetqF4pjDuNoStjOAYPVBUlL6pIvsTI5fZkUoiuuHqHiSyVxtHxgoVye/19dJ993Rx1k2yUfJkX+QsYh7TpOpsjNYtYAaF4TOFJuyxN7tBJ3tTtiLw5fQeDaQ3/ejDHlWAJhhs5+lQRi2lL0KeTz0PeEOzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775857134; c=relaxed/simple;
	bh=AfxJCGuDwawedT7P4I/1sW7q39LqQw75gWL8s0+dAh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uyYI6N+UsdIenoWFCanvxPPYyfk3d7O4AFx+O+2vutaidtY60hrfWrceNr6nwIHrbOox9OxsLYacKurKt7+ZhoPbeEnBUxWbnT1kIm1ZK5loCrs2CfhpCswH5ZEx/KfbxaALKL1p6eMBfBUgDuCKMJYsNpTXJy+4ZMGEqlqPphU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=rowVptpZ; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7dbff06e4a6so2398591a34.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 14:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775857130; x=1776461930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eaFyqgC3R1GXm84D3GWzj8iqNT7a1oUcf/2QMWQlMeg=;
        b=rowVptpZ9UsLOgQik7lVyrdF6+0eY2gPqRnhkmcgu/6QsD99GYfkanNJsi2AKSIXD7
         88VqicmttTOrzlAWUidS213yc6pY8yVX8IksXXJQ3MYkEiGEiZxWpWQQecHNXXjq9/8C
         XZBGam90Cs62hlon1Ih5+sHpbdvigOtZMFLQXkSKX5xAlW7TuzoCZrozGYqMXrQCviuS
         79MPxY9ZkNpiu+PCEM6l4cEMO7buD0M6ZhQAqacUbbm57Nm5P50QuZBouVuGBMjAthKW
         eXNJ8GQEDbGefxYshH/1nBwLSFEoxuM+api7VjUBUmFZOgZdYjmBL9UPCFLvTpfkGy6T
         ctRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775857130; x=1776461930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaFyqgC3R1GXm84D3GWzj8iqNT7a1oUcf/2QMWQlMeg=;
        b=X03zdbuGmQiDmjrVsdv/zSxajnIRgOeNJzJetz8slAxLzS3NZThjIWTAuZSm9QgLYu
         bdmBJ7JzRZh8ZDBXCZfSw8ZYXG4wp2fe632IWnXWymgn1+3oXNg/rkLpyDzo6D7KoQE6
         eMXmqj5KIpBexuWXRuzdOT07ynmxAdH5R5sz6AkkElley8YXASkikd1vLT2u+6+fwiNg
         7ctAO5jNs6HyeRQyzKWTzNsnv0ueUJSfnT1xHrk8/hzFcUsemGWMTOo5nNIctFgE9I9b
         DyGaqJK02iUTUpMNlz+dCYshsouuOU9iETM3wn6MEU5fYDVBrIe65KAH2nOgsjf95vd7
         lyMw==
X-Forwarded-Encrypted: i=1; AJvYcCUg2qgwZnrBfosBqWjryXnnXlCWmFQkwDVI8Ennf2OMuHo/n86gaPujO0ZRor0hcOcMJwHkui8IPXj7@vger.kernel.org
X-Gm-Message-State: AOJu0YyNwspk6Ulie6eSlc0B6ZjtyUZ/k0vBNPnHIM2XH722WsEmQCU5
	PTQoOGr7g/qhjfrBkE1l47CxC4v5AaeIib6Ua2CcX8WXXydTRhmYAShJXKFU5ENLc98=
X-Gm-Gg: AeBDiesKPQxEnELtJCjTHytnpMARn34Rd9QqUD+bA8NtBQvmv/TEQzOEi2+WolhNgDH
	T/bl7D64COnLxDxOMno5xSQBR3qF9mcfKfw/fgEm3/8Ng5iW0L0daW+WHCFMCJOPMjD+mu1aBFY
	nnF35PfsUubg3jlJn4CkOp0BIzDK5UljC6AglBO0JbXS3Y+xaFaXX+hMntT07JkefLMF7q/6XRH
	fB08jrm7wYVYX9medzHM7GnyQN5/ptePmdc6X1rrM76WMKGD9S4sJnKhlpgvbGWTd3wHDY8HTMf
	qSMxFiXg1nalknIA0AC+IAnn3+zxCtRVa/noL4x4e2mHbKYOQ49/FtbdU/eNNlRX7HX7wSXC3Le
	GfMZaqo1B3KfnKSsoZTf0nKzk5okMYSrTRplkK2r4sTvZGg6Hqa8HOP0EQTR5iHYKoWhOc0xAS9
	WLp8jkhOA5dxI4RMBbFvQeqiDi8XQBomPopbBzPUbnYA8+Rt1BYrcemn8Q3+KOKsgcKFkzNzP8b
	A==
X-Received: by 2002:a05:6830:498b:b0:7d7:f617:3573 with SMTP id 46e09a7af769-7dc27cbf49bmr3103286a34.10.1775857130046;
        Fri, 10 Apr 2026 14:38:50 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b75d:2440:dc10:808b? ([2600:8803:e7e4:500:b75d:2440:dc10:808b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc26941b7esm2736484a34.19.2026.04.10.14.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 14:38:49 -0700 (PDT)
Message-ID: <9c36ee85-12da-41e8-b9ab-e32b7ec29e75@baylibre.com>
Date: Fri, 10 Apr 2026 16:38:48 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] docs: iio: adc: ad4691: add driver documentation
To: radu.sabau@analog.com, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260409-ad4692-multichannel-sar-adc-driver-v7-0-be375d4df2c5@analog.com>
 <20260409-ad4692-multichannel-sar-adc-driver-v7-6-be375d4df2c5@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260409-ad4692-multichannel-sar-adc-driver-v7-6-be375d4df2c5@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35023-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[analog.com,metafoo.de,kernel.org,gmail.com,pengutronix.de,lwn.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre-com.20251104.gappssmtp.com:dkim,baylibre.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 574DA3DCFFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 10:28 AM, Radu Sabau via B4 Relay wrote:
> From: Radu Sabau <radu.sabau@analog.com>
> 
> Add RST documentation for the AD4691 family ADC driver covering
> supported devices, IIO channels, operating modes, oversampling,
> reference voltage, LDO supply, reset, GP pins, SPI offload support,
> and buffer data format.
> 
> Signed-off-by: Radu Sabau <radu.sabau@analog.com>
> ---
>  Documentation/iio/ad4691.rst | 283 +++++++++++++++++++++++++++++++++++++++++++
>  Documentation/iio/index.rst  |   1 +
>  MAINTAINERS                  |   1 +
>  3 files changed, 285 insertions(+)
> 
> diff --git a/Documentation/iio/ad4691.rst b/Documentation/iio/ad4691.rst
> new file mode 100644
> index 000000000000..a1012c8b78a3
> --- /dev/null
> +++ b/Documentation/iio/ad4691.rst
> @@ -0,0 +1,283 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +=============
> +AD4691 driver
> +=============


One overall comment. This goes into driver implementation details quite a bit.
I think that is really better done as comments in the driver itself. And this
document should just focus on how to use the driver from the userspace point
of view.


> +Buffer data format
> +==================
> +
> +The IIO buffer data format (``in_voltageN_type``) is the same across all
> +paths: 16-bit unsigned big-endian samples with no shift.
> +
> ++-------------------------+-------------+----------+-------+
> +| Path                    | storagebits | realbits | shift |
> ++=========================+=============+==========+=======+
> +| Triggered buffer        | 16          | 16       | 0     |
> ++-------------------------+-------------+----------+-------+
> +| CNV Burst offload (DMA) | 16          | 16       | 0     |
> ++-------------------------+-------------+----------+-------+
> +| Manual offload (DMA)    | 16          | 16       | 0     |
> ++-------------------------+-------------+----------+-------+

Not sure this table is helpful since all values are the same everywhere.

Also, doesn't SPI offload have storagebits == 32?

> +
> +In the triggered-buffer path the SPI rx_buf for each transfer points directly
> +into the scan buffer, so the 16-bit big-endian result is written in place with
> +no additional copying.
> +


