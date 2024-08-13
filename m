Return-Path: <linux-gpio+bounces-8727-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2095E95013F
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 11:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D20DF28109C
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 09:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 401C9170A0C;
	Tue, 13 Aug 2024 09:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KvuCNP3l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8F98BF3
	for <linux-gpio@vger.kernel.org>; Tue, 13 Aug 2024 09:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723541433; cv=none; b=XHh2Ge+Sk8jI3iHqrXAiip246sGXqxOiPsnhTMmq8SXhFpBW37LQJMA9xyvn0p0WCxtJzEjqO5sqszvdQ6mwacjmh53ImFEIU9pjqRsbvzc7XVDAMGg6csJECYltFDY2kT/VpYXd0lkJubQUcR0X/CTsH+1KyOnIEAnTrOTpwJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723541433; c=relaxed/simple;
	bh=80FZz/hS5yVjf6Ez49T7vv4o9Yn+9ptPalWyH4EwjQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ST6FBj7Qyv7gsN9IvxHTzTi/46cwWvh8bZTP7b7oKI+hAZhqcUFW4BnWy52XaRKgJfQQP92kvRZ1cSX4/zVwAfTKQ2daP7apUy0CEP+8gT5KCMRRApfbTcFf2PD7LaO2IFS9io6dlDVNsoTsSyhqhyNVN0J5K7ExXXGV7VrHC3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KvuCNP3l; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-429d2d7be1eso8742665e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Aug 2024 02:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723541429; x=1724146229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6nHkbAix24aIbU1Db3KFLjAn+eHa7Mmg6IhQWu9uG68=;
        b=KvuCNP3lWatKn11DC4C7K3GW1qElmv7vgrcI9fZevBUPc9fEj+bRc61UxltPOTKgMd
         CQJxBMxDQa8YyjVUWRm/wh4Me1X9DNMLKdlk2YBYffFji5O/6FUYANLlhINcaXlfb4Ut
         MYX6aKjAuNQULjz6fZoHrqTEsdOTBpHDHITmWvTFE3Us77avuG26QfYVamelzG4AmkK5
         RhZClPYCql8prVslovW77I/6DE7NfS+YlN634B93CHKhb+g3HrvevC4LddZuGoZxHd5r
         ilU62GBqhFiDP8NyxEifIQOxwDt93HZKBJepOrnBdY4xM+sqHEnVNVVM6LlBQxV45Hq7
         TaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723541429; x=1724146229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nHkbAix24aIbU1Db3KFLjAn+eHa7Mmg6IhQWu9uG68=;
        b=BbKLj5hJoNl5AFVh3rP/LJiKSU3V2xw1cnGL3nbvZFbVDVnpy4pUux/cWF2W8OV/Hz
         G+nIbPf0+YaJ3IUHh14mWMLQbgiXqEg37y/Rz/SE3dHnagJ+bTZWZzAdlEVfZueYFTPO
         7lY5J/+8KViH5ftsBiVc3eMe0u0zhEnfLBb/eUvGoYSliqlzvPNFkmOiSZqYfOX2LVeR
         2ZMOgU/s6n6/2s1MeIDxmIXR1+hmivg/qLdJpYPczJP/Te3/NX61vzwlvI5GjgWON/jm
         +tAjH+H2hUEyOw+FPmrz1c44HN053mp/62ed8RlZFxrCgxUG+Od9xBqY9dNvPlKASTKj
         fxyQ==
X-Gm-Message-State: AOJu0Yy3CvpeXci7Zl33bRYG3FzahfmEl6O5sUQZ9U4tlsrIdQn1e+9D
	IoCE372DwLjMz4LYq3LQUHWquZpUZFw0ZwIjS4A6FniXwZnUPivpCvX6SO0hSfQ=
X-Google-Smtp-Source: AGHT+IHzrYN75+EtskRjTMkf9miM+ByYfisiGMniYX0E7ChIiFxBqdysy/mavMhRiAmNieaBpJLfLQ==
X-Received: by 2002:a05:600c:19c9:b0:424:a7f1:ba2 with SMTP id 5b1f17b1804b1-429d62fe113mr18102425e9.17.1723541429037;
        Tue, 13 Aug 2024 02:30:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3979:ff54:1b42:968a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4e51ec39sm9609442f8f.80.2024.08.13.02.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 02:30:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Philip Withnall <philip@tecnocode.co.uk>
Subject: [libgpiod][PATCH] tests: don't use g_value_set_static_string() for non-static strings
Date: Tue, 13 Aug 2024 11:30:25 +0200
Message-ID: <20240813093025.94980-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As pointed out by Philip Withnall, g_value_set_static_string() must only
be used with actual static strings and not with ones whose life-time is
tied to that of their owner. Use g_value_set_string() to get the gpiosim
properties and rework the existing getter functions returning const
gchar * to return the address provided by libgpiosim directly instead of
passing through the GObject property path.

Suggested-by: Philip Withnall <philip@tecnocode.co.uk>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tests/gpiosim-glib/gpiosim-glib.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/tests/gpiosim-glib/gpiosim-glib.c b/tests/gpiosim-glib/gpiosim-glib.c
index 4eaeace..27ce019 100644
--- a/tests/gpiosim-glib/gpiosim-glib.c
+++ b/tests/gpiosim-glib/gpiosim-glib.c
@@ -245,12 +245,11 @@ static void g_gpiosim_chip_get_property(GObject *obj, guint prop_id,
 
 	switch (prop_id) {
 	case G_GPIOSIM_CHIP_PROP_DEV_PATH:
-		g_value_set_static_string(val,
-				gpiosim_bank_get_dev_path(self->bank));
+		g_value_set_string(val, gpiosim_bank_get_dev_path(self->bank));
 		break;
 	case G_GPIOSIM_CHIP_PROP_NAME:
-		g_value_set_static_string(val,
-				gpiosim_bank_get_chip_name(self->bank));
+		g_value_set_string(val,
+				   gpiosim_bank_get_chip_name(self->bank));
 		break;
 	default:
 		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
@@ -396,27 +395,14 @@ static void g_gpiosim_chip_init(GPIOSimChip *self)
 	self->hogs = NULL;
 }
 
-static const gchar *
-g_gpiosim_chip_get_string_prop(GPIOSimChip *self, const gchar *prop)
-{
-	GValue val = G_VALUE_INIT;
-	const gchar *str;
-
-	g_object_get_property(G_OBJECT(self), prop, &val);
-	str = g_value_get_string(&val);
-	g_value_unset(&val);
-
-	return str;
-}
-
 const gchar *g_gpiosim_chip_get_dev_path(GPIOSimChip *self)
 {
-	return g_gpiosim_chip_get_string_prop(self, "dev-path");
+	return gpiosim_bank_get_dev_path(self->bank);
 }
 
 const gchar *g_gpiosim_chip_get_name(GPIOSimChip *self)
 {
-	return g_gpiosim_chip_get_string_prop(self, "name");
+	return gpiosim_bank_get_chip_name(self->bank);
 }
 
 GPIOSimValue
-- 
2.43.0


