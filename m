Return-Path: <linux-gpio+bounces-31404-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIN4BYIygml5QQMAu9opvQ
	(envelope-from <linux-gpio+bounces-31404-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 18:38:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 902A5DCE46
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 18:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4B4C314544F
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 17:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03705326934;
	Tue,  3 Feb 2026 17:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLdQNw4n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B639D2F5487;
	Tue,  3 Feb 2026 17:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770139816; cv=none; b=Eb6gmaMh/2G22wXFFIPJ84KGbBeXsvBBf6FnR1ULPX73dUZ7g/VphZ0jIh7AAJixxbAsw3zBxvLl4xrnaRx+7tRfIG+CocwM7DvBtsjhuZlK/0pMC3jUliJvN0jiXp996L4j/lchRlobzOYEH3SM/X2cgSUMNTzi9rp+B6TDAQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770139816; c=relaxed/simple;
	bh=qbpaCz16+IKL3o5zdQh/CjxHDfdFrbH1zxADlFBhemI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CdTDqdToJikxiS6x21v/7sQuMjjn7wQEx623lCooZjVWcMSb041p021uVp0BMysBujmOwQUdMzfDBKpUU2UY0U+40AkHh/JRiqQFDbbgM8NUtarvCyXkPJiA5XvnZFAvQJTBW2PJ04/b4eEmx8mU7J8gT8zad8C9aFelcQzSHe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLdQNw4n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAD3C116D0;
	Tue,  3 Feb 2026 17:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770139816;
	bh=qbpaCz16+IKL3o5zdQh/CjxHDfdFrbH1zxADlFBhemI=;
	h=From:To:Cc:Subject:Date:From;
	b=jLdQNw4nctAW0tsY2tP6Zk2kGU0l3T5iMnC1XVUT+nvtyfNzVVij15lgd4ElfLc6s
	 fXt550YC7nLvik6JM7KPv4wqrsV4ddkUAKK7g2Ktq3SFl4pCNxezCMoilAeKDUa1XX
	 u3ih70TxY91yCsZKlbPX08LdZ3/TEqrHe4ml+pPtlUDYfsTQ8e/KLmHtUhPuOawQTZ
	 c8v9BgbfksHCPcGSPWw7maPKWtmZmNx+xm+Zn7TNHdeHvcJG8puF0xPJm0rjz2pMbU
	 yMS2ikEfS+P3dyRI9QhuEk2Gs5NfhNeCWYCA79fJqRQveqH3NI69GQW/93UYIeZBIX
	 gW0iQWYVDUmiA==
From: Conor Dooley <conor@kernel.org>
To: linusw@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [rfc 0/2] pinctrl property checks
Date: Tue,  3 Feb 2026 17:29:41 +0000
Message-ID: <20260203-device-unwashed-ed24f8592d79@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=935; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=3uRh5g2T+/PLcOva7VDfhDo0k6FRaoejSeV2ai+QgoU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlNBi2qBi1pwnfeHlvtntPveNGszWfCdqGaRVYfbJIjx Yzslu3oKGVhEONikBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwEQeGzD8U0rmPnPm9kx7z7uu efUSaR2SNz4pdLrNeFUjt5t37W+5qwz/U//lsJ7jau+YpaDRPfFxhIbp4waX/x5KcyQPymrc8ox lBwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31404-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 902A5DCE46
X-Rspamd-Action: no action

From: Conor Dooley <conor.dooley@microchip.com>

Hey Linus,

Finally got around to sending the property stuff that we were talking
about. It's definitely not the best thing I have ever written, but I
think it does an okay job of warning about setups that don't make sense
while adding fairly little complexity wise.

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


