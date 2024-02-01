Return-Path: <linux-gpio+bounces-2859-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B28884536E
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Feb 2024 10:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB80B1F24040
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Feb 2024 09:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB3015AADC;
	Thu,  1 Feb 2024 09:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WAzIag7B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3297715AAC6
	for <linux-gpio@vger.kernel.org>; Thu,  1 Feb 2024 09:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706778649; cv=none; b=txQvy7YCJOJlZQ7yrOH+tQtEz0V1LRMbYss0HPpCdEI7J5vByQgpBG31rJNSvs8fRZndITSGt8X3pxdV6TnkWDD8280wd0DjR4S6R/REDdqGAkjwr02G9VmFMjA7lX0EpPH1ofHlZIFxP7jl7Yh63ZB9IxG+7Nc1PMW7P2InZNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706778649; c=relaxed/simple;
	bh=ctTiB4axxdqT9iGnQ34hH3UAPEGvE1FRGZst75bprrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kvsIFfot+lqPg1WIFKOPEsfZoAaEjb+7AvcM65xoaz+D2WKaULkAjLUaPNW1TgkjepagvZFiBWHOkwDNMejW7/no8jMnDgLns4f/gv0N9O+SdhNWpXR5zznDt21PC/UF2r9p1n+NdrV4hONyzKWYGnhwOnaxbVYvkjaKeejfofU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WAzIag7B; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55f0b2c79cdso825125a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Feb 2024 01:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706778646; x=1707383446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F8WAfizeKOkDecAZrMzObPeUUtsumY0TIe4uxle6Zus=;
        b=WAzIag7B0L76RZL5dqc4cM5JNLQLBWLt+QNknlvO+BMukzLbqMWwpQYYilOhmqELzZ
         fePsWLJQx7VfPs3+u79+XpYkAZtHOs8jQYh1p+4SwSSdBvmCcSdLnadPDWsOPFyzziwH
         aqJTIJnS0Pog0xuw6vGR2DJxd+Fpl41yVOnpS6uOaCuShZ9cp6wVPjw7RIAud/kjx2Vw
         D6X7FdUtcMB84i7sOnXYoGwaTKKDDampFzdLOGXueyvAJEbJlHxo7jj3BifZmyzgTIg9
         TrqhIp8yXaqc5lQoGld5A0FjUZlFpndglIGmPuyaQ4Ckkbu6IibtJOXb+JXx5tg1OX4g
         g95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706778646; x=1707383446;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F8WAfizeKOkDecAZrMzObPeUUtsumY0TIe4uxle6Zus=;
        b=hpFoGrLoDf9j1xtRbj/REAd9ZQKY4nF0tdBqQmAtMgrNTVmQts0sVmvSCAsyHBgL66
         zYcfHZZryfh9mJCwd9CtpVFRfrGoa/lHlBNCeC+KJZe2sdo8bXI6GxJY153YMzNEvpxv
         tUDpfhZWvgcJWGS5dYNzSCfvD0oK9kOF3JzYRsnMDfi2NY0jTgHQdSFp+GVRF9GFI58E
         evLkV3oakw72fWS/GLmcE9PagsvYCyEYHVqJixxyso0HU9tbPj4VGB8NvgwdfTXKrsDB
         jjDMfM2EVtE5VZe9TMM/sWXx/Qob5B2XyUTz7GFx8kowM0tjPaJUqKzr99k0Pb2Pqk+n
         qWwA==
X-Gm-Message-State: AOJu0Yw8TT4goQmtr+ketzg1mOib5hodFGKFaEKntmsDm0pbACuK7QTb
	qGfOKupbhajnfygxQUn+k/efsukNTDULtgqDi5gK10lURzdoRGFO5V6ZpBfyi/M=
X-Google-Smtp-Source: AGHT+IGZERkZ/PIiQh9HxKNUmzOoE6mePIo1Xf7B4aEcP9QqKofj2lXSPg4yz0sDGwKcNgQGbSiotg==
X-Received: by 2002:a17:906:4157:b0:a30:f907:3568 with SMTP id l23-20020a170906415700b00a30f9073568mr3088562ejk.57.1706778646323;
        Thu, 01 Feb 2024 01:10:46 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX9pDBjjjdr5dJIs7bnfIJyUYgXfBYPr6+IXn3AAcTErgPO7bscy38ebQOdZ9U2miZB4ZEPHlzUAQoCfIuBYtPoVYRD2ytUVsuCRW9x8BjPgmo2cuj/NxRtPEPGuiyeUcuDlHU/OTFHRFKLwexSc81l3VXvLb3o3wnBG0hlv5teTGTNeCyZJDAlzvgjkKlmnnjJFg141E/uc+th88dP2CcWPQxP2MmXcAfwJMVY9GT7PFUv4iETD6y5Z/fqPsxlrRBTp5sqFfkB3mY07MBpI8O9UgeAhsVrUvgUHHBMLPYUtz8IbogD5gy17RkHhrf3J2WEkn7HGOuaA4bcwYU7svRFUmJE+jptjEt+2LIEXi66JGntDSGLCZnTCGgFhynsyiI1Cq2X6RTHE7WP2kchMsgoD/jiHodWudTWEo6zin/n20aatrNiHPDBXbjAVyEE+AjG96EBhXD7Ff64/m6V6VBm1NlO9DUcVNDr/MlH+BBcl3c2FaY3eb5VojcEwqUlkMYx7sinuXk3zXrAJdsOtweVxnncP5ebnoMiYr6DizHGFnPgwTkcpQthr2anPGLzVU5HqR8JXptVnxi21F1prJineNV183TchFMCH4opQCULcWFQ44GRN+wqzisXOfFSJiTfccSe9YRHBw==
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id cu3-20020a170906ba8300b00a368903fc98sm1165092ejd.136.2024.02.01.01.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 01:10:45 -0800 (PST)
Message-ID: <ddc31ec4-09d5-45bc-83d7-c4aed4c4ec65@linaro.org>
Date: Thu, 1 Feb 2024 10:10:43 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/18] MIPS: mobileye: eyeq5: rename olb@e00000 to
 system-controller@e00000
Content-Language: en-US
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-gpio@vger.kernel.org
References: <20240131-mbly-clk-v4-0-bcd00510d6a0@bootlin.com>
 <20240131-mbly-clk-v4-11-bcd00510d6a0@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240131-mbly-clk-v4-11-bcd00510d6a0@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/01/2024 17:26, Théo Lebrun wrote:
> Node names should be generic. OLB, meaning "Other Logic Block", is a
> name specific to this platform. Change the node name to the generic and
> often-used "system-controller".
> 
> See §2.2.2. "Generic Names Recommendation" in the devicetree
> specification.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  arch/mips/boot/dts/mobileye/eyeq5.dtsi | 2 +-

There is no such file in next-20240201 and your cover letter does not
link to any dependency. Something is not right.

Best regards,
Krzysztof


