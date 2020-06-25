Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A57E20A68A
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2020 22:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406983AbgFYUQd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jun 2020 16:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391042AbgFYUQ1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jun 2020 16:16:27 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C8EC08C5C1;
        Thu, 25 Jun 2020 13:16:27 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id z17so5222370edr.9;
        Thu, 25 Jun 2020 13:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=glEkckh6FeGiN0rN4nPyP/7eW41/jMQ7STkIdkjww1g=;
        b=T4oXbzaUs3utc/1USosic2E/CE+cwRWol8hQgdnjXd6onubJPa0prUcWa5z+DYKaQg
         fMKM6HQ49Z8WpYZJyTIPHAkgB6k0hwu8WIoifQLF8Fa+EJ1JqUSm2n/SrfRCzXz/o/Ct
         eT4KruOv6JlBqwaEOdnhUuOz9QObqXLOCeHXYlxrcAYWdJSvLu+Wtx4HQGmP7p8sHLVN
         MxaYxhLvIHwKKgBV2ed3oZe7RGbuI2gX1iakoW44IqmjQiHSJWwpIrVpacjSxMnY4WJf
         oms2nJkgyILmMkxcka8UPnbbn+j+psqg5wKoasz0oYJm/x+GndgLioBpj6IJ/DMIh7vN
         pJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=glEkckh6FeGiN0rN4nPyP/7eW41/jMQ7STkIdkjww1g=;
        b=AgTqMea0p1Ag+HHYwQEbERa5I6e/C4XbiFV0/TtVklx4CwF1+gN50e5g0VuglAVDYN
         hfLBvCACv4osVdldsHpQJhD9rlEWQx07+7JBEnFOrqOPsQLoffYmjpkzmzdkJsckHoVJ
         HAyrNeMdJ7ccIgT3okM8WGfkyaOdcSWXxoFwFq1nY/8roy5RSWGHy9p/B9aNkejchbbF
         6VYYsZPz11qbPSfpXZfsNUNzVo1juYcGkvuGe3DDMD3ePCFEAFRq4psS+IkBU8JyGdi4
         4PItIrt60fpo98rk4NMBMeGCulVSaXXCu04T6zEbzuEy4XM+svPw2w4uJTdv2OWzRmlk
         y5lw==
X-Gm-Message-State: AOAM531kffXxj8b4U2rAVQcuFUb8jB6ARZMtuafmzl+/SKRpOxbxkMcw
        VRaE8ltJgivICzj1E4AQdDo=
X-Google-Smtp-Source: ABdhPJzTDOF4S5cWhSuKQbbx6YkY/DlDAZAEcRIlORke06qBEbd1xMdkBxuLYiyWOrK2P4wMNKAxWg==
X-Received: by 2002:a05:6402:1c0b:: with SMTP id ck11mr4111531edb.32.1593116186183;
        Thu, 25 Jun 2020 13:16:26 -0700 (PDT)
Received: from localhost.localdomain ([188.24.137.55])
        by smtp.gmail.com with ESMTPSA id ce15sm3495265ejc.86.2020.06.25.13.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 13:16:25 -0700 (PDT)
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-actions@lists.infradead.org
Subject: [PATCH 3/3] MAINTAINERS: Add pinctrl binding entry for Actions Semi S500
Date:   Thu, 25 Jun 2020 23:16:20 +0300
Message-Id: <d54d1fe9d8378e7c44d19e7b366b909bf5dbb7dc.1593112402.git.cristian.ciocaltea@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1593112402.git.cristian.ciocaltea@gmail.com>
References: <cover.1593112402.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a pinctrl binding entry for Actions Semi S500.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e6285c13bab0..4b9eec04c937 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1519,6 +1519,7 @@ F:	Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
 F:	Documentation/devicetree/bindings/dma/owl-dma.txt
 F:	Documentation/devicetree/bindings/i2c/i2c-owl.txt
 F:	Documentation/devicetree/bindings/mmc/owl-mmc.yaml
+F:	Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
 F:	Documentation/devicetree/bindings/pinctrl/actions,s900-pinctrl.txt
 F:	Documentation/devicetree/bindings/power/actions,owl-sps.txt
 F:	Documentation/devicetree/bindings/timer/actions,owl-timer.txt
-- 
2.27.0

