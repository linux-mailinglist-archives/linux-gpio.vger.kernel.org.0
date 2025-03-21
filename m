Return-Path: <linux-gpio+bounces-17865-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFB1A6BEAC
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 16:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E6073B5A0C
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 15:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906AE1F150E;
	Fri, 21 Mar 2025 15:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FSRtlb2H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CCE1C5F14
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 15:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742572191; cv=none; b=ORgev20n3rG/uR0jytQwe3oy5KB6Aj5G4q9xzRbiGbR4eeQ9C67Dstf/N2AzheK2oQq0nk0HBB6lXySYndZgmHz5Z2JnfX0uy0DMZeGNHbSpIJ2IRvtlVu5VCgsP8O5OX8uNArXQQl/Ud6HwEcsaXi9rWVLnGhe9q/jc+v0SDxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742572191; c=relaxed/simple;
	bh=wCryCeTji9z+l3BRY73vuHL8dSisONmzkMMBaMEHPSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hksl/FTg4iV8eAWCaacpK5khXHec1+y74NhVozYi7s/lyt0kwm0OXGSOYy1oZXTh8E47allhc8f+Zh3EbqN2YadXRlJ6V3aEC+yVHlWSLqkQCo+gInNNrhiDKmiNoERCPfhtVnMNAwj0SlO4FcAR1fzjIEBcBrfKMWgVmOU5b2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FSRtlb2H; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so22622155e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 08:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742572187; x=1743176987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRFYQEc1/AnB7Qk/B6GtdNGwcPqMS/OESaxUTMbOma4=;
        b=FSRtlb2H0ij4pmijJ8QTZrvs/JO0it3s7pRAcpDWenkhYiNep+DGeXVStzFwF/rPMJ
         u4Fgr11rHz4melVZFsaptxo+ov/q8fTVQqgYxg8yo+ISRJOwDWx+GtkYoxbJu69n0c9D
         IeZ75kA/GIr2YAQBzVg77ly0vOPzjhqOxc+kgYPxiKZzLwEqsBDHmKt016EimlByg0Bj
         mJ6XZ9qaqBYv73ig4M8ny4Bcw95/mj04saPgJY70D3x6Y2zJhBN8B4ZiDOfkg8AGUl1M
         2sLQ4GNwURjsX1vf5jPYwxRX4UCkYGSKoRU62mwAg7J1CEcId7yBl7lN/86mrOVx4q59
         p7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742572187; x=1743176987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRFYQEc1/AnB7Qk/B6GtdNGwcPqMS/OESaxUTMbOma4=;
        b=uQ358AEJQbI4HHY883fpnb8ZNhRf5dXCDkvU7pHQtTwYCwyWRAjraj7voA75iz0sIa
         NjNE/NQb8bEfwmZKJ9G3UuM3SYSAHTe0VBomnbEvAr30X3jzbLXUM0jmeZpEsPcsahHf
         /8XJGtkICNJaxnQJGAbjyDt/K2CpMcTsyWxBADSiDp1mzEQ/knVyb3WNUTiOihOLjaQZ
         4RkhOdkSqqA3c6JWwOTnryXStRhx8yAm9R0C6NmRtP04d27Q+0P3Fbp9Rg2+9BnxAbbT
         hQ+pPvbQK0YaEPs+sO1aQcUtkcuAekbzVAZC8qt0oG5GKep/3/uepWvkF0+3757PBDRh
         VHpw==
X-Gm-Message-State: AOJu0YxM9kBkO6Uy2Z8GfHDLFn7irkkP85pm38jsBeUVO6ylKVxF0JlD
	sX6RLPd1BKhKzJ4mVHu5RkkdcnfM404coOxNw5W4gikS9n5zYJQ3C8/gsWjSGWY=
X-Gm-Gg: ASbGncu5kL/FUyrjXB3hvOTvcDFklDjB8sdRMmnZg3kYehjyqDvyfXBNX5Z07Jm3ZUX
	sCPhcMZijEgo5lN5MqFjwm9bRmByG78IR+8mH91aFveLSUOrFDFBmzahHBweV3WOELsr/SxvO1z
	q83PY1HJ7gmNxoT64kaSnHgyn7GeVIsLX5I4FyM8ms4H0Yaf+1i/fRX0cmuP/NQvq5RcE01sQXn
	MLNcUHf0jN4L8cU4WMxRxbWBxUM4Ay0Yd+pDWrwh7wCYKdwJ6uT/cVYNWnrg+HhK9KM5LO7EgP6
	hjtdF5KQjKvg/UQ9DtNMySr+U1EIhPuj5NQI5g==
X-Google-Smtp-Source: AGHT+IETwNIgi94lLdjAdGfdwQRhGw5FZ9fshyAOJpuVuTGfLMNBguhMUR+gJEky4ZZyufE/CE7CuA==
X-Received: by 2002:a5d:5f96:0:b0:391:fcc:9ee8 with SMTP id ffacd0b85a97d-3997f912529mr3661173f8f.23.1742572187419;
        Fri, 21 Mar 2025 08:49:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1aa4:f3ec:847a:32d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3b4bsm2664406f8f.25.2025.03.21.08.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:49:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Mar 2025 16:49:33 +0100
