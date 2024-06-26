Return-Path: <linux-gpio+bounces-7696-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53305917820
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 07:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7700D1C20E40
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 05:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0304143C70;
	Wed, 26 Jun 2024 05:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8bzT3gV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A1E3C463;
	Wed, 26 Jun 2024 05:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719379788; cv=none; b=gRPQPnZA6ftiqqB2F/CSzbbmrCEJj6kWYUQygf+sMRT4+Gxx4hayQK+ngyNgFv9wNm22mXJuF9YP6KIyVEDSusfd0/DmZS4H94RSCNKwDtkHgq4K7C0vg71HELuH8S/Rg6oNh+0zUgGA+uRUD7hoDOvFFcvR6lwwiRm1tC8Znhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719379788; c=relaxed/simple;
	bh=d1Ru6Gtk5I3b0V5nJ36RVm63btvPvgdVLQTAwHf0MPs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KRWkC2YZFya6ihw/TrOwNv59pehO2vbAo9ZqY+8x8GD0JLiuRlR6lT2EyJAdA/pMv5ci3R2sMkOxzxc0j1BkqvSMeiYlW+I24VVFxv4I0Xp/CtNgFiEHcwWez1FCd6SybeZTWuM0tuwzmwWAqlFtVWjUeWJA2zQh9sOiz2pO6iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8bzT3gV; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7065e2fe7d9so3396427b3a.3;
        Tue, 25 Jun 2024 22:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719379786; x=1719984586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5nqx7BHy6rJlWMySteyHdWT11os3qiUN4VHjcEhwA4=;
        b=a8bzT3gVshlwHelomzZK910fhB+QrsD6yJbLEjil2POVppzESVaodM02aBuPPN5Ixb
         UlNpGpOIMZi6vD6GhtX2+M5Hchy23LuScsetOXs9qBbUYOW9d6wOY/or8PpVHjAPG/e+
         j4tRGlLg6IYrIE1Ef4QcWRNQoB+xo6rnPwsZocKwRAU7gqEzMsIRMOXgo8QKqHh4gO0X
         wV2ZBsfSQPdkCywvZkqTZ8GfLdGneRPRze6D8oHifDZlKoy2B2oJsYZ2/rx2uFs4nBpk
         HiVC8BAto9vV3of7y0HH+NEzLKnL0Qf7CHQqa2tfZxxMIesXc8fjiCsB/LW7BGFlme1X
         573w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719379786; x=1719984586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5nqx7BHy6rJlWMySteyHdWT11os3qiUN4VHjcEhwA4=;
        b=DQVRuxAQsXF0TWMkTHCmCki6RpWjxUwNnY0YJqf8tMMn6+WEVJuSnnAuxfXzFHF35r
         L9dAArMnDOGb0toUcsFPlsCSyN0ZaEIZGF/9sViF8pd79yr2UEUnC29uLlJr54m4Cilv
         IdaMFt1pnhOGXT2TMJeZvTNMVkQ/huh8L5R8Ip0FLqvYshCE8vJBJevuPvLZ5OHnblrt
         KQm+uvejMw8rW/wHMkT7utzEjmxeZFdF1s7HPXwDKhq7LoI3Edhk5y2CtZ2Pvsu0hL1l
         jijLYimm2CS/2XdNkYb1ibrvxc/Nmd215pHaONmpsET34t4z0j9cFn9ne/KznQAjObkG
         CqjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGfzPlv+VxJB4I0tKn0yibqIF4Bij4PSHGelyRoHg52vBytuvQG5z3QRpBAYp/eo5mbcjZrF2qG+0BeDJaMVopCSXpGtM12dbzHA==
X-Gm-Message-State: AOJu0YwvOaVjCrBexUhuNsD4Oxbvec5qj6zJ6AxFL1iLhEjlRoKH6JJ+
	xQ32ARqdh6tGSKdDZA1AXse10Z0d0KeUs2JEn0gGucZUgVtZsHwQgEE+Iw==
