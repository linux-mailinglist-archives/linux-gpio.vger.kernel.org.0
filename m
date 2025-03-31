Return-Path: <linux-gpio+bounces-18118-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB671A762E2
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 11:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 212EA188BF52
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 09:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED5DA1DEFE9;
	Mon, 31 Mar 2025 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="X1X6B9nC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3CF1DE8B2
	for <linux-gpio@vger.kernel.org>; Mon, 31 Mar 2025 09:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743411627; cv=none; b=DXYfKURDwM4FrbzD0W8o8F0HPJKW7PD6rRTZ3z4MzZeLpm8g9usMjW0bOXeRV9wv52tHVY3YFbJ8NZDz8WwAhKR4DH+yWGOKBP6/3s1H7+G234mhC4zyO9fd1iGmJTFposKLlENVwwakcgL8qge2OgQh1HfqDFbSnWX4SvA7Gew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743411627; c=relaxed/simple;
	bh=iIjFuDSz7TM8J093yEORo9E+opFPN91TH30u9539yF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=giaOC1C3mkueKrLPHRcSqv+GBUwtIfhzsR0v4x/HVHL6+tgE1BnriwvBQN8HW1yDgz7CQYwBA8EctLBJwMCKTgwSwgNrILzhJwMz3+zwaUG9k6LPSwgsFlh/2IfBNJGco4c2TN9cE8dhPkayowg7tuId7u4T2Yb2wEsVvhXDaL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=X1X6B9nC; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso29619625e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 31 Mar 2025 02:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743411625; x=1744016425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmGqW8ctXGewuU2RFTizao0zHQ9DjSIWUAdzeyWvdpI=;
        b=X1X6B9nCI3/SdqdoQ76pyVRD2kWnH4MWzIX/yslZny9e0gGi47y44Lk+lJnEndpKMK
         GiwJVhLC1xcn1bpPYu2RsE6SgUhvFKa1FSMleAlLBTyD1feBTy+uPDjYALxwEnNQH5Xl
         RTQmvFEoPMVMMTPUDEe/2ua33d9cAbwx5vaxraWi+9v4bHRo7CUwSbN6O9MGn+EniPKI
         /2vJRqqeUyz1wFKQYqlAT+HkGDE5wjeoWZ+FNwgJy7OSwMRipI8KEhzenLnGpsgwl5eC
         IpYBhIRpiWmuTfb2BhydBOXXyj4uNyUDj/rSOYe7jYnC8Bbbb9POUIFcbxRLVWZIpCpC
         FdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743411625; x=1744016425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FmGqW8ctXGewuU2RFTizao0zHQ9DjSIWUAdzeyWvdpI=;
        b=ijuXZkwzG+y0SZmllyHEfZFvJda3fqkDeKSMftN60KjSL5bVP6e1Jg+G5jkr2Xckw4
         SeZ/VKy5Xa7ov5sWwjNMW+xYNYCCFCpPE5dGnTiIDEiEJMb2vN65x/lMWB2OE5xyFqKR
         zUJpirH8ZET+hotOF9SSnKqZ0RdoiF5iEkS0g3qax+fDfEQ+3hyg1F77+7YKiOhMhIBa
         VuOQYIWDsTTeFlLdBUf5i9RvEHwCl45K70XL8fCbXqK8coNyjmwbqmal/oSzpnGYviQn
         xY29vg8tsUt7rz1Dw+ahgQObIwDoQeZfluluFcrxDSkcHHqTVX+UgMM3Pd0Jqwd5w1SM
         rq7A==
X-Gm-Message-State: AOJu0YzF4JqsoQB/EotOxM+PR3JZYzGJpraWiioBYBBs/a8w8AmcOCSZ
	UEyUyg26tl4Xs2zSCM0xMPEB9CnqYQmuW9ql2vpKXCyao2rB/7V6c4iOLTi24Zo=
