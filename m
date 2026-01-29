Return-Path: <linux-gpio+bounces-31270-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOWBE2cke2nXBgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31270-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 10:12:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0AAADFD8
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 10:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D47013036EBF
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 09:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8EB37F73E;
	Thu, 29 Jan 2026 09:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqidqTCx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B51376BC6
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 09:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769677877; cv=none; b=me82aNvxLwj5QgQfUPCqsBVhf1aMetjMKpAVbJ1KvMiCTJrvboNVuglpoxV0+9VQjIC+hjTTm3IZD64qs6ZLQi+6tTsk6tisqc60uPWfBwRE2fC4kmMfZXUKBBCbCgsje56vSXf9AmOgggE3TR/tXvrPxi6+srqsHDqnSUq51Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769677877; c=relaxed/simple;
	bh=9736Q1c5UPkbPCgTxA+3Cri6nfDIyGp2aLifbmZ9cpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eqJgmrV7Gs8Yj5rrqMqvEMuCyOS6Iy4iiaK83pEdZit7V8Pdw5pHDEGrzofrCLKW9Sct+4Gcyub3bkGIbTF2JIs75r7ceTBq9hXKwujKm877Ry7AGs5RYk39/Wg2irMc1OaHPDidR+scD9r4g+XNTu/BtEK5xhBBkbMLPGP5aPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqidqTCx; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48069a48629so7482195e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 01:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769677874; x=1770282674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNHC7BZwLEWIAkvOqNMf9oTfVeweCY3nyHbRwQRrLe0=;
        b=QqidqTCxEAA4I+p1Y9Gjs+uTCmxID7oiiYScwmgYJY9vZBNLSE2xtEOlkqlzESVXUd
         6GUp+6UlFAR4+ui6xfIy4qh83k8Hg8rpXcz5lU/LfFgmeP9zrfzzL37kbNI4/3WZ6ZOJ
         dwmsjqT7VutBSwrZU4TZRdOhC5KWtjVf/aiVOVjQDbv6sQTe0H5yTpG3BL2nHsG+vJNe
         6ol74HCrH1VWySMitvDnduOuxenokU+bvliMIsMqLgZIaBMrCHilceonPCbf8BfEda6n
         JX+2rviTNA98XtVrX1swefeVjFLFl2MSu3z22JM9hEHwYAGGGKOb92dknSvrcaeo4prO
         sqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769677874; x=1770282674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pNHC7BZwLEWIAkvOqNMf9oTfVeweCY3nyHbRwQRrLe0=;
        b=bqzw73za3s58Jc7v5gGTbioeDX4ZhVn1e4X4SIwbF61mmrXV9bs/UOd4PB9U5Y4W5R
         aheMGHdeMGetweuX5MG3HW1E7WJrLmeeY9UcZAGdxOMn/JedjRYx2xKFasyUq0JYqWp2
         Qy/FpxuyJCyhJ8ZjXqxldvluOzwz4ylqv2LJjAk1OjsQsvsv+Tk63h/BHF8DLCMbxtSo
         ZA5YJ/jyFLnT+P1rJW5w/8en0lgVMfg/CMAXzZ+dXQV1RJPvmt6I2IOzCax2rSlY3b/h
         XTYwmmqmU6enbn4I+8hfk1ZkcSDjhaxNSABw9DFDyl0LHE2KnLy+MJjL3C2dN3omCF9a
         Ydrg==
X-Forwarded-Encrypted: i=1; AJvYcCU7Wh6I89cRevnu+S2Lo1xtIZyXamehGW4NwpvOZXo422bDGY2bC6OZspdDmXY9LYd+DKm0vooL1vht@vger.kernel.org
X-Gm-Message-State: AOJu0YzrJ8fd1y9XAgJmP2+LyhmGgXB+gVFEgHnqJNKdyrtNSChgCtgL
	ffZKuHap6E3J9UIv4trumS6sa2cjpFCVNiOok8QEeEfIOzRF46C4eYDE
X-Gm-Gg: AZuq6aJDgho3qyFx4iiz48VQvNkvtAdy1lroWq7ZvuKJg65jOtGBXZ8162EQ0AcaBXF
	RD0dRVKW7fH4cFoJDe91Pwame0CniU3qqIIhtwJSOn4/7HoHeHQdXvhyjFBvHzlpqUezTXuYlOa
	Z7iw/Ol7tsuAEimW+QoLjtEWX/UAQFquy8VhtbIhTlafRVBrr9/+mXaUSnPpKariNwZEKthavww
	8WFF/htbdY/GiPdSFrNmVcEqaSDFptersL9dK5JFIBsHMKbDuXfcEe2Hiz2Cl7EP2bs5j/lvoXB
	oTvLXtauXvx41tCsl5kSyBZh+Wx/3jw4lbFhXu3N6aq9yi8qT28XQ4KAZlWtnWyuI6gW8nPC/0t
	gv2MNGzhqUzrOyxAEyh1GH5DRkBiYJCMQ+1ynj2ojADnO+T/iIlUJEuvni4d1KfQj8RsgfbzG5J
	Jf00ujVG2ooZdNUTE7
X-Received: by 2002:a05:600c:5395:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-48069c55751mr102965605e9.22.1769677873398;
        Thu, 29 Jan 2026 01:11:13 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm175338875e9.2.2026.01.29.01.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:11:13 -0800 (PST)
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
Subject: [PATCH 5/9] pinctrl: renesas: rzg2l: Add OEN support for RZ/G3L
Date: Thu, 29 Jan 2026 09:10:56 +0000
Message-ID: <20260129091108.95277-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
References: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31270-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: EE0AAADFD8
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


