Return-Path: <linux-gpio+bounces-34910-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMPtKSFT12kFMggAu9opvQ
	(envelope-from <linux-gpio+bounces-34910-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 09:20:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 404413C6E9C
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 09:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9CB2300EA9D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 07:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B1F2DF132;
	Thu,  9 Apr 2026 07:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V20fZ9gM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CAA34D38B;
	Thu,  9 Apr 2026 07:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775719176; cv=none; b=Qn//HEddxRuoe+GFeDJZnFlB2VbfLDYeYYa0pfzlcalwRj/7S7Kjp8c/opada824HCi5ldC5QMuOnwtFk9NzSQUZ68Tt/HswBTSHZq4h8HeKS6VQGofKsQmek1W2PYCaiT98nCwSjJcti3gMJNx3i6ww8sO4mOR0g46rQ2AcbGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775719176; c=relaxed/simple;
	bh=vlzunX0HLo4Z3D9aYKkoVB7+V556R4yLwQU2AraT0zY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WEN1XLHTkKhfsvqDm2Jz9NQ+4igwpJiLZyoHBgipXcyvPtg32TSEIQLcBYrMslNlewO6W9lLFv+QN8unCdp3V8C8yB7ivWf2+MD+tyFpCXZQDDFPyei/im8TfUpnIs0tiTCOUxdvGreMB4R0dzgLaDtDp7AsOb9RRdjjSeShWcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V20fZ9gM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E307C4CEF7;
	Thu,  9 Apr 2026 07:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775719175;
	bh=vlzunX0HLo4Z3D9aYKkoVB7+V556R4yLwQU2AraT0zY=;
	h=From:Date:Subject:To:Cc:From;
	b=V20fZ9gM+N1AUn2v8N2kDZmDCFA00ZSMLlsZbL5p15o3U6T+Lyr9dsO04U7Vzecr2
	 zuIb/JJI/ranl3uir144v2CR3VtBBW56VQnGLncdvJ4EuchCo84UTzpA+CbNaCoBB7
	 hL6GmObqtZKL0PxbZQMsDnPm4cdHI4ZGMdvdImUuix+4OLA2bMRcBPv0umB+71kCpM
	 3ZnDrzWNwbznApjQnR1GNgkwutcBBHBQLgrTBuHmQwKPUi3ipY63Im6NkDFnTCY7Wk
	 oflu+z8d0jp/lHK1oCwgzGY2zhKLOzodsMCc//5dVV/jDl2plghsFpL5UmwIwZx5nV
	 cJssR4oPX2Kvg==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 09 Apr 2026 09:19:32 +0200
Subject: [PATCH] pinctrl: qcom: sdm670: Staticize groups and functions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-fix-sdm670-v1-1-8fe04a34968a@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNL3bTMCt3ilFwzcwPdNMNkM1MTy2RD02RzJaCGgqJUoCzYsOjY2lo
 ACVYNrlwAAAA=
X-Change-ID: 20260409-fix-sdm670-f1c6549c15c7
To: Bjorn Andersson <andersson@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34910-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oss.qualcomm.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 404413C6E9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The kernel test robot complains about undeclared local functions.
Fix it up.

Fixes: 9826035a75da ("pinctrl: qcom: add sdm670 lpi tlmm")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604080950.Mvm8aN0a-lkp@intel.com/
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
index 6270c6d09c22..858146c408d0 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
@@ -80,7 +80,7 @@ static const char * const pdm_sync_groups[] = { "gpio19" };
 static const char * const pdm_tx_groups[] = { "gpio20" };
 static const char * const slimbus_clk_groups[] = { "gpio18" };
 
-const struct lpi_pingroup sdm670_lpi_pinctrl_groups[] = {
+static const struct lpi_pingroup sdm670_lpi_pinctrl_groups[] = {
 	LPI_PINGROUP(0, LPI_NO_SLEW, _, _, _, _),
 	LPI_PINGROUP(1, LPI_NO_SLEW, _, _, _, _),
 	LPI_PINGROUP(2, LPI_NO_SLEW, _, _, _, _),
@@ -115,7 +115,7 @@ const struct lpi_pingroup sdm670_lpi_pinctrl_groups[] = {
 	LPI_PINGROUP(31, LPI_NO_SLEW, _, _, _, _),
 };
 
-const struct lpi_function sdm670_lpi_pinctrl_functions[] = {
+static const struct lpi_function sdm670_lpi_pinctrl_functions[] = {
 	LPI_FUNCTION(comp_rx),
 	LPI_FUNCTION(dmic1_clk),
 	LPI_FUNCTION(dmic1_data),

---
base-commit: 7648112358a4207916d3e38bfee49f85552fe95f
change-id: 20260409-fix-sdm670-f1c6549c15c7

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


