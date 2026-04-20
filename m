Return-Path: <linux-gpio+bounces-35272-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIViFMxN5mmgugEAu9opvQ
	(envelope-from <linux-gpio+bounces-35272-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 18:01:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C4F42ED71
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 18:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF957308AB47
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 15:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB983D0917;
	Mon, 20 Apr 2026 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Diw8+RkR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E73F3D090A;
	Mon, 20 Apr 2026 14:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776695277; cv=none; b=gZqRuW9gYgHm7hW8yv3agt6/b+9ovv9+xge/e4Rw+t7xiUACwyB26EwYSUuaW26jHw9rCtVVl1e5IH/T+KwDIyT1Edd7LxCqNvCNi7z3TMTgdCi9W9lnI3kmTrr4r288Zaag7Nop2Bce6yP0Ei0oe0v+D8+PfhWwHooEjBrG/Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776695277; c=relaxed/simple;
	bh=GmHovF65AhcKaDhKuPYPUEDtvbz4tbknbmC0pegJ98Y=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QONeNlj1H0w2/ykuhbfgh07chvs3419/H5oU6FSmljLaj7pwBBevoTO9C5NI8BcoML7YqW4hbyb/Y6UkpOE0N0na8Jp+xpJYllFMo/4sqoK/Yihe7+Q5kS0A6Ku11AFpolTwHbqVuyD7CgVqE5s68mESJrvShFofzxBqCkfnzdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Diw8+RkR; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776695272; x=1776954472;
	bh=17HvWcOauQRMeOJCVn04433LU5s1g0RbLGiy/EatyKY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Diw8+RkRQZm1m+spZiGo/UjPxllqV+DYxMJhAgJjNLkqxY4dxb3HrjCegE6IQG0YW
	 xBTMRa69ZX/0lEFimD57oSJfAYjhNSUMVhPXKTyDINeho7Jev2c3tIaWvHjTOh0psW
	 O3zFTpA2EEMXETzAG2xZQg08R0yuEBZrHCP7cRRQChDKFQkK9J1Pb3jkKMiso1JLwS
	 WhLCWba3viy43ANNnWNnLhNh+sEecDM/BOxs0/9EERJ/PcWkEKwKqVro1LLwCJWZqp
	 pcbtiU/uIrI//oz31y730stRCG9aQraf6m227kcYl2yOS5ncxZY6DhWDvdAU6VSWeQ
	 TwhBuPUxZ7XTg==
Date: Mon, 20 Apr 2026 14:27:46 +0000
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v2 0/2] pinctrl: qcom: eliza: Split up some QUP pin groups
Message-ID: <20260420-fix-eliza-pinctrl-v2-0-b68329fd6701@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 5cbdbca9aa3f92a619abb89777b3915c0ea35c61
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35272-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,pm.me:dkim,pm.me:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 20C4F42ED71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Multiple QUPs have lanes that can be routed to one of two GPIOs and
collapsing them prevents devicetrees from requesting specific routing.

For example, a board that wires an I2C SCL line to one of two GPIOs
cannot request that specific pin with the groups collapsed.

This series splits them up so devicetrees can request the configuration
they need.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v2:
- Update bindings to reflect new split functions
- Link to v1: https://lore.kernel.org/r/20260418-fix-eliza-pinctrl-v1-1-864=
bf95ac83b@pm.me

---
Alexander Koskovich (2):
      dt-bindings: pinctrl: qcom,eliza-tlmm: Update function list
      pinctrl: qcom: eliza: Split up some QUP pin groups

 .../bindings/pinctrl/qcom,eliza-tlmm.yaml          |  13 +-
 drivers/pinctrl/qcom/pinctrl-eliza.c               | 200 +++++++++++++++++=
----
 2 files changed, 179 insertions(+), 34 deletions(-)
---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260418-fix-eliza-pinctrl-b6e66dd92766

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



