Return-Path: <linux-gpio+bounces-40080-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kyn3Jk2NVmrU8wAAu9opvQ
	(envelope-from <linux-gpio+bounces-40080-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 21:26:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 354D6758389
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 21:26:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=jff1q7Gp;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40080-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40080-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A09FC3037EBF
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 19:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F814D2EC9;
	Tue, 14 Jul 2026 19:26:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1CD47ECED
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 19:25:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057159; cv=none; b=kDFff1TjJJBmpPEgzqsUOlH7yNFGkfT62aLq79cx5SRo4Zz2q/wLw7dqxroU/F14yFYYRHaBC/+qGIwaCcmqOAELMXpXc1x3yx4Th953TZt+0RnKHPVY6O76h5wFHd2Hmr1zwfDmHtkcHEqZ4O04IottjOYD7EKMsRkJ3X3ilmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057159; c=relaxed/simple;
	bh=ibcVXYLtVU7xGTbwp2n2UIwijtwTrZ8HpiRiIhPxTaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hv8ShMDyB452CR+H+q4F+aUbtboCHXZxsAYK8UGbLAGzo/p9JYnHGpY9aWrOGXMBIq/oxG9qGcBh4imAYqBzJD9+8d/ns49FfArkQmTR7YOe1ngcvlXg1F2LFsAxOOO6BwROKsmrTsc2qukvkXjAekdY6Qj2Zq63Vwjw1bsdr5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jff1q7Gp; arc=none smtp.client-ip=209.85.160.45
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-44cf70de986so1447453fac.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 12:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784057154; x=1784661954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QETVa7/EiIqTvvn2j77guxH/5vJlcjsNxn4OMO5PoXE=;
        b=jff1q7GpPWpxae0j5yhbPgOlfTHT1S3vdbMz1R0bumCLiOOswpiYMZHfuD2eQ8vOjU
         wueuVpZJgOxi13z8YSi2fo4ppWSvsF7antqhz7KOr/M9AnMtxkP+n6Fyw1InL4koC8I1
         /iHCTSvjuCNh6KPrgn5lZPKwsEegSV/XPWGsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057154; x=1784661954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QETVa7/EiIqTvvn2j77guxH/5vJlcjsNxn4OMO5PoXE=;
        b=PrgbMyC+bk+7NBTGqi64nT7WCsPXswX7WBAo5dswR6GPv+SsnULKor6mUoC8fP8bWN
         t+feYFH4Ry59GK9rWLbUcy/Iq/GQUbFxsi6FMGkKdHHlZUPQ+T5tqooLWTWTHFun4dpB
         mB3WCbFo7zq1Nvc3yoPwpGONLuw81kMdVwXaZBmIeW2BCf1me4MKghqyFFTXJeK/mFQm
         2jstI/taiu+26GcYuv6Yb4ZlpT6xbBHJuuHp/d4C//pkg2fbwo7KCVIf5i7o7VvdQydZ
         L1SxLlQto/bCx3Hji496TkxBZDXhfsMlyar7gFTh7AqxL7Rsu9EySI0pXAZwjJT6Etl/
         zz1A==
X-Forwarded-Encrypted: i=1; AHgh+RpQeTMPobZHcshJVwJOMglrrYfBPm3fIdDZLTT5Jw0VLWpOurT48A3q9ajU4ShnXhMtGnaFP3zkI6Yq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6BLGbcFb16X2LJPH3FZKll5zuyiVZxKOTDvYn899Hsp+Mbn/P
	P7yizrCdUEdBn7n2je3LHY4rVVlLoxa7LvaKKE0xCwTtgWmpPKFNhcZW3W/HOsnsfA==
X-Gm-Gg: AfdE7cn5EF0VcCr60UPWEBHE3/Y7gLgSRKd0vTmlQbNoyyZYnXzccHqyzn61ezhK/Ja
	OorsXsWDoK/86lXri6KQEU3O3wM5xh0EEAB/muFNHLPNNs3WdtsYJE/QmU9BdhXhVcMtRBLkS1J
	ENJ5vrqKQuxmLhmJpolzCbaHQqxLC8N8lSXJWrIZcmeZh2cNs29QJtUn4j4XBz+LYU4y+5aNWKw
	dHpRGZ4E4zqQYhQldNMXHacL5+3n8jd2merqRTnHWx7MMZhWfHKzWS+et7uAdWsEHf+kKQr6Jjz
	qfY+qfACdRraYAOEjhNmZezixDCr54XycFMZKPhL77YtwOGByBpet+9HWywxYC5K4VtCZbCmCb9
	zT4jf4khOLmCWFiiAnvLnKC9QDb9FhQYNKl9RqNPfGteKbwyZXw20qpp9skqDDBGkxW5NIZbPuU
	zxMT00Oss=
X-Received: by 2002:a05:6870:171c:b0:456:550:95b1 with SMTP id 586e51a60fabf-4562b891d4dmr44356fac.28.1784057154639;
        Tue, 14 Jul 2026 12:25:54 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4519d89f7desm15759043fac.7.2026.07.14.12.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:25:53 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: gpio: rockchip,gpio-bank: Add rockchip,grf property
Date: Tue, 14 Jul 2026 13:25:29 -0600
Message-ID: <20260714132531.v2.1.d04a89a3849323a0dcee2c701cba43adbb0523b2@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714192535.2082729-1-sjg@chromium.org>
References: <20260714192535.2082729-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[sjg@chromium.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-40080-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:heiko@sntech.de,m:robh@kernel.org,m:jonas@kwiboo.se,m:conor+dt@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:sjg@chromium.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sjg@chromium.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[changeid:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,chromium.org:from_mime,chromium.org:email,chromium.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 354D6758389

Some Rockchip SoCs, such as the RV1106, give each GPIO bank its own
IO control (IOC) register block rather than grouping the registers of
all banks into a shared GRF region. Add an optional rockchip,grf
property to the gpio-bank binding so that each bank node can reference
the syscon for its own IOC block.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Add new patch for the per-bank IOC reference

 .../devicetree/bindings/gpio/rockchip,gpio-bank.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
index bdd83f42615c..774e9c7de606 100644
--- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
+++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
@@ -44,6 +44,13 @@ properties:
   power-domains:
     maxItems: 1
 
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the syscon node managing the IO control registers
+      of this bank, on SoCs such as the RV1106 where each GPIO bank has
+      its own IOC block.
+
 patternProperties:
   "^.+-hog(-[0-9]+)?$":
     type: object
-- 
2.43.0


