Return-Path: <linux-gpio+bounces-21063-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8DCACF5DD
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 19:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 497B917945C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 17:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B391927F164;
	Thu,  5 Jun 2025 17:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UHkseJYV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B425B27BF8E
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 17:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145994; cv=none; b=idC0h/lzRJMzuDeKsfGyeKcn5J4108jrMmmE56hhFzkpQsig3KfvJhI3LKgwqPo5PmZHzFniLd3h0gYNRTJ+sO/0y/+143+FC9JuozBNX/imNIc4+l9fpZXLZHCv45Nb65SIDGFHIjHKXj+Oa70N58Xo7tKH9DOoCAtZw/yQcn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145994; c=relaxed/simple;
	bh=egMOMDJhHu8VwnbxMN9Mymsv63L3oycTPM3I/mDsNRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ui+NtEbWPlk5p1qcLS9eQywJKb5f7OYIFEfaYA3Hnvxrz+hTxqyTnZiZASwWHvDT7PolQezfe0EUoR71J7qYejC6WTZ9D0RF//yA9XuoG9Qv7jRMWTu9MQuw0TjFrCYKI7Fj7hGZtbRCXgbUf+uituVEALsPm6AvDtABVwYb1AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UHkseJYV; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55342bca34eso1344593e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 10:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749145988; x=1749750788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UY1nemN8kbEMaW5aIDSm45n0IYZoWUHM/pKH/2rX0uY=;
        b=UHkseJYVy0u4EXsL85LuqmIPeTdak5S6hH4bKS9NqW45rauBziI1Q7eqUM+LWi/cUP
         zZxt3wnmQG9ZUGAKjoDPl7+/b2PSH4y3wxMcAF9o8/V6aidM8oktpvDWRvgQ0ojYF1je
         dCcgRcaK4tQ4We6Ob8hRi9kFe2LG3fBkdoyZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145988; x=1749750788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UY1nemN8kbEMaW5aIDSm45n0IYZoWUHM/pKH/2rX0uY=;
        b=NUfqz6ULAPqJ6u6i9DehFnSCT+zmmuKCQTTKz6W3NMlEDYRRn83iH4lkNJdYe4kmie
         2pMPo1+HpjH85LQA+NLunF65uWjO2/vGK/sTB0P3YlvcdXI6bXNhT7W5BpLI4RoRjr5R
         j/OxmPiyPgVbffbiBWaW6W1HD96070MHQUMbK6/RQtu/28x53UaCAhbGl5Wvfs2wZdeE
         wIuMuiFlrVgK6fgkbHTuHmOXkasSIuP/Z2uRpWCEwld5r6Y6Elv8tFtKJHgf1xwOq76W
         l7id8DiPy1QpYd1HPjvWC5pSAh0nGjozYZM/GaxBCTEKbA7MVy1s9Rdw99t6q0Xx+cfK
         fcog==
X-Forwarded-Encrypted: i=1; AJvYcCWqlhepBdTWKpCG4HOWcMHNkyG3rggbJYxvHMwRP/mQB7llVCs7MPsuimhcYtZiN5l3pdNUpZc5nJOz@vger.kernel.org
X-Gm-Message-State: AOJu0YxHUJ9Kba9sgcysETqHlDnjk7WCsSriK3mkWQvCNc3F5ZcYAyTY
	yVIQdsAr9o2vOlZU9HyxP3yawPlEpe4dgJ9XsU0iOeGNZ0+yzqu9Ldyu2LSxRjWeEA==
X-Gm-Gg: ASbGncuy6mNoeJIaIl6/RPApzh3btxwnhKDnDqgwnvL2F4v/WUAwg850xtZtVwhJ1rn
	YHndU4K9vlvEi+7b9X3z/D49ViF1mfEaqvddnKTvhXNBQgd4FChOH5m4K5TnaG/jBBCZ01ITour
	c8GQwW1lU5TT0A2esYEpwJLaGTzfHv8v3MLlsmNG4kGcfVb1wmp0iZGvhXwvyXZFGxkFlgZ2adP
	pjftbin78p6lx/pZvDPY5N01YyHCpdYcjPhlfGog9cauosEFFe6qYDtIceDJO+dELfQn0+uH2wu
	wuvLJw2xjg6Y0JAC0MqdUGVKi+mLABvOo7rF3cWSIqCTaKg03T9931t16fxdUYCmxWzR2Q994VJ
	+EqseX6WMV42GjniqOSc+YHGEjw==
X-Google-Smtp-Source: AGHT+IEnD7AFEZckYuKmwsfHwGsLYjywTkpmWOaoTd6kF/ELxj955HQ/ZSBaFJSZRs3aRwI14ePC2g==
X-Received: by 2002:a05:6512:10d5:b0:553:25f4:695a with SMTP id 2adb3069b0e04-55366bdf719mr23052e87.22.1749145987747;
        Thu, 05 Jun 2025 10:53:07 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379379c2sm2641210e87.251.2025.06.05.10.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:53:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 05 Jun 2025 17:53:02 +0000
Subject: [PATCH v2 09/12] media: uvcvideo: Add uvc_ctrl_query_entity helper
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-uvc-orientation-v2-9-5710f9d030aa@chromium.org>
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

Create a helper function to query a control. The new function reduces
the number of arguments, calculates the length of the operation and
redirects the operation to the hardware or to the entity private
functions.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 81 ++++++++++++++++++++--------------------
 1 file changed, 41 insertions(+), 40 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index b2768080c08aafa85acb9b7f318672c043d84e55..21ec7b978bc7aca21db7cb8fd5d135d876f3330c 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -576,6 +576,34 @@ static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc15 = {
 				  V4L2_CID_POWER_LINE_FREQUENCY_DISABLED),
 };
 
