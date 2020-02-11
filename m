Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45AC5158BC4
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2020 10:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727797AbgBKJUR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Feb 2020 04:20:17 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33847 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727944AbgBKJTu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Feb 2020 04:19:50 -0500
Received: by mail-wr1-f68.google.com with SMTP id t2so11326820wrr.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2020 01:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EtQ76os3WQVh0lw6qN9j82AIAuvSyf0QqFvaxFLUUBU=;
        b=DyVOmojvRFjUnnrjwaMeuiQ2YjiblV2VtavuQVFfBCWbNZYhxJi4e9GsozvPg/qhaE
         VNpQ0Gq5Lf1jvaGoJl6btT6JwUrkJD7aH5LSEZRfcg9tOhegu9FGg2agiVKH2vLVI/ow
         baYpT3ytVqOreWeFWw7laF92UyzKY9JS+WujaPjXd0Fr/pKldPbUBbCZ3KEpMg0CTURo
         r3LrApXf293+3jwT7tIWb3MOoTj2EdXwjGzQk97g96nDz4TodOrID3UnsFZ/09h+6Kkl
         dl4T/k3/UmJJTAfyH3WP5vc0E2FxJWUK/eCDAVRT/gv/HtiyyJv2YmUeHkHPbyk9EUtx
         NKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EtQ76os3WQVh0lw6qN9j82AIAuvSyf0QqFvaxFLUUBU=;
        b=e7VIfQjITu3Dno7zbPzKabAOdRQ+JIOcVc1xrgLY87xU74Agc632VNtlaZZsvJ8zAV
         bllQ5K0gFWpN2xrnmgnJxo2awa8PpPFhJSDdJF2tVAhIU5StZMGBQ5u37k4WofQakw/L
         jprJwA0ws7Q64XztaFmdbY4bUYV2qKISy6DcFbjsYP2iWPQnoF3Y2JBVVk32btu9vGHV
         iADONbZDBZfhKlnmBW0k8DEmQT4hsHDoN6Zjc8mKlYJ05ojiqzQ1ifS//V0dTskp3Eq3
         wnmFFlc7sP83wKGfVSH3TCJ3KOcJWmGfDIxKA/alHw422D11489Pmm9NbMTrMBj/upGu
         soqw==
X-Gm-Message-State: APjAAAW0jA/p4+HFj5pXXKYlrO3jRohkSnO0Xs/LCsCsQsyXfdhnx6iE
        368M6zTiG+mpp1q+KIcksAmmsw==
X-Google-Smtp-Source: APXvYqzKebWA8ZpvWSMpxM6xOkfIIW2ZrNGnVdQQRIq21HnxvXCKT4gzhudC0T63hzJh8ZHje4y2sg==
X-Received: by 2002:a5d:6087:: with SMTP id w7mr7374811wrt.36.1581412789413;
        Tue, 11 Feb 2020 01:19:49 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id y131sm2958622wmc.13.2020.02.11.01.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 01:19:49 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [RESEND PATCH v6 4/7] gpiolib: emit a debug message when adding events to a full kfifo
Date:   Tue, 11 Feb 2020 10:19:34 +0100
Message-Id: <20200211091937.29558-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200211091937.29558-1-brgl@bgdev.pl>
References: <20200211091937.29558-1-brgl@bgdev.pl>
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
index 43d98309e725..36afe0b2b150 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -978,6 +978,8 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
 					    1, &le->wait.lock);
 	if (ret)
 		wake_up_poll(&le->wait, EPOLLIN);
+	else
+		pr_debug_ratelimited("event FIFO is full - event dropped\n");
 
 	return IRQ_HANDLED;
 }
-- 
2.25.0

