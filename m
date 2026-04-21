Return-Path: <linux-gpio+bounces-35295-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mI5LBgRI52kF6QEAu9opvQ
	(envelope-from <linux-gpio+bounces-35295-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 11:48:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1D1439140
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 11:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80929305AD79
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 09:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A631D3AF66F;
	Tue, 21 Apr 2026 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iD67QomR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CEE3AE6F3;
	Tue, 21 Apr 2026 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776764713; cv=none; b=CJfmO3mhbB820cOkTgsnX4/wsLHGcA1sSHtOxee0V0edxwL6z+dc9AA5vDmBFv9E/zD3ga7u68obH3ky6vk5iGoU62XQvLs6lDZ7aBvfeEOC5TbOYY7XsMyzNZfft0gin4W64sAbZxuCiSlBLbxOKBEN69QqYnuMHxAhaR3+cf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776764713; c=relaxed/simple;
	bh=mPipYwK9VLZR38znykoW7GBA2phEVD7eZlvFmnR+xfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XPcFzT2L21bwFipPeFBghMQnlSh1zA6GZkyMCRISAx484I1bcaB0oVJ/9Wo0NHDRLO7lPYoB8All33xMeXb1k9pcwx8GFBQLMwjsh7bsT+tTudBhypL2RjhbfcTNzst9e3Bw5CiKjvn1NN7ZWC8qi0mRWsQu3DpE3vW4lRGqSgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iD67QomR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C687C2BCB0;
	Tue, 21 Apr 2026 09:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776764713;
	bh=mPipYwK9VLZR38znykoW7GBA2phEVD7eZlvFmnR+xfM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iD67QomRbgziVgted+XFBTrXjQYu4bDvN8w3uG7bpBwzZotLAE8UkeUDF1t8dJfiO
	 +H6dq68haeqTx5++HFMc9LXvc52S9JWGf1rtr8WZVWQjD4MTBUNBX6Mo3a2l8TiBET
	 7Bv8/AxnOJbdxzlKPmMMhm66+BZv1EbWJq6E66vLq+5X6r2J5F3TjbdMmoGMjUHOLB
	 d1RD0f3ZpuVgGfQ+f59N6fznw7c02ewItpjIgvki8TAuJQ2mkuzJF4FVGnHU+aWXkI
	 ptpzhvfDf49eBhCXC0SzL9AewtFPl+Q1zmdKpb8TocHmoDuKhpZ7itCBwlmqugJgZA
	 N7uAp2eupwCHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04C7F327CF;
	Tue, 21 Apr 2026 09:45:12 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Tue, 21 Apr 2026 11:45:07 +0200
Subject: [PATCH 1/8] dt-bindings: arm: qcom: Add Samsung Galaxy S4
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-mainline-send-v1-sending-v1-1-bcb0857724de@alex-min.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776764711; l=776;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=Akgl3hzfClofydDGp4o3os1sJpq4Hx+LaZv5zck8bfU=;
 b=+8CpDr4EzIFz+bunBXtMybY6nKObFYFwHNsn8kPnztW+RXdinyTWtxwdUvcKVVKiF4sqAFGWY
 uiqJGGzqA0gCp/6wT/Z/7k/9dTi8ZAIh9ZbiqknebkATY+p+fp7BPCf
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35295-lists,linux-gpio=lfdr.de,contact.alex-min.fr];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[contact@alex-min.fr];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alex-min.fr:email,alex-min.fr:replyto,alex-min.fr:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AC1D1439140
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alexandre MINETTE <contact@alex-min.fr>

Add the compatible for this Samsung smartphone, codenamed jflte.

Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..2ec9f8be9609 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -40,6 +40,7 @@ properties:
               - asus,nexus7-flo
               - lg,nexus4-mako
               - sony,xperia-yuga
+              - samsung,jflte
               - qcom,apq8064-cm-qs600
               - qcom,apq8064-ifc6410
           - const: qcom,apq8064

-- 
2.43.0



