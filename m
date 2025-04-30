Return-Path: <linux-gpio+bounces-19513-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34515AA5397
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 20:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 019849E7247
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 18:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4E52620F1;
	Wed, 30 Apr 2025 18:20:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4294629408;
	Wed, 30 Apr 2025 18:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746037236; cv=none; b=gkssEMn6xXi+4JhYgYyNS9QFoXowso1OkEpisc7xmnR8kmIAyr4bf5Qq+nlpf4SmAit6HDJ7RePQYzF5bHhhsqf3RT+QJZ3KYdjswh8ksS/coc7bknciZUJ9yweGcjKYecQVfCQPWEMtyKo3iQ91xVmVsHF2Hhng+bRyX/JVOko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746037236; c=relaxed/simple;
	bh=xZmXq/yHV4PYm9VEKiW5gq0YpRzlOAJesgu2pi+Pgos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d3krSNMh6Vj6fEp8Qoi/MsdH5pPKb1riRdyLLhlvCbwLOdaE1W6ZLjNy/k/bhOuGYoDyLIRgFTehjPhQFht34d/E9cKgi8hRisLTc+SwmV+jFU1MHiFnPDVnACRwca/Ov/Dd7LrIA8m0eeyju+U9xgM3AT29QQtbQFuD4OwTDAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Znl4k5gw7z9slR;
	Wed, 30 Apr 2025 19:47:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CRILqcdhiA9l; Wed, 30 Apr 2025 19:47:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Znl4k4hwwz9slF;
	Wed, 30 Apr 2025 19:47:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 91A0F8B765;
	Wed, 30 Apr 2025 19:47:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id CGL3eL1v_ASl; Wed, 30 Apr 2025 19:47:18 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 765C98B763;
	Wed, 30 Apr 2025 19:47:17 +0200 (CEST)
Message-ID: <11e1a1e7-7bd3-4d48-804c-45b53b5e15d5@csgroup.eu>
Date: Wed, 30 Apr 2025 19:47:17 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] powerpc: 83xx/gpio: use new line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
 <20250408-gpiochip-set-rv-powerpc-v1-2-73dc1ebc6ef1@linaro.org>
 <4a6e8ac1-b4e8-49e1-bc8a-d1854985bb31@csgroup.eu>
 <CAMRc=MesdgXAivzDnm1RW-jcxs_5goZiyKvK0-JLwqDv=9F6LQ@mail.gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <CAMRc=MesdgXAivzDnm1RW-jcxs_5goZiyKvK0-JLwqDv=9F6LQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 30/04/2025 à 19:37, Bartosz Golaszewski a écrit :
> On Wed, Apr 30, 2025 at 7:33 PM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>>
>>
>> Le 08/04/2025 à 09:21, Bartosz Golaszewski a écrit :
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> struct gpio_chip now has callbacks for setting line values that return
>>> an integer, allowing to indicate failures. Convert the driver to using
>>> them.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>>    arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 6 ++++--
>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
>>> index 4d8fa9ed1a67..d4ba6dbb86b2 100644
>>> --- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
>>> +++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
>>> @@ -92,7 +92,7 @@ static void mcu_power_off(void)
>>>        mutex_unlock(&mcu->lock);
>>>    }
>>>
>>> -static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>>> +static int mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>>>    {
>>>        struct mcu *mcu = gpiochip_get_data(gc);
>>>        u8 bit = 1 << (4 + gpio);
>>> @@ -105,6 +105,8 @@ static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>>>
>>>        i2c_smbus_write_byte_data(mcu->client, MCU_REG_CTRL, mcu->reg_ctrl);
>>>        mutex_unlock(&mcu->lock);
>>> +
>>> +     return 0;
>>
>> i2c_smbus_write_byte_data() can fail, why not return the value returned
>> by i2c_smbus_write_byte_data() ?
>>
> 
> The calls to i2c_smbus_write_byte_data() in this driver are
> universally not checked. I cannot test it and wasn't sure if that's on
> purpose so I decided to stay safe. Someone who has access to this
> platform could potentially fix it across the file.

As far as I can see this function is called three times in this file.

First time is in mcu_power_off(), which must return void.
Second time is inside a forever loop in shutdown_thread_fn(), and I 
can't see what could be done with the returned value.

Last time is in the function you are changing. Wouldn't it make sense to 
take the value into account here ? IIUC it is the purpose of the change, 
isn't it ?

Christophe


