Return-Path: <linux-gpio+bounces-3759-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE05867493
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Feb 2024 13:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F23828658B
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Feb 2024 12:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A22D604C4;
	Mon, 26 Feb 2024 12:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NKfEe9PE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F07A54BC9
	for <linux-gpio@vger.kernel.org>; Mon, 26 Feb 2024 12:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708949857; cv=none; b=L0Tn4sj9JrAfWnjoHD2cYvAduGlERziAvfxx8xLQ9ujxCMyKDWcL49SHnwfTwj5fqRIX5hlhJB7zdo389MsXr5EEqhh0O5SZw0cw8r0S5ywUQ7QrpMtOccBUwjlt+yx6AVij3T7MVUfixdUZP5gBBzeMuzXlW88ZcFwqzqtloBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708949857; c=relaxed/simple;
	bh=OGa8p8GgC/sb7ZVi2Q9MDNE+Wiv/ZCXz/jfCrGqA2yI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JGrbQPVFH2ENbz5Hkm2OCL/yMm8/vOYLn0cwSwLSmmgrJ/WB+CVuQvDqBwnvFeHcWZen3veh5OlXB/cG0V8XlVYm8zAsil283DP6JZcBoY7H9rzpNljFbJAr8sgB6TU8+8+szlosGftNPamCDce2DPje5lXBJdNT/bp5fmQii/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NKfEe9PE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-412a45f4766so6570135e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 26 Feb 2024 04:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708949851; x=1709554651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cjYNEFjj+8Br1K/kWVmcw1ELzUHGJ7r8kZWsJb6hqRI=;
        b=NKfEe9PE+8DLfYH962wdrzgAynjfJzZR4bZvzvomOX1I0vEMXYYcGVHM3ZnYIvyyxF
         E7olb6ccQFbnKJ0g+C076g/FTjD7GjsgGexR0k0DSvD5VFbGPcdx9wyV3LQhtRx369CP
         DOwYAzgpGZ80gJLj6mmvJVkiQQFaBDCc8QVltCCh9vGwizwl5Vji3IXUF7eU2sXPCgv6
         hPswyDGHxWctKfargV7OX6j8PgjE7MA0nOUKuOjwLlZpiWk523PA/Rg67xUcsvKPsE7j
         8scMRJJ18R1c4qSX71mSfYIVprMOPVzycYEHCowU14AMOe4j04Ve1W9SfY8xZnm0VMvI
         F5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708949851; x=1709554651;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cjYNEFjj+8Br1K/kWVmcw1ELzUHGJ7r8kZWsJb6hqRI=;
        b=OSXiLUc62zXwLiy6I8KIG0MOzX0TTqFekHyVvqxsoMU0scTFKl6aQlE2pZ/2NKCMut
         zvubVp5XDUUI8+q+Rnk7iJiegEvsSSH34L43tWrHtWiCrlL4vk0K6h2O72O5XqVrKCAp
         1gXYBALwD2nPIgOjfFBS5MqkFXRQdGiosMaO4hXriNbE9IUjkFWFFtIr6faSbJukLIKY
         Rz8bYvngn/d25h+nqmkR1izZhKXUcph4wfMh1zijgV1V7Er02rdJTYfgf78YWDzZd6AL
         rUgpnxg/6/kPY0pRa/LkzU25YuRiLNg0a0HuboPXl8aS8StoMrt8RecCzEyoODbc1btc
         sj/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWn+ymyWRlJI2DmiCSlhxDF7rASqpiXf48VaSikIJOt+RhVGoe/bUKgYkx5o5OwZI/EmqH3Rp0NVl9/iEA6oLwJY22M3SsKyeL5pw==
X-Gm-Message-State: AOJu0YwWuaJr18wb0z68w281zSrovyDLc0sd0woo3YiFbT+TJLdPu+Tc
	OCiNc1fihzJHMBiepXiYqkMOZ7p386fV23KJ5yvDsCdYWn0Xx9AVEDxbeQ7FJtQ=
X-Google-Smtp-Source: AGHT+IHk1FfpA2y4Z9oTsQIg5vqYkF8R+cidEV/qNA4rtoBDqquyDCAvUHa8PCJ/+wEXXwmQMEcg1A==
X-Received: by 2002:a05:6000:1841:b0:33d:2180:30da with SMTP id c1-20020a056000184100b0033d218030damr7107865wri.58.1708949851400;
        Mon, 26 Feb 2024 04:17:31 -0800 (PST)
Received: from [192.168.1.70] ([84.102.31.43])
        by smtp.gmail.com with ESMTPSA id bj20-20020a0560001e1400b0033db0c866f7sm8245904wrb.11.2024.02.26.04.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 04:17:31 -0800 (PST)
Message-ID: <45c31edd-45ea-4101-ae1d-5e0f95c88d20@baylibre.com>
Date: Mon, 26 Feb 2024 13:17:29 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/14] mfd: tps6594-core: Add TI TPS65224 PMIC core
Content-Language: en-US
To: Bhargav Raviprakash <bhargav.r@ltts.com>, linux-kernel@vger.kernel.org
Cc: m.nirmaladevi@ltts.com, lee@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 lgirdwood@gmail.com, broonie@kernel.org, linus.walleij@linaro.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, nm@ti.com,
 vigneshr@ti.com, kristo@kernel.org
References: <20240223093701.66034-1-bhargav.r@ltts.com>
 <20240223093701.66034-8-bhargav.r@ltts.com>
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <20240223093701.66034-8-bhargav.r@ltts.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/23/24 10:36, Bhargav Raviprakash wrote:
> Add functionality of the TPS65224 PMIC to the TPS6594 core driver. This
> includes adding IRQ resource, MFD cells, and device initialization for
> TPS65224.
>
> Signed-off-by: Bhargav Raviprakash <bhargav.r@ltts.com>
> ---
>   drivers/mfd/tps6594-core.c | 250 ++++++++++++++++++++++++++++++++++---
>   1 file changed, 232 insertions(+), 18 deletions(-)

Acked-by: Julien Panis <jpanis@baylibre.com>


