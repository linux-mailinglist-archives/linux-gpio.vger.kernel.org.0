Return-Path: <linux-gpio+bounces-32354-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNkpFCago2k3IQUAu9opvQ
	(envelope-from <linux-gpio+bounces-32354-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 01 Mar 2026 03:10:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AC11CD328
	for <lists+linux-gpio@lfdr.de>; Sun, 01 Mar 2026 03:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77F2E33BA007
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Mar 2026 01:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893F230F52A;
	Sun,  1 Mar 2026 01:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YNZJpZhs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41ED716132A;
	Sun,  1 Mar 2026 01:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329694; cv=none; b=MfmgOQ5HAMgRu9tzNLQ/nta284nXzIEfU4F1mjusneUNA3jbHbOgqxbKmkLC7YMNabP1Wy5906HGYl7VK5IEhuOE3P9b2jqdgGMHEaksRwjrpJajt2EWRXKX92ZqxNUzXPgyO120mYYpojaWmzUKJotQJxtGGcVdpErGSK980EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329694; c=relaxed/simple;
	bh=6bj+fMaNIPxmUtMI2fJjNQcqPGi5If0rEDq93u8+ivE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sjsf+F8u2Xb/ykjZkX2rQnMNnA4bMBXxd36HbztpHM08AuWvTsgVIs1apHDYGnTQTUFYA3Vdims+4QHshgapAb/ItrPM5IHnF/eBMClYDxtgLmoFsVzctF9HZbk1LFtGQeVShZLwN920ZLkNK5IkeTJImCaYXrj7C7IO0LjayWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YNZJpZhs; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=YY+xekhdVJW52itkHKARbbf+ZUuL7gL0RFcUCSQ6pI4=; b=YNZJpZhspLYsz9ZfJirE+cRL6H
	RgRLzxB27bcmMosc9MEbZ2enKGd1uMaRoKC9j7Bg4/Kr6bwY5jGLky3Dmpe50jgzijinDnBREKWFn
	j/BHGs4bLGzDOoSHaOjTU/UjCsGmPflgWsio2jNeAJ28/V1Uq0nQuQR6bj8cntcyjml5j41Qt7i7e
	gp9LXUsqiSnhQi3ZPQIPA6mOtKCzhotZm0crMEhY4FqARuXndB6bswAj6oikC4smHI6g4LIT7kBC+
	G+Ftw4MTcuVDGcD+7xx/QfP0OB4JW845Oi+7BfGCvlPpfhyeIG9GPxftxuNh2FOTErckKxiSB2Y0A
	zwYe0EoA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVum-0000000AeQq-0sau;
	Sun, 01 Mar 2026 01:48:12 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: nomadik: repair some kernel-doc comments
Date: Sat, 28 Feb 2026 17:48:11 -0800
Message-ID: <20260301014811.3133250-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32354-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:mid,infradead.org:dkim,infradead.org:email]
X-Rspamd-Queue-Id: A8AC11CD328
X-Rspamd-Action: no action

Avoid these kernel-doc warnings by:
- adding short descriptions for enums
- using correct (matching) struct names in kernel-doc short descriptions
- using the correct struct member name for @nfunctions

Warning: include/linux/gpio/gpio-nomadik.h:116 missing initial short
 description on line: * enum prcm_gpiocr_reg_index
Warning: include/linux/gpio/gpio-nomadik.h:125 missing initial short
 description on line: * enum prcm_gpiocr_altcx_index
Warning: include/linux/gpio/gpio-nomadik.h:146 expecting prototype for
 struct prcm_gpio_altcx. Prototype was for struct prcm_gpiocr_altcx instead
Warning: include/linux/gpio/gpio-nomadik.h:156 expecting prototype for
 struct prcm_gpio_altcx_pin_desc. Prototype was for
 struct prcm_gpiocr_altcx_pin_desc instead
Warning: include/linux/gpio/gpio-nomadik.h:212 struct member 'nfunctions'
 not described in 'nmk_pinctrl_soc_data'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org

 include/linux/gpio/gpio-nomadik.h |   12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

--- linux-next-20260227.orig/include/linux/gpio/gpio-nomadik.h
+++ linux-next-20260227/include/linux/gpio/gpio-nomadik.h
@@ -114,8 +114,7 @@ struct nmk_gpio_chip {
 }
 
 /**
- * enum prcm_gpiocr_reg_index
- * Used to reference an PRCM GPIOCR register address.
+ * enum prcm_gpiocr_reg_index - Used to reference a PRCM GPIOCR register address.
  */
 enum prcm_gpiocr_reg_index {
 	PRCM_IDX_GPIOCR1,
@@ -123,8 +122,7 @@ enum prcm_gpiocr_reg_index {
 	PRCM_IDX_GPIOCR3
 };
 /**
- * enum prcm_gpiocr_altcx_index
- * Used to reference an Other alternate-C function.
+ * enum prcm_gpiocr_altcx_index - Used to reference an Other alternate-C function.
  */
 enum prcm_gpiocr_altcx_index {
 	PRCM_IDX_GPIOCR_ALTC1,
@@ -135,7 +133,7 @@ enum prcm_gpiocr_altcx_index {
 };
 
 /**
- * struct prcm_gpio_altcx - Other alternate-C function
+ * struct prcm_gpiocr_altcx - Other alternate-C function
  * @used: other alternate-C function availability
  * @reg_index: PRCM GPIOCR register index used to control the function
  * @control_bit: PRCM GPIOCR bit used to control the function
@@ -147,7 +145,7 @@ struct prcm_gpiocr_altcx {
 } __packed;
 
 /**
- * struct prcm_gpio_altcx_pin_desc - Other alternate-C pin
+ * struct prcm_gpiocr_altcx_pin_desc - Other alternate-C pin
  * @pin: The pin number
  * @altcx: array of other alternate-C[1-4] functions
  */
@@ -193,7 +191,7 @@ struct nmk_pingroup {
  *		numbering.
  * @npins:	The number of entries in @pins.
  * @functions:	The functions supported on this SoC.
- * @nfunction:	The number of entries in @functions.
+ * @nfunctions:	The number of entries in @functions.
  * @groups:	An array describing all pin groups the pin SoC supports.
  * @ngroups:	The number of entries in @groups.
  * @altcx_pins:	The pins that support Other alternate-C function on this SoC

