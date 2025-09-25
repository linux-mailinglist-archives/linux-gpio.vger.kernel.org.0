Return-Path: <linux-gpio+bounces-26586-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFCBBA0430
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 17:23:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B2B32A39DF
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 15:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDCA0303A3C;
	Thu, 25 Sep 2025 15:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeOsWAPr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB962FB974
	for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 15:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813445; cv=none; b=nhJs7Z+iWrHV6SAIOj5LSpsARGLZkWS0YF8v1hWwY3Kclkjlm/G1sp2O3W25qDfhbf3zH1uEG4o6wFsKY0qoLaFhGVrDrBFJXkzxb3cU2rzokkZUNKCS3z+kBM8eYIw7GRGvcUkEU/oMOTlVGJsu32OuCLPJ6rVUQ5EA9CpCsy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813445; c=relaxed/simple;
	bh=sgN5V56YM4qhVdHy0m6Dz/yGVt5884z/MxNndOF+8Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vt9a8SurEOiB7CLOJbjygp5HK0lRcIn0pI8VSFBd+BzAZ/DI1tNli1+6aIhRJqtDNqxi4YfB8RMNjSlXghGDBY2T3OlBu35qN08mWh5qqEeCjM3LUUvHWRzr+GmuOd7m+LVYETYBHuekkrUvqujT4e1YP4CeUyZfWbRz1Iygdcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IeOsWAPr; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57ea78e0618so1029784e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 08:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813440; x=1759418240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDpFX1J+/TUvWrJNHxxt+1RfUZNV6gVxsd2JBSzQm/w=;
        b=IeOsWAPr8SMfIMaqxq4PqiC+FaNO1jATMYo0rE+eRBfB8F3/sIlD7yZlu7IEBijI88
         veXtgLh6HJR1pONPT8MmOXiTon1+Y6SjB+99LxyNVVKpSzxal+/+0MdlQu2b696b29oW
         btuMPhaRTDvln9ujHcdGGh0hEYbt1Qb41raKX/2G24oguXqYaDQ8oKg08exCZXCjhgzp
         pqQW3GYB+7T2Ct2xf8CcWGIH+9kv3nPHVolEj7UmIPR6v8na9wcGuemAXjh3sZAn2RkV
         wWg7Z7eDli4W4095wJtpRePl47JMnAXdfGcXhP2vUicUBMaIUetG77OLzImfy3y7YKaZ
         gvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813440; x=1759418240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDpFX1J+/TUvWrJNHxxt+1RfUZNV6gVxsd2JBSzQm/w=;
        b=bmTdlLBL7yTDfim0hiNlhCh+DweUwefqfHhj3AWFeRwKqdL76BnNJDxNj7nu1EipcH
         kpb6JW+FZVV7gRAY16ffQ6zDmI8Il77nkUirrI5GdimWzFCSEG0lr2htg51LrtlDYU9K
         3feIXxUwHay370ZxPRIR0fhE4/DYLSaH1E3/HzLD9JdDTsTYjM0aEfwdsym/61PgUMc5
         oobTaU0ayxbfCWiyEfiZL4gabwlyPbyb1choTNUOc4c0NWdxsOvt8WNaGM8XfIsP6xph
         G/tRLo0C1wr0Fs40USGPSlD9jak8Z/N98w16kjSVlbW64r5qieycpMGMp05YiYhWgnxf
         g9iA==
X-Forwarded-Encrypted: i=1; AJvYcCWf1z56c0vjOC//WyN3Q6qo/rm/MsE6060iv0vJ09FXp0ap+L0MMdEKhcLQ5rb0N5k/Klg8l+9uqaC3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw78DsFlgNhoj+aZXbq1gfeoTNSO8JmcQt1KTTa6QVafhuncNJ8
	v4LXM64qG0JoZgUO40lC5VAY/PiOtVKNbBlG8UOgtYdnx+mQEeEHBoAU
