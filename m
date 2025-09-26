Return-Path: <linux-gpio+bounces-26617-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB23BA3C9F
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 15:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD598622BAD
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 13:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5FB2FBDE0;
	Fri, 26 Sep 2025 13:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CpOVhZG3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D7E2F6197
	for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 13:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758892299; cv=none; b=A9crt/NEKDlQIkfA10/5GjkLV4X+6r8lHgqU36S+BmW5Z48ZvWxA4dK1INN4IPPP22d7eKAq/P0+H3/V3L6gtlWvpTTjUNGGbSDmA14lXKcj+Mwul1sWBBN2ugN6KhWzdElGFOyAAwNdY655ZLnpHtD68ZVhqYN/AwhBrkjbikw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758892299; c=relaxed/simple;
	bh=8QXukFFdhrRn2peTuBfsWRiyR8y/J2hEQydiLTT8V2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FOsHbzQxOLxLVsad/lEkS/rbN1mgbo4ZrYZKozHXh+I1OJjKGFkMOwTiL45+S/SuQv6OLLUKgwzTYELDafL3zeVY0Aow8i5uL2Mi/zl4zoNvOEUDKYGDbJtqFf/jOYL2TQDH6mrFBEhm87o2IwJwXmPhZ1zWZIJKlvrYY0l818U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CpOVhZG3; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-363f137bbf8so20147201fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 06:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758892292; x=1759497092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IULFJYV86S6ZpfwTIK6NKFvLB7brLHHTAANiqsCeGE=;
        b=CpOVhZG3vaxV2fboQSsRh23NrW90eUjXQS6O48r81fKWyQ1M9GO2uGrcKf4PxEg4gX
         3I3U4y+P23YYueW78VE2BfMvSvXu39119YNbwseVb2awkxTYYHXQa/kSMzK5NKg5BtXz
         /mOmJlsI9jEAHUkIPEXIueXJNLkCDwTnc0SG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758892292; x=1759497092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+IULFJYV86S6ZpfwTIK6NKFvLB7brLHHTAANiqsCeGE=;
        b=ufQuO21FXaMPpOAxwSnTKJ/DxfdYHMKveU6t3DQT1GPF5iUc7CcRmn211YYigovIVT
         wiyvNaT2AIF2g0lK1b9m07v14SjgwH8hkSSkduiRCx7jDchcirCae7G+Ra8uSrmRNtGm
         IvIK5/9Z4uYUtREkqXAkejby+/rIJ6RR4JoUz5rbzaxdpfv5rAlhfkDUEj+rlwYn9/S0
         IDeOVpv5BBor+yAky3bxrY57GQCabkG+fZoJlN9+TO3Hit8DFSxPelsjtUX8HkLuKU9Y
         a4ex4RXhW8JP67ryZAywx4tOfyITGCX/1Z3jt1uRPtKwiPIwULzsHSrLRomBJLfwM8MO
         fvlg==
X-Forwarded-Encrypted: i=1; AJvYcCUsWi4IYKI0nV6dacW1upHcRpC++VR+g9Blx2b955GtZOrzy1xKxLdHGaLC1LMoNZ4eew9kUYyRzxoW@vger.kernel.org
X-Gm-Message-State: AOJu0YynzkGo0XxDb2ahV/tKvljYNnx9VAreBXg12bOcKY1nIZ/iuY8p
	RmNgXlZNHyQM2wKl2Dr2ytsz9qQWZfCw3SGj3pFCYOceWLpd8LG288t3qt+/XvUiGA==
