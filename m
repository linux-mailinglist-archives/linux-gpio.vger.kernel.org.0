Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB6D7395AF7
	for <lists+linux-gpio@lfdr.de>; Mon, 31 May 2021 14:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231702AbhEaMxw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 May 2021 08:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231643AbhEaMxn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 May 2021 08:53:43 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE6C8C061347
        for <linux-gpio@vger.kernel.org>; Mon, 31 May 2021 05:52:00 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id o5so13388105edc.5
        for <linux-gpio@vger.kernel.org>; Mon, 31 May 2021 05:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2sxZS5d7SMu8h/AVche677EJ2555TBGtTybq4ZE4rok=;
        b=Ji/nNhgNssD0bZQ9g/okKZ/qGZV7tas4BjvB9+CoCxB7C4x/0YJxW4U6lpX0qh+6ua
         UzSPO0z34SqYbT6IbRTQ0YI/SN75s/wznwX8Hg9ZDtGxsR1lO4xMqS8KmeALHuHac8/w
         PVbcg19Z9GAj7tyQqOutWth+U/kU8EFmBmLI4PAZwHbE9aIWsg0zSQ6+Fg9ySOimTmry
         cdegvdx/IbmBNBjlAByDpSvc2JGbD7kYdisK0Ob5Mm0lUf1xV54OEL0s0cv5G1QJkk2e
         OKgV2V9peVdWghRMk3P3U+BhJWDsq6oarSmIM1X6SBRsPsh5WhYansT4KwQf84oxysSh
         XyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2sxZS5d7SMu8h/AVche677EJ2555TBGtTybq4ZE4rok=;
        b=g0cz4037906fZTNHyUFecN/aj62D3IiYD5NTB6apKV+J9tvfl2UD+Mb1mZkHRnq610
         DYCPhIDyjEPGJbrUBJOCP5TNtukZ4zeRTTPPJSLxuGfD6Xpw2fXZipbjb4QeEPdVnnNt
         7XA+Rn9PCaTtME3uHj1yHJ/KD9LZj68DR14OoxNW998HNMXpv9oi/DYR6U8XPY4QT0D+
         WrqcwTn1pAKk2tBNEE3kdJvprK0auvgmcNavCCh0E9vFiKWRy+WsPh5kkaJq4GIe/DeS
         YCBf6RgwOB2rOf4siCpEaxX6lY5KIWD2Nq7+eCXIWgs4zNMnOWrWS2A/sTH3I4rO0t+Z
         TYqQ==
X-Gm-Message-State: AOAM532jZ25ejhqXn45zRWYRvQgOAz1jT5JpJjYilSfCGFSC0finZANx
        3ifNHjEOUZhDo0itQ1bWjhiD6w==
X-Google-Smtp-Source: ABdhPJyNnKYTDzVvTthxcEnd0BFjQ679CQBN3Rsxq23lajz2rLfyvjfbmgB+v3NkDBxzurfmGU2SrA==
X-Received: by 2002:a05:6402:4394:: with SMTP id o20mr25829443edc.357.1622465518965;
        Mon, 31 May 2021 05:51:58 -0700 (PDT)
Received: from localhost.localdomain ([188.252.220.231])
        by smtp.googlemail.com with ESMTPSA id zb2sm5886898ejb.52.2021.05.31.05.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 05:51:58 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     lee.jones@linaro.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, p.zabel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 6/6] MAINTAINERS: Add Delta Networks TN48M CPLD drivers
Date:   Mon, 31 May 2021 14:51:43 +0200
Message-Id: <20210531125143.257622-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531125143.257622-1-robert.marko@sartura.hr>
References: <20210531125143.257622-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add maintainers entry for the Delta Networks TN48M
CPLD MFD drivers.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
* Add reset driver documentation

Changes in v2:
* Drop no more existing files

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9450e052f1b1..ea9e82103862 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5096,6 +5096,15 @@ W:	https://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/platform/sti/delta
 
+DELTA NETWORKS TN48M CPLD DRIVERS
+M:	Robert Marko <robert.marko@sartura.hr>
+S:	Maintained
+F:	Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
+F:	Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
+F:	Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml
+F:	include/dt-bindings/reset/delta,tn48m-reset.h
+F:	drivers/gpio/gpio-tn48m.c
+
 DENALI NAND DRIVER
 L:	linux-mtd@lists.infradead.org
 S:	Orphan
-- 
2.31.1

