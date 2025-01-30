Return-Path: <linux-gpio+bounces-15113-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCFCA23713
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 23:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2692E3A6CB1
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 22:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF6E1F130C;
	Thu, 30 Jan 2025 22:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="cLfe2irU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A1D1A83FF
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 22:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738274839; cv=none; b=IymAC4eRH43UJJeHRYkqJvWW34Ok+E0704afCvBaXUOAdO8X7WJ+/ECRiiBd7ES8U9N+0UBrVG09gtojdg0saBcSfF94igw1AGyJ9L4NfFqhY8p4LZtAu2QiilVlRDmTTl5ZLvQl9UumeDaGk1Kf2YcvzZnDL5hKCDREcTS0hpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738274839; c=relaxed/simple;
	bh=avmLgW8CPE51ZDwazO1xFMxHhJYKjjX6F/hB51cmtMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8sfRp24nGwlIXkbD3jXgckd9rMgww0iFLUhlgWGcPbOEdsAj5RaeKDER/SvmyPB6YNo1XMOvD1Uu+ngqVEGwZkE//+xH0nFhuobkaqaLwaWBtYos32fjaO1Y/A45MJVwJhN6wW9xcnD8fvFBnpiaAX4Imj/zf9Tdt4QtJD+m7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=cLfe2irU; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-71e17ab806bso748607a34.2
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 14:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738274835; x=1738879635; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x9PWxbMV+pc41ZeRuYe5n6UZdKx3ea5g4GHydSXEvtY=;
        b=cLfe2irUD0e0gv/zu4XyQPj2tRuucocCGnSxoqLLxB+e83+Z/oToOPFvTLhm9ng2yn
         nj1ElHU5T3cLQ1IaM7va+cR+QS0jV42RluafraIbm4xoPjdXV576+n4nZd1lTRgYUfvS
         WbV4/SGIgsDmLRR/YN3JRhajipRTqo4FL2RPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274835; x=1738879635;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9PWxbMV+pc41ZeRuYe5n6UZdKx3ea5g4GHydSXEvtY=;
        b=ppv+PE19X87tvUngTuhkLNtE/yx457Dv7f/kVq90qj7PGalT+QWhCpHadQVVZQhHBB
         3RqvSjOZ7F9LBoqHojnTknMKvh5AA5B1fv6wHtRZfsCiWL3ky3D9Os5WHbefaCDSQ3C8
         KIbBoeRaJaASohgcRrp3/rJi7YYEGzD6GCYgy6q693ioj4Op7D4dkJPjb3D361qc+5Y1
         MWsBbbYFDmf38ivX+zPR1HwobUcbPapQM68FTIX7nX0yRzPwtGhsit8RrvXkLzCLv4SH
         NjskcRo8HlANiIMOdMyYIkq6RkYu3NVhCZQOyyvdhfcJnxh3kwTtIk6YCli7+dqQgTxM
         rdKQ==
X-Gm-Message-State: AOJu0YxMYKTk4ypayTPTk2dQNoSlIBizljyfBNMu3rINOtKsAJoP53AJ
	46frLK7sndTi7Wlx4msDglwrLqmEWqZMNAbGafq4IxR53wIFIGLhKhsp1S3uFg==
X-Gm-Gg: ASbGnctktszzv2eNTypnswIXSCxUt+sHrcxCQEhuX6UlUxcow3JYyKX/ZHGQADzkpAu
	nlng1MfLlV70rWBCWVCSFe1HoBBVTjvjhvhHYGNMm3DSTOMZ+a3TbejRBMPrO5ObEuepvPU/Fjp
	c63xRRS72HXGTy8UNKOXJ4L5PIilmN+e5mNx26n494zaHWyC3MKh/JZoKsL3on5nhRW2nuwqsOa
	Mdph+652SxNP8xB2bjUSKxbUoHY182oHMStZdrS/utzirREyej/1xCcRNH2lqr5Jg89N8yiBh/K
	t7ZI9t5Efvyec+ALO87v0knH/jeHQXSDslhB8jIZH0NURyDb8LfigAw=
X-Google-Smtp-Source: AGHT+IHDaNlt4S67Jjd7nYnaKKLenYdWvvL+1raluenpuKxu6pzj9agQZyPjQ99ELLdpEVnU5sZ+6A==
X-Received: by 2002:a05:6830:3696:b0:71d:4488:19ed with SMTP id 46e09a7af769-7265673213cmr6436451a34.5.1738274835142;
        Thu, 30 Jan 2025 14:07:15 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726618c8aefsm526589a34.67.2025.01.30.14.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 14:07:14 -0800 (PST)
Message-ID: <2018dc60-1cec-4575-9005-cb543c7c1856@broadcom.com>
Date: Thu, 30 Jan 2025 14:07:12 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] gpio: bcm-kona: Make sure GPIO bits are unlocked when
 requesting IRQ
To: Artur Weber <aweber.kernel@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Scott Branden <sbranden@broadcom.com>,
 Markus Mayer <markus.mayer@linaro.org>, Tim Kryger <tim.kryger@linaro.org>,
 Matt Porter <matt.porter@linaro.org>, Markus Mayer <mmayer@broadcom.com>,
 Christian Daudt <csd@broadcom.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250130-kona-gpio-fixes-v1-0-dd61e0c0a9e7@gmail.com>
 <20250130-kona-gpio-fixes-v1-2-dd61e0c0a9e7@gmail.com>
 <9965d0b3-f169-45c4-9345-8588865a2ca4@broadcom.com>
 <4af2c24d-1c79-4119-a112-eeac1112d49c@gmail.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <4af2c24d-1c79-4119-a112-eeac1112d49c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/30/25 13:46, Artur Weber wrote:
> On 30.01.2025 22:35, Florian Fainelli wrote:
>> On 1/30/25 09:10, Artur Weber wrote:
>>> diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
>>> index 
>>> 77bd4ec93a231472d7bc40db9d5db12d20bb1611..eeaa921df6f072129dbdf1c73d6da2bd7c1fe716 100644
>>> --- a/drivers/gpio/gpio-bcm-kona.c
>>> +++ b/drivers/gpio/gpio-bcm-kona.c
>>> ...
>>> @@ -87,14 +103,25 @@ static void bcm_kona_gpio_lock_gpio(struct 
>>> bcm_kona_gpio *kona_gpio,
>>>       unsigned long flags;
>>>       int bank_id = GPIO_BANK(gpio);
>>>       int bit = GPIO_BIT(gpio);
>>> +    struct bcm_kona_gpio_bank *bank = &kona_gpio->banks[bank_id];
>>> -    raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>>> +    if (bank->gpio_unlock_count[bit] == 0) {
>>> +        dev_err(kona_gpio->gpio_chip.parent,
>>> +            "Unbalanced locks for GPIO %u\n", gpio);
>>> +        return;
>>
>> Don't you want to release &kona_gpio->lock here?
>>
> 
> If you're talking about the "raw_spin_lock_irqsave" call above the if
> condition - note that it has been removed and was actually moved below:

Oh my bad, my eye corrected that - to a + somehow.

> 
>>> +    if (bank->gpio_unlock_count[bit] == 0) {
>>> +        raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>>> +
>>> +        val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
>>> +        val |= BIT(bit);
>>> +        bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, 
>>> val);
>>> +
>>> +        raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
>>> +    }
> 
> In general, the diff for this patch did not generate very well, sorry
> about that. I'll see if there's anything I can do to improve that in the
> future.

Nah that's fine, thanks!
-- 
Florian

