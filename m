Return-Path: <linux-gpio+bounces-26599-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4316EBA04B5
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 17:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97AC71896F6E
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 15:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E98313E03;
	Thu, 25 Sep 2025 15:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKEZewoi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9988A2E5407
	for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 15:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813469; cv=none; b=dqR7bXpaZVH40QkJC/lKS4P4B5voc6IzMbR58J3wu0sykWGNfi062fNuMBYb3XwvT+o2UgVk1yighK1TEOZcFmKwokz3KD92S6hyIBjO8aPaE7GeAE03yaTaT+LvZoCzX08wPgKuA2jWF49jraDYYC3Ui2ce4lPUoOdp7Ay5oKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813469; c=relaxed/simple;
	bh=x9SGHrIWVcWQ45a/m7JkwRbIEzSIKuwPZRNvABVgS9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bEx+UO/TeDKo69ystQGRmPcmfyazW7g2L8H9jeiTrdv0MaJC6igX8vZtf4QnAOXY5HJynbXwrrd/seVVwJRc+WJ4jhs4w5yDTkhJDjPRkqDv0a7aXzcWs19U0zmSqlC637ZROkEkDH9K0X5x0ihyApZkMbHycMxBEuuW3JY44Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKEZewoi; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so947428e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 08:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813463; x=1759418263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZXZmlZKQJ1aPtpUTlxHAzlWRVtS0Gs7ufNiTCTx4VY=;
        b=TKEZewoifjV4D/V3rA1vSXGIJlMi18FMImFBXJB83OOgv+sOZ5OC0OkXnKBOF9pTQ4
         XcOCwLG80pf5y6i4XvNRouJZVTcC1ju8i5kAyRvXERAo6Hhd3KQr8JlW2++mLPR5XlpA
         u60oqjUH8F5KGTblyQPGsBC713sQ+7IPmYQfj7269R2atrGSVJLbuOTZEZZ6ZGb7GmAx
         OhxgJ6DT9zCFWYDhWz8q5aknJ39AfIZbXdbVOng9q00lmYPwCQc4zKKc88O4G1ifaorb
         2SAOxcwc1id1dHQ1O0ZJavILbVCXcbOCMnBCvZUG87vn+yfbsS4pdUXdhMMLlxOD2cz4
         j+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813463; x=1759418263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZXZmlZKQJ1aPtpUTlxHAzlWRVtS0Gs7ufNiTCTx4VY=;
        b=dazjnOYNsAfXMDEghSAI0qZWHVezeEc9nuvLpsIDrqvgTnXtfbVx/YaNJxSQczdTO9
         imSLzOK7D4YHIQUw33HJSH3GMe2EQVHdwHQFD7GlYSiatal2RnSe8TX3Bqr0cD806NoU
         vjEyXSLFDh6sEhs1nwaUXyYEESkXqVyxUpkFPJ8BpJ8G7s18EivAAlASH/0Nxzp2Uxiz
         K0Y76KZKuMdjnBAFko7PCvhHfMhKlO01X5fKZkELPuat/oWFf8Auc3/wlf568IgKGZoE
         b82U8Y21n+KaWUwzn9NMuLyDnanKt6Dz0Uxd9pRt8VlFkCvA3Yqc3i1Jn3YEhyK50j4W
         ZQTw==
X-Forwarded-Encrypted: i=1; AJvYcCVF6IjPzYDfMGRpWMPaYQJtP9LIDj9GZ0p2ltaYuobYA6WhGg+hD8QfQeaWyrWnf/K+G7ATzKeVhXiu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/2+k/XIu8vnu+aZRjZmbpS5rknsfS5J5PE8dtSccNDjfqEgvg
	g2LkzgkjDQFCydXj6Q6BpvOYEsCx4wJPcBpfKSg0C7Riwi31jbpR8ctQ
X-Gm-Gg: ASbGnctyFnAwmLliCnD5NF5kXH9vPXzyRM6Kp5IgiZCRgQ327AP0DDm2rbdFpoTOh+c
	musybeG7NwF2i6EQmdHm3Ju2zITDuf528xZRANoy3EoZJu/TjBr/7lN1W1NsO28v9vpwbQu6zZB
	b2VlmYIxIAqh14Y96dc3E82chNFch22Eb60o9tsQyH6v+cJ/fkU3tLpn9MVuyKYA2SvjXMZt4h/
	QgYLpsgK3kQNU0GShOFfIC326CuIrPEWYdEY4Z+iVM0M+nj601VAH0QvZsqXEV/PYn6Hs2Aj6w6
	7bJuwpBzG+Jh2OQCyQDYZKbIo6STO2n3c/q3qHZOjsnb2D2QVd4VYopSigBPbe8/WtSIWn36uwX
	pBVL6ijdd0701fQ==
X-Google-Smtp-Source: AGHT+IHh633dY6ANYLtUMjcEgpVN49ihUsWBfhvNeTS7Nab+3jt+y+Q8NjTjMoMebUywrhkNyXOgrg==
X-Received: by 2002:ac2:4e04:0:b0:57c:830c:2f97 with SMTP id 2adb3069b0e04-582d3e826d8mr1196972e87.50.1758813462959;
        Thu, 25 Sep 2025 08:17:42 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:42 -0700 (PDT)
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
Subject: [PATCH v3 18/22] staging: media: tegra-video: tegra20: expand format support with RAW8/10 and YUV422 1X16
Date: Thu, 25 Sep 2025 18:16:44 +0300
Message-ID: <20250925151648.79510-19-clamor95@gmail.com>
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

