Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 592992AB5EB
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 12:07:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729660AbgKILHP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 06:07:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729635AbgKILHN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 06:07:13 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC52C0617A6
        for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2020 03:07:11 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id s8so1124880wrw.10
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2020 03:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6cAnhvx340aJ9UoLX1zbzAI7OYOIgRl1WRMoR3sh/3E=;
        b=FyQZtjHqfEyQnPv0TcpcPtzRKkDJw+5CmWnvLutUBlrvUrtATk0Us2kMQ7uvhmWfUK
         0eNbMBkRypCB1SmS4/cqrqAasUoL4DRnxlRBQpx1RY6Tmr/Nmpi1qrl9p+XJQGfeV43E
         mFuEs1COfnJNQITfkQgHpOePzHVg4ZkMOJ3R2gxEfTlMvi1SeMz0xGFn8SpGlE7k3cDi
         ir/hpb8caCpkIei6+oq3/Ia4klZ1In4veaRJTPot+bbCaCVpPH5XTZ/5HXwtNVY6LaVL
         3yuEq5NuC3KQYT8NF2HDTR54VuMPtxnryjgjsmx6McYPUOFssMfDPYJ7o2Sth0VExlL2
         F4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6cAnhvx340aJ9UoLX1zbzAI7OYOIgRl1WRMoR3sh/3E=;
        b=Rh6xgOZwqvTACriapzaB4rUVdLDiuTUK/O0Q7mzwBMlWkqELi3lQbpOUGRR1ign98r
         t/x1X09CkQ0p9cdcQZkFtTjf629u0lqaXoUeGw+4DPYUaKB0FTJaXKJmnLF92N5GW2UN
         d8e1FNA8MUxKUyZvtWQFdM2wsL4iaUbxAC+5k8fFjO0YybUGL3NAb6IAQ4dXRUPmTWee
         +M0+MJJrpr2E6sat2ZCk2CBLCrM0niHEsiZeytQcR0W65iLeyq6O7p93LtLDbihCg6pV
         0zM+nkszR0g0SGfELaihfhRsdZgKr6u1wxjzxj01i+xAOYfteexqU0hYVgxLBYar47x8
         A1fg==
X-Gm-Message-State: AOAM532YydimE1Bj9wLNUUWBIeucEBTsKue23sRs8AihKxH09ktZBeRk
        V9P1aBLvegDDoKaz8Jih5DW6LQ==
X-Google-Smtp-Source: ABdhPJzVQIP6CvZC6MnxUgT+6qZKHTI55QEgy3Y0wnhrHAwRmJiPirAD+L1SJbeYTFQHWYNVPaOZHg==
X-Received: by 2002:adf:a315:: with SMTP id c21mr17265337wrb.272.1604920029898;
        Mon, 09 Nov 2020 03:07:09 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id d3sm12815582wre.91.2020.11.09.03.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 03:07:09 -0800 (PST)
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
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Borislav Petkov <bp@suse.de>
Subject: [PATCH v3 6/9] edac: ghes: use krealloc_array()
Date:   Mon,  9 Nov 2020 12:06:51 +0100
Message-Id: <20201109110654.12547-7-brgl@bgdev.pl>
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
Acked-by: Borislav Petkov <bp@suse.de>
---
 drivers/edac/ghes_edac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/ghes_edac.c b/drivers/edac/ghes_edac.c
index a918ca93e4f7..6d1ddecbf0da 100644
--- a/drivers/edac/ghes_edac.c
+++ b/drivers/edac/ghes_edac.c
@@ -207,8 +207,8 @@ static void enumerate_dimms(const struct dmi_header *dh, void *arg)
 	if (!hw->num_dimms || !(hw->num_dimms % 16)) {
 		struct dimm_info *new;
 
-		new = krealloc(hw->dimms, (hw->num_dimms + 16) * sizeof(struct dimm_info),
-			        GFP_KERNEL);
+		new = krealloc_array(hw->dimms, hw->num_dimms + 16,
+				     sizeof(struct dimm_info), GFP_KERNEL);
 		if (!new) {
 			WARN_ON_ONCE(1);
 			return;
-- 
2.29.1

