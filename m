Return-Path: <linux-gpio+bounces-28887-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 358BCC73405
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 10:42:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 75D2E4E758B
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 09:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513432D5C74;
	Thu, 20 Nov 2025 09:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4a2Uiq2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346322E7F27
	for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 09:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763631469; cv=none; b=SnJRQW3JTVUFcN5oFJcYk367IuH1znF4nyny7BrYaYScY+N/rnMex79aFbAhd5r8F2p6UR4EFD624qprViKg4sCpIi2swZwaNnsxTImQfViDiEBr2Mhy1piGXYmd9xz8FV9uI1MLMyJuxZZLs1VlrThTlRjAF+JD09ska/y2ORg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763631469; c=relaxed/simple;
	bh=Jcjx9RlDQKspYeBRDfwatIA6Vj4r7d3hhFRseQLLq/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y/C0qruo8DcUx0dVioluAjnT9RLVPWDPEW7jHUSvRYfl5C++IadD0aOqW3h3K4gYBWoghAKKLOcYsV0Gjba7EEYgG3eJln0RFkQ/MPscyY3s0EAJVB1k8K9awlR7r6bcuJNI8KnPkpQfj53lISv2bXZwTE3hEJM2gYh35E5LztY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4a2Uiq2; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42bb288c1bfso398758f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 01:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763631465; x=1764236265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkWBxqMkAg+TZHlltBLGu08USzc1N005PN9aW6U8iIQ=;
        b=V4a2Uiq2rWR2tGma1udaOJyLfT1WOCmc5nlA8CpTygmFwS22AnGvEPAPu8UzU5mk/3
         OPhp0a8CTdG21QnYSTQkJDCVwKe0T8+VsF86/z7fZxgx3+VuwUC1g4YqP020OJAkYnbC
         Uiq95WfBeF80mzUDUbwEs6Jwhc4mGFs0d+213XYizkA6pfawqbSuIydd0KtxfVSWtpdW
         AxQIrZX7hDUmU45XQmEqGybAp2sJnyoVBY8AxTe/wVYK3UYyydKqGDYjvp/xHaiyszL5
         5Zf4X9nfRvxSMDDsVbyLvxHLGrnw5RUuNT8Z7zRc2y5XKcGGLcDf/LdW2YvdehIUs9s0
         y7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763631465; x=1764236265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pkWBxqMkAg+TZHlltBLGu08USzc1N005PN9aW6U8iIQ=;
        b=uHK6RFWxbgQlP+CwH2NT0Ofo6nM0PN83C4HoMm9SJMlNJ6oDYgY2SdDwpjsnM5AI61
         Id9WyuN4O+LEGCnn+bAXIhm+Y7sOGDypWBOcOeyvWs7msBm4kn5/OGqgL+yY6WBn/++B
         n1WOnhX/Q+kjMeZ8nSS1FbKDQCEAqGepoyd22rR/jUHp6Q0jmMWZQ7ZkQdDyeQ11c0kk
         vRQZAwNcYZvA0LB1qfTIpTo5YdVZcvcI2oR8sV73M8FvSXKY1ZIkz2zxwj6/vJa/sA2N
         3HU73EyDopMh1k+ezTTaVIHWg0QbD/Wlj4Ta3nGC6y2GHCC6TYFK+oE0vhcymUEfFaPd
         /wGg==
X-Forwarded-Encrypted: i=1; AJvYcCVy80mqmr+TO2uY+RTmRItj7iylEOhWRiUZmoBgdNRsatP7mdZdo1dOdgD8nU/8rMqZ/aLgjaIkoszc@vger.kernel.org
X-Gm-Message-State: AOJu0Yxutlk1GndxKF1+pGL5jPFKNCnGWvO/XiHqIlx83bRG3c+4vi+8
	3Gr2HO2Dst6WwKNlxGPsTu2epOQZg+mdy/64Y5jaULBXjrJa0cV+YV/K
