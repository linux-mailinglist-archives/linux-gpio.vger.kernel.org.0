Return-Path: <linux-gpio+bounces-18733-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD053A86C6F
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 12:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10C6A1B81D21
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 10:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E801C860E;
	Sat, 12 Apr 2025 10:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M6oVR4nr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E341C84AB
	for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 10:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744452923; cv=none; b=Y/5cyc3cicnm/oD77rAAUbxNOmV2B7jpu8KVwd3rmiBk9aXX3YN3MLCxXjsC95vlDhxnk4nTqbMCRxyXKxm4dCg1DoVbp46SJ8COnqnXBdJUhzO4xP1VQAkD78Hb8keK6DadQtiKgBV3PNb/D8z3xiAYd6tjWApPRX0I0vJwq2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744452923; c=relaxed/simple;
	bh=BqrtC68kvn5BE9H9YCrsaplk6/VrQpydGI+G/P4WsdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jS6wjICzgWysSqPIW8tVx86KA9pGH0WYjGjRvhPfHFCanVR1BD11i4O0GRJH4L7aO7WdKuZnBcLpUWjGpCqEE5dMtkcTFBM6fP4o3eQn8+QU8SGqgXjZZsJxLRZfGcDXrfMLcVZGCVGgFACkXw1gfC09Q3QDinLiikt4wSxI9Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M6oVR4nr; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so24650605e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 03:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744452920; x=1745057720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ugvrJgRiDNNRNpdggE4rPF10UbTBT1GSj6+8Qk5pqs=;
        b=M6oVR4nrpZoopLaQwHt/Av3GjrjcjVktwPDxUHnOYO7BKFCI8FVVkrcldC3/A4FfWU
         ydZC0tdu1GgYkaoS1PBw9vqjsRlnsCCqyJx0aiXv0cqHhXl90F3ram1HzNUZTR10soRY
         2U9jVprQKxwscF0oNCSY1r8Hd/Oc4HhUWrV4RV5AaRgjc+yGrWUExQg25KWfgqLyVief
         hGLx+juwZ/mpsWfhKWMK00ltmOMVPJZSsUbn+fd6VcJbN8xCbb//L7rEoAw9ee38DU6w
         j3ErZUIDOz+qJbKBykP44hOUhKqp77KvwNPOzrlniNEepcSooP7UST75ppHDkRu6CINL
         jbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744452920; x=1745057720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ugvrJgRiDNNRNpdggE4rPF10UbTBT1GSj6+8Qk5pqs=;
        b=jAHD0lG2rLT3AtO2Vqdshev9UZj7tlYu2xcUev75A9wpFMbR4Hr3Pjexp51HeZz88A
         N5yuN1JDLt1zO+jKx/lCcB9O20te6reUgm08ReVXNJ2c+5um+dnEw2ckts3ndxWzm+4C
         VaIKeFO1Ry0/cz7qD4d3mD+CfImxGU7ZV9Wn75aKv24F/G0ZlNoY2ryTXSRUYlqLYp3E
         g+i7iBowOUv3hxKbYAJvnFN5oun3ELtAYAS/DTTR8F6C/zSD37jFyWboi8NBqfcuYUEq
         gX5NRQD4T80YR9PznWRowqGFC82Q/zeNB9poYsbHXYaM50EWsnJJdQ2vgek27OHtvve6
         xUpA==
X-Forwarded-Encrypted: i=1; AJvYcCWAqD/2PE66i6IyZ4C/LDXtgRe5cuhoHz2eit4Q1Y9Oc5XFqs3aPTpG/bKJF8gfYVCBsY6enIsO8yLv@vger.kernel.org
X-Gm-Message-State: AOJu0YxM2YyIUHbX+Wjo4pqJH5nokDaSDvbhokNdPh07P1+o6PxQUb2I
	Mz+R4ppU440HNLvuvN00SqHQ4sgvUlJAI2C9nF+Vv9npLbUkDbEINfnnLTP8crc=
X-Gm-Gg: ASbGnctkU8Epn2nvwPYIOlzIXl0pow9HdkLyGdoNmCRfmd1+iqR/xa0cHxBY2ASmNDi
	Mlqy+JarStaQT6JCmPelMLVqDfBWCB7DzdxqvN83k+wdNZOK8YaRLhiysfQ8w++ucSbqaQ/2iEB
	GFDdb4BaoXmSE0S3wJWYiC9HmKIkw5aBnrF7SihccTa1LMlwEwkawBDNfwLRgE6Ef+Dh0S3Mqgg
	o23+uuTZcWEsJG1yGNP7QlXson7ZDs4RipN4OsB9nZCa5FrvfvLXg2O0ipynu8awWqSI44OMhVg
	VlMW9jSWfdSMaro4Z7yzQQx+p+FaMx/0ondHbhVV5KK3YA==
X-Google-Smtp-Source: AGHT+IHrvgEuNDUHTE28uOmHTesN0mZlwCY5vOjmN/vbu7hehpaq9Iwk/+wcOFz2JAtbh1IuF1BaFw==
X-Received: by 2002:a05:6000:1887:b0:390:f9d0:5df with SMTP id ffacd0b85a97d-39eaaec7a7bmr4206852f8f.52.1744452919627;
        Sat, 12 Apr 2025 03:15:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae96bf97sm4590106f8f.25.2025.04.12.03.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 03:15:19 -0700 (PDT)
Date: Sat, 12 Apr 2025 13:15:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Koichiro Den <koichiro.den@canonical.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] gpio: aggregator: Return an error if there are no GPIOs
 in gpio_aggregator_parse()
Message-ID: <9dcd5fda7a3819e896d9eee4156e7c46c9a64595.1744452787.git.dan.carpenter@linaro.org>
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

The error handling in gpio_aggregator_parse() was re-written.  It now
returns success if there are no GPIOs.  Restore the previous behavior
and return -EINVAL instead.

Fixes: 83c8e3df642f ("gpio: aggregator: expose aggregator created via legacy sysfs to configfs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/gpio-aggregator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index e1b2efc0df99..62bb50af7cda 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -1128,6 +1128,7 @@ static int gpio_aggregator_parse(struct gpio_aggregator *aggr)
 
 	if (!n) {
 		pr_err("No GPIOs specified\n");
+		error = -EINVAL;
 		goto err;
 	}
 
-- 
2.47.2


