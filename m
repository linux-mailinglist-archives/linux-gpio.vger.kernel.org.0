Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7EF283093
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Oct 2020 09:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725979AbgJEHEP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Oct 2020 03:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgJEHEM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2020 03:04:12 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E717C0613CE;
        Mon,  5 Oct 2020 00:04:12 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id p21so5455961pju.0;
        Mon, 05 Oct 2020 00:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/AE011iD+7PG9u5ZyKUnlIsF0Arck6Q8xxYUX6SocF4=;
        b=PVHMM8oVjonCZdND4kvCHRW5Eg+OUZNyc+GVVmlTFrTEY6oRAIth3xxE0HUrkGF5C9
         01yCMfKjFRvTIL3pl0aRnWcZOZ9weDWwieETUn/Le/UvcR9xQvoZbqWINM30lHoZHbzC
         jGCzsdS7HEoGOZpf0PDleVH9mxESOyTWhE0vpj+u+EaQGsuLuanFfrKvAfJfSXB/JFgL
         nRQF4fdo57J5tv6vbBwqPxoTdPZY4z+7H9iZgMEiidkkR0disdp4pWhjVP5r7XvI85oZ
         mF9OajYfcdkuOO1HphuYH8JZ06Qk9XUvgFtsBX7uvlrgo0X5qoE4S8AlayhSxRHsx5ov
         BG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/AE011iD+7PG9u5ZyKUnlIsF0Arck6Q8xxYUX6SocF4=;
        b=TrGXhVJafCF+6tW+ws7R159dKzOT1ZcWfHi2VgOD5Rys3oEXakvCbn3+f0UNKgWlw+
         VcRD9ACm+hRrW+olvRWJePKplxJSJF8vnOgM1AkAJl92NVKVJ/aGoBAQ0Ck685/z+rhn
         wqRyY9Wn18tIQnqFWX/ElqAsSTgNNY0VGJD/9bdOLs0h0FS7ihgXvLZW0mOHOQZl4XNX
         oZseQMmlQiMqYkz1Co13kGw//1TwUZb9AP9pyAIX/cxuDh8aaHITRGRimtTrj8LT6aVr
         ZHXaCmxLvcBv+nEzYaR9Yubh21h8ZlZU7P+3HVZVoSfk6UToWj5V6WcgQdzS6wWqKuwz
         7cGQ==
X-Gm-Message-State: AOAM533c2hvO9imsNYC7LfMmzH4n7K8NgC2aDyOJzPJ/6nsDrDDf1jU4
        8sOAQICtU9PnTKQ/TbKwVfyCO6phh0dawg==
X-Google-Smtp-Source: ABdhPJypECjbD8lZKiIdzEukIpWhP9x0L+odGm8H5xX050+Ma9cbmhBUPZalQqcL6MhWfLSXA3zzTA==
X-Received: by 2002:a17:90a:94cc:: with SMTP id j12mr3916946pjw.106.1601881451246;
        Mon, 05 Oct 2020 00:04:11 -0700 (PDT)
Received: from sol.lan (106-69-166-86.dyn.iinet.net.au. [106.69.166.86])
        by smtp.gmail.com with ESMTPSA id 78sm6868764pfz.211.2020.10.05.00.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 00:04:10 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 5/5] gpio: uapi: clarify the meaning of 'empty' char arrays
Date:   Mon,  5 Oct 2020 15:03:29 +0800
Message-Id: <20201005070329.21055-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005070329.21055-1-warthog618@gmail.com>
References: <20201005070329.21055-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Clarify that a char array containing a string is considered 'empty' if
the first character is the null terminator. The remaining characters
are not relevant to this determination.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/uapi/linux/gpio.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index ad3f56dd87ec..2072c260f5d0 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -26,7 +26,7 @@
  * struct gpiochip_info - Information about a certain GPIO chip
  * @name: the Linux kernel name of this GPIO chip
  * @label: a functional name for this GPIO chip, such as a product
- * number, may be empty
+ * number, may be empty (i.e. label[0] == '\0')
  * @lines: number of GPIO lines on this chip
  */
 struct gpiochip_info {
@@ -203,7 +203,7 @@ struct gpio_v2_line_request {
  * struct gpio_v2_line_info - Information about a certain GPIO line
  * @name: the name of this GPIO line, such as the output pin of the line on
  * the chip, a rail or a pin header name on a board, as specified by the
- * GPIO chip, may be empty
+ * GPIO chip, may be empty (i.e. name[0] == '\0')
  * @consumer: a functional name for the consumer of this GPIO line as set
  * by whatever is using it, will be empty if there is no current user but
  * may also be empty if the consumer doesn't set this up
@@ -315,7 +315,7 @@ struct gpio_v2_line_event {
  * @flags: various flags for this line
  * @name: the name of this GPIO line, such as the output pin of the line on the
  * chip, a rail or a pin header name on a board, as specified by the gpio
- * chip, may be empty
+ * chip, may be empty (i.e. name[0] == '\0')
  * @consumer: a functional name for the consumer of this GPIO line as set by
  * whatever is using it, will be empty if there is no current user but may
  * also be empty if the consumer doesn't set this up
-- 
2.28.0

