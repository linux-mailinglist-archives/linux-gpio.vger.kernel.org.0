Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFBFF25DE82
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Sep 2020 17:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbgIDPuy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Sep 2020 11:50:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbgIDPqj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Sep 2020 11:46:39 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC2B6C061251
        for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2020 08:46:34 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id u18so6483038wmc.3
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2020 08:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vWT4LMe1jlQ5F4wTOV6aM7wzQxRaEROx7lvhEPCZV1g=;
        b=c4iemgVawDaHCECJORVkcx3F23o+ngLwd98jCO5TKSproRslYQQctVYTTM8UAJMpno
         9OahHxJIeo5aYvZNRQPvh2jQni7929HthhKQDT5j1D4kwPLA1oL5+XlcMiOwPCZ706kw
         PnJg4bP95Tel8j4NTMYLFXvz80DER0vDH7VENrsFyr329Zym+rZ9HGUJ97VEu7DS47cl
         y7AfhrjHufDdd3ZXZ4+iD9HT9YTtKRt3c/qVr4Cr3W4FCxwVkxwX/GWNt5HJpqxW7O5E
         ku1RbS4J9HF/RsQr9ckv3YiIz2dhVM8llU2PTQ7jPwTbSIWYWa1IUIBiUSSt8RPUngM2
         2Wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vWT4LMe1jlQ5F4wTOV6aM7wzQxRaEROx7lvhEPCZV1g=;
        b=RFJzOIWcs5rkzG6HOwfXnywxL7GCHM0h2vmbtS3a9fe/K96ntKDGjDZVcf+Q1EPuNL
         YFKtUIaTNaIaeq1TZg3M3M/tkqJ/RYJU8/meQk5IeQ3PanL3+0vO6VNfOOqNm4xA6/Qk
         Olrwz5cmI44+P3fF1q67q7TrfS/jE/7doScYLX1Q5XG/msG3Ag4I46/im3RfFEQ6ZXQM
         DGro1zB9SpUch2jOqq4AHwVjfDmV5D3fOHAszhHBtACy31fXroSHT0AOzL/7i/Pjc2YP
         wXElsUJvKfiqjifXnzmFwbi5L8v8PgGGJ1/dvQcuFuUc77tzD2aSKcdszc+ZyA2KAIeV
         r7JQ==
X-Gm-Message-State: AOAM530V0fwCWZ2g8ef17cFE/yligL5TFjRrkxGaQQcmvf9PFCh50tkZ
        GpiiNjIoYCOtHWOYOmfgNDjGHw==
X-Google-Smtp-Source: ABdhPJzIHOojNgmX6R7Azvg1X7daJLCe748526/eTTIsYoMZCTXYG8GFpTts0cg6K3JXTDM7/wavuA==
X-Received: by 2002:a7b:c1c3:: with SMTP id a3mr8883702wmj.68.1599234393322;
        Fri, 04 Sep 2020 08:46:33 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id q4sm11983375wru.65.2020.09.04.08.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:46:32 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 02/23] lib: string_helpers: provide kfree_strarray()
Date:   Fri,  4 Sep 2020 17:45:26 +0200
Message-Id: <20200904154547.3836-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200904154547.3836-1-brgl@bgdev.pl>
References: <20200904154547.3836-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

There's a common pattern of dynamically allocating an array of char
pointers and then also dynamically allocating each string in this
array. Provide a helper for freeing such a string array with one call.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/string_helpers.h |  2 ++
 lib/string_helpers.c           | 22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index 86f150c2a6b6..55b25120a1c6 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -94,4 +94,6 @@ char *kstrdup_quotable(const char *src, gfp_t gfp);
 char *kstrdup_quotable_cmdline(struct task_struct *task, gfp_t gfp);
 char *kstrdup_quotable_file(struct file *file, gfp_t gfp);
 
+void kfree_strarray(char **str_array, size_t num_str);
+
 #endif
diff --git a/lib/string_helpers.c b/lib/string_helpers.c
index 963050c0283e..22505efc6aae 100644
--- a/lib/string_helpers.c
+++ b/lib/string_helpers.c
@@ -649,3 +649,25 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gfp)
 	return pathname;
 }
 EXPORT_SYMBOL_GPL(kstrdup_quotable_file);
+
+/**
+ * kfree_strarray - free a number of dynamically allocated strings contained
+ *                  in an array and the array itself
+ *
+ * @str_array: Dynamically allocated array of strings to free. If NULL - the
+ *             function does nothing.
+ * @num_str: Number of strings (starting from the beginning of the array) to
+ *           free.
+ */
+void kfree_strarray(char **str_array, size_t num_str)
+{
+	unsigned int i;
+
+	if (!str_array)
+		return;
+
+	for (i = 0; i < num_str; i++)
+		kfree(str_array[i]);
+	kfree(str_array);
+}
+EXPORT_SYMBOL_GPL(kfree_strarray);
-- 
2.26.1

