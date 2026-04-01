Return-Path: <linux-gpio+bounces-34521-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBLNC8RozGlXSwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34521-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 02:37:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CB0373297
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 02:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E43B23028C9D
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 00:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F351E0B9C;
	Wed,  1 Apr 2026 00:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUXn20wX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AD11DF75B
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 00:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775003787; cv=none; b=CrazwP8tRvyM4tYC1KEXT2+WKnQFIKa+ydf412fgdFZ9FCXfxlgZoTYf3J8+9rY+p4SrEQYXzPKxgFJF/2yYtpiaxzudbA1KDjUUZEfQJbHEa8lgl4wfGxjTOmFnNBXkdpRnVBGeMlC38QleeaT7qYDi52zX/zCvEfwPNba+pLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775003787; c=relaxed/simple;
	bh=9+803OXsW4RpYm11ZzkRV2bmZBdLytudY3nvjZ2Dlo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lTo4S3t81gxq/IP+mZRdcstBQ49GMiW6MsCFSYN36KrSmx2ecCMF+QK5pP8jrM1ixYcvDSIFe+yqahbFAeVQ1+H1vavIJPA2qRndvgdQrcLV5WD0pDos6bnPNH7kxzpBGSfKlWH9GclG/WD+khIEraO3j16NW6BWIt63zL7molA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUXn20wX; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82cd6614a90so774729b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 17:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775003786; x=1775608586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EwQDh831V9DcLgoz9eTKc5QM2T8aLiYTdwb2OH1M5U=;
        b=RUXn20wXdmZH4i2Wdbv9PGqFWAMLeEGYCclvrBz3nLJ1iOStUw98iZfHFPzwUbrfvf
         SypUbRh8xk7HJfS52TyatoQM11vILb+RLRc5UR8pfb9ScF0RX+B2ZA+e++B/UwXysCGN
         NHi5bHmStrnIe5RXbJnj7svBqjCSFKdKBRq+woPfBaEVfeGwOUJ9Icnla2zcXT3JeTaN
         6SHKMnDqOQ//yTeAnx59TRoGJFOQ8nOqHJDNdZLLDOkY4WqD4TxqOR44n005BjWr8DvU
         TpDMowrh7gKbHBwWjfm3672WL1Uq7xj/ug44cCmJt2xLWmtvMNtFpgbRO7nyR2FyHijv
         GWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775003786; x=1775608586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1EwQDh831V9DcLgoz9eTKc5QM2T8aLiYTdwb2OH1M5U=;
        b=JivBd+ibIy1ogIk6f8Ge06+GTl75pKauzymcYe1IA5vQ6quAs9wCyJnUlBMlrKEWWH
         aR6iOFFib70//D8LFhfjo7FAIfmSXQZENXDLGrSlkyvF0TbYLa5kIfGQdSfdVbq/3mR3
         8JdekKnXPT/4xRi7XNoCHM3BHYIspr40yqBnnY2eWBGblAyeF5h19zHIrd6+3TNZglmT
         C/4NO06ZE5cFArgB6+lGBNePO+EbTgxxU3B9xDj+/9DERikmohBvCN9ZzEELjdvpx9FA
         xPlQvR1JzwzH+9DrboN0ZaCJ1ChF2+pth8S7JCuZ0BoqglPv/cg83WqUEl5D3XJBhurN
         dGcQ==
X-Gm-Message-State: AOJu0Yxfl+utz1mQIOh5Ggq3yiomoqcc6cnvA7E/9pUM5tDOsQPNVIPp
	cscF4tvSf43Yq7WH9k602tEfioYENDpFZOJQMUwWV22Qr3RCuvOEi5nJ
X-Gm-Gg: ATEYQzxfgstjZvznm5HMerOmk7nknWZz02OGy/DhugJpIFWVCBbRZlT3lH8rHogpwxJ
	lhkQArfsay+TgaUTK4N+VYaUDmlnnv+FKSsnnEX0aDEYvyv5DVuc9oWiYv5rPpUgTgwUZ7oHmxh
	6ZVf+eaeWxo0JtExnBSWBP1+H3pKXiqmjDSJz1swqyqQ75LmM2BLcVT4/GGaR5MyV/+ej4j3Dma
	XdAkP3vVJkq03NJkydN9Gkmzi5E+aDdlJVfjc/jJC8LIfBHpIVZ3gMI1zRiMHyXJI48Jaox+Suh
	zS5LCWfB1YLRXofl9+x2FwKBSvVA9BRRwKweZW5xH3TqMFMYI1i1J8qbMy/oUEay4XYqmDBiASJ
	sbd/yObvx8RxWrdPeWmek0XqmGOIW3f1PO3/bbkJpJSO7A/g0f2dMcuNUG3BC6dCud2GSSFLaIB
	d22lps7CZlZkknpW8UvDRL+8YvGRIQaoxPoA==
X-Received: by 2002:a05:6a00:a21d:b0:82c:e0d7:2681 with SMTP id d2e1a72fcca58-82ce8982762mr1602910b3a.16.1775003785933;
        Tue, 31 Mar 2026 17:36:25 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca860b125sm11554549b3a.50.2026.03.31.17.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:36:25 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/2] pinctrl: sophgo: pinctrl-sg2044: Fix wrong module description
Date: Wed,  1 Apr 2026 08:35:50 +0800
Message-ID: <20260401003552.363205-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401003552.363205-1-inochiama@gmail.com>
References: <20260401003552.363205-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gentoo.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,outlook.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-34521-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 35CB0373297
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix the SoC model in module description string, it should be
sg2044 instead of sg2002.

Fixes: 614a54cb5ac3 ("pinctrl: sophgo: add support for SG2044 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pinctrl/sophgo/pinctrl-sg2044.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2044.c b/drivers/pinctrl/sophgo/pinctrl-sg2044.c
index b0c46d8954ca..cf0b674c038f 100644
--- a/drivers/pinctrl/sophgo/pinctrl-sg2044.c
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2044.c
@@ -714,5 +714,5 @@ static struct platform_driver sg2044_pinctrl_driver = {
 };
 module_platform_driver(sg2044_pinctrl_driver);
 
-MODULE_DESCRIPTION("Pinctrl driver for the SG2002 series SoC");
+MODULE_DESCRIPTION("Pinctrl driver for the SG2044 series SoC");
 MODULE_LICENSE("GPL");
-- 
2.53.0


