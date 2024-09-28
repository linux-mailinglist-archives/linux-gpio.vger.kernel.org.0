Return-Path: <linux-gpio+bounces-10533-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0050A988E70
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Sep 2024 10:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1C411F21747
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Sep 2024 08:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5540D19DF87;
	Sat, 28 Sep 2024 08:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IB2hBVEX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B35E1487E2;
	Sat, 28 Sep 2024 08:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727511715; cv=none; b=GLFGrwSlnz6heSGdljcDQG8ssFVWqHH9qQZOBHtAfZcWCT2blm6aDLe9xdW9acWvUgyqRr/w6SkqXydrIkcrnfWmPvzUpCVmNu6WIaeUY34kwdwmsC52buvuQ/Wpv5GIWiQeHWGhUUo006tjM3aULjTUaQpMOm+Ew9SAmGgyKHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727511715; c=relaxed/simple;
	bh=5fOanKY7FxjCR0nN5e/yRmeV/6E6+Fe3b6Wq3+dnoaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qG5EhXABH8WNwlEqvyBuB4VOl7b45Ly+qhGFF71qDWiz58x2R0vMbgGD51wTCS2ZSxrbJ0DtnR5PyBhJCaH63/H69dbZlGXaNExhRjVdfhO7cAVUZ1ugru41MwUi8Wj+fInoBEWFL/P7o+7KCRVpyuBWJfeiNrKhK2pL6gmDSkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IB2hBVEX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0D5C4CEC3;
	Sat, 28 Sep 2024 08:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727511714;
	bh=5fOanKY7FxjCR0nN5e/yRmeV/6E6+Fe3b6Wq3+dnoaI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IB2hBVEX1/cHCPANjz5BKIosRx35MSy+1rlibcPpL12XGhVBQv0zi56tVEyv1ljxn
	 BCNt0s4FSfz3z4LVd8djt5MYQ/5Mrzhxcw2wt6rvSRrxv95Hfe71BVVhJA2raTUIst
	 sQOeU/eozgPjIYjl1zWX/8sqZ4iQb5D+DSDYDcqxIVr/bKv3Pb76MZK5o3l00eHM+a
	 NrS+Xey925Wr2gDqG/ej1eJ0u5PEs0DC/2WrTPwklRigDD3J8nryDobKeLpTcMV09a
	 JTNq7BOvCi981gW/4FaS+K6B9oHcgBJaZijfEIoeAbtUAz/ZY8ojEbWAjkuSzTTM8Q
	 DOC5wj2ouIGQw==
Message-ID: <4b7a8888-e43d-4a90-bcf1-a09c83117d4b@kernel.org>
Date: Sat, 28 Sep 2024 10:21:47 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: gpio: add support for NXP S32G2/S32G3
 SoCs
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: Matthias Brugger <mbrugger@suse.com>, NXP S32 Linux Team <s32@nxp.com>,
 Chester Lin <chester62515@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Christophe Lizzi
 <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, linux-gpio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org
References: <20240926143122.1385658-1-andrei.stefanescu@oss.nxp.com>
 <20240926143122.1385658-3-andrei.stefanescu@oss.nxp.com>
 <172737263813.2649710.12417820280324530724.robh@kernel.org>
 <0db056b9-f420-40b7-8757-ed572c65c817@oss.nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <0db056b9-f420-40b7-8757-ed572c65c817@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/09/2024 09:19, Andrei Stefanescu wrote:
> Hi,
> 
> On 26/09/2024 20:43, Rob Herring (Arm) wrote:
>>
>> On Thu, 26 Sep 2024 17:31:19 +0300, Andrei Stefanescu wrote:
>>> Add support for the GPIO driver of the NXP S32G2/S32G3 SoCs.
>>>
>>> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
>>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>>> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>>> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>>> ---
>>>  .../bindings/gpio/nxp,s32g2-siul2-gpio.yaml   | 110 ++++++++++++++++++
>>>  1 file changed, 110 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
>>>
>>
>> My bot found errors running 'make dt_binding_check' on your patch:
>>
>> yamllint warnings/errors:
>> ./Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> 
> I don't get this error locally:

Really?

The code is clearly not correct, wrong indentation, so if you do not see
the error, then something in your setup needs to be fixed.

> 
> $ make DT_SCHEMA_FILES=nxp,s32g2-siul2-gpio.yaml dt_binding_check
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>   CHKDT   Documentation/devicetree/bindings
>   LINT    Documentation/devicetree/bindings
>   DTEX    Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.example.dts
>   DTC [C] Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.example.dtb
> 
> $ pip3 show dtschema
> Name: dtschema
> Version: 2024.9
> 
> $ yamllint --version
> yamllint 1.35.1
> 
> 
> Lines around 25:
> 
>  20 properties:
>  21   compatible:
>  22     oneOf:
>  23       - description: for S32G2 SoCs
>  24         items:
>  25           - const: nxp,s32g2-siul2-gpio
>  26       - description: for S32G3 SoCs
>  27         items:
>  28           - const: nxp,s32g3-siul2-gpio
>  29           - const: nxp,s32g2-siul2-gpio
> 
> I initially had the reported error but I fixed it locally by adding the following:

I don't understand. So you had the error, but you fixed it, but you sent
wrong patch with the error?

This is just confusing. Re-apply this patch (b4 shazam) and test it
again. Please keep testing till you see the error, so you know your
environment works properly.

Best regards,
Krzysztof


