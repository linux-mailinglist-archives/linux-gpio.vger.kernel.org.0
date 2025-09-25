Return-Path: <linux-gpio+bounces-26587-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA87BA0409
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 17:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26EF91C255BA
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 15:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B76B305058;
	Thu, 25 Sep 2025 15:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASxPoWgg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF132FFFBC
	for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 15:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813447; cv=none; b=p6lmc0VZWI+uWC0m/qPyetP4iVd6mUQRRJy1kc4aTc0HPFXUia/Ci2V6/wtOvkkYxeeni1DTZi2V18Bva4Yc/xUqtzpEZG1GV1t/ihKUFdgKWyUQMP1/8gtvIlBJioFJd1BUfM4SZWELIYJx8EkLWbeie5zEvkhO9urLuMTEOD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813447; c=relaxed/simple;
	bh=u+qJVWyapenrodgmMyyh5sdeoJQIHo+UHZurPNrBBEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WQizSAPPONvTIYJ7WRf7CPXYQBMtMOjSk2NS6lujYwfKHGxEdb0EXciCSTJdrGbS595TYQetPJlQexQeDilcC+d9AG+BVwGTflCXHlqjqCHQvNVz0FremHSESqIAt3+1UnPxwStQ3Oqag8ctAaFqRosRjc2HHDozF+sIQi/9+OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASxPoWgg; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57992ba129eso1244640e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 08:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813442; x=1759418242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
        b=ASxPoWggU2jE6P99zI4CRqeV7JuShOT1D/mfEc2RqTFGTqRfTvoolVpC+su4R2SMBi
         uscAI/KyVs4csYRuIyhjwY1lGPJc5YaCnncVKxuBUCAKCB3b2pmvXjxtnYjIXB8Csmjo
         KWIsVNQvQdB8AyrwSD0El3/1UziL8zd+KKgE7UZNeiTfDuTC9s5qls9ath6D0PXvVNrJ
         wjTAwc43k2FkfBJrk8p5TMHt6TF8NAW6Cz1vFC1QnNko/u6tLDj214hUDDqBXk7bnCzj
         YHMkvnzLZj++BOxhVTxp6dctM+RnAu7PlIqBSOLYoWStJ80XFVnXXC42Q6BEns1e8BuU
         MPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813442; x=1759418242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
        b=uqTPGB1lxbC7drOtOLDPOTc7aZTaq8CbJJfRa/uiBoAMjRk2YxJ7xta1g/r97Yyj4a
         LD6ZyTDgs40N9JSIZtm5JXtXcEN+zKVS8tq8e1rTXQUqbSQAp+NJPeOr7oSgJvYBwfxz
         IVXnpjd7bJKTd7sRy9QvZy50nBiLBjzO1HyHEy9MFub0goultbayS7jkPCzKRlWXvG1L
         xAkRlk8V8gXglk5bp4jAjaHUeFpfqYbptJI/vZB7m9IIlBepHk1mDS5kH4K52nPaeNz1
         VSNtldVmIGtUeEuwgLojsippk4Jgx+Oo5kL1tXOHSSJcgcl7o3gVhsLpYZWqiqWGKHV0
         vuxg==
X-Forwarded-Encrypted: i=1; AJvYcCWaa8a+JKNTl9zkTgB9Jjz6nbiLHlA8FOc7VhxcVRhMtl+2Jv4nM5Sbbzry15HzLXdNfXrnmrSYrK8b@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0j0gKsQvQivO4TanA8O2uyD748SAGK9Q6IMR6C7gWOWRdF2sq
	j2gsHg7v2rQmaVFhJSyeA8OXnRo5WJbwzyNaf97tgVzlFkWF6GJhh7ok
X-Gm-Gg: ASbGncuvglsEbrvyJ7ZaMw7Vb1t4GSBkCW0052Af+L7z9eKYFi9jvneVDOzlvCdFEfv
	pLgvW4G3lnficaL99TIojWFy0nD3UyAcM3rgmRMoOJM/ClDB7zglwrj2PfOq+fjeF79Ba+3LBYe
	9oAWMS3CYblJNNRAJTM/nA4vGAltBysffuIc5jgwj0nIIfWJyjlwPv5x5Go+8io3TotSG8W0MBW
	a1jPPeUc3t7mQyG19euQ+xGpoYiVHthQtoR73O9a2/AKpN2T6iDM8kEFylHFBWpfc9n5OpuOPPY
	aXKLN6mgA3kU1/pbE2OTIcxDbrl7oP7p1CB3DEhO2rlUXthb5I1DUE5k5aCgaM8QwiKghJPgYXJ
	fsLUt5rW2AuBCuQ==
X-Google-Smtp-Source: AGHT+IGR2iv+Kh9ab2Gm8gGsLzPj15GIU7TA9oRp1epPRzVsSpV56VOyWvYjJkH+/G6EVhjFNycXFg==
X-Received: by 2002:a05:6512:6d1:b0:57e:ef77:699c with SMTP id 2adb3069b0e04-582d09297aemr1358949e87.3.1758813441925;
        Thu, 25 Sep 2025 08:17:21 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:21 -0700 (PDT)
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
Subject: [PATCH v3 06/22] staging: media: tegra-video: vi: adjust get_selection op check
Date: Thu, 25 Sep 2025 18:16:32 +0300
Message-ID: <20250925151648.79510-7-clamor95@gmail.com>
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

Get_selection operation may be implemented only for sink pad and may
return error code. Set try_crop to 0 instead of returning error.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 7c44a3448588..856b7c18b551 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -476,15 +476,11 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
 	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
+		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
+		    v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel)) {
 			try_crop->width = 0;
 			try_crop->height = 0;
 		} else {
-			ret = v4l2_subdev_call(subdev, pad, get_selection,
-					       NULL, &sdsel);
-			if (ret)
-				return -EINVAL;
-
 			try_crop->width = sdsel.r.width;
 			try_crop->height = sdsel.r.height;
 		}
-- 
2.48.1


