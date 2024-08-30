Return-Path: <linux-gpio+bounces-9471-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B53966B3C
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 23:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFAEE1F22FE1
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 21:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC5991C0DD2;
	Fri, 30 Aug 2024 21:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Po/+U43R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DE114F9F3;
	Fri, 30 Aug 2024 21:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725053051; cv=none; b=oVnfsjIqxPw3FhFjAPDej4NfM+Yii1nzNeEgZRoeBBTqiYTWBp041I541yYH6e4vhSxmkz4paJQ1vBqDkEipRGSMfpj3eyu3r3OJ+60qrhim/l9fArAtZo4DBP5ZWdnhA3DfWgc9FTLawGDXkQErtq4GjGkSwGWAzKTu0WwIsv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725053051; c=relaxed/simple;
	bh=5KOKxvg2ghQhWl8PXXaCdHwNMzcTyyLWw8+6ub/Zvqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f7Mu1Wn2bPXzEExnI9Pj4f17NAm6XmPGYQx3gs77q+axVZ3yYVOD/qLFh8S+gxvObNiavZ2/qlfUBXgV8iDQo9Aqy/wlIk6o3uyaAAlaaV2gQgAr1M+nXMsUukEi1+3ODeWvHX0U4XNLVeJY4ZcnIpENFQg6cwKE5VDYupyitf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Po/+U43R; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f50966c448so25245061fa.2;
        Fri, 30 Aug 2024 14:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725053048; x=1725657848; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VqDl91BL39LB8D7D85C0xwv9gjV2PxUU/Qu1vtqvNqM=;
        b=Po/+U43RSCsJCu2yqaIND4qLqs6N4RJXwW7ZJFSL9jr/mlZpCl5FeerCn0t1EybdX3
         W02Z5ScQI/FoxCpQt8Uo9NDXS32ltykIFoyHmpRyIc56u09san5ONb89fGiwgT1SX78j
         QntCThx8xmKVV8MdBFlp6ToROAbjo9abdDhQS7ZAxcf01CGLh96QEXbsdagNCXjJMZ8x
         EGRIjWsiUpsPbiXI0mlbNM1AD/Tz1tAd3GpU49BgQl37K2Q9Kl2RhjCRS7mpjRBnqJ7O
         uBr+OElU34qhHicybFK5bjGPYJR+IKkuU9M9rIv6pJk+7uSUo9BaNWLUMpRbd+iqXGO6
         uRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725053048; x=1725657848;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VqDl91BL39LB8D7D85C0xwv9gjV2PxUU/Qu1vtqvNqM=;
        b=wc8zIikfAeeWWjGJXA9W3sP1Q1l2HeUe7Wb+BOYLL10QQeTCSeZ9KxGWFwudr+L4E/
         w1buNQV3mZAiXuBztgMfKiBMLmtdQfS+92OjHU40CpW2vS77S5yi+DR/jiVLK4ZZ3kLQ
         L1DEhTRQ/WNprGUJuntM/3DFefttDCA2FXL5NiWgPCLdAu2oV+NuSbnYcoAP1t5s9YTF
         6b50LDglAnicSq3JLzCjXQDrkIyETIreSBpeMjukLykiUMiq9O/pnCTAvGdjZrkgJqnm
         bf7VnAq0OZukvZErR2K/OrOVXeLSKjx79paCcJOeJj+YgJNplTc3RBtTSh/5YjKydEhk
         ZU+A==
X-Forwarded-Encrypted: i=1; AJvYcCW4FB9M/JtZYOtIwKEEhNoiwyummxRCYW7ZsfABcTSjATFR7OOcubgWziTs6jKHACJZ8jguopPqWP6We20c@vger.kernel.org, AJvYcCWJltAac0ojoXR+auSuy/1UB8IJVrh5iweHr2DC4amCyEYJe9o2sHEBhZKPhb/O5mbhwUIutSNPb6wx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5LEDBpb0smxrdzccZxqiF5bu1cCa3L5SrdpqUJwaXQJjQhAGq
	COSMM0XN2cidS65puC9ztS909HJ6fOhK3S0JRfG5K3LEWF8yDDPqUwtQkQuS
X-Google-Smtp-Source: AGHT+IGsuPw3U8JCUg+k68Q8uPTN9AAPylsyxHvkrhP7coiE7IATRaFQiJPZxA+76c4nHdWivQwxUg==
X-Received: by 2002:a2e:742:0:b0:2f3:f04b:5ffd with SMTP id 38308e7fff4ca-2f61054b2bamr44539341fa.45.1725053047382;
        Fri, 30 Aug 2024 14:24:07 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c577:dc00:c8fc:7251:3aa3:bb63? (dynamic-2a01-0c23-c577-dc00-c8fc-7251-3aa3-bb63.c23.pool.telefonica.de. [2a01:c23:c577:dc00:c8fc:7251:3aa3:bb63])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5c226ce5463sm2308000a12.84.2024.08.30.14.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 14:24:06 -0700 (PDT)
Message-ID: <e46d7c57-4534-41fb-a274-5e96a93488d1@gmail.com>
Date: Fri, 30 Aug 2024 23:24:06 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/5] pinctrl: intel: High impedance impl. and cleanups
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20240828184018.3097386-1-andriy.shevchenko@linux.intel.com>
 <Zs-B9m4jO9x3wX4d@smile.fi.intel.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <Zs-B9m4jO9x3wX4d@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2024 22:00, Andy Shevchenko wrote:
> +Cc: Heiner
> 
> On Wed, Aug 28, 2024 at 09:38:33PM +0300, Andy Shevchenko wrote:
>> We would need a high impedance implementation for a quirk, so here it
>> is. While doing this series I also noticed a couple of opportunities
>> to clean up, hence two more patches (1st and 5th).
> 
> Sorry it took a while to actually start implementing the quirk for your case.
> Here I'm asking for the following things:
> 
> 1) what is the marketing name of the device you have problems with?
> (I believe it's available on the free market, correct?);
> 
> 2) does it have any BIOS updates and, if it has, does it fix the issue?
> 
> 3) can you apply patches 2,3,4,5 from this series (the first one is buggy and
> not needed for you) and replace the hack I mentioned earlier with
> 
> 	ret = intel_gpio_set_high_impedance(pctrl, 3);
> 	if (ret)
> 		return ret;
> 
> somewhere at the end of intel_pinctrl_probe()?
> 
> Does it still work as expected?
> 
> 
In latest series the return value of intel_gpio_set_high_impedance()
has been removed. With the call to intel_gpio_set_high_impedance()
changed accordingly this fixes the problem on my system.
Thanks a lot for your efforts!


