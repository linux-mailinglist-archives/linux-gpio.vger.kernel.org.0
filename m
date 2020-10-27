Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEA3029ABB3
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Oct 2020 13:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750948AbgJ0MSE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Oct 2020 08:18:04 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52578 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750937AbgJ0MRz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Oct 2020 08:17:55 -0400
Received: by mail-wm1-f67.google.com with SMTP id c194so1164447wme.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2020 05:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nNS5tvBpA/i0H7p7l8m9y8bW5QzwJCcb9cwqd3juySc=;
        b=uINaxail9sUfALoEWstn2csJR9jE7v9clDsZtLcLiOMSXg2LAVFIQqN6lHKyyZUd4l
         jRiwMGMG4DxMFJH69rSCLOtob+027D28VPhBQtpIrjKA/W5lb5Kv+7Q+cjTTcQNW8hxv
         wUoV9A8I84g3amtYBnRWsQ9zCBUoSUYIxS8yqik5kvDE0D17HbZwhUPBEWV0xwo4eSQB
         xtGlMRrIXAwBsMOZYueqppFbh9JQaNXeAayhSnZZJNrW9nmKvVAevDfxEiP//pXPGQn7
         22ZoAAwvkiz2v+dHQuQfEfVqcnXh5D2KeVL1FBqvTUVKMuvl7wX7b6wRp1orV+Uuzzwn
         SgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nNS5tvBpA/i0H7p7l8m9y8bW5QzwJCcb9cwqd3juySc=;
        b=d+f6s2f2jJas+oFO+xXdSoKsIQ1Q9WMCKwjtKS0bkplCnPfu567dBZv5qOaIUx0jIg
         oqwZasSgXOlatdsf5r9BxFh3d9hQiLHs0otEfJnghlyCH904+u811agA4rJ0Q1IwaSvb
         J2TRcP+uz93vhj9fNwaZKNWsAPSxJrYjB2YMq0e7TaGQebHMkO8NL9H2EafYPmH+098J
         W3Netpx/eIi7U0p+M5B3rzhYL/GkKFOyxN6Sq4dPNRM++vsQRe8Y0BPXmEX4UmvaaEdO
         B2SBUJXZs1tbo9gR5pF6KBrSb6rlf0zd9w0ra+euDUEpUctbQXc+Fb40iF5nrAMtL9hu
         LrHw==
X-Gm-Message-State: AOAM533u3mz6WtOy61QO137cV/sV2mbaGMNUJyKhKRl2RfcEFMxqS8G0
        TI0nb1kIW+Nm/0s8bjIxQGCiZA==
X-Google-Smtp-Source: ABdhPJwlnp8d7/fOEkypkqwExUCmIl2RKP9vSFIY6Z3TXZuynGv+gQ6ZzaCTjRN4xR7i9/EdKZccow==
X-Received: by 2002:a1c:28d4:: with SMTP id o203mr2460319wmo.143.1603801072719;
        Tue, 27 Oct 2020 05:17:52 -0700 (PDT)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id a2sm1731908wrs.55.2020.10.27.05.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 05:17:51 -0700 (PDT)
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
Subject: [PATCH 8/8] dma-buf: use krealloc_array()
Date:   Tue, 27 Oct 2020 13:17:25 +0100
Message-Id: <20201027121725.24660-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201027121725.24660-1-brgl@bgdev.pl>
References: <20201027121725.24660-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the helper that checks for overflows internally instead of manually
calculating the size of the new array.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/dma-buf/sync_file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index 5a5a1da01a00..2925ea03eef0 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -270,8 +270,8 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
 		fences[i++] = dma_fence_get(a_fences[0]);
 
 	if (num_fences > i) {
-		nfences = krealloc(fences, i * sizeof(*fences),
-				  GFP_KERNEL);
+		nfences = krealloc_array(fences, i,
+					 sizeof(*fences), GFP_KERNEL);
 		if (!nfences)
 			goto err;
 
-- 
2.29.1

