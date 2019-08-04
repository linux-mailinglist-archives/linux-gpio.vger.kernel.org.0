Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF74E80B88
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Aug 2019 17:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbfHDPva (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Aug 2019 11:51:30 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35935 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfHDPva (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Aug 2019 11:51:30 -0400
Received: by mail-pg1-f196.google.com with SMTP id l21so38397047pgm.3
        for <linux-gpio@vger.kernel.org>; Sun, 04 Aug 2019 08:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G566TvMGpbyrdmyi4hISjE0RUzXp80LgC28v/uH1er0=;
        b=AFuW0mPAQQYFBknjv5dxX5YJPxWPoJ2Qfe5i7zEZgRxcOeSE6JU2bSdOWbdNT82vWM
         hUeTP7u40svoS1JlouZgRMA/zB7d0SHasxVXBnJZ/gKcGlDfFrreFBOUV9zkCdYU290d
         +UPhqSePdCEmAyv9fJEY8ZVo8TM4ByjAO3JB57Dvf96FWtIXGjTTkjG6pg3cADR09gJm
         QmpXchjOSpbqPSKJXts7fy0Hlz8NW9yDVBsbo8v7cR/HgiVH3Se41hRxvKSHnKem5IHW
         jUUfI6MZ+BKboqPkq8RqybbyJJ/Tv/xcube2e1ScW2VMIO2ZTZmGtTwv7eyU2VAdHZcS
         Ii7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G566TvMGpbyrdmyi4hISjE0RUzXp80LgC28v/uH1er0=;
        b=pMJfHsDtwRuql45F0DkNjrt7FPcW9uq24c1QE85KueC9PZvQixLgxWmumS8bjf3/77
         fnXPiCfQZiHuBfwPJVeyXJ75q1K63t0uzKh4Mc2lAoZ0jiFDNMCumfG2SmggTtQ/u+qg
         S1DlRlb2OE0AOvqX00EYizwBvFXAl9k0RgitNtyQVWpZbvemfgFWmvRuXouiMUjjdvsp
         3XSejeR5ctzn3nD2j3gpFjyxqnfoY8+hLSWm70TKyRRbR07iZkJ4NuosMt6w0b+Aeb/4
         a45IoHvnDnhaEnUC5cZAoYUld3nn4LpTqqmTNjJeWz8JJjlOXGzOJN6/mnPP+3QDEbRc
         VWkg==
X-Gm-Message-State: APjAAAWIO2lY0X12z5THEEQS4xooQ6a/TYpCook1/3k2ta7Nt3OIRBMB
        bo61yDTBwT0XXvszejzdj70=
X-Google-Smtp-Source: APXvYqz1/RqGvqOaq+vIHHUhQ3GgCLYpN/7ITTw1Ara3qOA6y2TFX6ICY3SOhJo5Urgs13o+W7g1Iw==
X-Received: by 2002:aa7:8641:: with SMTP id a1mr69489669pfo.177.1564933889558;
        Sun, 04 Aug 2019 08:51:29 -0700 (PDT)
Received: from localhost.localdomain ([122.163.105.8])
        by smtp.gmail.com with ESMTPSA id t8sm13080369pji.24.2019.08.04.08.51.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 08:51:29 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] pinctrl: nomadik: nomadik: Add of_node_put() before return
Date:   Sun,  4 Aug 2019 21:21:17 +0530
Message-Id: <20190804155117.4753-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Each iteration of for_each_child_of_node puts the previous node, but in
the case of a return from the middle of the loop, there is no put, thus
causing a memory leak. Hence add an of_node_put before the return.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index ddd1f466d302..2a8190b11d10 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -1508,6 +1508,7 @@ static int nmk_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				&reserved_maps, num_maps);
 		if (ret < 0) {
 			pinctrl_utils_free_map(pctldev, *map, *num_maps);
+			of_node_put(np);
 			return ret;
 		}
 	}
-- 
2.19.1

