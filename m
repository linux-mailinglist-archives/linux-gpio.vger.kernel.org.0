Return-Path: <linux-gpio+bounces-13829-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0799EF13F
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 17:36:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4F60189E148
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 16:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57F0241F2F;
	Thu, 12 Dec 2024 16:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="rOIteCG1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692B32358B1
	for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 16:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734020355; cv=none; b=oHffEsPXq/1WWZqRwRhPL9B4V4n65419z4F51/8sMEynjATt7bGjycG5rfE08pH6d+iKWvLF/x+FoH+fnXov3y4KCiPoq6lPy+hOIFQBpU955V3p+4kuLHGclqmiuChsiCQLRFW8wLp0l6sCfce2ON0wufQTaIdtXeb9ZZ/ZHg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734020355; c=relaxed/simple;
	bh=p0I2HVUBbWRZhBgsdTrryTL6GkY8GKKUGtVy3VSjrfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X+XXLvLSfPExc4lcAW0O81nTM3SWnhmZsjI74buegURe6BWSEPWnMabJYDnZn/w5MOwuzUpIjQl0lTV4odHjnIwGo94CLwdSFlltjA6gooxc5ixzkaemYkj1C3jpkpQx8CxpdHTNAT7YxA+2JclBRxKtJw8empC80GdL1zAuQaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=rOIteCG1; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385d7f19f20so400941f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 08:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734020351; x=1734625151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDsnxHgs8pPYbt5Sxgc7PD1JuNe9FEImA9X5O9hYyxM=;
        b=rOIteCG1k0+2j8jPBiVEFFnF4pxeeEmvolnkKm/pEuLT9RMYvdxPFqGQ4YMvTKRGKu
         YCdJh+Cq0r4PLkv4b1HJqI3fCg4pu0420Ws1tjXzFcAu2Y356hZZSzNdKa264WLK9LHb
         zvDt1FcpNAjnCfcdi//2tF30rOrweyp0qThW/WAPAFOUFYx+E14R1jvklK6TQN0xK9iN
         +Sf3mznxzwYA4UF2+wFN3+tPlFSz7G3sOKDfozcAJud2yArZLh2zdOBjnRTqAiK0uxSD
         5WjQAXAr/A3u6/OGD8EHaM1WYOQi5fU3GAAa6RArRWYNKeaUl2YgBu1N9OIAQ/Z7CUNw
         I/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734020351; x=1734625151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDsnxHgs8pPYbt5Sxgc7PD1JuNe9FEImA9X5O9hYyxM=;
        b=OcOwGqX3GYJJjAN7pUP5bIunnbFHM9qdQmbZsSOC46hwEbTY3z7J/Vtgd+VcULqAqA
         Vtke7nQ8BACPuWW3/83khLPrNO5SQ2aiAPNalcC/nIaHU8O8V8Q3zbO60YLggUHqqfAq
         SqcuiZMw/UXkY79cTyW4DV5mxXVoun20U116FkysRyc0DFSMbDOUkINXa39JImIothoP
         FmS1+9zZNN358RnL+LzetWoLa8vL3gHvxrTRf5Y5QjXBFKipPWBocLVboSLMTHWq9+de
         rHZlZL5cuUy+8b9wL1As2FD2CYxfDgIF2Wp5T3ESCtqTHVClyBxssMNUOd5tTdKd8ZMv
         +QoA==
X-Forwarded-Encrypted: i=1; AJvYcCXAZ/a7IAS4ETtxnBA66uUbh5JKz2G6toIr3gptO26RhxyK6RYGqzvsYUv6ScFIwRjk6pqompCsIjS2@vger.kernel.org
X-Gm-Message-State: AOJu0YyBb7alHNB9I2CVbcT1K51djnf4QPtbi/r5XrJoLy+UwPpCItHF
	Y6nvA/0C1D0dpnINTEn00+/HMuQ4PAQI52qSmclGJUoAX9vANjd80Ehuhv0hqa8=
X-Gm-Gg: ASbGncuTSlLqTKtXh3ZOBbzIpCTpo88QTKeNhYbup3K5Za90gAGJvYdO+Si8GxSBqWC
	dMZNkkq1rSz5qbmyXnJ5/JFPbN2QyKvvCkkcKbDH00oJ9gWclrOU7SRURSFhkIxoTajLsR2yR39
	fT6jzlLp/sT8tBVJ/sNH823I7m5eNFvcl5tT75rwtNEKMhUC5Fs8O9yqxxk3iP0VLUlCJVpz/YF
	JxI31ajqOXSUrNYjv89ug1ExnMzg76tekrZGhOKCppVDbyD
X-Google-Smtp-Source: AGHT+IHSgOEfwH+piApFqEC2IhYZWJ+1L5bPpX/eXc0mgxxp6hdmD6CIHtNXbZfUGagQsK5T5vfHeQ==
X-Received: by 2002:a05:6000:4026:b0:385:ef39:6cd5 with SMTP id ffacd0b85a97d-3864ce89425mr6133942f8f.1.1734020350544;
        Thu, 12 Dec 2024 08:19:10 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4361e322328sm44336105e9.0.2024.12.12.08.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:19:09 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 16:18:56 +0000
Subject: [PATCH v2 6/7] arm64: dts: broadcom: Correct hdmi device node
 names
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v2-6-35986e04d0f4@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The names of the hdmi0 and hdmi1 nodes had addresses that
didn't match the reg properties for the nodes.

Fixes: f66b382affd8 ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index bd78af0211b6..f42fad2d8b37 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -352,7 +352,7 @@ main_irq: interrupt-controller@7d508400 {
 			#interrupt-cells = <1>;
 		};
 
-		hdmi0: hdmi@7ef00700 {
+		hdmi0: hdmi@7c701400 {
 			compatible = "brcm,bcm2712-hdmi0";
 			reg = <0x7c701400 0x300>,
 			      <0x7c701000 0x200>,
@@ -381,7 +381,7 @@ hdmi0: hdmi@7ef00700 {
 			ddc = <&ddc0>;
 		};
 
-		hdmi1: hdmi@7ef05700 {
+		hdmi1: hdmi@7c706400 {
 			compatible = "brcm,bcm2712-hdmi1";
 			reg = <0x7c706400 0x300>,
 			      <0x7c706000 0x200>,

-- 
2.34.1


