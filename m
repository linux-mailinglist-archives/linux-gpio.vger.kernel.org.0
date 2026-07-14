Return-Path: <linux-gpio+bounces-40090-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t6SvH27JVmrJBAEAu9opvQ
	(envelope-from <linux-gpio+bounces-40090-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 01:42:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5E77597D4
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 01:42:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FhCiFeDY;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40090-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40090-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0A4830315CE
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 23:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0085041D65B;
	Tue, 14 Jul 2026 23:42:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B23369D51
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 23:42:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784072555; cv=none; b=gE5k6g7qgiLmrLHsE5DyialUsKdTAeke03uG2D9C45EuXqKKzzQIC7QVzf3NGYk0Jjr4zYPbKp5S1lkJ36jTrxKxd6ReAedDmvIp51gtsCs08boP7ip2N131Ys58xbujWtt8dL+2l9Sk5bR9/A9PhbxZHzor/WUH6P+SXyC2Ftk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784072555; c=relaxed/simple;
	bh=DIgognXgae4/GVNIoSHQv4tSnIRy6YAm2SspBfvmHtU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iwqKy8c1vdSl9/uZrfvJ06hf36GzJB8jXvLc8qNqWle4Y7rs0/Aj0aHEXjQ4GRiZXwdXt3P2wCwiQYWw1fz+dBLFkxO+tuVuVFTnyKQM0soyj6OaewVVaS6MGxE9ObdKq2V5DozTQZKiGCYK6Ky9GmcK9JIOONLE2un4fFelCzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhCiFeDY; arc=none smtp.client-ip=209.85.216.44
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e1a9d9105so1079281a91.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 16:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784072554; x=1784677354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hLFUs5RlkL8vn6uwW0uOp3ziZXbVN3pyew+ndI5sC2g=;
        b=FhCiFeDYRK6Rbml29EFdXbobrcYczUiWho8Kq+AtG1aXix7ROdqWtjADYetvPy/8B2
         T8ZfGc2Mb+gQ6j1sSDzQlYl3m0qI654GpHXsllOCbmzANHdxyjQpokUpAWcAdW+2bBRW
         RuX4xuPqUrvd3293w2eobtoS6eWeSaLPsl5+sglSd2L7f+CgJqlaz7QL720R9OTgsMlt
         mFQGsNWWtkGp+VtIvGakPXgwinxDXW06Yx/9PPJxxwi3/JQ6QpOscGKO3n8B+5ZUmvds
         V2A3SlGVnc3uVmOH3btFNMxaYV5Kxa7NyLQMsZW4d4TG4y//f/Q87SmW/XBggwEMo7Qy
         W/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784072554; x=1784677354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hLFUs5RlkL8vn6uwW0uOp3ziZXbVN3pyew+ndI5sC2g=;
        b=iVXeGPO6Mt4GSW789427L8JLQZDuIP8UXXM0x1FCcbUq4vRTvXlNS2hk+R7Gor4mjR
         +wdWE8vJ4QtCawRYH4SKc2fPHSw00poqRAYwIaLZ6+d0wCf0EzQZDKzr3PrEkAhg3D+2
         C6p/aojrzgM9E8tFaFlBIn0f0FFSzhdFz04K46zIDxcyjgshn56nyF2YwiAe7efHOomN
         iGlr83/TNgAtAlRZSWNz4XDWLjXuCxIuAr2TyUpC7/WJfsTXE/jez1f2mZfOh0EzNMuW
         6Bp0oFYwBt21omRA+uNiuLeoD3oYiu79AwkKNYuhQYDNYRd5M6O2zUASLwHxBjnKE+in
         Oyvg==
X-Gm-Message-State: AOJu0YylVIRTIgJbtlh6/iMpw7wAz8wogfn6biBkv0XtPvT7DqifC9pB
	GAGX/yp0st8bDsigoP9JV4mqCqnt95pvnBZtnVWxodq9eJZ9dRb2GhKb4OFHdQ==
X-Gm-Gg: AfdE7ck0UM6WKYotYR81qZ4/HuTawlc0HE9M/Y5g3GZhTc8DeIKJ9RT2cEAOQ0J3KxM
	K7oaQPq8v+xrjTO3n3AAD+byabnjUuVlTHuccWHOLtARND2csBnKobKjE6FEbjHdM4MTbB8n9ZD
	tu1ehpm6WeYc/5L+2Wt4xa+WPIk/n3x4Sz3naqPTOsjopJamKyvmqfqOawLUnxXjtrSAl0oMSVe
	iAM7Q6pFBi36BCXLiJ4U5mQ4IggiWAM0MB1U3BxTMGgd69wqn45mLXIU99iLyf8gGxQd1MCq41z
	xud6pJKPD5ksgyP6HEyQf2JEdvVvYn9UB2Ag8g8svhbR42He3cTZxdPXtCLcC1gZbCEsg0ak2ax
	RhWc5Dfz+apUvRhPwM3l3UPjhEUM/g9kdZ5nbFM0slUX7r+acy4YcHXy9ECrLhJrOH4PGm0LD2X
	wq/jeNVehOoZyzi0M+bFR89uTxQobGjQdX+6BsLA9FVhyUDW1x3SjvGdu5mkaNQtuPp+izfvg/r
	zQTACNEcstcFbu+6O6XRnNmNryWlHqJ+Y8F/CtU07N34EGJLmVT4hjm6nwz3zVmQA==
X-Received: by 2002:a17:90b:4c02:b0:36a:c4b:76cf with SMTP id 98e67ed59e1d1-38e2a0c346bmr532833a91.23.1784072553829;
        Tue, 14 Jul 2026 16:42:33 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e279sm124751785ad.45.2026.07.14.16.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 16:42:32 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] gpio: logicvc: use devm_platform_get_and_ioremap_resource()
