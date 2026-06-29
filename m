Return-Path: <linux-gpio+bounces-39166-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /mxxDCXeQmpSFwoAu9opvQ
	(envelope-from <linux-gpio+bounces-39166-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 23:05:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C636DEC56
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 23:05:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=sAfgYyr5;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39166-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39166-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31C543020028
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 21:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F74360ED4;
	Mon, 29 Jun 2026 21:05:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1312405E1
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 21:05:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782767136; cv=none; b=kewvvvHLZWRP0jWVidQinbRbpHVflsfhXyCYC0odJ9SDSDCYRf1kcteCZrSEfydyuO+L1D/RGalPbgiaUxLJW4l8ohVS6FEOeLi9h9et9SKwsgUt88VmWjijLiRPJLhWYIfX5oYKhZVqN0arAmX495s6VQF0KtvwEJzSeHkJI4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782767136; c=relaxed/simple;
	bh=FvwySsZ4KRacRvZXSaz57azjyuei/t8Oqp5fICXXeew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LYTSnl3yQ97eIwLqNIcoWrpx1EJsOtGRJ+l80uTw2/LjMehrqD2OxEvuK1lmhO2Q8c8gXfXXQvApou1RLqNd2d+/kIiubMCM7x/6DL92TI+VCtwO28QALxu/OKSeEJKhyiuoyv0jOgLWW8e0CPauSzUbEqDlh8IeiPYyTOC/nqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sAfgYyr5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52744C19425;
	Mon, 29 Jun 2026 21:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782767136;
	bh=FvwySsZ4KRacRvZXSaz57azjyuei/t8Oqp5fICXXeew=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=sAfgYyr5l+Pw2NEZ832kEb555feQv0lDJWTTmToTjCZNa3XRqnvAIZFVcYDkLMBmf
	 pX4ZMGPZIetqYyQ6h6DRu3vC/EtvLtpGode7ClHrJairIPcWP0ZogzuxLuen37LUs3
	 Twby3fCQ44W8H4xK9skEBPWlIOxauUvwjsROGmVfM7vZ0YddgmKmi/EbClogTObZSf
	 /7ej3/tRLsSbpPVgLReqnr6kW3pEt18VJOPZJ4yCnBBrikLYpev+7ICkEx+1TIaAF6
	 e3kcPihgU0BQn35qOOWH9DrhhJlePfILvANLNL9jzP3NsAFQ/gk3SO7ohFh8iFRFac
	 JfWQUke9gR2pg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37ED1C43458;
	Mon, 29 Jun 2026 21:05:36 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Tue, 30 Jun 2026 05:05:28 +0800
Subject: [PATCH RFC] gpio: loongson-64bit: Add back the support for
 gsi_idx_map
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-loongson-gpio-v1-1-576908831fa0@gmail.com>
X-B4-Tracking: v=1; b=H4sIABfeQmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM2MD3Zz8/Lz04vw83fSCzHxdA0uDpCRDU8sUg1QTJaCegqLUtMwKsHn
 RSkFuzkqxtbUAIIfJuGQAAAA=
X-Change-ID: 20260630-loongson-gpio-090bb159d0e4
To: Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Hongchen Zhang <zhanghongchen@loongson.cn>, 
 Liu Peibao <liupeibao@loongson.cn>, Juxin Gao <gaojuxin@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Jianmin Lv <lvjianmin@loongson.cn>, 
 WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 linux-gpio@vger.kernel.org, Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3795;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=BhI6w+XNK6JQEt3uJcG82aV3eTG42V7G0R8z4wU74xU=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqQt4eD0ePio5j4B0x4KdoRtgFJPVvP5IqAGZeQ
 ExQB/17HZmJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCakLeHgAKCRCwMePKe/7Z
 blfUD/wM97+pH5K7X/5ezOgWWCFgnljEl2Nbt2LFczm+QruBFDgV2SWzKisaa6KOeN/sxeZVCWr
 8/Lg4PyhSJkZYwD46GOElPiHha5orzcAks/lUxiup6oh/aVJuvsgn5v0lWq7Mj/nE0YaDONfTA7
 5TziKjvHn/CidqtydDL5apjkKMAqFnqPEqXt89D/TLSB1HREQizEEgQD9JB+1T3r8p8/b79RWW4
 4UYv1JLToHLPa3HsuBw07Ba5zXQxnDf4Sk2GJGlhATRac5fjXjQ2lWIc+Ud7cotPSJtvdQyeutH
 1+CIhm2yfjtV21q8YJXN4Bge26BYc9+OCC5Eu2yOSn7GEp99BfIwINpKvdXWGnQCMaTNxLZOVxR
 OSEscqVNmiVjP3suVIQEJWeKvx9zHZFFdaGI4QPicNTQyWQs2TJ1kqK2A1Q2eqzdPx+MmgpmVYC
 PMmTTNxYoMoZ8g8F254UvluHOaoIVIvqiF10WWfrN24OBRTnHTkRAoai4p8hF/ScWrMCqgLx9TM
 fTB2ki8fidfTAG1JwzaiHW4zlVaEB3LttVdbBiZBrZ+f3hGqkq9u5mhenfXJFd5NCjEVykOnaLk
 dVxewNqkK4rxF+I5AVSKIFUJ8iPfdntrqdNtbTPEBcQDDFoPxx2YNha2euUYOe2UL1Jn3PzwrEl
 4ojrTw5zCAngxzw==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:zhuyinbo@loongson.cn,m:linusw@kernel.org,m:brgl@kernel.org,m:zhanghongchen@loongson.cn,m:liupeibao@loongson.cn,m:gaojuxin@loongson.cn,m:chenhuacai@kernel.org,m:lvjianmin@loongson.cn,m:kernel@xen0n.name,m:jiaxun.yang@flygoat.com,m:linux-gpio@vger.kernel.org,m:shankerwangmiao@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39166-lists,linux-gpio=lfdr.de,shankerwangmiao.gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	FREEMAIL_CC(0.00)[kernel.org,loongson.cn,xen0n.name,flygoat.com,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53C636DEC56

From: Miao Wang <shankerwangmiao@gmail.com>

This patch adds back the support for gsi_idx_map, which is used in the
ACPI DSDT table to describe the mapping between the GPIO line number to
the index of the interrupt number in the declared interrupt resources.

This property was removed in Loongson CPU Universal Specification for
Interface Between PC/Server System Firmware and Kernel v4.1 in November,
2023, but still in use in firmwares released this year. A sample of
an affected DSDT entry from a 3C6000 board I'm currently using is:

Device (GPO1) {
  Name (_HID, "LOON000F")
  Name (_CRS, ResourceTemplate () {
    QWordMemory ( // Omitted, not related
    )
    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {
      0x00000010, 0x00000011, 0x00000012, 0x00000013,
      0x00000014, 0x00000015, 0x00000016, 0x00000017,
    }
  Name (_DSD, Package (0x02) {
    ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301")
    Package (0x03) {
      Package (0x02) { "gpio_base", 0x50 } // Ignored by the driver
      Package (0x02) { "ngpios", 0x20 }
      Package (0x02) { "gsi_idx_map", Package (0x20) {
        0, 1, 2, 3, 4, 5, 6, 7,
        0, 1, 2, 3, 4, 5, 6, 7,
        0, 1, 2, 3, 4, 5, 6, 7,
        0, 1, 2, 3, 4, 5, 6, 7,
      }}
    }
  }
}

As can be seen in the DSDT entry, the mapping is essential for obtaining
the IRQ number from a GPIO line number. Otherwise, when IRQ is requested
for the line numbers largers than 7, it will fail with -ENXIO.

The code in this patch is mostly picked from the version 5 of Yinbo's
original patch.

Fixes: 7944d3b7fe86 ("gpio: loongson: add gpio driver support")
Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/gpio/gpio-loongson-64bit.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index 0fdf15faa344d2db0a1cf52dc52c3f58aabef49c..bff7d70e7470ea930ba29504533f11fa92e17620 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -46,6 +46,8 @@ struct loongson_gpio_chip {
 	spinlock_t		lock;
 	void __iomem		*reg_base;
 	const struct loongson_gpio_chip_data *chip_data;
+	u16			*gsi_idx_map;
+	int			mapsize;
 };
 
 static inline struct loongson_gpio_chip *to_loongson_gpio_chip(struct gpio_chip *chip)
@@ -145,6 +147,12 @@ static int loongson_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 		writeb(1, lgpio->reg_base + lgpio->chip_data->inten_offset + offset);
 	}
 
+	if (lgpio->gsi_idx_map != NULL) {
+		if (offset >= lgpio->mapsize)
+			return -EINVAL;
+		offset = lgpio->gsi_idx_map[offset];
+	}
+
 	return platform_get_irq(pdev, offset);
 }
 
@@ -326,6 +334,23 @@ static int loongson_gpio_init(struct platform_device *pdev, struct loongson_gpio
 		lgpio->chip.gc.to_irq = loongson_gpio_to_irq;
 	}
 
+	lgpio->mapsize = device_property_read_u16_array(&pdev->dev, "gsi_idx_map", NULL, 0);
+	if (lgpio->mapsize > 0) {
+		lgpio->gsi_idx_map = devm_kcalloc(&pdev->dev, lgpio->mapsize,
+						  sizeof(*lgpio->gsi_idx_map), GFP_KERNEL);
+		if (!lgpio->gsi_idx_map)
+			return -ENOMEM;
+
+		ret = device_property_read_u16_array(&pdev->dev, "gsi_idx_map",
+						     lgpio->gsi_idx_map, lgpio->mapsize);
+		if (ret != 0)
+			return dev_err_probe(&pdev->dev, ret, "failed to read gsi_idx_map\n");
+		dev_warn(&pdev->dev, "gsi_idx_map property is deprecated, consider upgrading your firmware\n");
+	} else {
+		lgpio->gsi_idx_map = NULL;
+		lgpio->mapsize = 0;
+	}
+
 	return devm_gpiochip_add_data(&pdev->dev, &lgpio->chip.gc, lgpio);
 }
 

---
base-commit: 4edcdefd4083ae04b1a5656f4be6cd83ae919ef4
change-id: 20260630-loongson-gpio-090bb159d0e4

Best regards,
-- 
Miao Wang <shankerwangmiao@gmail.com>



