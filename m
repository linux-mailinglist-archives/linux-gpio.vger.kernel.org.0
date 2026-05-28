Return-Path: <linux-gpio+bounces-37616-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBrJLP35F2oWXwgAu9opvQ
	(envelope-from <linux-gpio+bounces-37616-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 10:17:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 256945EE666
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 10:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 326F2302C0CF
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 08:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980BC368294;
	Thu, 28 May 2026 08:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J+fv2Zkl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B50367298;
	Thu, 28 May 2026 08:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779955502; cv=none; b=Nerr37J9DxRd/5vSIggFKsRONCHdhS64M95sbwfqYH5etfvneVyCRM0PD8nHQGSedc3ddT4bsu13d/24895rt35tMd15sqeetQWVitSm5QFP3tabk8RCeRiDgNbiorBmssbZ42znnbokzU4m3qaVdo0Sn3K9aoKWVf8dX/NZbjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779955502; c=relaxed/simple;
	bh=d+9dPpoQT2mYvlFwzMY+LFDAB/OxOOLHqzr1Xd7eo5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJBlns+Rj5PMROonivzIUMf5FCmK3TXgrVp9722crtbxGCYQVEn3pZnFQTTc3C3wXaTBNPIvhD9PgX0a3PPMoI0fsAVnfE89Vn2bIr4pVvjDPPwjk9ur4A5PNyGtItIMAd8wS9/5GzvKz4XHX5F8ZZ3SbeGDnI8OtwjjiCZAj8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J+fv2Zkl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711EB1F00A3A;
	Thu, 28 May 2026 08:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779955500;
	bh=ay6gDYre614iH/Ln6/W4oneHyqGUkuOe32mdQBoj+TY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J+fv2ZklkYR7YxgIM2/yH6NcQb8ObC7ao9raqn0e51NVLXekv8eGlW7O2ndfmgaR9
	 cDAsU3lSAVUaofFtq4r3yRrGJqYtiVMgDJtd7m9SVceTonyX9g42ryMsJUwQsq/eZb
	 Q37Y0TXQBzFQBVL/Lng+0rNtxfXBzof8xsoMbL4MerJKCTdOgY95+fJkY3+uXJux1u
	 NLNK7rM9UTKorZYOtXeVUEgL2n2S+Gr8UNE0ZdNuWyq80oTOssmXLmFwK9pJxvR9Pb
	 2cUun1iMBUBa5rYyeHDR/bnZd8dd2WkcV3TqmkojXBnHQojtmBT9sFca2Z/ARW/shK
	 iooeF3BWKMD9A==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 3/7] pinctrl: renesas: rzg2l: Keep member documentation aligned
Date: Thu, 28 May 2026 11:04:35 +0300
Message-ID: <20260528080439.615958-4-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528080439.615958-1-claudiu.beznea@kernel.org>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37616-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 256945EE666
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Keep the documentation for struct rzg2l_pinctrl_reg_cache members aligned
with the struct member order.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 77443cf1f431..b1ffdc133987 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -380,16 +380,16 @@ struct rzg2l_pinctrl_pin_settings {
  * @pmc: PMC registers cache
  * @pfc: PFC registers cache
  * @iolh: IOLH registers cache
- * @pupd: PUPD registers cache
  * @ien: IEN registers cache
+ * @pupd: PUPD registers cache
  * @smt: SMT registers cache
  * @sr: SR registers cache
  * @nod: NOD registers cache
  * @clone: Clone register cache
  * @sd_ch: SD_CH registers cache
  * @eth_poc: ET_POC registers cache
- * @other_poc: OTHER_POC register cache
  * @oen: Output Enable register cache
+ * @other_poc: OTHER_POC register cache
  * @qspi: QSPI registers cache
  */
 struct rzg2l_pinctrl_reg_cache {
-- 
2.43.0


