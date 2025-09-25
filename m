Return-Path: <linux-gpio+bounces-26589-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B8DBA042D
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 17:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B804918964F4
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 15:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A037307AF4;
	Thu, 25 Sep 2025 15:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ee1+Pmd5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC18302CC0
	for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 15:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813450; cv=none; b=Gn+xjGx64Dc4c2N0MKgwFltQ3vHnRX0o6viwWxNCTeir2qwaEqi2sFWvcyXg9J1PoEY6FPdgiWe8GLTwPi38Wab06Db+abO/WAcj0+TgP4KB9AuIF1+mob8d8My6+Id0NJHgmxxaTWvtDddG6d44XL843G58nG8f8BSUHbThwK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813450; c=relaxed/simple;
	bh=EkGBXhItwLWxgQ/aIBX1I+SuRG7//x8trI9XTwjIFpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oxm9ZbRAXeygMjBuk+YChzk3c0tIw8xtBkoqdwM4QTh9Z5l6e7luzcquWkQpOyOxe817xNawKxA3Q1E74+5JkqazPBLrX7Lpy7nMak6NvrSU2OPXOof5eEYgPFnOR17BOm2KzEbdNn18r0ic0Go6SAsMo6teO6htLj65roiSpCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ee1+Pmd5; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57bd04f2e84so1083659e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 08:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813446; x=1759418246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=Ee1+Pmd5vceJDQtXZ7rwfNWCU7h6i302CDtsRcFCxjbwrVE/eHzdV/Ex0qlmKZUHpd
         r89HPbSiuXkj/o0JJvrjUD1fRpFbX8/+Y7+hbcXEUtI20cYvp8WXGhKRdsCmg4/t/bvw
         rXtG+t8hDb4ZKIJnWM1bvf1ug7Bk9TTA2ZCAYrjO6oj2DR5JV5dsriSHVPPzWCrWmuqO
         yKZCTJRbZR13tKLtYj+fgsJ5wbUUaTPHthsIVaqX4Agbc9R5FNx3oIIJ+mzqz7Qkgeix
         llGT42EuzeioYw7dJbwDF/eNbenlZZc5eJS4aS2wyWIcrmtjAhqmmOkFR38ryJ/Xqvlh
         YwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813446; x=1759418246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=oNpySBB8+QFJryEUOTRj2dofHhAhjRRQfbW3x0Sjafra/S40aiwTVXXehNS524evSF
         R01DNSCezDa6zZNibCmamqBZoR4gQyI1DAE3LaepOFE50vihNr5VIpzU3WOz0Hg8Qbjw
         eowfKRiQCIs5hwagmbnJqTMJeMaquiRA0PJG2Ye7aoLsaPdx//e8v+NNoet10ai0Vvfw
         WvbzwXzSNQwwghCTrl1OwHuNBKJeeGubiDru8IJtYzH0/O3FZjaCcmcjq0K2HUBw2SNq
         ZrErfECDxHZ4P0ZkH5u/oxrK/ah5Yku9k9Xekp0Bp29YGntt1Zy83vT53x6aLpRN3dUh
         Zx1g==
X-Forwarded-Encrypted: i=1; AJvYcCUosBQJQTDMyM9JPhxC705AaEXAySov02juVbAOEQMz6kiszwqBCjtx+EmOme6iM3fwPIb2/gdCErBG@vger.kernel.org
X-Gm-Message-State: AOJu0YztgB+U/SVT8UgU2xHfDh6p2a3U/G616IqNYB3WcM0RBSV/iC9l
	uQ1VM2X/iCuW9V4nYLO468T+dmnVFE4cbkBMHDGx5KVAHEjp096eQokJ
X-Gm-Gg: ASbGncvN9maqKr9TOUi3jE+lTWroXYNfJK5ixm0oFxDpk5+3KLAfw0rhPYHyYEZU8zE
	QT1mhq0VD+x17fuWjoFQIQWree7gmUyyAS90f1X97l/bkd5hHAkUPZiUsZuLyhTy9ykDbfh/F1Y
	PmDqtDBSZos2BpEA2DdKmm6q5siXGwLdfk0X3GbQWobQQLw07Ii4M9QQqVvYrFQGDI22wglNSq6
	oM1wc9+laXxI+eZkSelUkfLC2JCGSZrVnzr3+AFUHE7mmYs1hKxdszBH7wX5OknLDyazgc3kYCd
	7As/a/PQUubvLco7G0+e8YJVPe9DX9QTpSFctyDqxL+I6hEfB08hoF775h2budjMXQMI328aHg6
	Wu1pOJZp/olbBjA==
X-Google-Smtp-Source: AGHT+IE9s8LEs7isC/WkOOjmZSczeI87yN4+QY99sZheQ8v0ntKzIh9SCdVR9v8GQcLfMhBuoMmtIg==
X-Received: by 2002:a05:6512:39d1:b0:55b:842d:5828 with SMTP id 2adb3069b0e04-582d2f2796emr1520385e87.36.1758813445428;
        Thu, 25 Sep 2025 08:17:25 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:25 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 08/22] staging: media: tegra-video: csi: move CSI helpers to header
Date: Thu, 25 Sep 2025 18:16:34 +0300
Message-ID: <20250925151648.79510-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move CSI helpers into the header for easier access from SoC-specific video
driver parts.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 11 -----------
 drivers/staging/media/tegra-video/csi.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 604185c00a1a..74c92db1032f 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -20,17 +20,6 @@
 
 #define MHZ			1000000
 
-static inline struct tegra_csi *
-host1x_client_to_csi(struct host1x_client *client)
-{
-	return container_of(client, struct tegra_csi, client);
-}
-
-static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
-{
-	return container_of(subdev, struct tegra_csi_channel, subdev);
-}
-
 /*
  * CSI is a separate subdevice which has 6 source pads to generate
  * test pattern. CSI subdevice pad ops are used only for TPG and
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 3e6e5ee1bb1e..3ed2dbc73ce9 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -151,6 +151,16 @@ struct tegra_csi {
 	struct list_head csi_chans;
 };
 
+static inline struct tegra_csi *host1x_client_to_csi(struct host1x_client *client)
+{
+	return container_of(client, struct tegra_csi, client);
+}
+
+static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct tegra_csi_channel, subdev);
+}
+
 void tegra_csi_error_recover(struct v4l2_subdev *subdev);
 void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
 				u8 csi_port_num,
-- 
2.48.1


