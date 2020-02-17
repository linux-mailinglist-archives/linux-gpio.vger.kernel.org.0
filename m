Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C238161C00
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 20:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729659AbgBQTzJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 14:55:09 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:32834 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729612AbgBQTyp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Feb 2020 14:54:45 -0500
Received: by mail-wr1-f65.google.com with SMTP id u6so21269460wrt.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2020 11:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vEpSrHnokxwmZhdlJaP1Fdj4KHCY0aOhXmKsmIiSb2c=;
        b=C5yJlQ0zN1DNoCE7vAWDdzDh2oF7j6+dHO2XT/eCYXi5m1+IVxogqmWGWqAIkmMr6c
         xLaTQXqKC38T1ujrVcOPc0yJ4T/o/jeILhkKJF+Yo4RVk06ZRRlBjZuZBofXxN7NWhNY
         qpvtrLYWbrJXIN0eIwevBaYdSJClurdxLzTVDg0Hyj30k+GG9YkpiA9oGsHEJL4jeQ64
         x9T0DGwG7EahJlYYqbUbeTkglnXadRnup3TzBOI5MOgliIQDip85hI9rT2Y2h62PrxoQ
         bdI3q7CEUGk9wGzK2GcYWqGuBvSmrWWO05nhc3BghDKd0Jn0z9PYh3hXVfQyVHKDsUOZ
         DGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vEpSrHnokxwmZhdlJaP1Fdj4KHCY0aOhXmKsmIiSb2c=;
        b=eER4eUK4QOtW8pLXU6cfrWPXoix1jKYwuNYuWoNk8ceDijKnLbyNxSx5iEJo6oLiDN
         45iHT4ZxbCiJ8QPjj4euYlu7XiptzcpbdZM6ALy5SsH7pBs0krP5HrUax6570xqPEr8X
         lxd2WZ+wo0Nv/owEywplzEK0RZDhI9luXMpGY8UuBezkHgQCwYZClXDdrL03AzS3YwFK
         vhPWlGbu+9a7Ct2RLohLuxAN9qviIaS47iFXo0vX2ChGra28MYwMxr8+YnIKdUfJkvEk
         epmRZ9QLIOLNzs6wzcZF/FGWTnsDsoPFuwPP+RQPNKWgObNqTKATmCsuWL3bYJ6vFXRR
         Zt8A==
X-Gm-Message-State: APjAAAUQ4pz6R10e+8M37vLN6x5KNnUIbqa5QLC59tlFySl3huNTwZvG
        3oNvI2Uekw6s9RK9Ym4ZetaLmA==
X-Google-Smtp-Source: APXvYqy8+uEI+AwlMQIFLWh4NY+e2ujZPYaJBH3XEz62f0FrxkWwIiIuYgEVBfnvWw1JglwM/pIyJw==
X-Received: by 2002:a5d:610c:: with SMTP id v12mr22642217wrt.88.1581969283249;
        Mon, 17 Feb 2020 11:54:43 -0800 (PST)
Received: from debian-brgl.local (8.165.185.81.rev.sfr.net. [81.185.165.8])
        by smtp.gmail.com with ESMTPSA id v5sm2679469wrv.86.2020.02.17.11.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 11:54:42 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 3/6] nvmem: remove a stray newline in nvmem_register()
Date:   Mon, 17 Feb 2020 20:54:32 +0100
Message-Id: <20200217195435.9309-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217195435.9309-1-brgl@bgdev.pl>
References: <20200217195435.9309-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Two newlines are unnecessary - remove one.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index b0be03d5f240..12e2991cdeef 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -355,7 +355,6 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	if (IS_ERR(nvmem->wp_gpio))
 		goto err_ida_remove;
 
-
 	kref_init(&nvmem->refcnt);
 	INIT_LIST_HEAD(&nvmem->cells);
 
-- 
2.25.0

