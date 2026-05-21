Return-Path: <linux-gpio+bounces-37241-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMpvAySVDmrcAQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37241-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 07:16:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A12959EFE0
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 07:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 503E930785FD
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 05:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CED035201E;
	Thu, 21 May 2026 05:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKhrjeO3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A75D335BBB
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 05:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779340429; cv=none; b=hFl6qVHXzEPackoA2z8BiqTSA3SNT3s1Ay8jG45NknBlOQQTVwqjShSx8mjORMzrma9GgCd6ezwVpoOyaODUyhXDIq6WeWGWb/lt2mUnak5puj5DbKqPuutm7/qVkxYjr1pjCytMSkrRDxHvh5vC4Q3W4EQZAvKlGKveQVD1gl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779340429; c=relaxed/simple;
	bh=a7LlH6SOmxH0p4iNAX3qrUusbYFuA/lKO8UCM5Mh+y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N39k9tYFHERPBVOTa1YLj9je/3Iy3nY2K4XegYAaqB44OosvL51LPsKLm2fJ907tcFd0/s4e49yj4sZWo9te6GYeG4/ExhSQVS9kEqLM7wLr1hXYR2cONTvG/HyrKSZq9zeqD6PNlFDx3bX58/KPUCEu18tMLtBZcJKOfI+glzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKhrjeO3; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-130c9dcbd25so4064633c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 22:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779340427; x=1779945227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7YPZxWestxZ6ZeoppNL4aB518UjR8C+o/ws24cKnfpM=;
        b=AKhrjeO3oWo3pW7+XGNc8WEgP/k6/fsJlceeHmT0JIHBANdMvdcP+6fa1aUfysrC9J
         wGdddDCExUc58mZV41UnZXpzz0k7DySu8idWofIDSS9LYgAd/6VOO9YW6ho9jI15i4hO
         XCkwZDvGFJGzOGYyUmmXCrG4fKn1QsQkeHparjLgXEgsc7jAg00ulnkbeYn+YPRdc0K5
         UF8Rq2m9TNDbv6DoqXf0To4Y4E9HFa+BaCrHlDVsp8ihqicQyYpeKwd/tod+krYIpW+A
         dDb/VsCFSbgO5PQCovYI+0/rD5CUYRxjNb24bK5K9nR8gjVfpKUkS4rTsy7MMkY834SA
         nIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779340427; x=1779945227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7YPZxWestxZ6ZeoppNL4aB518UjR8C+o/ws24cKnfpM=;
        b=gntHfc1fyOYL4c+ZBtVj4wmHbgS1u8ICzyK695gwRmlNco/M7XH7qiRD0Lg79wSHX4
         ZY+POBbyuzPxsMtQO7xCezFBF+VQZ9pmb7x+ywvp/gLn8InT3CIT8a5CLBh04yw06C81
         1jSmIlEztkSQ9hiuW0ao699dT9De657BfIqmyrD9E+qFcwE9tLhihv0osEG+yTA+duFc
         oNsnCpYwW3PTdXXDUZ4l/kZGfcWxrnot2dRcU3MO6qrM0JYZ9zWLj/o2vkrGQ5UFwWFH
         uSTsdCa85+yo1D54pYpq9jXDPQM7nRPcgkjOq13iqqAK9o9pbL4017XA1uZga1199Jn4
         cFiw==
X-Forwarded-Encrypted: i=1; AFNElJ/N/qW4Vho4xKIL6ezZXoFoz3DjZO9Kdw3/6QObvjwspgBakWP1wUkawaIfNpo5Njf6cShfnKcwUUxp@vger.kernel.org
X-Gm-Message-State: AOJu0YyH7MuEiTdmPj57s4whqZEqlJgH20ZFdQatz5vXUJGQAUuUnfYJ
	jpJFlOLpA6xj5+/3PZCYE5fZlA3SsqSJg9BCEbC7xE2skVhw9F361iA8l69ufQ==
