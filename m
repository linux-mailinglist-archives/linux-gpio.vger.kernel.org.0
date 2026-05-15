Return-Path: <linux-gpio+bounces-36927-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHR3ED8VB2pQrgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36927-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 14:44:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C4754FD3B
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 14:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28D2730402EF
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 12:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E910047D94F;
	Fri, 15 May 2026 12:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EaUF/Vox"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6A947F2CF;
	Fri, 15 May 2026 12:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848821; cv=none; b=Cc8arrUfFGzX/mQYnxuU2nD+OuzVZY+hiIGnfCcV03pCyd5QedMLM7csuRreXF/ydguSCaOSZXMuFfmImqqQzTkqHyC3036QKWi/iOp6VStWFVot7ExQRdpg6SQpdke08OaE8i19ZPbcQz4V/eoeXy8hfPuILut/WkGjqtZBAUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848821; c=relaxed/simple;
	bh=Dd5fe5jSF1ogGY+jB2o6PqmeuZ49kG++yFhYxR6YgkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQ01obj66Tf3e9qRbGn26mPmEueYVRZP4B+sm6UWBxESzIyAMj+rIPqPFXT3yS71wtdU+Mypl8BUGIyL+sXehSZsg+21P1JPk9/zI7hTOLeUfJQUA8LCiOyTjA55Mul29lAbpr2ackbITlI4F4jD/wDU5HVQExvlkDk6PU0d1s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EaUF/Vox; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE919C2BCB7;
	Fri, 15 May 2026 12:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778848821;
	bh=Dd5fe5jSF1ogGY+jB2o6PqmeuZ49kG++yFhYxR6YgkA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EaUF/Vox8irY4VHbikvFQFcoITs3VrEtCYSPbws9Yzv02VtgG4gZwX7Rlj0UeYNnL
	 aAyxrg7Z96STx2vow9PGjCnSbNGTh8O17uQUDpDDPK6/18FyYVcFeXqQgkqUvdVWCx
	 aYM51sxa16u/cn9Zn8T7EYsXbCyPCod77ZkBT240oJhJk8XHziVDBiBk1EQZCmyRol
	 CHF4yZg5CnBKlKuEB4Jmy99qyIXzUG6Kf1vQybskBIZwFvpiKCT1nfj2t7r5HnIIPX
	 zKHmSAKG1twV2dSYam5Y5P8qWVLgSnvNsIf3oeF4ny1GnNMavA2XtbidtZ94uhO6xI
	 VnUhbNVx5szlw==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	brgl@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 2/2] pinctrl: renesas: rzg2l: Populate struct gpio_chip::set_config
Date: Fri, 15 May 2026 15:40:08 +0300
Message-ID: <20260515124008.2947838-3-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515124008.2947838-1-claudiu.beznea@kernel.org>
References: <20260515124008.2947838-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C6C4754FD3B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36927-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Populate struct gpio_chip::set_config to allow various GPIO settings.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- used gpiochip_generic_config()

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 05a33655e6cc..ac42093fc579 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -3212,6 +3212,7 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
 	chip->direction_output = rzg2l_gpio_direction_output;
 	chip->get = rzg2l_gpio_get;
 	chip->set = rzg2l_gpio_set;
+	chip->set_config = gpiochip_generic_config;
 	chip->label = name;
 	chip->parent = pctrl->dev;
 	chip->owner = THIS_MODULE;
-- 
2.43.0


