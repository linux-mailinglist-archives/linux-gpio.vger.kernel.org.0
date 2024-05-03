Return-Path: <linux-gpio+bounces-6054-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBFA8BABEF
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 13:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3200A281353
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 11:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7F7152535;
	Fri,  3 May 2024 11:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xqvtS0hg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE731509B2
	for <linux-gpio@vger.kernel.org>; Fri,  3 May 2024 11:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714737382; cv=none; b=AoEK22sb9aciyezOhd/OD0PojEDh+ckwMU48TgVFRXeXDAJ3izWFMzeka6mtokyYRuc9ewnNU5qBdg3HqVguu4neZ74ACSTMkagCsTOCurVthoc28EEL2l9TAAdBuqTFrVVC0vkFxI1gZQUltf+OF/2bcEEsRVP2Gz1m2V4Nx/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714737382; c=relaxed/simple;
	bh=WVuTMI4RfzaKZQ/KZB3oHNehORTjqvMFa9Or1nHvttU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/l6NoD4+IvT6t+jfpmkJJoHlhzmnZNmZ/zJUZTa0nyFbNS6Rijw1CWUp4MIaVUpdxrw4A/Rp2rp+BuNe7tSAMeqaashJ0WbUeHTN2XZ8Mj0J2+eqjicviJJnbF5gyH8nHXRT7eRi8BduBnhokZ0LIUhvcWzyoGxO4N2zCarq5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xqvtS0hg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41bab13ca80so52795425e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 May 2024 04:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714737379; x=1715342179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bLaSTUMLd9q7wnaDYiji/Br9jByyayQQUiPApn9kpCM=;
        b=xqvtS0hgaUNebSfiVtU34UFQukCDUTsoQVDpXIpIjrESIoINNsrL5ZnOHYA9tovX8s
         qxwv622BHtcc+zMu7h64O+xZN646GTUMbkOnSXAQN4TbWtyCNBvhV4tm4iLL8NjZeZYz
         nB1lNC1RPvD8b7w2Y9Y4COHjDwqbJ3E02rSlAezPlFKRGPgJXJv/Y3Q7uvWEdroQSEol
         B4YPw7Ec7GXLHAbJxhK3XiNVn3A76DHmhgJPvvZaQdG7BgYOHnZ5FK9QuLdo3LxPbUF+
         /GMSOpIDru+fMNKWENKN4OZ/mbQaL/yWC6Mnl54w+TvPMqPqWb0sgxA4YTyd70TlNNST
         oUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714737379; x=1715342179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLaSTUMLd9q7wnaDYiji/Br9jByyayQQUiPApn9kpCM=;
        b=jIz3MwAr18Vn3tqL1k+RBeoMqPG9XuRiiVLJb5BHO3qj+sisAc4x4ynYV5VhSj73hn
         TSy45dvotq0WZwowbxtDhGTX21R1OJEOSgRhrC2r4507b7K4g6jDmJO2/NXSit/YNFAQ
         7DMQMzg82q/9GoKeavFNwzZ8hqsICJMj1DTd5MfhOFnwwF0CCfZJIpkjfxLuaXrBfiyz
         vFZeOn4iocWp/cPz3VOQvmHqSNAYFawZ3AysFj14hjjjwiOY2OU71GLXZkk10/5v9OFx
         62GE2/9LTPK1y1H/viqsOjVBVnbvTTCigB9jAok4znUDJgNauNo25/ZScociA9oukrOd
         6LPg==
X-Forwarded-Encrypted: i=1; AJvYcCWDC104pBTXSKNm8HPFwFgZd+hVTp9iuhyhwwRgodnjtjBz4BNkNVl+y9oAOE43wv/dgoMzISMhKbJrnUw46S1PytLANSSheRQcgA==
X-Gm-Message-State: AOJu0YwVvXtlm3djvHQ4Cr54nXU+xMNTt1zk6ZJ7Bkuu1eeWtdx572rS
	TQ2ovUv73/K/92/nYkAQRVy0n7qYAghKBCdcF2uP0r0l4s1RVX1GROqJxeTFjJ0=
X-Google-Smtp-Source: AGHT+IF1f96C0+2XXsr5aNLkV/eYAX39+YQtc7Yo17drhLTHK/cv6FtqMZVjrmF/gOs5rAQRjpbfrA==
X-Received: by 2002:a05:600c:35c7:b0:416:3f85:d49 with SMTP id r7-20020a05600c35c700b004163f850d49mr2046052wmq.18.1714737379401;
        Fri, 03 May 2024 04:56:19 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id n21-20020a05600c3b9500b0041a9fc2a6b5sm9095079wms.20.2024.05.03.04.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 04:56:19 -0700 (PDT)
Date: Fri, 3 May 2024 14:56:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jim Liu <jim.t90615@gmail.com>
Cc: JJLIU0@nuvoton.com, KWLIU@nuvoton.com, linus.walleij@linaro.org,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3] gpio: nuvoton: Fix sgpio irq handle error
Message-ID: <87badb93-27d4-4255-8dde-24774d8e04c1@moroto.mountain>
References: <20240429070523.3160248-1-JJLIU0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429070523.3160248-1-JJLIU0@nuvoton.com>

On Mon, Apr 29, 2024 at 03:05:23PM +0800, Jim Liu wrote:
> The generic_handle_domain_irq() function calls irq_resolve_mapping()
> so calling irq_find_mapping() is duplicative and will lead to a stack
> trace and an RCU stall.
> 
> 
> Fixes: c4f8457d17ce ("gpio: nuvoton: Add Nuvoton NPCM sgpio driver")
> Signed-off-by: Jim Liu <JJLIU0@nuvoton.com>
> ---
> Changes for v3:
>    - remove unused variable
> Changes for v2:
>    - add more description

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


