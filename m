Return-Path: <linux-gpio+bounces-37243-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKZsApCVDmrJAQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37243-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 07:18:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3BE59F016
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 07:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C531A30A390B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 05:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8340348896;
	Thu, 21 May 2026 05:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rGicEzlN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAFE33AD9C
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 05:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779340433; cv=none; b=PR2yoMm12Xh7lC1puQZOzP1SYxj9Hticw6o0b7MWfK6ecQNuoVEX9dgsXWBB3Z2zig9nvkJTc+h1phGOcc0AVN41i7Au8FfE4Ndrx2d+vdRtLFIORj0wuUvcZwJxzWZztN2OJoi9YndrhhF0rj9naAjMMNdNZYPUc+ph70plCfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779340433; c=relaxed/simple;
	bh=an2XKnw/6oNRYjivHk/fQLnrkcFYlk+CGyiYpwsGnhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=svxMXtHFq3RMnE8CsLTUDhya8yjvUac2y2ca0K4jQL7tjaI5MyHWnaeyi5UL045BLR39OT5CsROIyyr1cgAJCe1/eSVjDl1TYFPbxuuefoflToHLXFTQMMarhm1fTHlb6lgG91H/fXsRmrN+pn6rnlt2Cmeiz2ZUdPaT/Gvdkyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rGicEzlN; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-135e88b8e55so5933785c88.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 22:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779340428; x=1779945228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXtisoK8i0cyvAoaHE4OQcmxs5XHz2jUEn0crM4CfGY=;
        b=rGicEzlN0+rPvLzs2LJWdzLTUITPl1rN1vFbp0zx6DzbNTMvckrFBzx/F4QPebU/cx
         FnVXxCqrEHyhWikzXiHKAqbMawHlgObfqzS9NVzlL0uU39hORU6sg7BU3bin87f9OJvR
         +o4gRlS5rKrZW2AfAv4BszP3A/Geg35oBzi1eT8HCEB4L/yNZeisIWdy3A9gFK5HiLqH
         hb5WTYZDE5BSbsepGk0b6m+gdkfVKTPt9J0nzZgLhGfhfBauBK6Cof4ATNIujg9OvPtH
         tz3EyZBea2JcLdK1A7tV9ZTARNx4k9YklHOI4ZDcSu5s8F/jSq3RWblnqdlzsnN/x3hh
         13Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779340428; x=1779945228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pXtisoK8i0cyvAoaHE4OQcmxs5XHz2jUEn0crM4CfGY=;
        b=NwzGlHMV/UXIpE00DtvKNnfyJr9ix+fy5JWCbp+KWuVp5cWheIXas4Ql3jVb+Zc1a5
         BAHkFOt5fBRaaPs8eSHkjS6i6nqaR0UGIJyypWjSiFY7rG+L51i6NfTtCSXWZHtcr2MW
         nGcanRm2zHpBS/R0kUYo9DXY0vNwIMuIUje6EB8gujY+Pk//wB4ve729vUSpGxU/GBgm
         F9xWKzK8iM+6YskDfMvPftEdtEQMYuQp3m9tuArwU8y2pH9iXqHQOXAW6U01QJF0gIMc
         PqTqFDBFS+EaqkF09nzl0jjTkwyq9CQO9wmK7m41jT8v++8/e158PU18qTsXoYLKrA/9
         7Ifw==
X-Forwarded-Encrypted: i=1; AFNElJ87Y5Qqzt23oK/qQZB72FX3PYYCQqbbplLrQLeJ56uEXONXSbfw+enGRDh+FmobN9NlWvvVSk6F44+E@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ4InRD6tnfY3AGq0cTvWFgpT7ib5NhS866OOG+wdQwGBa/MCd
	+w1x9ZsNGNfz2hojruYNq+SeW+p6LvhqDIkbbf+TTlwNnnS4Boa+JE2wmHsXLA==
