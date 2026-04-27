Return-Path: <linux-gpio+bounces-35618-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DvwDty672knFQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35618-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 21:37:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC50479662
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 21:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD97E307E89E
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 19:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1D94219FB;
	Mon, 27 Apr 2026 19:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7sNZe0N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A35A39183C;
	Mon, 27 Apr 2026 19:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777318491; cv=none; b=VNRqgWvP9gzFsvVdi3CDUAeBTSRWrFSqjYOaZYZ5+ZWCCFhytLkW5bfer9pkdgtO/iBUSeZOkwacrIH85oxc01odISX1Nc4t+NaBultVK3SAqqWPryb+d/H7uETEU+kaMRDOWXuBp1T4eMYOmsF6TSPjVApymuNvkt9YuEVfmJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777318491; c=relaxed/simple;
	bh=+w0LWswgfExLCbfWGN/kjH/uWfmMfzLcxZXCvXM5aQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hnG6E7opAQAdsMklj/Ey6c9PONxTv3d1//wWwjQqH2aomAjmDtRsWOkWPNUI+y+anagvOdi0+tzoe4ggF3gt79cyKOX5Acb9qG+QgF2RQfYB/2Vf74pBmAMdRav8ZLD00E3ygvoi5fnEambH6dD77bjWWAq1YOLXKJX5LuiQOco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7sNZe0N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF94CC19425;
	Mon, 27 Apr 2026 19:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777318490;
	bh=+w0LWswgfExLCbfWGN/kjH/uWfmMfzLcxZXCvXM5aQ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=l7sNZe0NhkpvJHeEly0F+InBOJcAO73au89mCyOufrN6iYF6XThkz413Zr++bozp8
	 a3s5Mj2dP8MgSw/ZYmW7ewcw6vVBxv5KTlZZ5qlfJMH/NJaTHmsJ44Z7feQjGBPTCe
	 vnpjkfx86bJAIVkCEk752dpF2sawgS3T6ByD9yqILSyYxb7WSg+Ivsdaf7UdM47Qv6
	 niRCm+xx59wlgIef2N0fw1HCoi+ia124YiUW1zLighZBbeoe5vS5dk+lJq6lzlVuBP
	 8iPMBA76mR8VVWg6Y7yto2gD4hc+E9App0Zj0ILXeRuD1SVXyrKO7PkKHnj3BQcc04
	 LlcFTD3mcjV0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D9BFF8871;
	Mon, 27 Apr 2026 19:34:50 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Mon, 27 Apr 2026 21:34:51 +0200
Subject: [PATCH v2 5/8] extcon: qcom-spmi-misc: Add PM8921 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-mainline-send-v1-sending-v2-5-dcaa9178007b@alex-min.fr>
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
 Alexandre MINETTE <contact@alex-min.fr>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777318488; l=1070;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=BB4ojfMkzmO4sNO4pn+20iT7YQPj9GzvZr/jFD2gdkk=;
 b=GEEjKnSycwg3zzmiHm5BVEZmcQMyWjztf9sE9PDLIcdzuxRwtxtzC1aVbQwk3ib2UyAFrOwSA
 hP6HJmfC0vmBYkGbOFoF9a6qx62tpTz2QLGDZQHtN29KIMbgxEzrmfM
X-Developer-Key: i=contact@alex-min.fr; a=ed25519;
 pk=KOCaxY4v16ptaT0uk1FRkuaDF2n1JhmnYwLiqWD76M4=
X-Endpoint-Received: by B4 Relay for contact@alex-min.fr/20260421 with
 auth_id=743
X-Original-From: Alexandre MINETTE <contact@alex-min.fr>
Reply-To: contact@alex-min.fr
X-Rspamd-Queue-Id: DCC50479662
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
	TAGGED_FROM(0.00)[bounces-35618-lists,linux-gpio=lfdr.de,contact.alex-min.fr];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,alex-min.fr:email,alex-min.fr:replyto,alex-min.fr:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Alexandre MINETTE <contact@alex-min.fr>

PM8921 provides USB ID detection through the USB_ID_IN interrupt, which
APQ8064 boards use for OTG role detection.

The Qualcomm PMIC misc extcon binding only needs the interrupt
description for this use case. Allow qcom,pm8921-misc without requiring
a register resource so boards can describe PM8921 USB ID detection.

Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/extcon/extcon-qcom-spmi-misc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/extcon/extcon-qcom-spmi-misc.c b/drivers/extcon/extcon-qcom-spmi-misc.c
index afaba5685c3d..6811d3383254 100644
--- a/drivers/extcon/extcon-qcom-spmi-misc.c
+++ b/drivers/extcon/extcon-qcom-spmi-misc.c
@@ -199,6 +199,7 @@ static SIMPLE_DEV_PM_OPS(qcom_usb_extcon_pm_ops,
 			 qcom_usb_extcon_suspend, qcom_usb_extcon_resume);
 
 static const struct of_device_id qcom_usb_extcon_dt_match[] = {
+	{ .compatible = "qcom,pm8921-misc", },
 	{ .compatible = "qcom,pm8941-misc", },
 	{ }
 };

-- 
2.43.0



