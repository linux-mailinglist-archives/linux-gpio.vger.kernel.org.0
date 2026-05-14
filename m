Return-Path: <linux-gpio+bounces-36869-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFoCEiwqBmorfwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36869-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 22:01:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4403C5469B6
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 22:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4BB5F30189AF
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 20:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C553911A8;
	Thu, 14 May 2026 20:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EuvNSv1F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFEB3191CA;
	Thu, 14 May 2026 20:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778788897; cv=none; b=hgtxH6MjLtZWRVl5ywHZmP5f82EPrDK0Sgt48CKvurEVNNAvzIwMf/1AroyTKWl9PTIv1eppBvWSePFieZ1jirVX7MAC6YSOC/X3B7IhN9q0SYAQOM/3pZ3w+H7OA6YOiVF5LijdKpZp3sej0pjb3Osag3XDRQLPA+b1argxao8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778788897; c=relaxed/simple;
	bh=6BgtVT3fOSsN+GAKRif20g8CV8VCCNaZiM7cc4vJ8Ug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T8FHc2G0PBiS8PxDWRluaggyYC/NJ9KCsf+7gMyPpPEsCHPbcV4rlPFf4X8r8Iu0Q1jJHDBS1nKjXutEwZo7BaPV5sA/ODwpVs1mQc8tGLttsqfpMc0noZPbX1P+cfn0c59s7vAiCTXTVgCIP4cxmViyg9BXAYzAF8GQapTqGx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EuvNSv1F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1705CC2BCC9;
	Thu, 14 May 2026 20:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778788897;
	bh=6BgtVT3fOSsN+GAKRif20g8CV8VCCNaZiM7cc4vJ8Ug=;
	h=From:To:Cc:Subject:Date:From;
	b=EuvNSv1FrPC74rrqLc/eHj0TXD0yRgzz0YPhMNHFZtgia4d6FaZ3U35hygFmC1FZs
	 Zi/dOhJdEzUXE9DEcXnzbmTXYQLvzf6h8CpYbDIMfxp1G/bIkTUgbJag7wZdWOUtbM
	 1RfPZMyF7aoKQNSsMAi5Ck12sq6dA+09HkR/agGPUp2888IvjzZbymmG+gA8sbtpuP
	 LlzvR3MNQsSiVC0yaxZikQC0y1FgZ/gQEiJXU1+2hxShD9Up+prdUHsS8fw/AazAOR
	 wqyXVEayPndzMcer+HzrlbRJf5L6wstYRdkOOmDhP2uWs4i/i85zDHpjih53c40kZq
	 O/iwk/TWxtmpw==
From: Conor Dooley <conor@kernel.org>
To: linusw@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] pinctrl: fix signature of extract pinctrl_generic_to_map() in nop case
Date: Thu, 14 May 2026 21:01:27 +0100
Message-ID: <20260514-slum-sprinkler-8f858eb81faf@spud>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1292; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=SC2IH34koFfd/yHxbPHFv0okRd7F+Q5jczbZJ4+0xuw=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlsWmK/S7+m698T0JlXLvHyfGBRkvG1Opsf7zUXfqpfs u1iutrvjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzkQjAjw97PHxbdMU1432PW d6PBoux8QbTEvEJjvwmt/RfON3M+CWBkmJHo8feG95upEx87Zp7fN/WB9Y7NiqL1GvxiDsZqwj4 LWQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4403C5469B6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36869-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email]
X-Rspamd-Action: no action

From: Conor Dooley <conor.dooley@microchip.com>

The signature of extract pinctrl_generic_to_map() is incorrect when
CONFIG_GENERIC_PINCTRL and CONFIG_OF are not enabled. Probably a
hangover from an earlier revision of the patchset that was not updated
that went undetected given it depends on OF being disabled.

Fixes: aaaf31be04260 ("pinctrl: extract pinctrl_generic_to_map() from pinctrl_generic_pins_function_dt_node_to_map()")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Linus Walleij <linusw@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 drivers/pinctrl/pinconf.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index fa8fb0d290d1d..9711d16c38b62 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -195,7 +195,7 @@ pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
 		       unsigned int *num_maps, unsigned int *num_reserved_maps,
 		       const char **group_name, unsigned int ngroups,
 		       const char **functions, unsigned int *pins,
-		       void *function_data)
+		       unsigned int npins)
 {
 	return -ENOTSUPP;
 }
-- 
2.53.0


