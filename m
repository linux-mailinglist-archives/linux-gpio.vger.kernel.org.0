Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3FEEF337
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 03:05:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730076AbfKECFA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 21:05:00 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33274 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729524AbfKECFA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 21:05:00 -0500
Received: by mail-pf1-f194.google.com with SMTP id c184so13976288pfb.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 18:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3t0yi8e+wp4/Ow/hSy+y/91MJtDT3XTA8efRc1/FRWg=;
        b=gjQ9HjFrLAo9MXrguhLrxVEr/kjlkougV9VD2lGbRqkTWZxRfn9aVO28Q57A6mYcPt
         QEEH52Tqn2fp8yRZ3RJEZfISiGsZIl4wFWGFYZKj7jsDrDayzqOb2PIhBCc9SNi9dsFd
         gSRdq3exmtS84yWVEI+UbejPFdxkhXfXaSJcky/CTF/ujHho92srHW/44h3HZWqhlv5o
         XbORBEkO8AaB6QpglWujdryp6PxNRIX+q5v/OEFVpnducTkS2q7BZuYfPjSpGMypurya
         D/6U41mHgLbMhKeLqJG1CZfMLNTBtrKtzHv4mUYbB4dzfCkq7GqhXEheyIUlC2vg3uSI
         mx7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3t0yi8e+wp4/Ow/hSy+y/91MJtDT3XTA8efRc1/FRWg=;
        b=P9bk8E1o68Ecn1FK0xfVFGqmrPgTtfG5/+eeoqFZRJEcuwRSbmhHsv0WFu96qircGw
         Sk4+vd2X8zYlxXDGggzCxZT/px7etVeNMwY4VYwh++Vi/FGOP4oMXZDmM7Mvk4Kgoqyp
         ljf8T1WUS3+Sism0ZboQYBXgij/W2bCxrQ+bDoEBkfzMTrMm+VRX4wMS3s4ifYBFpvc0
         6MFr4RcuPVFZd/g94pmIj4EOD5DCEjYPV21lEX9p89K9NMSWNn5zj2RtUxbAJhvvo5DH
         LdzcWI7/skKSrKr5K8DUA2xbxG0xTZnu5qU+CmhJ+p5uWxFT9XLMvGfSN0LxhzKAiupM
         zFSg==
X-Gm-Message-State: APjAAAVayPHaomDdPEagyVvp1fefDEkk0M24tTM0+B1RE5W7d6134UKz
        gfH8PQ/D4KyKkqekT/0xnD3A8ZZeTiAOXg==
X-Google-Smtp-Source: APXvYqxm73vvXOOd0ejPUbf86bRnCnXUJuBcWcKfNU74JmdfqKUiFFeEBpvDTKwpwL1/JCYwLCUv3w==
X-Received: by 2002:a65:464e:: with SMTP id k14mr34003471pgr.141.1572919498407;
        Mon, 04 Nov 2019 18:04:58 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id r184sm11641909pfc.106.2019.11.04.18.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 18:04:57 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, thomas.petazzoni@bootlin.com,
        Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v6 2/7] gpiolib: add support for pull up/down to lineevent_create
Date:   Tue,  5 Nov 2019 10:04:24 +0800
Message-Id: <20191105020429.18942-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105020429.18942-1-warthog618@gmail.com>
References: <20191105020429.18942-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for pull up/down to lineevent_create.
Use cases include receiving asynchronous presses from a
push button without an external pull up/down.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 55a8443bd4af..24bdfdd26b85 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -951,6 +951,10 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
 	if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
 		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
+	if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)
+		set_bit(FLAG_PULL_DOWN, &desc->flags);
+	if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)
+		set_bit(FLAG_PULL_UP, &desc->flags);
 
 	ret = gpiod_direction_input(desc);
 	if (ret)
-- 
2.23.0