X-Gm-Gg: ASbGncuIj7Mhk2nGE0lK/mjaVqZ4BffkZ9lSDf1zx7oXYPiCr4BhvwzHgQQC7hOkKXr
	bWy3oRaoNVZAhci1W+wiji/wCNy2Eu2A3IRXLpITsL7kKwrAWGgB+1dSZM9SYFiQlKhTq+kFjnC
	21GyRB8VNM+v4fVn8bQ4TpgCuIAhC76k+soC4Azlz1oQrQ1pGTtwmq9gWlU0g9Uj2jyn6k/D51N
	vc9Z2fmHJX7KJ3Be61w+3d/CmgLXB92K455G7haba2pNjACK84zu0pfzzKBgonXGWHJzwNXYXNd
	fyOUk7kkIAFgQIFvaPA09NJgVqoVp7C1NKoSqF38FD20M7TakyLtzWAFxHWcb87gahd898xwmjU
	AuazB4WpgFXXhDx3wocI65+2KG9x7YUMZSU/uvODR2G6J/32EbY2tJu6ei4PqqXNiaUzCGp67d1
	Gzb2fB6d7nnmCJYrAaqqtbsTDWUX/LXO/G4sP3pbAwrPP7iuKkv7BY
X-Google-Smtp-Source: AGHT+IEBbsWHpnh9JsKgNdQcSKiP2aNRlDfbsa63SARDaFG0te32/bw2tIoEKmReQNGzJ55jft0ejA==
X-Received: by 2002:a05:6000:1841:b0:429:b9bc:e826 with SMTP id ffacd0b85a97d-42cb9a70d18mr2246350f8f.53.1763631465014;
        Thu, 20 Nov 2025 01:37:45 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa35b7sm4335916f8f.20.2025.11.20.01.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 01:37:44 -0800 (PST)
Date: Thu, 20 Nov 2025 09:37:43 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Linus
 Walleij <linus.walleij@linaro.org>, Mika Westerberg <westeri@kernel.org>
Subject: Re: [PATCH 18/44] drivers/gpio: use min() instead of min_t()
Message-ID: <20251120093743.1cf9bb8f@pumpkin>
In-Reply-To: <aR7K2bWKiaXrwWIr@smile.fi.intel.com>
References: <20251119224140.8616-1-david.laight.linux@gmail.com>
	<20251119224140.8616-19-david.laight.linux@gmail.com>
	<aR7K2bWKiaXrwWIr@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Nov 2025 10:01:29 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Wed, Nov 19, 2025 at 10:41:14PM +0000, david.laight.linux@gmail.com wrote:
> > 
> > min_t(u16, a, b) casts an 'unsigned long' to 'u16'.
> > Use min(a, b) instead as it promotes the both values to int
> > and so cannot discard significant bits.
> > 
> > In this case the values should be ok.
> > 
> > Detected by an extra check added to min_t().  
> 
> In most of the patches you need to follow the commonly used Subject prefix.
> This can be done by doing

I did look up quite a few files to see what had been used previously.
But it is a bit tedious with 44 patches.

> 	git log --oneline --no-merges -- $FILE(S)_OF_INTEREST

I wasn't aware of that spell :-)

...
> 
> > acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,  
> 
> > -	length = min_t(u16, agpio->pin_table_length, pin_index + bits);
> > +	length = min(agpio->pin_table_length, pin_index + bits);  
> 
> Now, if you look closer at the code, the pin_index alone has the problem you
> are targeting here.

The compiler warning happens because 'pin_index + bits' is 'int' and the compiler
doesn't know the value fits in 16 bits.
It should fit, but only if the caller passes in valid data.

> On top of that the iterator and 'length' are signed, while
> the result of min_t(u16) is unsigned (however it has no difference in this case).

Actually the result type of min_t(u16) is 'int' (:? promotes char/short to int).
So the u16 cast does '(pin_index + bits) & 0xffff', everything is then promoted
to 'int' for all the comparisons (etc).

	David

> 
> ...
> 
> TL;DR: I apply this patch with subject changed, but I think more work needs to
> be done if you want to fix it fully.
> 


