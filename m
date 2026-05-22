Return-Path: <linux-gpio+bounces-37342-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N5PMdsxEGoaUwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37342-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:37:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEBA5B2446
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2EC6730DA3F6
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 10:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E2A3E8670;
	Fri, 22 May 2026 10:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dOpJv9h/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F603E5590;
	Fri, 22 May 2026 10:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445395; cv=none; b=cMad57cfjWduhOGrsDY9kZp0ZGeEL9SDgQF99pMnLmWXv4B49B33rfC2Ixs1aJdrgu8Ac9l5PgD7yI5h2Ib+FThRqe+g0Zy5qFw++/rkmKmOF2Kga56YsWGkxwM33oogqDYtBXIYIrg4F5z83VA7u7zbhUEK/4pBHB2+iwMLyuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445395; c=relaxed/simple;
	bh=l2Uj4xt+63HmKdjgb7EezycxDf+kepwJpwznf4eHN6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g5zvrvarT8BXjUS/as1wUbDru9/bvQo3LdcdZTJ3XDm6sAtoOskJ4vVy+rLxUWkz3Xyk0KoaNtTa2vvTcEFK0H1e7Ru5pQo9rPNYAN5kV9mwa1U7kB5k3w33CgaGJAOzSGatbcwu0vA+u2XQFSy/RdhRMG2kNai/djBQGq2tppA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dOpJv9h/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD051F00A3F;
	Fri, 22 May 2026 10:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445392;
	bh=P3cBV2PxnmWeSNwKUBnmjOtO2VySEPTJeALnjDSE/Lc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dOpJv9h/0C/d+W4Zn1BzuT4dL9kQl+SAZWxntCPHrl/3IkcloQ9a3iuQXIFYf5BV9
	 ooR8Qdf/nj+ElJ8tjYuTsWLwrtUoQGcQ2TT606KjjeTNZNnIweF4WtTvxketfhf/VM
	 EnqpbeFEkgw3Bz6VOjcAsF9+NroXm9bHg37mfibtB6Y8WnlMmzazMNuphdGfKqLg35
	 EgZYbAZY6gR2K+UVRsT+0++wa+4Ebez65u6tKTJ0yUxYJpeJCz5NWeXjkAu3udlUnD
	 LX4DB0JFJZxIDR4fdOcPjYuRnctX8uazzuhlyNAAHKQGdfHqXhf0eNbZDiumrULpdH
	 CgTNLlaBTyocg==
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
Subject: [PATCH 3/9] pinctrl: renesas: rzg2l: Keep member documentation aligned
Date: Fri, 22 May 2026 13:22:45 +0300
Message-ID: <20260522102251.1723392-4-claudiu.beznea@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37342-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com,sang-engineering.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 4BEBA5B2446
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Keep the documentation for struct rzg2l_pinctrl_reg_cache members aligned
with the struct member order.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
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


