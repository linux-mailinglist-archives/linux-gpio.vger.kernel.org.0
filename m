Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 665D213ACED
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2020 16:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729188AbgANPDA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jan 2020 10:03:00 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45766 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729076AbgANPC7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jan 2020 10:02:59 -0500
Received: by mail-wr1-f68.google.com with SMTP id j42so12452674wrj.12
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2020 07:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q6LAbyGaoFYSB2hS3RB04QPR84/joXRhaPCO8uxP4pE=;
        b=yypA3/Yt6NwfSjqWhyf3Jb6/xwjB3nRZy6kf5pa4e5vJG8GQ/Gr8UFuHitY4IBDHxK
         vXFqyCmasFsFnkY9/fUKFqCB8w3gM9zBnTAc112usZLSj0hkBGeBgQaixg/J42qEtVCG
         abW3xSersQukLzV+AEICe/CzIoa71rcWJ6q0+WaFfZmzEv6TkGPrdmAtnIjnyckjsRzY
         X25Rci4pChALLj7IfGArH1mFmh/lGphnQY/dDh3CgrEHI/wg73v06o6nGeOWrFF0Rolq
         qYyOwkA1F+8ZWRPuXuBY2O5Xzwd2GXuEu5zfgiZz6KqAYoY49sE/aAa4jo/WeLlrRy+m
         HqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q6LAbyGaoFYSB2hS3RB04QPR84/joXRhaPCO8uxP4pE=;
        b=HlfK0CUh/GQeRkT4BaQWeRKen+pvtfI5K2yATJz7UWvyxlkWeMilbVPU1TG47tr7Go
         C1jxXzS1e9yy8MlS/KoHGP9gPg1jYp4xIEzQrj3CPeowiGeDm6zukGqJQBc01b7yFQP9
         hMzdvK6VhmElq3AZ/Wp+mqDRQLlShwHU1/iFXUBlgzrpii+XM7oocU/FTyJi6Lm0YIIO
         3sA7/iUjRFJPT8+6QAJMVEwJDQ9VrKjgIaKk8QDeHQplmXWvhcM1vRJ7f0kjB7cS13pO
         sJojcPVM2OdG9dkTQkP7Sr2UZ8TDhIV4utz0UxxwRxZnPWEsrxlos9Zzv4LgnWJC5psE
         uYag==
X-Gm-Message-State: APjAAAXl0yjT1MVOthZXY/hti2Z4BNQMS5nlYMq6KavK9dtLLmsFVv76
        iQCR/vvXjQDSIHbPazCuB2fBTBnS/yM=
X-Google-Smtp-Source: APXvYqzZLiViCo7T7+acf5XtL/yvIoFaiY3H/CoCyXj0mdB9mUcN5NaNC74MsabsS2K8m+urEhMSWA==
X-Received: by 2002:adf:cf0a:: with SMTP id o10mr24649491wrj.325.1579014177579;
        Tue, 14 Jan 2020 07:02:57 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id i10sm20311539wru.16.2020.01.14.07.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 07:02:57 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/2] gpio: mockup: update the license tag
Date:   Tue, 14 Jan 2020 16:02:52 +0100
Message-Id: <20200114150253.28716-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200114150253.28716-1-brgl@bgdev.pl>
References: <20200114150253.28716-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The current GPL v2.0 or later SPDX tag is 'GPL-2.0-or-later' as defined
at https://spdx.org/licenses/.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 94b8d3ae27bc..5f81f087103f 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * GPIO Testing Device Driver
  *
-- 
2.23.0

