Return-Path: <linux-gpio+bounces-27674-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E051C0DDEF
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 14:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77987422DC8
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 13:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF3F27CCEE;
	Mon, 27 Oct 2025 13:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwFg2t9S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC2424A05D
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 13:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761570135; cv=none; b=Zs+49WBN0iKHCeHqIu8F4xtDMPUKtoS168zD+WrwtX02SYN/8JCwEjGaT8980hplzVf6hpaEUGWRWvDrQ2I30MLNmLZ9qwg925V6j0EpLhNM7tALhXkPhH4xXaS3bXyBcnyVN2RQb2V/siyfhBkWFE4KWJz25Z6XGe2AE+ykmdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761570135; c=relaxed/simple;
	bh=1bB7L68kzJayTBvOhwCV/SjorHR+hB0GqpWfqKFMQiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CiOMgAE0Zjkp1DjKAdijViDuzgbnmFZmX9sWqjKe/ljXe3bDHD4zRIBnnVlh++pJ0Bn4sNLL1htYLn2vUBkZzBRUMp+keZRvQMtFoI/cDYaIyedrPSQGj2mCsy54HFWqdfonR/6rujA0mpUceVlDCzw8PQqAkikQlEGxbArmpZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwFg2t9S; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-375eff817a3so48884851fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 06:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761570130; x=1762174930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pxCTtcPsN8230LeCJx3j5DlRF4pEORPX1pABk9GNfEI=;
        b=fwFg2t9SG/sQuwHr+iOuOpC3wwIySvcp88EAW5Qw6/Py2Yfu/2U3pqbMMiloyGL1yn
         G9+B5zMpSpXM4hzVroUx7nDp4F1WdWzgZg3/FxjVAiX/Cn2Qg5zLHAX0lZEjldlbL2p3
         sByH1SDT+v5XdZLtuZLBrns3GsT6co610lr6RHkGvnsXR3xhPpteK5/q/8y+qpLRVKv9
         tqxel4Y+g408wgC2IBHHrud94bIMJraSCJnK06sYsrH0aUCYiyPkLl3PKUu3WFvxd7fU
         BmmnRXhLT5m0u7X26zANng3rEGNz/8K0OXYPDigWUZrtMZdikTBFGHkLk6rpt4Ib2ehe
         kBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761570130; x=1762174930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pxCTtcPsN8230LeCJx3j5DlRF4pEORPX1pABk9GNfEI=;
        b=FH5RA5rmwNDOLOyGm3FYWYqDCQbvPOyAe4ZMoT5jpEKS8KXc17ruh8R0o/oEe4BoZ7
         JyzX5tGSoinZ65F+YxQikkMiCQoh+A739M6i2VR8WO/z6yyQUyhxXNEd8aPxof2ur47z
         M9ij86PFYXZOQBDwBdX1QlQWM4IAazZJgiElXrlKE+2u2cwisFw7bvwC38wLX0RIN5f+
         KI4fAoH//qumKdjuTAXjRSRvwf6bXSp+8E8dI09MO30gCe1JCX7reoFhbMIWhdh1y0fI
         j3TtAMwZqafe69gUf8UV6qomqNeisKW2YtwL5MCXSl4Fzl47Yj/C7sU7moCCzRkfIRVI
         HnkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9WO0LiXDXMVir3lFDAKo7GWV0ZE5hfRFzn1pRbXZiDY1iR6lMTDJiYcp3AkC7q01Fz2ryjHtK9D04@vger.kernel.org
X-Gm-Message-State: AOJu0YxzW89liHgqLSTnKN7ruCJ1tJtX9FrT97MacVQ5WN4M8UXchg9p
	6u83aAXzkC8P1lwT0WKOJTco61AwGTR0+nYqmz+o58Zpk6hlvYzKDT+M
X-Gm-Gg: ASbGncvGUsywH97MB0u+TbflmG0LYChULS3/VLdqBAz0xmxVijxiJ9FWrPamOgNNiS3
	kUyu7z68NFn+GRdqbDBD1JlOtuBxSdYvgARmammWTVXoL2fslCcuxhvsE4H5UW8MwuToOlN6GWx
	aQApuW6ADRSvtVEjTxpmANrYzwJ+kUC2nfBvBkh6Kmf6GiY/Ww8r7kiw4H/mB/gpIKFqSem5RGN
	OmhTgK0ZDX8paEJ4WhIhppDjIkbviIKT+TCVdEYdhSFu0X/ZXrXdSScbSMMHgROcwL/MJ/mPTRR
	2aAEX9S9R1rahBAV3QZTgn68Rt4bANxAU3/SS9ueBOb550Fv80IqGZTuBlRf4fLXslmXiMOMk7X
	ii+w7b/HXL0zwVZITPBEXHqyEA7jpvSyd/ATDdZ+ThWqZvAcfhaoVFUdPvhjbC1wXokL+//hHGC
	LV63TI8Wg+pUX6COxxI8hntm3mpWaS8BHRw8lXffkzAtLvK7/aLE3FcLk0iia4vEtM5eXq
X-Google-Smtp-Source: AGHT+IEl/ogSJ08y9LQ2dV4OaLLEyD6Fjj0ThgIRaIYYP5R3v0fiFqlQt8CBQpsPUF3Equew6ssOkw==
X-Received: by 2002:a2e:b893:0:b0:36c:f6:a4e1 with SMTP id 38308e7fff4ca-377978c6d84mr104935861fa.14.1761570129393;
        Mon, 27 Oct 2025 06:02:09 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0d0028sm19860371fa.35.2025.10.27.06.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 06:02:08 -0700 (PDT)
Message-ID: <a74c9c52-7c39-4c66-bdcf-0fb9e1b8f77c@gmail.com>
Date: Mon, 27 Oct 2025 15:02:07 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/15] rtc: bd70528: Support BD72720 rtc
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1761564043.git.mazziesaccount@gmail.com>
 <380ea1fdbb94a796418e8f463c6a9436001d572d.1761564043.git.mazziesaccount@gmail.com>
 <202510271238195ef3bdfb@mail.local>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <202510271238195ef3bdfb@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/10/2025 14:38, Alexandre Belloni wrote:
> On 27/10/2025 13:47:51+0200, Matti Vaittinen wrote:
>> The BD72720 has similar RTC block as a few other ROHM PMICs.
>>
>> Add support for BD72720 RTC.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
> 
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> Note that we didn't get 07/15 that adds linux/mfd/rohm-bd72720.h which
> this patch depends on.

Thanks for the heads-up Alexandre!

For some reason the SMTP server seems to be blocking the 7/15 :/ I will 
try to figure out a way to send it :(

Yours,
	-- Matti