X-Gm-Gg: Acq92OFc0WfR7DywqPDvvm5S7WS+Wjo6DdzrlJnBK7SkVUi/PywAh6aD/PjOvJBIc1R
	Hx3vlPdCDuEo4ca82ojnbLrcC3yMe8kUlh8xmp/pSDEQmFBfQENr1KgmPI5Ntcvf3WVgDYAC1Or
	9Uzi6hIt0/VN59LW5o7jewLoPhSY/eSOZ8d0C6Ffx+t4PpaJ1dNfEBNb/SLOrIHU5jV0LkMi82X
	m1sFEtYaP4aqr0FRhhqdVol+ZA/5a5hKtW6iInn3i/uSgryoiE3M1ax4b++SuRxMeSxtTVpyEeA
	qoc9/kW684nrtgtevuVcD6aPVV632bdMVzR8DxjOeGowawKmirnDyLUufKJOYPYQRG6L+pwQGc7
	PvGgQm4zL9v8jtfVPkBUMxCkN1SEbRJAINM4HDHvhLyvn3LJPxpmEc/JTYPW0x+nzULw0iaQnJi
	3dSWTY7hQ4COSkkAAmfBbj90PeL35Eo/NjXNEOeKY9jPGhl06kGdQqPfj1E40AUk+6WeCAt5ADj
	LK1AouUKW5RFkYIRgficqVi
X-Received: by 2002:a05:7022:f91:b0:129:1d25:f1da with SMTP id a92af1059eb24-13633a69b63mr617788c88.3.1779340426708;
        Wed, 20 May 2026 22:13:46 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d457:597:d576:1eb8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-135e5c0a918sm6231360c88.14.2026.05.20.22.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 22:13:45 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 20 May 2026 22:13:20 -0700
Subject: [PATCH v2 4/5] pinctrl: renesas: gpio: support software nodes for
 function GPIOs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-rsk7203-properties-v2-4-465f3308021b@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-37241-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9A12959EFE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch extends the sh-pfc GPIO driver to support software-node-based
configuration for the secondary 'function' GPIO chip.

While the primary GPIO chip typically uses the firmware node attached to
the parent platform device, the secondary chip should target a specific
child node to avoid ambiguity when defining GPIO hogs or properties.

Update gpio_function_setup() to look for a child node named 'functions',
but only when the parent is a software node. This ensures the behavior
is restricted to legacy platforms being migrated to software nodes.

Assisted-by: Gemini:gemini-3.1-pro
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/pinctrl/renesas/gpio.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/gpio.c b/drivers/pinctrl/renesas/gpio.c
index 4e59dadb7364..b49a3e14da91 100644
--- a/drivers/pinctrl/renesas/gpio.c
+++ b/drivers/pinctrl/renesas/gpio.c
@@ -271,18 +271,40 @@ static int gpio_function_request(struct gpio_chip *gc, unsigned offset)
 	return ret;
 }
 
+static void sh_pfc_fwnode_put(void *data)
+{
+	fwnode_handle_put(data);
+}
+
 static int gpio_function_setup(struct sh_pfc_chip *chip)
 {
 	struct sh_pfc *pfc = chip->pfc;
 	struct gpio_chip *gc = &chip->gpio_chip;
+	struct fwnode_handle *fwnode = dev_fwnode(pfc->dev);
 
 	gc->request = gpio_function_request;
 
+	if (is_software_node(fwnode)) {
+		fwnode = fwnode_get_named_child_node(fwnode, "functions");
+		if (fwnode) {
+			int ret;
+
+			ret = devm_add_action_or_reset(pfc->dev,
+						       sh_pfc_fwnode_put,
+						       fwnode);
+			if (ret)
+				return ret;
+
+			gc->fwnode = fwnode;
+		}
+	}
+
 	/*
-	 * Explicitly mask the parent's fwnode to prevent gpiolib from
-	 * reusing it for function GPIOs.
+	 * If we did not find 'functions' node, explicitly mask the parent's
+	 * fwnode to prevent gpiolib from reusing it for function GPIOs.
 	 */
-	gc->fwnode = ERR_PTR(-ENODEV);
+	if (!gc->fwnode)
+		gc->fwnode = ERR_PTR(-ENODEV);
 
 	gc->label = pfc->info->name;
 	gc->owner = THIS_MODULE;

-- 
2.54.0.669.g59709faab0-goog