X-Gm-Gg: Acq92OHpAiEPzTFrEMNConQg6aauv+PHHSXvYAU1SrBeZWyfyNBz1PWY3R6jVgSBvxE
	WI35939Zr9Nl5aJ07nwnQbLLF9uKI3Y4UYHrf1E0TaUX5YM1mll51sc4mmSfpZY3dvm3LMUn9r/
	J86H/2Lc7aL11DwpVQt+yAFN6OIGWnSN4UcmQk59wtvi/ZhZc9V7q+GLp0czDFwYXPJnn+iL9n7
	F/z91zxean5jq1a4agWzLF2SZ9bl0XNTNK58GYtYpHQSvO/OXwc6LugyRjpbwY92iU/db+Ks7GN
	kHL0hnFL9j1563r7gOkg8WiJK915MA8GrOAeOi/3bRM3K0GNMkKD442btRGa6QGKGvXAFXue0/4
	8oX4RjTp4Mcf2EnkpgYlrOw6AGPVg+Jd4IY5SVaInH1MZI3RSl0dnu9+YdDwbkW+3PIDdEXvof4
	JRXaR6TPo6JMqedGrx69epyYjkSA3snJhMocnf3RRVQxSSX/U4Nr+KnjXskNNWTlPyKKp9bczGT
	9AoSbbXuMloxA==
X-Received: by 2002:a05:7022:61a1:b0:12d:b26f:cafd with SMTP id a92af1059eb24-13632a02cf3mr857042c88.5.1779340423478;
        Wed, 20 May 2026 22:13:43 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d457:597:d576:1eb8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-135e5c0a918sm6231360c88.14.2026.05.20.22.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 22:13:42 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 20 May 2026 22:13:18 -0700
Subject: [PATCH v2 2/5] sh: pfc: attach software node to the GPIO chip
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-rsk7203-properties-v2-2-465f3308021b@gmail.com>
References: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
In-Reply-To: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
To: Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16-dev-6911d
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37243-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sh_pfc_device.name:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5F3BE59F016
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With commit e5d527be7e69 ("gpio: swnode: don't use the swnode's name as
the key for GPIO lookup") gpiolib requires that firmware nodes from the
GPIO references to match firmware node in gpiochip structure.

Define a software node for the pfc gpiochip so that it can be referenced
by boards using static device properties.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/sh/include/cpu-common/cpu/pfc.h |  3 +++
 arch/sh/kernel/cpu/pfc.c             | 20 ++++++++++++++------
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/arch/sh/include/cpu-common/cpu/pfc.h b/arch/sh/include/cpu-common/cpu/pfc.h
index 879d2c9da537..d57e38c05bdb 100644
--- a/arch/sh/include/cpu-common/cpu/pfc.h
+++ b/arch/sh/include/cpu-common/cpu/pfc.h
@@ -11,6 +11,9 @@
 #include <linux/types.h>
 
 struct resource;
+struct software_node;
+
+extern const struct software_node pfc_gpiochip_node;
 
 int sh_pfc_register(const char *name,
 		    struct resource *resource, u32 num_resources);
diff --git a/arch/sh/kernel/cpu/pfc.c b/arch/sh/kernel/cpu/pfc.c
index 062056ede88d..5a8d804d607b 100644
--- a/arch/sh/kernel/cpu/pfc.c
+++ b/arch/sh/kernel/cpu/pfc.c
@@ -5,21 +5,29 @@
  * Copyright (C) 2012  Renesas Solutions Corp.
  */
 
+#include <linux/err.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #include <cpu/pfc.h>
 
-static struct platform_device sh_pfc_device = {
-	.id		= -1,
+const struct software_node pfc_gpiochip_node = {
+	.name = "sh-pfc",
 };
 
 int __init sh_pfc_register(const char *name,
 			   struct resource *resource, u32 num_resources)
 {
-	sh_pfc_device.name = name;
-	sh_pfc_device.num_resources = num_resources;
-	sh_pfc_device.resource = resource;
+	struct platform_device_info pdev_info = {
+		.name		= name,
+		.id		= PLATFORM_DEVID_NONE,
+		.res		= resource,
+		.num_res	= num_resources,
+		.swnode		= &pfc_gpiochip_node,
+	};
+	struct platform_device *pdev;
 
-	return platform_device_register(&sh_pfc_device);
+	pdev = platform_device_register_full(&pdev_info);
+	return PTR_ERR_OR_ZERO(pdev);
 }

-- 
2.54.0.669.g59709faab0-goog


