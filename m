Return-Path: <linux-gpio+bounces-34663-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEANOm4f0WmmFgcAu9opvQ
	(envelope-from <linux-gpio+bounces-34663-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Apr 2026 16:25:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F0939B5A4
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Apr 2026 16:25:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D907430058C8
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Apr 2026 14:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CE22C11DF;
	Sat,  4 Apr 2026 14:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="T+tHPtq/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4FF2874FA
	for <linux-gpio@vger.kernel.org>; Sat,  4 Apr 2026 14:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775312748; cv=none; b=jfNe6V9bjIhS5LTTfNLgCRvn4Y3A09Ju5CsDa/EFwcIF8D9FLp4sF7VlhS2PYSAuFFahsLG/xcF3V3QcZkFz133FUx4GDXzkD/BqTDvoYE0lq8Y6uXX4NUVEAwSG1x6KpFdqOj0KvaqeTJ1Gg7QhqhE/t20slz53mEyK/OGw5S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775312748; c=relaxed/simple;
	bh=YDHQQIkUtIMA5RuVXX+SK+ZopnAIz0IH3aZAqaHI9pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awrcqZbuehkfW16guhD5w5k9MlRie7ysVimswv2mpZTLXk5YrmPzz2y4Vai+FTJ6Fsu2rtsMCvs/q2IUjAitoIMWGREe+honJQuPXdoHIdk3ZOXjhTIV4kiBXc4bRv/osVaZJ17emp0RWWN0KeaZ9x25xLDLGx4ikwyfg95gMrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=T+tHPtq/; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4670676ba03so943824b6e.1
        for <linux-gpio@vger.kernel.org>; Sat, 04 Apr 2026 07:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775312745; x=1775917545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DG8ZLzSkLL5KxGbpBt+cYKmm52XpYZesZWRmcIu235A=;
        b=T+tHPtq/ZJmrz/x0hon6ubvef3dyaaHhk1GRRXgW8y8HepFtZGYjfJcUQczd3MEkSt
         2Agviun9Cf5EYKtk9j0IqUraHya5+cWg7jpTqs6odctBlL2Zz+DNQ/uNqQMe9wgH193o
         z3zeYYVklZaMQki3yiMddob47zunpO6AWKU8n5PWDQ6LxULv6X3f1wcyghb+It/+xjWX
         z9PNVkRx7eWxmjJNLwRnRuJlliHjZbQNuYTor2Ij+hbvfTGn47XIa2O2GDia9HEi0TFp
         QBOE28LuVqSi18lbs2VxGAN1lYamyOifHSPJ/JYonO7K4FYFJ/G3E8jlIr/y0xjtfZ+C
         UNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775312745; x=1775917545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DG8ZLzSkLL5KxGbpBt+cYKmm52XpYZesZWRmcIu235A=;
        b=qUMHB/2EgTQYULU5rZZUdlvY2/0Juf5V/pBS1/D0Fm6HT0RsNtsiw+9dBTk2DmhZfG
         drFmCRbbBbNOsT/ssZ7uLx5IPj89hUDr/RSfSYl9ZVRGg4Utk8ui5dIhc6VhvLUv0uVq
         E4iETNgFE97o2tDCeO/grMKgMSM8uSKWRvq6wNk35/hXuI8OW89EnPpflUs6xs1TmXBH
         hWNrBM9sxzUVqk9fR4XpX2AkxC/pUK0GMfR1A7FFl6v0pmdJlepeb/JHVMjpDKuXRb9t
         4ZDpjC/31YRUbgK/51Jl6tlhOBc9IREsdT3HbD3vKZvdP/lD03HlzN2GIFbA/ToGWMET
         /Zzg==
X-Forwarded-Encrypted: i=1; AJvYcCVGVrZW0FJWyK+BCKhF3nnWi1GOJZQNaDpkUUe2yhVzKOkrOeJ/R5yUkeas+cYyHsaIPHCgrFGNOOsS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr8nRKo0slirPVf+cxhvQjVFHiPGAf+SnhnGw0bVy9ec64Aqf6
	V/xRI1roYJBLXfyn6D5BHtVIwF7cHpudVmEg/Gbt2SWoByDqLB+Kd2i7lPd98heAEy4=
X-Gm-Gg: AeBDievYlw+1LEUK6YhSbob3hXK8aeq5am6KwI6M+XP6Sq6eNOegzU9Pz9w8dVOwa7E
	JLGegwyokCjRQMMPRuRcPGaNh3ev4N3vbkI8D2w45hQQWdTfL+Fw2RxT8rHPUvnkXNOPO8XbuMB
	FVgNU4YmkeG53GF5aTAH2+6L0DqbOElbzCOkECooLv+UKrRmWCBT9cph/AuNmy/HwmICCDIj3DV
	UN7gM8oqk5P+Yh1+amFHw9IKM7x9/lX2bCU1ok+Bo+VNh4fn8H+vooM0P0CvZe82pcyyjn0SEdA
	byR/52NHbSoHHMifi/zOBpyOrCzoB8ATQRTqE6Ly3jpzIzyM+gtIaHqfLmJh6XFZ+O9B8PA+boJ
	Mam2XkWp+f3GczNw8LQ/1Dpqa2CxKIjPKF9h2o0AqlUcBWYfZDErdi8LKDf4q8+/1USX98UHIGh
	GjMKbxGNDPZi8YKXEGyee4u0FQcZf1Dy58PY0bAOCh5PdAvkd4Gz+OLkHYmFsjezsuQzX4t1VNv
	A==
X-Received: by 2002:a05:6808:1206:b0:46a:8dd5:3a4f with SMTP id 5614622812f47-46ef5002b8dmr3010289b6e.5.1775312744846;
        Sat, 04 Apr 2026 07:25:44 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:e14e:bcc6:3f95:26eb? ([2600:8803:e7e4:500:e14e:bcc6:3f95:26eb])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46f0f4e16a9sm2936944b6e.4.2026.04.04.07.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 07:25:43 -0700 (PDT)
Message-ID: <e4ddf44e-3189-4d4a-9184-13b0560195dd@baylibre.com>
Date: Sat, 4 Apr 2026 09:25:41 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] iio: adc: ad4691: add initial driver for AD4691
 family
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
References: <20260403-ad4692-multichannel-sar-adc-driver-v6-0-fa2a01a57c4e@analog.com>
 <20260403-ad4692-multichannel-sar-adc-driver-v6-2-fa2a01a57c4e@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260403-ad4692-multichannel-sar-adc-driver-v6-2-fa2a01a57c4e@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34663-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[analog.com,metafoo.de,kernel.org,gmail.com,pengutronix.de,lwn.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 78F0939B5A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 6:03 AM, Radu Sabau via B4 Relay wrote:
> From: Radu Sabau <radu.sabau@analog.com>
> 
> Add support for the Analog Devices AD4691 family of high-speed,
> low-power multichannel SAR ADCs: AD4691 (16-ch, 500 kSPS),
> AD4692 (16-ch, 1 MSPS), AD4693 (8-ch, 500 kSPS) and
> AD4694 (8-ch, 1 MSPS).
> 
> The driver implements a custom regmap layer over raw SPI to handle the
> device's mixed 1/2/3/4-byte register widths and uses the standard IIO
> read_raw/write_raw interface for single-channel reads.
> 
> The chip idles in Autonomous Mode so that single-shot read_raw can use
> the internal oscillator without disturbing the hardware configuration.
> 
> Three voltage supply domains are managed: avdd (required), vio, and a
> reference supply on either the REF pin (ref-supply, external buffer)
> or the REFIN pin (refin-supply, uses the on-chip reference buffer;
> REFBUF_EN is set accordingly). Hardware reset is performed via
> the reset controller framework; a software reset through SPI_CONFIG_A
> is used as fallback when no hardware reset is available.
> 
> Accumulator channel masking for single-shot reads uses ACC_MASK_REG via
> an ADDR_DESCENDING SPI write, which covers both mask bytes in a single
> 16-bit transfer.
> 
> Signed-off-by: Radu Sabau <radu.sabau@analog.com>
> ---
This patch looks in good shape. Although I wouldn't mind using
MEGA/MICRO, etc. more in numbers with more than 3 or 4 zeros.

Reviewed-by: David Lechner <dlechner@baylibre.com>