X-Google-Smtp-Source: AGHT+IG7o63rWxast+RVPWKxgBIQwtxFTHyWsdOgJ2HHBFpRmEj/ETj31UDVDezt3PUk75LBD1ejqg==
X-Received: by 2002:a05:6a00:138a:b0:706:381e:318c with SMTP id d2e1a72fcca58-7067459db3amr13473558b3a.7.1719379786089;
        Tue, 25 Jun 2024 22:29:46 -0700 (PDT)
Received: from rigel.home.arpa ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70661b9f2f6sm7804000b3a.187.2024.06.25.22.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 22:29:45 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 1/4] gpiolib: cdev: Disallow reconfiguration without direction (uAPI v1)
Date: Wed, 26 Jun 2024 13:29:22 +0800
Message-Id: <20240626052925.174272-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240626052925.174272-1-warthog618@gmail.com>
References: <20240626052925.174272-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

linehandle_set_config() behaves badly when direction is not set.
The configuration validation is borrowed from linehandle_create(), where,
to verify the intent of the user, the direction must be set to in order
to effect a change to the electrical configuration of a line. But, when
applied to reconfiguration, that validation does not allow for the unset
direction case, making it possible to clear flags set previously without
specifying the line direction.

Adding to the inconsistency, those changes are not immediately applied by
linehandle_set_config(), but will take effect when the line value is next
get or set.

For example, by requesting a configuration with no flags set, an output
line with GPIOHANDLE_REQUEST_ACTIVE_LOW and GPIOHANDLE_REQUEST_OPEN_DRAIN
requested could have those flags cleared, inverting the sense of the line
and changing the line drive to push-pull on the next line value set.

Ensure the intent of the user by disallowing configurations which do not
have direction set, returning an error to userspace to indicate that the
configuration is invalid.

And, for clarity, use lflags, a local copy of gcnf.flags, throughout when
dealing with the requested flags, rather than a mixture of both.

Fixes: e588bb1eae31 ("gpio: add new SET_CONFIG ioctl() to gpio chardev")
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 1cb952daacfb..f7a129d67b7d 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -89,6 +89,10 @@ struct linehandle_state {
 	GPIOHANDLE_REQUEST_OPEN_DRAIN | \
 	GPIOHANDLE_REQUEST_OPEN_SOURCE)
 
+#define GPIOHANDLE_REQUEST_DIRECTION_FLAGS \
+	(GPIOHANDLE_REQUEST_INPUT | \
+	 GPIOHANDLE_REQUEST_OUTPUT)
+
 static int linehandle_validate_flags(u32 flags)
 {
 	/* Return an error if an unknown flag is set */
@@ -169,21 +173,21 @@ static long linehandle_set_config(struct linehandle_state *lh,
 	if (ret)
 		return ret;
 
+	/* Lines must be reconfigured explicitly as input or output. */
+	if (!(lflags & GPIOHANDLE_REQUEST_DIRECTION_FLAGS))
+		return -EINVAL;
+
 	for (i = 0; i < lh->num_descs; i++) {
 		desc = lh->descs[i];
-		linehandle_flags_to_desc_flags(gcnf.flags, &desc->flags);
+		linehandle_flags_to_desc_flags(lflags, &desc->flags);
 
-		/*
-		 * Lines have to be requested explicitly for input
-		 * or output, else the line will be treated "as is".
-		 */
 		if (lflags & GPIOHANDLE_REQUEST_OUTPUT) {
 			int val = !!gcnf.default_values[i];
 
 			ret = gpiod_direction_output(desc, val);
 			if (ret)
 				return ret;
-		} else if (lflags & GPIOHANDLE_REQUEST_INPUT) {
+		} else {
 			ret = gpiod_direction_input(desc);
 			if (ret)
 				return ret;
-- 
2.39.2


