Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 739922AB616
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 12:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729609AbgKILIC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 06:08:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729595AbgKILHK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 06:07:10 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0158C061A49
        for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2020 03:07:07 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id p1so8196982wrf.12
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2020 03:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m2ikj+dhQ1Zeha09QctzFr3Pm7l2AwdyE1EcOPpxBQc=;
        b=lrGFiV0JEwMQZrmMw1exEx6p70DOim7QTqsGe9oOJfscxaaDbqtNd51mDY2gLrVO6e
         AJaVU6gEvJ5Rqj0pmzF+RQrIAx3UUypf5ocQh5+MxoPZ8v5DbPYgi+LUXOO0xXncPOxJ
         vazruXakD7raTY00eG7zaplUuhpuFOzAXeDC0+Go3Z91tS4RB4jYmtz+tumRzgHuHKVW
         Q3APL+KmLaN9niAGudHytA7iWz6ha072HjPWCU0qqHVWmvaciARBx8JEUQUEjIamSyMq
         CKw7PL+YgCXUcrNMDTeAPsCWzL8tuPTeq/pLQmlfpQnNOHY3qjMybpVo+6SdERNaMi03
         sDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m2ikj+dhQ1Zeha09QctzFr3Pm7l2AwdyE1EcOPpxBQc=;
        b=HNvX27E2jSxxpakqlpWFmz+w9n1Aeigr6v9e9EYVgwNUbiamkKTFyuZVhSS342az/h
         q3DUbnf4deyZZa+69FXUPV7/5eFsmya1Jbr1EVqJbsZcQaXnyJBlx4MFMnI8n0UjCbuM
         ewfAHE7BZY5KOf4+qtkeRrMuufcFUXhRxxNM+rcjHzybYSZbda0Xd2j7FMpXZCZaiGUX
         uuv1ULyc9xsWnPrsu64PGIjqmwBjwXcYsKelvHfplOJd8IGXdNRTjqwljZHoWG5y8ITP
         8i0/KxfM2gLedO0ROuKt1Wlddy0OcN8eJ16nn5FKh6ywteBupy6Syr3utbSfT93WZBD1
         KRTg==
X-Gm-Message-State: AOAM530BhdppGjaJOCPKiW1bwl6/jhaw2Vf5bHdFRlpO0D8Ui8YLizqN
        nGVS9fR81D925UEQB5R0rXvDEw==
X-Google-Smtp-Source: ABdhPJyDQDC3mJ8XBzXRPLr9tujc8yB1EaUC1zlVXx3gghE7oqzt7WatCScZ7dhRaCoAETe4X60pOw==
X-Received: by 2002:a5d:54c5:: with SMTP id x5mr3869675wrv.297.1604920026445;
        Mon, 09 Nov 2020 03:07:06 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id d3sm12815582wre.91.2020.11.09.03.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 03:07:05 -0800 (PST)
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
Subject: [PATCH v3 4/9] vhost: vringh: use krealloc_array()
Date:   Mon,  9 Nov 2020 12:06:49 +0100
Message-Id: <20201109110654.12547-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109110654.12547-1-brgl@bgdev.pl>
References: <20201109110654.12547-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the helper that checks for overflows internally instead of manually
calculating the size of the new array.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/vringh.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
index 8bd8b403f087..08a0e1c842df 100644
--- a/drivers/vhost/vringh.c
+++ b/drivers/vhost/vringh.c
@@ -198,7 +198,8 @@ static int resize_iovec(struct vringh_kiov *iov, gfp_t gfp)
 
 	flag = (iov->max_num & VRINGH_IOV_ALLOCATED);
 	if (flag)
-		new = krealloc(iov->iov, new_num * sizeof(struct iovec), gfp);
+		new = krealloc_array(iov->iov, new_num,
+				     sizeof(struct iovec), gfp);
 	else {
 		new = kmalloc_array(new_num, sizeof(struct iovec), gfp);
 		if (new) {
-- 
2.29.1

