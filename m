Return-Path: <linux-gpio+bounces-23385-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 933B8B07DFC
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 21:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B6041C42EC3
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 19:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8743A2C08DC;
	Wed, 16 Jul 2025 19:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ixnp9DT9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F612E6D23;
	Wed, 16 Jul 2025 19:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694334; cv=none; b=skszGolABUtnANbRJSEQv0AD9HL9zdQrbITPxdT6vQevV/EQQfYHfs2rBzzOhGeo2usfoqtWaQ1bzJoc+QVEKYAN+HnQlBLhX022UEW+Csv6jSm+lKwbKqm+PzrqmvJ9ysz+vkZtcmyy1JaWm9o1mxEL9+8CvAHXQxKWdzbdkEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694334; c=relaxed/simple;
	bh=aqzu2YQ5BXADTBRxOe8uZl+nl0L57XcXnUxXYVOmaf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h9hwJU7RKhWS5N43SW1jJ6BM09Ls+tpDIgl404d9v3oV/ZIJMYJI0C0pqJ6+MeJNRx4NjEQz1PgteG0/dLpZw6pdEktyH5EevyWz9rjObf6MtPggF4Tt3ayZ5mHx3t1eubEpZmZqPLiQKsGudFdikHH8upg2NlIXAoxE4Q2/xmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ixnp9DT9; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acb5ec407b1so36394066b.1;
        Wed, 16 Jul 2025 12:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694330; x=1753299130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gllv4hKSr/Fki+4veRVEUIRWNQMSnyDixgo8cykWBP4=;
        b=Ixnp9DT92jCJfXUIcCnvr64KXJCBr3XO4EbdHGN0XMBc17IZv42Pz4pu/NKrwJMofJ
         y4sVgk6FVk47HEiX5z5BMjdB8O+gXpQe7mdg05YVJ6MeY/J3pEbUv2oIU1gym6/5ExgV
         w4nCwQSum69MIloqn85xl4XHC6j6dokJA+KJdlL91ad13o8BO3aBieBrHeBK1z/+9Udw
         ySNegB1MRTbd4aHrw7eFelmMNlqoWOXM2zZEfmeiA8kQWyz6NuFoq6nuXYQqs5FsDhGN
         kl47VVZ0Sq7zb41A8wjwK9nhNakb2jioyW86KkabWs2/COgLhsa7vUzuGjFmWidLX3NN
         vxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694330; x=1753299130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gllv4hKSr/Fki+4veRVEUIRWNQMSnyDixgo8cykWBP4=;
        b=UpEjXdfhZJMNL0BANIvLkydCXlV/KHVg+SgvaLnuEVXFRQB0xlBFiroYky7dEgi8D2
         fNHvjjsF9m4Z8gIMiy41cmY9i9GEAh3oUMDjctxGij27o1tEIAdwnzgkEoFkUhp4SeYp
         rZFEPL6ICl6TZVnIMssGhJF8jIUvfDPXX6/qDAR1rh42QdNAfhnGhophhjvJz6jWWgke
         wWEMFkkXehon44BzogKWknNa27pWjszYeH4GEknx6WCt7ncood1wX2Snv9EjWXDgniqx
         ulLlP8QVtcFdG3vJnY31DW+mpCzcGy+XgnAs3byRJgP7VKiL2GvnwwhhPd+Bcnllz2Mw
         hcdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVjYOZDnJeMOZEZxZwG9tcRzM8fXnWoLE6woTfnthQOfvV079jG211b4ELoBUo3f2pT7gscMJI2o6k@vger.kernel.org, AJvYcCWhjggP1CJZCSgn1bzN7FjBs44QE5lFSdGSwtyGliDWYW+S7Ku/wUbeL5skXSIHWoIAf9gUbbnPy6DBf6ki@vger.kernel.org, AJvYcCWntaLhrGuW0FgHmcZ3h3M8g7WbPodGSxnHxF07n9VYewXErOO/w7W5zrgKOw3f1KLs/Kgj3sDewUgsVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4MNdvdTZhzyAJb6jubhu34VnwvoV7RmTPLWVrdwHcCpZcvh0B
	KOYnhvtrOU3b/q2rdc/lFEfnU+xPdMDcti2sxykVT8VpBPO1Kn+uZyGq
X-Gm-Gg: ASbGnct3XaSP/iFd3VF7mFnpMontB1fJ1TRg6ORkbqGSWNGzOYhom9L5Avdz8c//taR
	Ac+caCZaxR9Fb+e4hkwewu48p/VnMOJt35BjpoXi9IlqvYMlIO7fg0FxHNDaoTeqofaaI+Dz+g5
	5s775F1ri39uutawE5jZJ/uqdBBWBmgJc5/L+II2AvhDEYyAU7uWyyK+5tBAOPriIO7fF9OBjwM
	46QImrEpm9z0PTecrXgQGLM/iG0xWsfx/F24LqJda0EMQCazkWBKgcvEXdCDlXiSzdBRaafEFGi
	lN0NYAUSVd/QowwJ3XbyeNhrzJOjs3poXGnSRL3HVOrqAQ4E7SQ1sD8esIsvO0AEy4FSm7VUgsr
	H6aX99WVS5LRh44W0FMAV/RrBkT2qvYu+Kbk=
X-Google-Smtp-Source: AGHT+IGSK/v+86lRq/XGVjTJfe2IFdQ5oaZ+aYy4IqTOkA5UDk3eVHHV7W/M2yeRakZoalV61a0M8w==
X-Received: by 2002:a17:906:255b:b0:ad5:27f5:7183 with SMTP id a640c23a62f3a-ae9ce0c5bc3mr288753866b.39.1752694329860;
        Wed, 16 Jul 2025 12:32:09 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:32:09 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v6 21/24] arm64: defconfig: disable deprecated MAX96712 driver
Date: Wed, 16 Jul 2025 22:31:06 +0300
Message-ID: <20250716193111.942217-22-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The staging MAX96712 driver will be removed as its functionality has
been moved to the MAX96724 driver which makes use of the Maxim
GMSL2/3 deserializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a91..6f4254f562da3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1300,7 +1300,6 @@ CONFIG_GREYBUS=m
 CONFIG_GREYBUS_BEAGLEPLAY=m
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y
-- 
2.50.1


