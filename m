Return-Path: <linux-gpio+bounces-10857-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EFF990673
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 16:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0489280CFE
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 14:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1776B21B442;
	Fri,  4 Oct 2024 14:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WVd4Tw54"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4238821B422
	for <linux-gpio@vger.kernel.org>; Fri,  4 Oct 2024 14:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728053018; cv=none; b=PAFz1cJGAAFwo2kdJV24A3MMFv4FAm8bfhK1SWYy4q1yISKVnzpPcz0XnjxjiqnRbkxfJVtzQsSYULsqpHHywGA1+2I8i6AJvQCHj2f0UjiVnYU28ivf6XiAB8fMyzd/TizTtUGJfOjsuVzhCPu9VenecWQ9Y5go6RNBVAnL1us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728053018; c=relaxed/simple;
	bh=mTbxUxfH/W1IhTrQ77MjGIe1i70HdR5QpW2zw30Atk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R4toJs4XHJx2PMt5JGH3/04cOjGqeGyZlqcMViN4gDg51egrkRI+he9aiwj5teS+0Q8pDB/EwxVoQowcZXIBT8BRYVeiGWr208hsz3pJFCOAez+R6toGnu4Xr0or6Vw0lsEtNllSKQjZXjfhoZVj+Kpphmzs/LaHC6V37kWC3ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WVd4Tw54; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cbc22e1c4so17884045e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2024 07:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728053015; x=1728657815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9HtJhv2OgjVrkOPzzQfXaqIVpBHmCwwecKLw+BCJgo=;
        b=WVd4Tw54rnxHr9ul1e9wHHu0ZIyQkKTyF05t7oMu4DmyF3k1Df4KTOQQluXTpRLMrm
         iH7KEWDa6PEchbBTk3iyxhMP7jOdcpMc3IYap7uUjcVY+DfKEFFINv6F+eZV0cH1sgwz
         GGVwy2qrzncR1w7sTsBZUM7qU/45M7rB0RuZ9Dt2CVGh2nEIksrVG+LRYxnSMXHAiysL
         63cUUoxAQ7pvQ6WaFvuBhqCvfd/vMmBpQbCPrV6uH3IPrP4QDPVXB1bps8YgGmT3o/jJ
         rOcjTgmTrWE4oTyxsoMSA9uCfgW04B0hqEKasCGt7iT8UqbeaCN5R1D7pm2tZ2GAcLht
         8gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728053015; x=1728657815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9HtJhv2OgjVrkOPzzQfXaqIVpBHmCwwecKLw+BCJgo=;
        b=YkdtD+mN2nmpOeWW3+8wFAD8eSc2Ws7wpLKIJFH9tw6S13HLLMJsm5CQxW7+QEeb68
         PVQLH2LMWHSe2+feedUUPnGDKWbryu8CPwoMsFxPvAq9B9nf3FOZ/uP3IF8X5zYmuf1m
         7Pb4pQDHxU83zwJ8Pt65mjUbye4Q3pFZQfmEi6tMud7nw/5vK61S3+PDwH9/8RFJdRPQ
         3mT3qx47mkl7Y0yVkMh0va5s7PXC1VFWWO0a40ItWPpP83hW/5Fx3446pYT/jDHkmni6
         uIaCEGSZssM/I/Bh+qhSzKsws5ajA9g64+W8kzarMf3krBPCyA/66QS+xB1tY4wOflY5
         Jj4g==
X-Gm-Message-State: AOJu0Yy8WeNwFVM4jiq5aMdY8aLsRE700p69lNmuNgUSFnVnLYePmgEk
	a6kw1AXycQsc+ODiwe2aQysipmJYPpcVyM5iYXTXc0Ub/AouF0wYqNl5v2oRWaaNc8vbyFwbgeA
	y
X-Google-Smtp-Source: AGHT+IFm1vI2G+l7T6P3prtOY6eLRKhJJSDE0Bi64Yrs+Vw1dbkHWJHdthPe2RMFv/gUgvZjkgdSZg==
X-Received: by 2002:a05:6000:1f11:b0:374:c847:85c with SMTP id ffacd0b85a97d-37d0e74d1a9mr1775876f8f.24.1728053015231;
        Fri, 04 Oct 2024 07:43:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:80ea:d045:eb77:2d3b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d082d20bcsm3361370f8f.100.2024.10.04.07.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 07:43:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 04 Oct 2024 16:43:22 +0200
Subject: [PATCH 1/5] gpiolib: use v2 defines for line state change events
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-gpio-notify-in-kernel-events-v1-1-8ac29e1df4fe@linaro.org>
References: <20241004-gpio-notify-in-kernel-events-v1-0-8ac29e1df4fe@linaro.org>
In-Reply-To: <20241004-gpio-notify-in-kernel-events-v1-0-8ac29e1df4fe@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GV9UbQrF97SgoHpvOQBfdX3GKi4ST9w/X7XOWpTaA0U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBm//8U7avLQBDR+Jk16XDKwbBZucLe8em4mqFCg
 xIOM7R8TR6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZv//FAAKCRARpy6gFHHX
 cpX6D/9krtQVe7uAEsAQ9QkLe5k4mu/RKjXoceGhMIgvZ9Nzkeihm8fJs+YFjsVX+EA83aKVeMX
 vPqtplrZU9E16y5otu0ERAZckZlyGGx8vuhUhPzWYPBBgnJKsnmGc9v95mLe0gBLBHJ8y/Jqo+d
 H9y9s0ScWo461RMxa5VadZRZqxWaS9+6Rx+24zlEAQ5vzCbEPVjMgyq1heo9uE57nbXb4gUKcXf
 m11S+Jl1YVJb5YUgWGSHS4xOA67ffgQV5MgDABhcZMhxbJ0IhRmaSBXlX1JeyDJ+u+qHLc7KcAG
 LTfcpJh5x7TJuZ5U2gXANEvgTaKi9Pl/zqzCty5WFGYPYBimod3DRSqwBysOXwzC0HXUkKJXlcH
 mBc3U3w29FlEhaOFzjfOgZXZndXcWf0Q3+PQsKvA+bod6fvKtxhohuJLIm3LMSoVIPDNPEoHwuW
 BuagJHTusdCCANPzD30cNpbNvOakFVa91sJJw6tWN15FLvvQKTgm9WqMknF4ujhei77sjtxiNZ/
 uV86UFXXRKk+gg3emEnx+RmeNM7F/4pxgB0I2XOgHtvyME0evUprYRPGD6gIWbPhgvzAn9HEQQh
 TGBWutuvSJW8l+qX4H7RRTfSbGm0sxYQAD2cWe5KXdpNL3tckKySLkNbDKlAHpe8pwJ/0wfFNM1
 BS6dCHl5LgBZGLA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We should only use v2 defines for line state change events. They will get
tranlated to v1 if needed by gpio_v2_line_info_changed_to_v1().

This isn't really a functional change as they have the same values but
let's do it for consistency.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6a5c28babf35..c1051d77fb88 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2434,7 +2434,7 @@ static void gpiod_free_commit(struct gpio_desc *desc)
 		desc_set_label(desc, NULL);
 		WRITE_ONCE(desc->flags, flags);
 
-		gpiod_line_state_notify(desc, GPIOLINE_CHANGED_RELEASED);
+		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_RELEASED);
 	}
 }
 
@@ -4366,7 +4366,7 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
 		return ERR_PTR(ret);
 	}
 
-	gpiod_line_state_notify(desc, GPIOLINE_CHANGED_REQUESTED);
+	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
 
 	return desc;
 }

-- 
2.43.0


