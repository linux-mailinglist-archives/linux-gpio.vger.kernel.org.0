Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6E33A2B48
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 14:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbhFJMSz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 08:18:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbhFJMSy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 08:18:54 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E19C061760
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 05:16:45 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id e20so10493073pgg.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 05:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lbvuyDCKxhS70EpnInJJhlyy/gqDxngGs41BmHdz+PI=;
        b=C1hes3pm8T2S8foeMxlebM5zz+ZikyomC1drFEMW2lVHoDCBKZMTm8kLS8PEkgqbPX
         zgRaQ9A2/xYzU00RzoM9TCsjsTraPhGuysPXwOMKEBaML7r5v16ofVicxIDDT3XpyhZK
         BKqrkHa5nu0Lr73FF7QHS9XRBV1PVfVfw7zQFQfYSRsUe7OGO4AYd7w9aIKwOZRUgum9
         JnHTj2FPkT7Okc93Di2wQ1a39B88/kWKQ23dUBIow3AEF7ORggIyD5Kh/b1w5SZkcTWq
         bYMydeOb3Iayi8oufcmI/hfsoPlM8RH0dGcURTwilbbztMAqX5hUNfncpia0xMm1KLGW
         6gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lbvuyDCKxhS70EpnInJJhlyy/gqDxngGs41BmHdz+PI=;
        b=MBGyohKpXzz1Zv8/pniNh1taimB/9cjUEkPsWLav8sW7dMhhRYENcqCwNJ1OwfEHu2
         h8xfAv78oANWhkuSQf5yrmclpLTbhhXhwkExqCNgcqcJvjmAiEnW7vEZPTBUmV4oRmCT
         zziRXZr9vB/lBRMzzAIHvWPP/wJhrS/QDeT9ZF0CKuRajEYQbM5IUh6MsWyhKacrElRb
         ePv6CtnyZcV5wIo/39JzY5/XED4x90W0JbACJDCb8f45fGBH8pxDPlktuSrwdsfZRK+0
         UCSuMMw/MwxaCC/BqdTd6uBfL9l7agzHONvPtvZILk3UeuroFVcQKL1Wvvy54drOXhX8
         0cZw==
X-Gm-Message-State: AOAM5305N2mDx0KMHu3JKLB27aeCXF78FzmvZEbHjYZJN2EjG4LrtjdY
        FqF2ouZruy5/lvekh7rC8O9bFQ==
X-Google-Smtp-Source: ABdhPJzjCDmQt9P4CxogmDXl928w7qwCotCgdGBtEFCkdgRJJIKy1eJ8gShCkAokup3eyOQIGUGh2Q==
X-Received: by 2002:a62:cd46:0:b029:2ea:299c:d7bd with SMTP id o67-20020a62cd460000b02902ea299cd7bdmr2800256pfg.72.1623327405258;
        Thu, 10 Jun 2021 05:16:45 -0700 (PDT)
Received: from localhost ([136.185.169.128])
        by smtp.gmail.com with ESMTPSA id v15sm2338610pfm.216.2021.06.10.05.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 05:16:44 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Jason Wang <jasowang@redhat.com>,
        stratos-dev@op-lists.linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>
Subject: [PATCH V3 3/3] MAINTAINERS: Add entry for Virtio-gpio
Date:   Thu, 10 Jun 2021 17:46:34 +0530
Message-Id: <7295705e27ad52c87d13d29031660a77372af7d4.1623326176.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1623326176.git.viresh.kumar@linaro.org>
References: <cover.1623326176.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds entry for Virtio-gpio in the MAINTAINERS file.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9450e052f1b1..c55f0f0dda10 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19059,6 +19059,13 @@ F:	Documentation/filesystems/virtiofs.rst
 F:	fs/fuse/virtio_fs.c
 F:	include/uapi/linux/virtio_fs.h
 
+VIRTIO GPIO DRIVER
+M:	Enrico Weigelt, metux IT consult <info@metux.net>
+M:	Viresh Kumar <vireshk@kernel.org>
+S:	Maintained
+F:	drivers/gpio/gpio-virtio.c
+F:	include/uapi/linux/virtio_gpio.h
+
 VIRTIO GPU DRIVER
 M:	David Airlie <airlied@linux.ie>
 M:	Gerd Hoffmann <kraxel@redhat.com>
-- 
2.31.1.272.g89b43f80a514

