Return-Path: <linux-gpio+bounces-9423-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 283BD965727
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 07:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56D331C22AB9
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 05:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B6E14B061;
	Fri, 30 Aug 2024 05:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YTbGKm/h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA1422615;
	Fri, 30 Aug 2024 05:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724997376; cv=none; b=kSfRoqJWgY3WY8/1HsDhl6umX8nbLPyIrj796YpWa3mQPRYUc1ymeHawJb4GKJraiONeAaug6TY+7hDwkzKSykIATmglbrzuFeb9uvMztAVFgYpEBak8XNWaNG+WYKz4qg4V+bvs8K2pQGhENqPKtvnAv60489SkFbVvkMG50dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724997376; c=relaxed/simple;
	bh=cyUGBPH6jtevEUyJoznq85ftO2ISltRLuMtmf7myHkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GUDcJqY+dx5uhExDTGx+2x27iEk+WtmlIEVeDGb91+96qJGfXSIP30CLP5G2PxK/Q3OdNf74Ab3jc0TtJZ2dV8f2ESXjN+B9e5+lsnUhXNw/sMEVFR+hliLZ15VehpMVG2/FFXzmKNBzL3/ks/jUuN0XIF0RRdJ3hBRVg0f6zco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YTbGKm/h; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a7a81bd549eso142767666b.3;
        Thu, 29 Aug 2024 22:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724997373; x=1725602173; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dmaK9yXGDkfaaoKQC0QquO3O2dAxsqNTqltc0sGWtbA=;
        b=YTbGKm/hbJN7qnekdmP4ty22iQjRJpRdrVGMD6c9enwlgzKIYREXqIgEB+0F3PEihM
         q0tYrQAseZZRMfGJd2ysO8PpzAJFrFk/FYY/vtTcbn71f0nOjvoik8Y4TlSBxlDXWZha
         oBbxhE/3h49H+S+WthBx0FRHM9UUK+M5WczH+ZBc41/Bls/GdQhXDLgDyiz2s+Jyl94Q
         1CYAm91fzRfJaXCBj65OIMQ/68zBnEayUvzLWF48bNsbQT9byWzTAhwshg5iHO6EBIE2
         rQjwN+wH0jz/ih2bnKjTTQWI98lkWdBc5JYBOwOOYrzoVJtx48ByeCwro1Tqsyv0bxwl
         Nt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724997373; x=1725602173;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmaK9yXGDkfaaoKQC0QquO3O2dAxsqNTqltc0sGWtbA=;
        b=hp7AdJoCH9eQuB2F0uwGMAZsmaCNz3hE4C7o/+opiClm+ri5zthbHD+dlulPdSgPuU
         ZYspHBDegugxuyEyLvVRexBn/kzsuxDYOcrYVN36SKDIEEoeS9g980YzfKnGMOu0BqCs
         I5O0662bfSQb87udBNdU4nZZ6MWgS6yZsQbk/H9q5oaOX6GNtGTKa3u2D1+lTAH9h7+e
         uaQrYeOH2SDg6mdZO3VvooC7Sb3do03byOlDDM2V55zLqEkuH3nTWTtXpFMqaDMhCcWh
         DCA/QXdqL7OCsZhofFNIsgLKlqG8wyAtnelT4YOWtBeZY+AxfSFtzUA4LzqonBI670e5
         1Myg==
X-Forwarded-Encrypted: i=1; AJvYcCUHbKh0N5vpP6WjtUy0+Zly/e8NVxkwKOI89/s0cZxt2/Af5Fpub+vYxZywXHW4DddpESjxOti1hVSaJDYY@vger.kernel.org, AJvYcCWRhvWloCPbgFhgsyeLRCC9gSodCSlLZB49ASvZzbg7ddSKjdSMdjPSFHdDqZviAOqPxH+vJYqBCqda@vger.kernel.org
X-Gm-Message-State: AOJu0YzbRRPQxJYmuyKafsyA6ygVLf4U7nd2wmDGS24Obd0ZAPwJBxJu
	uoRz0MfsFt21ToWFYiztdxvQNbciW87S0uQVCYTUWHCZQwu4GFuT
X-Google-Smtp-Source: AGHT+IHsULRYo9z1QH/4NddIBdvBMbhvn5uaP3O5ds2dgND2gDpY2sp9hvDc1u8QCplg2dXc3rihbA==
X-Received: by 2002:a17:907:3fa7:b0:a86:b00a:7a27 with SMTP id a640c23a62f3a-a897fad07f9mr360474066b.60.1724997372587;
        Thu, 29 Aug 2024 22:56:12 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c577:dc00:45fe:38ba:a095:abab? (dynamic-2a01-0c23-c577-dc00-45fe-38ba-a095-abab.c23.pool.telefonica.de. [2a01:c23:c577:dc00:45fe:38ba:a095:abab])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a8988ff0465sm170202766b.29.2024.08.29.22.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 22:56:12 -0700 (PDT)
Message-ID: <974bbb25-3b27-4f53-be35-4bfda17b8c7e@gmail.com>
Date: Fri, 30 Aug 2024 07:56:11 +0200
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

Device is a dirt-cheap mini pc, marketed as Chatreey T9. It's available
on the free market, right. Dmesg says:
DMI: Default string Default string/Default string, BIOS ADLN.M6.SODIMM.ZB.CY.015 08/08/2023

> 2) does it have any BIOS updates and, if it has, does it fix the issue?
> 
No BIOS updates.

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
I will check.


