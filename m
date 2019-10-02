Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B47D1C8874
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 14:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbfJBM2d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 08:28:33 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43919 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfJBM2c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 08:28:32 -0400
Received: by mail-wr1-f66.google.com with SMTP id q17so19436519wrx.10;
        Wed, 02 Oct 2019 05:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iB2sFoZ4x2KF5IYNHgeqY98wXl2bB2JULeTFtyoqdVY=;
        b=ZNLKx8UP+ukUsboEbPQ9oqLgg5M+37mex1mpr0SgaI7zjToRbmdCJL/chPAEK2r7t8
         C+RcBU7oQnbO3L1hTZQh1VyMX84xXmn0x8g7AskW0bydPo29O2lwBgM9BeNJiMt7gaS7
         LtCbNGe/ttaTfoTsJSOmpLgAJLVJ7mpN5r3h18HtAYcsB5NqjcgFF1yFZ9FvmXOIhxAm
         1MxDJ7tO9pJbc4JQ8iR/yPEsCNibvlX1qtkuBUWdy6aJHG4CkqIbqb+V+84d3R5bsmoe
         sDx7f/mMbJ6cF7dCarqOe47Quscz7UkGw/gZywhaYNS/7p6JBvKDCe0bbruzj3MEXMRy
         2tlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iB2sFoZ4x2KF5IYNHgeqY98wXl2bB2JULeTFtyoqdVY=;
        b=E8tcBQ6lyFYE0z3JyOT1cT/Bgc194gfYXxSrFLZnHENJjrNz2Ijr9mgmTvanMcmLgs
         qvPIH6L5rKKzPpmhxkGCVNMunQuR3U4+g4lCHaJuDE3QikN/dAMpfidmgej7UBcnxYXq
         c8yhdhWsg36bVdUYmTdrPVNYayH3WqNj6h3724+nRQnwGs5Y+emoWuhckIBZQR2fJd3Z
         jEEmej1F2QBBv4/Cf7RoOd9BVX1DFI3LgOoGADQcGnuCW/+2clFWp860wnWLGdTGqPKI
         KCaPoNOzFDkbQCyhebPt8recsiTexB8AmRdTCOszf/TYQwmlvVUUSVqdwY4/P2N0uAGO
         8kOA==
X-Gm-Message-State: APjAAAVWUbix6mCYosiAjDRWTB69Pz3baQGdU6UKJJJba2d6nCyRFzs3
        w1iyx5KVIbR84BwLezjxgUk=
X-Google-Smtp-Source: APXvYqylRlhdhO5L5gTZTUh+KEGBPZYsf15BqzctBqRpCy2v75DzIQkOOs8h+NZd8ePk6530OH8SlA==
X-Received: by 2002:adf:f112:: with SMTP id r18mr2493221wro.88.1570019309276;
        Wed, 02 Oct 2019 05:28:29 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id h17sm10777194wme.6.2019.10.02.05.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 05:28:28 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Timo Alho <talho@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] gpio: max77620: Do not allocate IRQs upfront
Date:   Wed,  2 Oct 2019 14:28:24 +0200
Message-Id: <20191002122825.3948322-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191002122825.3948322-1-thierry.reding@gmail.com>
References: <20191002122825.3948322-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

regmap_add_irq_chip() will try to allocate all of the IRQ descriptors
upfront if passed a non-zero irq_base parameter. However, the intention
is to allocate IRQ descriptors on an as-needed basis if possible. Pass 0
instead of -1 to fix that use-case.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-max77620.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index faf86ea9c51a..c58b56e5291e 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -304,7 +304,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_regmap_add_irq_chip(&pdev->dev, chip->rmap, gpio_irq,
-				       IRQF_ONESHOT, -1,
+				       IRQF_ONESHOT, 0,
 				       &max77620_gpio_irq_chip,
 				       &chip->gpio_irq_data);
 	if (ret < 0) {
-- 
2.23.0

