Return-Path: <linux-gpio+bounces-32132-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Dz3DlutnWmgQwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32132-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 14:53:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD9A1880E2
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 14:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AD941300D540
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 13:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570E139E186;
	Tue, 24 Feb 2026 13:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="lvx3PzsL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D7439E17E;
	Tue, 24 Feb 2026 13:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771940397; cv=none; b=MrxntnQq6Vc92vjpff7w2jwulMc6LG8IXfv9rdtQRvIWtQQRm2pJ8hcNq2k0ZiimAqb6ljDdzLVuUrxFgN3shSjgZIhvqVGAUuuObreFGQrxD/rGThU1BkYJEKgkQThh98YZ4yaiZxPhnd76IL1kQ7W1uFqCTsIqBi9jafI8834=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771940397; c=relaxed/simple;
	bh=LpFHGyQag5O2QTjUwJn/bYo4uWp6ZlRKHBwOpWPMXis=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ol8TnW2XU4iji95J7P2HkkGatS47m8m2Ze36KvbHQb3ufAiBOd2azBZHfKPANiXiBl8ahKGP/a062S+nfWetghn0dJ5ooIadZZxPhoFgfETZs0oyz/61PNSWzwMN5YKzdUzESY7biZoikIvygWPXe/jhGCTne702skR3YpVeRYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=lvx3PzsL; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1771940396; x=1803476396;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LpFHGyQag5O2QTjUwJn/bYo4uWp6ZlRKHBwOpWPMXis=;
  b=lvx3PzsLsIu9L1v3bDtcTl2KL1eUmRsExlWqv0W6nUwGrpy/FQaH0f25
   1+Qsfp6fmTSWQOkWHi8Zx//AetgPA4aJ1AUaXKGDVEXTLPRxnY4H33XDt
   nqgJQmbQUXatl4Ot6XJj94KzvjB/p/ntvspOkaH8BDYhQXir/EZkOzWN3
   HIog+03oTzD9BsrHxk6DIbdPuEodD3zkmbXAd2gPUNrW2mle3/UVzl53U
   Ynb+3/OIcICDRw+HEGnlBQfQ4tCa86K3sNFCg3jk/0OErqLs7Ci2MVtuM
   bDwOPonpJE600PztjhzVFa6g3xIjIfAatItARfWETf1W4AfStCSvnjAlm
   w==;
X-CSE-ConnectionGUID: 1FlpOl2WSoSIXpPLSoXJig==
X-CSE-MsgGUID: mhKNk+TlTwWcpTSUgmy+wg==
X-IronPort-AV: E=Sophos;i="6.21,308,1763449200"; 
   d="scan'208";a="53771063"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 06:39:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Tue, 24 Feb 2026 06:39:35 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 24 Feb 2026 06:39:33 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linusw@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RESEND PATCH v2 0/2] pinctrl property checks
Date: Tue, 24 Feb 2026 13:39:03 +0000
Message-ID: <20260224-stimulate-fraying-29ac76f6c55e@wendy>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=857; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=LpFHGyQag5O2QTjUwJn/bYo4uWp6ZlRKHBwOpWPMXis=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDJlzV/7Y+Kutjc33qgDD2WX68yx0VhTKbLg1nS/lidOxcFPN wOn3O0pZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjARJ1mGvzIFgTvXal8NFItIkTtXJx vi/klmtkZYdXSiEs+ZQA/WCYwMHw+Zz199rqz22CXm7KlhTjcerC75MeElQ8O9qk1ebAfKeQE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32132-lists,linux-gpio=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[conor.dooley@microchip.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[microchip.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5AD9A1880E2
X-Rspamd-Action: no action

Hey Linus,

Here's a !rfc version of these property checks. Nothing has changed here
outside of a rebase on v7.0-rc1.

Resending because I managed to lose the CC list on all but the cover.

Cheers,
Conor.

CC: Linus Walleij <linusw@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (2):
  pinctrl: pinconf-generic: perform basic checks on pincfg properties
  dt-bindings: pinctrl: pincfg-node: add restrictions on conflicting
    properties

 .../bindings/pinctrl/pincfg-node.yaml         | 105 ++++++++++++++++--
 drivers/pinctrl/pinconf-generic.c             |  41 ++++++-
 2 files changed, 138 insertions(+), 8 deletions(-)

-- 
2.51.0


