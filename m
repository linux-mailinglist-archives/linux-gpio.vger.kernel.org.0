Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61EBCF50A3
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2019 17:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727178AbfKHQHy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Nov 2019 11:07:54 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39835 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfKHQHy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Nov 2019 11:07:54 -0500
Received: by mail-wr1-f67.google.com with SMTP id a11so7661974wra.6;
        Fri, 08 Nov 2019 08:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QYiOeheKGP1SyMnwvrZEqyGotYLx8UyThB4m88sPqzU=;
        b=NrS4aZ8+rt9JvhwWyrI76zWpMfpQ6VOIbqvFZ9DhIz+wFExsjA16IPkgLmE1puLeE4
         k2kePBgdQZst2ZKwpXuXn7EkHRCs0zVGZ7Ncgks2cEGzQ74aR/g2eZHbgZnTAjhzfZNI
         DghKVD2eFEZoKIx8qbmee28OjprdkDiexAPTtb+XCnt7H+F098YrsFmljKXQHJgXJF2M
         IrZuJ28amuNH1nuxcoq3AZo7xefnYWsUl2bP+tndZaWfB0JYEJ23iJGNRV/o2YIOF/xg
         bV6EMcgzkFHWD5sxkhBEzxT/nEJfRLExt3fLJRlzd+B28feQhPG1zoxC2xzR1ehoOKKy
         eL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QYiOeheKGP1SyMnwvrZEqyGotYLx8UyThB4m88sPqzU=;
        b=ptWExtdIAxdyPydn4VHgehhTWt3CiqaoyeBhewpM+T/D85qtJXwf9vDnGwKsQeu8Vn
         vZrLVUSm1hVO26qXKi+aOto+MbFdsgsd7dzt16S5op+xoJo3xKi1Q/FSX6T3vAc+izTm
         w3tyyqrMHv3YbT8S2ve062PQXns8BASxIjoYD21F82PGy22lwvbCPUIrf4MYloNakRnK
         I24pKmfFm9qHhjanvhGhAfVljM+F8Tmz8EXx5Me8TirB9ULz8KygOQl85OMecAuJe2I5
         6gk+b6av8SwNEcNUtp5+KKg+TMZupC7hsLYpMVYAtpumFL9br4G9eTzb8+G6ZiEAy5wV
         4d+Q==
X-Gm-Message-State: APjAAAXC16EuqbhYvor+h+LqQuJjPObrswxUuSma1XIvqNZOtaMpO7K7
        5ATjXM/B2Q3zd9MXpKcZUxw=
X-Google-Smtp-Source: APXvYqxmrUu9bdSvOICt0DhJDTXo5ssuJAlHOA44jmt0M06tqu2mNG0ubiR9uzSj7kAK1h6rnhlU+w==
X-Received: by 2002:adf:e386:: with SMTP id e6mr8700074wrm.397.1573229271771;
        Fri, 08 Nov 2019 08:07:51 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id a16sm9456639wmd.11.2019.11.08.08.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 08:07:50 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Pavel Machek <pavel@denx.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] gpio: bd70528: Use correct unit for debounce times
Date:   Fri,  8 Nov 2019 17:07:47 +0100
Message-Id: <20191108160747.3274377-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108160747.3274377-1-thierry.reding@gmail.com>
References: <20191108160747.3274377-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The debounce time passed to gpiod_set_debounce() is specifid in
microseconds, so make sure to use the correct unit when computing the
register values, which denote delays in milliseconds.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-bd70528.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-bd70528.c b/drivers/gpio/gpio-bd70528.c
index d934d23b77c6..d29cbd3c9e53 100644
--- a/drivers/gpio/gpio-bd70528.c
+++ b/drivers/gpio/gpio-bd70528.c
@@ -25,13 +25,13 @@ static int bd70528_set_debounce(struct bd70528_gpio *bdgpio,
 	case 0:
 		val = BD70528_DEBOUNCE_DISABLE;
 		break;
-	case 1 ... 15:
+	case 1 ... 15000:
 		val = BD70528_DEBOUNCE_15MS;
 		break;
-	case 16 ... 30:
+	case 15001 ... 30000:
 		val = BD70528_DEBOUNCE_30MS;
 		break;
-	case 31 ... 50:
+	case 30001 ... 50000:
 		val = BD70528_DEBOUNCE_50MS;
 		break;
 	default:
-- 
2.23.0