+static int uvc_ctrl_query_entity(struct uvc_device *dev,
+				 const struct uvc_control *ctrl, u8 query,
+				 void *data)
+{
+	u16 len;
+
+	switch (query) {
+	case UVC_GET_INFO:
+		len = 1;
+		break;
+	case UVC_GET_LEN:
+		len = 2;
+		break;
+	default:
+		len = ctrl->info.size;
+	}
+
+	if (query == UVC_GET_CUR && ctrl->entity->get_cur)
+		return ctrl->entity->get_cur(dev, ctrl->entity,
+					     ctrl->info.selector, data, len);
+	if (query == UVC_GET_INFO && ctrl->entity->get_info)
+		return ctrl->entity->get_info(dev, ctrl->entity,
+					      ctrl->info.selector, data);
+
+	return uvc_query_ctrl(dev, query, ctrl->entity->id, dev->intfnum,
+			      ctrl->info.selector, data, len);
+}
+
 static const struct uvc_control_mapping *uvc_ctrl_filter_plf_mapping(
 	struct uvc_video_chain *chain, struct uvc_control *ctrl)
 {
@@ -1222,35 +1250,27 @@ static int uvc_ctrl_populate_cache(struct uvc_video_chain *chain,
 	int ret;
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
-		ret = uvc_query_ctrl(chain->dev, UVC_GET_DEF, ctrl->entity->id,
-				     chain->dev->intfnum, ctrl->info.selector,
-				     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
-				     ctrl->info.size);
+		ret = uvc_ctrl_query_entity(chain->dev, ctrl, UVC_GET_DEF,
+					uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
 		if (ret < 0)
 			return ret;
 	}
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) {
-		ret = uvc_query_ctrl(chain->dev, UVC_GET_MIN, ctrl->entity->id,
-				     chain->dev->intfnum, ctrl->info.selector,
-				     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN),
-				     ctrl->info.size);
+		ret = uvc_ctrl_query_entity(chain->dev, ctrl, UVC_GET_MIN,
+					uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
 		if (ret < 0)
 			return ret;
 	}
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX) {
-		ret = uvc_query_ctrl(chain->dev, UVC_GET_MAX, ctrl->entity->id,
-				     chain->dev->intfnum, ctrl->info.selector,
-				     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX),
-				     ctrl->info.size);
+		ret = uvc_ctrl_query_entity(chain->dev, ctrl, UVC_GET_MAX,
+					uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
 		if (ret < 0)
 			return ret;
 	}
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES) {
-		ret = uvc_query_ctrl(chain->dev, UVC_GET_RES, ctrl->entity->id,
-				     chain->dev->intfnum, ctrl->info.selector,
-				     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES),
-				     ctrl->info.size);
+		ret = uvc_ctrl_query_entity(chain->dev, ctrl, UVC_GET_RES,
+					uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
 		if (ret < 0) {
 			if (UVC_ENTITY_TYPE(ctrl->entity) !=
 			    UVC_VC_EXTENSION_UNIT)
@@ -1291,16 +1311,7 @@ static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
 		return 0;
 	}
 
-	if (ctrl->entity->get_cur)
-		ret = ctrl->entity->get_cur(chain->dev, ctrl->entity,
-					    ctrl->info.selector, data,
-					    ctrl->info.size);
-	else
-		ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
-				     ctrl->entity->id, chain->dev->intfnum,
-				     ctrl->info.selector, data,
-				     ctrl->info.size);
-
+	ret = uvc_ctrl_query_entity(chain->dev, ctrl, UVC_GET_CUR, data);
 	if (ret < 0)
 		return ret;
 
@@ -2164,11 +2175,8 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
 			continue;
 
 		if (!rollback)
-			ret = uvc_query_ctrl(dev, UVC_SET_CUR, ctrl->entity->id,
-				dev->intfnum, ctrl->info.selector,
-				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
-				ctrl->info.size);
-
+			ret = uvc_ctrl_query_entity(dev, ctrl, UVC_SET_CUR,
+				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
 		if (!ret)
 			processed_ctrls++;
 
@@ -2570,13 +2578,7 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
 	if (data == NULL)
 		return -ENOMEM;
 
-	if (ctrl->entity->get_info)
-		ret = ctrl->entity->get_info(dev, ctrl->entity,
-					     ctrl->info.selector, data);
-	else
-		ret = uvc_query_ctrl(dev, UVC_GET_INFO, ctrl->entity->id,
-				     dev->intfnum, info->selector, data, 1);
-
+	ret = uvc_ctrl_query_entity(dev, ctrl, UVC_GET_INFO, data);
 	if (!ret) {
 		info->flags &= ~(UVC_CTRL_FLAG_GET_CUR |
 				 UVC_CTRL_FLAG_SET_CUR |
@@ -2654,8 +2656,7 @@ static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
 	info->selector = ctrl->index + 1;
 
 	/* Query and verify the control length (GET_LEN) */
-	ret = uvc_query_ctrl(dev, UVC_GET_LEN, ctrl->entity->id, dev->intfnum,
-			     info->selector, data, 2);
+	ret = uvc_ctrl_query_entity(dev, ctrl, UVC_GET_LEN, data);
 	if (ret < 0) {
 		uvc_dbg(dev, CONTROL,
 			"GET_LEN failed on control %pUl/%u (%d)\n",

-- 
2.50.0.rc0.642.g800a2b2222-goog


