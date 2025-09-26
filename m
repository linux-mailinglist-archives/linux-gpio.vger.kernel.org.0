Return-Path: <linux-gpio+bounces-26619-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF459BA3CD2
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 15:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9379F172DB4
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 13:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9BA2FC01B;
	Fri, 26 Sep 2025 13:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MEdFAQ1S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5F72F83C4
	for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 13:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758892300; cv=none; b=Om045MqFgs85aRA1wKz2lLmyjtTaQdsaguzh/iwNa4WxQ8Rn+TtZVi1WnQ0ROBCbEj5awlGYnqsb99EKtB5dKYntSPW41oGU2qtFIsXNUwgSToyR+RTMQpIuLBFQpMsTcYFsUF2l4O3nBD5PACSBPQU/wvKBRIVUMlgHC1N+MxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758892300; c=relaxed/simple;
	bh=747DSL3/0b26gMfctw9GAJQ4wcs8qWL90knTYpPv+GE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=trA9+I4QTqtE0k/RaLTxPIjHEbduGMG24APFExaKV7Az51j5aH6kHVyg7AnmfO0S7/eNoxUybYnhT1eWdndSBp5o5oLILngRNiErN42ZT2dAvGxs0GNzch8yqZVnTzEchFPS742+UvEmRtfBkt3UYjlo/EWuryQTD2vpWvmz1TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MEdFAQ1S; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-579d7104c37so2967900e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 06:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758892293; x=1759497093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PEFN0lLdAUAhxOrw8NBMU68FYdHDfoPQjtv/CBRcNWg=;
        b=MEdFAQ1S/grHZMhcCO6tE2MJcK4ibjWaeuhsoYyuBn71UUcnUC/shY5ocmLp/qu7WP
         7okYhCuXdM2bbt6BvNRcorf2eaEw8bYT5GfWfnogq8O28zLjMWCbeVbc5r+A5z91fMDr
         LpswgYv+M4HDBm0DOXhHwb1oqtph27Tu0Jodw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758892293; x=1759497093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PEFN0lLdAUAhxOrw8NBMU68FYdHDfoPQjtv/CBRcNWg=;
        b=IpbcG9lh+5ZhNfJE2cgF6KDQ+hyI52WbjAvaSNemLL9Te0g0bP3jtCHg43Z9W5rpgA
         LPIsFGIt18EBPmeO78bk6PDRwAroUXIojMrYqHAf7DQO9wMgZovhRlcrFtIvIqwY2ImJ
         prhMWAPe4mo2YIZCl1+7MrHSes4dJnFkSDUw9+ctiDZWuQBFl+m3LRMWvf7yX8Jq/Ap1
         FAyQ9/bW9d1hIkZSJaXDERzCMGno2FfGN1K4W92AVv9VCsZh60GwvbnUaT8A4N1a0QDn
         bHERNrR/fl5oQcRo3sbuGT0Sk8w0Gej7o8R5xWuCEwg4uRjVoKnkGMkrRi+JTWqUASBZ
         91Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWTbW7vEf5YlpRiHzQ0ZD18/95YwE8m2q+gHBjP1Gri+tL1Wbo4YEI8KBTMjxc+LgvLGlGzrQNdmG5T@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh8cy8UKp1t5S6aPKdHF+HCqdxvG8sYLcgK1lLiSgE0uvLbz5J
	5KB0HMpDUF6Jnn38BQR4w5je0LHDIela0/q3/K2RsOwGuq6KumOKkgYHk3TX4jAYpw==
X-Gm-Gg: ASbGncuvcoTjMPhNPajRAFx4EZvJi9yqhk32DujeX5XAWG4Lp8tCVrJtcFt7KZJaCzW
	AiyK+my485W1bA6rMt7p0nFngg1pVixMASYq2hUOs/VW9Jg68gSUxA6vHJuqMU9UnpqpEd4O+56
	bKae+Kq9/ha1hm71N5Zha+RJnhmtaMgK04BLiJ0Tma+eFHa/Yhv2eh3ya/CHTMO+7Bq7/YHOWhJ
	WTt5xu10BS3JgQ61gjqZX1JTUNEczDTfCLHezN01jAKQRp4seyRlH4XqFrVs3TAJ3NiuyBZ+z2M
	L9r0ff2QHzsbRMkTiz1dBG3ZvG8tGdEGKJm47wcpW8qjWrH9zNx4TOpCf7KJr+Kycv8mFAUUW2l
	EQo3/wugKnV6eDZNRezdhMtenM7JTa8blEkvGF0nw+BeDDDZsBLiepKl+cZJ9TStzORs7lWYJJB
	1spQ==
X-Google-Smtp-Source: AGHT+IHoXncX6KzHuffRNxD1bdNRByMLtGFUXJU+Vx+pJpeCHx/eyFalgZtv/Aq9A8oN/XwwQ6kRbA==
X-Received: by 2002:a05:6512:e9e:b0:563:d896:2d14 with SMTP id 2adb3069b0e04-582d2b4cb9amr2443275e87.36.1758892293127;
        Fri, 26 Sep 2025 06:11:33 -0700 (PDT)
Received: from ribalda.c.googlers.com (64.153.228.35.bc.googleusercontent.com. [35.228.153.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58527c6b014sm123872e87.43.2025.09.26.06.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:11:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Sep 2025 13:11:30 +0000
Subject: [PATCH v3 06/12] media: ipu-bridge: Use v4l2_fwnode for unknown
 rotations
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-uvc-orientation-v3-6-6dc2fa5b4220@chromium.org>
References: <20250926-uvc-orientation-v3-0-6dc2fa5b4220@chromium.org>
In-Reply-To: <20250926-uvc-orientation-v3-0-6dc2fa5b4220@chromium.org>
To: Hans de Goede <hansg@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The v4l2_fwnode_device_properties contains information about the
rotation. Use it if the ssdb data is inconclusive.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 441d1a5979fe94bee4738da68e185a44dbd411d4..6155046ef4fc6b5d074194d1b8113212304136bc 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -242,19 +242,23 @@ static int ipu_bridge_read_acpi_buffer(struct acpi_device *adev, char *id,
 }
 
 static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
-				     struct ipu_sensor_ssdb *ssdb)
+				     struct ipu_sensor_ssdb *ssdb,
+				     struct v4l2_fwnode_device_properties *props)
 {
+	if (props->rotation != V4L2_FWNODE_PROPERTY_UNSET)
+		return props->rotation;
+
 	switch (ssdb->degree) {
 	case IPU_SENSOR_ROTATION_NORMAL:
 		return 0;
 	case IPU_SENSOR_ROTATION_INVERTED:
 		return 180;
-	default:
-		dev_warn(ADEV_DEV(adev),
+	}
+
+	acpi_handle_warn(acpi_device_handle(adev),
 			 "Unknown rotation %d. Assume 0 degree rotation\n",
 			 ssdb->degree);
-		return 0;
-	}
+	return 0;
 }
 
 static enum v4l2_fwnode_orientation
@@ -297,7 +301,7 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
 	sensor->link = ssdb.link;
 	sensor->lanes = ssdb.lanes;
 	sensor->mclkspeed = ssdb.mclkspeed;
-	sensor->rotation = ipu_bridge_parse_rotation(adev, &ssdb);
+	sensor->rotation = ipu_bridge_parse_rotation(adev, &ssdb, &props);
 	sensor->orientation = ipu_bridge_parse_orientation(adev, &props);
 
 	if (ssdb.vcmtype)

-- 
2.51.0.536.g15c5d4f767-goog


