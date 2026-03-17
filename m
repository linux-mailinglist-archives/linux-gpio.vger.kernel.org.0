Return-Path: <linux-gpio+bounces-33612-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qF+bAjoquWkAtAEAu9opvQ
	(envelope-from <linux-gpio+bounces-33612-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:17:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E64CF2A7B44
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C7F96302C295
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 10:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8453B3A75A5;
	Tue, 17 Mar 2026 10:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaJ72JIp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D283A6EFC
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 10:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742601; cv=none; b=UCkLOUYSU+txeDXEROsS+4M7nE2ZSXYan/3UEZBxoPeCldLE8pk9IOXb2WUypz5+aZXQSk3l+0qsmgE6vlyvwFq9JhnXVaqpsZJa9TyxLn7FrdXvW0/xCiyql8PNSmzrI9AMPbjCmVJQUdBoqBUmodLY6AP1Z63P+qLQwj1d9UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742601; c=relaxed/simple;
	bh=qlhz/VGAv1fkGq+e51RGRR7QoBeYCZLOXn2/9ebF4NM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BuRfbI6YT/viEfNwekZNp8XfI5CxkjeJpmi0fryNxjBZnLz7KVxVCYQTpO/X5PU2pLeVkbMoDCRT7OryG/BBGLdQUvNZhmB6O9VnnxApgSYjl5m7XEK19bUo+txhvTKn+0EEUEJ+/Ef58Q15BosLqfnsjsYagNwXljJ1DvGzhgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaJ72JIp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4853fd7b59aso34223385e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 03:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773742598; x=1774347398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Z8ZDIaZ3WlvwN975EDjweAwKFPsqMXnqigrqm2JI8U=;
        b=UaJ72JIp9JYk70LYwEErkYSDaQC2tjHBE/T9+rsgDEaOmMw9G+bjLOPeu/LqUjeRSq
         L5JM68KfGfXSKf/X9JElGs2n1XDqqp7kEbHB/fw+8RlhGKhKz8IDBwMdA3cADi3MbElV
         Tu+z36ps4BOEYeCrO4y/h0EIgfeF/IgbAY+ffuyJBBM3Hkxiup/YIYloFz7NcyBrvjbo
         QSDucL+JWVa3Dw7WG/i6glHMXI8lZ3NE43/CqfVVRlBpx8G8QV/nr2nuJwOH5iou0+kq
         26Rlv6S+o4FW452Jw4cKF8O7iQBzWD9heNcCYwHTHqLmgkwGc3sMPdiCxcadx+JwNOMP
         jXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773742598; x=1774347398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Z8ZDIaZ3WlvwN975EDjweAwKFPsqMXnqigrqm2JI8U=;
        b=d2FVNTeC7raiPfydtO5NwxxMOjVqeR4DrFGnR14xYuOqE8KpQz4cVoDIkVLVG+odYw
         mf4YlDTibruP0FM6VpwifyG2FdjQXxyk1v4BEevmppJXkIeZ4+fRalpkerA0fmAtkg5R
         YkyTrPk0uayuqKkUQEwYTFK8g0kJtfST7y4iJrB141X9kpprm7N+5dQCYmdLHF7Hw3n2
         uEGvvVpDZkr+LRT1YItyqHJ7dRNHLZ8PQOVItvv0rE1Ja8/Xo3iDkWjK1YA6k8j+0QYL
         wLRzVcugJ5wwHZLAsUHYEuQZxHBiBDdbSi+OfBomnE2pMufgvRqygjPEUrFinLEpaP6A
         xFdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeaKeaM47wrwa+Ee0T6PI4C/hKTZl/JUPEaqZjxf2yYp6elp4Y6D0fPV5ooJ3jZmAjeHeYeXMXJQc+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2G/uDJLDQ/Xgc/NwRRBr47Ef7bx6jcizC1KfI6/1LjBBmLfeB
	s2B4N6eK2Vd/Oa2Ybi1WGR61qhUpUORMmD30X4Yn02QaKRr2tv1OHF9F
X-Gm-Gg: ATEYQzzaWd6U0HjHFC5ig8ZhVBEpmUxWLHPSgqK9HUmDOMyJvP317WLQpwXlrrcKAQR
	eMSH83eCR3CkYtlwYuKgJECvo6RKgjGh1q4talNHIVZNmGtqIrlCNdKd/BDw97Y0vZXWFO+hodg
	X+0Fin1A81NLSQH7FJpyDMxTyD1oFCzQUdudmSOfGEy6XDySD7d/+9pdIP1e7RSpN+iIhwcRghG
	4ChHKeWY+aGecl9RME74cTOxVDKYwrz4lxMpOPftwCiqs4jc/EjXvpbxIPmvrH0OJgvMjYK/BOU
	IlNYcLVeTZuKBpvF8DLgaNUebSC1goEfOt3SVZNvZwtZh6k+c/Ip3O+Tn5WbLmORjoe5cxLp6Q4
	Y8fFMOS5M+sDyhnZUCIrT2GUaILfh1QcbkRw5oS/FBnhQTwP0x+TxM2BMgbHpsFZyU8UM+/GB97
	6HoGqmlvR53kZZw7+VRrfJF5zJkPQ7Z4ZeTA0MNzJ1ZkzDIWIT
X-Received: by 2002:a05:600c:8b55:b0:485:3f17:425 with SMTP id 5b1f17b1804b1-485566fd0dfmr262350405e9.21.1773742598015;
        Tue, 17 Mar 2026 03:16:38 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eaee510sm53903275e9.14.2026.03.17.03.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:16:37 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 7/8] pinctrl: renesas: rzg2l: Simplify rzg2l_pinctrl_set_mux()
Date: Tue, 17 Mar 2026 10:16:20 +0000
Message-ID: <20260317101627.174491-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317101627.174491-1-biju.das.jz@bp.renesas.com>
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33612-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: E64CF2A7B44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The port and function selectors are evaluated multiple times
in rzg2l_pinctrl_set_mux(). Simplify the function by dropping
dupicate evaluation storing them in local variables.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * New patch.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 7677751aafd4..3cef8a8d3712 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -681,16 +681,18 @@ static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 	for (i = 0; i < group->grp.npins; i++) {
 		u64 *pin_data = pctrl->desc.pins[pins[i]].drv_data;
 		u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
+		u32 port = RZG2L_PIN_ID_TO_PORT(pins[i]);
 		u32 pin = RZG2L_PIN_ID_TO_PIN(pins[i]);
+		u8 func;
 
-		ret = rzg2l_validate_pin(pctrl, *pin_data, RZG2L_PIN_ID_TO_PORT(pins[i]), pin);
+		ret = rzg2l_validate_pin(pctrl, *pin_data, port, pin);
 		if (ret)
 			return ret;
 
-		dev_dbg(pctrl->dev, "port:%u pin: %u off:%x PSEL:%u\n",
-			RZG2L_PIN_ID_TO_PORT(pins[i]), pin, off, psel_val[i] - hwcfg->func_base);
+		func = psel_val[i] - hwcfg->func_base;
+		dev_dbg(pctrl->dev, "port:%u pin: %u off:%x PSEL:%u\n", port, pin, off, func);
 
-		rzg2l_pinctrl_set_pfc_mode(pctrl, pin, off, psel_val[i] - hwcfg->func_base);
+		rzg2l_pinctrl_set_pfc_mode(pctrl, pin, off, func);
 	}
 
 	return 0;
-- 
2.43.0