X-Gm-Gg: ASbGncvdIX0zLw/dek8MGwTA4XwWJHcXXOJgNSBcsjrmYrlMwo/3AV1gDwHhiisklpV
	nusc23Nte32QdBlSiPW2hqY8NhWTS/oybAIfL6H9BeS1ip1ywNvowVhyPeddfdjB5sQWcs1IVW6
	DC7jbgJLRifUzwMtGPvehxPkJh6P+3Sm9Xl23W0v301KmVkcLCdZKPkEqNiiH24eigQRSVLkE8N
	+rLNYhJZf5imt540zN+rjQU6C1TvsH7tlSfQ5a1aNtV2ccoYzMRJLMhhAG0R/3XTZLUnVV8dpdu
	l/8YxlnURSeqRKpbWoz7vv+PW5TFyh8XdanUY8kPffvR8bQGe26Yig2m5DLTw+qBoEBTlq80Jpx
	ySvP+DEFL4ZUaXV2/6jlydQX1
X-Google-Smtp-Source: AGHT+IF5ZI2beyyzEW/PAtDOxp+J3O6NLq/9OKReZs2Hy68TyNyWNxXVchzXa+SA2R9q+HUVhQzW8g==
X-Received: by 2002:a05:6512:10c9:b0:55f:6f5b:8e65 with SMTP id 2adb3069b0e04-582d25839efmr1072613e87.30.1758813440236;
        Thu, 25 Sep 2025 08:17:20 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:19 -0700 (PDT)
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
Subject: [PATCH v3 05/22] staging: media: tegra-video: expand VI and VIP support to Tegra30
Date: Thu, 25 Sep 2025 18:16:31 +0300
Message-ID: <20250925151648.79510-6-clamor95@gmail.com>
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

Existing VI and VIP implementation for Tegra20 is fully compatible with
Tegra30.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # Tegra20 VIP
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/staging/media/tegra-video/Makefile | 1 +
 drivers/staging/media/tegra-video/vi.c     | 2 +-
 drivers/staging/media/tegra-video/vi.h     | 2 +-
 drivers/staging/media/tegra-video/video.c  | 2 +-
 drivers/staging/media/tegra-video/vip.c    | 4 ++--
 5 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/tegra-video/Makefile b/drivers/staging/media/tegra-video/Makefile
index 6c7552e05109..96380b5dbd8b 100644
--- a/drivers/staging/media/tegra-video/Makefile
+++ b/drivers/staging/media/tegra-video/Makefile
@@ -6,5 +6,6 @@ tegra-video-objs := \
 		csi.o
 
 tegra-video-$(CONFIG_ARCH_TEGRA_2x_SOC)  += tegra20.o
+tegra-video-$(CONFIG_ARCH_TEGRA_3x_SOC)  += tegra20.o
 tegra-video-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
 obj-$(CONFIG_VIDEO_TEGRA) += tegra-video.o
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index c9276ff76157..7c44a3448588 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1956,7 +1956,7 @@ static void tegra_vi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra_vi_of_id_table[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vi",  .data = &tegra20_vi_soc },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index 1e6a5caa7082..cac0c0d0e225 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -296,7 +296,7 @@ struct tegra_video_format {
 	u32 fourcc;
 };
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 extern const struct tegra_vi_soc tegra20_vi_soc;
 #endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/media/tegra-video/video.c
index 074ad0dc56ca..6fe8d5301b9c 100644
--- a/drivers/staging/media/tegra-video/video.c
+++ b/drivers/staging/media/tegra-video/video.c
@@ -123,7 +123,7 @@ static int host1x_video_remove(struct host1x_device *dev)
 }
 
 static const struct of_device_id host1x_video_subdevs[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", },
 	{ .compatible = "nvidia,tegra20-vi", },
 #endif
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 5ec717f3afd5..34397b73bb61 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -263,12 +263,12 @@ static void tegra_vip_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 extern const struct tegra_vip_soc tegra20_vip_soc;
 #endif
 
 static const struct of_device_id tegra_vip_of_id_table[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", .data = &tegra20_vip_soc },
 #endif
 	{ }
-- 
2.48.1


