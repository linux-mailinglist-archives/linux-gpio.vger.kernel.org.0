Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EFCE333068
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 22:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231935AbhCIU7j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 15:59:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231607AbhCIU7f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 15:59:35 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB27CC06175F
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 12:59:34 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id y124-20020a1c32820000b029010c93864955so8124674wmy.5
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 12:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h87jccumC6oS/Oglf5H2ioMoJmQRJZD6wd7xhfpKIok=;
        b=fZVB/QGG9EbB5+T+UR94Xnpw6QNQ921+Fz8r5lwjpB9Khl+Tow82FJsb9Io2XFA5SA
         bR9K9JlxSqYTckTQ3Ts7ONMkXbCR5kGgUKjI0JzOwAnGvXUCTr8Rvi5CA3aoEdGUYinl
         TsgIAftrebZgUyQXtW2B3vq+l6m8gX55cEDN19ZPrpQIejK7HV4eVB/BO4a1pztV21rs
         0SOoqh2pJcdVdlx6ge/S62DsUY3VqZkqx8jcUuM5p7gXS2J6/Uye4re3fJnHwa+69osm
         j8fCAxmQe0CKoNhp3WpA/DyfgxmwqRwtzbympBm/v3uMd/BybE/xDuYS4RR+dnOioZkP
         U92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h87jccumC6oS/Oglf5H2ioMoJmQRJZD6wd7xhfpKIok=;
        b=fijv14vmlGmJm843c3JI9detVANpkUgZr5nbGSxmYAIA41m8v6b9INTzeipZfoj1kv
         NJAcof7uLHnBOedAhRw8qNWinOl0O5Y4M23ahMQqvbtzzW3Y84tiGAasnj3eJ7b8g6XU
         vfqB6toePB2NTRIP6ktsAEzSPHb9wDCBkHLPBvHCW0akPpskPLDxr5TrRFFUuNUKXm+s
         mUVRl9qxKzgJXdf/rdKfUQ2uLh2m1eajik/44uQx/0RLP8Px0UzvaxkIydkls+KsvZPP
         Qcw+cZciaKAaDDqseG1o3a5aoQMxkgi2i6R5rV1TPUdS70zjJIuSC+ZnHXmCt4IydxQt
         VBWQ==
X-Gm-Message-State: AOAM532gQPWMAXx4pMCOv1PPoeFcnNzFhbtd3mcM9gMX+0I6Io0icec8
        V3+t9Ym5xurNu+9B+BSiLF+nNA==
X-Google-Smtp-Source: ABdhPJwj2H2vR6x+JBM8OMVIat1b7I4XyvRBqoZlPgrqY7coics7xEB+cMJzqKv3wVFqDlnCyVkg2g==
X-Received: by 2002:a1c:a5cb:: with SMTP id o194mr5962641wme.129.1615323573594;
        Tue, 09 Mar 2021 12:59:33 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id j6sm5501305wmq.16.2021.03.09.12.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 12:59:33 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 01/11] configfs: increase the item name length
Date:   Tue,  9 Mar 2021 21:59:11 +0100
Message-Id: <20210309205921.15992-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309205921.15992-1-brgl@bgdev.pl>
References: <20210309205921.15992-1-brgl@bgdev.pl>
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
Acked-by: Linus Walleij <linus.walleij@linaro.org>
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
2.30.1

