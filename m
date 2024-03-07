Return-Path: <linux-gpio+bounces-4188-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E9B87486A
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Mar 2024 08:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C88701C21424
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Mar 2024 07:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D68E171A4;
	Thu,  7 Mar 2024 07:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="W+u4e7Sz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB6E1CD09
	for <linux-gpio@vger.kernel.org>; Thu,  7 Mar 2024 07:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709794907; cv=none; b=hGs7L5KhT59nMESiXz3iT8PRfiniWg+l6RfDMpPyBuGiVeyflQSb3ehQnWMhaWlllW5+e1yV/Oh7IO/Fmmvt+hvJVEEqwi9wsJ/I/jhTIWtpgrxK/0N+9csdd/wGf7qlQ9aLZDL3Hjxnw8CzQP2fZkswipl+65tmua64XC33tmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709794907; c=relaxed/simple;
	bh=hlDEF+mRhQCk1gTXJ3ci/EweREqmguVowikDg+AyhVM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rU3Vi6r0cn6HAB+e18oHBkb3XUikxEHhe3+SsAS0l9Vt1XNtZk7hP5a8IJUNxv2KgaLRO/5fqhGy+RcXwxVNelN8DuwL33+1P9yWVR4v0oK6cg8y2OByJVkKln9DtquSGyHUzAOFl5m9WkrGgBoHqz0ZRg7P9KNNVIwvURJOKzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=W+u4e7Sz; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1709794895; x=1710399695; i=wahrenst@gmx.net;
	bh=hlDEF+mRhQCk1gTXJ3ci/EweREqmguVowikDg+AyhVM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=W+u4e7Sz7JCIFmRZBLxh1pynfFhd38G62yi+qNH4XGubsiH+CYDWOQdOFZ7+WgRA
	 RwoM2GQ6EbqIHqXeXLGQWwBhxgV8/7V0tehkVmNasd6Rl8LZP/CSuTahVN1LCekk7
	 npu2dXv8wY1hdi6VH5LykY8W9C9XjnWpzJnYIPSD/JMwvt4KxhPYXWej/MH9YNPyM
	 OgSCKCWW680tl4NfTuDT41P+ttx21jjCsZpnUy0DVLw13AZFBPGbpyfHjnEOZIcyV
	 NaJOtY/MHhm4U/902SKC8XxGbRnRa97hNiXtbnpe7oND7ErCvCxtugSamewwPTpZP
	 sLknb+sYMaLEQDQWQw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMGN2-1rS6Ey3w62-00JHEh; Thu, 07
 Mar 2024 08:01:35 +0100
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
Subject: [PATCH V4 0/2] pinctrl: bcm2835: Implement pin_conf_get
Date: Thu,  7 Mar 2024 08:01:11 +0100
Message-Id: <20240307070113.4888-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:50RETKyDu8i7DG2qTrfRZpz81ncmODJiA4eBAXV3DhClcmUmaNY
 jXwbMnS5VGcbbEMExAc1bIBPc3tZp0cd8r7gkwHLYpE88zFp580D2rHLK4S+Gr+Xw0p15M0
 WPp/G9i90qSER1HaJcHyFeDaRlaWcEtTr+j4kkXYxP6uhVHzy+2AWVxWYYCBCyEJjvE51Q+
 13bHVYGwGaOI38/5Jfmgg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LAKqurRLRtQ=;tYl76iU+lkCk1yKbR6eT15QSjbC
 0KDQsA0dxneGxG5c/UMtb7lwSvhRH45uT7boHO1nrXgF8IxLKNj5h9dpBGkob0ZZRHV6DGpR4
 u2xc0uaXdkrMX99yiRNSZ+aaAjUUm8vbu01GCl2SehLT0AORdhVHjBO9R1p30SYrUp+XGC3vo
 DFiTCyaVdfB+fwUgQrD6+OhngF6f1oHWbKr7SFLJEKHY8mX2GF/E+PNQmAT6uHUYcJxSiZIXk
 cCoZaTzKkAiBJM5YgMlwjxwSM0ok/1Gc8v8SXP90FggpH9FjcQd8D6bPcncBULwuIZmnAUotc
 O4IAo+FFTJnFbdafvJT+h+pogOpgOZmqv/l0EOjepKkzyf2wS7hPelbGkYipknPCyvC8pnneD
 1RU2Nd2JfoeFzDSqu8k88wOi/iJKkFKqWiDEfIro1nrwkbiuzKkrlmLPsdX6WLE0IFpyVaY61
 I+I2nD1pvEOKLfVCqX1daaN10SarVTGlTMwrNuLBIAd3qAhz41/h0kk32z0qT7uIq+t6vsfqE
 ZDQDtXBCyDQbBlIDj2uVcLtTBmiYMvzb23QT2dNS18ZF0PMEp39Lwti6BL4dN1rfPAs2Ab7Os
 FPkRA0Am+lm3LVVPcHAjvQFloRwGisoiTacml006S678RQzTKzQji6feye7y2oOM7ULXeYND+
 NbxkYAg0RFlj4yJ3ti2MWCKJSAbJO65vKWvp3kZymS4NyE+AgHEbXmgasTGV9BYleURRZlqJ5
 xF0AirjFA8bN+Ow3rJCrIuaOJLJRWQJBncrget7TdyZAn8ItbZsqlncO4/i58HA9RsuDmuHT3
 IQT4cxVISsn3TastoTvc9e/wgX/UcNBKmbIyOcUNa8vAw=

For years, the Raspberry Pi users relied on userspace programs to read
the pin configuration. In the meantime, it has become apparent that this
approach has reached its limits for various reasons.

This patch series now attempts to improve the debugging possibilities on
the kernel side in order to reduce the dependency on these userspace
programs.

Changes in V4:
- drop PIN_CONFIG_INPUT_ENABLE & PIN_CONFIG_OUTPUT_ENABLE from
  bcm2835_pinconf_get as suggested by Chen-Yu Tsai
- add Florian's Reviewed-by and Tested-by

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

 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 64 +++++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 3 deletions(-)

=2D-
2.34.1


