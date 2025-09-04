Return-Path: <linux-gpio+bounces-25571-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B11B43767
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 11:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74B143B4599
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 09:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042532F83A1;
	Thu,  4 Sep 2025 09:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XBNl3NYw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84762C159A;
	Thu,  4 Sep 2025 09:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756979038; cv=none; b=R/lzKqVtX6v7hLlLOfVABEsan9qawjuyT5INivtmP8E6duNxe3IA8YlWawGlNooSf/KbtGuAW+Rzm3DtGdvOwcLzbnEvOq2YtumFDsJkdUj8CtxbAmhIgzyoES/sdnjUC3B+omb5RRweCIU1EBvf4M35yNXevjnYTg2kO8uIXHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756979038; c=relaxed/simple;
	bh=dlvokrYqw2ENIIfE5lI0Cm7ifWvoG3ffcnaaMWGVZ78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MnVD/Spr/Y3Q1kOdsFbgEZ2xYGPV6e+xBvsRlJMsWwHzQ/ynmOHt1dJBq1iLJb2vA1eOuNS2owUopky+2gDJSucT/r0wy4BNfad9UinsA+HPC43OT+zGqF+Dc5EjEdPuRK1A6P+dWRwy3e67H+5De5BbWqW5sLsC58HuxEM/6fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XBNl3NYw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC3D5C4CEF0;
	Thu,  4 Sep 2025 09:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756979038;
	bh=dlvokrYqw2ENIIfE5lI0Cm7ifWvoG3ffcnaaMWGVZ78=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XBNl3NYwZTNS3lACsmAjlFcyrHqOKLqvvJAJx2IUaWCDLRW22i4nq1Of6GUS/EwE9
	 k3Z1T352tAGdb9eauHF4xXUjSepCsGeACWO7fgBn5Wcw9BiiZ11Y80p9KMRgZOtnBc
	 p7jm7/F4shgF8AaGI+cOHHxA0606l7ZkVEpPPU7Lp/alD+sf4oHqYhKPYJ/PxaiUNx
	 HJS33LfJV55eVeCGfmk7mJcyvEFkuYgPwkCTWjrWQ7As8l7EfrJ7vRaY7qbvQdb4G6
	 L69EB06bjCpSBaeF8Gk2GP6wDhSJm02AS8SMIJV031RmbsjOa/97yqDisuZA51RIkF
	 TlAtnoOkMJKag==
Message-ID: <2c7fefb2-9a0c-451f-84f6-dc5a19707699@kernel.org>
Date: Thu, 4 Sep 2025 11:43:53 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: clock: add TI CDCE6214 binding
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 kernel@pengutronix.de, Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org, =?UTF-8?Q?Alvin_=C5=A0ipraga?=
 <alsi@bang-olufsen.dk>
References: <20250903-clk-cdce6214-v6-0-b2cc0a6f282b@pengutronix.de>
 <20250903-clk-cdce6214-v6-1-b2cc0a6f282b@pengutronix.de>
 <20250904-arboreal-upbeat-iguana-aebba6@kuoka>
 <aLlBAuYoHIJZLfiE@pengutronix.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aLlBAuYoHIJZLfiE@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2025 09:34, Sascha Hauer wrote:
> On Thu, Sep 04, 2025 at 09:18:13AM +0200, Krzysztof Kozlowski wrote:
>> On Wed, Sep 03, 2025 at 03:55:45PM +0200, Sascha Hauer wrote:
>>> Add device tree binding for the CDCE6214, an Ultra-Low Power Clock
>>> Generator With One PLL, Four Differential Outputs, Two Inputs, and
>>> Internal EEPROM.
>>>
>>> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>>> ---
>>>  .../devicetree/bindings/clock/ti,cdce6214.yaml     | 198 +++++++++++++++++++++
>>>  include/dt-bindings/clock/ti,cdce6214.h            |  24 +++
>>>  2 files changed, 222 insertions(+)
>>>
>>
>> I don't understand what is happening here.
>>
>> Patch changed in weird and unexplained way - nothing in the changelog
>> explains dropping SPDX - and does not pass even checkpatch.
> 
> I removed the SPDX by accident, will add it back of course.
> 
> Other than that, what's weird? Changelog says I now use the pinctrl
> subsystem to configure pins. OK, that also changes the binding, I could
> have mentioned that explicitly, sorry for that.

There were four patches before, now there are two and changelog says
only about pinctrl to configure pins. That's very vague and you expect
me to decipher what changed in the bindings.

Best regards,
Krzysztof