X-Gm-Gg: ASbGncuq9SQOP8ewpdTuJmiZy3OABwDPPvsJ8yah48a87yuHSMLU6z5wuwTKYGs/upB
	KCU/c/UpqffodMvsnYDf04eWIJ9Z8kF95aJqVFrH6ci8oVmktV7cQRCR6mYceji889R1viTwK3H
	Mr52Paad/LJXn3yJvUSTFz/p6QAcNe/SyRRVojI2ODbwCXAvOIuVNJE3luh8ztAk0W/t9udyXsw
	6LXSV8dDjuEjUqpAA7H3LnM2+vsWYQ0YAUwHc2Dgw4FsZc+nxI/fMAbbqxBiN4BdAhGmJ+WqTeI
	PNjxQO+7wZmquUahe7G1XdAIum1iFW3G31WIwA==
X-Google-Smtp-Source: AGHT+IFb+nygrsOy6hY5Ldf7kV62G9wUGquIhxXH0vOhNExwquzxd6yk0q4dZyzsyOyVvCWluCwe7w==
X-Received: by 2002:a05:600c:4e0d:b0:43a:b8eb:9e5f with SMTP id 5b1f17b1804b1-43db61d79b8mr61955775e9.3.1743411619734;
        Mon, 31 Mar 2025 02:00:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1db:ad07:29d1:fc13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm114534115e9.28.2025.03.31.02.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:00:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 31 Mar 2025 11:00:10 +0200
Subject: [PATCH 2/3] MAINTAINERS: add another keyword for the GPIO
 subsystem
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-gpio-todo-remove-nonexclusive-v1-2-25f72675f304@linaro.org>
References: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
In-Reply-To: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=657;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gfY/H/V12uXoSsJmrHz3UuUvF78SLhvsuBi8QiZKJQo=;
 b=kA0DAAoBEacuoBRx13IByyZiAGfqWaCibHhmmJ//+xhwclCoTEszFdJIK2dg6xTLLQhpwmeV6
 okCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJn6lmgAAoJEBGnLqAUcddyOCQP/2XU
 AZaDpVKHU6zkmAYAkAO8EgYb5Kq/h4wyUaq8jD+RIlWDNyZyEmIYvNdIC8xQK8cYaVK8y/7VVvM
 0BhRkRaH41DGvTxIXOE5SzJMNHGijofpJyojwADvfAjTMip56Q78Zq9M5GuIoB859tavHHKHlEU
 GjTljRtchSu8MMSqJe9gPAOqxm5fYGVwN5w9VbyUQLS6PNAJf0CI9cnCI7kLZD3XztdwahOMATQ
 anGUD1eN+V72KcMwqf9taCDZ06JS9JZoDyg40N9DGFvQtMK+DoCZuZKUaPKqA7Ypf/DKaIE0KoE
 gQE0qoTfXG4I7HHFfp6BuDAFLrZfGS8g1C49uuFHr/K+ep3FdI9cu6TKRRuHULFXPRbMEt0mN5e
 OABf+o8MJ4HOiufX6AGt+GrqOuVTll+QQ36i1GGcoHJFtSVtMNcpABWYQZi3YLzCnjchv3n6Y+V
 xInziU4iEwPRW8jVqt3WfL6jVpcX4t8h3u6I6/u2puM9d9GGjfzvtrZuKm2PAqm0E43LjDJz9L4
 EYb6tjCymXY8Vm9boK5gyfR6iPb4/JxmKUUUmPynsE09h2dUX1xhuYAWizWI4R6iy134IWs54UN
 1Kddt2rkAmGSb8u/cZ6JzPyBZHwMWDsFtLj8o2nkPNNc+L9LMp/ZnR4aOyxiU2IJ4/+aQmsirmv
 Pq9f4
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add GPIOD_FLAGS_BIT_NONEXCLUSIVE as a keyword to the GPIO entry so that
we get notified if anybody tries to use it as it's a deprecated symbol.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ce2b64f4568d5..210fbca61ad37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10151,6 +10151,7 @@ F:	include/linux/gpio.h
 F:	include/linux/gpio/
 F:	include/linux/of_gpio.h
 K:	(devm_)?gpio_(request|free|direction|get|set)
+K:	GPIOD_FLAGS_BIT_NONEXCLUSIVE
 
 GPIO UAPI
 M:	Bartosz Golaszewski <brgl@bgdev.pl>

-- 
2.45.2


