Return-Path: <linux-gpio+bounces-26818-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 199BDBBDDD5
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 13:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8E543B2E5E
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 11:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA18A26D4E8;
	Mon,  6 Oct 2025 11:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mEe7bP8x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBA626CE0F
	for <linux-gpio@vger.kernel.org>; Mon,  6 Oct 2025 11:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759750092; cv=none; b=cXVP9g5daA7aFAKiE7yKqFsfKy2r/18lDY9N9A/Gah/g0OpQYu3l8h+Q1jbTV+STcxuu2v4T4bytsUCbEaF8jmDD8DMOUyzZnVSoSEPwC9/xOZNR3ItWQe9t+VUUvkLkkWPvDpksSEG4lX0iYTXtbIMj6D6emtsa6qeBsGAYmH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759750092; c=relaxed/simple;
	bh=HHZ/eBNbvGcRT6TMFpyQS8yBnwlAqJaHgiHmyBcSWHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T6Zh6aPB4oTgZKXwmhxMaMTNnfF6BN1iGW4WZ9X6TbFFh7WX/tPSnEe6VITxHDv97OffrQud+vrrlfguhF9KuqABxbsYn4fu7ODjkiG7ljK6TOrketejsssrUY0Tle/AMHOSiYa5AiIG9JXTcHOC062vZOOqHC5sQGwZ1rVtpF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mEe7bP8x; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e3af7889fso29338885e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 04:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759750089; x=1760354889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8nDm2DXitfWvJYumI5WxBWB/qlMttNwtQw4Ssb9jgo=;
        b=mEe7bP8xq4q6Cao4UzNmXM0dJHiwlPaCLLwm4cyuOV3Ghq0v1MzOd+acLveX4NI14w
         /idLjr8tvEwn6MzvO6qBvO2APKMTGO0FS+SWggxx+BP+64R2l829/9k27ghDbvrR/wFB
         UUr+bT/VOsZ33wJAs59hxAj5BCtjp8AD3rJm6YDSCjD5s2rmu2b5q5cUDiiJxue1bvPF
         ClFxka/zlybV4IAndeajp8yp45bK7DIJX2n06eTbalPHyMOay473Zgr8ZIbGJB59Py5U
         YU1DsTV0sC2TZqjQdKzpPHm50UMsYL76RIDdGVnTr/MpF09M0Zbc3+rpAQnbMrxrWt6D
         DjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759750089; x=1760354889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8nDm2DXitfWvJYumI5WxBWB/qlMttNwtQw4Ssb9jgo=;
        b=U3f6+crb/MksGoaT6ZJvDKwYZ4/j+GUyNdewhimDr2cOEbWZbXqcYNdIP5+7KSSWFT
         0CkogWLlJ8tMvm0n9mirv6L0liiilnDVSIIPKE6u2FUDXpf0LDQwhy6folPLxUD8lDRM
         0UgEtnrrJUS+bKmiY3MgBR7y01is3CVY1Tb73L0LsnlvRYyzcrMwgF/fEdEIcbf2X/AL
         tu9JFAatkEP3oXGno9g/PlirUqPJWxQXjzaswef3MM6NQKKNuJzgWsfbxXidqvEUaGA/
         kx2cSs88rJnLT1yydAUWcTV+rOYGYrKcWHmb6t0Dm9aipB/DXgwT4DVic2hl5Lz3C/s4
         dAGg==
X-Gm-Message-State: AOJu0YzHcyGx8z7D6Bqqp+INM7ITs888FAxfizlqVx6YYsuOLuy5jcwN
	T4eg0A5hj6dwDa+BWdrKQWPZ7qIu0ElEsU0VLg6kgcGlttTkB4KydCLpgIe5dfXDQfw=
X-Gm-Gg: ASbGnctT17mCVm4kBd4Q3/0qkxEddUS7Q+4cs0NkTPx2xXn7nRNbTAMSIe1g5RBrcbM
	OeL+gR9yC173LVqDvP9UeKmzxGC8vBfYe6l45lCGJi+w3M8o6pPacz36FfdMzEqW0Dum2jbTwLC
	+UUI8uSMu/avEJDbqnb5BGXDJBZwx+iTx3aiAW9Dbf2T5n8NiUE5GRvgO6qZ8O9VkzSqlsDl8NQ
	6cTweEz6i2zJYfLaDILrN8a53T78ZKazA82LNMSNPy/zZOg2aKwKPnuMynph3oTgBEStWUJ1RmJ
	JNpY73pn0LT30b9hl/s3vOnptsOnoawDwV8+sgSz5swlpfD8OR0jzCWfWQNAgUMu7taBGWgvrBv
	IPznN0dyRQ4qS3vuh3YIJcermg42QkFWqZ4/S7yEMxDO5oB4mf81I/lg4+aN5D9c=
