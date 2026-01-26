Return-Path: <linux-gpio+bounces-31084-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIZXHJOEd2m9hgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31084-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 16:13:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D955389F4E
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 16:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9D933014125
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 15:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA66C33C515;
	Mon, 26 Jan 2026 15:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFsb2Fwx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C15633B6C9
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 15:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769440400; cv=none; b=gW2vEnnttBR2Fb9bdw9x7kGWcmhBhL/8TdfVY3qP1zwIve4c2YIkVXstDFvaVAOvivvYyonmEFJQW8O+5XSNNac76q4aTmnNnDIsp+GGQTTvweyqtB3QnR+vYbCBi+3RbIQ0LHzDlxtM2gFkOOGs9Fn841b9tm14MidupRUYXI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769440400; c=relaxed/simple;
	bh=05W/sWQUtpWKrpkpM8fY/rEUF0tNOkJWLT1lHgudSxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nbQ1ABVIz1U+9FXd00d4r6wLUngrAw9Ug1aNxUVPpVzEtUr2zqaj0szkWzsCGLQ0Jnegc2gYI617rJBV+R3GsCF6GF3qw2GHSICJlfuC8QD6TQV4z25zhSThWRHUDDaupTEeRDcpXH1viaGB+Slpba2n1nVvfFxcR27/Op6QSfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFsb2Fwx; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso21504345e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 07:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769440398; x=1770045198; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WeZN1sVrspWDpr6d4J8M9QiTomURZBnUfJ04e7oj0+8=;
        b=BFsb2FwxTke/sUGPRSC7K9ntGwa2fMytiWRRz2B6pa6mn+SsVCskqyGloPsB9AlGj5
         bavafrr8Jn4leGbJe1W75HbUUUcW9/CZ+PUgDnIpqY1+ScNRWzuKHega9u6vHggyJKhT
         41Vxvyp3juUpEPnDUNj8UWk+LA0Mj21dVAdKARWBdiOvvL27yhuScL982OmaLhu0zQ9l
         27HH1JDHvPO4SnJXileatkDjgOa1XzIWzRYhuB/33Qjq0VNXMNTT2PM+SyeA/Nj6MGPd
         pq6e1NxpR3D25mWfSQUFm/GUq2qJDUYnuyxDi618imI9g/rRBrPHt/H1xzVFmIDc1vgt
         I3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769440398; x=1770045198;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WeZN1sVrspWDpr6d4J8M9QiTomURZBnUfJ04e7oj0+8=;
        b=ESUBX4h+DaNOYNE//+6qHJAO3kZaDaQU69+292Fi6en/wY1XwH4eqa4rzH/54LXCt+
         vUNxjCRhf0BBxBeWb+NETUfNoVMITqBytxgoy2lGiY19tTVhfwy7gwlR2pHLlRl87UDc
         xJLhubLDCrurqV1tOg0iC8P70KKY+MGWKjQa9dr4FH6K1ZTQ0+qbnMSaILgKb6/3OnR5
         ys+xqWWT5DWpZGAc3+HONXtYM6NllXjXeZvkkLutEAOG7ZR6F5vUZZTS6iQMWoQNrRK/
         ogVPsynZnAl4l4t0kkmmsIo3shmdBrKpVc92mKm2Gq7Ks7U4F+F8/X3biUzUDgfMQSYN
         f+tQ==
X-Gm-Message-State: AOJu0YzouH48rQcmeUf17CBDmT8DLzeWjjA968xbaMHBH2daIuEEx9eW
	WICUujhbRGDQk5IZmmuArK3GXe3+8L5uag/chpr5uj0EFsjHlOy3ifyI
