Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EABEF3A5ABF
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 00:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232119AbhFMWGo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Jun 2021 18:06:44 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53]:37661 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232114AbhFMWGn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Jun 2021 18:06:43 -0400
Received: by mail-wr1-f53.google.com with SMTP id i94so12265131wri.4
        for <linux-gpio@vger.kernel.org>; Sun, 13 Jun 2021 15:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uEtJw6f4e0IVYQcL252NxDcj8xZCjF86wiwMU/fLRCA=;
        b=KcXpCBlomcYGt2KEsSqRBMnS3mX2SSG3WW4V6Hp/p2Wf25aGx+rrhoZ4q0FdRd7VR6
         HVM93/v+FmqPuA1S4Mp7KHs34RrC9IOYJ+4TbxtASK9MRaht6NkQPKcuw9YxDlHBlD1G
         jG4hrgbKKIPorzVqTYzL2QZSzvCg8GKo54KusGdXijSwtuX25pUCNFMVJZ+UhQ/bLmre
         H2QaCFtSf73zsT+radLrO2nv2+gRVG3W2YMLH0B77luxJJPfAEMiZj06KmFFGqgAInGx
         hJzeVzArZDJCc9LnsXKWVuwiHJ+eGQ5/LXkCJWkIy7//VJP+Ez3s8TbH9Jw+edet7Nvh
         VzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uEtJw6f4e0IVYQcL252NxDcj8xZCjF86wiwMU/fLRCA=;
        b=LzwPS4E4y4UlZxHqZ90CtYL6Gp5ocekwGjtOPG3bX/FrPXvbwie/RJCTyAgS7RiqNL
         AtUEMGjh9LM7HZVo5COLh4QHLl/cX9Gx6iTA+LG6w7vyXXp9FzMimA1a4k/Mc5xis36B
         ZJr2bu5lP5XCySVRW0lknk/VViUq3e3LmsvYAo2NuDuAc0PbBmm4kHSIosZazH1udEj5
         dYO81fsaYFqNS8wb17g4VM9HDtOOBCxKRrWeAVVtTNzCciv/iJCUG+yUAeD81mLZQ+V7
         q9/pluS3DufmEo74BMTjuFBchhETfBv9HMzZBNnBS4m+hZd7huj3EqWRQZA6BXscB8Tb
         bmuA==
X-Gm-Message-State: AOAM533pg4HDwsN/h0hb/7caegJUd0t2A8qHRNND3RDQKxvUTa8rxxWY
        P6UyRYtOETK+b3nQNhCHxufbtT4xxsA=
X-Google-Smtp-Source: ABdhPJxp1j3BdXPFHbtpQZ83pRGUaOmqHw1jXnaRPUtC/SF2xPhq/U1QYwkHsNu+sesmhFnzYPwJUA==
X-Received: by 2002:adf:ed8d:: with SMTP id c13mr15848450wro.164.1623621808900;
        Sun, 13 Jun 2021 15:03:28 -0700 (PDT)
Received: from morpheus.home.roving-it.com (f.c.9.1.f.e.c.d.1.e.0.0.2.b.5.5.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:55b2:e1:dcef:19cf])
        by smtp.googlemail.com with ESMTPSA id d15sm14249507wri.58.2021.06.13.15.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 15:03:28 -0700 (PDT)
From:   Peter Robinson <pbrobinson@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] gpio: pca953x: Add support for the On Semi pca9655
Date:   Sun, 13 Jun 2021 23:03:26 +0100
Message-Id: <20210613220326.831040-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The On Semi pca9655 is a 16 bit variant of the On Semi pca9654 GPIO
expander, with 16 GPIOs and interrupt functionality.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/gpio/gpio-pca953x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index c91d05651596..348040247b0b 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1241,6 +1241,7 @@ static const struct of_device_id pca953x_dt_ids[] = {
 
 	{ .compatible = "onnn,cat9554", .data = OF_953X( 8, PCA_INT), },
 	{ .compatible = "onnn,pca9654", .data = OF_953X( 8, PCA_INT), },
+	{ .compatible = "onnn,pca9655", .data = OF_953X( 16, PCA_INT), },
 
 	{ .compatible = "exar,xra1202", .data = OF_953X( 8, 0), },
 	{ }
-- 
2.31.1

