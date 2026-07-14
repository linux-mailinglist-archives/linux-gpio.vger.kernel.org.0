Return-Path: <linux-gpio+bounces-40052-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rHnXJR0ZVmquzAAAu9opvQ
	(envelope-from <linux-gpio+bounces-40052-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 13:10:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4467753C70
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 13:10:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ECIQn36r;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40052-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40052-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBF6332384B4
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 11:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5543815E8;
	Tue, 14 Jul 2026 11:03:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988AA37757A
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 11:03:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784027027; cv=none; b=qQscwnvdmIpoS8FIQAJ3qxNHsEiBOoEI+uFm/m2WpvrNJ+VHJ6ZDcEgh/QhTYffqV8P5Z6462c8pw4u+bSvPqeikmtj5ckzTZhvsQMr6w+HyYaAWUPXN861eBdwFvJCAyc4VoOzTtACsvd8e3SbmMu3BHIvxGchBbgMNNFG28RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784027027; c=relaxed/simple;
	bh=nRXqOwRrDIdwQBvgebmXi2daQrVI9gYsamm/tsW5/rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dnSKMdg+gHWFbV+8Q0h4KxZi14IQoQu2ZOthXpeLYjpWVe57faIP8kqwtJtwhrJNOl74yADV8B3XxNLcuIKVUviCxdNN6VVxZKBb0Nq5l40B9R4zaX3GWbdB3HMedROwOGZjhjYT5W2GX48UxNi5+5U4XIipekSIWgklk4luAWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECIQn36r; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so29570535e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 04:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784027024; x=1784631824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUlBoKh9V23To8DEkY2V3YxhmQz/dU01CR+2A2ONytA=;
        b=ECIQn36rKfAxtMeY16RzqQa2S/TzZW5eGdbyS27dWoSjIQqWZvrHvlgNu1HtOUMh/h
         sUkTfGfgcuBnMeAuSXa18C2jeqLqwU3fW5sYs5hNMpzkDr+McUZlF5N39Coo9QXc0Uvk
         81W92cneSKpBnQypdzDxVpqi9ePWuTMnotRTaiYwRJFNOYu1D9nnMQmsy4siyJ2G3jQ2
         NSbID6NPz5Of38OFEy0AFJf5UusSn0IQ6yhe+5e6NVAUaFTarK+M8xevnQAXLbTiXYjY
         RWGUoGgDrgbsj15kz7oyJOZIXniqa2W3GLcAVzAAlOe8LIBHr0NqwDOdQ7JMuUv51BnW
         Mijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784027024; x=1784631824;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUlBoKh9V23To8DEkY2V3YxhmQz/dU01CR+2A2ONytA=;
        b=k5atqwT0shIukdcuI/nOIMxWnXGiYHw9h1OZqc1U1gtz2MAq0kSa1tFwOQDoSdpkmR
         rr4U2bjc7GVKl6hccQsTyfSHKaeE2bImeBih0zoLGuqW1kEemwiYIfCBRw9fU3a7XD+X
         Hrb+A4o5Z+jdpFI1CTSdnAJpa7xo5yt9Zx/4iG5yNlLnHd9xyp+/F0ElHv09Vf8d8m2A
         D4V+rwvNytDnRcP4hG9ENEqp2eJ7BqzZgbz4SQYZKFOMOhc4W0usiSnBMzDCBQUqEooC
         7bT6K+3ZqhqqrsynWAVOKjTkkxcz8h0DUk0QVZxJ5cLtqlxKlqox+ePpl/T4tBTXAKGt
         mK9w==
X-Forwarded-Encrypted: i=1; AHgh+RrSG9x2w3U6bJrOWcITA+uomYRBY0pvUWQO5n4ovZ3BFVMn+TXLrmX62h458TkN7pxeU1rzt6L7XXh2@vger.kernel.org
X-Gm-Message-State: AOJu0YwjWntXmBp8aw89ZS/04XTebOOothfibP6cD8HnNzhMoe/17iNL
	d3AyrKgh8+zWN3St7MaUR9teXJ/8y5gebHCd6sWH2vSoGeDCtk/sfIbV
X-Gm-Gg: AfdE7clLWvaN1ODKxkV6oBg18KQBmvOH0Cy3m2BxUP6rUzck8tPUiLL3ty5XVwalSYg
	amfP2T4Dz/U6v4QTvLnwrYs8rVaG6ZaCfgWkuCq/vWtImLX7oaV7kzpue9zduzY9dg4Bd5ZBBFE
	pd1sU9cHpkMwaA4AMvyW9EvefKZGSOFISAFKhwqsO3KuINiKYsxelk2ve8ZBsacxb0zJsA8exVr
	K1ohefji27+Z5OnEe+EVRL+cMU+9j9H/rUQ+a9Qzgz+jEz1e2OWebtjof6Hf5FHcS4o1pZDn69f
	ZCsEsZAAYuvuuWvUhAf+HKrXInklRFSPGt9GkdxE50+y74470nPK92Md96vXI7o0fm9EmuEmu1c
	wEMYJAWLh8hfpLqrV/hYQ4fpkQRaFbyb6S6fkvlWyFPmqT/UIFky7Fk7q/M3kZb8MA8eLurCcik
	bq+SkEDV9Qh/SJvNA0yfhJZ8q7jTnPiD+n3JFapyZW+gmCNqi9CLfhTTVv2B0M79l/
X-Received: by 2002:a05:600c:528e:b0:493:edc2:98ab with SMTP id 5b1f17b1804b1-495389cc4bemr20361535e9.28.1784027023678;
        Tue, 14 Jul 2026 04:03:43 -0700 (PDT)
Received: from ?IPV6:2a02:3033:600:7200:8c5:6bb4:871f:52ad? ([2a02:3033:600:7200:8c5:6bb4:871f:52ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49510c8e220sm57914405e9.15.2026.07.14.04.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 04:03:42 -0700 (PDT)
Message-ID: <1e353a66-3543-4a6f-91b6-d5e8524d9754@gmail.com>
Date: Tue, 14 Jul 2026 13:03:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] gpio: ad7768: Add AD7768 GPIO auxiliary driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Janani Sunil <janani.sunil@analog.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux@analog.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
 <20260709-ad7768-driver-v1-5-44e1194fd96a@analog.com>
 <ak-AcfH-Igsa_ksV@ashevche-desk.local>
Content-Language: en-US
From: Janani Sunil <jananisunil.dev@gmail.com>
In-Reply-To: <ak-AcfH-Igsa_ksV@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-40052-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jananisunildev@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:janani.sunil@analog.com,m:nuno.sa@analog.com,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:olivier.moysan@foss.st.com,m:p.zabel@pengutronix.de,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jananisunildev@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4467753C70


On 7/9/26 13:05, Andy Shevchenko wrote:
> On Thu, Jul 09, 2026 at 10:50:16AM +0200, Janani Sunil wrote:
>> The AD7768/AD7768-4 ADC exposes 5 general-purpose I/O pins that can be
>> independently configured as inputs or outputs. Add an auxiliary bus driver
>> to expose these pins as a GPIO chip, registered by the parent IIO driver.
>>
>> The driver uses the parent's regmap for register access and delegates
>> runtime power management to the parent device.
>> +	if (ret)
>> +		return ret;
>> +
>> +	return regmap_update_bits(st->regmap, AD7768_REG_GPIO_CONTROL,
>> +				  BIT(offset), AD7768_GPIO_INPUT);
>> +}
> ...
>
> So, I briefly looked at the implementation and I don't understand why
> gpio-regmap can't be used. Do you need PM runtime there? It can be
> done for all (if absent).
>
> ...

gpio-regmap does not naturally model the AD7768's direction dependent readback behavior.
On this device, GPIO Write data (0x0F) holds the latched output values and the GPIO Read Data (0x10) reads the logic input level only when the pins are configured as inputs. Using the generic gpio-regmap would always read 0x10 including output GPIOs.
The custom implementation preserves the device specific behavior.

Best Regards,
Janani Sunil


