Return-Path: <linux-gpio+bounces-14503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA93A013A7
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 10:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A11273A35EF
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 09:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6427817D355;
	Sat,  4 Jan 2025 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KcgXkfqt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B0814F9CC
	for <linux-gpio@vger.kernel.org>; Sat,  4 Jan 2025 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735983305; cv=none; b=AxHt8of8redMEB9M8TyOPolXZfBRefEEPp6hAFSNzz4wH+vzqqqu9ajWI6U/9SeqmQjQCFlra3cNONDRSebpgWyIAV5NWk77vItUevmOctPq9NngWf9t69+ul++xyx1YLgT34S1qRuhv6p5MyJ7np7Xwm5YBCmuus5FIGRu+PoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735983305; c=relaxed/simple;
	bh=9DwfVlPZKedN44pI/T1zeAy34WnuQkbQQOxuWVdvv6Y=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PKdV9kKZDZqEj3NCS7jxTEwlmFX4oupaZdYbspB863F20RrT8Kt7LUoy7Ajbom58MIHWY7nhbH4Tck94iT5wY2uX3eI0/+EguBbOrdOYLZw4+v77y2WZNEwCmhLNpzODEnaq/Y99SM9e1VEisvgJLehu+BA1pqvvcXesd0RGwX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KcgXkfqt; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436230de7a3so20192765e9.0
        for <linux-gpio@vger.kernel.org>; Sat, 04 Jan 2025 01:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735983302; x=1736588102; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tfwQCCBu63aZTVhOZ4c/EiZehZjukgRMOTrP7C2cC/8=;
        b=KcgXkfqtFlWEMPOmx3XxrpTS4chEjRubyosorVXlcY6cJ7ChzvQVkjMFlqrC/68z5+
         yvjl1OzSmAYin5QZusFAQHA+pRiV65eajxYqW3n0QWRiEDESvqZCE9M2MdDHwyguph7Y
         VdtFts7euxW4CRUqgA0ym4Qz7JFYaKaLLu9R7Ljvj4HJXO29vpPN9F/jkhgSaFWg4z24
         BBWc73WHihu5JpKTvi8dxyNCzw+MOEVGh97ZXBJCCMoMMePSUBhOSb9P62uO+3wk5TWh
         8wMNcSC6Dw2PtO3X4akn/vJ7nss/a5RohpHVmi6COu9BnysjmQ572/u7NQc78EBwPQC8
         im+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735983302; x=1736588102;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfwQCCBu63aZTVhOZ4c/EiZehZjukgRMOTrP7C2cC/8=;
        b=bIbB6eb64cX3/drcvcDcaZrh0pmVe8d+xVzZggIvRgmj0PgKIEL/ZHVIAsrGMU3c/s
         qpxiRJIxQ+GzPXQAfC6Q2kBEAF574qP7S826TFAJtaLinXPwiGLXIFN2lxi8F3NUv+mF
         MAoftekHeEBXrGpBC1/NfDdTIHsmrFj2QP260CPBbbR3WmitMsEyy5ab7WDwPWhw3UgB
         u/Cj2eSdL8orQ87SRyZpSN5AXpqmU7fPyYHt/QmBWMYRlosL8zCP2JVHZtUo09I3sp+7
         gzuCW4Cgs0XVtzZbRNBkjoLhdbuAbwlRxPAMnonuDn9yPYVksJAd9EszGckBtWUjmJTL
         QNRg==
X-Forwarded-Encrypted: i=1; AJvYcCW/ua+CTG9ybZzKW9uZAuQmbu521m/o5Oq2VqPR10YUt1JEtLpdrRbIUtqPkrCPhgfnvsUhs5VkB01H@vger.kernel.org
X-Gm-Message-State: AOJu0YyOGlT8K+nvJN0gA55JPOlIEcXIZjq0JqyX95VnrzadA4YHW+33
	8xrx4kH9mVZkEoIWUedTcq825jg0kxgQGtujoFQ40uszt18D2toB0fUrzdUQN/A=
X-Gm-Gg: ASbGncuAGJF6vv7zzZNtmIzPGv2PgH0vfrtl0L0ElTRZYKPfUqbi1R2MvlcwtG0fY75
	UM2XdTON+bWt/+Or/6zPar6UeUsITgEoVTN+PqHH5bY4RXJrgxK11sAwOqcDZQecwZehF9QqSs0
	s985QL+rY6FmNd9xvFKIBH8lgbJV+eI/9c0ny7NXF1EXjEZahgYZjeZU66tViSTKdY884xEUiWB
	2pioxblTITVLa4ATyA5EshKV6zeH1fAGQ+rSy66oR+/0W7bFguLxXZATSSkoJUg9IQHY7J26iSd
X-Google-Smtp-Source: AGHT+IG3FGlzh0yaJot++IsAzOuMcup0/rVdO0ni0icMoCmRYddvSjFlUUcahxyyoJSviClT6wmdLA==
X-Received: by 2002:a05:600c:3ba8:b0:430:52ec:1e2a with SMTP id 5b1f17b1804b1-43668b8fd2amr168430765e9.7.1735983301759;
        Sat, 04 Jan 2025 01:35:01 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436612899f0sm508109245e9.38.2025.01.04.01.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2025 01:35:01 -0800 (PST)
Message-ID: <d34f1e9f-7a27-4a72-b706-12e3175432ac@linaro.org>
Date: Sat, 4 Jan 2025 10:34:59 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add NetCube Systems
 Austria name
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard
 <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250103204523.3779-1-lukas.schmid@netcube.li>
 <20250103204523.3779-2-lukas.schmid@netcube.li>
 <pvbpqlejn6r7yjzufdmialyvjlmitusltb3ljhwstxbtoglf6q@7tvjz6neolnp>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <pvbpqlejn6r7yjzufdmialyvjlmitusltb3ljhwstxbtoglf6q@7tvjz6neolnp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/01/2025 10:30, Krzysztof Kozlowski wrote:
> On Fri, Jan 03, 2025 at 08:45:17PM +0000, Lukas Schmid wrote:
>> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> 
> 
> Repeating again one of my comments:
> 
> Please run scripts/checkpatch.pl and fix reported warnings. After that,
> run also 'scripts/checkpatch.pl --strict' and (probably) fix more
> warnings. Some warnings can be ignored, especially from --strict run,
> but the code here looks like it needs a fix. Feel free to get in touch
> if the warning is not clear.
> 
> Please implement all comments.

My bad, I did not write that hint earlier.

Anyway, your patchset - all four patches - has multiple issues so you
need to fix all of them before posting next version.

Best regards,
Krzysztof


