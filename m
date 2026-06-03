Return-Path: <linux-gpio+bounces-37900-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JB05LwJRIGqc0wAAu9opvQ
	(envelope-from <linux-gpio+bounces-37900-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 18:06:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B78A46398E1
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 18:06:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TceS0GCA;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37900-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37900-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D4E92319BFB2
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 15:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749FC36A343;
	Wed,  3 Jun 2026 15:16:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554DA39769B;
	Wed,  3 Jun 2026 15:16:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499818; cv=none; b=mQEz1vXMKCJ0CpxNpkdJ39yZfAh+dWkL7j7EhSdaStNHMCibWT43W4U+nog6EUS2Ur5t1NLhVgrXNqKMTdarCkYtW5iEk2xzSi1nQIbPLOag7pVWpkdMVHSmB11//S7n3IufW7GKeRYm1jShqdBIHV6cCcoR2lX/WSLMBDiaZAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499818; c=relaxed/simple;
	bh=MgVruYMn+iHF67SFNjdfa6OSF0tCioeqZjPS5fruPLM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LlMG5k82rNJk+qvwGQ9tpU8LGynKhfGbl3FX0BAtSbM5xv+zWcjHcuupECNyUctt9fYgjCOEYqgy9vb2wSkVnwmEAIBHIBqNrzThxLx9dgW8PhaxPgH6NnvZmJjDDwJ8E50xfzcqvokh7O1z88XznZgDYIw4YXC9rcWNyt9M/5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TceS0GCA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31931F00893;
	Wed,  3 Jun 2026 15:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780499817;
	bh=FYjiXv1AZnX76evF8HIduv9iW2nx5KPFxVDpoZE3QOM=;
	h=From:To:Cc:Subject:Date;
	b=TceS0GCA/R5n45Ozz9kIgQQNxZXJWxrfqtjN/ZWIDR+9tTQT79W5G/xUMLEMH4xKb
	 YPCyRyBJLO/sagXECzzL2JRBQYllxv+Fkf4jBepQmxX5l/bHBVeqTHQCVt/PaiVZyX
	 2+0A36KmXokLiDoiUGf55Rhy8kP4Jo5RJD7JIMESu9j/KLqsEWW9kwScujLo1xwqeb
	 /mhyCA1awUPW+bRaoDTSchcARzV4VlCAikNhIZFSD92xa+SkEfrEWCkivcPL6knZo7
	 C743IUQ9ueZVbmuw/D9Gko/TAw0HPqI/1fZHg5lV7e4oAfBeha9nJ9io+a1E3hQkb6
	 zk1oVXaJEibBQ==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 0/6] pinctrl: renesas: rzg2l: Add support for RZ/G3S I3C
Date: Wed,  3 Jun 2026 18:16:36 +0300
Message-ID: <20260603151642.4075678-1-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37900-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.jz@bp.renesas.com,m:claudiu.beznea@kernel.org,m:claudiu.beznea@tuxon.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B78A46398E1

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds pinctrl support for the I3C on Renesas RZ/G3S SoC. For a
clean I3C support, cleanup patches for the pinctrl driver were also
included.

Thank you,
Claudiu

Changes in v3:
- collected tags
- added a fixes patch (patch 1/6)
- dropped already applied patches

Changes in v2:
- collected tags
- dropped patches for configuring I3C standby

Claudiu Beznea (6):
  pinctrl: renesas: rzg2l: Use raw_spinlock_irqsave() on power source
    update
  pinctrl: renesas: rzg2l: Generalize the power source code
  pinctrl: renesas: rzg2l: Drop defines present in struct rzg2l_hwcfg
  dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the missing I3C
    power source option
  pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C
    power source
  arm64: dts: renesas: rzg3s-smarc-som: Enable I3C

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   2 +-
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  18 ++
 .../boot/dts/renesas/rzg3s-smarc-switches.h   |   4 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 254 +++++++++++++-----
 4 files changed, 204 insertions(+), 74 deletions(-)

-- 
2.43.0


