Return-Path: <linux-gpio+bounces-2913-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAEA848F7A
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Feb 2024 17:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96EF81F21D9B
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Feb 2024 16:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749A823753;
	Sun,  4 Feb 2024 16:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Wow+Fuw7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB26B23750
	for <linux-gpio@vger.kernel.org>; Sun,  4 Feb 2024 16:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707065985; cv=none; b=fgAasSWjpN8wQsRdGsSeATHtJX+zdYEUscW4tK4ZAnsYCox2Nz0VYDbMxhwfDpY4MBnUsWsoPb2gQziL6FuwtyEe8a7pf+63vX8Rhxno0fqfHEualkdJXFXhWXLiXaGhnN+9Qi3V3dxyQ/OuJEvb5Xzr/Oz4x7GxQCARJMHiQNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707065985; c=relaxed/simple;
	bh=TtOQtRRWIjic18hsl/wpaV2Nn0fU0CRx262wu3eO00E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=McKkcaVP+vvu0soxfyzl8HOU6uuosMcK9Y/RISFLt3ecRzip5Qywo+niUWjwzfwnTBPEm7Hce4QXhXMtN+CQvAYRvz+SYa3ekk+/5SFYMI98Jnbpz1S2YI5vKHb7B3Vw9icTjvIDsBGineSwhKYhtQ9L3K+3AIFfVfipi8db5OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Wow+Fuw7; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1707065974; x=1707670774; i=wahrenst@gmx.net;
	bh=TtOQtRRWIjic18hsl/wpaV2Nn0fU0CRx262wu3eO00E=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=Wow+Fuw7kvaIXazfsolWmM686uT+Z8h1JpCdYWhavsY7bGB1isVKGvgHd3+TtwNd
	 IESzgDsH/qVKetPr019wxhtmhkzSoiOyHeE8I4YhzqFKUVrtUttuG3eANOYlhma0E
	 lBQ7ntruWtvc0ybfHORwaj7GhwQxJklOKS6jvtXnt98KI3MeJgL17ZS6sz93S9FVQ
	 EyanfLhxu6AgD6ZG14l0TUNBQ3F2RI4nfz/NmPnjDuz043Pt0RZVPL1azFS3fYbvG
	 QeXapDrgKEQdV04Lz+JjTteFseX5lV5VY5wIlYsO5MGTuAYSvf94p1qztd437u6V9
	 nGHPim9qA4S6kjsfLA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAONX-1rKtKQ3ZmN-00BuIY; Sun, 04
 Feb 2024 17:59:34 +0100
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
Subject: [PATCH RFC 0/2] pinctrl: bcm2835: Implement pin_conf_get
Date: Sun,  4 Feb 2024 17:58:50 +0100
Message-Id: <20240204165852.166157-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0e71n7fc3sWIOIRUJg5rg49Akf+aFTeeQs2XHdsqqSeN8x3RLY3
 HBuad8e/RIccUdOn/yOgXPvP+cR34R/K5fDeoH/1vwISP7gknUSPik4H6mfaBdwoNqChzoC
 pBGPSNETu1S+/aOPWRZZ2LxP//7VU6ihreMDgKxdpTWbLtZXfUg532O5gQlx2XmI3dnL32D
 yIDuw29NzX8t8mgCMWvRQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Qhci7XeLeE0=;Iqcax9iQTW3+8J77soUGAV9p6vR
 lTqOy9dvyyMsTgvrhV8A+RJBKXfd7V2ehCMW89R6gltSV6n051I7Wt0IdOGdW6/2Quvc98wWa
 ehXqPIcqI+lxov+OJ5u5kAZC6R+10At5Kg/126rsjn6AIe7gMcv3Dhg0MX3+SmOOLqB1dneoh
 yz5fu08QtW5Z0y2o45XeJoCIe8hQMcPaIv6hHySGUC3Y3pacN9SKrXL4y7JPGcgNeSleJSokm
 U8NuBg/gZrpCw3xHH+1ptE1NCnz0QVOOff2QOGRWnA2eiLX08ifivu9RyRoWHwcKtDP/xME/C
 BbE4RaW96WhkG53lj8h6L2Q2ot3zIcUtPjQwhx0BwXXzocANCr5eouh7PSovk3wIKHepyMNwr
 249gLdq0r+bi7IKpPp5wClYxZ1ZBV40WgKU28ZB4UtxEjYT5cVY2aG2RNCbAeGasDGuvyeEoe
 1D3LBn1+MLwiRMFVpXkyLW6PnnXusE8+8ZslLO82TqqGViamaN7UjezAQSWx9xCIirsMptxZ5
 aQg7sEXjNG985G0g5/wXtlnPv6QwoFbl/OFwzec/0QkH3slwnjx4lCRBj/K8Az73pz9hlgB75
 SHnFiji5qKN0jdIZ4Ln//m8Rg6VlIzpws1rRNfSH7pI6gqst6PZ61EUpJBeuhkJ0LqhAyhi4f
 IDpfN4cCeuTvr8q1hAnhy9zDCm0bYT3Xzm/wYGhPaayupntGAVAWnfoS22PI9zlICq3MIZ82w
 tSA2u3thUougpS0mQCcyPe0A+POg11+YWmZKzyMYuIvz3dgkE84Fa6U3uemcWUA3+DiWRtROD
 aDDEcMYL4vAdogT8ZQY4zwNz0n2BmC+VgwChb+qO78nis=

For years, the Raspberry Pi users relied on userspace programs to read
the pin configuration. In the meantime, it has become apparent that this
approach has reached its limits for various reasons.

This patch series now attempts to improve the debugging possibilities on
the kernel side in order to reduce the dependency on these userspace
programs.

Stefan Wahren (2):
  pinctrl: bcm2835: Implement bcm2835_pinconf_get
  pinctrl: bcm2835: Implement bcm2711_pinconf_get

 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 78 ++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 2 deletions(-)

=2D-
2.34.1


