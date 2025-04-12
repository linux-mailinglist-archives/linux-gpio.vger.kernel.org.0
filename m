Return-Path: <linux-gpio+bounces-18735-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E96BA86C78
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 12:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C61057B6B58
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 10:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0F71D63C2;
	Sat, 12 Apr 2025 10:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s8QrKQ0Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE25C1DB95E
	for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744452938; cv=none; b=WT4m1HfSwSawbu/BEB6npT/h7RGtPswN05emB+uLF1WBUlLPZE6lrZ5LKRicQBm8I++z3mnhiuYFYXN/UqloO98KDWIMo6zlIkEf3tzRhV3mfOODAa6EfuPrjrJhLMp82D8UMucafMgVxc4h81PmovsQGo/oasP+yYITfMwTss4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744452938; c=relaxed/simple;
	bh=U5hk+MMWODIgneoe/y7sjmG33jRN88m0448jMEiqvfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKcaJFuF75Y5VIQpGmZFAV8icLl+ctHH20iARh7QRC0uHkL1F/Caet+pnKocXpNfeVJ1uwQdwfw7re0rv28HhKcjRdLRNkLF4kNZBrKWC3hlSjYBJ4GE5uN3PX3BcqXYNYVIvT3N6+PdismP4Bp5dp0W56G0lqE1vg2su/aLlDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s8QrKQ0Y; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf257158fso20314695e9.2
        for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 03:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744452935; x=1745057735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e4ZyWmi66QBBd2EXEOk510Gi6AUK8otoa49t7kPH6c0=;
        b=s8QrKQ0YLrkvny7p8Vk4mO2D3IloATv5VmLyHCobKJi+7GeacHSRw9nmz4XUUBHUAk
         fT4IIXnCwFA7ZR2O+H7ICECgzt4XBo3H+r1XR27fvH9NWCPh+8Amxqe191qAOwAhawdx
         IK5Ss70MdpVbXL2zWsmM44rHOCcA5X+djAHUap92JMn3GkYkXGVkVq5Vi7s/OakqUGR8
         cq7IkzWo9aS+OPY+3vLgIeSAYaPMUvf5eAfdUxujUVBvb8NuXoTb3UZyIxMtLlgXfTrh
         L4lLP/sXYHqKLCA3lc+vAPuC6YJBrV2azftWWH4Oiy1dVM7eCcXLx9rRCw1MKrkHrCzL
         jSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744452935; x=1745057735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4ZyWmi66QBBd2EXEOk510Gi6AUK8otoa49t7kPH6c0=;
        b=SeE/0cca6l/EOoYk05UlbHlhRM5WN+VSULC64XtGj2imPlI8x+5QvDMHaIetVQKtZ4
         Sz5+P5WwIDy/0NzR9rW7YDncn+Ia1+hDWa05ViW5fNRqX3zRKNWLdiGtnxagzRsAsFKX
         32IzjbNeTaN/RXZTBUzdO0rvPhvw5aHZ5MUiw+eYb1XqdGES4V4Uw26PLtrrfvk6RlF7
         qCGxW2elArIsZDloQYyZV07op2NiMBiolSI107MZe9hSMwI7dDb7yp0BBCOUJN2sZI7D
         HT4uEGL9kKrgRx8Wv3iUJGvTK3EQHUSVGgJ5KjT2PjYFjY3DkwwyoARkALbC7LgEQT7n
         JFtg==
X-Forwarded-Encrypted: i=1; AJvYcCXnczRia7VH5L6d9G9pZ2/ZgfrnD7TlBSJJnvGHUfyxaSCoV7MLIdIFJ+Bp9cRP/43iQAZBu0ae6rSn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz09qypRZbD+7CF/kO680r9T5HFggs0qkxOFFyfy15exgvkiSG
	Lv8tqxXUnLZtl+zQZrHMR9Kyc5sAMP4f1jnWQae0LsbOm5gmJH9vFnK6CVWh9Z0=
X-Gm-Gg: ASbGncsEyH6xREkyS7/aW4CpJGC9TOkWnrxd9EsZiO32lDTj70+1NaH1GLrKEUqfcPc
	Qa7BBPFCd+xtN4Psw9wq8fJEfBlwY2ZQE9qkEpfyd3xJIGp4RhjeCzO1IZelJOO5j6vVEGr35JK
	LGRNrRBmux3EHJU16cDK2X5IlkaZgy3fTnm1J+6JGkFTlM7uM+QkREc+MrQ4LJUJ+B4Tlvfb1tG
	f8I7RbmQ2KeqKEKF8MU5dyCFSDECRHWd/AujfkLT79HynDb+VMAJ1msI+yN6UUbJ0G6yzupYh5I
	s8jRmiVqJVmPPBwEdo3IahOqVLNWjkIKCAMCzIXKHMygbg==
X-Google-Smtp-Source: AGHT+IGQa6VYeWqqBTxj6y7PlQMkElGotH4Th/ZzP0eMaB+7v7hp4x7EvVajjz8OyBown1N1qO/VMQ==
X-Received: by 2002:a05:600c:c87:b0:43d:abd:ad0e with SMTP id 5b1f17b1804b1-43f4aafa03amr1252175e9.18.1744452935145;
        Sat, 12 Apr 2025 03:15:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae9640e3sm4735171f8f.12.2025.04.12.03.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 03:15:34 -0700 (PDT)
Date: Sat, 12 Apr 2025 13:15:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Koichiro Den <koichiro.den@canonical.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] gpio: aggregator: Fix leak in gpio_aggregator_parse()
Message-ID: <e023bfe52509ce1bef6209ec7c47e99279c551dd.1744452787.git.dan.carpenter@linaro.org>
References: <cover.1744452787.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1744452787.git.dan.carpenter@linaro.org>

Call gpio_aggregator_free_lines() before returning on this error path.

Fixes: 83c8e3df642f ("gpio: aggregator: expose aggregator created via legacy sysfs to configfs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/gpio-aggregator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 071d76dbfcec..6f941db02c04 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -1101,7 +1101,7 @@ static int gpio_aggregator_parse(struct gpio_aggregator *aggr)
 		error = bitmap_parselist(offsets, bitmap, AGGREGATOR_MAX_GPIOS);
 		if (error) {
 			pr_err("Cannot parse %s: %d\n", offsets, error);
-			return error;
+			goto err;
 		}
 
 		for_each_set_bit(i, bitmap, AGGREGATOR_MAX_GPIOS) {
-- 
2.47.2