X-Gm-Gg: ASbGncvu11QEezPWLUDWEhBB09LVy9+XvmyuWFxkEqcQpkaZHqMaq2SZAvL8Jm+qeoU
	A6kTIQb0BgTfIb35HDgec0z/LybqIzx5cf328KT2C/Gd0/fjEQUZzdHJM3UqnMwM6NS6Yjz9L6K
	By7GXClMpLVyQA4RWKBEgBiEI/7ahuTXpmD80FGYRD1A+/zwyybR0gvGn7pjQyh2Qk0MKFsZddp
	pL/aV3sBZXVVefSA8e1UVj1MUoq7Rw0S81IYVmr83LDkArdFqRP/iZLKzf5TrjjfChSkaVGXABe
	+zd7BQeRmFhONUp22ZpjM5JELZwuz/3DIvNserSGV7rfTdksT/SpW9QLIkiZ1yl0Rjrqj98aMe0
	/rLtC3ITTt2+/Z6gE4EFFcMZmRWvP5qPjEN4eO/yqY/PkB4ds9x34Mg9dMRXcfCoTo1GLvqzuI0
	5X1a/oCS9AVMSq
X-Google-Smtp-Source: AGHT+IE/r2pIJwf7kAuauI+jC65tbRl8WC4I4+SdoNtU43PxQUMr/4vfCOnHocv1AyDV3BygK1ERFA==
X-Received: by 2002:a05:6512:2201:b0:570:e55e:47fc with SMTP id 2adb3069b0e04-582d3c9674cmr2179748e87.54.1758892292030;
        Fri, 26 Sep 2025 06:11:32 -0700 (PDT)
Received: from ribalda.c.googlers.com (64.153.228.35.bc.googleusercontent.com. [35.228.153.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58527c6b014sm123872e87.43.2025.09.26.06.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:11:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Sep 2025 13:11:28 +0000
Subject: [PATCH v3 04/12] ACPI: mipi-disco-img: Do not duplicate rotation
 info into swnodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-uvc-orientation-v3-4-6dc2fa5b4220@chromium.org>
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

The function v4l2_fwnode_device_parse() is now capable of parsing the
_PLD method, there is no need to duplicate the rotation information in a
swnode.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/acpi/mipi-disco-img.c | 15 ---------------
 include/acpi/acpi_bus.h       |  1 -
 2 files changed, 16 deletions(-)

diff --git a/drivers/acpi/mipi-disco-img.c b/drivers/acpi/mipi-disco-img.c
index 5b85989f96beeb726f59ac9e12e965a215fb38f6..b58b5ba22a47a4afc5212998074d322f0b7586dc 100644
--- a/drivers/acpi/mipi-disco-img.c
+++ b/drivers/acpi/mipi-disco-img.c
@@ -617,21 +617,6 @@ static void init_crs_csi2_swnodes(struct crs_csi2 *csi2)
 
 	adev_fwnode = acpi_fwnode_handle(adev);
 
-	/*
-	 * If the "rotation" property is not present, but _PLD is there,
-	 * evaluate it to get the "rotation" value.
-	 */
-	if (!fwnode_property_present(adev_fwnode, "rotation")) {
-		struct acpi_pld_info *pld;
-
-		if (acpi_get_physical_device_location(handle, &pld)) {
-			swnodes->dev_props[NEXT_PROPERTY(prop_index, DEV_ROTATION)] =
-					PROPERTY_ENTRY_U32("rotation",
-							   pld->rotation * 45U);
-			kfree(pld);
-		}
-	}
-
 	if (!fwnode_property_read_u32(adev_fwnode, "mipi-img-clock-frequency", &val))
 		swnodes->dev_props[NEXT_PROPERTY(prop_index, DEV_CLOCK_FREQUENCY)] =
 			PROPERTY_ENTRY_U32("clock-frequency", val);
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index aad1a95e6863d443a45985ba7ec7be4acf8664fe..296716875a3e7977abb7b7dfa89f78664aebd61c 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -389,7 +389,6 @@ struct acpi_gpio_mapping;
 #define ACPI_DEVICE_SWNODE_PORT_NAME_LENGTH	8
 
 enum acpi_device_swnode_dev_props {
-	ACPI_DEVICE_SWNODE_DEV_ROTATION,
 	ACPI_DEVICE_SWNODE_DEV_CLOCK_FREQUENCY,
 	ACPI_DEVICE_SWNODE_DEV_LED_MAX_MICROAMP,
 	ACPI_DEVICE_SWNODE_DEV_FLASH_MAX_MICROAMP,

-- 
2.51.0.536.g15c5d4f767-goog


