Return-Path: <linux-gpio+bounces-25095-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5243B3A170
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 16:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CC061C86202
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 14:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D351F5433;
	Thu, 28 Aug 2025 14:20:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92259313E37;
	Thu, 28 Aug 2025 14:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756390842; cv=none; b=Xqm6D7os0hETGYNfNdk/jRtZE2OV7+iVUqdsj+48GVF0QIODtW0lRlYPE656mXWWEVsyrreRoJ2Th2EUQPtHCOKDkhbsA3kiTc98RfBNtXhv7yYlklZ1uw4h3Fp+46NpMqRSB4P9/RSDjF10FQ9gtR/eew0UnuLtDXXbOgoTkhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756390842; c=relaxed/simple;
	bh=2ZDkyCkiUNxd9czcFDf14yKQeJWgfOrXp25aVmloVWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HC65hPGU6xud9XIxmhH7QbOWDTz8KAvk8hxRazfz4mzy1Ie0V76aEZEKE1l9+qiNg0fxc/v9ioGinnl2fDExpiOUF9qgslzwWhRjSjJWv7M6N/TC/QQNE64SM6mEEs2yeqKVjh3iKJh036NTemeGyXaQao3Wtox8XC9GNRLShAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cCNdk5SrLz9sSN;
	Thu, 28 Aug 2025 16:12:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ctYw9B2ysKGN; Thu, 28 Aug 2025 16:12:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cCNdk4lLRz9sSK;
	Thu, 28 Aug 2025 16:12:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8D9F48B764;
	Thu, 28 Aug 2025 16:12:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id rt_hf7oHqOmD; Thu, 28 Aug 2025 16:12:42 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0BB338B763;
	Thu, 28 Aug 2025 16:12:42 +0200 (CEST)
Message-ID: <f21e27da-de26-4835-9660-b39e99695281@csgroup.eu>
Date: Thu, 28 Aug 2025 16:12:41 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] dt-bindings: soc: fsl: qe: Add support of IRQ in
 QE GPIO
To: Rob Herring <robh@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1756104334.git.christophe.leroy@csgroup.eu>
 <17636607f2beac3b64c87b3bec035fa27ce8d195.1756104334.git.christophe.leroy@csgroup.eu>
 <CAL_JsqKFvVQTVXV8mWX0z1=hd3nLDzLXq-0G_0bshMCvQ5kVvA@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <CAL_JsqKFvVQTVXV8mWX0z1=hd3nLDzLXq-0G_0bshMCvQ5kVvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 28/08/2025 à 15:28, Rob Herring a écrit :
> On Mon, Aug 25, 2025 at 2:20 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>> In the QE, a few GPIOs are IRQ capable. Similarly to
>> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
>> GPIO"), add IRQ support to QE GPIO.
>>
>> Add property 'fsl,qe-gpio-irq-mask' similar to
>> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
> 
> Why do you need to know this? The ones that have interrupts will be
> referenced by an 'interrupts' property somewhere.

I don't follow you. The ones that have interrupts need to be reported by 
gc->qe_gpio_to_irq[] so that gpiod_to_irq() return the IRQ number, for 
instance to gpio_sysfs_request_irq() so that it can install an irq 
handler. I can't see where they would be referenced by an "interrupts" 
property.

> 
>> Here is an exemple for port B of mpc8323 which has IRQs for
> 
> typo
> 
>> GPIOs PB7, PB9, PB25 and PB27.
>>
>>          qe_pio_b: gpio-controller@1418 {
>>                  compatible = "fsl,mpc8323-qe-pario-bank";
>>                  reg = <0x1418 0x18>;
>>                  interrupts = <4 5 6 7>;
>>                  interrupt-parent = <&qepic>;
>>                  gpio-controller;
>>                  #gpio-cells = <2>;
>>                  fsl,qe-gpio-irq-mask = <0x01400050>;
>>          };
> 
> You are missing #interrupt-cells and interrupt-controller properties.

The gpio controller is not an interrupt controller. The GPIO controller 
is brought by patch 1/6 and documented in patch 6/6.

> 
> With multiple new properties, this should be converted to schema first.

Ah. I didn't know, and checkpatch.pl doesn't know either it seems.

Christophe


