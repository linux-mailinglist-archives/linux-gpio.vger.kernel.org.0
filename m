Return-Path: <linux-gpio+bounces-21059-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C01F8ACF5D0
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 19:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 611D5189B85C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 17:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC6427D76A;
	Thu,  5 Jun 2025 17:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I1VnEq3T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7DA18C06
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 17:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145991; cv=none; b=oN4aN+DSd/tvoHc71nnX6WXRuxehckZFkzsxesAS31gUszzhQ8C1YDLdPhCLZLXWn0QsSicwibn+6wPcU37lHsXHXZxWaJgsWtq7z2qRbBfT4mZHFCZ1u0zGB2As4X3jW9MZEBab6FcUNEMRJfLVFRaCYJTHp2iTsbD4lglF9Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145991; c=relaxed/simple;
	bh=NngJ6Yx0t8C9t8P4XXbFrpgjfgvwAkcfBnBpT4lxGFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qlM2OTCJw5AVeqXc7kkoiv9OwZt4+g3chHQfpWrM5sLfpaCWFnW5eZtFDV0+Pb3781I2z3u+IpEnUxK4/g+YXRuf3SZ6nubLmW7nrAPR1m7XMFQCoY95utrLdgi0ctISpLIen/AmEutIs/551SXmwvk9u6r0pAKakbHd+r1PvQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I1VnEq3T; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55365c63fa5so257690e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 10:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749145986; x=1749750786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ar8+oEy28CepxnVsr2jEiRDXTfDok/weLPLs5Z9kVHA=;
        b=I1VnEq3T8ddqhvoQ5NQEukgf98kgl7JFV0+hJFR08RpOZNJJecr1c0dpbMFgc2cV05
         0qvwE/NiO1qE7Mp+j7Wh7nVnDoL2Ul0nM8dMnVCvPQiR8V5swuaCtKPfusjdb1M3GaMR
         wlX1GOuM584IpO1TFQgHjYERmMzoyas7NAhKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145986; x=1749750786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ar8+oEy28CepxnVsr2jEiRDXTfDok/weLPLs5Z9kVHA=;
        b=n+f2RJvy0uV/x1R0QrlpKqovZT26Wbqi1QFYyx0+9DjqplaAVAoas15Db3S545vp9K
         gE6PPwcJVoMhqAUfXQ0cl73W2tlLSkc/SRV8QXNTpSVEPr8gsl7GydL134A4GtNb+CKP
         Jktc6B0mpSimE85OF791xWN4GfzCubGNHtRpAhAOHt54y99qvlRkexHhCEx2fOME2ZeN
         mVrh7dqXA2vNX5fnlfwaETQhcEzWZsuSdpQm8TCN/wreHwgyixBmbPWd70KY08/2WcME
         bnTRU22TLHbSvTHPKxSLpm6JFUlyviIEz9dRlCUXzluQoE2pcrTIO831nF65kgFnifKz
         M/fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJoHtIpc9/NbaD+2+eMSG8lmB0ted7xiSm57Ira7Orao2ZSV1F9T+HpL0e7jqN4RB7sliGRy1T64D/@vger.kernel.org
X-Gm-Message-State: AOJu0YwraYiFCBLNmXbL474CZv8HacW75xRS60JVNHXWoN5jo2Mo8tcR
	bOISqlAPjLFAN0ZQR3q32Uyn2t9NlvRo0CFgygBNfYTr51aiRCOGydUeNvCFz8Ro3Q==
X-Gm-Gg: ASbGnctJDfhELKOZVGiSlmaYa8JA8prb4Ybub5Sus28QHV1ZZWaiFqiyNfjdPkc69AX
	ng+gSomhKGmX632lc20TjO7/u2wovsHqm6S5jmk2tjU7xXowR82LV8ZHtFFGhB2aYHrmdCT7EHB
	zJg4rLOTqAlpyVh3NF9f/jj1dBW14+PBBoTxY195Wwa9d5WZUDCbxuQs2/EHF96zmVQ8yBRCUpp
	5rxtXZ8HuIhd3hSZ3UZqKV3n9AyhWmZUDlRXwXkfqhRA7cgUipvsPKDqeUN7QrlkL62EoPx8vAR
	TBDPtqWd7ltliSsZadxOcHxOSnBPsYnlc1qixqKbSSQbt6EO0SOH55N1/uctLldi3aGJEYiiM3I
	lNFaLyhYASFkJy6uguG8/EMUlBItThiHtJaer
X-Google-Smtp-Source: AGHT+IGuo9eAuj3/ZulUgVYVuEINR6TV4aJnWcXikBTGTDNlZ8YqpVl3rERmqVeHdcMBB1locGc5IA==
X-Received: by 2002:a05:6512:2242:b0:553:3892:5ec3 with SMTP id 2adb3069b0e04-55366c354f4mr16249e87.46.1749145985864;
        Thu, 05 Jun 2025 10:53:05 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379379c2sm2641210e87.251.2025.06.05.10.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:53:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 05 Jun 2025 17:52:59 +0000
Subject: [PATCH v2 06/12] dt-bindings: usb: usb-device: Add orientation and
 rotation
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-uvc-orientation-v2-6-5710f9d030aa@chromium.org>
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
In-Reply-To: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

For some devices, such as cameras, the OS needs to know where they are
mounted.

ACPI has a property for this purpose, which is parsed by
acpi_get_physical_device_location():
https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#pld-physical-location-of-device

In DT we have similar properties for video-interface-devices called
orientation and rotation:
Documentation/devicetree/bindings/media/video-interface-devices.yaml

Add rotation and orientation for usb-devices that matches the already
existing properties of video-interface-devices.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/devicetree/bindings/usb/usb-device.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
index c676956810331b81f11f3624340fc3e612c98315..a44eb24c657993f88145377a4706ec419b6cd998 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
@@ -44,6 +44,14 @@ properties:
       - minimum: 1
         maximum: 255
 
+  orientation:
+    description: If present, specifies the orientation of the usb device.
+    $ref: /schemas/media/video-interface-devices.yaml#/properties/orientation
+
+  rotation:
+    description: If present, specifies the rotation of the usb device.
+    $ref: /schemas/media/video-interface-devices.yaml#/properties/rotation
+
   "#address-cells":
     description: should be 1 for hub nodes with device nodes,
       should be 2 for device nodes with interface nodes.
@@ -103,6 +111,8 @@ examples:
         device@2 {
             compatible = "usb123,4567";
             reg = <2>;
+            orientation = <0>;
+            rotation = <90>;
         };
 
         device@3 {

-- 
2.50.0.rc0.642.g800a2b2222-goog


