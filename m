Return-Path: <linux-gpio+bounces-29273-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3677CA5E55
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Dec 2025 03:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F450301BEA1
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Dec 2025 02:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A562DCBF2;
	Fri,  5 Dec 2025 02:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gz6BrHZV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAE08C1F
	for <linux-gpio@vger.kernel.org>; Fri,  5 Dec 2025 02:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764901004; cv=none; b=hEItKWqRNw4UFQEL/i3hdN91hWgjltV7aaor0whVmmAClbF8GPocriOXzR0ng1ML+WSTaw3hQ4pZXinoxEJizvVKiHQIbEmuyyGejYT8ycbNL2kv1b0wAJSpLxThksqQ6Zslt/cIuURjwER3zcaUk5qXuu1FOxMKLvfpvksToxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764901004; c=relaxed/simple;
	bh=XN2xK0L6T8z2gUvj7EKa9rykXv4aaY2b2j4P32dthxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z01itky3OO4hpmRV2ZV6v7dd7g4Ld8oQan4qJWJfrKBiQSPwqdLvTawzK1+szl+3Iy+6oXiuV8OB2o8Z5EogmcFKOOptgRx/8tj9K/opjWyj98NI1kaKEezS8hqh5tX3lcvo983ZLHoWaXfHQIAG7hGzqZzIIzysDK8VYbDUPAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gz6BrHZV; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59581e32163so1933745e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Dec 2025 18:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764901001; x=1765505801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWuRmLeNcvfLPbQJ5qeNcNYIaKTZlD00V+D24Ngr388=;
        b=gz6BrHZVjWmIQRJIZLrtAH7dOhvWd+bbQMb85jql63+CnvW4HBQMSSTpFb1WNkjrhl
         WLHnKQk1jB9J5GX4/TSn/nfC8TOph0XxWeS4kEUHE5b0xi51vFpvgZoam9NqPnoRPlnW
         rPB24TMIOdbRxmqzJt2Kfb/3oJLeLK5jwN8fCY3HKS+LDqwr6CenD7KqlJQf43wUx1lV
         lrlajDKy7a32RmgF6PE5FceRQ9IZeLHbfDieRZIxgoxwxeWfu14TgKFcYnmHOkxwHZgE
         sbKpVgt04G2Z4uCe7m4fHlsiXtmvbI0279YteJuLfcLIGX26CDGr/5W7hJdB7RELEhaj
         RSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764901001; x=1765505801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yWuRmLeNcvfLPbQJ5qeNcNYIaKTZlD00V+D24Ngr388=;
        b=AlXTkLtVElkBKYcLOuUvQjGG83rhL+tSxY3wr9CMqr1PgEhzMEhb32+wdQWyGv2mnh
         31vMzVKj8UtjPfmW7lX1/n+q8UKynoVT8AzOgMLaVnlWh7yLqlvR/tNFqFL656fUNytA
         z2/X4PpObNDM0TU2ic+bbMf4ejgO1zFSC3bo5IrJ6uTv1p9z84t0dJzd8GiX9ITz7SAJ
         hHDtaaTb9YhYwKxR0MdVBEb5sK9GyKTTt7vCozJJ8a2pzV9hrVTJ6ZvO0vqei4NPYoBX
         9/p5G6PrC5qS0/FdqvxGD8fQWIE0n8fFE65Cae7UVOs+UM4z8KGbqQEjWLQB4E6b9l7I
         eqCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4rJCBJwML498A7cAw/Assqy+raXv5980F2dhz+etqd1R5PjlrUbxnZ1eoAAGfiSQg7qmr7fmrqOy5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxregm6sBecQFXzZKLZmXvjEZLxl/xoOYZRlJXh9Q7yKC9SKmmC
	gWSv8xpEUz1HZBP2FdIWGXtNvyOJkAiknY0QoLHsH+E8U4MfN48SGfRy
X-Gm-Gg: ASbGncsDsC9+bAwL0UYTen52VuOa/yMg34KgvP+Wq2QApeF8UpLa434HKKue5aJJwkY
	Z6yD7K5EepuHbG07ElLN+KtL8sPnPZfc1eciww5NVATKtcDLBuvLp3v2x5ZfpxQcxVIqtioEnoF
	B2j0F5LUo6yN8g9qKfihntkVj6ELLSARCE/50v329DzJ8I8YH0hDAVMHrcmwQ25ajUnPXKMv51o
	0/ZZyGyyIp57ES+cnKDkNKAQ3cos9gdCKllpyHf0DiWIEuhdCQq0W1uULe/GApI77txSgi77Jmg
	d8N/mGlrwLLI+2w/0ZBhLX3RfyW4ijBQTwLDpTdzuYz/U+j2Y2Xzb3tboPyre5LmJcjhFhjFzpm
	64oHJNNSaagoWtmxa04LhOorg4iMVCdK4bDMHoHH2OGYa+6L4z91mPe2bAYwScSNK1541HgneMs
	8fLGjWbN4c
X-Google-Smtp-Source: AGHT+IEyFEkOELgyiHNROdiStkgWh5vG+sTc4f93bdHueEVTwDFr+UEZX+prSlamxC/7wi7A40g+fA==
X-Received: by 2002:a05:6512:39d2:b0:594:b2be:f3a with SMTP id 2adb3069b0e04-597d66c816amr1719792e87.25.1764901000513;
        Thu, 04 Dec 2025 18:16:40 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-597d7b24862sm999822e87.29.2025.12.04.18.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 18:16:39 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: Dell.Client.Kernel@dell.com,
	bartosz.golaszewski@linaro.org,
	benjamin.tissoires@redhat.com,
	dmitry.torokhov@gmail.com,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	regressions@lists.linux.dev,
	rrangel@chromium.org,
	superm1@kernel.org,
	wse@tuxedocomputers.com
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own from suspend
Date: Fri,  5 Dec 2025 05:16:16 +0300
Message-ID: <20251205021616.1570442-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aRDml95nMPeknmUM@smile.fi.intel.com>
References: <aRDml95nMPeknmUM@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> > Sounds like it comes via GPIO, but it's not handled as touchpad IRQ. You may
> > try to add a quirk to prevent touchpad IRQ from waking the system. That should
> > help I believe.
> > Something like "ignore_wake=INTC1085:00@355" in the kernel command line.
> > If it helps, update drivers/gpio/gpiolib-acpi-quirks.c accordingly.
> 
> It might be actually the touchpad controller name (as I see in the quirk table):
> 
> 	ignore_wake=VEN_0488:00@355

It worked!

First, there is no option "ignore_wake". Correct option name is "gpiolib_acpi.ignore_wake".

I tried "gpiolib_acpi.ignore_wake=INTC1085:00@355", and it didn't help.

I tried "gpiolib_acpi.ignore_wake=VEN_0488:00@355", and it did help!

Please, somebody (maybe Mario?) author a patch.

Thank you in advance.

-- 
Askar Safin

