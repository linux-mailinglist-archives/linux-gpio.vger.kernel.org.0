Return-Path: <linux-gpio+bounces-37120-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJ1ALAUPDGqJVAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37120-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 09:19:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 187D5578E29
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 09:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 782053050C94
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 07:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1BC73D3480;
	Tue, 19 May 2026 07:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WYIcLnXD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2D43CF661;
	Tue, 19 May 2026 07:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175001; cv=none; b=To8/8mr93RXw7Wb0ueqIBk3k6KJtc1lRgwsEt3/yUmZp11zZy+gz7wjbdeRSPV+Ru2YurgxGyqLX0CCms9ukmC1bCXQHTQ6gRGsG52p9hy9MbT8BU4TMyT8iV038X5s2UD7pl4DjnVgN+6KMIl2bMjp7Qkas7ffHHzXrAwWG9zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175001; c=relaxed/simple;
	bh=Djj4DA8V0onSZ02OPE+IzZkuFDVGk+DrM9lo8y2SZSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RFt2XJzG9mz6taJy+QpmySvCHhb7+eU8CrFRzo7Ey64q5j0KWqiV399powB1/Hltk5F1e4BF8qkvoRGfhxMU5DEAYlrW8nk+lfm6Is82ooJCqiEPe6MbP55O9ueuVYG0bkChsHIA9CK5lOrq44vMzDTZmQyA3qme3gOPmG9XDZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WYIcLnXD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E884C2BCF5;
	Tue, 19 May 2026 07:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779175001;
	bh=Djj4DA8V0onSZ02OPE+IzZkuFDVGk+DrM9lo8y2SZSQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WYIcLnXDhN/HpwyOetdA/X0HaCUvQRuyacn8o8UvCnsiqW+l6sDXXrirDHriwbf9d
	 OC8FIPZpFAoBVOy60gjzcvKVwyx8zRJpYcRwQNBbdeM9Sv9RfMforwGPArSVuFbPr5
	 DAW+GNR9qwFHgvpPuGCttEqxUnqbbZAopPHxvT3M/3lg/d3T3x5u7PHPt2DBUedxmv
	 p1zUep7HBiIOZQ+peF3/+vaW145+WzvqJiu7bOKIzjYrg0KJo0bLLMrHPnvEpxt+6C
	 1QGAcKR22jAT54BjkYON2k16ZB/18vx0YSH7u43HeGP5arZ8KCStEBh2gCDS+O8AQa
	 h35pMy2wA37Nw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B2ACD4F5E;
	Tue, 19 May 2026 07:16:41 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Tue, 19 May 2026 09:16:34 +0200
Subject: [PATCH v3 4/8] iommu/msm: Look up masters per IOMMU instance
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-mainline-send-v1-sending-v3-4-3dd7aa125353@alex-min.fr>
References: <20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr>
In-Reply-To: <20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779174999; l=3959;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=1JcBVPryARcXpHswW3TvhWpd0BaNOt71q4/rKhmP4NY=;
 b=43/ECducmaYKKHHryMjqR7lNJK88dsGF3kxnxiw9osUZuI+wGngT5yo7SAUym0nV8DwnHMncF
 rJhmDU6EW9pD3pdRnzOuKg845DjY30uaPf0tIdbuZwnLCwieqKR9t/1
X-Developer-Key: i=contact@alex-min.fr; a=ed25519;
 pk=KOCaxY4v16ptaT0uk1FRkuaDF2n1JhmnYwLiqWD76M4=
X-Endpoint-Received: by B4 Relay for contact@alex-min.fr/20260421 with
 auth_id=743
X-Original-From: Alexandre MINETTE <contact@alex-min.fr>
Reply-To: contact@alex-min.fr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37120-lists,linux-gpio=lfdr.de,contact.alex-min.fr];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[contact@alex-min.fr];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,alex-min.fr:replyto,alex-min.fr:mid,alex-min.fr:email]
X-Rspamd-Queue-Id: 187D5578E29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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



