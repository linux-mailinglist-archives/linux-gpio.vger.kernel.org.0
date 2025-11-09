Return-Path: <linux-gpio+bounces-28272-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0EFC4456B
	for <lists+linux-gpio@lfdr.de>; Sun, 09 Nov 2025 20:02:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CCEAB4E1080
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Nov 2025 19:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802D322D4E9;
	Sun,  9 Nov 2025 19:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2gpJyA5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B83220698;
	Sun,  9 Nov 2025 19:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762714934; cv=none; b=uvI194XoHb+YL6VCsSqNnsh4IA18T2zaonrikPVaGQm7Wk8X5X7SOfNfEPCcWvdsYZppJY914JLe5OfPef5vJuI+YBhqQIYGl6JXfy8yuBaAjYo8Z+3Ge0P+DOsxQIWtgM/IW1WYd27YO4pKtv4wu8s+Yv1ZC1X9xigIiYdGWOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762714934; c=relaxed/simple;
	bh=QuJv+ky6ElOvQzuR3YLlBAsFoyVB2/pMwya6g5QXci0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VPN0jlCiuWbxxex3E/n6sFj/PRzKPicn72Kb5NghIZiF9FsZBZ3t9XEaiyzO/fGf9FQ2v5SRXrkT+jU5i3FXEgcgoALWOyuIkyzH/Awy3lTduFBJ7FgIncrsO8wiwTdhuNIafH6iwUGjE2yYZmZ1iNt4KtHkS1/Qf/r/M5W39gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2gpJyA5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8AEC4CEFB;
	Sun,  9 Nov 2025 19:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762714933;
	bh=QuJv+ky6ElOvQzuR3YLlBAsFoyVB2/pMwya6g5QXci0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m2gpJyA59nXN+WbphfcSyf4V2aUeDVz4YCGzRXhYkU/Wy4d73yFB9/IXV1pL/p3fd
	 2vijHNLfZFn2/JOFX7TiFnDMB6QRIOR4sXXI93kFkP7sgvEotpW/noGbA3XTI9rEUW
	 8ApcG5gBByPC6Ph4YB/nMeqFrxJdGRUNmZeySUo9HKmrFl4Mf2Yn0aE65HW+ohw8ME
	 EzMaPLrDNg57NPv3eLCuSt6uA9GMrCNz7UkGfMJi+g+zSjy2USzRza/3QUMGflxsd5
	 xeAJTgrrlQdhPy+mvJ0VGy8G1shJ/6u18JYhv1yEoYuGSOi6GM3IuXr2BgaIHLo5Ay
	 CfpmB43WYumuQ==
Message-ID: <c88d20d0-0b0a-42a1-98a6-d81609bcfda2@kernel.org>
Date: Sun, 9 Nov 2025 20:02:08 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/20] dt-bindings: firmware: google,gs101-acpm-ipc:
 update PMIC examples
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
 <20251103-s2mpg1x-regulators-v3-7-b8b96b79e058@linaro.org>
 <20251104-awesome-tacky-magpie-bacd9f@kuoka>
 <fa2e704a2f295f2c9b2c7811e8ca89972554ff7e.camel@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <fa2e704a2f295f2c9b2c7811e8ca89972554ff7e.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/11/2025 15:08, André Draszik wrote:
> Hi Krzysztof,
> 
> Thanks for your review!
> 
> On Tue, 2025-11-04 at 09:31 +0100, Krzysztof Kozlowski wrote:
>> On Mon, Nov 03, 2025 at 07:14:46PM +0000, André Draszik wrote:
>>> In a typical system using the Samsung S2MPG10 PMIC, an S2MPG11 is used
>>> as a sub-PMIC.
>>>
>>> The interface for both is the ACPM firmware protocol, so update the
>>> example here to describe the connection for both.
>>>
>>> Signed-off-by: André Draszik <andre.draszik@linaro.org>
>>> ---
>>>  .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 40 ++++++++++++++++++++--
>>>  1 file changed, 37 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
>>> b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
>>> index 4a1e3e3c0505aad6669cadf9b7b58aa4c7f284cb..c25e155926e5f44bd74f195cdbff3672c7499f8e 100644
>>> --- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
>>> +++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
>>> @@ -45,6 +45,15 @@ properties:
>>>        compatible:
>>>          const: samsung,s2mpg10-pmic
>>>  
>>> +  pmic2:
>>
>> pmic-2
>>
>> Are there more pmics? Bindings are supposed to be complete (see writing
>> bindings) and if you did follow this approach earlier, you would nicely
>> call first "pmic-1" (instead of "pmic") and then "pmic-2".
> 
> There aren't any more PMICs on ACPM, no. At the time 'pmic' was added, it wasn't clear
> unfortunately that two nodes would be needed in the end.
> 
> See also https://lore.kernel.org/all/963bbf8db71efc0d729bb9141c133df2c56881fc.camel@linaro.org/
> 
> That said, I believe we can change the existing node name from pmic to pmic-1 without
> any driver breaking. The sysfs path would change, but I don't think anybody cares about
> it at this stage, so I think such a change would be fine. The ACPM driver doesn't care
> about node names and instantiates all children regardless of name.
> 
> I propose to update the binding (and DTS subsequently) to add pmic-1, to allow 'pmic' as
> a legacy fallback (i.e. to not issue errors during validation of existing DTSs until
> they're updated) and to use pmic-2 for the 2nd pmic.
> 
> OK?

So deprecate 'pmic' and add new 'pmic-1'.

Best regards,
Krzysztof

