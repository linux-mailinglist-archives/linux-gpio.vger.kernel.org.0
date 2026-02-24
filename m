Return-Path: <linux-gpio+bounces-32131-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJ90HOaonWnRQwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32131-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 14:34:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D3005187C2C
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 14:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6646730B9BE9
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 13:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E1639E178;
	Tue, 24 Feb 2026 13:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="AwS1Pkiz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D38139E172;
	Tue, 24 Feb 2026 13:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939876; cv=none; b=qzSFlejU9zseXJKElsKpFZRgSt/GVHE7KKqSlwYw5vmDioFYd9eykHzKZOMV0K9c8beci7YiN/bLwJ5m1uDtvomszio5Ez/gRmUkHcqVxwDX4UIsyhG+1XQzT9xHmgEyz4k7RAN6aP24a83LABO5wIE7HbAhhy9v1YIfG1vFaFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939876; c=relaxed/simple;
	bh=5ffcBWZeijMOSAWyX5oB7Odgdd8cbendy5ri/h5ShUg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J0gRZBzQIzHOuYaUZaNrvtyiEUmS1dBgUmcBHV8OamzAT4BJi3BR2ci7hVX+bOu4qetm4Gyeud9rzqowB2XKGISR/cE3D643wko/E/PhLjeU9bFWzNM29fTKPIM2HVpaDgVgQaXIYgu/kBv/ErJN3i9QzpphX51B6oGr8d8d08M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=AwS1Pkiz; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1771939876; x=1803475876;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5ffcBWZeijMOSAWyX5oB7Odgdd8cbendy5ri/h5ShUg=;
  b=AwS1PkizotS5zlEL/UYMHgLKU1tyjealqpLch1tyV4J2jyGe7vBXQQDz
   kBR6zcmW2w9Nx2IAo8RuhN06nM9H7stXOF1yW1pdaupzmF0n/Xf1vxN8E
   QTN+RS3Wi0ZgRh9QGUOCyecJF/cxKt5nCK2j6ntn7ZxelgWdyiFUlcIii
   JI2HfQE+IF3sXrHUezS+nVf+xVWZb6AJ2tdO6DswLQIdRdNWZd7v3dICY
   u+SVhYPMTIwYrxt1tBfi0INjxkZXrXN4HURXqzopafX4la8b1S05qTQ61
   GTGZ41RBHefcqARPQdGyZDbxNXI+pxQa8IcOpG9gNeeI6AvfG9qT5BVtJ
   Q==;
X-CSE-ConnectionGUID: lPvMeBZERyqEuwBJqGyVBA==
X-CSE-MsgGUID: UtDNTGI2TcyLs2uFkrWP6Q==
X-IronPort-AV: E=Sophos;i="6.21,308,1763449200"; 
   d="scan'208";a="285147689"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 06:31:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Tue, 24 Feb 2026 06:30:47 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 24 Feb 2026 06:30:45 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linusw@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] pinctrl property checks
Date: Tue, 24 Feb 2026 13:30:15 +0000
Message-ID: <20260224-backspin-ferret-7887166e4aa4@wendy>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=784; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=5ffcBWZeijMOSAWyX5oB7Odgdd8cbendy5ri/h5ShUg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDJlzl78wdp3EdWdr6lKeqyzasdpTZrDdNllbqeGf3KCfYHHJ PNK/o5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABPhl2f479WmeeT/Otvs6vD4qprFOp wyO6On7/QM2ebxMqhHiv89UEVsQ2+u4Iar+s/rAs7OTJtm8vkhz02lQpNwoxcC04++cmcAAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32131-lists,linux-gpio=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[conor.dooley@microchip.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[microchip.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D3005187C2C
X-Rspamd-Action: no action

Hey Linus,

Here's a !rfc version of these property checks. Nothing has changed here
outside of a rebase on v7.0-rc1.

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


