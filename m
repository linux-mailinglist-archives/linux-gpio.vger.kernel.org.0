Return-Path: <linux-gpio+bounces-37474-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WRiYCSliFGoONAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37474-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 16:52:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD145CBF46
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 16:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4D6730580A2
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 14:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5127A3EDE43;
	Mon, 25 May 2026 14:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqwHijrb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8663F1AA3
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 14:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779720463; cv=none; b=eUze7HoeHtI0nNlkAZU5JIMhnpgGVLAk4LP8VqKvdXMN00sVwyBorZCrDc8GmWU/rO6PuVV0dPw+nnjRLvD8kp6xWEKEgGvn/++jnxSp+xapPj2dp9iMSSCUyd7dWv4uDIs5dx69b5uxBV/JP8gFhFUXGNL9i3v7EYK90gFSNoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779720463; c=relaxed/simple;
	bh=pjFlrB7uGN0vyMl1RGqGgvMd8ocGBWVXot5mcHQGLcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XSldcFiwRdobB7ocFv0gCcSKqKg88jZefCTrAydPx/TNYsOrBsqeI4RFnFzqGFY7duY+8PFvu0cbbNOmGN8mF1h2MM3mzbIbdtBNKnNV20PfzIvqigcd0byyz3EoWNQNjCRHdcyoBaJfWOdRJaSiyCD4Ogu1F7+lM2gxKdNL2tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pqwHijrb; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36ac67f489aso786497a91.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 07:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720461; x=1780325261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qt5GF4ec4Tz+ThdSwkffpWxOTLLBMBcFoFVLeUcmmpQ=;
        b=pqwHijrb35hlGp/Z9U7y+lbVHEX5mXpcl4mrG/XyVwNd8RFb/oYj2bH29RKUZwu2Qy
         MXQs/iWVeUWpulfQpdKxXDYzHzsBAHrGHgazwgsM8okP9aCuRZAynvZOwca1N0qtGOen
         UFf0SQyTVzmaT4ohrlP7B7x8GvlhtezmCyyHhXRNpWJzC0rH0OTxqtazs4t3vUA6DjI9
         fk4iWCW4uGdQzftH9F9NLt192LzqkztJm4VZYnIUU5UNk9XR3fgEmfaw6SpZRWTvHM8V
         Ap8yVb9j3FqG45ZJl0GK+GzUm+Qr+CIK0Jtb0BbYT4t8ldlNaglYiiiyMeABx8aCgLF0
         ZJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720461; x=1780325261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qt5GF4ec4Tz+ThdSwkffpWxOTLLBMBcFoFVLeUcmmpQ=;
        b=Xg02Y1ZL63jxYs8w2wJ5znhYVsGHyAgP0Jrel9ByZYPE9G4r+g0bM93hBQqNGtRVPH
         L2LX+1R8LHKW3bY5qpunT3LvohjZAgclQo39MYsptgk/N9W1mp0nu8NNwbboxubaCnrc
         sNeg/ZF3uEUUAKxlZILsaKudsa5d0f0j3xpw4Kf+DHutIxC5XNjuqWHf2FPzFP2Xmv0R
         f4iQrrNw5W5/0hyDDlbVREh9/KA0oMQ5XMcmBC8Qrt3n0tpAWycPHS/AZtRJghRGn0sD
         zD5+7u/RPXQPFWABIT0daHfysW17iGnPVt1+TQNMIm/6JjZhZxSvKisfEHXFjn0Sb9fW
         fZGw==
X-Forwarded-Encrypted: i=1; AFNElJ+vYYQYPnFmA8xDUckwtPBaicabc33DqH15RO6kQKdAQwYg87mylUoa5+jQyvl4CbkscWMuWUYIo54P@vger.kernel.org
X-Gm-Message-State: AOJu0YwCnthquA3nOsSoYFGld6hSMmFXo/RS+d3Mxzk2xC0tuuaKK9dP
	UZjUORm3N8+pt2QZcYo6s38QFGl4+H6gBA6o0ehKLUc5MeDEXsOrqBln
X-Gm-Gg: Acq92OF5SpkvKJUdeDG47Ry+UB/v9NVMxfs6iM41v2iVRMP0L31ombWJ3CPetixECOE
	CwQgoARv4Aah1Uz8YgB/imkKdWGpIqhfMIJETjLr3vN5MVhhHESBy7CgeGhZHd/qetXBN6YG9HR
	LlRBjLAbRUtRGYSADuDXtecWi/RraradQ4B7ESihpIymbPtx8Q30sWGmfPrPLx+Mx54R4MgqpoW
	JYdgSbc/1PZx3lJmrv1SpWEw1i2Y5gu6uUl1yHZDPyj4oYAvBjxUZbu4SeFWSeJuRVdDjiMgUP2
	ihEsqNb8lTy8Zf4cw0EKG8tYsC0MdiBNpXQDDLyn7kTOJ94d8ek2nnAXITckAX+k1cdo5F7Oj1/
	CK8dZNLNYbX4OkWe6e9JnB4bNo2UlCzP9mIlwjG+Wz1yxSysKbdZEdlW228dQMWAbOeylL/9Wax
	vEPLS4amq1MglH1PzHLorQhfNmEeVdlXXnlem/Fa8=
X-Received: by 2002:a17:90b:3e4f:b0:365:8fd4:925c with SMTP id 98e67ed59e1d1-36a6c65330amr11990238a91.8.1779720460900;
        Mon, 25 May 2026 07:47:40 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36abfe17c95sm2721993a91.0.2026.05.25.07.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:47:40 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linusw@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Tony Lindgren <tony@atomide.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Romain Perier <romain.perier@gmail.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Peter Rosin <peda@axentia.se>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 3/6] gpiolib: of: add quirk for IS31FL319X shutdown line
Date: Mon, 25 May 2026 22:46:09 +0800
Message-ID: <20260525144629.498630-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525144629.498630-1-jerrysteve1101@gmail.com>
References: <20260525144629.498630-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37474-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,lunn.ch,bootlin.com,gmail.com,mailoo.org,163.com,arm.com,atomide.com,axis.com,sartura.hr];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[33];
	FREEMAIL_CC(0.00)[gmail.com,ucw.cz,kernel.org,hisilicon.com,glider.be,axentia.se,vger.kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lumissil.com:url]
X-Rspamd-Queue-Id: BAD145CBF46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

According to the IS31FL319x datasheet[1], the SDB pin is active‑low.
However, existing device tree incorrectly configure it as active‑high.

Add a fixup to force the consumer active low for legacy device trees.

[1] https://lumissil.com/assets/pdf/core/IS31FL3196_DS.pdf

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index ef1ac68b94b7..8a79aaadc9ea 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -194,6 +194,16 @@ static void of_gpio_try_fixup_polarity(const struct device_node *np,
 		{ "himax,hx8357",	"gpios-reset",	false },
 		{ "himax,hx8369",	"gpios-reset",	false },
 #endif
+#if IS_ENABLED(CONFIG_LEDS_IS31FL319X)
+		/*
+		 * According to the IS31FL319x datasheet, the SDB pin is active‑low.
+		 * However, existing device tree incorrectly configure it
+		 * as active‑high.
+		 */
+		{ "issi,is31fl3199",	"shutdown-gpios",	false },
+		{ "si-en,sn3190",	"shutdown-gpios",	false },
+		{ "si-en,sn3193",	"shutdown-gpios",	false },
+#endif
 #if IS_ENABLED(CONFIG_MTD_NAND_JZ4780)
 		/*
 		 * The rb-gpios semantics was undocumented and qi,lb60 (along with
-- 
2.54.0


