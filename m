Return-Path: <linux-gpio+bounces-26901-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 23147BC39B1
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Oct 2025 09:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D55EB4F66ED
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Oct 2025 07:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBBA2FB0B5;
	Wed,  8 Oct 2025 07:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVC4787a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3C52F99BE
	for <linux-gpio@vger.kernel.org>; Wed,  8 Oct 2025 07:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908707; cv=none; b=T388olvdOXWfvo9ksZHDhCcUNWG0HPPcSO7bJ55loIxN4qCKjn/pz71iWvf3PAUw9w/mzulOJNm1Jbt+YSIerkbEO6sgWCKFRzZL6NZ1KCUzTlxlzNwzrHpvPVd4rybsh0KIBdRF3g27ZoeLLw/jpaoWzRTt1Ef7o7Rjamfw1XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908707; c=relaxed/simple;
	bh=RlVItK7iXy6OjCYCwpNfqBWyShuPqBGkj/6mzWc3l4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kzUMOIiqHD4Ihyau9UbAbE/AoX6MHGP1vAYNvctttccuUIAJwBS8ybtx0a67m1P6/YFKfBAlC794csRFMxbi0+D9S+6NGmcE4D6HJi0EZkeIXp/NcVA0aMXGqI4RTwvhbx/GjQ3NuBrtgCTfGl/qcwCuWCvZGy3ebmBIVJHvDxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVC4787a; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57ea78e0618so8108088e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Oct 2025 00:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908702; x=1760513502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSzLMseudyhbfpSsCkBHegf+R/CRf/bD8WfdY1dPA6A=;
        b=GVC4787assLcQv0OLg+sqbJEBf8DKeOv3V6TrUbeel4tUpU/X0HN+2Mwd30HDBM+FR
         T16gCBHX8qq/cHQdVwyYhS0HiAaa3rWljIvuVfxWNY1oqaPEommbhKi/WviTVPRuB3JQ
         zIKeHhw+qctXMU9bgsbTIKLzp1uXMce4C18KEaJ+K3cT4OJ+gaSbBYasyIEVu83BYGOH
         LtaF8JjozhK591d/FM0aJ6vYViSlB5kbaVtkyj/60Im4NsF6/Cg69urbDC3l6Cb6A9Sq
         sXSqh2ELo5UyvH6D9NE4QzizhxYRmTEUcxNCeLGIUPg6htGwWo1ekcQtLMnPJOdFZswl
         4uBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908702; x=1760513502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSzLMseudyhbfpSsCkBHegf+R/CRf/bD8WfdY1dPA6A=;
        b=i3VIrO7fIZi64jgLqB4xzRO9YNYmXv0fSS1d1FgYyxERctEWHSYnWPpS+dfOv6vXdG
         ZDFESZGIPK+uE7JmgNsFk+9bpmAAgfdUhA11BA1sucgFrDusZBLZiHuAmD9mnyB1L+Go
         x3vKuY8pZD/bkoAj9RdpxrDImChoCwGR0KHFET/XqWFW0ug5lZxxJNuYUUA4FQmH+G9i
         t7RhZlcm6N83YdGQ8j0/TmomWaCYY/O5TWRCdGLfN6ow351jFm6dSSWWColAGamfQ9vC
         eL0xx1V2SJ7+GzQ8a3pyjzdEaM3Lw9GkXRpO6fy5G/+IRCzdH/nSV+rmeymh3+jpq3/4
         z9Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVE5Z4MTVsUTlORh8HVIO8VmHlJ2vxbU+Pn4Y4BW2m8tUsicjD1MKLQ11qecib9q28Bf3pj/7HcBolL@vger.kernel.org
X-Gm-Message-State: AOJu0Yze9YpieD9U307EmUnAKXr23QlHLLsLyzi6AIb6jhsx1FfwGcip
	6EXJFy6nY+d7rJx5zjIyEFCtoTOh0fC7ZXlx7Q3O/7poM7gIVeHAWBvn
