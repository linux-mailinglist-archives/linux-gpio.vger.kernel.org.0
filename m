Return-Path: <linux-gpio+bounces-37613-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DXIM+r5F2oWXwgAu9opvQ
	(envelope-from <linux-gpio+bounces-37613-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 10:16:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 393435EE640
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 10:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFF9D3010C18
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 08:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C3C36680F;
	Thu, 28 May 2026 08:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KhzYTbOd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98F7352C4E;
	Thu, 28 May 2026 08:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779955487; cv=none; b=tpdnH5JTkFIVWgw5NO14/2cLxtzSOIeAy9M7aflW8e5EX+HfDFZG/F2SDnBQztnSEja7i45rFHbpB+pPQuKCYKShA58eusXMgJyHmGivfRhl43vi4UEPcyAxleFEy2ima2FzsUsDxklpFFNQpFFjzqMUo2XVpearzv5ZxvPRxSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779955487; c=relaxed/simple;
	bh=gkSfKmYCxIqe2GS3vAD6vjpeNdpQWLR7/DwBJIgERLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a5Pj1kkkK8ZNdo2BxBMQf7SlKjv/elLoeHwu7eaK0lGHcsaeONg06qtMdKSj1NI93ZP5XdgWQ7ASl6oB0Q3FGwlwsT3T1qZRk4F8NvzqQupe+WOiDYnRj2chVwviODBORiZfPvv7Aux7Jn+ED5mUe9OGUn0dgyaMjzwYLyzQ4rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KhzYTbOd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 779011F000E9;
	Thu, 28 May 2026 08:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779955486;
	bh=fmrw6ttWH8QfDlzxIdpT5oTb5ZBcwBEiGrPt6pIW/F0=;
	h=From:To:Cc:Subject:Date;
	b=KhzYTbOdy2p16dkeqbLxcwyQCdib3d1EiCXtb75kxExe7gCX1T4QmK7ODXvCgNdbJ
	 Vu8NL9dD8/BrmTiHdk1WiUhbtRoF5l1zPaXGt2KOnYvrOUkQG70p657Bt9pXEt9jq/
	 OoOHN0sM1mJsDyThyRTZBdasw3x0CYmSQQ4UXL2xMERkE94/qebK/6ef92tiPa7HFG
	 NG1OnBY+K23DNCdLlOAJtYDgHLx32wgShxqnwIZ2l+1J5fwVbZfST2JZ26WMOOJ+6i
	 JIf2onmukHKGOci/Czi3zLJx9VbdPD0PX3VQMly/fEayRI/1k69Gv79E/p9ou3K4oA
	 QaSWenI480yKg==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/7] pinctrl: renesas: rzg2l: Add support for RZ/G3S I3C
Date: Thu, 28 May 2026 11:04:32 +0300
Message-ID: <20260528080439.615958-1-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37613-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 393435EE640
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds pinctrl support for the I3C on Renesas RZ/G3S SoC. For a
clean I3C support, cleanup patches for the pinctrl driver were also
included.

Thank you,
Claudiu

Changes in v2:
- collected tags
- dropped patches for configuring I3C standby

Claudiu Beznea (7):
  pinctrl: renesas: rzg2l: Generalize the power source code
  pinctrl: renesas: rzg2l: Drop defines present in struct rzg2l_hwcfg
  pinctrl: renesas: rzg2l: Keep member documentation aligned
  pinctrl: renesas: rzg2l: Use tab instead of spaces
  dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the missing I3C
    power source option
  pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C
    power source
  arm64: dts: renesas: rzg3s-smarc-som: Enable I3C

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   2 +-
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  18 ++
 .../boot/dts/renesas/rzg3s-smarc-switches.h   |   4 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 260 +++++++++++++-----
 4 files changed, 207 insertions(+), 77 deletions(-)

-- 
2.43.0


