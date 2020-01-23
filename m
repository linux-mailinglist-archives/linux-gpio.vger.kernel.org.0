Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54107146ACA
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2020 15:06:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729047AbgAWOFY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jan 2020 09:05:24 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54375 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728655AbgAWOFY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2020 09:05:24 -0500
Received: by mail-wm1-f67.google.com with SMTP id b19so2686347wmj.4
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2020 06:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wytPjSbZC28y5B3ceuqDy/iL3OfZmgStcvzlcuSAif8=;
        b=jz7U7Z/aYyl8I5OSU0ios0qBeAUM43v1yJBlrTsJeQnJf/BqqPAi504z8WeRVosieu
         TGl20Q1wWTGKIpZDTmwc4fmX5d98SdZB8vZwyg0MmvLcU7BA21gZuXxDYHglgHcoLn1l
         0CsM8wWhJpiToA6HmyXmQJwI7EELoSU/84WzinqKAEfOWi2I0/LiJSVNpEQlzMy4zwcN
         TRiHuf/TLcWwrEH6Fk/rClK/3nxDXGxmxumZhLWxztZiz6Ewn/5p4zC6fMmO5+w3C6eC
         c02hEdXgp/XuU7AItL7Hxem/lIHf9MPseyoFE8MY18hggH7+eww5AXB+1G8xX++lRksZ
         mW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wytPjSbZC28y5B3ceuqDy/iL3OfZmgStcvzlcuSAif8=;
        b=fVTTkDlrwchCCeY7M2SdpKsZLg7cuvpuUCoxwQRuUfypPuDa61w9wytRYVwT+87s9s
         KbOmtE97LAhL3zKtTS0b9rvXFdlSTYuH1lCO2Ti22eSUBFpG7/n8B1Zm2JilgG45pArm
         frKRR0PxwiUe4rzI9ahlTM9v/kjpbBM9n/2oKZ4jpk7H3LpzVrstJdGBsnMnytEUmLIZ
         Hrs2M0zthz502Avb1ylxiXp2PvcWHYD7TMEPhds9c9Sunlh+IEwoNGURCiC9ldqn/4zV
         JlccorWkyueQaaMuKcL0dddac/Zil5veUArtjLvmJX9kL0pG46fvFmbg0oGaDVcR5pkl
         x2lQ==
X-Gm-Message-State: APjAAAVyyDaCAnA5wqpzNvYDv41z7t8L1nYF20IjGZq2Jbn3DpktPr6c
        mnB4ls0WWN5z12LVYVGnC52OaaMW06o=
X-Google-Smtp-Source: APXvYqxKdnB/MOVQ0NHV1aEKZe2TS/5dzPNMUejZk9TvQG1pWykD8vOwwEBFhGAmXaLEmvllCQgrLQ==
X-Received: by 2002:a1c:5ac2:: with SMTP id o185mr4381705wmb.179.1579788322758;
        Thu, 23 Jan 2020 06:05:22 -0800 (PST)
Received: from localhost.localdomain (amontpellier-652-1-53-230.w109-210.abo.wanadoo.fr. [109.210.44.230])
        by smtp.gmail.com with ESMTPSA id n16sm3100963wro.88.2020.01.23.06.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 06:05:22 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jiri Kosina <jkosina@suse.cz>,
        Stefani Seibold <stefani@seibold.net>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [RESEND PATCH v5 4/7] gpiolib: emit a debug message when adding events to a full kfifo
Date:   Thu, 23 Jan 2020 15:05:03 +0100
Message-Id: <20200123140506.29275-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200123140506.29275-1-brgl@bgdev.pl>
References: <20200123140506.29275-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Currently if the line-event kfifo is full, we just silently drop any new
events. Add a ratelimited debug message so that we at least have some
trace in the kernel log of event overflow.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 43c96e7cdc48..6b5d102dfb13 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -987,6 +987,8 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
 					    1, &le->wait.lock);
 	if (ret)
 		wake_up_poll(&le->wait, EPOLLIN);
+	else
+		pr_debug_ratelimited("event FIFO is full - event dropped\n");
 
 	return IRQ_HANDLED;
 }
-- 
2.23.0

