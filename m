Return-Path: <linux-gpio+bounces-32826-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFn0MNParmm/JQIAu9opvQ
	(envelope-from <linux-gpio+bounces-32826-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 15:36:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B17123A9AD
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 15:36:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28FEA302A7A7
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 14:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FCAC3D3488;
	Mon,  9 Mar 2026 14:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GEXiLin1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5AA3CE49E
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 14:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773066899; cv=none; b=jnew/csNAzBdVpTrAabh0dYT/O97dVtt3LQmnsXzlEYpe/YwiZaKCDlcoSLnZy+59TjUdEvbj0Jwy8PvMxbP8IWVYO60JmRWipxiZvHAxmrFp0eP0++UJL3oiKUua0UvvQXm0hjjwsw3O5/c+WuZUqExcjF32UPI+bcv8KtBJgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773066899; c=relaxed/simple;
	bh=dNwjQS4Ze5AVUXxTNwwtAMEcTV30AgWPK58E9Q8lvj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QtaAmHjuRlfRIX+XwaXTBU+7L/BQIpDvyfRKqnNueMCSSUf+e5ubc+826tV2WlsLLt++dOyNj6TVyLnlVghlOhYWW34FBFNcpCImwn7ieD1kLWZCsxAgd0+g3JUZ1twBNHWwDKNZ6lIsfeQVIyfx4b/zIaXDF4NL2+TlFe/lEu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GEXiLin1; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4042fe53946so2691867fac.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 07:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773066896; x=1773671696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B/2nZ3AXN7tfnpTcvPfto5djcQ417TUS0Z4ffFdUirY=;
        b=GEXiLin1J3e1ijArnxDfLr/g0ciKQbmfyg6/Hx21Jq+d0zHsSMrywyK4IrniHzFKMl
         HrMxakK6BqyUtmSCAGTiLCcqixpocqZPiu8vAyzcjU2r1NcnCCcq9uA5sVwKbaT4Col1
         S7ZSZMPMv8M2+QTla/MR/LwFt6Lqi3U0Dh0L77vmX7KrsORbt5Lt8K6JVfZCrnhnx/EN
         g5KTjoMsHJHQzK4Kik87ILDrU7YKxJ4apuiZ1mX+KK0gc3MvdwDg2TDdrGP8jC7dzkDg
         7nVSnxVJf4bOdYk5oskF8pOZYTnlTv7C+UAyZwEsqF49YMjRAzWwZQgrkz3Tqu4mGnGH
         eYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773066896; x=1773671696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/2nZ3AXN7tfnpTcvPfto5djcQ417TUS0Z4ffFdUirY=;
        b=jq98txFW5xORZPBPyiW/IsRY1dDH2Yvdlb8BVP68P0O9PVdTeICsdAvmQzzmZiQZ0c
         l8iRCUQPhwgYEm4E4niSzpCpPgnXQJyafb4CPVzZZLoTjO28MC2aCX6L702V22AaHu82
         K3y0kkx45KnDcJ/86InpRq58WgWJurG4qUEfmzYq2uAC7T5Rt1hT98EW1+f/KX9Rqvog
         JcAN/JemVK8HjFhiMMtBOtvSfpNyJBBXfrGPX+ZBFhXeFxLY4TWwHuuhDP8rA7upXTaK
         a+uoa8ED37nk80psElm27MlezhZWOlUIWTERv0mcWKDyy2vEnkoXhsGM54pnizkodHBN
         wG2w==
X-Forwarded-Encrypted: i=1; AJvYcCVCj5IV6PFavndZoWAYOV47ZS1inhxCX07KQ0kTu/DQwDV7W/JV4PEkIFO4f0UtPy6v+JRwcWM+0dW6@vger.kernel.org
X-Gm-Message-State: AOJu0YxFJDmqtPffZxqSA/v1J34zTclLJyDsH+unJMrcpNmlUZVLs6DT
	GV18RNfNkUt+HI8B7aeN9y/K4Bup4PPkV0Wzc5otB0IsRIzTy31mWliRrMF4WO3qFIw=
X-Gm-Gg: ATEYQzx0WBT8sEyn3Ly1lE9hKlj2knDN9TNtrYtPDw5utRJEFr/gQHrE57wb1uRKsQm
	Rb3KPWoiLgIWo7R/IbmSLE21nLmIh7Wk+KbopaqJd8mWlytI5OZER1gXavBAairwoDV5WNTuosR
	2xQYU+YaRvfhmXodFZvsCaQhNdh+CFwgThVXk7lvM6mwDCrSkB8HMeev8IGfNSzLU3wL68A/trI
	9VyToAb12DgqIf6GhR6eYsn7bDPYmDRb8jo2M40kQ0tq264SjW995kiH2V0FXOITotjhyxYOuqp
	9aHlxZvOU6cy/GlXkkgat3PDfZzGSuDpCw/sXRaSOklanG++pgVgQH7DAXPDH566VxoTADEE1Wk
	3+/W1XUe/cl8xGsfrcKkijCVQtxyELgxINKqH+WZN9djhHwaG9Nj3tcsXEIuy0vtItCN/So8ziw
	CGEyh4EdbFgVE1dhUlvXbojj48zzG+5b1J2LhShG3M1sv987h/E6JvbfdEoyUg4CteVwXt
X-Received: by 2002:a05:6870:8a21:b0:404:263b:9da1 with SMTP id 586e51a60fabf-416e3e84a31mr6480974fac.5.1773066896060;
        Mon, 09 Mar 2026 07:34:56 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:77:c35f:9c1b:c75f? ([2600:8803:e7e4:500:77:c35f:9c1b:c75f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e6836886sm8715938fac.16.2026.03.09.07.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 07:34:55 -0700 (PDT)
Message-ID: <b4aec378-879e-4a8b-960d-051cd8b94615@baylibre.com>
Date: Mon, 9 Mar 2026 09:34:53 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: iio: adc: add bindings for AD4691 family
To: "Sabau, Radu bogdan" <Radu.Sabau@analog.com>,
 Jonathan Cameron <jic23@kernel.org>
Cc: Radu Sabau via B4 Relay <devnull+radu.sabau.analog.com@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
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
 <08717cd6-a732-4f06-a6f1-8cbdaa755b78@baylibre.com>
 <20260308182839.19587743@jic23-huawei>
 <SA5PR03MB842501D7A27A10BC203E5433F779A@SA5PR03MB8425.namprd03.prod.outlook.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <SA5PR03MB842501D7A27A10BC203E5433F779A@SA5PR03MB8425.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 5B17123A9AD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,metafoo.de,analog.com,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[baylibre.com];
	TAGGED_FROM(0.00)[bounces-32826-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,radu.sabau.analog.com,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,baylibre.com:mid,baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Action: no action

On 3/9/26 3:57 AM, Sabau, Radu bogdan wrote:
> 

...

>>>> Regarding 'mode', I agree that it should be something that could be modified
>>>> at run-time, especially since all register modes (CNV_CLOCK, CNV_BURST,
>>>> AUTONOMOUS and SPI_BURST) rely on the same principles of reading the
>>>> ADC result from the registers, the main difference being that PWM on the
>>>> CNV pin is required for CNV_CLOCK and CNV_BURST, but the board design
>>>> stays the same. Perhaps this PWM can be initialized at start-time and only
>>>> be used when CNV modes are being used. This would mean mode can
>>>> become an IIO attribute that could be set by the user at run-time.
>>>
>>> More likely, it would be two different ways of doing a buffered read,
>>> so maybe two different buffers? Or just pick the "best" one and only
>>> implement that mode.
>>
>> I 'think' burst mode is really an oversampling thing as you read back from
>> either the output of an averaging filter or an accumulator.
>> I doubt there is reason to support both the oversampled and raw
>> readings at the same time.
>>
> 
> I agree with that, perhaps burst modes (CNV_BURST and SPI_BURST) could
> be dropped. Also, AUTONOMOUS mode could be used for read_raw since
> its compatible with both CNV_CLOCK and MANUAL hardware setups.
> So, then if the 'pwm' is present in the device tree, CNV_CLOCK
> will be used for buffered readings and if not, MANUAL will.
> This will indeed not only simplify the driver, but also keep two important
> modes up for choice for the user.
> 
> Please let me know your thoughts on this approach.
> 
Sounds sensible to me.

