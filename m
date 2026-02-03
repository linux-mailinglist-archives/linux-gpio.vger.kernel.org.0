Return-Path: <linux-gpio+bounces-31389-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAf6JvLzgWkMNAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31389-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 14:11:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A63D9B68
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 14:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 215A43030302
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 13:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CFB5350D4C;
	Tue,  3 Feb 2026 13:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtbjP6mG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CAC34FF55
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770124258; cv=none; b=BOclzL4Bgx1njf9FMKje5svaMN24texacyC/Xs4dSzhwirF6+kmwWZHtJsHGm1qx0PrRRJyTSABic/VJoIX6+PDFMFdy/t3KZH+HJDhKyiWmtsDhBLo2p4xqRw/XzABnWLNzxG6brrETqcxTlAowgF0qb42KQrVlXYZMB7kK17g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770124258; c=relaxed/simple;
	bh=99VaRUhjBji78QpBZJN8gyHYeeAyE6aZfZgC4Oj3SJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JLvA7pNhACMDlI3LsoEOCbAo4bvfPw6n7MIqwrqjSl7B6S7jtiFmOdNapBAaEecNld7cjooyNNZdto5tLw9S71X/TwSrfgevP7FCjfpbTFL609WqG9rMP1FUFIzGs9gwMaD/sDZZem0ShwhgV0NgJbMfR+DKSLvdJqa/BRQm3QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtbjP6mG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so62738515e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 03 Feb 2026 05:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770124255; x=1770729055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+GSu2op5zO51+FghCepzZEYi0uzxi62ahcPZPbNDP4=;
        b=YtbjP6mGhSmBXHiJE/U2lUihviawoDQb3N4bLrNOu6d9siW5vSrN/m18332w0jI9WH
         6FecrQqJ1HlXGXHFOTMdzE1nkZVtWSWcf3PFFx1bZD7RLn7Sv3siWY2CNi9eShXHRXh3
         zsFjIfQkZy6JyHDR+ZO0uGUG2mo/JhKIU7YNCXtUDIQGgm3BPi9qb+O/yd+iVUIdOYaP
         UvwE7jcTlWv5QdkzSQWQLUepBlr9qdaH2j9L4xIQDPRMEfTkt5eoE6+h2Hv6u7A8Kt4T
         oWGCbssURcDJEpqRgV7Fwh36D29YV2oTS3+c3yr2g6SOylLbGNKf8LjCoiO1kWSknOYO
         n8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770124255; x=1770729055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7+GSu2op5zO51+FghCepzZEYi0uzxi62ahcPZPbNDP4=;
        b=ICG3LA4Xza2bMJYCj37hiuiGH+qJtjyLSkWqZA/HhYxZ/YAatTNX/6oJ9k2aUCmhFv
         v4oeVYzsjuo/n7ElgWEi/nH7f28LNtn9hPriNCkWRPY4gLZuUbspnzMdmNVBo1gVDKLG
         +0BZXf3sp4EWI0qdKBT6uJ/4O18qUbcx11zcHQIHBdAn3OoJsY1K79N7B08bSbYt+ppB
         QY4ZmbKTqps1OQw36ZqCptgJYe8yffiHeKT0ab3bVS6ecTJhMZjNF3V5u3KLDLttMEQ1
         N9nwkXqdAI/laRMLs+lf7i+9SUwxvS1/FaTEBwUKkQRcKNtCFeHWuxFLSvQdXbAUGbRp
         2mUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyWkFOqg+kRuktbshaUa4dKm4+pIRjKvttF/D3GtbHRv6MDsBtzq2zduZKCYgfA+Nn0M9X0kyf5wIK@vger.kernel.org
X-Gm-Message-State: AOJu0YxYyPI4pB4sbctDxrD1sQmOdMa9IikpKaagV3QWd0BQfwP3CNXC
	yf8kds4neLSAJtVc97WPomme4DNjOmS+fVu4ckf6XhFBBpgg87r0hqfvTVK2FT6T
X-Gm-Gg: AZuq6aJ+szOkLBo3bDaQbsX58149FxrXjoRJz5odp2qz3bNp4Aiv6K1o9f8KcY17UmX
	s33QGzZ910KVu4jQZnsfXs64HltG40czQAd0rAC80WjxETrHbxFGszO9q0RzPKE64YdW0/xnvZK
	2c0x3geEyB+jIQtJzcU7vc9iH9j7ERbQwOx9fo3t2CuuC1pSctO4kPSRjZY46Ta7cMNbws02Jam
	8YcJP/G0fhNuvoESGHSuxZGO4GV2zU2oPjsPldX+Ia7wT1XD1QuBvuc52Up6L8E0+PuGz/ln8oj
	QiW5P2/r8pI2PSC/5v4Sc9EueGEh3FTWDPvzy6ES1SaLqx+WRI0czU80SQ2A3u330bLXD6+FpmP
	IZwrL/EexeHr6dbQasdEaGko1Mi+W/HlvFJP2Qift8IIXtgP/rh4z1lvjgQRzFxITIm+Xx8kQ6Q
	9PmGhJJoQvLK/50IyUzw==
X-Received: by 2002:a05:600c:8b31:b0:480:1dc6:269c with SMTP id 5b1f17b1804b1-482db49e6demr180468915e9.37.1770124255041;
        Tue, 03 Feb 2026 05:10:55 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830512ddd0sm63662185e9.9.2026.02.03.05.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 05:10:54 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 05/10] pinctrl: renesas: rzg2l: Add OEN support for RZ/G3L
Date: Tue,  3 Feb 2026 13:10:28 +0000
Message-ID: <20260203131048.421708-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203131048.421708-1-biju.das.jz@bp.renesas.com>
References: <20260203131048.421708-1-biju.das.jz@bp.renesas.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31389-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 40A63D9B68
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for configuring the ETH_MODE register on the RZ/G3L SoC to
enable output-enable control for specific pins. On this SoC, certain
pins such as P{B,E}1_ISO need to support switching between input and
output modes depending on the PHY interface mode (e.g., RMII vs RGMII).
This functionality maps to the 'output-enable' property in the device
tree and requires explicit control via the ETH_MODE register.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index cf7f9c2e37f8..5e3e56e32cea 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1198,6 +1198,23 @@ static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oe
 	return 0;
 }
 
+static int rzg3l_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
+{
+	u64 *pin_data = pctrl->desc.pins[_pin].drv_data;
+	u8 port, pin;
+
+	if (*pin_data & RZG2L_SINGLE_PIN)
+		return -EINVAL;
+
+	pin = RZG2L_PIN_ID_TO_PIN(_pin);
+	if (pin != pctrl->data->hwcfg->oen_max_pin)
+		return -EINVAL;
+
+	port = RZG2L_PIN_ID_TO_PORT(_pin);
+
+	return (port == pctrl->data->hwcfg->oen_max_port) ? 1 : 0;
+}
+
 static int rzg3s_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 {
 	u64 *pin_data = pctrl->desc.pins[_pin].drv_data;
-- 
2.43.0