Date: Tue, 14 Jul 2026 16:42:30 -0700
Message-ID: <20260714234230.886636-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40090-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:nathan@kernel.org,m:ndesaulniers@google.com,m:morbo@google.com,m:justinstitt@google.com,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF5E77597D4

In the regmap fallback path, replace of_address_to_resource() plus
devm_ioremap_resource() with devm_platform_get_and_ioremap_resource(),
which looks up the resource and maps it in one call. The helper returns a
pointer to the resource, so update resource_size() to dereference it.

Drop the now-unused linux/of_address.h include; of_node is still used by
syscon_node_to_regmap() and platform_get_resource() resolves the same MEM
resource that of_address_to_resource(of_node, 0) did.

Built for ARM (multi_v7_defconfig + CONFIG_GPIO_LOGICVC) with LLVM=1;
drivers/gpio/gpio-logicvc.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-logicvc.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-logicvc.c b/drivers/gpio/gpio-logicvc.c
index cb9dbcc290ad..54a7598c7384 100644
--- a/drivers/gpio/gpio-logicvc.c
+++ b/drivers/gpio/gpio-logicvc.c
@@ -8,7 +8,6 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
@@ -102,20 +101,14 @@ static int logicvc_gpio_probe(struct platform_device *pdev)
 
 	/* Grab our own regmap if that fails. */
 	if (IS_ERR(logicvc->regmap)) {
-		struct resource res;
+		struct resource *res;
 		void __iomem *base;
 
-		ret = of_address_to_resource(of_node, 0, &res);
-		if (ret) {
-			dev_err(dev, "Failed to get resource from address\n");
-			return ret;
-		}
-
-		base = devm_ioremap_resource(dev, &res);
+		base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 		if (IS_ERR(base))
 			return PTR_ERR(base);
 
-		logicvc_gpio_regmap_config.max_register = resource_size(&res) -
+		logicvc_gpio_regmap_config.max_register = resource_size(res) -
 			logicvc_gpio_regmap_config.reg_stride;
 
 		logicvc->regmap =
-- 
2.55.0


