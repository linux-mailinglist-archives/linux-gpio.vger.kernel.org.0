Return-Path: <linux-gpio+bounces-34850-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOZQHKuZ1Wm07wcAu9opvQ
	(envelope-from <linux-gpio+bounces-34850-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 01:56:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BEA3B58F0
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 01:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCCDE301DBB7
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 23:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FD838E120;
	Tue,  7 Apr 2026 23:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XZzrEO4w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (lpdvsmtp12.broadcom.com [192.19.144.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C9B38D018;
	Tue,  7 Apr 2026 23:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775606181; cv=none; b=ZhD4xVgOuap8CENQlwj7aqi8B3rd/aIpdued4Wl5TebUkLQXgfQZrQi/3DREYXtcwMpzW7bXZvelkcb7J47NnAFKA1UPQ3NeTOwaE8enralO0p1FLscXEn7kkvuTQmA05R2vEf9ZWGai9QPEqpmw/Gn+r07AvUI51JBvV05TUIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775606181; c=relaxed/simple;
	bh=NkCIIF2z9mS3Ez9+Jxm0z7amc66BFTGeo8CZqQ83kuU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G2IlvxxokxsUMB2R6ff9xtCYBf5qjGmf5UyvJ4N0RbV7jEfOBx583pVdop8hTXmgIBYJJmeQewpJhuHagr1rBslVivb0aAg5GuuBsUW3CEDuBeD+ECwLBpRdFuVms6hQkfVX5gIyMLkY+spta50SM8z4OlIF82ZCrVSJqeBFibA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XZzrEO4w; arc=none smtp.client-ip=192.19.144.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 28278C030951;
	Tue,  7 Apr 2026 16:56:19 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 28278C030951
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1775606179;
	bh=NkCIIF2z9mS3Ez9+Jxm0z7amc66BFTGeo8CZqQ83kuU=;
	h=From:To:Cc:Subject:Date:From;
	b=XZzrEO4wWcbKmprJHvaeh0mtpymK8En4IwSJHqRqRN0sJsAjBw2idbX1GeEd99/5S
	 ihX+qHxe1vPoKoU/NmsJKGSWtv/BAnLZBtJebsD7FY4xKMYKpISPiQlbWmaPJpV82m
	 YHTSxn1jvkmfaTVSJwQRqTkad/ZPBHCJsz/I7Tl0=
Received: from stbirv-lnx-1.igp.broadcom.net (stbirv-lnx-1.igp.broadcom.net [10.67.48.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id 3930AAE80;
	Tue,  7 Apr 2026 19:56:18 -0400 (EDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:PIN CONTROLLER - SINGLE),
	linux-omap@vger.kernel.org (open list:PIN CONTROLLER - SINGLE)
Subject: [PATCH 0/2] Utilize pinctrl-single for bcm7038-style chips
Date: Tue,  7 Apr 2026 16:56:09 -0700
Message-Id: <20260407235611.550515-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=dkimrelay];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34850-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[broadcom.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,broadcom.com:dkim,broadcom.com:mid]
X-Rspamd-Queue-Id: 16BEA3B58F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch set allows Broadcom STB chips with the BCM7038-style
pinmux/configuration blocks to use pinctrl-single. This does not
preclude us from making use of a more sophisticated driver in the
future, should we need to.

Florian Fainelli (2):
  dt-bindings: pinctrl: pinctrl-single: Add brcm,bcm7038-padconf
  pinctrl: single: Add bcm7038-padconf compatible matching

 .../devicetree/bindings/pinctrl/pinctrl-single.yaml          | 4 ++++
 drivers/pinctrl/pinctrl-single.c                             | 5 +++--
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.34.1


