Return-Path: <linux-gpio+bounces-35384-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OSgKLyk6Wn1gAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35384-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 06:49:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D8444D0D6
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 06:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 464F0303AF0C
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 04:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2762A3C9EE8;
	Thu, 23 Apr 2026 04:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="htpxUz07"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826AA384223;
	Thu, 23 Apr 2026 04:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776919421; cv=none; b=itmatQvB1y5QO0/QAzIWtuC08mF+AzP6eMnE4XLjAbfxS4ohnWun2AbBX6PRLRM04LEHXR66CELKbBzCMFWhTRnV6Iu3prh+H0huq4zQc5lHResbN/A/YTGqVpb4kKI5BATEtaT39je/Bel2rtO6j0nr0zuHkR4035l6C8zvXl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776919421; c=relaxed/simple;
	bh=Cd5Obz1rE9lB8TurwRF6gfQxSpkJbJTK9wYWgiVQU7A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y0sivQvKvnCQgQ/JEHODXPS0v3mdjWu20KFAaLtGccot4TpnesC1ad1wcP25Y94VBzwdNrAE42DRyNohLFW4FfvfSg69It9DVrvYSJ8j7blME+MYZvmSrPzCm3xD+qGSHICp+uWoROyu8Orao0FZ1R8R/0UC34WB/k6aK2RyDQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=htpxUz07; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776919412; x=1777178612;
	bh=3YpRMe4eq+9kvVEpuEVq/7OEd+FJoQgZ5KDIdTo0/CI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=htpxUz0734UtkdhxtKXaYjl+9bJFKpw/Q/Cjm6ljTWHpsAOmG+Hc/LUqiKjK4wmYr
	 YC1HEhk3L9zSPymfamGsBVgmh+liHkNhyPHX0BNMSFRBb026y4c9dgMdCYKp/GF0+J
	 mopJLXs8j2NqasUZf+VK2ydC15eLraC5EjXIP77yC1E7nHliV9wbyWhdit9G3sBnTG
	 QLSxv2IO5aLuP1eZLKAqiA6Pak6ZpJwNNtZACvdH7nI/tPni83KBgtDyeWRzOtSnDB
	 t/BgLD7RxA8MnBIKGiAN1RxHBFO+P4nm0tLMy+w2ZP/5MuDogV8UdzaCgVywX72ojJ
	 3j9X8+Gop6Enw==
Date: Thu, 23 Apr 2026 04:43:27 +0000
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v3 2/4] dt-bindings: pinctrl: qcom,eliza-tlmm: Split QUP1_SE4 lanes
Message-ID: <20260423-fix-eliza-pinctrl-v3-2-68b24893ae63@pm.me>
In-Reply-To: <20260423-fix-eliza-pinctrl-v3-0-68b24893ae63@pm.me>
References: <20260423-fix-eliza-pinctrl-v3-0-68b24893ae63@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: b256b5bd831f2ac16de20ce2d769ebd9bc005a43
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35384-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[pm.me:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,pm.me:dkim,pm.me:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 12D8444D0D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

QUP1_SE4 shares GPIO_36 & GPIO_37 for both L0/L1 and L3/L2 so the
function name cannot be the same or the alternate function cannot
be selected.

Split them up into individual lane functions so boards can specify.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml=
 b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
index be7b4680045f..fa0177529277 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
@@ -88,7 +88,8 @@ $defs:
                 qlink_little_request, qlink_wmss, qspi0, qspi_clk,
                 qspi_cs, qup1_se0, qup1_se1, qup1_se2, qup1_se2_l2_mira,
                 qup1_se2_l2_mirb, qup1_se2_l3_mira, qup1_se2_l3_mirb,
-                qup1_se3, qup1_se4, qup1_se5, qup1_se6, qup1_se6_l1_mira,
+                qup1_se3, qup1_se4_l0, qup1_se4_l1, qup1_se4_l2,
+                qup1_se4_l3, qup1_se5, qup1_se6, qup1_se6_l1_mira,
                 qup1_se6_l1_mirb, qup1_se6_l3_mira, qup1_se6_l3_mirb,
                 qup1_se7, qup1_se7_l0_mira, qup1_se7_l0_mirb,
                 qup1_se7_l1_mira, qup1_se7_l1_mirb, qup2_se0, qup2_se1,

--=20
2.53.0