X-Google-Smtp-Source: AGHT+IHMBXqeOX1PeXgydeSgdIl5gEFKT293OyvH+l1kOt7d2+WSNNCnBlFDznr1GJr1QJI5k3ewwQ==
X-Received: by 2002:a5d:584b:0:b0:3ee:1461:1659 with SMTP id ffacd0b85a97d-425671c0bf0mr7267673f8f.31.1759750088603;
        Mon, 06 Oct 2025 04:28:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ed2b:276f:1a72:aac0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f017esm21078167f8f.47.2025.10.06.04.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 04:28:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 06 Oct 2025 13:27:51 +0200
Subject: [PATCH libgpiod 6/7] tests: harness: support setting invalid lines
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-gpiosim-valid-lines-v1-6-b399373e90a9@linaro.org>
References: <20251006-gpiosim-valid-lines-v1-0-b399373e90a9@linaro.org>
In-Reply-To: <20251006-gpiosim-valid-lines-v1-0-b399373e90a9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3690;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5ScE91fVOiVXbNiY5HC8BFbT9LX6dYICyLv2qEmYPdg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo46e+Zo7EtAlqY6Pu4wZhX9+Cp+rQxoEqjqPN0
 Diet9LDICKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOOnvgAKCRARpy6gFHHX
 csrVD/4/vFQe50BQCb/+TYwM8oLeQtKijzB4aN+MucKnFktebQJrJyg2A7ZmfXuSRBV8vjmlngT
 8A2oSOxJD0ciud1FK1ybjxA+cELccwp9KpvznDF2pKxCp7b8fubewIUFxs2DzmrtRcf/3OJlOK6
 Jn4a40R+AkG/0lhNWJ8D4YGCNreLYK4OZWxedLtinvIpFwtpbG18alFBAd9m5DtcKM6YWiHp6/B
 xzNHSf3ZlbnK4P6IDI/ezvtVTnt0xRHd1qHF+occRmul2+lxvimxpd5g9cn5Bl24h4a+SZRtDqY
 j0RM7PiV6fGnU3l3oNKwRaym+oePZARbUlo8qHl5vCEV9caXFOM45T+AocBhS9iLFEjyJZDPt5c
 P4hB/TU+Mu9ocuEfBIAQUYcZdIpDG6UHgsCb/TDAAxs9J3xq+MeMMkOUr64ZHwKUiIVIOv9C6GU
 NOZe0RY/4o5MNOD4T3tDkgpVRb4y91mKySYhi5+Bz2yDWfEmTmKlA+CgjbvfrUMdF58A/BlO0kE
 oPafJmdjlpO4/WS7KRWBaa/2Z73zRmZg0X1e/EK+Mz+kuDf4EbEW68giNaa+prRHtCCL2/aNJ3z
 E1QpD8kcuQm0c3VVHNwtDOaRBw6nvRj2b+dg8WcrFFBkPGZO+xGzwrrDrH1SAyPZoGPFzBkrnVE
 Z5FLGIxPq+YnPcA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Wrap the new gpiosim_bank_set_line_valid() symbol exported by libgpiosim
in a GLib property and allow libgpiod tests to mark simulated lines as
invalid.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tests/gpiosim-glib/gpiosim-glib.c | 45 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/tests/gpiosim-glib/gpiosim-glib.c b/tests/gpiosim-glib/gpiosim-glib.c
index dd56d91735cb3e78c219addf44ccd6ddba7fd0d2..34073c21fd28b702c89bf30245e684de4bf8d5a2 100644
--- a/tests/gpiosim-glib/gpiosim-glib.c
+++ b/tests/gpiosim-glib/gpiosim-glib.c
@@ -3,6 +3,7 @@
 
 #include <errno.h>
 #include <gpiosim.h>
