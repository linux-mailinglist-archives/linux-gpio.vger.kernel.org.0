Return-Path: <linux-gpio+bounces-9219-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB11960CAF
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 15:55:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB48B2810E4
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 13:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A62F1C4605;
	Tue, 27 Aug 2024 13:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YD0hUqO9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A021B1A0721
	for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2024 13:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724766939; cv=none; b=nw05m5O7bdmE3gSznGH1fgjLHz1Ma5C28TpjqJ1euL/yh1tZmIuEhTuoD86dbhVeDq/R3MCd82g30KIP/0bTkMx0D+8AClQbeMxLv+HqZysH1ypHchIfo86SBqY6+DYueG3QzOoDbackCoaMVOgbGCsBxzVrMOz+V8on+r8ev7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724766939; c=relaxed/simple;
	bh=doEyiu8erVkA1Nn9Bvkv0gfFhgqCrDzLp8E4a0JNaIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g5tGW7cRE3ZHj5KzWCa3UhIyHLEO9SumTs7KodcXf+YDL7bovtC/UHsDGgU4T0JP/k/fL/h9CCub8nBscZ5U8JC01FXD4feY594EdP7L8M6wS4TFCVSmcc7ZCgLgojNftT9DVhs+iQOcPfdXGDz+gALIvL6W/b8GzyPtj21Gi3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YD0hUqO9; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-371a939dab9so585127f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2024 06:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724766935; x=1725371735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KQ8f9d+nmmK8UBHE1AxFEHiCtP3rUsOaAm/wbptmcLU=;
        b=YD0hUqO9btBAeOoIN2tMmhIkJhpP+kfYTPJtAVFH/l9wXTDg2XXRTl3q7tODSFeyWF
         fmwUE935g1UKSajoqgMYynupaCOv/JnAbczxtAKwVwhBBJwQ9Isshxmkhw+jOh41Eq46
         r+E2VIX4w+rX2AEJBUy05dAgbk/QuWaJM/AEH/gkFHk4xSeu8zvZhulujE2B1Hmy7d/6
         uQA0AswllYkRlEsKzHukCO7BBappve3camKiYpIX1WSBJsFjmegG/Qb7IpaddvY8hmKh
         eT0z51PM4krXXpLsWnjke0b9Z+fHflx+bkTVtLkRfwaP0PhwFzHfPK3go5ZpZOwuCfAy
         FaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724766935; x=1725371735;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQ8f9d+nmmK8UBHE1AxFEHiCtP3rUsOaAm/wbptmcLU=;
        b=t0vwrVEP2t9E4C5ubJNPgwnUQq/VcMzIyINYwz/aW+VPaLBhkVWidNsYGV8XZg4eGK
         esPZChlT+WBxyARp4E1hHrhkxuyBpZLXA+W16bu1Q0AiHwk3aRb6zgZM8sIBltNTl9BK
         r1K2hb1yIWh4A/o42VSYEnTjuXCSkRgdEpPvzBLU4mV/B8en8AarE+w9+fSDI5cmhM6i
         KrfQZUTDrPVCFozT0+c4o2Fy9+NmUcjZZklVsENMqKsfNECAjU1LcFGq7+8N11cN6j0s
         qOfA5zIJWOjtUBtqZI4qRENod0KiMB8gogfisl2YsL4UUhk/uZJcOVKAJQunreypCNed
         8TPg==
X-Forwarded-Encrypted: i=1; AJvYcCWmKY+5UFeEFIxKbNerRdBSsy37P7CCnIUcwZTHMc2Hl8jxglBn+pIOjO9r2/sV0dBlg7sI+ythBKI/@vger.kernel.org
X-Gm-Message-State: AOJu0YxfiHWFOMWRQxExghIANdgJjdZi2fuXws/BkhyDuYc+2oyw4tSZ
	kzkdERUg82p/W/KnubUm5ye6z+fN78jPbaeMnDb3NdsDncmTDfJ2yrfymsExbhw=
X-Google-Smtp-Source: AGHT+IHTwKaqTRsQEfPJuojrgHG0xpZHu4KOnCHEz5ciUQm0HR2pK/wy46IpVOuvDrQMYJoSJNU3OQ==
X-Received: by 2002:a05:6000:154f:b0:368:4c5:12ec with SMTP id ffacd0b85a97d-3731191d5c5mr5207099f8f.8.1724766934877;
        Tue, 27 Aug 2024 06:55:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abef81848sm225708485e9.26.2024.08.27.06.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 06:55:34 -0700 (PDT)
Message-ID: <0187710f-73c1-4ee1-87f9-384101f0c32c@linaro.org>
Date: Tue, 27 Aug 2024 15:55:33 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: kerneldoc fixes for excess members
To: Andy Shevchenko <andy@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240826161850.74447-1-krzysztof.kozlowski@linaro.org>
 <Zsy6pZ9LYDk0LOHs@smile.fi.intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Zsy6pZ9LYDk0LOHs@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/08/2024 19:25, Andy Shevchenko wrote:
> On Mon, Aug 26, 2024 at 06:18:50PM +0200, Krzysztof Kozlowski wrote:
>> Drop kerneldoc descriptions of struct members which do not exist to fix
>> W=1 warnings:
>>
>>   drivers/gpio/gpio-pch.c:101: warning: Excess struct member 'lock' description in 'pch_gpio'
>>   drivers/gpio/gpio-syscon.c:46: warning: Excess struct member 'compatible' description in 'syscon_gpio_data'
> 
> I prefer on per-driver basis, but since it's simple and I have nothing
> in my queue,

These are so trivial without impact on the code, even if W=1 reports
them, that it would be quite a churn to handle multiple patches.

Best regards,
Krzysztof


