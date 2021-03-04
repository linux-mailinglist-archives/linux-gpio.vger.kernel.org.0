Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADDF32D0C8
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 11:33:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238572AbhCDKcC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 05:32:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238566AbhCDKbo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 05:31:44 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9072AC0613E9
        for <linux-gpio@vger.kernel.org>; Thu,  4 Mar 2021 02:30:14 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id m7so798599wmq.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Mar 2021 02:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ileJ8i8PtBYWO//WNWntFWU//j32QRx+BmjBpxepfLE=;
        b=tvmTdM0p73GfZuWLxHXiv2yDFa9iCw2qZ0WMOdYVQ/xrH0Detz9DXMI1vZ78cqq1rO
         FZJgQ1pFkmXtA7oDm61oRVjhgnQxG2Bexztzb171OBm6ll3JleAgBNUD54+Cux9bGGMs
         w4pUH0+gyWw7SI92E9v5XI+vV2rN+HRndqDl8PYgpzd2PPemcplAzZqeQS4grAknekbo
         YD74HYtEFaDRFtYPjGjI1ryuN4UTY9hJuj7q/fG3KkbN+37Jtr+QRay7IZdlw8mdNHn8
         BAzK3GoQf2cHJBO2XYoITa9Y3dyPQG411MRIiW2wOmfsXPVqVFbjcnNDqPYVRY4rroxa
         0gww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ileJ8i8PtBYWO//WNWntFWU//j32QRx+BmjBpxepfLE=;
        b=cZ0v/XynVCxomnAt8vFRKzlN5e08y67ITz9DhYQCFihRbzbOSEMBa9gMWV5QLBm764
         guhqMdW0Vz+IcEhna4JYu5JCHLtLhThzkYrXKeuS6w0Un8S7l5JxvfeL5VHb81QDYCtx
         aiXo3OghNZ6kbJfNmZkiNjr5Fj7/F5BxoIHGETjc9VCBi0ubFnr976h4Kd3Z/8WoKYzv
         8gMQWNhckQnQYeFPyG+WayXrtHgkUxhbOFV3ShYgA/YUq2CwMEhw8fJXLLCGWoLc5SgO
         aT3191Ai4narcR8J70OBPYrrDyWwceTqXJmLD7M0ygLIgixFdqNtcgRAkQ/HT0RmjWKd
         /deg==
X-Gm-Message-State: AOAM530fsvettPYlEfmQd0qMEgRq9puU0hlF7AsrDN+PU02eJ22O7JhD
        xtnkv0uHLBh6jm6jBwtetsTFhQ==
X-Google-Smtp-Source: ABdhPJwkM34kJi5nQesphQNuYENooFAw7OGpfBJegp+yS/GnfmJ1rzXhNx1/ymXUxz5/gZVJNcl9WQ==
X-Received: by 2002:a1c:2e8f:: with SMTP id u137mr3197705wmu.178.1614853813151;
        Thu, 04 Mar 2021 02:30:13 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id f7sm35501854wre.78.2021.03.04.02.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 02:30:12 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 08/12] drivers: export device_is_bound()
Date:   Thu,  4 Mar 2021 11:24:48 +0100
Message-Id: <20210304102452.21726-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210304102452.21726-1-brgl@bgdev.pl>
References: <20210304102452.21726-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Export the symbol for device_is_bound() so that we can use it in gpio-sim
to check if the simulated GPIO chip is bound before fetching its driver
data from configfs callbacks in order to retrieve the name of the GPIO
chip device.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/base/dd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 9179825ff646..c62c02e3490a 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -353,6 +353,7 @@ bool device_is_bound(struct device *dev)
 {
 	return dev->p && klist_node_attached(&dev->p->knode_driver);
 }
+EXPORT_SYMBOL_GPL(device_is_bound);
 
 static void driver_bound(struct device *dev)
 {
-- 
2.29.1

