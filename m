Return-Path: <linux-gpio+bounces-39458-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lcSvIfUOSmqw9wAAu9opvQ
	(envelope-from <linux-gpio+bounces-39458-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 09:59:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F9C7094B1
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 09:59:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LuVB5TV8;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39458-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39458-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7ABE4302D120
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jul 2026 07:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8692367B8E;
	Sun,  5 Jul 2026 07:58:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD36363C79
	for <linux-gpio@vger.kernel.org>; Sun,  5 Jul 2026 07:58:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238325; cv=none; b=DLbq01Dj/5979ldfdGdNdnRLrNdu1AP6vOAaau/BfLao3Gz6kS3vk18NONHOIERv1O7sgKk6qMKyKh+LinWueP7yWwcwQX4nwERGvVnYqif7m3U4US1YzLO5LO7nOZh8qySbO3z6NCBkC5Ekrwy35nZF68tH57qUzArfJXYx2y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238325; c=relaxed/simple;
	bh=k1rvSiyDPCpk0SDwFUE32ypMUm2i7I+6V8cUG5dyG3Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RuzLk2AYRqjZ7ynbai4OsQn7QevFItEZn+UKDiWEoj0tjaeq5N57XedNHmyA9cU1XghmO3CFU+6ZzGkptCRgSnDo/mb5URxPzLzwIiWLh8bnfGdEkrE27L0acuSdv0RqrXqQe0kh6y8+jkULQzXX3gui0UiFUOieKLI8ueaQcOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LuVB5TV8; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so12069725e9.1
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jul 2026 00:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783238322; x=1783843122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ii5elS5NgLsQv2qqwGxrcHkoRbkINQLFmPJvl9kn5Xg=;
        b=LuVB5TV8fVpFw5WFm+ZdxERq8bLRePrlkjCOJ07Sg1y45dbOhoUJEA43uaAyYgQgMg
         XaeEkBFD3REg7Bj6JhbbChzIxNTHQDsPyxLZyEAAeFD6rMy1DprsB7YQdfpklPObqtvf
         6XPz4vzgo+s0dXZOYv5/ULBEPk21fqVcajF9Gl/n9meW1GvWyXW88F+zY14cay/DGNXj
         y5MHASMEhqjxE2fDwcqVADtFih1aKIl733wBBSJ09+7j6RTNnEI+fYIwazX9YH2nDf9O
         HxnXoupDOO+Zg0uPleO3qt7RSy/HcvKs9F2wdx+pVMcuOiqRYCU+geSnW9MYTC/AM5aa
         95YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238322; x=1783843122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ii5elS5NgLsQv2qqwGxrcHkoRbkINQLFmPJvl9kn5Xg=;
        b=F/5Dn7Vq3lwEHt4Y5YXZeCuxwu0M7EVWxxLX0Uu1ZhBqf/zSQpvohkST7f+JYkE/Q2
         PChr/hS8/03VWRhQliDlixJ+ZrL7PYbGYkzLW/UWyQ/ju5zX11gkJm7lJAdDHKf66o8C
         HsYirdh5e52oEmHvHlOmdGRjaJlFlCr2J8Ki41MdOcTWb6AILNrr6sWkxy8qsdQb9wnO
         uoDgl4g6N4gbQjD2EmFrksImtHkgnkEo8ct4lOv/wuQxMzPX3NWgYvtEEVWaHTg4x4f0
         A4olJh/coKPH0XH62wU7tn/eXquYdh2dnCv03fGdj0D1OwNfeX9J66ehMFtHBgkxGv4d
         Mi6A==
X-Forwarded-Encrypted: i=1; AFNElJ+94KSGa6zKfE3Lt9AL+ouXdfAk0qtL3a8bXjxyleZjmiYPujpcxDW8M4OJa0jrJVl0lkhXW+1Tbsbz@vger.kernel.org
X-Gm-Message-State: AOJu0Ywji5muK+Oq+pVwxs0b+0LOheBebGCtoG76yoW7gjI6qgQnNr8W
	aOn93bIz0QAM/WftVfZxhoU+F6W0XuDeNEphg9/YomlcombOtZYLUXBP
X-Gm-Gg: AfdE7ckCUmDk4MY8dO2lid7CBmaXRdW2F4EmBCf3irBTmZx1bOwi9wxHCVErmOlxK5S
	OBGGKF8/QTReHpL1jDfITHqbYxVfC7mvjLtB6EBRoPLXVfkKXQaASAZWLmr/2GEb/VBEmnIc5g4
	vBDjEYFK3OcOa3tgxluzAGec0UBfILhlTnhDGwma5ItvqcaZ5UrNC/PQU2uOQgzppbkWTKexKU/
	xneVQUYMk5XnWWVCIqvf7kFUXOa5nqtHWkPMct6Qh/UU8W4HranJjNMvaD0jW3d2o8kGRq5yvpn
	hd522jgj9z6u+O5sQy56vYezdoDzpQ8TNaP2TCRfBoYHi+O04DkNrRTKxQav++yLBwDPOt1MjNW
	kiMFnlvl1O/2LZasE6kX84D/oOGuNbVOKPDw/TnqBJhiF2j5NVBjFlsNR/6zKNK4WcqqYuM127h
	yly6t1Zqs7qwheyVXeaS38MPppF+urn9Hqbw==
X-Received: by 2002:a05:600c:474f:b0:492:4a70:faaa with SMTP id 5b1f17b1804b1-493d11db16emr58211645e9.11.1783238322443;
        Sun, 05 Jul 2026 00:58:42 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bfba1sm305769765e9.15.2026.07.05.00.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 00:58:40 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v2 2/5] dt-bindings: phy: motorola,cpcap-usb: add chrg_det interrupt
Date: Sun,  5 Jul 2026 10:58:06 +0300
Message-Id: <20260705075809.1793784-3-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260705075809.1793784-1-ivo.g.dimitrov.75@gmail.com>
References: <20260705075809.1793784-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-39458-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:ivo.g.dimitrov.75@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:ivogdimitrov75@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4F9C7094B1

The CPCAP USB PHY driver uses the CPCAP charger detection interrupt
for DCP detection.

Update the binding and example DTS to use the corresponding
"chrg_det" interrupt name.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 .../devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml     | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
index 0febd04a61f4..1a202cd29724 100644
--- a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
@@ -28,6 +28,7 @@ properties:
       - description: sessvld interrupt
       - description: sessend interrupt
       - description: se1 interrupt
+      - description: charger detection interrupt
       - description: dm interrupt
       - description: dp interrupt
 
@@ -41,6 +42,7 @@ properties:
       - const: sessvld
       - const: sessend
       - const: se1
+      - const: chrg_det
       - const: dm
       - const: dp
 
@@ -91,10 +93,10 @@ examples:
         interrupts-extended = <
             &cpcap 15 0 &cpcap 14 0 &cpcap 28 0 &cpcap 19 0
             &cpcap 18 0 &cpcap 17 0 &cpcap 16 0 &cpcap 49 0
-            &cpcap 48 1
+            &cpcap 48 1 &cpcap 13 0
         >;
         interrupt-names = "id_ground", "id_float", "se0conn", "vbusvld",
-                          "sessvld", "sessend", "se1", "dm", "dp";
+                          "sessvld", "sessend", "se1", "dm", "dp", "chrg_det";
         io-channels = <&cpcap_adc 2>, <&cpcap_adc 7>;
         io-channel-names = "vbus", "id";
         vusb-supply = <&vusb>;
-- 
2.39.5


