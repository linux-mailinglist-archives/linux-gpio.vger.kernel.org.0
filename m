Return-Path: <linux-gpio+bounces-30049-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F38A5CEE1E7
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 11:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 983FD300795E
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 10:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26ECE2D592F;
	Fri,  2 Jan 2026 10:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vJQK5NR4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13101E89C;
	Fri,  2 Jan 2026 10:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767348138; cv=none; b=HtTwbwrhGsxas34NMJ4CjaC35Zt68vI2gg3jgg9cZP1FAj/cBEx5cCGzovVfOZMenjD3m1mZJMjH3fxzwB7Sth1pCUGvAFK6fRCPD586TB7e3DkLctqX4s9IzAy6sI2mJL5O0lekZdU7o2qhhboBpt6gtQGyt3Fy/Ctj9M74ltQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767348138; c=relaxed/simple;
	bh=EY4Gf1NP2ZmGROzYwflOncoU95tf9DDjgpLojIvDyP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xie2bR7+MnFLrak/G8jCtzqZSlYaq0t/T2MSPqQM0BrokcTNKMXN5p7G1LL7AKGoJdwZRnI6GN+OkDhnZ4PPTxvqSpr3bYvvha9WjVKcUNplCabMm5KPqoVYbTa6m6TFG7KBHJfP2Sp11QNGe0IkPrHKkv28AD3nxjUF/uMuIuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vJQK5NR4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3369C116B1;
	Fri,  2 Jan 2026 10:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767348138;
	bh=EY4Gf1NP2ZmGROzYwflOncoU95tf9DDjgpLojIvDyP4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vJQK5NR4CSEvsWmRCaL1mmA2VOeXtD+V/wKCa6xZ0tiV6mp4D3c1zQZMCN8KZimds
	 MQdV4BJt9vFpH+LlS7k7FyPtCE4QNAaNJ0Dp65YjZJ8mV6Fa1YAc+fzpKP+qYzQJz4
	 0D37iufpZplEASOhYgLGme8hKqKqaL0DhI/tItKLylkIb1m1tsmEoMwl1dnStdCeou
	 0GYyjEGLtYua58oMtojtJaXvd+lGl3JDrFkWdGQQy77KytZk/VnUvrJVIo8jZkP2Ot
	 xMZwXcKPZe1Gs1Iw9FkgqHgCumAM6ZqE+Qt3noErmEf0d7LvpHWlo6c0LeWRWPdb3e
	 NNceh6CSYxA1Q==
Message-ID: <fb98e395-d590-47f7-8dba-d9a691a2c174@kernel.org>
Date: Fri, 2 Jan 2026 11:02:13 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: samsung: Add
 exynos9610-wakeup-eint node
To: Alexandru Chimac <alex@chimac.ro>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251228-exynos9610-pinctrl-v2-0-c9bbeee4c54b@chimac.ro>
 <20251228-exynos9610-pinctrl-v2-2-c9bbeee4c54b@chimac.ro>
 <20251230-dramatic-gregarious-stallion-15bc07@quoll>
 <yB5WFgsxeeqHQgi87UeNPD8K2OlQbWWC6-BovxADBtgusN3n8UOrm7Gi6jz6Th0dsMA9J-LEpx69sWjNmWTH_-jx9r7AgvXNTwR2hQW7-SM=@chimac.ro>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <yB5WFgsxeeqHQgi87UeNPD8K2OlQbWWC6-BovxADBtgusN3n8UOrm7Gi6jz6Th0dsMA9J-LEpx69sWjNmWTH_-jx9r7AgvXNTwR2hQW7-SM=@chimac.ro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/12/2025 13:28, Alexandru Chimac wrote:
> On Tuesday, December 30th, 2025 at 11:51, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>>
>> On Sun, Dec 28, 2025 at 06:05:52PM +0000, Alexandru Chimac wrote:
>>
>>> Add a dedicated compatible for the exynos9610-wakeup-eint node,
>>> which is compatbile with Exynos850's implementation (and the
>>> Exynos7 fallback).
>>>
>>> Signed-off-by: Alexandru Chimac alex@chimac.ro
>>> ---
>>> .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml | 2 ++
>>> 1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
>>> index f3c433015b12..deb2730855bd 100644
>>> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
>>> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
>>> @@ -48,6 +48,7 @@ properties:
>>> - enum:
>>> - google,gs101-wakeup-eint
>>> - samsung,exynos2200-wakeup-eint
>>> + - samsung,exynos9610-wakeup-eint
>>> - samsung,exynos9810-wakeup-eint
>>> - samsung,exynos990-wakeup-eint
>>> - samsung,exynosautov9-wakeup-eint
>>> @@ -107,6 +108,7 @@ allOf:
>>> contains:
>>> enum:
>>> - samsung,exynos850-wakeup-eint
>>> + - samsung,exynos9610-wakeup-eint
>>
>>
>> This is not needed. Device has 850 fallback, no?
> It's not required, but I guess it would make the device tree look better. If this patch isn't to be merged, it doesn't functionally affect anything so it can just be dropped instead of requiring another patchset revision.

Please wrap your replies.

I did not comment on the patch. Comments are in specific places
discussing specific lines. I asked why do you need this enum to grow?


Best regards,
Krzysztof

