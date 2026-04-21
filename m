Return-Path: <linux-gpio+bounces-35299-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONsBIldH52mw6AEAu9opvQ
	(envelope-from <linux-gpio+bounces-35299-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 11:45:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C48439065
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 11:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 94A473009E35
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 09:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD923B27E2;
	Tue, 21 Apr 2026 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="isJpwL9x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1B33AEF54;
	Tue, 21 Apr 2026 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776764713; cv=none; b=jwD0BxSGgGxrKkZaWTWAi2r0fPrNnhqLZ79guTSvHMU5orfe+6PPfinmr/S1MDw3pX7Tx1WIcTghwjowIjZeD0R//A1QdL5b33UN7uuTAhx0QMh/qlGT4YQ3Tmpui5MFbso/bN8XLvr7JArt+pwlZkbOf6W6QC2/yL1v9oysSJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776764713; c=relaxed/simple;
	bh=HcVOhAbSK02qjvp84X9PjvdvQIeKNGmDxr624WlbMDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BXFFdGmcPXWziQGf0iUI2wZNQ/ZIqaBItjVf+tcqnXFTnZ0ntk9yJyb/EB4Ht5XaAo9cLUvEDiI7AnpXAYnwLvy/1ARpQQWg22zKBVDEi4jWyPgINwfAz3sNkrdBPgPg82vsbvOhbQJpZZstOWRsbGXBHeDiSFi+EODVF0tm7ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=isJpwL9x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41422C4AF10;
	Tue, 21 Apr 2026 09:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776764713;
	bh=HcVOhAbSK02qjvp84X9PjvdvQIeKNGmDxr624WlbMDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=isJpwL9xof/kGK4AJWf75Vph1gdbyULIbU2RNL+HLuU643kz4erxVFocWPPVwxIl2
	 GpEtwP0JPYtSR1ZQNFcmvD29x0KVfZ7WamHa0OIiS6RmXN/w8TckBP5fM3NUtS4yNs
	 oD8ENzOXo47qUk80XU2/YQMVj9KZO8iEoEU7WlByXTJ+WNNBwBMDqFVa1CTpgjH+qF
	 npBn3RroirJV3SOzprrGnDvSpoU64ln1KCItDrcGhNzYjp62SahNNH5UWLRHwD4aRa
	 i59HygO1E99u240YoLHpTJkLgEhVWHvfiGpKK2syMz4G3Nuzp5CUIdS6J4SsvSpDNL
	 UpVRdjOtHjMZw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34246F327CE;
	Tue, 21 Apr 2026 09:45:13 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Tue, 21 Apr 2026 11:45:10 +0200
Subject: [PATCH 4/8] iommu/msm: Look up masters per IOMMU instance
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-mainline-send-v1-sending-v1-4-bcb0857724de@alex-min.fr>
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
In-Reply-To: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
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
 iommu@lists.linux.dev, Alexandre MINETTE <contact@alex-min.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776764711; l=3031;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=UrMTbZmWlSX+tqRYklfcc7/MU3hItTnCn3Swx8np/0k=;
 b=ysNmz9HJjSMgPgv7jED3yAV/X6Wskid2fofvFDhF3jxGMMWvJ0qATjOu2lFQg9SDM3VI+KmXu
 UfKhkT/d93sCwc4eOBXCsMPptc72IZAiSkDVuaw69Kq3sM12mrg/cS1
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35299-lists,linux-gpio=lfdr.de,contact.alex-min.fr];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[contact@alex-min.fr];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,alex-min.fr:email,alex-min.fr:replyto,alex-min.fr:mid]
X-Rspamd-Queue-Id: 58C48439065
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alexandre MINETTE <contact@alex-min.fr>

MSM IOMMU stores context descriptors on each IOMMU instance. Looking up
the descriptor through dev_iommu_priv_get() is not sufficient because a
device can reference multiple IOMMU provider nodes.

Look up the master from the target IOMMU ctx_list instead, and use the
same helper when probing and attaching devices. This avoids dereferencing
a NULL master when an IOMMU already has context entries for another
device, and keeps separate context descriptors for separate IOMMU
instances.

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



