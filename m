Return-Path: <linux-gpio+bounces-3252-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCDA854372
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 08:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24463281CDC
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 07:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C7911706;
	Wed, 14 Feb 2024 07:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U2wWuwi7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579DC10A2C
	for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 07:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707895896; cv=none; b=ocx1pg7myYJ6BMCFXbhzHGc0vXOiMUoMwSkjONn2m7RBp4zfjc1V2Tgzyb9IHZDcsdaQX+FrTWmz6QwMi9YzYVRZ0Wzv3TXe8YuKE3eg1OY3fNaSIjxQp5F+rHGpodTH0XNiPRXklAXwx+9QEo8kH9M3Tm7riaWUTetnLX240BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707895896; c=relaxed/simple;
	bh=NzwXL43W1OV+PpykUL4U0S9bIDUta6pC4vGZpO0XU+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CecVJuE3d8+Ow99QqJ6SSgEPbhUj7wU5MTSxzMUNkPabeRPGEtdWmtNZ7NWoJkLQ5JfbfWNjVHac20YJ2U5R2ttVEmweuAif5N9UxSgLObxtYJZ8I0veCdYeMah7cLVuB/Xp/VWszAA4d5cPGtKRj3bPdX3izWg4JWnzOsa0HIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U2wWuwi7; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55ad2a47b7aso2474181a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 23:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707895892; x=1708500692; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=go2OhyehY5vKJaoZfCznExRZXQ4t4UZJ3IcE+8SZ/s4=;
        b=U2wWuwi7eUEaUC986yl0jBeLJZyzYB2IkwYQvqXJhpf82KU0LADS5sgI9E6C8zYff1
         ltu5xe75N0MMxe6l8YC4Q0DHFUqKCIOnDJwL3Nkfg7ykKNnMy6OcrCT1VVq7R2RWxj0Q
         P4gEZfHp9ouehXcgiEQ0j3O4uIxDSosWg8UIKzPQ/lc0DBvOfqtHzOHNFFHF1FagDLtf
         B4iu+STCq+NlLhOmFLe9ytbXn4LgaT0TsAEE5qcJCTIi+RD1OYeTouJ+6lZFc8vOUeSz
         JS8iLluKX0Ug3YNqc6tv++DFGZZZQS+rJsBTC2HYDvfRyesaxzO+TyB3/qKAfSe+gaX/
         vz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707895892; x=1708500692;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=go2OhyehY5vKJaoZfCznExRZXQ4t4UZJ3IcE+8SZ/s4=;
        b=iG9GT+K6Q1cLu10pyXBvrcfP/tEwLTWSREqWKYVSlDyEi856HwpE4Skf2kdFW9JD0b
         VJnr06MPjB9cX/QW+kxxBiNQI/gZtktk6OLtkdlIaAF5N3esV1nn9paQmTtfQC6OfIBV
         O4rWIh6+Ra6iefwnFz03XUZ1Rdq7dAB9zNCeCJsqgAtii4c1Y+TszpZlGraFpX1WUqqy
         gd4NRSmH3zxXKBPM8WX599yTs+8v+UiCIhPjbMDWcjUI5EUP++9RYS1HRrywaHuXZMah
         XQ9XxZUPt23rf+j/z8cvMLOHy7OgoIQt0ySgdGKfnjZiXOoKJ5SD53afk6MNA4I6CVNq
         X/OA==
X-Gm-Message-State: AOJu0YxAhumcAtrIJZ24dkB9sXH8XNYtMLJcyBd1QZHVq+n1oFD0g9xd
	PzG8ZmOlWtSqXh0HpnKUwjko05GDLw25dvDI/M4n4vIa/SUZnkfD7jpJeE/lyLh9bm+ZRXOsHdV
	f
X-Google-Smtp-Source: AGHT+IE4zKlPqmB64kHdzaIjAlSEf3jCCXz5RwSPvz4NtXZu51csAOK2qOoP0diowQj/6CvwjNkJjQ==
X-Received: by 2002:a17:906:fa06:b0:a3c:a6ac:d608 with SMTP id lo6-20020a170906fa0600b00a3ca6acd608mr1119365ejb.1.1707895892526;
        Tue, 13 Feb 2024 23:31:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXGs5ssH0aXmOi19otuKjnAC3KTmXWBixiGcjs3mLYOQg19nFeTk7WLbLiFXf4+GPoxG0ck88/feU3+rxqsSBVNV+TnRMKA0bY=
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id xo7-20020a170907bb8700b00a37116e2885sm2035287ejc.84.2024.02.13.23.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 23:31:32 -0800 (PST)
Date: Wed, 14 Feb 2024 10:31:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: bartosz.golaszewski@linaro.org
Cc: linux-gpio@vger.kernel.org
Subject: [bug report] gpio: remove gpio_lock
Message-ID: <deee1438-efc1-47c4-8d80-0ab2cf01d60a@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Bartosz Golaszewski,

The patch 35b545332b80: "gpio: remove gpio_lock" from Jan 12, 2024
(linux-next), leads to the following Smatch static checker warning:

	drivers/gpio/gpiolib.c:120 desc_set_label()
	warn: sleeping in atomic context

drivers/gpio/gpiolib.c
    115 static int desc_set_label(struct gpio_desc *desc, const char *label)
    116 {
    117         const char *new = NULL, *old;
    118 
    119         if (label) {
--> 120                 new = kstrdup_const(label, GFP_KERNEL);
                                                   ^^^^^^^^^^
This used to be GFP_ATOMIC

    121                 if (!new)
    122                         return -ENOMEM;
    123         }
    124 
    125         old = rcu_replace_pointer(desc->label, new, 1);
    126         synchronize_srcu(&desc->srcu);
    127         kfree_const(old);
    128 
    129         return 0;
    130 }

The call tree that triggers the warning is:

asc_set_termios() <- disables preempt
-> gpiod_set_consumer_name()
   -> desc_set_label()

asc_set_termios() is holding uart_port_lock_irqsave(port, &flags);

regards,
dan carpenter

