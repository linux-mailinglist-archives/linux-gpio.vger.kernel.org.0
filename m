Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7082C3AF5EA
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jun 2021 21:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbhFUTUy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Jun 2021 15:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231157AbhFUTUw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Jun 2021 15:20:52 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4724CC061756
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jun 2021 12:18:37 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id d11so18516960wrm.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jun 2021 12:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hz5gns+p3AhDjqhAsiXeZSwXwzEdrRvl08LEhr+L1D4=;
        b=xMOGfwhGzSTs0enDlVuS6L94owGvRKc674tCVRlseSvLPW7DiDMAkDVjLwycNm42qZ
         PO9Z6xbTCoxcqbt2xanQIJV/CwxpMXtvZ2oe4erFhoGbCd4a+1Vs7yr6d80u+Z3XGIaR
         KXEIp+4D7lLaIfDNLMDUPdY1YW0KOUJ/sXSnY5aj+4h7x4Mz1f1cUxC751Ze3PcRVKvq
         xswlbq/Z9ujTgmTe6hBoQtOA0c0eM4vJgs52SN7qww/8Xso3diUigisQHIPn5RpbH/lI
         Prd69FMogIwqzoyM3+WDoUTQeDIIrZTnpHy6FgNCVRk+X0s6OuSlhVLO21lXo47BGnc5
         s3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hz5gns+p3AhDjqhAsiXeZSwXwzEdrRvl08LEhr+L1D4=;
        b=sVG/r6pWn3T5UEsStoxnsiIUIUqYXY4BfZl5l9FUOe8FhmUuU21Lu44GLlhCqCvbsA
         95od9MNDw7zNoRZunDgkbKCkLr3RNAJjQv5DtvKCn9cLL5vaOSi2Pr/fxAT6Xkkqe5x6
         V67pxmF4coSy94h8d29BoJwuJyytFWCoGCVDj6gi1bV56hpRvbjniIaXiwKKd6wGZnH/
         sT/sO6hsSXKXg/MzjVbEz6wINKW10ewYlLZnAfPge66CrFKwzQnFNP68AKI+Fwhzy2Ro
         OXDT4tDnKMJQa17+0DYdb8e7CbrFl5aQBrAluuY9rOIJFBuiT8O12QdL16Vi8WOSyODT
         GUbQ==
X-Gm-Message-State: AOAM533IP97dwehh6pGUHQ6GDqB8VXmnWwDHgLFwV5YTIHbsKWYjXiDl
        UnHzZKfLm/AL+vlbWnyrlugegw==
X-Google-Smtp-Source: ABdhPJxw3QZI5dNdg5DfmTlK71BxHYQNxvVt9MPDYXVWURCAWjsL72oLXBcZa6fpganbZ/P1nlofBw==
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr30357572wrs.304.1624303115951;
        Mon, 21 Jun 2021 12:18:35 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-146-78.w2-15.abo.wanadoo.fr. [2.15.229.78])
        by smtp.gmail.com with ESMTPSA id j34sm19438243wms.19.2021.06.21.12.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 12:18:35 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][PATCH 3/4] API: add an AS_IS value for bias setting
Date:   Mon, 21 Jun 2021 21:18:29 +0200
Message-Id: <20210621191830.10628-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210621191830.10628-1-brgl@bgdev.pl>
References: <20210621191830.10628-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We don't have an explicit default "as-is" value for the bias setting.
This adds it.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 include/gpiod.h   | 4 +++-
 lib/line-config.c | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 3671c2d..629601a 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -451,7 +451,9 @@ enum {
  * @brief Available internal bias settings for line requests.
  */
 enum {
-	GPIOD_LINE_CONFIG_BIAS_DISABLED = 1,
+	GPIOD_LINE_CONFIG_BIAS_AS_IS = 1,
+	/**< Don't change the current bias setting. */
+	GPIOD_LINE_CONFIG_BIAS_DISABLED,
 	/**< The internal bias should be disabled (the default). */
 	GPIOD_LINE_CONFIG_BIAS_PULL_UP,
 	/**< The internal pull-up bias is enabled. */
diff --git a/lib/line-config.c b/lib/line-config.c
index 5b6dab4..24dc5f4 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -496,6 +496,7 @@ static int gpiod_make_kernel_flags(uint64_t *flags, struct base_config *config)
 	case GPIOD_LINE_CONFIG_BIAS_PULL_DOWN:
 		*flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN;
 		break;
+	case GPIOD_LINE_CONFIG_BIAS_AS_IS:
 	case 0:
 		break;
 	default:
-- 
2.30.1

