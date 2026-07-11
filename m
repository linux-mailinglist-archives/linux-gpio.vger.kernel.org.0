Return-Path: <linux-gpio+bounces-39918-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YAUhDV2wUmqHSQMAu9opvQ
	(envelope-from <linux-gpio+bounces-39918-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 23:06:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B71DB742EA0
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 23:06:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nabladev.com header.s=dkim header.b=J2rABFOo;
	dmarc=pass (policy=reject) header.from=nabladev.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39918-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39918-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7774B3066415
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 21:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE02231813A;
	Sat, 11 Jul 2026 21:02:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85526318B9B;
	Sat, 11 Jul 2026 21:01:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783803727; cv=none; b=J2hcysSrhQpwU8ZiGOORjVTB53kYX9x0uONnt93YdDHCj8Sk6dyvGaRXsCsYs1xdXtuXVk+cjicDvaLoRyXl+PamI8vkec090OPEtRt6MIMDE02oeMtHWUaS2iKYMYmyBzQfKSiNuM56xVWZlCnl+ZqYL5Nfwo2NeToiVmQzX7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783803727; c=relaxed/simple;
	bh=GgGCLi9ojFoIDuvfQJc4QBUOH4bh/fpD4FBAIKePpG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nafPGjly+Gvjf7jZZLOmMkBgegZ2hxlemQT48QuM8ZfGA8ZiWzA3BOXryvK9DYR0oUdYNSHmtjsJApOBPBouWIsqni/9EqZAqaO625paaHgfjOspG8wDI+r3BDdm/OnYK3o4q7Gwu0t+gui89YreELDScLAWxWHu76ggUWOnCwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=J2rABFOo; arc=none smtp.client-ip=178.251.229.89
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1DFE8119852;
	Sat, 11 Jul 2026 23:01:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783803715; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=blLlBGuvOatZK+tYYkPT/B5F2mpzYMtZI3nJxinObmM=;
	b=J2rABFOoZHPoiDsWkKN7u+y7qutobLmqgJr5/F1fKTFJlKlmYiSepfVAwm/MzvIXgd45Yc
	TbicaX+qelKNDkZLWtzp3lBbV9tv5C1HQTSapfCF/OFP8DHuiNftjgQ3XQeS7ytykUvkBM
	RZ3G9ku3UcuMJJWNXSE0hfygb6SMiCa/1u3qot8RK5q2BdiBr8Rq9ZmuuNkqt+Tfihgg64
	tdmvJEc+xHC6lJaTgbr/9bGDqZ2n1t73Jlfh5sVAjtZ/Uoj0zVrtDP+uM+TcWbH1gV+cYX
	s5hvNlKcTiSMtY8l+5WtGzbsRG9g5jadPdeV2VU3YQSolrIsDG1jkRdPmQ+RDA==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 10/10] MAINTAINERS: Add DH electronics DHCOS SoM entry and fix email address
Date: Sat, 11 Jul 2026 22:59:39 +0200
Message-ID: <20260711210131.236025-11-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711210131.236025-1-marex@nabladev.com>
References: <20260711210131.236025-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nabladev.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nabladev.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39918-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[marex@nabladev.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:marex@nabladev.com,m:alexandre.torgue@foss.st.com,m:brgl@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:kernel@dh-electronics.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[nabladev.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marex@nabladev.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B71DB742EA0

Add another SoM type N: match and update email address to an
up to date one in the process.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8729cea57c3dd..3532d425e41f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7518,11 +7518,12 @@ F:	drivers/iio/chemical/sen0322.c
 
 DH ELECTRONICS DHSOM SOM AND BOARD SUPPORT
 M:	Christoph Niedermaier <cniedermaier@dh-electronics.com>
-M:	Marek Vasut <marex@denx.de>
+M:	Marek Vasut <marex@nabladev.com>
 L:	kernel@dh-electronics.com
 S:	Maintained
 N:	dhcom
 N:	dhcor
+N:	dhcos
 N:	dhsom
 
 DIALOG SEMICONDUCTOR DRIVERS
-- 
2.53.0


