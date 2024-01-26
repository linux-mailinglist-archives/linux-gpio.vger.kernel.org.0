Return-Path: <linux-gpio+bounces-2624-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2303283DCCC
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 15:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE566287B5A
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 14:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38851C2A5;
	Fri, 26 Jan 2024 14:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vontIHEN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E151C68F
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jan 2024 14:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706280905; cv=none; b=d/PZYFXqp/ZLxgFw0CQYXpvEByU2TYVcwo0966GXsYO12J62E8Wa5ukqamIAxxARDoaeTrhXvkjGZzO9hPK2MEDSCuIX3dND9JznXwV9Bfxesh2KPASp2uVSA97MJ5w+4vVHquotJDvH+Ux4jNeAhMEczK/bd4n23iCLM1K37nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706280905; c=relaxed/simple;
	bh=EJAhyN+S2wwfnfIClLhUAqkau2iZSycqAJ/Kg3ZXlvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qLwhu7b11bPZw4Owo6EhH8NRBRHOYAohYxnhKhkIHlPx2BEzyEQ+ZQ3/R5/Yfcm3ShhmyQWRLXN2+FFxj8MtHtMCgnZXK1HNxXHAjahF4anloiEZ0g+uSGpJk1i3G01zciXCjpb7IU1hehy0UbWp18X1c4NYkMRsp+O2RTWE6Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vontIHEN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40ee895ebccso2387545e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jan 2024 06:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706280902; x=1706885702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HA+MBrxMI1pnsU5OqAZ0P5srUiSJjhWO9JPjFT2rMjE=;
        b=vontIHENaoMH8Q1p15r8/zAWLdOUDXsEArLpWb75vt6hgNyxNaeZNibWZFgg9E/UOk
         7HrnK4Ua843kQ1qQAdNoqX4uyumfvqAW7qIkj6wcI/I66oKGgQFh6avCx9vPVZTVNd5E
         aOz7k9ah31z03MIGugW7qqYoqUZPE5dB7nDzUOf3pQo+RgvQtM0LDBr6GuJXE2Hf2b8y
         oBxA5MbMKzryV6VGopZHR6uCULc1iZZJ+XTParMDMuJWjG95S4jyFxIZj7Y50rOuixQR
         utCJEnXLQdlWw5VwmWllnNkTD72ouuvHnKuEQG74BaTBQdIu+LLh1rBG9WDAXErIpkdL
         BZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706280902; x=1706885702;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HA+MBrxMI1pnsU5OqAZ0P5srUiSJjhWO9JPjFT2rMjE=;
        b=vUGf/qyA2XNdCXjlZMmWkcbxKn//LZPu462EHj0YsVTZX72RDOw3c1kPiXMbpkOEf6
         yvPVj0NNTV7wI/HG2fdwQb2D/guh0jjqRM4MZrxUcTii9/rqFOfBa11O+9rV8xHii9N5
         tGi2rjc6KuKYqkb/y/glO4iPw3SBwKZ4YgOKw1UvZ0o7PIWXXol3uzBV0NU2bduAhDmc
         99HtW5ba4y13Q8zKaeh7TDmbXUPc5hn3cJov7aUWvDcO4jwH125qgEeJ5PCamsC/dCgW
         SB2KSh1c6BAEuWnlISACUNGtUmXVVt/ws6Mai9YDuFjMfXd1/eeCt9a1BNGAZ7VUANbZ
         Guzw==
X-Gm-Message-State: AOJu0YxpJtthJKlsgyyQCCs6oX2o37fjKRMEJrp7aQjzsiCWfNPFSvZ3
	kuE0JurSgoZRMiteKFhifDf20Zs73hpd+gkoO8iZ2uLuHOwLZ8QZYT+ca5rONIs=
X-Google-Smtp-Source: AGHT+IGunr3enjb3TIAqsri4UnAJQHn85wnS9l5d7lVNmdMz29E7ClC5DpsipkX01t1GkC+FHK5Miw==
X-Received: by 2002:a05:600c:255:b0:40e:6a93:1c57 with SMTP id 21-20020a05600c025500b0040e6a931c57mr943729wmj.103.1706280902124;
        Fri, 26 Jan 2024 06:55:02 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id vw16-20020a170907a71000b00a2ca97242d5sm700493ejc.120.2024.01.26.06.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 06:55:01 -0800 (PST)
Message-ID: <e48f3bd8-6231-448c-8540-bb211c49c2ac@linaro.org>
Date: Fri, 26 Jan 2024 15:54:58 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/17] dt-bindings: soc: mobileye: add EyeQ5 OLB system
 controller
Content-Language: en-US
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Rob Herring <robh@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-gpio@vger.kernel.org
References: <20240123-mbly-clk-v3-0-392b010b8281@bootlin.com>
 <20240123-mbly-clk-v3-4-392b010b8281@bootlin.com>
 <20240124151405.GA930997-robh@kernel.org>
 <CYN43TSPPPZ5.1VUA1CH95D8KJ@bootlin.com>
 <CYN4D0Z6600X.20W9VWX4BGNXX@bootlin.com>
 <CAL_JsqKHPdmafDvKCHZTNNzRAzq2Y34b2dqUXQD6WpE7z2k-jA@mail.gmail.com>
 <CYNRCGYA1PJ2.FYENLB4SRJWH@bootlin.com>
 <8054e01d-0a1e-45b6-b62a-25303e8f4593@linaro.org>
 <CYOMZE0XIEIR.7Q1BDZCKX1E@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CYOMZE0XIEIR.7Q1BDZCKX1E@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/01/2024 13:28, Théo Lebrun wrote:
>>>
>>> 		pinctrl0: pinctrl-a {
>>> 			compatible = "mobileye,eyeq5-a-pinctrl";
>>> 			reg = <0x0B0 0x30>;
>>> 		};
>>>
>>> 		pinctrl1: pinctrl-b {
>>> 			compatible = "mobileye,eyeq5-b-pinctrl";
>>> 			reg = <0x0B0 0x30>;
>>
>> Duplicate reg?
> 
> Yes, the mapping is intertwined. Else it could be three ressources per
> pinctrl. Just really small ones.
> 
>  - 0xB0 mapping   A
>  - 0xB4 mapping   B
>  - 0xB8
>  - 0xBC
>  - 0xC0 pull-down A
>  - 0xC4 pull-up   A
>  - 0xC8 pull-down B
>  - 0xCC pull-up   B
>  - 0xD0 drive-strength lo A
>  - 0xD4 drive-strength hi A
>  - 0xD8 drive-strength lo B
>  - 0xDC drive-strength hi B
> 
> 0xB8 is unrelated (I2C speed & SPI CS). 0xBC is a hole.

Then maybe Rob's idea of one pinctrl device is better...

Best regards,
Krzysztof


