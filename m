Return-Path: <linux-gpio+bounces-5925-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3EE8B5170
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2024 08:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D58F01F2230D
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2024 06:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E0E8BE5;
	Mon, 29 Apr 2024 06:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qDTcfWGQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CB61118C
	for <linux-gpio@vger.kernel.org>; Mon, 29 Apr 2024 06:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714372209; cv=none; b=EZyths6eTbQVhVVTdbkYGzkpVbVRA4X5FVNCRS74rp42yGKddlpTWpAGOuRQ9faMseaB6qnWXJC/V0Fv3uypF5eLhukkLEK8fm5aZzMdQZSHB0W5Mbq5CFVWuuQBzOEP54ftSPPsUA/cLLSD9ipuzIQJBmqh1yOwcQqhoMRn/9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714372209; c=relaxed/simple;
	bh=8n9nos46ZeCKMxrrh/FbGilPaqWbM17BK84mfxu0dZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rgFsvH+TGH8Jw4/hMI0lqn5zZrv7HXiKrx/ll8B8ycLezpw076ctFtQ2y0oD3gvWMV3idUwGisrkttv/l0LUeaW8uLEDQWYWgmAOZH89jb6IrkzZyOrn+E5mEpFzcY/HsXJyj6iLQWcAn0hUXV1shbYVtweg+Ru2pZMxoXzEqQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qDTcfWGQ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a51addddbd4so445242866b.0
        for <linux-gpio@vger.kernel.org>; Sun, 28 Apr 2024 23:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714372206; x=1714977006; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KERnA4T0jCEQs34o3IlPybs8QOMiz93MooHjuPlhTb4=;
        b=qDTcfWGQiqzfjSa73WXDla11hMgusX+XP5sddxz367GMuUQ6OJGAvBfblERspdVtkc
         TSG5I8n7Zgt7v7XX6U30TqkNXuOjGndLQrevt7xyhyripPJh/FpoHYuuAAiJJ1M228tB
         MlG/TdKTt6lPV0LAg3TeuPyGBqx3tpuFR+eh/qymSrff3xIFa9Yg8mn0mnP8uOfXdYLP
         RNBvnkaPi0a+1pN4AE7VH9vBABA6LlrtU2XGbohUXd6Qxn0UsLxPQ0VlFAX70XJitW3Y
         1vtd2/Mcglgri4Tyi71X1/Hg8UTDxp06rAtk9TugqhT0M/ILiNiD/UL8m7PnE4nmoZv+
         cOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714372206; x=1714977006;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KERnA4T0jCEQs34o3IlPybs8QOMiz93MooHjuPlhTb4=;
        b=eAVhJTipSSRkw4dnHZWCrmGhb3LiwaIU1ajz+m0FwsMyB9Xxwx3bD68njnIr/SrzON
         l7XlC/JiCLmPWVdlvgpju+MA1mOtZb13zoZfV+Cd14qzdvDRcIqKf7JMxVGCy5NoK/JV
         08Vp67NhmA7D2BBsRO1QVeFf239KVztAo3B/z/YVVjopul82zhQ96P0dNVW9V0elpzZi
         3UdSetiqonCvt5KMtTuyEOa8XwTO59h+4FKiQC5n/sQRjERqGpzce4+rmYRsig5/6tFZ
         YJMTC6shagypiBH+MjrO9EbbVlb1CwSr1BtYtEXTgl/QEIfIeL+ms/YPzavNk3ixNVus
         w1dg==
X-Forwarded-Encrypted: i=1; AJvYcCULiZMlo6tByFOkbhD1lnzjCFMaDw7CdE970dL8Qhz6YE+jbVn0MCQbQMfHct2B7x7XAqgpqsWthiZ8uO/sZ/SOIEnKbNkb+cXf4A==
X-Gm-Message-State: AOJu0YxdqZDEBtRUijAgurZjBzPY91+A75ZynBZL0WVwnIyugnQ2+k0F
	LgV24SHC1xRXDyQ6fDgOyssoKldcHGkoa5JvDK7tdPheOHO1kLZdQVbgguzJovwPuattpzaCegN
	c
X-Google-Smtp-Source: AGHT+IEuwGziIm6KgpZpUtsLTsqKVmTl4T2GUPgk2+IbpwCDyVrzevDmt0o2BYgkfnHK8qfanoQquQ==
X-Received: by 2002:a17:906:3602:b0:a58:e569:1242 with SMTP id q2-20020a170906360200b00a58e5691242mr3198451ejb.4.1714372206208;
        Sun, 28 Apr 2024 23:30:06 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906399a00b00a51f2b5b1fcsm13544638eje.75.2024.04.28.23.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 23:30:05 -0700 (PDT)
Date: Mon, 29 Apr 2024 09:30:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jim Liu <jim.t90615@gmail.com>
Cc: KWLIU@nuvoton.com, JJLIU0@nuvoton.com, linus.walleij@linaro.org,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2] gpio: nuvoton: Fix sgpio irq handle error
Message-ID: <0ef4941c-ffa3-4f34-b3bb-4b97d923294f@moroto.mountain>
References: <20240429060642.2920266-1-JJLIU0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240429060642.2920266-1-JJLIU0@nuvoton.com>

On Mon, Apr 29, 2024 at 02:06:42PM +0800, Jim Liu wrote:
> User use gpiomon to monitor input pin ,if triger the system will call trace and rcu stall.
> 
> The irq_handler uses generic_handle_domain_irq, so there is need to remove irq_find_mapping.
> 
> Fixes: c4f8457d17ce ("gpio: nuvoton: Add Nuvoton NPCM sgpio driver")
> Signed-off-by: Jim Liu <JJLIU0@nuvoton.com>
> ---
> Changes for v2:
>    - add more description

Part of the commit is missing so it will break the build.

drivers/gpio/gpio-npcm-sgpio.c: In function ‘npcm_sgpio_irq_handler’:
drivers/gpio/gpio-npcm-sgpio.c:437:28: warning: unused variable ‘girq’ [-Wunused-variable]
  437 |         unsigned int i, j, girq;
      |                            ^~~~

Thanks for improving the commit message and adding a Fixes tag.  That's
very helpful, but it still can be improved a bit.

======================================

Subject: [PATCH v3] gpio: nuvoton: Fix stall in npcm_sgpio_irq_handler()

The generic_handle_domain_irq() function calls irq_resolve_mapping()
so calling irq_find_mapping() is duplicative and will lead to a stack
trace and an RCU stall.

[ cut and paste the call trace here]

Fixes: c4f8457d17ce ("gpio: nuvoton: Add Nuvoton NPCM sgpio driver")
Signed-off-by:

======================================

Otherwise it looks good.  Please fix and resend.

regards,
dan carpenter


