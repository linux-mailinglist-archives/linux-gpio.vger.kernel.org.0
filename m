Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA65112F23
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 16:59:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbfLDP7a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 10:59:30 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46711 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728595AbfLDP73 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 10:59:29 -0500
Received: by mail-wr1-f68.google.com with SMTP id z7so9166467wrl.13
        for <linux-gpio@vger.kernel.org>; Wed, 04 Dec 2019 07:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0HHgoLgFHf2KTo5tf1P+Sd12YWIyt1YcyhSjGYkb4R8=;
        b=Vt/6D1lS08tFWOArLQbOP8E/WEJ+/7lyTXHQCXBXklKYAc1dmvCjy97Idok02qrp+G
         /iRmBekwSuOk5CHDHIX0jvI9QPjRJWcHhJaALqciMpbsAKzJdeoitRdEQwyUY1vktAar
         VPIXLw0dRbLHP+AQ1WhHMfRB4wUZg0DUwOIAyaT4lNRu80JU/Zg8cJ7ElWh8qU6QzG0U
         lmTPo0OKpqHTbbTFqeHv5gxwoVkigvqAzTDv4FJARCSJIQjwo7GRlGUMzmXyc5/41yoh
         ZLBsvPTo+mcBLkasVIMGfTcYaaSvjx3JNS9np3G5L2MjiL5jLggwH3vYd+I84iv4PmrZ
         HfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0HHgoLgFHf2KTo5tf1P+Sd12YWIyt1YcyhSjGYkb4R8=;
        b=H9bSltSMOZrLXIYtiA1fPpblKoMYXKoMsebaUcHS8rRFmos1guD9fW5VYmb+xqeDSF
         LfIGeRoM446emBMqy6c+lrCIxHjgzs3uoF+PqZJLQGDHQTtrySD8quABVJ8ZKnkBLxDe
         UekrHg5MXyL1pDFHKWwxcC8HU6Y5YG1GWgQSRno+rSSgW/aQKxTiAy9VY0PlOxC/THsJ
         quZelHsC80gK4VRTQ/i8pkuIJL0s6bwknISemFjaTw7RhABa6Qs8HfVA2oNtdjAKH5Ou
         9Hbs44J+fWuad3kKritQa7yAR7BB2vz12BDOASCzNY3/ohh1M+YDqZ2aKAnIp+OX91Gl
         i60g==
X-Gm-Message-State: APjAAAVB69d6gTGG+A0YC3ux2ddnkPiD0QCQW/jxA5Vzcr0EQV6h+L6q
        PoOIwGRzdD5gG1KZaZGhOYN8wQ==
X-Google-Smtp-Source: APXvYqx45bZ9826Rs8lcmtiIU4mfdZWsykH+a2xcXPaHAxKIcIt36IpO8A21JvhcrlmQ6H6Rwr5GQw==
X-Received: by 2002:adf:eb89:: with SMTP id t9mr4904521wrn.5.1575475168318;
        Wed, 04 Dec 2019 07:59:28 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id u18sm8640508wrt.26.2019.12.04.07.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 07:59:27 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 08/11] gpiolib: emit a debug message when adding events to a full kfifo
Date:   Wed,  4 Dec 2019 16:59:11 +0100
Message-Id: <20191204155912.17590-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191204155912.17590-1-brgl@bgdev.pl>
References: <20191204155912.17590-1-brgl@bgdev.pl>
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
 drivers/gpio/gpiolib.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 43f90eca6d45..c89d297da270 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -975,6 +975,9 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
 	ret = kfifo_in_spinlocked(&le->events, &ge, 1, &le->wait.lock);
 	if (ret)
 		wake_up_poll(&le->wait, EPOLLIN);
+	else
+		pr_debug_ratelimited(
+			"%s: event FIFO is full - event dropped\n", __func__);
 
 	return IRQ_HANDLED;
 }
-- 
2.23.0

