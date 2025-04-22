Return-Path: <linux-gpio+bounces-19135-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5626FA97280
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 18:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDEEC17EE9C
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 16:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FFB293440;
	Tue, 22 Apr 2025 16:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="FsGf9IXd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171BB2918F2;
	Tue, 22 Apr 2025 16:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745339009; cv=pass; b=q4T3JIbv/l35x38c8yzAce8wpUQ+3RHGJ130F7NeauUHYQGPCIOkRFNhy4z0xbvdu8ruUcs4pQLj6nE15mGOF5kzg8xe7XbGhY43M0Ku6MlsYxHfFjGwEu2pg5WLLimHk+Nk+f/WSYOU+O6z5ytmTfrP7OcpJahImeg8ENf2x6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745339009; c=relaxed/simple;
	bh=K4POaAlXdN+txjM56ubDVDqxXIoU3LHmuZtqhpveRQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K091dx3I8mb4MtDMjouzAqKDL0RYNS7kZ8xBjYhaPeeRS6J4R2f1Jv7MoeYO4ghg0VOwMJPpP/bDTHtuUj4EijpiPgNgd0wWB6u1KiZfFgEdu6uCgDDRoNN+4zaUQnmDqFD4ykKX1mkCy/aKPivwCFvio0Jon2X+gGDP2VdG7y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=FsGf9IXd; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1745338985; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l7RBL5dVb8HBMLUxUZAfdwWNOiWIZFX6hxH7K+OpqGMU0ojfrp7QxthO5bFZHCzQtMGK4wemVQ1Q1kHpNr35FTF47HDPXJHZKkpxld5ubD9+O/Max0H8/qeTIegSHkmWmFCrcu+/uNGZsvM1viGELSdmgzDteIeEWRJDjWu9m/g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745338985; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oxHShFZoB1co/k8aRZUUY8gMBqcVpylC9Atz3SqUKJ0=; 
	b=TrUOMio45VqTWvjXV18oMc74ZcPvEP4KHQj/zRYp6lcZT2MtRess8KgL+6HiKmZ1tYEoJPMgfJWEN5z02cljGO2AdCKQQLPcI1woVwH8jY+nJubvjsXB4m5wQS0bHixzeRq8egXoN8lkX4E7C44fJZk0NyZOChM3hqsvajQhmfQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745338985;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=oxHShFZoB1co/k8aRZUUY8gMBqcVpylC9Atz3SqUKJ0=;
	b=FsGf9IXdc8jVnzaCziUCBh6ZO0qPA+dq8oUagX/4L+UJumOk/3YG7bT+NlARsqo8
	WGbnRbxtxl09nQcKxdjPR2X4kdbmesNYzT0gJP8OvlF7wQpp9CRwjJSaIHvz0kqQLKD
	WeB5rHiuZIxE1rXDDAh3h+Miq81Ss2aqnx2GwYzyVL0cKytt3oueyvySg24tODET+Y9
	hFnpwHt2ZUu4tQkRZmxY5ajPWDbG8eM65Tt0wgLcTozS6YqkBnAwWhzB/2iZM2LbxTO
	s6lyEnGTa+jHXjOR7uXh63bXPTPm6qGaK6CQs52wLKdGloznxSYzOoGzLINtEY2TkNt
	OjzxlKxFjg==
Received: by mx.zohomail.com with SMTPS id 1745338982905319.5056985029113;
	Tue, 22 Apr 2025 09:23:02 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 0/3] pinctrl: starfive: jh7110: support force inputs
Date: Wed, 23 Apr 2025 00:22:47 +0800
Message-ID: <20250422162250.436169-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The input signals inside the JH7110 SoC (to be routed by the pin
controller) could be routed to GPIOs and internal fixed low/high levels.
As the total GPIO count of JH7110 is not very high, it's sometime
feasible to omit some hardwiring outside the SoC and do them in the pin
controller. One such example is the USB overcurrent_n signal, which
defaults to low at SoC reset, needs to be high for the USB controller to
correctly work (the _n means low indicates overcurrent situation) and
gets omitted on the Pine64 Star64 board.

Add the support for hardwiring GPI signals inside the JH7110 pin
controllers, via two new DT properties. The patchset is tagged RFC
because I personally feel the DT binding a little dirty and not
scalable, but the currently specially-encoded pinmux property makes me
feeling dirty too, and especially dirty if adding virtual pins to mean
internal low/high (and these virtual pins should be sharable among
multiple signals, which seems to be not so desirable for pinconfs).

Icenowy Zheng (3):
  dt-bindings: pinctrl: jh7110-sys: add force inputs
  pinctrl: starfive: jh7110: support forcing inputs to low/high
  riscv: dts: starfive: jh7110-pine64-star64: force no USB overcurrent

 .../pinctrl/starfive,jh7110-sys-pinctrl.yaml  | 10 +++++
 .../dts/starfive/jh7110-pine64-star64.dts     |  2 +
 .../starfive/pinctrl-starfive-jh7110.c        | 43 +++++++++++++++++++
 3 files changed, 55 insertions(+)

-- 
2.49.0


