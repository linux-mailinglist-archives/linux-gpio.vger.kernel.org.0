Return-Path: <linux-gpio+bounces-18115-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D88FCA762D6
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 11:00:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 041681885FF5
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 09:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F881D88A4;
	Mon, 31 Mar 2025 09:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TFBpf9t1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328661D63F2
	for <linux-gpio@vger.kernel.org>; Mon, 31 Mar 2025 09:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743411621; cv=none; b=g5EX72IovhLArtUVoLX8fINcj4Rjv+X2AS2R0ShIAHUrhwaZreAIwckkJ78rAxQgziSr9j5VE45gcGtKcanXHVNpk2tqXqFeCE9pW5H65oa0swgGpfrAHShvu+k7uSzfABlj5Jk0baJpwAl9xZTeYyboHgvnSRZvPxHplmNFHgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743411621; c=relaxed/simple;
	bh=v7tLcJ4KCEXdgMy0Z4f5e53nvxHCOsUKT/C3dzcNbdo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M43INo13TGsqkJ0a/cXX0MoWnELdhgkKDJ//KTgNdjt4cywupNKbyiywTTQDprdJ2czNk7cyHvdIM4yjDCUSy05uEAk3MoQJksVYvmGX38eElgUmzT3Az1WG+nfRzllULfash8ThugS6znl74MycFzcEsBd2pk8qONMKtdrXqmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TFBpf9t1; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso1544441f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 31 Mar 2025 02:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743411617; x=1744016417; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N1IBOWlmSPjl/qOULwvIZ+UlkPZzTg2mkUy3jia7vS4=;
        b=TFBpf9t1DjuLXpW9CQlhVPxg8CxRxQ17r5lGGbOR+m/raDUpvSCUQl2ZhnGFAICnM8
         5M1LgfSgOAtmyQvOwy5DoJj1SYvJC2NsybK8NVloLRq+iHB4yoW2AKVtD3Jixb4epc0o
         zqXFbH7a7gD8ZPMElueG0Wmpls5X8mdwLOSRtvv+BAMSqVedlWDXkXm/ZgR7DSxLvG6g
         zJPndJXVFWsstJ6ZtLXpBfHMabiXB7VQzBBowmvroZ0F4xwewZcJvjJdoHSAtV1pKvuU
         ZM0uwPIod7Pb73gWmmnLqniiXap0Ky5JlItyGTT4cYlTMXuzbGOoX2Ibju00ixGsGwNH
         eecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743411617; x=1744016417;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1IBOWlmSPjl/qOULwvIZ+UlkPZzTg2mkUy3jia7vS4=;
        b=A9RXgTCU7bq3GK554Sw+wZhYJpVRzGEa22JiezC5grl1H+Siz6NtLkPRQcMhB89gLz
         Ic35brrVahPqJOSJSbfQ9WJ44WdkCPa1zjcEF1DJC3gOsEie1rUgDfTdLpMcS6xOg8/H
         4OZf7ZCY8WgkM/rh1fxwm69ckRlapdJZRIfnY0KkEjSPkWlECpo8m9DkDMuMrcRKdwpK
         ogVbL4TKTupXX7N1XLxatbmqzaOXUX909NEU0E1osC1C41m2jKCoeC5hdjKkqOF8CEeM
         /CzOLedfz8d3TRBQEnZ7YKCmA9EH7/EfBhd+MW4cUJDUwqIhaftl5ark8PsKMiqJry7O
         FB9g==
X-Gm-Message-State: AOJu0YxZQ/5Y6AFZl0tnt22y3J8AEEwaEr0kGAFimjmXCo87cNBOSsts
	amYYWq9FHOQDuocnxNrR6T2XihR+AgAAo6h4gJyURZ/+FMVur7mqbgJCpDuzXb8=
X-Gm-Gg: ASbGncv1713rLxGtFp/vdUfRLIil8JLOH2P+lv9fI6Bu/x2UN7r7T9QPveOJcFo14mi
	tkev7VIIrUwAAEuFSRoqPqCeCatZPrN2KLSfkVREStBqkjQ9DfQNnWeBJojzNykol0Qz+KH0CHB
	sYkdcZO34ix9eMXp31HMTcE22q8pOAhEcuodhZ9ttk+WPJgr5unPceNdDzKIX1TXpMZ3udlMgtO
	IwyfXfK/aDji1Xk7eeH8Sqo1+qC3BepYbMzzl2M5DSzDYnIVK0ARlkcZAsgeV5Nqt1rk69MbCX6
	xXeBd7pK/aSu5xqnbASPKUzdB9lSRWQgc8lumQ==
