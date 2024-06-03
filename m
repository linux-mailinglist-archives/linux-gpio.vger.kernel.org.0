Return-Path: <linux-gpio+bounces-7086-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E31C58D8885
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 20:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FE751C21902
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 18:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB3611386D7;
	Mon,  3 Jun 2024 18:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="FkwZbjeN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724291384BD
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 18:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717438826; cv=none; b=eWuskjpb4zrvkPrpGgKTdVA6/n9WFjMvR1DODRNUP7GZ6nrauYTAKAcnf+zgNLUF/2fvBb0zP9GqKoAADHUsN0CJZ9S015TUI8zqcK4G0x/om466SPPb5HxPKowlytwzrORO4FgOHvgEAAF/Mbcb2+jdpnm6iLDMytcfFphCaFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717438826; c=relaxed/simple;
	bh=UCb1oxLOGJzH/ZitH8t6qvhy9EFhpnUBiqfrMm7NZR8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bOUC4/WpmLuvOrKkkUCT7HjcazKA4fywPp7eRO0YGuXp+pmbPFMybdKj9fZ/O/LYVIRm9xjJhgV0AHFdj/StDPMDGSzQdOx7lXsE9SC7/tFAJe9/MnfaPEM/F6g+2Ncs90oAa+zsldTfyco99Jf03TX/TCJa+/APnDFx32HrPR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=FkwZbjeN; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717438809; x=1718043609; i=wahrenst@gmx.net;
	bh=mLilu4oDs1cQpEMdL21n/1Egwu8dlRtQxoYeJeOd6Qc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FkwZbjeNo4o6ArBnEzlC5PzYVhUYnBinlAAT+PebhwNMRQ/FtA7bejTbiMXRZF7+
	 UK4/CAwB5hmX8ZKVPHM+NfKJwXPf647ImVDQQFs0UgTxHFlx2e123VGbWjm0UgjWE
	 sJVPP3swEu6GjpDvwBXxmiXKApQJx2+DEfR9lBQyu6AJGXxPgYg1+TfgihZsebAvb
	 0OezGZRkz3CzasRLYMbFOC63kFDI0Rutje5odyDDWm0ibzY9CLrv6HEGfRtCYxGgN
	 jV3ZP557UQCDVUc2R8lgT+C2JH8a3iZcZbcpZJ+8LTmAMI/waNZfhNAa8Shxxxf/q
	 wVz+jWOrTqnChODX4g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M59C2-1sD6MO3sgO-002Ib5; Mon, 03
 Jun 2024 20:20:09 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Phil Elwell <phil@raspberrypi.com>,
	Kent Gibson <warthog618@gmail.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 0/2] pinctrl: bcm2835: persist_gpio_outputs follow-up
Date: Mon,  3 Jun 2024 20:19:36 +0200
Message-Id: <20240603181938.76047-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DfNlYMDdoezmpLYhZlyEa8iHTA2jUbg5yuYhAjkP8oM8OSQ1BlF
 9GyE3OYDQstSVcx0gLBZ+/VFjYqQApkrrDHN9wXjaRTPabCmT9HDJavRIvCN+RqN/u0z89e
 vVwH5vn5NFlQL6AEOcwC1+1uKsPTDpCZxePdgJ0S431Fhqm22fVqnORByGhJkTsOha5RkgR
 4F9TMjHvnXL4rfb5hODTw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:T+ICGM8kC5I=;Twd+JlyVBKevyo4RsdxGj52QTeO
 bfvdJ/465ZSa28RmTmG5z3SmDco2iJXm9+GddiY4qxhwsSGlk5wu3qdqMJDgORhHbvlMILHHJ
 7B95HAr545FsZqroDfj85G5F0Lt1Bjza/l+R7/ozTVSwU+eSQh5d8clGGCZOzzNL6cSuJ0N+r
 p3UaG4l4WRCapJg/++LNkK3cm6P+thusT1f8yWFYuc2hsv6IfLpdbAtRCOsFiavJc8Wfud7B7
 tIf31uE7kjxmTS7U62BztuT+hgwa2n3+TeuBlbJgAazoaPV/LwpKTvx5xwEItD7OW/K8jleVY
 gK0YVAMKV7mqp8a6zuM0XLRBue8GW3nypI2sIhbVlmJiTF+AZ4QI/GYxBi1bOIVjBBrCE93Wr
 k+fWfsVSGuPmUPP/h5kv7ouZH8j9DLnvCmrYV/eMJ/Csud682dYJnHDzhl5s+SZA1hR77Pt58
 yM0TlZ3T3qus/dUKHEvMkuNqCXQRtRUSgC00h4uM1V9rGBnm72qUtd5s3vEuNcmemhPNbxyOI
 Anq7/wrs74yvukHVXDB7e1U8nMWvNO0nKs/EjyKNlCdTTJoYfmZEHOGkFpPSo0uvFlzpnkPoq
 PE5NFTxbRA/Qr2Kv3gSXPAXa4uzmn2XtgG6oonoJvP91Iat7NBF7uJUbDjbImk3qE5pFQgTYQ
 Z/acXecH8VxgrMhfzKCgffaOHBrb6yWjA+YT6L0VvMuL4xDu2KxgoSeL/26ItLWFgN7BkPLP0
 iBnF/LvnKS6oTEv89NaReVKOA8M0bfRJE2ZlwLOsPqlkuQp+7QWoiY7I6CCXU7k0ywgjFQr1M
 t6EFjOFxEIYvcJj9fOsPGvLiqR7e+R/1FgeXvVant4lRM=

After the patch "pinctrl: bcm2835: Make pin freeing behavior configurable"
has been applied for 6.10-rc1, Andy Shevchenko submitted two comments [1].
So this small series address them.

[1] - https://lore.kernel.org/linux-gpio/Zjk-C0nLmlynqLAE@surfacebook.loca=
ldomain/

Stefan Wahren (2):
  pinctrl: bcm2835: Fix permissions of persist_gpio_outputs
  pinctrl: bcm2835: Use string_choices API instead of ternary operator

 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

=2D-
2.34.1


