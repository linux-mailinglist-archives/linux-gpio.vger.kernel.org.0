Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F50C80B8B
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Aug 2019 17:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbfHDPwG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Aug 2019 11:52:06 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37059 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfHDPwG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Aug 2019 11:52:06 -0400
Received: by mail-pg1-f193.google.com with SMTP id d1so5587455pgp.4
        for <linux-gpio@vger.kernel.org>; Sun, 04 Aug 2019 08:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3ooigmBUNXeViX1CED6/aN3RgJTiHQf1ueDyPW+vnG4=;
        b=kCbfVhosZXDYeKKIYzF+E8hmsz5gJO6/CUi1zEOrgK4/2/cSLuEUS+rVgueQns8DKW
         8JIMQM4lP0nYSZT16pIzwDXVqa/bgjy8+Y+vjfebV1JGrv4722kxKJjGZ+rIPaZbb8bE
         iZFnQKNw8I1FUR/xpzhSOHrTZnF6fSVNWimM3m/ta5bA2v8/Z3hCR6+PR6FFc8Lv0/sp
         9hh7CV6RPkB6LtEqkCVeT/ILTPcgLWeU/IS06pvqNbYwUdFrqB3FVsHEcIFrdXV2Bjjs
         vCGThWrlm04Z41REPTlKP+nor2Szj0YFi02Hfh4Gjanq/zRXN/2JbbVgAP6/7bxbCds9
         JA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3ooigmBUNXeViX1CED6/aN3RgJTiHQf1ueDyPW+vnG4=;
        b=aTVlNwQ3ctD9EAjezj68XkTar+TzlYKj4U8PmAIXpdtSMKsj9/+r1pFcsr5MbbRV5G
         bYEsn0E3v3iAa0uxVFceGLmRZutDv6kQnawdsMvKlV/wmsv6YJkNeuwBYpGHxBwWRr0m
         nBYN+rmrDwmdehFNQe8cP84QWZbO4hHLYQOfIlBtgm3HwbAujjIWuf+LvMAMfn1dnAMx
         poydsDd4ju0SvYpsHYJo5va24mMdafLLQndVj1AikTMcux0V3+9oSwgGBdeRwViGdkX3
         N8in8VStQBLsXmZ6OzfmbEaU47bl58/SNb53GYF1WNRNlSCLvI+hHs4tTkCCh5qKwumf
         rx6Q==
X-Gm-Message-State: APjAAAWs7e25tm+hoyVf66+/NknVUa2WqfijImUX5xVTIoNAKMlPXJ7n
        19hYsKiOvfNFfgRI/DL8xkRq/je/Wm0=
X-Google-Smtp-Source: APXvYqypLtPwZWYXKROQYBGOXS0sdWqNpDQP9LloWbKQEcefx8fIM8m6X6/T88nZ4FbrH0W7dZkU3A==
X-Received: by 2002:a17:90a:376f:: with SMTP id u102mr14236145pjb.5.1564933925920;
        Sun, 04 Aug 2019 08:52:05 -0700 (PDT)
Received: from localhost.localdomain ([122.163.105.8])
        by smtp.gmail.com with ESMTPSA id 10sm96504004pfb.30.2019.08.04.08.52.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 08:52:05 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] pinctrl: nomadik: abx500: Add of_node_put() before return
Date:   Sun,  4 Aug 2019 21:21:54 +0530
Message-Id: <20190804155154.4916-1-nishkadg.linux@gmail.com>
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
 drivers/pinctrl/nomadik/pinctrl-abx500.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index c3595200e1e6..7aa534576a45 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -815,6 +815,7 @@ static int abx500_dt_node_to_map(struct pinctrl_dev *pctldev,
 				&reserved_maps, num_maps);
 		if (ret < 0) {
 			pinctrl_utils_free_map(pctldev, *map, *num_maps);
+			of_node_put(np);
 			return ret;
 		}
 	}
-- 
2.19.1

