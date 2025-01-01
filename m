Return-Path: <linux-gpio+bounces-14387-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFEB9FF3B9
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jan 2025 11:50:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACE36161BD1
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jan 2025 10:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6174413AA2A;
	Wed,  1 Jan 2025 10:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lHKjD6QE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5835028C;
	Wed,  1 Jan 2025 10:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735728597; cv=none; b=IIjUYZeSudpK0Dw7RKgv0TACc2nFKTqEMjtnVV2f/L6U3jlRc3ty48Hr961mtID+1zCRZrIE4c/wZ0FZchX/YQvAytyhXBQiCvcW2rv06Xz6DZCCPavmTWjD9YBYE2+UjEsOz6JBnzXHDW3hYTxHicO5EHOcrVu4HB5Rtr+aaoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735728597; c=relaxed/simple;
	bh=sIc+Grk2agCCmaMw71QGTPveln4m6ysCbraMXTFxqfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lYbfPXLFCy58BUUbjr7/cbfhZdwSA1fDhhN4mXtP5hku2sGIFGh4n2/1gVmuC8xw/Ap1pcXxDkTtYdMtRCxDd892huOdyxjO3YOiqzlg55zvZKM7o4P173TAie3rBB3w4oKs1VnIazYEJlY8KCE+4eYIIUZImuB7XflcrJJvtgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lHKjD6QE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB20FC4CED1;
	Wed,  1 Jan 2025 10:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735728596;
	bh=sIc+Grk2agCCmaMw71QGTPveln4m6ysCbraMXTFxqfY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lHKjD6QE+vt+otyFVbSqscRDhPuKjtjZPMuDHyx9k103eqwj/0G5dT2rhauiN9Ds4
	 wbeqavE8Oo1bQz6C9pkEJAcIwGxaQ/CzQNms0gL54HVtfI4pZvtu/IdUO2SLeYuZfN
	 ydFpsvMesRPQ05S2Erw56dFWySPxpoJVxV6rj5u054p4/qELNpSv7g2E0wpehBUMcT
	 QAIG8kWh6ITOjUxJL+HoEoYsgaOanZeJeW123dxRIlKzGc5raDup3Fow6rUCDk5ssa
	 697l71cO3PLThUKc9HrSyc0gqU2w6STcGB5W+SOAp1fmdiPPzoKhLTD6gYDeXBchIB
	 RtLXoeRqR/Mxg==
Message-ID: <fce8205e-cde7-4bb6-903d-7b0620b46331@kernel.org>
Date: Wed, 1 Jan 2025 11:49:49 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] gpio: add support for GPIO controller on Siflower
 SoCs
To: Chuanhong Guo <gch981213@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Qingfang Deng <qingfang.deng@siflower.com.cn>
References: <20241225035851.420952-1-gch981213@gmail.com>
 <20241225035851.420952-3-gch981213@gmail.com>
 <csu3mg7nurpwxkr6drpz6xsw3dqn5ttdotvmfkfvrwpo3geedf@jos6rqxovqr2>
 <CAJsYDVJhPdPZY9OdCr9K27Q-2YPmi7TAC-fNB8Cn2vQpCzJBog@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAJsYDVJhPdPZY9OdCr9K27Q-2YPmi7TAC-fNB8Cn2vQpCzJBog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/01/2025 10:11, Chuanhong Guo wrote:
> Hello Krzysztof!
> 
> On Tue, Dec 31, 2024 at 4:38 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Wed, Dec 25, 2024 at 11:58:51AM +0800, Chuanhong Guo wrote:
>>> From: Qingfang Deng <qingfang.deng@siflower.com.cn>
>>>
>>> Add a driver for the GPIO controller on Siflower SoCs.
>>> This controller is found on all current Siflower MIPS and RISC-V
>>> chips including SF19A2890, SF21A6826 and SF21H8898.
>>>
>>> Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
>>> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
>>> ---
>>>  drivers/gpio/Kconfig         |   9 +
>>>  drivers/gpio/Makefile        |   1 +
>>>  drivers/gpio/gpio-siflower.c | 353 +++++++++++++++++++++++++++++++++++
>>>  3 files changed, 363 insertions(+)
>>>  create mode 100644 drivers/gpio/gpio-siflower.c
>>>
>>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>>> index add5ad29a673..fdc9a89ffbf3 100644
>>> --- a/drivers/gpio/Kconfig
>>> +++ b/drivers/gpio/Kconfig
>>> @@ -637,6 +637,15 @@ config GPIO_SIFIVE
>>>       help
>>>         Say yes here to support the GPIO device on SiFive SoCs.
>>>
>>> +config GPIO_SIFLOWER
>>> +     tristate "SiFlower GPIO support"
>>> +     depends on OF_GPIO
>>> +     depends on MIPS || RISCV || COMPILE_TEST
>>
>> This is supposed to be dependency on ARCH, not instruction set. I don't
>> se anything MIPS or RISCV here.
> 
> I haven't sent any arch patches yet. The SoCs basically work with
> MIPS/RISC-V generic kernel so I was planning to deal with it last with
> some device trees.
> Should I simply drop this dependency line for now, or should I add

This would work but OTOH it is also easy to forget to re-add it later.

> ARCH_xxx to arch/{mips,riscv}/Kconfig first?

But this is preferred. For me ARCH always comes first (or in parallel),
not the last. Why would we like to accept drivers which are not really
usable without the main parts?

> 
>>
>>> +     select GPIOLIB_IRQCHIP
>>> +     help
>>> +       GPIO controller driver for SiFlower MIPS and RISC-V SoCs
>>> +       including SF19A2890, SF21A6826 and SF21H8898.
>>
>> ...


> rm drivers/gpio/gpio-siflower.o && make ARCH=mips
> CROSS_COMPILE=mipsel-linux-gnu- W=1 drivers/gpio/gpio-siflower.o
>   CC      scripts/mod/empty.o
>   MKELF   scripts/mod/elfconfig.h
>   HOSTCC  scripts/mod/modpost.o
>   CC      scripts/mod/devicetable-offsets.s
>   HOSTCC  scripts/mod/file2alias.o
>   HOSTCC  scripts/mod/sumversion.o
>   HOSTCC  scripts/mod/symsearch.o
>   HOSTLD  scripts/mod/modpost
>   CC      kernel/bounds.s
>   CC      arch/mips/kernel/asm-offsets.s
>   CALL    scripts/checksyscalls.sh
>   CC      drivers/gpio/gpio-siflower.o
> 
>> Most of these commands (checks or W=1
>> build) can build specific targets, like some directory, to narrow the
>> scope to only your code. The code here looks like it needs a fix.
> 
> Would you mind sharing the warnings you found, and the command to
> reproduce those?

Cocci prints warning for the owner and based on owner presence I suspect
there could be more of patterns we fixed over last 10 years.

Best regards,
Krzysztof

