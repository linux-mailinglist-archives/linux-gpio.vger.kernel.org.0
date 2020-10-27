Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D636129ABCD
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Oct 2020 13:18:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751004AbgJ0MSe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Oct 2020 08:18:34 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46444 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2899676AbgJ0MRo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Oct 2020 08:17:44 -0400
Received: by mail-wr1-f68.google.com with SMTP id n6so1608659wrm.13
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2020 05:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=83y0wprNKfgsPdFQwYqYyBfxNCy5k5K/4PHHSUQ4ytQ=;
        b=zjDtGi7YCC7prpyZ+g0XEgVkSu5ur1n0Z+4Onn8lSH6l5HhaPb2usVEdHqyUF70A1t
         aUTOf8Tq+CbFmCsQoZg/QZDfe6BYR/DFPrrBJwD6HiW7tjdfR/sBEWsWaZKnLZINtomX
         mE7Ig/cZHx2rYZqBTjkzv3ijY8hAIfVQDit/QeJSY5MeOkcFLBiM+J08PWHqktFzZQwX
         UlgrIFCSx9xqlv1zNEtaXs3tPI9VHBmr65ek6JPy/L/FS56cLdvQizETmDuasggJPK/w
         ztxubnZy+sT2oOAiJOCkZTqyimYvjT8WSyK/j0zpzQcNL15qg7LbhswKDAJng2PiYjm9
         YBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=83y0wprNKfgsPdFQwYqYyBfxNCy5k5K/4PHHSUQ4ytQ=;
        b=VPmikzk5OksCXE0PEqpBTHqbd7EIto0K3ZFxRjmC4/6KCi2LHr7xfsvqTYYWZxeHVB
         3n1lOe5R3eodCRzxRzCpPq0PVtEIzEJkUoNs0ZMFvWwgyfOFIjzjjVaIbHJFfDvKbQQp
         r+efeFlTGY19WSvsTZQp6j6X1QY0z2j74R+y6V7guBAxb0uNZO1wxp/AaVxsL5cSnA6l
         q6LUKFYmZXMMszeh+slEduxa44P5x9l727bWaUhhviz1HgkeUaqlF58HZXNYA3gGLw+B
         c6ty3T6WgHiRjlDRDLAus5Kh8uSDaUAH02Iu84KgBeTyUC4S2mcsqxtF8mWmjor3qiSt
         NC1g==
X-Gm-Message-State: AOAM533w9d/gquZMXux050jd7jXim05z6mrRxNE/3kNmMWLwt5MLgxz3
        95ZvAR6+qS7f84r6d4x2Ba6Wgg==
X-Google-Smtp-Source: ABdhPJxMHI/sTmjLh3ji2z2BWBH7Xp+55j5r8SrJ3qqB6liqhHnL/S90fy042cmGylsf7I4Q+2Y+Yg==
X-Received: by 2002:a5d:6a49:: with SMTP id t9mr2477521wrw.194.1603801062271;
        Tue, 27 Oct 2020 05:17:42 -0700 (PDT)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id a2sm1731908wrs.55.2020.10.27.05.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 05:17:41 -0700 (PDT)
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
Subject: [PATCH 3/8] vhost: vringh: use krealloc_array()
Date:   Tue, 27 Oct 2020 13:17:20 +0100
Message-Id: <20201027121725.24660-4-brgl@bgdev.pl>
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

