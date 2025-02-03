Return-Path: <linux-gpio+bounces-15259-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9572EA25A24
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 992361882063
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 12:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C61A204F7D;
	Mon,  3 Feb 2025 12:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="ND3cr9BK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4671FECDF
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 12:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738587178; cv=none; b=JpZiCr+or48B9yI+KijAIm+Q9D95kMCzzvbpzL6SEOZB7Ps00JOnKXs6zRo7DhTFZPJcd3Mseur5yTsjjH4nArPOalbeiL2pqMfsSyoz+ReTew60olY6aLDAr8ufDkIizrXfkORICMiqQTNSfI7VmHl7lroZxqMvibp3XaXQ8I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738587178; c=relaxed/simple;
	bh=M3Kt5wuTT2F1a9ykRD0aslud2PJzB/uiZovD9dlqnhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxrDHP+v0BRbkBlgGsjgJUqkX8EjvvrQkb4N3jwCnPzX4ixg1yRoWbOB9/pIhRF0VNZ6v/AJ5mOzeVuYUXKieQPKKDUPVWeXFotO7AhKUngABHjr07jGNRcGEcNEiHpRV429azNUilvVZEiz3jbI0f/QkDIIBR0vuPf8V49Mtgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=ND3cr9BK; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D40FD3F2B8
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 12:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738587171;
	bh=VhF9k3IAhHoTNkD1u2+baAbQZJeo4gcwGS+UKXk5kHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=ND3cr9BKuGcspJQ2bj2OVn52TDr/In1QcQp6wB6oMvibBDRPg8ApzW7hITgpK7Eqg
	 v6FzSTiCJxznE11fLfXI6Srz4lGh67FH6PAHqU4kYsmCrHl1NmHEC0WpEGVExRKTSS
	 HlBU3LQ/f+Uh3ZCrCXWa80AebzPp/1DC64rFN/ba/u+2eXe803ell5tE+fuUw9fMMk
	 BID11z7PByC1KRCbbndsJbxY2rOV/cxkbIa92OqselZMbiETci4ZW/ZrPCsXq4RQP8
	 yJMw8bikVsnoIKFAOzOvO8ukaAKq/irBi/gANKTMF0t2s1yjFvIHnNqc7JsjU6z5CP
	 1bxvnLA25Qg3w==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2166f9f52fbso143676665ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Feb 2025 04:52:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738587169; x=1739191969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhF9k3IAhHoTNkD1u2+baAbQZJeo4gcwGS+UKXk5kHE=;
        b=WJNkSKCVADDe5rIS1xeev3Qg+FIQ398RawIRnN3Kla1Fdnpiaa//YZYlJq/Q8K5rfs
         lwVzkoMFDHNdgi0IdZsCNgjR9/c08KwSYdw3ElfRAGLVP4Yn18mCEWMJj5Lvf133A7yS
         /Z9IKWRN7aewMg02KIAeSxJ6exJ6s+3nBJmlV1FYn2+YjP5FCq2KSemVSMhiP7VaWQlt
         dD9li+FVTYW59X7/Q8WXX53aOrDp5x+iQxZ/NqgGBOpANZQq0Mbq4hia0HvHoXYcZ7Qo
         o7Zd7v/YIJuccGkaaM5SHjImT8tiHjV8Ntx3EgoUv96U1KtgNpIL4tkDqTavtJW3DJSs
         gUhA==
X-Forwarded-Encrypted: i=1; AJvYcCVr2q3yP152OZSdTUGqrRt7gy+0RNHmisRX35lyvENm9VrN5/yikYh+P8NkUwJSIupJWvlRdVEyZdpS@vger.kernel.org
X-Gm-Message-State: AOJu0YxrbmuuOQCwBg6UZkD/rm1UCDrZK+ZeYjKq+F9v8vX5qVDFjPQJ
	SCzeI7OhSER3KEzAjWBxe2G8+MIQp/+j5/oodepJqGSrqB1c96zgulZRtN+B5OcmHZFoN5xjFkq
	JCHLV672EM0KO2NTqdv1erkZJhkS1LAELqybUm2N9WKnDb291E2iN9tgVhBalN3T+VKJzM/SLV9
	4=
