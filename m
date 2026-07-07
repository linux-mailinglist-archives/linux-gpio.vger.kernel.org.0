Return-Path: <linux-gpio+bounces-39604-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jsDBCwptTWpxzwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39604-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 23:18:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A301A71FB6B
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 23:18:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="bsS+/lvD";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39604-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39604-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D59A73041A6E
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 21:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64B634216C;
	Tue,  7 Jul 2026 21:16:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F83302767;
	Tue,  7 Jul 2026 21:16:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459001; cv=none; b=C3x5F/ARFBDeRhNwZPQUaoRVGUrEgY7O86TmOqWCxIcjIIWNqIvktCt6VYW056bMr4oeW/43kCSk5yDUgbnzRrpNAp/LgntRo+YnxghFIk32idnWgVMpHdDFdnWafesfX6N1X6I3m4cBleRtNcth7Sn+SHXHnPSsN5y/WhQn07Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459001; c=relaxed/simple;
	bh=eWYs8ArN3BgCXHvDn3pG5mwVx4+aWWujqeQU5EaY0zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kQyme359V2/RQVHyo9C5OSC62FQTc8WDXBfzTQh49/+ymNP8giddqjckaDMIYdr9D2LiE+mGXbOo5GMTNU8yzTgl7enA8QiYGtBaF4uuWAzAKilgsAJ/3ZKg42+vR6GWYWCHW0F3DQlhJ+Le4joMQI9qkyid4OyjKwTAtYRUP/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsS+/lvD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01F80C2BCF4;
	Tue,  7 Jul 2026 21:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783459001;
	bh=eWYs8ArN3BgCXHvDn3pG5mwVx4+aWWujqeQU5EaY0zw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bsS+/lvDqrFPXwn1E5nJqrqV3JECp5wnc4p1VnJlLQooP+DYewjBi+a27R4ckpXtJ
	 fKLJl6pmvTeZ1FX2SNZ6eGnI+t5GHkIoG6FrAZq2pmXHc+6ZXHv5ffNo/1X2sUdyCq
	 R8dm6XDnCwouIPVYIDwzbugv413q39MoA6PZQOJfy/GyOGRpEwqnQxmXZts1HNEu/j
	 m1Tuc2Qt2ZF9Wib63U30C/PRSxxDL5vfjwcxlyvRRQYX137d8bPKxc3AkiFV4az1OY
	 QjSg6JTpbB6tq8sdCgrLqMErfKTeFN/n7hsIMCoN6qgTFY+bnXBLu8AWc9gGMtNkqb
	 4Cs/ODI6+FDog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D74FAC44503;
	Tue,  7 Jul 2026 21:16:40 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Wed, 08 Jul 2026 05:16:26 +0800
