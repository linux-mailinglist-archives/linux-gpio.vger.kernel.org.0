Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 115431F14FE
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 11:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728956AbgFHJG7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 05:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgFHJG7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2020 05:06:59 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CDE0C08C5C4
        for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2020 02:06:57 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e1so16525776wrt.5
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2020 02:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=boundarydevices-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5xZDVG6s/fiwYQbkYyEt3S3SH1BzTQjs+4yAHepva4k=;
        b=pDIzbglQCtiGn+iujJzWDKzB+/FeBGrUAYoYKTOFICPBgCJfS4JXcKhkkBT3ho0XxN
         fSn6TV1vR4nr57AOFI2/62PVDqR7YDyrY6NBWjwr9T3rL0MGLxyDt1g985Z5AIaMSGsm
         lgEOXq8KnZCkR6grCaloPfFmRiJuOF1/QRsv5r/yM0+EpHEPIndLkqFnchhGtbaZZkfv
         /oJGLSd2oMXiZ7oFse9xUvhjYXt5YUZxfUBwPBZEpI9mdYYSHE3GmgBAj220Xi8uYXn1
         FjKQUfLw8kgExZQW+yG3Y3LwUjNvKaVR3M19OHqZ8KtBqu+uuJP1BcG+jxoXNMYg/+p9
         ipZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5xZDVG6s/fiwYQbkYyEt3S3SH1BzTQjs+4yAHepva4k=;
        b=njyqmufVxRAKx4jQB6IVJWhr2CcY+atjmyqVk7j9XhFNzBqLWxA90XMwc+/6anNrpb
         dwdnZhI/DIFngO61cu/W4p0z5rgBOeur6gf4yClQCXd2PkTcXFQXSVlGCfZAzGVxPqUF
         wCqr0OIydmYsFFjl7hykBQ5Bg2an6kmDwiCv0PsQymoStoRYO1UKtLpInuUoBBUBVEkk
         2/lA8OZb7HbeCaJp7+bDPvF3utK64bwDhNzedPiTApZowlxHVSQa6ZAyKl7CneyaT/jM
         UZe8TZe/Rka9fhediqo32aBRChacFH2Nj6SnJsdMgnx7jiwdv5wvN2rdgxqkA+kV2cub
         QUQA==
X-Gm-Message-State: AOAM531ZoROv5VCzIUaaf67Vj+MsbyfX4VqM+kLv8AU19oo7Zrm2/M9a
        N6IBWHc/B/rwLHdXk/wYo1xrAit1GGk=
X-Google-Smtp-Source: ABdhPJxHli7FlXRv5bru8hsImMh+iDopRbsReGtMz+vbeNLl5NIW/i8Cz3la7f9nxA5jKSGC4RUErg==
X-Received: by 2002:adf:fe8d:: with SMTP id l13mr21834527wrr.282.1591607215813;
        Mon, 08 Jun 2020 02:06:55 -0700 (PDT)
Received: from localhost.localdomain (2a01cb000f89b400cc883edd44ec4519.ipv6.abo.wanadoo.fr. [2a01:cb00:f89:b400:cc88:3edd:44ec:4519])
        by smtp.gmail.com with ESMTPSA id f9sm15378727wrf.74.2020.06.08.02.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 02:06:55 -0700 (PDT)
From:   Gary Bisson <gary.bisson@boundarydevices.com>
To:     linux-gpio@vger.kernel.org
Cc:     Gary Bisson <gary.bisson@boundarydevices.com>
Subject: [libgpiod][PATCH 1/3] core: add missing header inclusion
Date:   Mon,  8 Jun 2020 11:06:50 +0200
Message-Id: <20200608090652.805516-2-gary.bisson@boundarydevices.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608090652.805516-1-gary.bisson@boundarydevices.com>
References: <20200608090652.805516-1-gary.bisson@boundarydevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Otherwise throwing the following error:
lib/core.c:102:9: error: implicit declaration of function 'basename' is
invalid in C99

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 lib/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/core.c b/lib/core.c
index f704b44..b71a284 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -10,6 +10,7 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <gpiod.h>
+#include <libgen.h>
 #include <limits.h>
 #include <linux/gpio.h>
 #include <poll.h>
-- 
2.26.2

