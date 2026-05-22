Return-Path: <linux-gpio+bounces-37344-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAYwEd8vEGoaUwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37344-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:28:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E39A5B216C
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BA903037BA3
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 10:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79FE3EDE6E;
	Fri, 22 May 2026 10:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3wo5wUW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7D33E1714;
	Fri, 22 May 2026 10:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445401; cv=none; b=dPLVjQEtUng5Sex7VI7nXICGRGBXmIDQus6C9zaIbGy+6kmtyvP4Kcpc+KsfLFIJ/U1CLzDXINgRCIZrif/TgjY6FE1Cbu0XkL5EuTfqyae3VKmuavmQlHaRWdkGShP0oO+nkzG+/YnW6qPVNee+Iaw9emh8aeNQmrxyP7cq9A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445401; c=relaxed/simple;
	bh=odzKeAx3xAtW/AGGgIaMEmqpdSmeNMxlzlLr6+ZZjTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ao4AqfA5Op0RGRBLuKsN+b8Xv7Oin9keH1YY/TAIjLq0bH156X0Sr8DkNrwLmdMS6po2Bn4H/Lljg80tHdG3MMTXvDMkiRi6oUs9xslSq2Q+/Qv1euzp6mvi5rlqhgDlyHetQoNzEU7zuASWQTPggq0Y+S7qtoBFULd1vIpl3gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3wo5wUW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E8E1F000E9;
	Fri, 22 May 2026 10:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445400;
	bh=6MW412GldaFzSu+r4HcOKYF7u9/tvdCqWjKmh7EonC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D3wo5wUWf25MYwJd6e80X5oB0zi2tDtM53YChUj4MOdqRAkuiqBLYyVpGefGbWJiG
	 UhnxvMJ115dJlyMzqOIKkU8BzGsc6mmVvGrQhlmXEPCR+VJ8qbg4SNoMrTNe7VdONh
	 9Hr5El/guTZomYbVq1VN5c7CE2gW1IIbZfFXpJb5I7HQ9vUHRdFqfklitf9YAeO2o1
	 BLnUwiKE+5RteXwoTR1RVXFOQMJPO3Za56NT6rUIpfCuPqwMNa8xNy56P8GPIFUrTI
	 9SGaQ6mBDci/tjNTEg8opyJicZFtutKow5HquDjkv+ULj6F9mwBPI56eexKsCgGQHy
	 s0UwfD3EKlQPg==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	wsa+renesas@sang-engineering.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 5/9] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the missing I3C power source option
Date: Fri, 22 May 2026 13:22:47 +0300
Message-ID: <20260522102251.1723392-6-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522102251.1723392-1-claudiu.beznea@kernel.org>
References: <20260522102251.1723392-1-claudiu.beznea@kernel.org>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com,sang-engineering.com];
	TAGGED_FROM(0.00)[bounces-37344-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.986];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 9E39A5B216C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The I3C pins on the Renesas RZ/G3S SoC can be powered at either 1.2V or
1.8V. Document the missing 1.2V power source option.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 .../devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index fb1fe1ea759f..32864c9add4a 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -129,7 +129,7 @@ additionalProperties:
           enum: [ 33, 50, 66, 100 ]
         power-source:
           description: I/O voltage in millivolt.
-          enum: [ 1800, 2500, 3300 ]
+          enum: [ 1200, 1800, 2500, 3300 ]
         slew-rate: true
         gpio-hog: true
         gpios: true
-- 
2.43.0


