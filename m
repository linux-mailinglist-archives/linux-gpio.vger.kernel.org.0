Return-Path: <linux-gpio+bounces-35617-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK87J8+672knFQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35617-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 21:36:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 055B4479646
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 21:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B82C3307574D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 19:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C0C4218BD;
	Mon, 27 Apr 2026 19:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UiMm8uar"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD63C391505;
	Mon, 27 Apr 2026 19:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777318491; cv=none; b=AObOLj/u6UjVSYi830DH9upzPI9QLz23h4uOta9O3H4Fy5Omod/uORXgnRMJ5T3LlBHM35tNDMbPEWnxgcghnE44N8jmrz81M8QZzoFPGfBRzZ7S346fOv9oGFp49T/du4yqhxsSswY6Evh5ysKOsF9vhGjNUyED7T7c4hv6bw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777318491; c=relaxed/simple;
	bh=Djj4DA8V0onSZ02OPE+IzZkuFDVGk+DrM9lo8y2SZSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GsXooPLwD7BAjsdz/EcIoZr4OiLXKJPlhw9Y+UYy7Fcd1lW9tDJOXc0vgnb439FNAaNa2vC4kSOKkdLhjGaQslxvz/VvL2eP25yN8WZhvZrDjMtM7Xskkas4tI/kJPEE/OelG4iCmNQ2cFM7w0rTYwQDgR6+rC7CKTsHGJQTWgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UiMm8uar; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0750C2BCB8;
	Mon, 27 Apr 2026 19:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777318490;
	bh=Djj4DA8V0onSZ02OPE+IzZkuFDVGk+DrM9lo8y2SZSQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UiMm8uar4gP/J6Ql0zKDZUplt4IbcHxODxY+kcc3H5+fMrwocNiMaXgMXW+ySVLa4
	 f4g2nlSpENWmGFskLbWBbvpEJ3Nw5FGM7jCJi/NVHYR6z4m+z2G+aSHPrbkLiO84me
	 gTZf5Wa8Hdbt7WeW6sjjRMH61WPWg/x6N/GmAMA8uHvd7HN/JLDIMrdAPsZRFG0MdO
	 7R/HBYA1k59ZylMzFj6lrTq5bh4i3X+FZXLnAhUsbJjd/WMuRpRePnOIp0ZLJZspoG
	 4BWVdFMrV7YVBA+h4mRB9qlnXqHjNqltgZ+aqJjjNE1Uqr1o0kV6NmouCgqsVSD2Fc
	 yakWk6LzvHjag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A96CAFF8868;
	Mon, 27 Apr 2026 19:34:50 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Mon, 27 Apr 2026 21:34:50 +0200
Subject: [PATCH v2 4/8] iommu/msm: Look up masters per IOMMU instance
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-mainline-send-v1-sending-v2-4-dcaa9178007b@alex-min.fr>
References: <20260427-mainline-send-v1-sending-v2-0-dcaa9178007b@alex-min.fr>
In-Reply-To: <20260427-mainline-send-v1-sending-v2-0-dcaa9178007b@alex-min.fr>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Linus Walleij <linusw@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 iommu@lists.linux.dev, phone-devel@vger.kernel.org, 
 Alexandre MINETTE <contact@alex-min.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777318488; l=3959;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=1JcBVPryARcXpHswW3TvhWpd0BaNOt71q4/rKhmP4NY=;
 b=5XOC2OaldtQ1/p7DoGQyvI4znlWXoVAnNZPpzexhOajp6zxDrNkFAITLPL+f4vcXdeaXvbhPe
 03Vt1VkOdeyDYdBTlxDWYrwfaA7Z0dHQ9FssH2cQBSuxyXzQlSTm71y
X-Developer-Key: i=contact@alex-min.fr; a=ed25519;
 pk=KOCaxY4v16ptaT0uk1FRkuaDF2n1JhmnYwLiqWD76M4=
X-Endpoint-Received: by B4 Relay for contact@alex-min.fr/20260421 with
 auth_id=743
X-Original-From: Alexandre MINETTE <contact@alex-min.fr>
Reply-To: contact@alex-min.fr
X-Rspamd-Queue-Id: 055B4479646
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35617-lists,linux-gpio=lfdr.de,contact.alex-min.fr];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	HAS_REPLYTO(0.00)[contact@alex-min.fr];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alex-min.fr:email,alex-min.fr:replyto,alex-min.fr:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Alexandre MINETTE <contact@alex-min.fr>

