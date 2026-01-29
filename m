Return-Path: <linux-gpio+bounces-31278-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePAhFtE0e2mGCQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31278-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:22:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF90CAE936
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8FAA3083320
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 10:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C59D37FF7C;
	Thu, 29 Jan 2026 10:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5ytokqH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F422034027E
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681821; cv=none; b=CQRIIb/0Vp7BQTuQ1Sk75VNQXDIH5QpBdBkfL0uQ+k92H+MSAuNpqn3A0usCnKTQcM3oXP0OEH7Y6761DFC67OUHrQEGAzqyT36WD7gXhnSeOUOAYvVglu+Svrq9E3x7olAb2G6Crd9DH10Wb+98tgRn6xFvd+TSYojs+/ds8ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681821; c=relaxed/simple;
	bh=l53JAl1A5TRe2s7pqTepmBMNLndaNxM1i2f8fJ+CJTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fW5WAGcrGIEQEsM98Hg+J0MGBUrDUnmoeev8yJMpGzfDdUG2fS7SljzXLKU+602RFL+q/+KHIi7aHeqpSr89PpPytKlg+8N0tNGq++FK2qOBOOJiQFOLXEC66FucmSEWK6Wrs5UcgdYbXHKgzCoNJ/Ys0wshv5ypHs/tzua2U6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5ytokqH; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-480706554beso8149295e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 02:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769681816; x=1770286616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kt7uEiXTlV6e7nA3ca7sq5Y8eWxdpRVOenYUuxl1aik=;
        b=B5ytokqHOXE6HNDPinSMT5WL3E00A3POWmFiXns1tIzGFYxou8yfE9ypera1dWGU3b
         2JrbvoN8mlm7LJWiJnOurKJA3zIkNv3KxpbiWZ4hJRFsszkyLG2o3M6G88b6oj5QGFPJ
         PruwM0jJF/mM9vHnN9+L2WccsWnqpxzKDtFKCnqsIFzlW7VIYdx6Jc2A2hvHt9JkBQMC
         D8GEn352w4QfOrADzU2Y99uCSlhapdz+2OTxKt8A5JnNVxPZrLYC6sXWnMTMO13n/MNp
         Z8DBx5aSC4FYjiKj4cJESGfpkii1fhiw8bTbfb9lTScPGLhQVNsPs34g1v+iQRa34UAZ
         MDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681816; x=1770286616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kt7uEiXTlV6e7nA3ca7sq5Y8eWxdpRVOenYUuxl1aik=;
        b=J71Ps5AEFic45fIZ7nIhnxGJ0UjJSNwf/Mk76ry3wBAZuhAdYijbn84c75F4+k51WI
         dMWNNe/NkIK/6YbvhfTOaCcwbsiFdXBaqHyjBgddIDXtBwTqEcaw/wGLuhm41excSMu+
         gxsfDc0o5K+Zomsxtp/q0SuLHHFn3Q3IK2XGvt+CvWV5/qLdGmQCHmn15Kt9HHb3fXbC
         pYWuuJuBbSyAUM1w1VbweObHGpKZ4xxfpy+MAJLwuC9SLs/cytd0LIxu7XmR9OXboTtX
         weMqgjY1X3hDbOHTpoe+kELXVIvXzrxXKnXoSqGDcPgdTm2cd1jM7Pk/lSVKh4uUcJS9
         Qqgw==
X-Forwarded-Encrypted: i=1; AJvYcCUE8zI64SoBlaPVQmaUvBwo/B08fhis/7vbeIAkQF4CR4VOW13luxwo9Z+V6R5FBomeA0828eiUztxE@vger.kernel.org
X-Gm-Message-State: AOJu0YzPazny+hpstjCPHiQk88nyOQFMsNpjCo+0xAMp94JoWEpCWbVG
	/MqMy5bXWwErOtMWkRLxepmn02dHvz5FsOOPUDF8KyIWNK+kC9R681FV
X-Gm-Gg: AZuq6aKD5LbD5WJ/aUYzLuT9WX71XGY+IFgXOpNSazDdoH33AHaq95l7qmFbkQTPGKQ
	gLLOHeALO8cCOE/kPSlpb8HuYOES0K6gzII8+gqh4EqlvftnW2O0H76kVgK4CZhjdW0mGINoDil
	/efJLD2nvX/lQc5E/8EumPuYkuU/oiHeQkJ/22NgSgjXXrndE2JtGMZypFJD4cdzNvz/of90n3R
	QykQWOkO0U7FQtCe9GUSRHaiKTaLEiZsMF+vmOimkiaMNKhQfA+uanEYCUNP1P/I+GNobXpyIlZ
	YbaDjDfpBdEa6FP2SlZB8UgcmmnEyA7YRrIYMohHwHPBdXKlSOiFN4VTQ3eSJ0uVuZOUYkyi45F
	5MXga56tVmQlg63tigb+MGmS1GAjRlOSfzswvPyr3loZ/SqPg90ouq/Lo24GJn55zi42bEfgPOp
	Jhy7BNtpvL3aTHbcZR
X-Received: by 2002:a05:600c:8b24:b0:47e:e807:a042 with SMTP id 5b1f17b1804b1-48069c1c009mr101678685e9.15.1769681815992;
        Thu, 29 Jan 2026 02:16:55 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm178642065e9.2.2026.01.29.02.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:16:55 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: biju.das.au@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH RESEND 8/9] arm64: dts: renesas: r9a08g046l48-smarc: Add SCIF0 pincontrol
Date: Thu, 29 Jan 2026 10:16:43 +0000
Message-ID: <faaddb4d8bce3aacda6cdf032c677d8380f71b66.1769681553.git.biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
References: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31278-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,glider.be,kernel.org,gmail.com,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AF90CAE936
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device node for SCIF0 pincontrol.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 86db86335d5e..2f918830b8f1 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -35,3 +35,15 @@ &keys {
 	/delete-node/ key-2;
 	/delete-node/ key-3;
 };
+
+&pinctrl {
+	scif0_pins: scif0 {
+		pins = "SCIF_TXD", "SCIF_RXD";
+		power-source = <1800>;
+	};
+};
+
+&scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+};
-- 
2.43.0


