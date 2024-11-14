Return-Path: <linux-gpio+bounces-12996-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DC19C8555
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 09:55:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95E3B283E0F
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 08:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D231F7098;
	Thu, 14 Nov 2024 08:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQ34QGm2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7C91632DE;
	Thu, 14 Nov 2024 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731574547; cv=none; b=pSRjBrg0D64hdRNEgasLL5PioU0hfT9ZZDS4nwx72bnbnMTG4A2ldGd8qJlqcRNFcqLAzpqJybNRcFpViMySV3ceucsZUZL8G52YhqdgOW6XtvyfpPTO4Iv0tN4uKJ0gbVv6wdFOXr2w+AC6NfMOl58ac5Qe5qHaZChSt6CC8J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731574547; c=relaxed/simple;
	bh=TkxIOIovwNajsZFJ6RBhTpSPwDS6s5mYhlrRqe+QLFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPg7l+5SKURDk2cHbd7sqqkIohYchBavd89B8IqVcPamskWPYDCSJ4uvwoV6bf7vPMxYlQ7eFz9zRF4rjTnSjtvjBB1CcZFaXd6/78j3h3E0DenB2lDq4tifxjRI5IfSR4LD0UWBQyfoP6thXtjYKlfXwLou8+6h0Ekf0qkj7Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQ34QGm2; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7f71f2b1370so236311a12.1;
        Thu, 14 Nov 2024 00:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731574545; x=1732179345; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MAxKdMCwU/O7JlHPbS/usiuaiMurklu2uvAF84TuHD8=;
        b=XQ34QGm2XA4jYPAHvLG2S/g93wWRFH1TDXW66yxyjBMoP+z1iy4jaXEw6YizdxkGvk
         Da4ISb+bYOwlTP0CSOj4l6O4Ow9YT2DP9Kjt0bBYmW6ltFYdxWUm4BLJ2aOcMHuYGU9W
         dzeHyk3iGS2xDpWdZ4SgsepSvykXXaW965HSU7k1mNvqNTO7+AbfDYTP5E6h1buVO8Pm
         2aqoB91PE3PjZsULIwFSy+gBb+CqZA6IMvqQcnhnZWWLU89Y+iE9Vnj+dAzJqMt3NESx
         ml1FFjiLwBb0l8QejPwan8+ffBa0VaXBCgykKSzJrNt/chimMJhgUADiA3BP6Hu0ft91
         JeXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731574545; x=1732179345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MAxKdMCwU/O7JlHPbS/usiuaiMurklu2uvAF84TuHD8=;
        b=LxFJQp4Cp8Co5XMV6oD19K07ddaUbFn1q38rq/bd8bLyBlGAzyeFk+wZJr0nSS648V
         2R4PfS0Fk+q6FMloSHL03DGfCtJMC/tkHDP2aEvY2BoDNnR9Mq4P43w6hWPzztpEUY2M
         h+QfVeVUJmbuAbf4krQa/ec3fc5IQc17K4gWSkLDHBhwNV55mjRwUXc6OVljsLPfiS4R
         mMC3OfVDjh9xHWV3Z8MjRXAMIXrVIOKQeY8aG5W6N3DWYmVeE6NxfXf6BZ9MOhg0740p
         qxcyrPx0wH/4lWlR/H9t1nkYOq75wLSWuoslOuv0OpxDdA9DYZqtaWuP3MpK2QdY13Up
         4GdA==
X-Forwarded-Encrypted: i=1; AJvYcCWRQfwQPyyuQjog6dkZyRo61267gIqf8NZwT713zoerythYfkGwV4U8Gd2It1b310r13THQyJmMyGmL@vger.kernel.org, AJvYcCXHISxk93oZ4sL3Ggcc26Dhjsqzo0o/vm3jhE+L5d4fAGj2ORx1s8ASqFfT7/nUKVb/NSIdxW5Ox9oDT1pr@vger.kernel.org
X-Gm-Message-State: AOJu0YxsCtbQN0HlHF2Y9/cTe0f2purHZd+IRHwnZgDgX+b/7l0/qwgG
	VcO8JT2QY1mqYdabIFH4HU2xpn7vOdavUuUnmY7+WPvwiiwobyMs
X-Google-Smtp-Source: AGHT+IHb93UBBE+ThkYql9b01kCNd0a9Zcbo+o+Kz3HWoYFBIgnvpJTqYlsHn8Zt2ETIfowQsVYtRQ==
X-Received: by 2002:a05:6a21:339e:b0:1db:d920:ccc5 with SMTP id adf61e73a8af0-1dc5f8ed3aamr14081403637.13.1731574544992;
        Thu, 14 Nov 2024 00:55:44 -0800 (PST)
Received: from [192.168.0.198] ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7246a5cedabsm750100b3a.30.2024.11.14.00.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 00:55:44 -0800 (PST)
Message-ID: <72d1ad84-de90-4378-96a2-8f01252a890a@gmail.com>
Date: Thu, 14 Nov 2024 14:25:35 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: gpio-exar: replace division condition with direct
 comparison
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241112201659.16785-1-surajsonawane0215@gmail.com>
 <173151185740.90976.5826366364572229214.b4-ty@linaro.org>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <173151185740.90976.5826366364572229214.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/11/24 21:01, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> 
> On Wed, 13 Nov 2024 01:46:59 +0530, Suraj Sonawane wrote:
>> Fix an issue detected by the Smatch tool:
>>
>> drivers/gpio/gpio-exar.c:52 exar_offset_to_sel_addr() warn:
>> replace divide condition 'pin / 8' with 'pin >= 8'
>> drivers/gpio/gpio-exar.c:62 exar_offset_to_lvl_addr() warn:
>> replace divide condition 'pin / 8' with 'pin >= 8'
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] gpio: gpio-exar: replace division condition with direct comparison
>        commit: 8f0aa162bcf818631e845c2e6c090c7b3c64fd9d
> 
> Best regards,
Thank you for applying this patch!

