Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1DEB2F774E
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 12:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbhAOLOH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 06:14:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbhAOLOH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jan 2021 06:14:07 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF82C061796
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 03:13:25 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id q18so8883761wrn.1
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 03:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2tAzY7WCaNY6Vvb3iCn3hNcrKN7+M/W71UmthXEquj0=;
        b=yccXe6XzXp4PeqVy5jE4MDa9Q7zYzWMxG2qUuOLKr5MHfKj8qz/eRR6l/DapGMFh/2
         NSIRPoQOfQg6DGgxI9MOtu51DHCgdDkMKtQ8uwH95J8WUcCtaw/l5Bw05MCg8+wzmEkO
         7auWaWb4S1pUYIYW7AMkLi1G09ag0IeiqPPXXpLP/V33KkxJ0bxfDXWPNE6tSZHEFg+o
         OZTAbE6MvM5XfMJM4nshUbeWpAQDEeOJDApjoekDLq0Ly4yp1QRIZClf1Zr2rsVJ+ZqR
         MsROxnfjceeoCalkPtRbow/EXyGdH/QSRnqbPKlznKCam5y7vlHoTLm5cEDA4PhBU+TY
         L9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2tAzY7WCaNY6Vvb3iCn3hNcrKN7+M/W71UmthXEquj0=;
        b=eSjiMVA67UgAYvD9CAoEsHlEzNr9ofieAnSCS9IvlmFZyFrJFz85++NoTHSkyGaaKR
         4JrOYcYQ/R4W0E+llvna66AwZAoW2gb+q09Wvtwm51FbseZQ8oFFXutB+Nz/oe2fbKoB
         mOyn+L8zO56FpCBj8NgJD/lHnmgHsM4Tu5nFWDH8Jrr0UT6KNclXnLEEID0ovTe1P38T
         u4I/qjwLQyCOpQkgpS9y5eSu4+fqqrohR7qdYhFbtMcIQxkrskpHO4WralZktsrV66S7
         KyIM+vucadtjGzwFy+Z9+zkJQjDOLNgoVCQwJxEpAcLov+dQ+Sw07dw/V8Qm8bK3nmdn
         0Rgg==
X-Gm-Message-State: AOAM533QWkud0wyIJuRR4s1OyFeKlIucHElWPESQ1JUsvU4dKSXh3HlT
        L9yRC1FDWNDDQsAMhrlyUJVwFg==
X-Google-Smtp-Source: ABdhPJyb5AthIn+iJs64v8mJJV6h4qlEQLZ0vDmL/7IZZEfzlpBDZuNS8IxFoGmyYnY5FQ+eStCLMw==
X-Received: by 2002:adf:8184:: with SMTP id 4mr13102145wra.63.1610709203901;
        Fri, 15 Jan 2021 03:13:23 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id l1sm15048822wrq.64.2021.01.15.03.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 03:13:23 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>
Cc:     linux-kernel@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 1/4] configfs: increase the item name length
Date:   Fri, 15 Jan 2021 12:13:08 +0100
Message-Id: <20210115111311.31601-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210115111311.31601-1-brgl@bgdev.pl>
References: <20210115111311.31601-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

20 characters limit for item name is relatively small. Let's increase it
to 32 to fit '04-committable-children' - a name we'll use in the sample
code for committable items.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/configfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/configfs.h b/include/linux/configfs.h
index 2e8c69b43c64..4f76dcc08134 100644
--- a/include/linux/configfs.h
+++ b/include/linux/configfs.h
@@ -27,7 +27,7 @@
 #include <linux/kref.h>   /* struct kref */
 #include <linux/mutex.h>  /* struct mutex */
 
-#define CONFIGFS_ITEM_NAME_LEN	20
+#define CONFIGFS_ITEM_NAME_LEN	32
 
 struct module;
 
-- 
2.29.1

