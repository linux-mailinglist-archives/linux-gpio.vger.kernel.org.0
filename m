Return-Path: <linux-gpio+bounces-32740-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFqOOxNzrGkQpwEAu9opvQ
	(envelope-from <linux-gpio+bounces-32740-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 19:48:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9891922D45D
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 19:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83F993019068
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 18:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555E238BF99;
	Sat,  7 Mar 2026 18:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yUgq4Yl+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED7A1ADC83
	for <linux-gpio@vger.kernel.org>; Sat,  7 Mar 2026 18:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772909327; cv=none; b=inp/qBKfUWUKDxv9cCMOsc45EldPTTdfE2BqEmiYIXzhbJol7wNaaeNN8xF+KeH+AIYLJBrdE1Nc4vHYfJx3NAoe/jH5xVAU0QQCw2sJH3bYczFJsezr+5s6MSScOkZAtlITzMdi6kcGzZA0PrK8zUjLMczgVLQjD3EWeypztIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772909327; c=relaxed/simple;
	bh=bvfLL6leUe4v0YQLR29E1NV0KASf+WoG0ivWe/d+DYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ozaN3cuUoeAYD5CnFQdZia1r2BfWMfSI3P39iqHhuudX6ECV+jAEUJYdCoRmNRZ5Hm2iwPCQXP6sfJwdCkNSd3xFnqqV3ymN8nAwXe/FUePIbjldnNEJ4dMgX+hMrFkdWANJ+UjHsXLEcUttwU0Vn5JJCpplSORNbFS2OJZbuGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yUgq4Yl+; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d596a5be31so9248614a34.3
        for <linux-gpio@vger.kernel.org>; Sat, 07 Mar 2026 10:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772909323; x=1773514123; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QlZl3jF6Nh0Vyp4ww6yN7e366IjMVaugVNe/3eEWvKY=;
        b=yUgq4Yl+l5N9hLx0mBM11VFPHyeNqV7JRkiWhEj6Uycm35A75C2tNpO3R58XL99OgN
         ZOc/oDSYY7aWwegtq/9S/3K+g+Sr6aYeeuBRhw8oJlZs0RlkoDXgV39W9PUWUX3kN3MX
         z4XkS/HhYTS2u8DaGYAxRIDKaMig8H4MPcympxkK7IK76k2bz1ySiGYXFe/fIWYOqO/t
         sd5Oe2ewRa5lUyhuj9loPeXdgavZ4QMnPS4/LXM2Ic1MF28iBc6tCv9jNEEDdCPIiWwT
         Zpczsz8lb5xjIpeJK8OCwFCuosC57RoDriTwIuZ8ToF/typXPt/WfFbxWOD9RNixh0bJ
         TmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772909323; x=1773514123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlZl3jF6Nh0Vyp4ww6yN7e366IjMVaugVNe/3eEWvKY=;
        b=uoWacfPu4LI1chQVATDYefSisJApUZngKEZ4nLFErAhvsyWhHdOHgSfhh6jlXyVRUN
         TMDyGtnqRaQBALH8JEAqWSmLtSNw9klf94iiL5ReqQOcpX/YeSaGjJHhBQVAXR+Uk72P
         u5VlkFFft6G0e0QKSgBknKTG+4mYWjaPuRNRVydLFprjVB7jH9/nN4+G2q8enZk9V0Tg
         Nvq8kDRlvonlzum0AigWg8ENIMHwUwP3MjQCUHpZLEjXf/c7XU5mFQu7p7fOjhfiPUrR
         kruNACWQSuPMtOLn58AyFJr/1g9fBKx8ORPKWDX8ogxIHedwgPPM0rCvWaTwOuDCngQb
         ijDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHvrHpaJ1ZOUW3FTVVKmJP+1rZbr7/jROEW3+5EmUcZ74H/li3UTSXPrMHBA9cqolP92wutWnNwEWT@vger.kernel.org
X-Gm-Message-State: AOJu0YzgW8+DvICQj4DFlVFjsZVCPAX/6z8ywyQrEfwiAEWmW//CiFGX
	8RNCkittq7HbKHjaylPnrJ/2uFH0MFk2tq676EMNQs4QGD7Tnl70qFOtOUWD5eOyt3M=
X-Gm-Gg: ATEYQzxImYrp8pP2XM5ndV8oXscFFqcGCpKsl5lbsy92NXHTPICALCDekaHCGsIk87u
	FfB3swqkyloyNXBHBJxj9+ZnM8VSFvms/uhHfkYwoxQwdFVNMG80xg1n5WgkMx0RkCVOkZynLle
	8YKiIAE5azXlxR6xZeFkal0ms7DFJxAcLPDnrEFImpHbN33PcSnqJH50nC23XhDF3pUHiEj3/og
	OU5qV1+ea/RyYzk4VJMuNQXCKw18MDX2caxzwPi17aa5CuRicjkHzc9f4GU4eWv1Nm8lVUc18Mk
	4kDzqsEhC5xfGEkSo+evzviEv6XoSN4Ur8/2PcSH10gjNtQMmP7edg0bvaWt71LYvlpXcsoN7v2
	aVcuBLFVFkX2tECVOkw0iFVOhcMMDuwYTUfJjLGyt2BTei1Mxl+TCRcQg4DfGNMbTn1pMUJtzFW
	OTqleL3OEFDM3jMKMl5MmDTaynmvAZsfjAqLUzz0jm92LxEHL76theL0Y6d5myE0q2Gax4fW3bd
	Q==
X-Received: by 2002:a05:6808:830d:b0:466:ee4c:6f13 with SMTP id 5614622812f47-466ee4cb6a3mr844147b6e.2.1772909322858;
        Sat, 07 Mar 2026 10:48:42 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:cccf:5174:fa72:c520? ([2600:8803:e7e4:500:cccf:5174:fa72:c520])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-466df96b093sm2925084b6e.5.2026.03.07.10.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 10:48:42 -0800 (PST)
Message-ID: <08717cd6-a732-4f06-a6f1-8cbdaa755b78@baylibre.com>
Date: Sat, 7 Mar 2026 12:48:39 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: iio: adc: add bindings for AD4691 family
To: "Sabau, Radu bogdan" <Radu.Sabau@analog.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Radu Sabau via B4 Relay <devnull+radu.sabau.analog.com@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 "Hennerich, Michael" <Michael.Hennerich@analog.com>,
 "Sa, Nuno" <Nuno.Sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <20260305-ad4692-multichannel-sar-adc-driver-v1-0-336229a8dcc7@analog.com>
 <20260305-ad4692-multichannel-sar-adc-driver-v1-1-336229a8dcc7@analog.com>
 <20260305174559.1ded5173@jic23-huawei>
 <LV9PR03MB84149F32D4CABA4D2827D85BF77AA@LV9PR03MB8414.namprd03.prod.outlook.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <LV9PR03MB84149F32D4CABA4D2827D85BF77AA@LV9PR03MB8414.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9891922D45D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[metafoo.de,analog.com,kernel.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[baylibre.com];
	TAGGED_FROM(0.00)[bounces-32740-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,radu.sabau.analog.com,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 3/6/26 5:55 AM, Sabau, Radu bogdan wrote:
> 
> 
>> -----Original Message-----
>> From: Jonathan Cameron <jic23@kernel.org>
>> Sent: Thursday, March 5, 2026 7:46 PM
>> To: Radu Sabau via B4 Relay <devnull+radu.sabau.analog.com@kernel.org>
>> Cc: Sabau, Radu bogdan <Radu.Sabau@analog.com>; Lars-Peter Clausen <lars@metafoo.de>; Hennerich, Michael
>> <Michael.Hennerich@analog.com>; David Lechner <dlechner@baylibre.com>; Sa, Nuno <Nuno.Sa@analog.com>; Andy Shevchenko
>> <andy@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
>> Uwe Kleine-König <ukleinek@kernel.org>; Liam Girdwood <lgirdwood@gmail.com>; Mark Brown <broonie@kernel.org>; Linus Walleij
>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; linux-iio@vger.kernel.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-pwm@vger.kernel.org; linux-gpio@vger.kernel.org
>> Subject: Re: [PATCH 1/4] dt-bindings: iio: adc: add bindings for AD4691 family
>>
>> [External]
>>
>> On Thu, 05 Mar 2026 14:23:27 +0200
>> Radu Sabau via B4 Relay <devnull+radu.sabau.analog.com@kernel.org> wrote:
>>
>>> From: Radu Sabau <radu.sabau@analog.com>
>>>
>>> Add YAML bindings and dt-bindings header for the Analog Devices AD4691
>>> family of multichannel SAR ADCs (AD4691, AD4692, AD4693, AD4694).
>>>
>>> The binding describes five operating modes selectable via the
>>> adi,spi-mode property, optional PWM/clock for CNV Clock and CNV Burst
>>> modes, GPIO pins, voltage supplies and the trigger-source interface for
>>> SPI Engine offload operation.
>>>
>>> Signed-off-by: Radu Sabau <radu.sabau@analog.com>
>>
>> Hi Radu, I'm going to focus on mode... Mostly because things called
>> mode are usually a sign of mixing up different aspects of the board
>> design...
>>
> Hi Jonathan, Krysztof,
> 
> Thank you guys so much for your review.
> 
> Regarding 'mode', I agree that it should be something that could be modified
> at run-time, especially since all register modes (CNV_CLOCK, CNV_BURST,
> AUTONOMOUS and SPI_BURST) rely on the same principles of reading the
> ADC result from the registers, the main difference being that PWM on the
> CNV pin is required for CNV_CLOCK and CNV_BURST, but the board design
> stays the same. Perhaps this PWM can be initialized at start-time and only
> be used when CNV modes are being used. This would mean mode can
> become an IIO attribute that could be set by the user at run-time.

More likely, it would be two different ways of doing a buffered read,
so maybe two different buffers? Or just pick the "best" one and only
implement that mode.

> 
> However for MANUAL, modifications of jumper resistors on the physical
> board is required for proper functionality, since the CNV pin needs to be
> tied to CS in this mode. Would it be preferred if bindings would have a
> 'register-mode' attribute (the name could be better) which can have values
> like 1(register modes are used) and 1(manual mode is used), and for
> register modes, have a global IIO attribute that can switch between
> them?
> 

The binding should describe how the chip is wired up. So rather than thinking
about modes, try thinking in terms of connections. Based on what the devicetree
says is connected, the driver can then infer which modes are actually possible.

Bringing back some context that was trimmed:

+  adi,spi-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3, 4]
+    description: |
+      Selects the ADC operating mode:
+        0 - CNV Clock Mode: External PWM drives CNV pin, samples at PWM rate.
+        1 - CNV Burst Mode: PWM triggers burst cycles, internal oscillator
+            drives conversions within each burst.
+        2 - Autonomous Mode: Internal oscillator drives conversions, software
+            starts/stops via register write.
+        3 - SPI Burst Mode: Similar to Autonomous Mode but optimized for
+            SPI burst reads.
+        4 - Manual Mode: CNV is directly tied to SPI CS. Each SPI transfer
+            triggers a conversion and returns previous result (pipelined).


It sounds like there are 3 ways that the CNV pin could be wired up:

1. Wired to PWM
2. Not connected
3. Wired to CS

On some other chips we've seen where CNV could be wired up different ways,
"not connected" was not an option. In those cases, we could infer that if
that no other properties indicated what CNV was connected to, then we would
assume CNV was connected to SPI CS.

In this case, if "not connected" is an option, we might need a bool/flag
property adi,cnv-is-cs to describe that the CNV pin is wired to the CS pin.
And we already have the pwms property to know when CNV is connected to a
PWM.


> Please let me know your thoughts on this before addressing the other
> Comments and preparing other patches.
> 
> Best regards,
> Radu
> 

