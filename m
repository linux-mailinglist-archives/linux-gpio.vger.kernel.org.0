Return-Path: <linux-gpio+bounces-4501-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4198857CF
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Mar 2024 12:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6106A1F23261
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Mar 2024 11:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44FFF57888;
	Thu, 21 Mar 2024 11:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mApNJrVB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E835157876
	for <linux-gpio@vger.kernel.org>; Thu, 21 Mar 2024 11:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711019452; cv=none; b=CTNyLtU50I79ecMh7+RpgBG8NLelObs8fIDK45KqgumXS5JjUjRc6yCP++C1jEXgXdXBjwQKpOP/RYrqIDHqP1HO8/ddjR4GkYFOFUQMFCE+DkG2cJLoKw1IKOxaldP7+KlUaX1d9zc+jNWCtOPyac7te43NnUouDMrosaRTzWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711019452; c=relaxed/simple;
	bh=HiyzjWuZe4akURA2KrDOEK/6yEjz2zKACEidUJroprM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VNtUJk/XxhOOWG+SPmAfyRp9PLqmr+XVAmCOYMC6mmeTrugpxIril4BWUsrXVULevJjzs6stwaAbr39p3t+G3+8FzPx5VS53uJzWA+q1ShrNc+xeXyyFTYBkkqIjdsvjBO/Xj9hAFFqvluIJyZrw3Zg3ddVQoX2iCPDO53hprsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mApNJrVB; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-512e4f4e463so1007775e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 Mar 2024 04:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711019448; x=1711624248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42mZaGZ2xKNdpcKyZrDEjFTU384gr6H3b1H4sGa8VMM=;
        b=mApNJrVBb8v8XSuK3Kxdo5ttrONIMN7nDfjTyU36ebishYaIzfVufZ+SDj+WJPlL9/
         g/oofo5+/Z39wn7qAIQCvimHZZYoh+91oevXMfo/Qe1ew+QOtW0DSL5CYCNr+lS9mkWV
         qmpVrjXcUD/Jxk7SRrCd01XX7dQSmWrFXH2TjHPnG2EZ+wxwYr9NaROkIkGtfijAoRyk
         SSv0Iyz4s8RzPU/3BIj7MgpDb/Eoip2ZU8bkbbWMs8CEZsvSaA5v+LyZ/lbxelv7RybN
         WsIHIJPRdnlbRK2MrJS4qo+5L+KAMQWLO9ivgLrXCoFDDgYCzJcKEOZZBI242UWUTW6E
         Wp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711019448; x=1711624248;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=42mZaGZ2xKNdpcKyZrDEjFTU384gr6H3b1H4sGa8VMM=;
        b=SaYcH6bBhshkYyC5cQdTyDmbAlDoXvaHkRQvUE4sy+V9lyLLYkktzMijsFU22BNYJz
         70bjXlhnhTzqJ7NNmbnSRjDpg95QCUNyYlpBkQTl4blyokjX04JPpTlUPZgP0m/msK8N
         T0cD8II4gVlA6/ECgr1fi6iSR0+BjrJL4zV5AydV8hPl7kZ2bIn43YBE+es1G7yRWSku
         ZsNTg+3CzDLX92KBChmHOG3o2pg2dr2qFZIwrRrEvOcpxlmSZMDiRvgYdATTS6qQJc/y
         th52WAKxzDxxf72hP3aa9SRZJ4yy9rCu5YLMqJ3LCohj3tL5uSRJH5E5gM8QN91vHS4H
         kxcg==
X-Forwarded-Encrypted: i=1; AJvYcCWgpBjYp7T3j9wZKiR4A8RJ1IF+ffqxwtrmpu1waicIOcjBUTRZK0w9YIuyqaSNsLb9wmY62n2GlEE2MgROUpKHInscaSOE6CjYVQ==
X-Gm-Message-State: AOJu0Ywi9zR+YHqqhzE7459FczBNS9V73K986NU1a0FcI8HvcqmaYRf+
	CLASDicNg61h6pqZjTE8UAtPmzamj62ZK+z7mjpYeJ1zoK9frYN7Jlya7BmmYj4=
X-Google-Smtp-Source: AGHT+IGvcTh7vN7pxLf6gj/1+af1/5TJBaNI7eIf4z/0IrIp5wE80J6I1g6vqN8ZvmZqy22AS4gfrQ==
X-Received: by 2002:a05:6512:10d6:b0:515:9568:fb14 with SMTP id k22-20020a05651210d600b005159568fb14mr854610lfg.46.1711019447705;
        Thu, 21 Mar 2024 04:10:47 -0700 (PDT)
Received: from [10.3.5.130] (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c468b00b004133365bbc6sm5211020wmo.19.2024.03.21.04.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 04:10:47 -0700 (PDT)
Message-ID: <775348fb-3227-4609-b4aa-c8a6eddb8953@baylibre.com>
Date: Thu, 21 Mar 2024 12:10:45 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/11] pinctrl: pinctrl-tps6594: Add TPS65224 PMIC
 pinctrl and GPIO
Content-Language: en-US
To: Bhargav Raviprakash <bhargav.r@ltts.com>, linux-kernel@vger.kernel.org
Cc: m.nirmaladevi@ltts.com, lee@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 lgirdwood@gmail.com, broonie@kernel.org, linus.walleij@linaro.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, nm@ti.com,
 vigneshr@ti.com, kristo@kernel.org, eblanc@baylibre.com
References: <20240320102559.464981-1-bhargav.r@ltts.com>
 <20240320102559.464981-11-bhargav.r@ltts.com>
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <20240320102559.464981-11-bhargav.r@ltts.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/20/24 11:25, Bhargav Raviprakash wrote:
> From: Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>
>
> Add support for TPS65224 pinctrl and GPIOs to TPS6594 driver as they have
> significant functional overlap.
> TPS65224 PMIC has 6 GPIOS which can be configured as GPIO or other
> dedicated device functions.
>
> Signed-off-by: Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>
> Signed-off-by: Bhargav Raviprakash <bhargav.r@ltts.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

With this patch, an issue is observed on am62a:

root@am62axx-evm:~# dmesg | grep tps
...
[   12.122631] tps6594-pinctrl tps6594-pinctrl.2.auto: error -EINVAL: Couldn't register gpio_regmap 
driver
[   12.133216] tps6594-pinctrl: probe of tps6594-pinctrl.2.auto failed with error -22

Without this patch, the issue disappears. Do you observe
the same result with your am62p ?

Julien Panis


