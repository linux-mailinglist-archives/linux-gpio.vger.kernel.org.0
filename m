Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96CF7438D35
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 03:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbhJYByp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 21:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232251AbhJYByk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 21:54:40 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB36C06122A
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 18:52:18 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id nn3-20020a17090b38c300b001a03bb6c4ebso7199427pjb.1
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 18:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=a/bKW8724bofyH45UpBffAFsq0SnSA7YXQrZaejTe+M=;
        b=Ejy6SHcJt2kaxheA/ZQPb1mVzttOuKGW3+jQxI548TaD+OSC12SPFQ5JFEQy0H48K/
         b7pUESLs+YmBJdGs79ZttyMOE82yynS3n6YY2rH4bsgLINdd9U1ZisWi/W/LPtGbQjeQ
         eyq5Ex0SAtRikXZrZxKuzV3Fxx3fdpJP72sPAKad3kS6o9OV2KhGQcBwd0Oztq0KcBvp
         tYs/Pm+03+RzNHHO9PAlxnhPJEcY6btcFPJjXKSYv4avzo3ftEXm4ZVSRLjXY5hTTwyo
         tHFXIhy/erFkytrMhd2mfjNa8NTQdFyAKIgbfiDw52nox+h5nWcVy7DmAOpx+222V5WQ
         Pd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=a/bKW8724bofyH45UpBffAFsq0SnSA7YXQrZaejTe+M=;
        b=EJTF0VkWchRPLi87uxwUgmf1QVAXJ26BcqsmD59vlS0Vvd5t0RA4spGOmQiM1ZcCld
         mOc9WdxjOWIWX2nry3RRvBqf1mfo+TtwIqN3dfEjoSfagsvkLFi2fGYP2SgdrGEFpwuU
         FgNwNagSp/7uI5YU4mCGwCgN/N94/d0JxHjwqlZjaiynPBejQHO/tt946cdsOWWpmTfX
         DclZBT9WH8/kmH1pgBhOslcM5JeJr/Lt8DOafSNuG5f9Q0XHCWW4k9g3TTMoBAB4yWeF
         RtBmAR1M6YlieBk9srcuNDVMBm+FHkZQwfFHQAqNt7g6Jz4bATQCfZgcX97qtnGPE03m
         FhIw==
X-Gm-Message-State: AOAM531nWXQqMZGRo52qfHws7cf2cJlZ771idLMOfdmtSG0DCZs8euiN
        3k++Be++6Fohdkt0QJAYkuDAgDhgVHTlN80V
X-Google-Smtp-Source: ABdhPJzvIEhz8fkC23WGXbNpQ0aq51Pl8xkXYROnsEN57uY+bFLunQTkyfryRsKLI1G06vs+HcCcTQ==
X-Received: by 2002:a17:90b:1d92:: with SMTP id pf18mr31967519pjb.38.1635126738493;
        Sun, 24 Oct 2021 18:52:18 -0700 (PDT)
Received: from platform-dev1.pensando.io ([12.226.153.42])
        by smtp.gmail.com with ESMTPSA id q10sm14855225pgn.31.2021.10.24.18.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 18:52:18 -0700 (PDT)
From:   Brad Larson <brad@pensando.io>
To:     linux-arm-kernel@lists.infradead.org
Cc:     arnd@arndb.de, linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        broonie@kernel.org, fancer.lancer@gmail.com,
        adrian.hunter@intel.com, ulf.hansson@linaro.org, olof@lixom.net,
        brad@pensando.io, linux-gpio@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/11] MAINTAINERS: Add entry for PENSANDO
Date:   Sun, 24 Oct 2021 18:51:51 -0700
Message-Id: <20211025015156.33133-7-brad@pensando.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211025015156.33133-1-brad@pensando.io>
References: <20211025015156.33133-1-brad@pensando.io>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add entry for PENSANDO maintainer and files

Signed-off-by: Brad Larson <brad@pensando.io>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d118d7957d2..465771d697b1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2364,6 +2364,13 @@ S:	Maintained
 W:	http://hackndev.com
 F:	arch/arm/mach-pxa/palmz72.*
 
+ARM/PENSANDO ARM64 ARCHITECTURE
+M:	Brad Larson <brad@pensando.io>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/*/pensando*
+F:	arch/arm64/boot/dts/pensando/
+
 ARM/PLEB SUPPORT
 M:	Peter Chubb <pleb@gelato.unsw.edu.au>
 S:	Maintained
-- 
2.17.1

