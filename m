Return-Path: <linux-gpio+bounces-35616-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAEuBbO672knFQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35616-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 21:36:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A307479611
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 21:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 460D830666BE
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 19:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591DD4219E1;
	Mon, 27 Apr 2026 19:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3AzZTks"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D9D3914FC;
	Mon, 27 Apr 2026 19:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777318490; cv=none; b=sGVaclzBQEoYcfiuK28G5E3aDnRMoPr0+uZr58b/M5QAo4iUMI5o8Ta1AAjFm3hX15AnZraklVqCehCD8KHFXSsopHYUT1nAh4hHE+zlpirSMYsgxerVZ7vJh5RVrwqYt8cchwyoa+6cphIrEThHtkPj12keUrKMKjpk/lJ4+U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777318490; c=relaxed/simple;
	bh=rDqz766+E6phUQjlub0Ao54TKx1InCqtA9Pfpa7kJtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aA3EnITlcj+gIlS+uxr6XmWmS81fhA0SlqmO5EXSpmp02GrhSNEiCCuJ//mOg+oGxmf5q9pIX5lH8Xk/pD7bDOhRlSLgrjTXqq4IvncL53VNAGGGO4AwY/26XP7uZC0Ok6lDMQ5OUOe/lu43twwv6J9EhXMxVCDoQ96K6kTeXIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3AzZTks; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CB80C2BCB6;
	Mon, 27 Apr 2026 19:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777318490;
	bh=rDqz766+E6phUQjlub0Ao54TKx1InCqtA9Pfpa7kJtU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=b3AzZTkslsBmbUNSd5Wrxhm9DpXJZcoJKtKNPFzQJh6Lc/hDguf1vg6DgoWqmnwzq
	 rZRnjoq22w9XU/OsFUUwfQtlUt9TyvF3ZiT8dli5cJ27eXY0jqsQHMs9uPprTZy8zU
	 7GZU1AGcQ6/8VrTlzF1Dau7z/3qEyMC26khEruUyACD5PCpIayPE//dFdjzx77LXn3
	 aWuxqzxZd/HMQyY+PNaJ+yuts+0WH/GuwL5Ota26Uww+KBzXmaNHwUvp7nckvIllkx
	 VtVb/o7nVZKXXeAiu6ZpIhjemufYebJeheYjjuXoGCU5CEmazRTp5/sYj4zU6sDKjK
	 wUQUQl+WfiSQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75330FF8860;
	Mon, 27 Apr 2026 19:34:50 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Mon, 27 Apr 2026 21:34:47 +0200
Subject: [PATCH v2 1/8] dt-bindings: arm: qcom: Add Samsung Galaxy S4
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-mainline-send-v1-sending-v2-1-dcaa9178007b@alex-min.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777318488; l=762;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=pN5zSMRd7VPt+prprAXYp+uFxzoyOlObA2TSxPHx4vo=;
 b=MAf7IlcrrpOwvS7ItL7RfCDkZ2bREHw2T/E+ZzGhSPDT/pltyVLslIynsKNMux6GE17SwkIEz
 DZ4AHb+03rsCLe/HE3zA1iEP5fA6uD8rBsGBspx2cX4ABB0viwAvlJV
X-Developer-Key: i=contact@alex-min.fr; a=ed25519;
 pk=KOCaxY4v16ptaT0uk1FRkuaDF2n1JhmnYwLiqWD76M4=
X-Endpoint-Received: by B4 Relay for contact@alex-min.fr/20260421 with
 auth_id=743
X-Original-From: Alexandre MINETTE <contact@alex-min.fr>
Reply-To: contact@alex-min.fr
X-Rspamd-Queue-Id: 8A307479611
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
	TAGGED_FROM(0.00)[bounces-35616-lists,linux-gpio=lfdr.de,contact.alex-min.fr];
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

Add the compatible for this Samsung smartphone, codenamed jflte.

Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..b7e186ed2efc 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -39,6 +39,7 @@ properties:
           - enum:
               - asus,nexus7-flo
               - lg,nexus4-mako
+              - samsung,jflte
               - sony,xperia-yuga
               - qcom,apq8064-cm-qs600
               - qcom,apq8064-ifc6410

-- 
2.43.0