X-Gm-Gg: ASbGncsmiTYdK9p+ce+M5XDFtGBGPRcq91briaCt2Jm60w/zpwMr9st6XwkvTYxvt68
	q9KmmWDOPn54b10/qzC8t0TWgM55RzVJ6f2NipIcVrlQGmpgQAF8YmApW26F1yvHYWRKIIgsm/Z
	1N5XYfuxs7T/+USYHCrAqzL9m7W+6hV91GVzlPOzs8B/16/aMjx+NPsENZrT/83wzjZAhaf/5rY
	iDPqtSt7NRwMqfVTvZ+5cmUFUsgKq66iZ0IbK2TS8sKUx/aslKWJ89+yFlJWaTiVSuZv0865OiI
	W0OMEA==
X-Received: by 2002:a17:903:94e:b0:216:3732:ade3 with SMTP id d9443c01a7336-21dd7dccd43mr372461855ad.35.1738587169143;
        Mon, 03 Feb 2025 04:52:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHq1JilL8IMgEMb6RFyRt1fZ/pZTJMiA95sSjtcqZY7jRlr/1d8Bt+XG9+yC5UbiPiWCNJwfw==
X-Received: by 2002:a17:903:94e:b0:216:3732:ade3 with SMTP id d9443c01a7336-21dd7dccd43mr372461495ad.35.1738587168698;
        Mon, 03 Feb 2025 04:52:48 -0800 (PST)
Received: from localhost ([240f:74:7be:1:33e1:5e62:5b35:92b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebddbb1a4sm7873824a12.7.2025.02.03.04.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:52:48 -0800 (PST)
Date: Mon, 3 Feb 2025 21:52:46 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: sim: lock hog configfs items if present
Message-ID: <ve5d4rxl7z3fcn7iowf4u6oeq6656ivdjxknrnnx7fshj44574@f23vcqbu6vhc>
References: <20250203110123.87701-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203110123.87701-1-brgl@bgdev.pl>

On Mon, Feb 03, 2025 at 12:01:23PM GMT, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Depending on the user config, the leaf entry may be the hog directory,
> not line. Check it and lock the correct item.
> 
> Fixes: 8bd76b3d3f3a ("gpio: sim: lock up configfs that an instantiated device depends on")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-sim.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index a086087ada17..b843682b47e9 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -1028,6 +1028,7 @@ gpio_sim_device_lockup_configfs(struct gpio_sim_device *dev, bool lock)
>  	struct configfs_subsystem *subsys = dev->group.cg_subsys;
>  	struct gpio_sim_bank *bank;
>  	struct gpio_sim_line *line;
> +	struct config_item *item;
>  
>  	/*
>  	 * The device only needs to depend on leaf line entries. This is
> @@ -1036,12 +1037,14 @@ gpio_sim_device_lockup_configfs(struct gpio_sim_device *dev, bool lock)
>  	 */
>  	list_for_each_entry(bank, &dev->bank_list, siblings) {
>  		list_for_each_entry(line, &bank->line_list, siblings) {
> +			item = line->hog ? &line->hog->item
> +					 : &line->group.cg_item;
> +
>  			if (lock)
> -				WARN_ON(configfs_depend_item_unlocked(
> -						subsys, &line->group.cg_item));
> +				WARN_ON(configfs_depend_item_unlocked(subsys,
> +								      item));
>  			else
> -				configfs_undepend_item_unlocked(
> -						&line->group.cg_item);
> +				configfs_undepend_item_unlocked(item);
>  		}
>  	}
>  }
> -- 
> 2.45.2
> 

Thanks for spotting this and the fix.

Tested-by: Koichiro Den <koichiro.den@canonical.com>

