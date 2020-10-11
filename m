Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8807328A511
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Oct 2020 04:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730555AbgJKCsy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Oct 2020 22:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730514AbgJKCsx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Oct 2020 22:48:53 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4FA9C0613D6
        for <linux-gpio@vger.kernel.org>; Sat, 10 Oct 2020 19:48:53 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 10so807942pfp.5
        for <linux-gpio@vger.kernel.org>; Sat, 10 Oct 2020 19:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rJcvc1wxEFUx12YJeTHq7xa7YNZGOLOFOQF9lnDCs7w=;
        b=h46K4WPXZDrLBc0f4uQ+mmjJZ5oLyMHWw2JKRUg1blaUfMCt9h0Ave03cC6+h8g6Gz
         ksLUj7M44W9vl7kjzWMNQu5fppSJ3lifKsjMxJ/HrzVail3GpsPc3N8Cj8J7Qbz7KJjK
         83bBV47Za8daVYIHiIM/0ilci+a+vfxylKyTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rJcvc1wxEFUx12YJeTHq7xa7YNZGOLOFOQF9lnDCs7w=;
        b=l0q33MwX3r13Yw9kE27fDe4tLtrgPNNxFbkpFjr+4F4uip7wH9Os4lYnBo4dhY2hOT
         twvpyD7WSrBIAhWb/UTVWfsX3DVQ4SKDQ07w2IXZNS/4xVUxEBi1c39zS4yQZ1u67Q46
         8DsRkSMZEM7UlTRUkWcD35F1dPp5FdB6fc748RicDj6cyYuiqQVXKPBC1MreXmDrAZ92
         OsLpVTJCbPOrEEjTgE6Hsrp5w/3G6MEXZp/NjH0OHzLFQ3ZmUr/lXzRJQ/A9jJGk/O9y
         CCu5fkdllgXbAdDhVXrS7PcLrNrXqP55Jf96g0bBgXHY7m7Ro8Y5W1rVZ9ONxsIc3nlk
         Zaww==
X-Gm-Message-State: AOAM530fKkxOXrsdoBlQi3qkUW9QL+s0zvwAj6cpuCXOaWVG5x8Dkv/m
        /7FgHmdAu5bxNOyVOIoZUrVq47ZDQrREpg==
X-Google-Smtp-Source: ABdhPJwDWT9JEZDIZCweBSo+VTNNMrsopDB+y+M16Z8HnKrFD5Ky8LVSnfapNR1HAdV96CQa2biVIg==
X-Received: by 2002:a17:90a:f0d7:: with SMTP id fa23mr12050837pjb.108.1602384532897;
        Sat, 10 Oct 2020 19:48:52 -0700 (PDT)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id z25sm14832836pgl.6.2020.10.10.19.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2020 19:48:52 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-gpio@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 4/5] ARM: mstar: Add gpio controller to MStar base dtsi
Date:   Sun, 11 Oct 2020 11:48:30 +0900
Message-Id: <20201011024831.3868571-5-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201011024831.3868571-1-daniel@0x0f.com>
References: <20201011024831.3868571-1-daniel@0x0f.com>
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
 arch/arm/boot/dts/mstar-v7.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index f07880561e11..669aada6f286 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -109,6 +109,13 @@ l3bridge: l3bridge@204400 {
 				reg = <0x204400 0x200>;
 			};
 
+			gpio: gpio@207800 {
+				#gpio-cells = <2>;
+				reg = <0x207800 0x200>;
+				gpio-controller;
+				status = "disabled";
+			};
+
 			pm_uart: uart@221000 {
 				compatible = "ns16550a";
 				reg = <0x221000 0x100>;
-- 
2.27.0

