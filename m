Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8494292902
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 16:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729329AbgJSOK1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 10:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729296AbgJSOK0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Oct 2020 10:10:26 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D42D7C0613D3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 07:10:26 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id gv6so5788791pjb.4
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 07:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RHyYXiO83Q4FCDuGfX/cpic280vZhbkkvEAhDolqn+s=;
        b=mkJM/n6EXDlZYwVEnawgoIFm6dqCY6R9NjJbR89/bcVmSvdpzN1AHqc2/u0BxwwU/S
         NYlMkoXzPxqjuS4TK4oNIoN5V2y1vTDaWET6wya+UVtfr1AAMJujv7BkbXJ5tGVuSTkn
         TBK27YOkqogUQ4Rs0Ny5gt7iPQF/VJfZ2Rwbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RHyYXiO83Q4FCDuGfX/cpic280vZhbkkvEAhDolqn+s=;
        b=Uc6aFDXQNdPVGerIUxTPKSkTcgwXx8/LSkhZ2Ci1VNbpCCF7ZxpepoRy1JI+QYe2lA
         gPftZQN8bZp12hAcQ2thyWsQB/wR20IqguIIPPPJXbbOSm31b2+0d7xzKQypUW9AFP4P
         +QVEwyhb/7PlyUyHkX4cl+Vio8zh8BZHrt3QY2NLD6Gq9GlJnmYbQw4E787GJmDBlrsb
         +lY/ttUymGjdzjclErz0cscwUDYJpC4w7vE5ROR2J+2BQG/I6Ug7j9ehDbWxeOU/ayyq
         5YjTVspmiKIaYbx2Fk2uTZEwkdpRoyyyj1Ap6HuAliwwNDaOfqpO4BJwgmY9+SM16/ZP
         a1lg==
X-Gm-Message-State: AOAM530JGmtNnlr4xYK7o+ovaHYRvkrn9azGHeo2XuaZgXBNxNXQ5/Ki
        JfFyME4QPFuZgGGkUf7k5REmU8TS1gv1lA==
X-Google-Smtp-Source: ABdhPJzzR/OkKdoNnwbobkh1vDYbyHxPt5SYohAM2bfMZJBFeI8RqaHLIN60/Ddf/1iP7g+VcoGwLA==
X-Received: by 2002:a17:90a:3fcd:: with SMTP id u13mr17879285pjm.85.1603116626067;
        Mon, 19 Oct 2020 07:10:26 -0700 (PDT)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id 131sm78999pfy.5.2020.10.19.07.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 07:10:25 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-gpio@vger.kernel.org
Cc:     devicetree@vger.kernel.org, arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 4/5] ARM: mstar: Add gpio controller to MStar base dtsi
Date:   Mon, 19 Oct 2020 23:10:07 +0900
Message-Id: <20201019141008.871177-5-daniel@0x0f.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201019141008.871177-1-daniel@0x0f.com>
References: <20201019141008.871177-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The GPIO controller is at the same address in all of the
currently known chips so create a node for it in the base
dtsi.

Some extra properties are needed to actually use it so
disable it by default.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-v7.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index f07880561e11..81369bc07f78 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -109,6 +109,16 @@ l3bridge: l3bridge@204400 {
 				reg = <0x204400 0x200>;
 			};
 
+			gpio: gpio@207800 {
+				#gpio-cells = <2>;
+				reg = <0x207800 0x200>;
+				gpio-controller;
+				#interrupt-cells = <2>;
+				interrupt-controller;
+				interrupt-parent = <&intc_fiq>;
+				status = "disabled";
+			};
+
 			pm_uart: uart@221000 {
 				compatible = "ns16550a";
 				reg = <0x221000 0x100>;
-- 
2.28.0

