Return-Path: <linux-gpio+bounces-30818-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IoVJgDcb2n8RwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30818-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 20:48:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6144ABA2
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 20:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7022DA0E8A5
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 18:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F6E44DB74;
	Tue, 20 Jan 2026 18:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rtzOStwi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD8E322C60;
	Tue, 20 Jan 2026 18:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932968; cv=none; b=n4JxVo/tzDCH0hNW9NgtiClxIRlQDslwNj4Gy1barGkDCkJY6f1fWhjvSh/bWvWRD3dRQ/b03ozd8HTQ+wYGjCy9k/wryAuW5GwJCJF9NJYUwGYg6BZmIOojrkVE5v+xZ7y/cpDeRwcy1QjtyW7ioKq/0rMW88DKuqLzvVbPLwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932968; c=relaxed/simple;
	bh=j3JpvGqguxAPX1OQ//mNrtvLuBi56hKXaPkifOBT7Vc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ITEVwfl8CVx3KTl4xukRYWJVUciXR20/lLGMB9yZ20BnJ8+Pg/u9L6bFgoqoIl1lFTlgg/7+puekwtZpwb7tlB/TakgXdJKZt3fXg24+WWOenOBsCC89ihVONFyf4AdxiuOT6HddNvPS6mTeELNbJe2LK4YdGNxmTUZYQVfO4Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rtzOStwi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56FECC16AAE;
	Tue, 20 Jan 2026 18:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768932968;
	bh=j3JpvGqguxAPX1OQ//mNrtvLuBi56hKXaPkifOBT7Vc=;
	h=From:To:Cc:Subject:Date:From;
	b=rtzOStwis8Cv7+96pEq9F0GcTJEXfn0GORDO9CUo/wuFegZW+ypFXI4AR6hl59kfw
	 ADSfWj8lkWpG/N+pnkeYGA47CS743DBaFyslvMICg21AWasaJoUwN1zoZ54Jab2BuQ
	 Ih8WJD5MErgIg/Jn5BqGNx5CYaA7zs8agX1A4BsDm4fKyqwOl6iXle6Lrbn4NUUaE9
	 3U57r30f8Pfs4ZXd4r7A3nGlfCnudJgS50u+38XbtUBqxeMXBwUmVLdEbBNNNr5neN
	 qs+iJJJvbhsss6NkTnyYXQS6qUhPa1BRwbf7mKD39MUBctLZt9VQFRNliSrxs7Y9e4
	 6XWUBq8KzoofQ==
From: Conor Dooley <conor@kernel.org>
To: linusw@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com
Subject: [PATCH v4 0/5] Microchip mpfs/pic64gx pinctrl part 2
Date: Tue, 20 Jan 2026 18:15:38 +0000
Message-ID: <20260120-elixir-salute-dd6ec3d9f5fe@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2330; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=uh2beolQ7KdyixRVrH5HrEuGNqoaOa03fytRzQEDSHQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJn5xzy5kh7tu+h+fqf8qfnZNw+ycF4xXjQ9p0WA0Vvu7 6FrVSbHOkpZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRshyG/y6ni81X78t4Wna7 RD8i3K3zfvPU0OQDV6X3z65k6p/bt4iR4f6ds2HPBB/p5WX3dvVfc7+7MqrgGDObTPss/sB11i1 qnAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-30818-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 3A6144ABA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Conor Dooley <conor.dooley@microchip.com>

Hey Linus,

Rebased as requested, with the dts patch that snuck in dropped.

Cheers,
Conor.

changes in v4:
- rebase on devel
- drop dts patch

changes in v3:
- drop the todos
- rename the kconfig symbol
- move my drivers into a microchip dir
- use power-source instead of custom property

main changes in v2:
- bank voltage is now controllable from dt
- bank lockdown no longer controllable from dt
- dt_node_to_map callback is now a(n attempt at a) new generic function
- some schmitt properties now no longer supported

CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Valentina.FernandezAlanis@microchip.com

Conor Dooley (5):
  pinctrl: move microchip riscv pinctrl drivers to a folder
  pinctrl: add generic functions + pins mapper
  dt-bindings: pinctrl: document polarfire soc mssio pin controller
  pinctrl: add polarfire soc mssio pinctrl driver
  MAINTAINERS: add Microchip mpfs mssio driver/bindings to entry

 .../pinctrl/microchip,mpfs-pinctrl-mssio.yaml | 109 +++
 .../microchip,mpfs-mss-top-sysreg.yaml        |   4 +
 MAINTAINERS                                   |   6 +-
 drivers/pinctrl/Kconfig                       |  23 +-
 drivers/pinctrl/Makefile                      |   4 +-
 drivers/pinctrl/microchip/Kconfig             |  17 +
 drivers/pinctrl/microchip/Makefile            |   5 +
 .../{ => microchip}/pinctrl-mpfs-iomux0.c     |   8 +-
 .../pinctrl/microchip/pinctrl-mpfs-mssio.c    | 737 ++++++++++++++++++
 .../{ => microchip}/pinctrl-pic64gx-gpio2.c   |   2 +-
 drivers/pinctrl/pinconf.h                     |  16 +
 drivers/pinctrl/pinctrl-generic.c             | 189 +++++
 12 files changed, 1095 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
 create mode 100644 drivers/pinctrl/microchip/Kconfig
 create mode 100644 drivers/pinctrl/microchip/Makefile
 rename drivers/pinctrl/{ => microchip}/pinctrl-mpfs-iomux0.c (98%)
 create mode 100644 drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
 rename drivers/pinctrl/{ => microchip}/pinctrl-pic64gx-gpio2.c (99%)
 create mode 100644 drivers/pinctrl/pinctrl-generic.c

-- 
2.51.0