MSM IOMMU stores context descriptors on each IOMMU instance. Looking up
the descriptor through dev_iommu_priv_get() is not sufficient because a
device can reference multiple IOMMU provider nodes.

Look up the master from the target IOMMU ctx_list instead, and use the
same helper when probing and attaching devices. This avoids
dereferencing a NULL master when an IOMMU already has context entries
for another device, and keeps separate context descriptors for separate
IOMMU instances.

On APQ8064 this crashes during IOMMU probe while qcom_iommu_of_xlate()
adds stream IDs for a device referencing multiple IOMMU provider nodes.
The failure comes from insert_iommu_master() dereferencing a NULL master
after dev_iommu_priv_get() returns no context descriptor for the current
IOMMU instance:

  Unable to handle kernel NULL pointer dereference at virtual address 00000088
  PC is at qcom_iommu_of_xlate+0x84/0x174
  Call trace:
   qcom_iommu_of_xlate from of_iommu_configure+0x140/0x234
   of_iommu_configure from of_dma_configure_id+0xec/0x3b0
   of_dma_configure_id from platform_dma_configure+0xb0/0xcc
   platform_dma_configure from __iommu_probe_device+0x270/0x450
   __iommu_probe_device from probe_iommu_group+0x24/0x48
   probe_iommu_group from bus_for_each_dev+0x7c/0xcc
   bus_for_each_dev from iommu_device_register+0xcc/0x220
   iommu_device_register from msm_iommu_probe+0x47c/0x578

This is required to boot APQ8064 boards using multiple IOMMU contexts.

Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
 drivers/iommu/msm_iommu.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 0ad5ff431d5b..9c03878d0d2c 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -357,17 +357,25 @@ static int msm_iommu_domain_config(struct msm_priv *priv)
 	return 0;
 }
 
+static struct msm_iommu_ctx_dev *find_iommu_master(struct msm_iommu_dev *iommu,
+						   struct device *dev)
+{
+	struct msm_iommu_ctx_dev *master;
+
+	list_for_each_entry(master, &iommu->ctx_list, list)
+		if (master->of_node == dev->of_node)
+			return master;
+
+	return NULL;
+}
+
 /* Must be called under msm_iommu_lock */
 static struct msm_iommu_dev *find_iommu_for_dev(struct device *dev)
 {
 	struct msm_iommu_dev *iommu, *ret = NULL;
-	struct msm_iommu_ctx_dev *master;
 
 	list_for_each_entry(iommu, &qcom_iommu_devices, dev_node) {
-		master = list_first_entry(&iommu->ctx_list,
-					  struct msm_iommu_ctx_dev,
-					  list);
-		if (master->of_node == dev->of_node) {
+		if (find_iommu_master(iommu, dev)) {
 			ret = iommu;
 			break;
 		}
@@ -405,10 +413,7 @@ static int msm_iommu_attach_dev(struct iommu_domain *domain, struct device *dev,
 
 	spin_lock_irqsave(&msm_iommu_lock, flags);
 	list_for_each_entry(iommu, &qcom_iommu_devices, dev_node) {
-		master = list_first_entry(&iommu->ctx_list,
-					  struct msm_iommu_ctx_dev,
-					  list);
-		if (master->of_node == dev->of_node) {
+		if (find_iommu_master(iommu, dev)) {
 			ret = __enable_clocks(iommu);
 			if (ret)
 				goto fail;
@@ -601,10 +606,10 @@ static int insert_iommu_master(struct device *dev,
 				struct msm_iommu_dev **iommu,
 				const struct of_phandle_args *spec)
 {
-	struct msm_iommu_ctx_dev *master = dev_iommu_priv_get(dev);
+	struct msm_iommu_ctx_dev *master = find_iommu_master(*iommu, dev);
 	int sid;
 
-	if (list_empty(&(*iommu)->ctx_list)) {
+	if (!master) {
 		master = kzalloc_obj(*master, GFP_ATOMIC);
 		if (!master) {
 			dev_err(dev, "Failed to allocate iommu_master\n");
@@ -612,7 +617,6 @@ static int insert_iommu_master(struct device *dev,
 		}
 		master->of_node = dev->of_node;
 		list_add(&master->list, &(*iommu)->ctx_list);
-		dev_iommu_priv_set(dev, master);
 	}
 
 	for (sid = 0; sid < master->num_mids; sid++)

-- 
2.43.0