X-Google-Smtp-Source: AGHT+IF6GtxsUjy8b8ARooWkJGdAr6pfTmfW20nD+iszVDzmwRSBmVVIz43PDzQ5UHRtJQ1GaC8qHg==
X-Received: by 2002:a05:6000:4007:b0:394:d0c3:da5e with SMTP id ffacd0b85a97d-39c1211cfe1mr6348863f8f.47.1743411617316;
        Mon, 31 Mar 2025 02:00:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1db:ad07:29d1:fc13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm114534115e9.28.2025.03.31.02.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:00:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/3] gpio: deprecate and track the removal of the
 GPIOD_FLAGS_BIT_NONEXCLUSIVE flag
Date: Mon, 31 Mar 2025 11:00:08 +0200
Message-Id: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJhZ6mcC/x3MTQqDMBAG0KvIrDvgX6J4ldJFTb7aAc1I0oog3
 t3g8m3eQQlRkGgoDorYJImGjOpRkPu+wwQWn011WZuyaSqeVlH+qVeOWHQDBw3Y3fxPkgHfd6a
 1HUZjKR9rxEf2+3++zvMCBrlDPm8AAAA=
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=v7tLcJ4KCEXdgMy0Z4f5e53nvxHCOsUKT/C3dzcNbdo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn6lmcK5t7/9VzwMytuOcenSGVV4qaCDE685JL2
 n7aLadrheWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ+pZnAAKCRARpy6gFHHX
 cvrIEACCd7r/j4TDt245ntgK+F5T0BJrFQInhKBFcVBVL/TK1eRIgANzfVTWjb7BQs67MyUeBt4
 1VHXbJuQhhzaBsPZKLKOX/OxbHTYlXcxu7Cwrh5gOAM6ccL3p85unFpdxkZufrtEBk8KYTE5k18
 ojcBGreZ9VPS8eSKU4Ud1KsE6F+ye2+I9IQ0yk7h+Nu51oC14RpiUKSFjzOM3WkLJEPBPuEl4nk
 bEYHjiK5INrWFldsk7zxOOdwz5Ohl4k+1hi+i2uDEoM1BUxyL5/l98iH+7M7psHRS5rQ1ooUNzz
 TM2vmLsHyOR67Ai5gYXrogx/qFSHuV79/RgY35SFze226tBlOG4JHLtQbfyRl9p/5Zuv9cP9LpZ
 PuGqy6PTwOMVxCAQA4R06h9YYTzJ19YF9OX9vxOvGXAbHYgg+J5r8qpnCf5YTrMLTMv51qO6KZt
 Ct1/rsUCOuSHgRvF9Nw7CwZNiAw6Rj5/aDej4qoAj52fznkDjiSOc8CD52MV8pYG7tAx+HF9vh/
 WjpRl5UxHE52qnCSWzsf3KjCiadFsrYxCDicRiX/H1vdMKbtwZ6VUSlyhHm70FYaTSnX+SUyEfQ
 lt1t7E+w+JTXJGcLhWLhbpmo/BT50bYw10QV3tHw54Hzl/KObJQnghu8HUzuwzYzbjBlwBBvBg/
 1wK/xU30lxoz7kg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

This feature is another pet-peeve of mine. It's a hack that people
started using and now it's in all kinds of drivers. It doesn't really
explain what it actually does, and it implements it badly.

Let's deprecate it officially, add it to MAINTAINERS keywords so that it
pops up on our radars when used again, add a task to track it and I plan
to use the power sequencing subsystem to handle the cases where
non-exclusive access to GPIOs is required.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (3):
      gpio: deprecate the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag
      MAINTAINERS: add another keyword for the GPIO subsystem
      gpio: TODO: track the removal of GPIOD_FLAGS_BIT_NONEXCLUSIVE

 MAINTAINERS                   |  1 +
 drivers/gpio/TODO             | 14 ++++++++++++++
 include/linux/gpio/consumer.h |  1 +
 3 files changed, 16 insertions(+)
---
base-commit: 405e2241def89c88f008dcb899eb5b6d4be8b43c
change-id: 20250331-gpio-todo-remove-nonexclusive-ed875467eb56

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


