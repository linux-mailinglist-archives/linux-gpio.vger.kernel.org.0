Return-Path: <linux-gpio+bounces-4081-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 826EE86F558
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Mar 2024 15:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B44951C20925
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Mar 2024 14:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF385A109;
	Sun,  3 Mar 2024 14:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="WxIy9+Er"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485705A11F
	for <linux-gpio@vger.kernel.org>; Sun,  3 Mar 2024 14:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709474542; cv=none; b=oCUZjEKJ1DOw9cNq7bcp5X60bQO+1q/lqayIbiOIkyN6YprzhuvQWWjNB4Jdj15yi+GjEp5PGV5rJR0ZbsTWJU933jYwvjx+V8V+F3Vk2RhPSPLelWcDdPpn3ckIhuKU4jPR5ksy89OJq0rR55B587J8ohmqxIDqoBzjOOO5t1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709474542; c=relaxed/simple;
	bh=1zUZ6OjeYmcPgNGlJImXH20GJ/TneTZWtMn2tID45qQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mBoQkOdMNS8X/Aq5LHf72oDGZSXHEKPnGk0ZiLKElv/shgvEBZBVE4dq+8/q7neNsbGaPj45qvnyJHDWy8mYi4dOvVuZ7I2ziaw0E+u0z3ZO/wQSZic8AY52E60UpZlj81Jr2YFSJAT1hTQoPfRLK3qOffi8JTASAtvge4r6jfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=WxIy9+Er; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1709474524; x=1710079324; i=wahrenst@gmx.net;
	bh=1zUZ6OjeYmcPgNGlJImXH20GJ/TneTZWtMn2tID45qQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=WxIy9+Er3QX+1ga6O2vl1AbjwDdXfMjyzqSrxePhx2OKh1kEjgZOecpExPkWtmXY
	 2PVWYyjjxRx/22jr0h4S3V43NgTtQFoQ+msVxTylNKn+kcO8Hoa/FCfg7d+Gv3I9b
	 a3SbxiLlvScfiI6/WR7j03nYqh17Cq9QSsHCO6tAzd0LRuso+8yK0CR6kkflc/8SD
	 2WoVeL82Cz9/YGqvvc460ae1ZPvugvRQuro2yixNlwyHju7eQv28mZZhF+FPT6U/E
	 4NsPRrS9nMg2fZ68QwW31l2K4c8sG9oasxEW7/of3CXDb4/HHwxVGmoi4WnPxhHM/
	 QnyuXALi5h/TF5HIsQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnJlc-1qxaF53tOG-00jIjt; Sun, 03
 Mar 2024 15:02:04 +0100
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
Subject: [PATCH V3 0/2] pinctrl: bcm2835: Implement pin_conf_get
Date: Sun,  3 Mar 2024 15:01:35 +0100
Message-Id: <20240303140137.157522-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hXg11jiqiNu4q+6x5gTfYQ1gGFu1ud+YLUuyHcNitTxiLSN7X83
 iW9OwvsVNRwY52deLaBYSVsJUQ3B8Pp22gAEfWLBK+4djAV0nbpMYmZ9F3T9ZmQHZWJkgaM
 m5NfDpZa4zvYl/NaTnbsK3TJcLcH3EGDJL+s+MDCOJOVE+KpSLzmASFXb5RP8VpF3si+gsZ
 NmL2OQutCVmTF4HuNF51w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HKV9daIyTI4=;uLQs8avpxu5OvakMptORuVkDfa+
 lJrRY9xwB4whtumDvE+fi6oSwLk6XAOhcmMzkXPRv9ZuDnUhoM8K8rtKrRRXP3Tnr9sz46vA6
 gPmZX11TPlpdUOeCu0hkpuD29F2zWXUMS15PVSFvQqfg5rXdr/bjJG0VVY14Vh20VFj228DWs
 ws+S+Bb/yE8LSucfj2XsyZAGPm13h6kH/9v9lymu8TRu7ql+JDCfz+B9H5lAVDD4Llx9JTe8V
 PBd2B4ts3AHvFo5AkoH6P9lqcM/nCOlcAeqyH71mM9t7ng32cAr1VgbvKu0BChRx4tEUNa/2B
 LGRhSlreORpT92+CvRIcOlRXl0e3r+gF6C+kjKWr9O20JP8qwEIauzKawravJ336hrcDDXAtu
 MOlVx6YHMse7/SNjW0MT/lIAShDUGweZ2WIgtTG6IVr3ZVBzNLZ5tzG1rxzlRBQt4Fb1LLwhH
 Nn1Y/pjGA0+jmb3FrEHUD+wppSD7yxxpA/zMNlGW17cBICdHHUGuz+yHQBAWXRZ5BsqmRPUYE
 8XhDCS0doQsa03hQNvMN6AxLATdI/wX+ne6zuDBBxP6FujWXJ5yCPTKromGEEoJMn5f37ar3E
 wU5gh0TsREc0KEXJPn37D3DqKCnMK6nG22ed1Yu65YuLo37frfMINln5AGSxIx0zIzfTkueAi
 oFe7e9afM1xAu13PPfa1VV4n+yi77MiEMMZvrlk4O2unFfmX6B6cM1J2Ym7ZGZ+HVoAZO25bX
 b8tRGxyPNiIt4793ZA1RGHe5ewXyFJWbPT0RpwymXBBVmR/KERilXRLkp7+f1j53ETcQQ850X
 gW8adjiG3ZDBGk/LcFLt0YxVvaRhbWC27u3ucSJXay4yo=

For years, the Raspberry Pi users relied on userspace programs to read
the pin configuration. In the meantime, it has become apparent that this
approach has reached its limits for various reasons.

This patch series now attempts to improve the debugging possibilities on
the kernel side in order to reduce the dependency on these userspace
programs.

Changes in V3:
- convert changes to single return point of success as suggested by
  Andy Shevchenko
- justify ENOTSUPP checkpatch false positive

Changes in V2:
- adjust the BCM2711/7211 pull resistor value according to the Broadcom
  datasheet

Stefan Wahren (2):
  pinctrl: bcm2835: Implement bcm2835_pinconf_get
  pinctrl: bcm2835: Implement bcm2711_pinconf_get

 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 78 +++++++++++++++++++++++++--
 1 file changed, 75 insertions(+), 3 deletions(-)

=2D-
2.34.1