+#include <stdbool.h>
 #include <stdlib.h>
 #include <unistd.h>
 
@@ -18,6 +19,7 @@ struct _GPIOSimChip {
 	gchar *label;
 	GVariant *line_names;
 	GVariant *hogs;
+	GVariant *invalid_lines;
 };
 
 enum {
@@ -27,6 +29,7 @@ enum {
 	G_GPIOSIM_CHIP_PROP_LABEL,
 	G_GPIOSIM_CHIP_PROP_LINE_NAMES,
 	G_GPIOSIM_CHIP_PROP_HOGS,
+	G_GPIOSIM_CHIP_PROP_INVALID_LINES,
 };
 
 static struct gpiosim_ctx *sim_ctx;
@@ -130,6 +133,31 @@ static gboolean g_gpiosim_chip_apply_hogs(GPIOSimChip *self)
 	return TRUE;
 }
 
+static gboolean g_gpiosim_chip_apply_invalid_lines(GPIOSimChip *self)
+{
+	g_autoptr(GVariantIter) iter = NULL;
+	gboolean ret;
+	guint offset;
+
+	if (!self->invalid_lines)
+		return TRUE;
+
+	iter = g_variant_iter_new(self->invalid_lines);
+
+	while (g_variant_iter_loop(iter, "u", &offset)) {
+		ret = gpiosim_bank_set_line_valid(self->bank, offset, false);
+		if (ret) {
+			g_set_error(&self->construct_err, G_GPIOSIM_ERROR,
+				    G_GPIOSIM_ERR_CHIP_INIT_FAILED,
+				    "Unable to set simulated GPIO line as invalid: %s",
+				    g_strerror(errno));
+			return FALSE;
+		}
+	}
+
+	return TRUE;
+}
+
 static gboolean g_gpiosim_chip_apply_properties(GPIOSimChip *self)
 {
 	gboolean err;
@@ -159,6 +187,10 @@ static gboolean g_gpiosim_chip_apply_properties(GPIOSimChip *self)
 	if (!err)
 		return FALSE;
 
+	ret = g_gpiosim_chip_apply_invalid_lines(self);
+	if (!ret)
+		return FALSE;
+
 	return g_gpiosim_chip_apply_hogs(self);
 }
 
@@ -289,6 +321,9 @@ static void g_gpiosim_chip_set_property(GObject *obj, guint prop_id,
 	case G_GPIOSIM_CHIP_PROP_HOGS:
 		set_variant_prop(&self->hogs, val);
 		break;
+	case G_GPIOSIM_CHIP_PROP_INVALID_LINES:
+		set_variant_prop(&self->invalid_lines, val);
+		break;
 	default:
 		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
 		break;
@@ -301,6 +336,7 @@ static void g_gpiosim_chip_dispose(GObject *obj)
 
 	g_clear_pointer(&self->line_names, g_variant_unref);
 	g_clear_pointer(&self->hogs, g_variant_unref);
+	g_clear_pointer(&self->invalid_lines, g_variant_unref);
 
 	G_OBJECT_CLASS(g_gpiosim_chip_parent_class)->dispose(obj);
 }
@@ -385,6 +421,14 @@ static void g_gpiosim_chip_class_init(GPIOSimChipClass *chip_class)
 			"List of hogged lines and their directions.",
 			(GVariantType *)"a(usi)", NULL,
 			G_PARAM_WRITABLE | G_PARAM_CONSTRUCT_ONLY));
+
+	g_object_class_install_property(
+		class, G_GPIOSIM_CHIP_PROP_INVALID_LINES,
+		g_param_spec_variant(
+			"invalid-lines", "Invalid lines",
+			"List of offsets of lines not valid as GPIOs.",
+			(GVariantType *)"au", NULL,
+			G_PARAM_WRITABLE | G_PARAM_CONSTRUCT_ONLY));
 }
 
 static void g_gpiosim_chip_init(GPIOSimChip *self)
@@ -394,6 +438,7 @@ static void g_gpiosim_chip_init(GPIOSimChip *self)
 	self->label = NULL;
 	self->line_names = NULL;
 	self->hogs = NULL;
+	self->invalid_lines = NULL;
 }
 
 const gchar *g_gpiosim_chip_get_dev_path(GPIOSimChip *self)

-- 
2.48.1