Subject: [PATCH RFC v2 2/7] mfd: ls2kbmc: Sanity check for the connected
 pci port
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ls2kbmc-mod-v2-2-2afdd1741766@gmail.com>
References: <20260708-ls2kbmc-mod-v2-0-2afdd1741766@gmail.com>
In-Reply-To: <20260708-ls2kbmc-mod-v2-0-2afdd1741766@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>, 
 Chong Qiao <qiaochong@loongson.cn>, Lee Jones <lee@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, Corey Minyard <corey@minyard.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2629;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=No2dp/27RmGGcRyar1/5K91t4kgdhfDKTp+IZPk/ZDE=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqTWy17cBPz+Jt3b6qtwXjg5eSBXXWxqXQuY4LJ
 6XYbBB2UtGJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCak1stQAKCRCwMePKe/7Z
 brNZEACIOnwoJju5hxO6Gyd5YUIo7dsbTlH5rJx0U69xILYeuI5LRBpZhkFK76pRSe6/LmxXOJt
 0Ymq/hrXkIJyJH9YcGIEE7H4IyIbjxvGosDeLtcuy5VEjr/ZESDJnVGgerauhu8U35amzB3Mpuc
 cRIJ5KkN5n2VsyC3NlfMzPMe2zDAX0u6PLQ6BxMx1bwa+KTG7lU8ZAD5QCr661fNUreQgMy8MF6
 Pn02dQa1/AXUKxYOvxHMMZ6LJWe3GEFfu5GSdeYDFSGRcuqdfaIRkvUh2YJKSN0n5a3iV4rD4Gc
 crkPRchHEGpH8M1UeC2L6RoKw4pVk4lbvp3yhvHDN4hoKv0hhXgHbHVESpQ/MpM+Kr5yyoRfLwb
 OJbDwCzJX1s2H2OaP5lq/VRFunaZhaAaQU6S2j0apo7Bp2u/tckaZ8r24dWMOjQdayOwKpNIdOu
 RrdLVCw0+vYqOFxrr1W1Q2NI2zQ0N3ndA/IlcQuh+djPUrqVae9KLE4jJfwwn4VM1JcQ1ZuA1Rq
 XC/Verqd09bFAKjxT35enZ7mVh8AzmuFF2JcsB2xymH+PRLtbMYIaqD3ixYqX+YwGCD1L4pePT1
 KqRkZTsFlMwXNOEAHDqHkaXVCpiMQ0LHXZu05z157uCfPn4aiEQN5fj5p85JV6wYZx4XTiyZEnM
 MnySiGC09JgU8Og==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:zhoubinbin@loongson.cn,m:qiaochong@loongson.cn,m:lee@kernel.org,m:chenhuacai@kernel.org,m:corey@minyard.net,m:linusw@kernel.org,m:brgl@kernel.org,m:xry111@xry111.site,m:kernel@xen0n.name,m:zhuyinbo@loongson.cn,m:jiaxun.yang@flygoat.com,m:mfd@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:openipmi-developer@lists.sourceforge.net,m:shankerwangmiao@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39604-lists,linux-gpio=lfdr.de,shankerwangmiao.gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[shankerwangmiao@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[xry111.site,xen0n.name,loongson.cn,flygoat.com,lists.linux.dev,vger.kernel.org,lists.sourceforge.net,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A301A71FB6B

From: Miao Wang <shankerwangmiao@gmail.com>

When the bmc resets, the recovery procedure require to reconfigure the
parent device. The driver assumes that the parent device should be LS7A.
Add a sanity check on initialization to ensure this and prevent from
accidentally operating on non-LS7A ports.

Fixes: d952bba3fbb5 ("mfd: ls2kbmc: Add Loongson-2K BMC reset function support")
Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/mfd/ls2k-bmc-core.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
index 27f6e096404d67459038a0607378057ec7ef69ab..b02e4955e9b04f517892a18b2ef103b5e481a238 100644
--- a/drivers/mfd/ls2k-bmc-core.c
+++ b/drivers/mfd/ls2k-bmc-core.c
@@ -35,6 +35,15 @@
 #define LS2K_IPMI3_RES_START		(LS2K_IPMI2_RES_START + LS2K_IPMI_RES_SIZE)
 #define LS2K_IPMI4_RES_START		(LS2K_IPMI3_RES_START + LS2K_IPMI_RES_SIZE)
 
+/* LS7A port Device IDs */
+#define DEV_LS7A1K_PCIE_PORT0	0x7a09
+#define DEV_LS7A1K_PCIE_PORT1	0x7a19
+#define DEV_LS7A1K_PCIE_PORT2	0x7a29
+#define DEV_LS7A2K_PCIE_PORT0	0x7a39
+#define DEV_LS7A2K_PCIE_PORT1	0x7a49
+#define DEV_LS7A2K_PCIE_PORT2	0x7a59
+#define DEV_LS7A2K_PCIE_PORT3	0x7a69
+
 #define LS7A_PCI_CFG_SIZE		0x100
 
 /* LS7A bridge registers */
@@ -477,6 +486,24 @@ static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_platform_da
 	return -EINVAL;
 }
 
+static const struct pci_device_id ls7a_ports[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A1K_PCIE_PORT0) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A1K_PCIE_PORT1) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A1K_PCIE_PORT2) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A2K_PCIE_PORT0) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A2K_PCIE_PORT1) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A2K_PCIE_PORT2) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A2K_PCIE_PORT3) },
+	{ }
+};
+
+static bool ls2k_check_parent(struct pci_dev *dev)
+{
+	struct pci_dev *parent = dev->bus->self;
+
+	return parent && pci_match_id(ls7a_ports, parent) != NULL;
+}
+
 static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	struct simplefb_platform_data pd;
@@ -488,6 +515,11 @@ static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (ret)
 		return ret;
 
+	if (!ls2k_check_parent(dev)) {
+		dev_err(&dev->dev, "Expected to be connected to LS7A PCI-E port\n");
+		return -ENODEV;
+	}
+
 	ddata = devm_kzalloc(&dev->dev, sizeof(*ddata), GFP_KERNEL);
 	if (!ddata)
 		return -ENOMEM;

-- 
2.49.0



