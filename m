Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB5E3CC13D
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jul 2021 06:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231555AbhGQFAI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Jul 2021 01:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231488AbhGQE76 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Jul 2021 00:59:58 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786D5C06175F
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 21:57:01 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id a6so4734823pgw.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 21:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ui/R1U5l18hTCdlid6Ebs6NC2kv3Eus6s2OeRFbkggQ=;
        b=M3Job59J4FMxogVCzqxuA9l7bcCRG88yvg7g84YKnqUdBepNOkTn4a6BBNd3iE6gPl
         AIYATL5ep6ERsyMTBwQ+8/MiSv1qlwDl+XgnifDeB4XweAIosjb3Njc1IgMhTuLwTaX2
         DjWwNH8X75Aai0HBj8L4iIW+czdj/qDipUaHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ui/R1U5l18hTCdlid6Ebs6NC2kv3Eus6s2OeRFbkggQ=;
        b=LKAZC28WD8DT7TycrLvfWOto1tDxpcz2XzznHg2Ej3Zw8Fu7SizSCYJACHYth+vcXW
         To5CIao4Jssblpjk2USTi5o7Vd7LGACiE0KJ1MIHGZ0uKLQXgpOMPyuDiQlsNxalw+Ym
         O7YlSCASm/86zbVM1tw98nvOIXppuzVCsL+3Uz/dsatjfWYzwv8i2RP3VezwZRRWdx0Z
         +nwwBmHJ9sVUCmvtL0ghMnqZ7yWdFbtbXT2qQZE9nzkNlCx8ve3j4D4L+jnq5M915Qnv
         VdPxZiPsifXWLpq+uZpJsRL7yk7D11rKG5vLoJWiYbDCElDFvAvXVCcW8c25CYYusMYu
         7KuQ==
X-Gm-Message-State: AOAM530BMWv4v0m+92ckGyqc+3h+Ch0ibs2gfNdymaot/1Ff3RT5v7UC
        8zAKgrwwAMDLTDw5zkbEbiB9vA==
X-Google-Smtp-Source: ABdhPJygKPBQmyujuMeB5sbOzlu/tuUJQXYPb+lFjw7HhEPaF8ZO+94Mqw/NeeciMC9BVKaKsC6HUQ==
X-Received: by 2002:a65:6243:: with SMTP id q3mr13446911pgv.297.1626497821027;
        Fri, 16 Jul 2021 21:57:01 -0700 (PDT)
Received: from shiro.work (p866038-ipngn200510sizuokaden.shizuoka.ocn.ne.jp. [180.9.60.38])
        by smtp.googlemail.com with ESMTPSA id w2sm12522885pjf.2.2021.07.16.21.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 21:57:00 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, romain.perier@gmail.com,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 08/10] ARM: dts: mstar: unitv2: Add io regulator
Date:   Sat, 17 Jul 2021 13:56:25 +0900
Message-Id: <20210717045627.1739959-9-daniel@0x0f.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717045627.1739959-1-daniel@0x0f.com>
References: <20210717045627.1739959-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a fixed regulator for the io voltage.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
index 4a22b82afbfd..314eb37d3be4 100644
--- a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
+++ b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
@@ -40,6 +40,14 @@ vcc_core: regulator@0 {
 		regulator-max-microvolt = <900000>;
 		regulator-boot-on;
 	};
+
+	vcc_io: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_io";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+	};
 };
 
 &pm_uart {
-- 
2.32.0

