Return-Path: <linux-gpio+bounces-9518-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 051AB96813F
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 10:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 816D11F21CBB
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 08:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0CE17E017;
	Mon,  2 Sep 2024 08:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7qJrHMb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BEFEEB1;
	Mon,  2 Sep 2024 08:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725264218; cv=none; b=SfoopZaclMfD6qGS9+SorDdMxhNO4SVLx0nVc/Ti8F1nxTUHZnXUceo41S1Pw2tFaeX88sMBEKZV1U9MbGTU7OlbwT4wQWyu3bYIZfOjoN+RjRof+e99ZtNYtnv0sgCqrryXrsRpVrlpwrLyDZT2Lo9g3I1KpK+rLoxCwU7CbVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725264218; c=relaxed/simple;
	bh=0KSzUfUcET/TS1chJhmyFXPM67UbWHlOo2oFMznUyn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YdRIvi7tyV9lFLH2Ty/FB/TKUN2TPPfzlYOrb+Eow6eTbjTX2TAMfGoiy4TWm0gWp5eSrSCQoyq6B7M8vEUSARri+9oXjugbSMvv4Iwj2q1Lp2xuQQE12SfaS+DcxfAj3LI0V9mIznQDI1qsM2/fxNdcosRoHGXIZ7ip4IPOY+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7qJrHMb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535AFC4CEC2;
	Mon,  2 Sep 2024 08:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725264217;
	bh=0KSzUfUcET/TS1chJhmyFXPM67UbWHlOo2oFMznUyn8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I7qJrHMbnfcF5d/yIuNRLgQuwt5s75PNSKbSYCL0nTWp1sm4o5iu/EhD8PdKQiXKk
	 6MTen0LZ5VNDo3A1gcKvaoVobLKZ6hk+SSv5o+NR5W8arGeFseH76HOYMtYEW/J0WR
	 d9UiqTKpHPBB1lQMR4l3XLhHS3/4B6QpkELlsgFrSNMymgsJPjtH0/cWHcCdAaVD5i
	 hs363UwoJ/7FMcKdKhRaUqSeow1p72Jp/z6+ToBtkZdtn5jOfBIMtrpPho38zid7fg
	 zip/3PNVZMbFHYStYR+GnzD7J4EMgnQD+Z+KVVJKj6YrfHzsDqyo+eEynZD+HTngsj
	 vDxJc10jj299A==
Message-ID: <eff3f5c5-3a25-498e-80da-ad8e039f7575@kernel.org>
Date: Mon, 2 Sep 2024 10:03:31 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: spacemit: add support for K1
 SoC
To: Conor Dooley <conor.dooley@microchip.com>,
 Chen Wang <unicorn_wang@outlook.com>
Cc: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@spacemit.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jesse Taube <jesse@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>,
 Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
References: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
 <20240828-02-k1-pinctrl-v3-1-1fed6a22be98@gentoo.org>
 <MA0P287MB28226AF473BF6A261E4C5D84FE962@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240830-tidy-identify-90dce7a21abc@wendy>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240830-tidy-identify-90dce7a21abc@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/08/2024 09:06, Conor Dooley wrote:
> On Fri, Aug 30, 2024 at 07:48:17AM +0800, Chen Wang wrote:
>>
>> On 2024/8/28 19:30, Yixun Lan wrote:
>>> Add dt-bindings for the pinctrl driver of SpacemiT's K1 SoC.
>>>
>>> Signed-off-by: Yixun Lan <dlan@gentoo.org>
>>> ---
>>> Changes in v3:
>>> - drop spacemit,slew-rate-{enable,disable} property
>>> - use drive-strength instead of drive-strength-microamp
>>> - fold strong-pull-up into bias-pull-up
>>> - format fixed
>>> - title fixed
>>
>> Drop this change history here, you can add this in the cover letter.
>>
>> [......]
> 
> It's perfectly fine to provide per-patch changelogs fyi, rather than in
> the cover letter.
> 

And honestly, since some time I prefer it much more. Much, much easier
to spot which patch changed instead of something in cover letter like:
1. Patch #1: changed foo
2. Patch #3: dropped
3. Patch #4 (so patch #5 or #4?): changed bar


Best regards,
Krzysztof