Subject: [PATCH 1/6] gpio: TODO: remove the item about the new debugfs
 interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-gpio-todo-updates-v1-1-7b38f07110ee@linaro.org>
References: <20250321-gpio-todo-updates-v1-0-7b38f07110ee@linaro.org>
In-Reply-To: <20250321-gpio-todo-updates-v1-0-7b38f07110ee@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2470;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=wdL+OKAjw1IH0HSGRarL/B7X1Jbr68CDvNMAAbARso0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn3YqY+eO7xsW2SOOoNalGMEC3nIE5fQEeyXYNu
 C7+MtmOt6qJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ92KmAAKCRARpy6gFHHX
 cjjDEACUdUh9u4G6a7nZ38JQTvoUong4yxXKo114w46Cr8MRAEYvrjDEOmces4FI9YkqPYFXVAu
 34c+p0CBwTn/NB9Z3DQsn6AyT01ubB1O4m40tJrBl95xfWlLowgVoePp/FYgjBxgAlZZmkXNZPw
 IageYREwK/zCI3atdwUuW2l1G94D2WMS6aEAzsroWogQHSIuj/10m4C+aLJxgbl001q8Kgjgli6
 6+S7h5QLL0g7/UPxOtlSdeG7aBkCSY96ZDphrafT5j2EXrM9SByxO7qR8ZFAgbEL96Yc5RMdGA+
 LlkHHNs3XiMbu97B8ppR/pXpM9llaK2HJaHtYVTZ66ObQ4csCQJMcTG7R0v9DyiFyo5uP5+1PdP
 yy5pI2l0La2JixCrfI+4Iug1odM+oznr1IdjNa++l5MZTE3xjWqUEep9tJkfFCclL0eKZsN9fgz
 CGl8ckKcglney2WyEV25U2KtpkL9D6KQAGg45ts0PTiT17mOhnoK3WFYsgyaXMKflOZuZQV0U6D
 EUrIJjdznImvI6Pwl57Q3zRdtawmDLsKx1r7KV8a3xL40VqfNL4+l664G/vfAY8/LXM+h6KKqrk
 r/hKGjM5jYs0LorwAqMsESFAM35/PBfc1xxmsW7WCGe++9LHBj0ABgxbPs1wK7nVZF1Kq+y84Mt
 hVAHIwwfszHFcKg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The consensus among core GPIO stakeholders seems to be that a new
debugfs interface will only increase maintenance burden and will fail
to attract users that care about long-term stability of the ABI[1].
Let's not go this way and not add a fourth user-facing interface to the
GPIO subsystem.

[1] https://lore.kernel.org/all/9d3f1ca4-d865-45af-9032-c38cacc7fe93@pengutronix.de/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/TODO | 36 ------------------------------------
 1 file changed, 36 deletions(-)

diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index 942d1cd2bd3c9..9cf7b84cdb869 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -156,42 +156,6 @@ multiplexing, pin configuration, GPIO, etc selectable options in one
 and the same pin control and GPIO subsystem.
 
 
-Debugfs in place of sysfs
-
-The old sysfs code that enables simple uses of GPIOs from the
-command line is still popular despite the existance of the proper
-character device. The reason is that it is simple to use on
-root filesystems where you only have a minimal set of tools such
-as "cat", "echo" etc.
-
-The old sysfs still need to be strongly deprecated and removed
-as it relies on the global GPIO numberspace that assume a strict
-order of global GPIO numbers that do not change between boots
-and is independent of probe order.
-
-To solve this and provide an ABI that people can use for hacks
-and development, implement a debugfs interface to manipulate
-GPIO lines that can do everything that sysfs can do today: one
-directory per gpiochip and one file entry per line:
-
-/sys/kernel/debug/gpiochip/gpiochip0
-/sys/kernel/debug/gpiochip/gpiochip0/gpio0
-/sys/kernel/debug/gpiochip/gpiochip0/gpio1
-/sys/kernel/debug/gpiochip/gpiochip0/gpio2
-/sys/kernel/debug/gpiochip/gpiochip0/gpio3
-...
-/sys/kernel/debug/gpiochip/gpiochip1
-/sys/kernel/debug/gpiochip/gpiochip1/gpio0
-/sys/kernel/debug/gpiochip/gpiochip1/gpio1
-...
-
-The exact files and design of the debugfs interface can be
-discussed but the idea is to provide a low-level access point
-for debugging and hacking and to expose all lines without the
-need of any exporting. Also provide ample ammunition to shoot
-oneself in the foot, because this is debugfs after all.
-
-
 Moving over to immutable irq_chip structures
 
 Most of the gpio chips implementing interrupt support rely on gpiolib

-- 
2.45.2


