Return-Path: <linux-gpio+bounces-33437-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JJBI7eKtWmO1gAAu9opvQ
	(envelope-from <linux-gpio+bounces-33437-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 17:20:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E635E28DDB1
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 17:20:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1ECE3025723
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 16:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FDF239E76;
	Sat, 14 Mar 2026 16:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UTlE6CIa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E166B3FBA7
	for <linux-gpio@vger.kernel.org>; Sat, 14 Mar 2026 16:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773505195; cv=none; b=G2gQwZr5I2U5q5uT5tHENDo87BevCIUTrtHZnbLdbSwA/JtmZWOzJvjTzRqVl/q8kc4zxbVCmexc5SJRYXmrZVx14sr+9oKYSx111JLewe+l7AwyTkjab9xnM9PliaNrMl+Dj8Uxrd9XUPsfiy720QaBZM7pSDtYtOQMew82P2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773505195; c=relaxed/simple;
	bh=KBkmFspCBI5UcLEf1cRd//2zKNdLHfEi9/AjCUQ/XiQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gDfm7t9vuQUsChyVH5KkihJarOdmwt8EJqtMH4fZxhwKlAd0He4Y8ALw8y3Zz3yaHGm8JbTLHirb8kY/K1ido+Y+gSAuYObJeQtMyTBRmkVO7FskVQNtCPW1f+ayZaD1szt36VjokoPeeFDFXuQwyHL/kT0fnUhissaYoBco8Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UTlE6CIa; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4043b909ed4so2035751fac.3
        for <linux-gpio@vger.kernel.org>; Sat, 14 Mar 2026 09:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773505193; x=1774109993; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KBkmFspCBI5UcLEf1cRd//2zKNdLHfEi9/AjCUQ/XiQ=;
        b=UTlE6CIakS2eeEyYdefN9JLGIAeYhImg5giLVCU1Jwn1SkdIs2yf9jTYEC3DucLtNP
         +4CtMvlqRY05xeMY9671JeIYMAHlL9UnjTq04Xw6NGdprq0U9qR1bXZKQg6Eu+sLf2/D
         HsD+apRTHc11ijvEOk3MfRcpkJTDnQAsaVUsMID6lu4qUm+8wc3KW3HfAjaWNiRrdM0C
         AoLf5KyL59/iBXG8HiwayLfUHaST8neln7L9cZvg5jExoNUkjR5j27PQmejhHLJXScil
         +vO2pfiAg3VdCKMVkDQveenO4TZq9FoBA/pi6WKthvseITlnsALJrCQQjdtTbBMz/Yty
         ukUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773505193; x=1774109993;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KBkmFspCBI5UcLEf1cRd//2zKNdLHfEi9/AjCUQ/XiQ=;
        b=aSJhFdIf70HktC/dnGrzyiJkzX0h+XK2cl3+z52X1kuYNtOpiTeF8s1+hOA/UzHycT
         UH+DZJbJB+fNxbp3pp1jVgwhlS8eyJRonComBQpo09/FWpmM6QQvCtAzr4ohpE5/oR7n
         pWPR7w6g3qS3gKMKjVamD2jagLNeGi8zk04NITxsm3+ka5wj4Of15kQdASw4b4koCWHB
         PlF9qQVpqCN+ABvcqhrtnkaOMKhiIYjPsWrzCQCAkoiebShfGx29KgI0QGQuieqXSZyy
         lIbm0YrujZ6DDHZ2fDPeqHGYaCUOnc7CZkAF2/KCPvxytPTz5fy1ghumn1cACM5QhhxK
         RjsA==
X-Forwarded-Encrypted: i=1; AJvYcCUTsQqriK0frIe+gCo9XVoTNb1lE+ymYp82Tm/gPRCUXFqRngcxu30+EPzrM3MNHMAewt5Md93ZZxlm@vger.kernel.org
X-Gm-Message-State: AOJu0YwK5suMGMZbRRm5x4yQDpUeGr+VmV2pnJlRyjQhsQbTEJwfGE0s
	znWVZx1P63bVtE8xTLHz3zsOaqJCF9l/gfDduBd1rFbDvYy3h2rJLpko4l1ZoR37nP8=
X-Gm-Gg: ATEYQzwgIB73T8nYQ8N2VTo/71cuEPwzl+8hNjnu6J41Dc2YgtyzumWEDtLu+vOzpAF
	p9kXO9abW2VD3x40GR1xUPmLzy7uRpLasJQ4K24s3iQSsKyXX4xDfHYLlpPWDIBBCMyUkbkc3Yc
	YkusB8mUdT61NlVDlSLIbFaQsb8PdrQq0kd860Lnd+XJn6qj+hmBWLV85k6s2YX4OrzSOjNIY/h
	+FpJ8wi2SOuBM0+lj3wf9JmSBJlPZMgSGFXG69J0+z6HFWG20CBPERcs52u0zlaSg2/bjNk88w8
	mAG1R+df33XTw4z5qpmOgAQ130zvjjuuGq8VS1E9258ICcNTbSdkuy68t/4OrKG3ZhjzVMC20w2
	PSNie7AKxcU3qlABbid5gfbMUNOYJ0DvM7z+UjPr8bCyMFlS6rRgw7jlWH5xw8zF4HICmvbtKmk
	DWfPwaNtvjOGFqvqQJ6tF9MXYZUX/H8e9jo0ItUM76a029Cxwvk/jDr+MoJEYh0LPb0W8j7h2ns
	Q==
X-Received: by 2002:a05:6870:510d:b0:417:1165:cf2e with SMTP id 586e51a60fabf-417b917197amr4017421fac.6.1773505192866;
        Sat, 14 Mar 2026 09:19:52 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:14a9:db6c:e65a:4287? ([2600:8803:e7e4:500:14a9:db6c:e65a:4287])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e6ae0e3sm11940193fac.16.2026.03.14.09.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 09:19:52 -0700 (PDT)
Message-ID: <c158a12d-4855-40e7-9581-8078be4237fa@baylibre.com>
Date: Sat, 14 Mar 2026 11:19:51 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: iio: adc: add bindings for AD4691
 family
From: David Lechner <dlechner@baylibre.com>
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
 <a1824f39-3925-4e94-ac98-52dcdfbaa0d2@baylibre.com>
Content-Language: en-US
In-Reply-To: <a1824f39-3925-4e94-ac98-52dcdfbaa0d2@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33437-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[analog.com,metafoo.de,kernel.org,gmail.com,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre.com:mid,baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: E635E28DDB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/26 10:29 AM, David Lechner wrote:
> On 3/13/26 5:07 AM, Radu Sabau via B4 Relay wrote:
>> From: Radu Sabau <radu.sabau@analog.com>
>>
>> Add DT bindings for the Analog Devices AD4691 family of multichannel
>> SAR ADCs (AD4691, AD4692, AD4693, AD4694).
>>

...

>> +
>> +properties:

More properties we can add: gpio-controller and #gpio-cells

It doesn't matter if the driver implements it or not. We want the
bindings to be as complete as possible and we know these are the
correct properties for ADCs with GPIOs.



