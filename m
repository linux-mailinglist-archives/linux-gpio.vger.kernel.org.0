Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFA03DBAEE
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 16:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239193AbhG3OoH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 10:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239108AbhG3OoF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 10:44:05 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D126C06175F
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:44:00 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id c16so11589989wrp.13
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VKpkck+K9UnMpsr84PDgDJvg2MvvWOOWhOOenG5kATg=;
        b=Avls2Bw3SL3TV5Gz0cNwAxt+yLV7Yffo7TH5elqGQaXkGIQPhcBIGbbzgdWcgiSezi
         4Nk8TjNKFqpo6H7KNj8xKx36jO+x4MofakfVpRNqAmcanWCt5HcA2wWXE82P2xA04/FA
         tMAnR/RHhODS6WxWf/4kPtzBlbkzQd89xV7qGWpUjClXSSd16SFRLRqzDfCF1KnokSQu
         bHFQvUIMmZE8ikyEbjLy9kvKMr1VQFAvoB8KwQ8EAK62X/Jj41YC7KWjdN1H+31wpdtQ
         DGLRZdBQKtDONKKd6c1COKHAyf+z3hjbfW5ZiDhn9LqV11CD7+b9UHgnrhV4JF7qKSLO
         RMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VKpkck+K9UnMpsr84PDgDJvg2MvvWOOWhOOenG5kATg=;
        b=PYsrLkGtThajgyXX7LVQe3ZXEkmk3AMbw51ELhkPs8be4DBLhNFF/KZ2qpa1bremf6
         DIvczIPI3uv9pgi/OlP1KuuRKKf11q4xCTG22KiEIjA9fyEEORguKiDuEu39VRRJkxw5
         6ewoHej3porRnb16knPGTzjSDo44pU+DJS1mTxZC8OTfvGDZRQlhC7pZVv/qlWaWq8XW
         fYarAz7uuiK/oMmsgDhfETdHEDVUL3KCELsLUz/tybWi0WJuAKZKmtBZfTPmQE120xL+
         2vJlPpmj35+3qYC2zQiuhjKCnnIzD/LpYPMWavecUlEYS7mSoLgVjB2ebQLAz4a/RZ1A
         FCBw==
X-Gm-Message-State: AOAM531OdKlOY9/1MZB9IosQ8YIKp+eKOdE4gaLo2UapIXwiuxhvJT8t
        LQz+nzABb9qWkyLj6CjsVak/9Q==
X-Google-Smtp-Source: ABdhPJycq0hNXj2/0cUt4xXZ7HY3i+1qcZ87YVjsw6sObmUKPsBWt1nuzgfWEhurfPzQ168ykXgUFg==
X-Received: by 2002:a5d:6209:: with SMTP id y9mr3408102wru.402.1627656238944;
        Fri, 30 Jul 2021 07:43:58 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id o29sm1825029wms.13.2021.07.30.07.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:43:58 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH 1/3] chip: provide gpiod_chip_get_path()
Date:   Fri, 30 Jul 2021 16:43:54 +0200
Message-Id: <20210730144356.23079-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210730144356.23079-1-brgl@bgdev.pl>
References: <20210730144356.23079-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Provide a chip getter for retrieving the path to the device file used to
get the GPIO chip handle.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 include/gpiod.h |  7 +++++++
 lib/chip.c      | 15 ++++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 56dc986..d3c327b 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -88,6 +88,13 @@ const char *gpiod_chip_get_name(struct gpiod_chip *chip);
  */
 const char *gpiod_chip_get_label(struct gpiod_chip *chip);
 
+/**
+ * @brief Get the path used to open this GPIO chip.
+ * @param chip GPIO chip object.
+ * @return Path to the file passed as argument to ::gpiod_chip_open.
+ */
+const char *gpiod_chip_get_path(struct gpiod_chip *chip);
+
 /**
  * @brief Get the number of GPIO lines exposed by this chip.
  * @param chip GPIO chip object.
diff --git a/lib/chip.c b/lib/chip.c
index a200ef2..6fcada9 100644
--- a/lib/chip.c
+++ b/lib/chip.c
@@ -18,6 +18,7 @@ struct gpiod_chip {
 	unsigned int num_lines;
 	char name[32];
 	char label[32];
+	char *path;
 };
 
 GPIOD_API struct gpiod_chip *gpiod_chip_open(const char *path)
@@ -40,9 +41,13 @@ GPIOD_API struct gpiod_chip *gpiod_chip_open(const char *path)
 	memset(chip, 0, sizeof(*chip));
 	memset(&info, 0, sizeof(info));
 
+	chip->path = strdup(path);
+	if (!chip->path)
+		goto err_free_chip;
+
 	ret = ioctl(fd, GPIO_GET_CHIPINFO_IOCTL, &info);
 	if (ret < 0)
-		goto err_free_chip;
+		goto err_free_path;
 
 	chip->fd = fd;
 	chip->num_lines = info.lines;
@@ -65,6 +70,8 @@ GPIOD_API struct gpiod_chip *gpiod_chip_open(const char *path)
 
 	return chip;
 
+err_free_path:
+	free(chip->path);
 err_free_chip:
 	free(chip);
 err_close_fd:
@@ -79,6 +86,7 @@ GPIOD_API void gpiod_chip_close(struct gpiod_chip *chip)
 		return;
 
 	close(chip->fd);
+	free(chip->path);
 	free(chip);
 }
 
@@ -92,6 +100,11 @@ GPIOD_API const char *gpiod_chip_get_label(struct gpiod_chip *chip)
 	return chip->label;
 }
 
+GPIOD_API const char *gpiod_chip_get_path(struct gpiod_chip *chip)
+{
+	return chip->path;
+}
+
 GPIOD_API unsigned int gpiod_chip_get_num_lines(struct gpiod_chip *chip)
 {
 	return chip->num_lines;
-- 
2.30.1

