Return-Path: <linux-gpio+bounces-4059-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F2086EFF0
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Mar 2024 10:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 751822836AE
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Mar 2024 09:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4450B1426D;
	Sat,  2 Mar 2024 09:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ZSqeD0H9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E6412E52
	for <linux-gpio@vger.kernel.org>; Sat,  2 Mar 2024 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709373302; cv=none; b=T93qtVJ1GsnSTF3+wMe+9ePOcexVxBB5NZ8794WV/DCnl4we3LXxMnQwRb3wx87+28jIVyTFRnqDA5ktDcGVh8WrK28UUTtWBZV7CVhQLEcHzKN4EFNImXLwVjKk/L0xg+v+nqN5D/NkaxIGDCIFdV3cxmYdVZhYJ9mriYhhdVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709373302; c=relaxed/simple;
	bh=ptaaurYEGTGsMDytNMjxTKJO2pasd+XwPZMDQRxmAI8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WPmoRlH9FGVlv/RvWy+OaCKO6Buj9CGnmJJvrGqM0FhgkYuwxEwlm1g34D/1wzF6SnVMeEcWgKFhrSptGCx5l5gZrAy6ZlXDZnH6Um2L1nawW/oD411PMjxDCRMnLVpE6OfnOEMMdClpBRH0BNEVNmN9aeuMAWcCxBKGDFaGY8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=ZSqeD0H9; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1709373291; x=1709978091; i=wahrenst@gmx.net;
	bh=ptaaurYEGTGsMDytNMjxTKJO2pasd+XwPZMDQRxmAI8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=ZSqeD0H9TBsQ6gA2y0DPcu0qo/hl+cmgmnUUUAWAE3wE05QSqfjXL5pin7kS1fh8
	 DPA68ELZA2joepp9hH2mRxkekQo6YYsJycNYJEPjS8jD70NoufZJk2UKSnAzuWeb0
	 zJgXwYhLLKYVwMnyW7LlKIgmvtXzzr5wMxACKKTPWp+7DeFwY0qqmcT5TGhhEwUs6
	 17NAwjMKzfSobbMUUPJ6wszDnCf88FedoFAngS8KS3UFv5CB5VoQ8q9KVVec68qTA
	 cbBcODINjiK90bYy8TgOZ0VyfqJZ73WcnsX2p+gU7qBoWlRcDgWj8OX8ff7+E5lVD
	 N10enGHR0bO0c0texQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Md6Qr-1r6k4u1d7z-00aH3O; Sat, 02
 Mar 2024 10:54:51 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 0/2] pinctrl: bcm2835: Implement pin_conf_get
Date: Sat,  2 Mar 2024 10:54:28 +0100
Message-Id: <20240302095430.4871-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bfhiA0dR/RIX/87Zb0MU2Hv49/qmGlnnSuJnAZb71IUVKGdCR5I
 3ctwtswBmJsnBWazeN2HxVjEGS+ya5wjVKJg+2g6d2QdYJ8B++Jv4HkEpa+aQqQIwEo3p4h
 zioyH24NtvBkpVjlSMsyBe3J4HqSKwsosLbwSk84awU73AkCAM/46ni1qohfX3qNq0tXiip
 xAVm6CSXh3aX0u3ld0omg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kXfiA+y9UF4=;+jUYRxwMo5xPdMsSykxr4vkCuFy
 Kw07QrTckyQH7c6RR7og49sZphNwmPLfUJotrprAC4IlPLTfwFpRNJDEP4xZm0hYjUN9x4wMB
 VzpKtMG9FmQpOgHfdipj3ct1TKAG2+5w9XPGlRKedkNSE05kAF/I0k477x0ExY23uMo3oVE3/
 LTCc6LIVWG0DepdSwJkePQ6x6+sFRDb/hMd4dkQEKN1iZ0Kj6AGRBtph8SsqXc3wF0KxeDEvW
 RmX8bD2gcb0QutQ2frXTsoEj0nQg5UgZuCfmo2xHNvMCzK582WDLYQnU2kjG7sJtthIgOHUfx
 wob/OA+/EDykeanuIRU18hSdGULJZ3dWX3Eq16RowyNaazx5S4zBDXsoFYddESTXbxqHdGbtZ
 YeQIfNu2uX6tJTytXPnRd6Tqkb9aSlp2xeHdu413+IQKaNoB5Gr1JB+QGsHj27+tb23fjPXgG
 7QTWH9lsG+k4rzZeE3/nLN2/iOfaQn1nOgXIn+lGx1Ho4pAWi7HXbd2RT2yjWI0PMqG4qqGGx
 156vXHRJ1sJEsw4id4ixOaag4AlmzMwqSvexaMtpTLW0F4PePyGdoq2JOCTNDqBmiDMeGosBd
 EidIl623f1LtoabHLTGa5eMdXxKMKOuK8adNt92Ackdj2ogQb/m476HxAJT6UmXoIDWhk32Hw
 kySlScxX9aCoLTOfF8MJ/ZsvyeFKwnQoqPCDV5Peyc9BRlICa5YAO7wlxzcs3SymXyGL4LGDs
 gxh+TV5xtdagx0uUopqUZ0FvxsPA8xdo33qyCVwv0hepCpcMEucT6U0Gv5W7vdGPA3/e5bry4
 kmdbo0/Cn9IzbZW9rzoFIJ3IeEfilyt+DoCxzq46EOZ0o=

For years, the Raspberry Pi users relied on userspace programs to read
the pin configuration. In the meantime, it has become apparent that this
approach has reached its limits for various reasons.

This patch series now attempts to improve the debugging possibilities on
the kernel side in order to reduce the dependency on these userspace
programs.

Changes in V2:
- adjust the BCM2711/7211 pull resistor value according to the Broadcom
  datasheet

Stefan Wahren (2):
  pinctrl: bcm2835: Implement bcm2835_pinconf_get
  pinctrl: bcm2835: Implement bcm2711_pinconf_get

 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 78 ++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 2 deletions(-)

=2D-
2.34.1