X-Gm-Gg: ASbGncvufU/JMdJDKlDf3oNCCNBY8CSCMLuV3ZThRpTK0s+ZNqsve8m7VD+yuqdWxh9
	iU07BO0dWomThM0e4WYbQ3DUNR43FWTVB0nngpoDx7EYQzq8+ZW3COAzsh4pofdiTcz3Zpvnyz1
	p2VNpIEK8wBTv6a0FcHVqXpI+mwnOp3yTL04Yo/MssjjgrYLXRW5l7QUhBmN4wQVa65lAt5Q+0J
	J6zYynYe9cSM5wTCAIqa7gnKwEu18TkdCtSykvFDTYYSGgp0ySUw2toPTAnjWFYCJWdDLwiPsZ4
	5bNkhABbfNn8a/pskyCD0VmNMNHnsXBqYnPdgb1dOZqdrjGD65OvGgGgDeWQLU8QQzjcywZsXY5
	+8u3FoyBUaHru+WEptEXd673ksHRIzkBdeDp1lg==
X-Google-Smtp-Source: AGHT+IHu39faT6wHaoomwvg/rNoHvXVgG6hJojMOqYHlHDrQmtuFa3r7nNlT7bUvnJ6opz9y3ixRBw==
X-Received: by 2002:a05:6512:1291:b0:57a:3d7e:7275 with SMTP id 2adb3069b0e04-5906dd53f68mr676945e87.36.1759908702179;
        Wed, 08 Oct 2025 00:31:42 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:41 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
Subject: [PATCH v4 17/24] staging: media: tegra-video: tegra20: adjust format align calculations
Date: Wed,  8 Oct 2025 10:30:39 +0300
Message-ID: <20251008073046.23231-18-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expand supported formats structure with data_type and bit_width fields
required for CSI support. Adjust tegra20_fmt_align by factoring out common
bytesperline and sizeimage calculation logic shared by supported planar
and non-planar formats and leaving planar-related correction under a
switch.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 39 ++++++++++-----------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7c3ff843235d..ffaaa2bb8269 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -280,18 +280,13 @@ static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned int bpp)
 	pix->width  = clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGRA20_MAX_WIDTH);
 	pix->height = clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGRA20_MAX_HEIGHT);
 
+	pix->bytesperline = roundup(pix->width, 8) * bpp;
+	pix->sizeimage = pix->bytesperline * pix->height;
+
 	switch (pix->pixelformat) {
-	case V4L2_PIX_FMT_UYVY:
-	case V4L2_PIX_FMT_VYUY:
-	case V4L2_PIX_FMT_YUYV:
-	case V4L2_PIX_FMT_YVYU:
-		pix->bytesperline = roundup(pix->width, 2) * 2;
-		pix->sizeimage = roundup(pix->width, 2) * 2 * pix->height;
-		break;
 	case V4L2_PIX_FMT_YUV420:
 	case V4L2_PIX_FMT_YVU420:
-		pix->bytesperline = roundup(pix->width, 8);
-		pix->sizeimage = roundup(pix->width, 8) * pix->height * 3 / 2;
+		pix->sizeimage = pix->sizeimage * 3 / 2;
 		break;
 	}
 }
@@ -576,20 +571,24 @@ static const struct tegra_vi_ops tegra20_vi_ops = {
 	.vi_stop_streaming = tegra20_vi_stop_streaming,
 };
 
-#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)	\
-{							\
-	.code    = MEDIA_BUS_FMT_##MBUS_CODE,		\
-	.bpp     = BPP,					\
-	.fourcc  = V4L2_PIX_FMT_##FOURCC,		\
+#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, FOURCC)	\
+{									\
+	.img_dt		= TEGRA_IMAGE_DT_##DATA_TYPE,			\
+	.bit_width	= BIT_WIDTH,					\
+	.code		= MEDIA_BUS_FMT_##MBUS_CODE,			\
+	.bpp		= BPP,						\
+	.fourcc		= V4L2_PIX_FMT_##FOURCC,			\
 }
 
 static const struct tegra_video_format tegra20_video_formats[] = {
-	TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
-	TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
-	TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
-	TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
-	TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
-	TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
+	/* YUV422 */
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 2, UYVY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 2, VYUY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 2, YUYV),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 2, YVYU),
+	/* YUV420P */
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 1, YUV420),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 1, YVU420),
 };
 
 const struct tegra_vi_soc tegra20_vi_soc = {
-- 
2.48.1


