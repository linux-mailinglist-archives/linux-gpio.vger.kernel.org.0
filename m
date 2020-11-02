Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5422A2E30
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Nov 2020 16:22:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725929AbgKBPVk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 10:21:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726584AbgKBPUv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2020 10:20:51 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A294AC061A04
        for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2020 07:20:50 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id c18so9768459wme.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2020 07:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iECHQmtOjlKNpXGH67tnBHQ9XW515B1GPzEiiSpCWAs=;
        b=gVI6AXHj1TR9hrfeYHb9dFp1mjew1HU6tCdihy0BU74lIamhYA7I2Voy1vdbHNesjR
         p/9fN/OWbbHskwd+E8JR5E7mlF2yPwnRyYtplyTXp1xuKHzcS1KZmAQ11HYDiDqqk7yd
         tY/OlfBK/MIoUqiunGYPPRAv9qXuTyoKnb4oe0deS/0lvO8WRDkT4MMl7YYdbRLIjP6A
         WZTM13vo3qiWMFhDQgKf19/bBsn2+22jmj9vBOz0Wr1g2h4AsIo5xnYen4guGQ+vuB7M
         tIBujecjdmcR/Z2ixrsAyoeQ+6Gr/0jPL5uAk5wnvtIcZr9YQMnQKa+inwhetM8theTJ
         LUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iECHQmtOjlKNpXGH67tnBHQ9XW515B1GPzEiiSpCWAs=;
        b=H5SOyNJKYGKSM6MEQ0rWx/XaEBPlrkrOnVhrWt1WyV91swtEuyh4gFwAvCC/VYdiP/
         t3dNEPgdYRU6ZMy5FNw4KSEBBDjTMwZiyvis6SPqJV3xy76BRYOV4gdXhfVBZgT88NI+
         UHRwfBic12+6K0q0ID432hitbVFODT/Yr8MsNNfCJM0c2PbENkWTKrj+bxKvee9pVLPb
         r6vZlMBzc1hY5G6SdM2ebCn74LEDXGSVlYFxlVVPXXD4HCbIZNex5VdIjhjpilFoQl+l
         YcdOYpRkxWplvNK2NGBpKB3Ppm/0XEvhZUYd7OlkfJmQCVIO1YuXhlrffVmlotf0Mhyh
         RULw==
X-Gm-Message-State: AOAM531xRRAdia2iU5g/uvQiuM0TzCQxNIuvglgdQgZvkU2kaUEaRTrM
        ywajMBqrkpoBayP9+WhcTcbvSg==
X-Google-Smtp-Source: ABdhPJx9fmpXAPU0JQHKuUawZdLrOPu5JMkxXUw7mS4v/KP1pdXlJ+GdMVgsN3hdsL/yk/nVdd3HMQ==
X-Received: by 2002:a05:600c:1497:: with SMTP id c23mr13426695wmh.95.1604330449377;
        Mon, 02 Nov 2020 07:20:49 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id b18sm15138014wmj.41.2020.11.02.07.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 07:20:48 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-edac@vger.kernel.org, linux-gpio@vger.kernel.org,
        kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
        netdev@vger.kernel.org, linux-mm@kvack.org,
        alsa-devel@alsa-project.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 4/8] pinctrl: use krealloc_array()
Date:   Mon,  2 Nov 2020 16:20:33 +0100
Message-Id: <20201102152037.963-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201102152037.963-1-brgl@bgdev.pl>
References: <20201102152037.963-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the helper that checks for overflows internally instead of manually
calculating the size of the new array.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-utils.c b/drivers/pinctrl/pinctrl-utils.c
index f2bcbf62c03d..93df0d4c0a24 100644
--- a/drivers/pinctrl/pinctrl-utils.c
+++ b/drivers/pinctrl/pinctrl-utils.c
@@ -39,7 +39,7 @@ int pinctrl_utils_reserve_map(struct pinctrl_dev *pctldev,
 	if (old_num >= new_num)
 		return 0;
 
-	new_map = krealloc(*map, sizeof(*new_map) * new_num, GFP_KERNEL);
+	new_map = krealloc_array(*map, new_num, sizeof(*new_map), GFP_KERNEL);
 	if (!new_map) {
 		dev_err(pctldev->dev, "krealloc(map) failed\n");
 		return -ENOMEM;
-- 
2.29.1

