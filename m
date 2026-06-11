Return-Path: <linux-gpio+bounces-38349-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P4JeAc+yKmpkvQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38349-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 15:06:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFB16722F8
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 15:06:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VieB3606;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38349-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38349-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0F34F30345CD
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 13:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B123FE65D;
	Thu, 11 Jun 2026 13:03:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B6F402435;
	Thu, 11 Jun 2026 13:03:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781182997; cv=none; b=TArENfgtRvGIx0h3s8xDiC9ixGXI+Jx+BBNSLOwgVV6obHP+rI7IF5oPsrZmvy9GAlhyMwN13W3SpnS9l+Mn9cHQnbpF3PgpIastuJgiZgSVwWrYYhCOkOtGxDRnmwe5E4qSMBgeUykD2sG5Izl18zUBx3G8nDMe41B4ArEtg6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781182997; c=relaxed/simple;
	bh=y8QvJAFpRq/Nu4G7rOPBEVDheOqMAVcF03gYnzXnjSc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oqRz5qAvVVGsTPEEj59tPen+B13tAC9119wTsHSylN5yEzW7oNRdspZxjqWx/7FQQ0zOKixcgocY1rPUhfHJmFe4fFl7KKoDnpL8D/MG3HJh3lZj5xAPbG8kFlFjjT6558SSHgBHyC0rBgYKIQi7nKMgEOs6/W8Ak5RN4TE/TFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VieB3606; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991471F00898;
	Thu, 11 Jun 2026 13:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781182994;
	bh=x28qf66llMgEBHqRh59BFdnkE0BpEZ0N/dpuSpAErzs=;
	h=From:To:Cc:Subject:Date;
	b=VieB3606KhANk+tQJbbb2raJb73GpVBT5Y2q8wE7/b/ImcOOezqYiWvoL0xVncLN+
	 TtK9GV9ZYGvv4XQmesjFh8ZPwLDGkqK1+GX+LAXPmdpPfNu6v6ISQHxzUxg+Iw72b7
	 J3BMdxe65qO2rQ3PnmHby3B1vEN/gyIu+iJrekRXDhSfEgoJ8WAGp2SM1YHU09ne36
	 0t7y6JR3YjjXnz22LbS12+T0hbvGuGAD3ld5ZDeNF5+4bKXzGJ16BV5AzfpuYHCDyn
	 jnYxpcLo08k95wjr2gCdNbLriB3YR3FWGIrhNqoRQfIhO66/VypwY2yIupWjuPYlGO
	 Y7qTwPekLaNzQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Nickolay Goppen <setotau@mainlining.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: lpass-lpi: remove unused lpi_gpio_write function
Date: Thu, 11 Jun 2026 15:03:04 +0200
Message-Id: <20260611130308.3415258-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:ajay.nandam@oss.qualcomm.com,m:arnd@arndb.de,m:konrad.dybcio@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:setotau@mainlining.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38349-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,arndb.de:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AFB16722F8

From: Arnd Bergmann <arnd@arndb.de>

All callers of this function were converted to calling __lpi_gpio_write
instead, so it now causes a warning:

drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:82:12: error: unused function 'lpi_gpio_write' [-Werror,-Wunused-function]
   82 | static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,

Remove the unused function.

Fixes: b719ede389d8 ("pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 4d758fd117c4..fe7ec0176081 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -79,20 +79,6 @@ static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
 	return pm_runtime_put_autosuspend(state->dev);
 }
 
-static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
-			  unsigned int addr, unsigned int val)
-{
-	int ret;
-
-	ret = pm_runtime_resume_and_get(state->dev);
-	if (ret < 0)
-		return ret;
-
-	__lpi_gpio_write(state, pin, addr, val);
-
-	return pm_runtime_put_autosuspend(state->dev);
-}
-
 static const struct pinctrl_ops lpi_gpio_pinctrl_ops = {
 	.get_groups_count	= pinctrl_generic_get_group_count,
 	.get_group_name		= pinctrl_generic_get_group_name,
-- 
2.39.5


