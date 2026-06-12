Return-Path: <linux-gpio+bounces-38396-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OtggIzSbLGrUTgQAu9opvQ
	(envelope-from <linux-gpio+bounces-38396-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 01:50:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF16C67D176
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 01:50:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=HPMsgtHd;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38396-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38396-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF85D3081AB9
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 23:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6573D351C27;
	Fri, 12 Jun 2026 23:50:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE64303A04
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 23:50:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781308208; cv=none; b=Gwho1rHEjXnSDUqVL2HC3nzqKPrS+ypXGSfKtR5fceujGKxhl02iI61MFWJTZcxygzpbgjrGPPL8qZZmZwvLdVBT/sFaSkxEdaXR9CxRahUShnvSPG94Emxkn5KuQ5K2kB9x3kt8KHBwEy3zxCuZG/NqxNbeWW35awTHyGG+tEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781308208; c=relaxed/simple;
	bh=iUC5KuD8DUpRBxmH8q9YtdnfI/bOwVeYLr89NTEjfAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ELK8s7NV+qmkk0q9sKG+bVrps0QRnT63ssddfkeufJMf9lN7EaFWR6q/bgsSe/Gi6/OPzvZ9TAu+vWTjVsXyoK0aYRpoyDDq1OR8ZhNrT0BIXHjrZdjHCKqUy28CB5c3R2X8w7sCfV+WtI/fiI6oHEa89oD/nONAo6BsEr9BSUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HPMsgtHd; arc=none smtp.client-ip=209.85.161.51
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-69eb8b6bea8so744248eaf.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 16:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781308205; x=1781913005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bYdl9jUW3MXBuDee60djhsxFixkF1o3CC0t5JyKpACQ=;
        b=HPMsgtHdOOREknh2zMO0uePPRofXpf7ClA9Cw3w3F75oGGdmCIvCtrfgJ8S7fTuiud
         ILEiZErYb7lf4LppQ6ChJVcZ8hFUUH/9s5t8E/ASYpAbJ/7W1RMa3iza9t75xn0JNpmN
         mNVuMeri4RlJfOzYice87OfFgOMZMvrRBFG4/LTm96q9PYJtZFsn/WoL1WIVb+LGQnxx
         fky4oTI3MCFlF84qHMaftmYZW+UsI9tBPqvgMIaqB9fXTA/2rrGrnXIF2J2I5mjqfNcr
         GWziwqdxze8cyT2gqj60xpWx+jQRwktie/UutVzzMq4ol9dQ8awd7uJqxm3uBWDoNbp9
         tbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781308205; x=1781913005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bYdl9jUW3MXBuDee60djhsxFixkF1o3CC0t5JyKpACQ=;
        b=tYwlyJQKeJ+++j2hmy+2SN0B/km+WINckU5JBS5KD9iFk9BW8/L6mQuWABkeiwa/dO
         aSSiX8IGZGD4MbgMAAoVTAkcumVcl/qMFzDHR9Veti8hO+J5VpxNmsiG9ES8ONUQ/ic0
         xVoI/7iaSPKRYmgqcm9A9xevsv0ed4SQVkmTAV+owDGyUlg7bmRhlUEoLDwAEH8OC9IL
         8SsVqFaKDVYs125V/7li0FXD/I5U2+hRCpyADsCeBjhLhUtIWAq9FvXo+BRQjh/qScAD
         9jdiJx2XbRy2625j+zsMugrQdRnLKZv8ESvayMT3acpNddThhpGblDKIYXV67lygdsgA
         gXjg==
X-Forwarded-Encrypted: i=1; AFNElJ8B3D9Q8NFi07pMmEhN7fhnz7dNDYtGBFV+ca5fs6oB8Q+R+CTujuh5LFVxZjDjlzreCTG8heZvSIUD@vger.kernel.org
X-Gm-Message-State: AOJu0YwS80IA7t8DZ1S87ikhoGjqxCKLLYeNKYZ371M0euSGjf4BFea9
	Y6QY969/WuNLs/DIDA0KiQy1lcbfDq1rU776XcBidkWuArRgWQ6W0FiCJWh2iIXGGcE=
X-Gm-Gg: Acq92OHcYnSFLx5p54q12vBRGgSr6hfh9lN2kX8fpN6oOtNv95CATc5cxmDi3X0Vn2R
	GzbLwqEb7yCiX+z/FCZDiVOOEDtzWjDPeDRRT5Ry9XhMGfQMQ4kAwqIn38ikkBhqbl0wGmc2sVD
	i+QBxMsDw+EoSS948e3AftertxjsXx/a6JxFdeCnoWz1B4G3q7bdHeG/onPS2fwxpLmqRjwG8cX
	XjM9a1bxC7obq0+sWVW/v6KhHFudteS2twqb2MavZUtDgDaRTDDI7/uxpBvc7spNvAjPrJnPj8F
	N/RXE+q4BPmJUbWXQajzZhckFafo+ann21ZTNIIFGhcaLUZOCL/oYfSmmRm1Hiks2zE4VhezauQ
	cxYeaZB0SGKhstTAjczTo7+Vo5qufAzYYvy71Yu2XDeREEPy8abD4iPZbj11QNOhGUrE0U2quw0
	aOO3qfSCNLyY/P2ePCl6EMUFMHIUgsrYBcoQGpvsznduNisaF3SmXD+kzxYDQA4yMEBLnYzx5EQ
	Q==
X-Received: by 2002:a05:6820:198a:b0:69e:97bf:4756 with SMTP id 006d021491bc7-69eec7b8f0dmr1138577eaf.7.1781308204992;
        Fri, 12 Jun 2026 16:50:04 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:cb9a:87cc:1314:fef5? ([2600:8803:e7e4:500:cb9a:87cc:1314:fef5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69ed8575597sm2680424eaf.12.2026.06.12.16.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 16:50:03 -0700 (PDT)
Message-ID: <95291df3-c34b-40a4-ba73-813ccd4b9ef8@baylibre.com>
Date: Fri, 12 Jun 2026 18:50:01 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] iio: adc: Add TI ADS126X ADC family support
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuurtb@gmail.com,m:jic23@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38396-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ti.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF16C67D176

On 6/12/26 5:46 PM, Kurt Borja wrote:
> Hi all,
> 
> This series introduces support for TI ADS1262 and ADS1263 ADCs [1].
> These devices are very similar (if not the same), except ADS1263
> includes a secondary auxiliary ADC.
> 
> The main ADC has quite a few features supported the main driver
> (ti-ads1262), including:
> 
>   - Power management
>   - IIO direct and buffer modes
>   - Channel hot-reloading
>   - Internal or external oscillator
>   - Internal or external voltage reference
>   - Filter configuration
>   - Sensor bias configuration
>   - IDAC configuration
>   - Level-shift voltage configuration
>   - Manual calibration support
>   - GPIO controller capabilities
> 
> I plan to add these features to the main driver soon:
> 
>   - SPI offload support (38400 SPS turns out to be too high for some
>     systems)
>   - User triggered, automatic calibration (Datasheet 9.4.9)
> 
> Additionally, full support for the (less capable) auxiliary ADC is
> introduced by the auxiliary ti-ads1263-adc2 driver included in this
> series.
> 
> The auxiliary ADC operates almost completely independent of the main
> ADC. The only consideration that has to be taken for interoperability is
> when reading conversion data in direct mode (Datasheet 9.4.7.1), which
> happens only in buffer mode, when multiple channels are enabled.
> 
> When reading data in direct mode, all SPI activity is forbidden between
> the data-ready signal and the data retrieval. To achieve this a second
> mutex called xfer_lock was introduced to block SPI activity on the
> device.
> 
> This is one of the biggest drivers I've developed, so I hope the code
> and the comments are self-explainatory. If not, please let me know so I
> can clarify them.
> 
> As always, thanks for your reviews and help. Submitting upstream is
> always a great learning experience :)
> 
> [1] https://www.ti.com/lit/ds/symlink/ads1263.pdf
> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
> Kurt Borja (5):
>       dt-bindings: iio: adc: Add TI ADS126x ADC family
>       iio: adc: Add ti-ads1262 driver
>       iio: adc: ti-ads1262: Add GPIO controller support
>       iio: adc: ti-ads1262: Add calibration support
>       iio: adc: Add ti-ads1263-adc2 driver
> 
>  .../devicetree/bindings/iio/adc/ti,ads1262.yaml    |  308 +++
>  .../bindings/iio/adc/ti,ads1263-adc2.yaml          |   49 +
>  MAINTAINERS                                        |   10 +
>  drivers/iio/adc/Kconfig                            |   26 +
>  drivers/iio/adc/Makefile                           |    2 +
>  drivers/iio/adc/ti-ads1262.c                       | 2180 ++++++++++++++++++++
>  drivers/iio/adc/ti-ads1262.h                       |   39 +
>  drivers/iio/adc/ti-ads1263-adc2.c                  |  470 +++++
>  8 files changed, 3084 insertions(+)
> ---
> base-commit: ae696dfa47c30016cd429b9db5e70b259b8f509e
> change-id: 20251129-ads126x-fb6107505cae
> 

Hi Kurt,

I'm currently working on the TI ADS112C14 family of chips which
are functionally very similar (although have a bit of a different
register map).

I have some different ideas for the devicetree bindings that I
think will make it a bit more flexible. Given how similar the
chips are, I think we will want to align on how we do these (and
there was one more similar, and thankfully much simpler, TI ADC
driver submitted this week too!).

So rather that looking at your stuff too closely yet, I will send
what I have next week and we can compare notes then.