X-Gm-Gg: AZuq6aI9bZoqUt5SfgH3DWVzwzGcDH+YA5CWjSLn/cTLqdjuvUx71ja/4z5CQ7Ul7C7
	WTgW/yDse4q84MNsenHoZafwmQXjTuZD9G0r0aYXRjA84AeI705OK4fkdWL2fr1eBsehkjqmU9/
	jNp3QV63+tBAhsXsArhkzLrQ5dFmwl9sBgkE0npGsTm5ECi5G2sfIa/1XVf2I9V3wAuayut64mY
	AR4vI8wGQQ7qVklAz+NWnJmcb6qAT1uI1QZR+Q0ugNaACeL6zlzz4d1DNVSRgBVvK9roSSEphmi
	bhilbRiQOvJGkabUEkV/Ujx6CdVXLrr2KVEpWp6R479wMdxFAm+2Rg+nlWKWyUhUv2lxGvmFgpV
	ss0RLEmI9fWqn0ToCZNzFgCl0apCCbN2F3myw20abG8wSbiGWYG1+hmp9wGZdHlCqXoVZhZFzos
	nBcT1tiAcdyE/MvMShUWwrz4qjm3XgiqP5vHy2aPHz0Mdv5VZkBf0=
X-Received: by 2002:a05:600c:3b12:b0:480:1dc6:2686 with SMTP id 5b1f17b1804b1-4805ce434d3mr88758935e9.13.1769440397487;
        Mon, 26 Jan 2026 07:13:17 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4804702876asm399680125e9.1.2026.01.26.07.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 07:13:16 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 26 Jan 2026 16:13:11 +0100
Subject: [PATCH] dt-bindings: pinctrl: marvell,armada3710-xb-pinctrl: fix
 'usb32_drvvbus0' group name
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-armada3700-usb32_drvvbus0-fix-v1-1-9dcdf68f5fbd@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIaEd2kC/x3MwQrCMAyA4VcZORvIWrbJXkVE2ibTHNwkYUUYe
 3eLx+8//Ae4mIrD3B1gUtV1Wxv6SwflldanoHIzBAoj9WHEZO/EKU5EuHuO4cFWa96dcNEvcmE
 qfJ0yxQHa42PS8v9/u5/nD/7vgHdvAAAA
X-Change-ID: 20260126-armada3700-usb32_drvvbus0-fix-dcd0cd87b035
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-31084-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j4g8y7@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D955389F4E
X-Rspamd-Action: no action

The trailing '0' character of the  'usb32_drvvbus0' pin group got removed
during converting the bindings to DT schema.

  $ git grep -n usb32_drvvbus v6.18
  v6.18:Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt:106:group usb32_drvvbus0
  v6.18:drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:195:  PIN_GRP_GPIO("usb32_drvvbus0", 0, 1, BIT(0), "drvbus"),

  $ git grep -n usb32_drvvbus v6.19-rc1
  v6.19-rc1:Documentation/devicetree/bindings/pinctrl/marvell,armada3710-xb-pinctrl.yaml:91:                usb2_drvvbus1, usb32_drvvbus ]
  v6.19-rc1:drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:195:      PIN_GRP_GPIO("usb32_drvvbus0", 0, 1, BIT(0), "drvbus"),

Add it back to match the group name with the one the driver expects.

Fixes: c1c9641a04e8 ("dt-bindings: pinctrl: Convert marvell,armada-3710-(sb|nb)-pinctrl to DT schema")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 .../devicetree/bindings/pinctrl/marvell,armada3710-xb-pinctrl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/marvell,armada3710-xb-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/marvell,armada3710-xb-pinctrl.yaml
index 51bad2e8d6f1f7601a50cd45bc4fbda9d1043bd5..4f9013d36874997d208e1d07e35ab4e1e4bdef91 100644
--- a/Documentation/devicetree/bindings/pinctrl/marvell,armada3710-xb-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/marvell,armada3710-xb-pinctrl.yaml
@@ -88,7 +88,7 @@ patternProperties:
                 pcie1_clkreq, pcie1_wakeup, pmic0, pmic1, ptp, ptp_clk,
                 ptp_trig, pwm0, pwm1, pwm2, pwm3, rgmii, sdio0, sdio_sb, smi,
                 spi_cs1, spi_cs2, spi_cs3, spi_quad, uart1, uart2,
-                usb2_drvvbus1, usb32_drvvbus ]
+                usb2_drvvbus1, usb32_drvvbus0 ]
 
       function:
         enum: [ drvbus, emmc, gpio, i2c, jtag, led, mii, mii_err, onewire,

---
base-commit: 304c3ebcaff36560d76e3030ba0839e629635f47
change-id: 20260126-armada3700-usb32_drvvbus0-fix-dcd0cd87b035

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