Add support for Bayer formats (RAW8 and RAW10) and YUV42x 1X16 versions of
existing YUV42x 2X8.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 75 ++++++++++++++++++++-
 1 file changed, 72 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 43f545e6c45b..fba90cafb9be 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -187,6 +187,18 @@ static void tegra20_vi_get_input_formats(struct tegra_vi_channel *chan,
 	case MEDIA_BUS_FMT_YVYU8_2X8:
 		(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_YVYU;
 		break;
+	/* RAW8 */
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	/* RAW10 */
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		(*main_input_format) = VI_INPUT_INPUT_FORMAT_BAYER;
+		break;
 	}
 }
 
@@ -221,6 +233,18 @@ static void tegra20_vi_get_output_formats(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_YVU420:
 		(*main_output_format) = VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR;
 		break;
+	/* RAW8 */
+	case V4L2_PIX_FMT_SBGGR8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SRGGB8:
+	/* RAW10 */
+	case V4L2_PIX_FMT_SBGGR10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SRGGB10:
+		(*main_output_format) = VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT;
+		break;
 	}
 }
 
@@ -302,6 +326,16 @@ static void tegra20_channel_queue_setup(struct tegra_vi_channel *chan)
 	case V4L2_PIX_FMT_VYUY:
 	case V4L2_PIX_FMT_YUYV:
 	case V4L2_PIX_FMT_YVYU:
+	/* RAW8 */
+	case V4L2_PIX_FMT_SRGGB8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SBGGR8:
+	/* RAW10 */
+	case V4L2_PIX_FMT_SRGGB10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SBGGR10:
 		if (chan->vflip)
 			chan->start_offset += stride * (height - 1);
 		if (chan->hflip)
@@ -367,6 +401,19 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_1),  base);
 		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1), base + chan->start_offset);
 		break;
+	/* RAW8 */
+	case V4L2_PIX_FMT_SRGGB8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SBGGR8:
+	/* RAW10 */
+	case V4L2_PIX_FMT_SRGGB10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SBGGR10:
+		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_2),  base);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2), base + chan->start_offset);
+		break;
 	}
 }
 
@@ -448,12 +495,15 @@ static int tegra20_chan_capture_kthread_start(void *data)
 static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 {
 	u32 output_fourcc = chan->format.pixelformat;
+	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
 	int stride_l = chan->format.bytesperline;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
-	enum tegra_vi_out output_channel = TEGRA_VI_OUT_1;
+	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
+					    data_type == TEGRA_IMAGE_DT_RAW10) ?
+					    TEGRA_VI_OUT_2 : TEGRA_VI_OUT_1;
 	int main_output_format;
 	int yuv_output_format;
 
@@ -580,8 +630,25 @@ static const struct tegra_video_format tegra20_video_formats[] = {
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 16, UYVY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_1X16, 16, VYUY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_1X16, 16, YUYV),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_1X16, 16, YVYU),
+	/* YUV420P */
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 12, YUV420),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 12, YVU420),
+	/* RAW 8 */
+	TEGRA20_VIDEO_FMT(RAW8, 8, SRGGB8_1X8, 16, SRGGB8),
+	TEGRA20_VIDEO_FMT(RAW8, 8, SGRBG8_1X8, 16, SGRBG8),
+	TEGRA20_VIDEO_FMT(RAW8, 8, SGBRG8_1X8, 16, SGBRG8),
+	TEGRA20_VIDEO_FMT(RAW8, 8, SBGGR8_1X8, 16, SBGGR8),
+	/* RAW 10 */
+	TEGRA20_VIDEO_FMT(RAW10, 10, SRGGB10_1X10, 16, SRGGB10),
+	TEGRA20_VIDEO_FMT(RAW10, 10, SGRBG10_1X10, 16, SGRBG10),
+	TEGRA20_VIDEO_FMT(RAW10, 10, SGBRG10_1X10, 16, SGBRG10),
+	TEGRA20_VIDEO_FMT(RAW10, 10, SBGGR10_1X10, 16, SBGGR10),
 };
 
 const struct tegra_vi_soc tegra20_vi_soc = {
@@ -608,10 +675,12 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 static int tegra20_vip_start_streaming(struct tegra_vip_channel *vip_chan)
 {
 	struct tegra_vi_channel *vi_chan = v4l2_get_subdev_hostdata(&vip_chan->subdev);
+	u32 data_type = vi_chan->fmtinfo->img_dt;
 	int width  = vi_chan->format.width;
 	int height = vi_chan->format.height;
-	enum tegra_vi_out output_channel = TEGRA_VI_OUT_1;
-
+	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
+					    data_type == TEGRA_IMAGE_DT_RAW10) ?
+					    TEGRA_VI_OUT_2 : TEGRA_VI_OUT_1;
 	unsigned int main_input_format;
 	unsigned int yuv_input_format;
 
-- 
2.48.1


