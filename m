Return-Path: <linux-gpio+bounces-18215-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BED85A7AE55
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 22:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1E99188251D
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 20:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698052010FD;
	Thu,  3 Apr 2025 19:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ti7K4rIS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9741FFC50
	for <linux-gpio@vger.kernel.org>; Thu,  3 Apr 2025 19:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707789; cv=none; b=IviXHGLpud+R9ebpg0Sjv4OMXGlxSCk31ZE4/3XmWA8mCv3AFmvFi5VZVoV8Y1Pi//2OUYHelNiCbXjKTTkCudrkJkPbUOZiNAfzCqD2dDM7HQWRwTpwpUjDh+EGMRRMZHehGfnJUwuJVn8Rcejc0MQHZIndR2WBoAO4Rg806Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707789; c=relaxed/simple;
	bh=OOu5uUVRp5bNrm10Y7Elq88mwpICvefQHhKqbDlAYuk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HsnDNN+wvfnsex14zMzJ7kERS2lTFlE1D9oRkNSv70BaO+bmZEXcVHherNsH6+9H6khe7OGki6DI7gfmLSS+YfJavrFFsQX0J/4AZdzd/iFUUEH5F6dY1Y5QO2Sp72qIO4sEqMzH/HLx9nPmtrEwq9vmD/4XF3GrqSrJnsISBJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ti7K4rIS; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54298ec925bso1981450e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 03 Apr 2025 12:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743707784; x=1744312584; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dZyzJh3mfyCoTqN5jp6PExNK9PmJ9vF6+zZHPXer6SU=;
        b=Ti7K4rISjY6mhIQl+zP5GZy5YPbxtfCe6iavRQPGqdPKc5uzi2nZuciqu/iSLRBDVw
         ZbWFw4knoE4i5JOm5ULBMG5OYQKPwdFI91cnQQiA7V2Ww+A95w8FQGjAoKwU0FRTA800
         QPFS++f9v32o1JpsDpt71asE+Bf2Cfwd2RqMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707784; x=1744312584;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZyzJh3mfyCoTqN5jp6PExNK9PmJ9vF6+zZHPXer6SU=;
        b=k7/Yp41i2IuRw0aRMnc4ETDfdtE042Lg2nRCK87h0NlWy0fegZLuLmK1mDNIUgADbE
         6e1DPj2pEYyub77Oy2rwNEAflCZ0iglIs6fbWu3aFgiGoNX0IVWcNvL5xhKxL5M696IA
         0czS8x/FQ5OxVS9dFlDlH274jTMWZEMLheAGOF3m3jNJKLb+aIcyvKC9VOOhHIxOJ98s
         ZyECTRDRYg0uz8FIqqGdJ4UynqioAv+y5x+2GxN3Bu3RLz2AILlSTLVrHOfnNxxJ7ScC
         hLZgx6+aipBoN2hnaDrc7EcThiFRGKIKcXgYO0gIaXgx1e55OqUCMxNBN2MrkKysWbIP
         lnPA==
X-Forwarded-Encrypted: i=1; AJvYcCXvrED6pd/er+abWMeT3PYq+XPNxoQ3kLGBJ//7YkT69wvON0sfdGChckkbUhu3x+9b8zwfRbhqqtCs@vger.kernel.org
X-Gm-Message-State: AOJu0YxElNeLxLoDjunjJ3+rONNxeYykTu2oUltVpYYGz7agD7PRw8cm
	RPvIRt8d7YdwhkRsXt8bL8rRWcnMzY2vikeerCGTrE7CUmu7WULZHBjEybnFLhQPRmbdoL8lk08
	=
X-Gm-Gg: ASbGnctsGUyiWC0HD9s3VgGB/Lz1v8wRLkkL0IlPn6R8uwFCOppesldDX0hjoj2UaFK
	0zDRAi2+FprfEE7XMikAVaRwNEpOOY6U3mpnw4D3cAPHvwSM3nZX9e/geGzviUvViHgjv6d0Fd3
	XKjLxWuHTugcL7Nzv1Hj7crPCf1wSzjVdQ9/edmSH92sArISUmIHKJJv9Q1GiDt2i2YksiqIeRa
	kWTJ9bCY+KhMwluWG+2RzjhBNZwogOz//fg7T9zdcvZr180lxYHQLASTt23A3ROFSwP6uXIFHK8
	MCYm0ug7hx2aUxTrr1jVx4Ge1moeylVSKXxto49+JUMSiwJB4NI9VF309eMb9TDnU4KExBrVZXI
	uI7TDHHEnayjifgf7uEjr1afV
X-Google-Smtp-Source: AGHT+IHifPA8y75Uvt8/h5dkWWov6ic9+zVOw/bPq0NuxszaJoiYbn+TCyRg03Rw66ZLpx8pcdWWfA==
X-Received: by 2002:a05:6512:1389:b0:54a:cc11:b55f with SMTP id 2adb3069b0e04-54c22785246mr117481e87.22.1743707783922;
        Thu, 03 Apr 2025 12:16:23 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6b1sm230142e87.194.2025.04.03.12.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 12:16:23 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/8] media: uvcvideo: Add support for
 V4L2_CID_CAMERA_SENSOR_ORIENTATION
Date: Thu, 03 Apr 2025 19:16:11 +0000
Message-Id: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHve7mcC/x2MQQqAIBAAvyJ7TjBLor4SHUzX2ouFmgTR31s6D
 szMAxkTYYZJPJCwUqYjMrSNALfbuKEkzwxaaaN61cmrOnlwEost7EoThtCO3hrrV+DqTBjo/o/
 z8r4fZe88mGEAAAA=
X-Change-ID: 20250403-uvc-orientation-5f7f19da5adb
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.14.2

The ACPI has ways to annotate the location of a USB device. Wire that
annotation to a v4l2 control.

To support all possible devices, add a way to annotate USB devices on DT
as well. The original binding discussion happened here:
https://lore.kernel.org/linux-devicetree/20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org/

This set includes a couple of patches that are "under review" but
conflict.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (8):
      media: uvcvideo: Fix deferred probing error
      media: uvcvideo: Use dev_err_probe for devm_gpiod_get_optional
      media: v4l: fwnode: Support acpi devices for v4l2_fwnode_device_parse
      media: ipu-bridge: Use v4l2_fwnode_device_parse helper
      dt-bindings: usb: usb-device: Add orientation
      media: uvcvideo: Factor out gpio functions to its own file
      media: uvcvideo: Add support for V4L2_CID_CAMERA_ORIENTATION
      media: uvcvideo: Do not create MC entities for virtual entities

 .../devicetree/bindings/usb/usb-device.yaml        |   5 +
 drivers/media/pci/intel/ipu-bridge.c               |  32 +----
 drivers/media/usb/uvc/Makefile                     |   3 +-
 drivers/media/usb/uvc/uvc_ctrl.c                   |  21 +++
 drivers/media/usb/uvc/uvc_driver.c                 | 159 +++++----------------
 drivers/media/usb/uvc/uvc_entity.c                 |  11 ++
 drivers/media/usb/uvc/uvc_fwnode.c                 |  73 ++++++++++
 drivers/media/usb/uvc/uvc_gpio.c                   | 123 ++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h                   |  21 +++
 drivers/media/v4l2-core/v4l2-fwnode.c              |  58 +++++++-
 include/linux/usb/uvc.h                            |   3 +
 11 files changed, 349 insertions(+), 160 deletions(-)
---
base-commit: 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209
change-id: 20250403-uvc-orientation-5f7f19da5adb

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


