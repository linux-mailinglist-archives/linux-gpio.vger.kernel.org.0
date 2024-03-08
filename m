Return-Path: <linux-gpio+bounces-4225-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D529876289
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Mar 2024 11:59:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDA6728195F
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Mar 2024 10:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF4B55E5D;
	Fri,  8 Mar 2024 10:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jiG4NjSa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9D255E5F
	for <linux-gpio@vger.kernel.org>; Fri,  8 Mar 2024 10:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709895531; cv=none; b=MgN41hql2/BDd9DlrjU6I4eJDO2NebDt4l7PJ0XNORsMHj7eKRZMS+OB9NC1X2OoJkwfetXdCS2bBbCzSpKXT0qLbpfEaS/C8G+PKCDVhysRb/O0z1u3ni0/3145p87QLeZFRUq+ukK0k5y2Rd0JbQR5OkHA2PrjX7RczXVFk7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709895531; c=relaxed/simple;
	bh=j7G07rF5/qvRZWgaArKh9DuTk6kGf7x2mY/Ypg38FPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WG7JYeZwIt/Pob3U5OQyghPx2At5iCrcj8bROqj9sZOufMnRH6OJlhAOebzg2soOKK5Qv6fMXzwJC2QEza5DcR6YXjpvttj31j6O4eiMCg2FYa9V0XDHAH0pMQes86kuFbBSKPvs64C7hakXtWvQXcFpXLTD+tZO1Ncx15/Wt2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jiG4NjSa; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3ddc13bbb3so546081166b.0
        for <linux-gpio@vger.kernel.org>; Fri, 08 Mar 2024 02:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709895528; x=1710500328; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o9ZDQ9dYVt/GB3TB7EM7j0NoesZx4c/e+/0wwo1wOtI=;
        b=jiG4NjSaJME195fX4YTLQd2bh8DISg6w4cxeCoT73uQHBz83G1Y4aDJ/5WQgL+vepj
         pEs0QqSL9c0wlrHPC/JFDAhHsd0gfc3LNWfqV5BfO2PVXJybyz9To9AA8FrT1tAmDBZ7
         BHVgOIkM0zoq5GEW+PQHvUGnKAzxOWoSgQFjvMvqVyLAic9NaLoghHwFini7mXL6FZY/
         M+iJ+nPtNc74PRjQptqwunFU44BA6eUw80aOZLxXYhAPYLSWfTX1KZ7x5K4ovARLS4ui
         gNFykuro2pptHIuVVr/y5xD3MJ1fd5AdH457IUpYXYC1p5L5rpjixXMMXJ80op4sIU6G
         Wjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709895528; x=1710500328;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o9ZDQ9dYVt/GB3TB7EM7j0NoesZx4c/e+/0wwo1wOtI=;
        b=Krury5wg+Qug1efPtHcSeTiqm39sHBJhmHIlsbVx93HFR70TKItI887Yze9cTG7p90
         /vCN+ByuNkHqAICxPj20k5/G5jNYMV63T0bWPHWe9r0Mr2Z+Y/fYu6gKeGaXoTFFg7eE
         jXN/6YSGCR0P7Ba+nF1DbET1Gb58M6x+l/w2NN9YWa+KC18MSoKkaOYJmmgrx7nBcgMM
         NM/wS+h5jR2gEIF9XXLOZ6bFEw5s1JEGhiynkXAr0lQpbb6RQw2HVP7CsAyzXofcnLNe
         DE+Q0ZdR7J/piJSQy+h89cO0b/u3ppzHDdtUJwBZzMRYIeM9lLUvTTz3j3v1O23/Ju2p
         4y7w==
X-Forwarded-Encrypted: i=1; AJvYcCXYaDRVtcYBhiWXD/FA+1f9GMTd4IOWvUi5eG3I3oReeDDZHitPuE9ubAF3ti9plwXpIlYoGduycITtHRF3Hk7a0SSp1cmO8VZb3g==
X-Gm-Message-State: AOJu0YyzdVAWUo9cEcHcWBm0rf4w1erOrmCoT6iOyb92LY2qiItzQIYD
	xGSeLtuuEyj58TAav3kdXcvEhbNZQ6369x4t0FREdRiti5dwHTmnhFI/Jyhyg6Pfs42NLPq8y/K
	H
X-Google-Smtp-Source: AGHT+IEuGPCmm1l6Pc17qKl4y/MCqtzZjxctHOZUnHumatu0wq8QD8SWmXsEqSyRxQ9F8cZs/y1oYw==
X-Received: by 2002:a17:907:1041:b0:a45:a2cc:eb93 with SMTP id oy1-20020a170907104100b00a45a2cceb93mr2537617ejb.4.1709895527485;
        Fri, 08 Mar 2024 02:58:47 -0800 (PST)
Received: from [192.168.1.70] ([84.102.31.43])
        by smtp.gmail.com with ESMTPSA id gy15-20020a170906f24f00b00a45f3cd8c5fsm241704ejb.116.2024.03.08.02.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 02:58:47 -0800 (PST)
Message-ID: <fc2d22a2-0db3-46ea-b283-1de53382d12a@baylibre.com>
Date: Fri, 8 Mar 2024 11:58:44 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/11] misc: tps6594-pfsm: Add TI TPS65224 PMIC PFSM
Content-Language: en-US
To: Bhargav Raviprakash <bhargav.r@ltts.com>, linux-kernel@vger.kernel.org
Cc: m.nirmaladevi@ltts.com, lee@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 lgirdwood@gmail.com, broonie@kernel.org, linus.walleij@linaro.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, nm@ti.com,
 vigneshr@ti.com, kristo@kernel.org, eblanc@baylibre.com
References: <20240308103455.242705-1-bhargav.r@ltts.com>
 <20240308103455.242705-9-bhargav.r@ltts.com>
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <20240308103455.242705-9-bhargav.r@ltts.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/8/24 11:34, Bhargav Raviprakash wrote:
> Add support for TPS65224 PFSM in the TPS6594 PFSM driver as they share
> significant functionality.
>
> Signed-off-by: Bhargav Raviprakash <bhargav.r@ltts.com>
> ---
>   drivers/misc/tps6594-pfsm.c | 48 +++++++++++++++++++++++++++----------
>   1 file changed, 35 insertions(+), 13 deletions(-)

Acked-by: Julien Panis <jpanis@baylibre.com>


