Return-Path: <linux-gpio+bounces-5698-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF198AB60F
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Apr 2024 22:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE8AA283814
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Apr 2024 20:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C5212E73;
	Fri, 19 Apr 2024 20:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="efbQuTFT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAF0101C5
	for <linux-gpio@vger.kernel.org>; Fri, 19 Apr 2024 20:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713559289; cv=none; b=FmB3RLS8DtBLLgJclJP+8z6lVcEQQhxHf3ljFoFcoqIg46D7+VrPQUs+vkQuDQFxPgixgerbe/5RyrBzrwn2hxy6QKjZHxTx8AftRtm7PdcM1r5MfcudCm1SOoB5srgeGGpCZKXvTySMUOHnEDMqaf/QxKBdt2JYyGq/siCsaZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713559289; c=relaxed/simple;
	bh=yKdfi8jhZdBmtPBLTn7ZHB0DWbu4BbAfDy+jSIZUgMw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=THyVOgnqSNyILRvzugIUPjoKXIUWKXYfveA85ij1Xp3VorPXlRFysQBsTD7mhDNS8tirtscMcElCHDh0SmPM28fqJCxWMSkvo4cmsu2c77Uz0kCEm7p3qBT37EY/xGlteZxwhU1g3Sk5hy/M6xiW2AZJe4WA92j0o+f4jPOfxdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=efbQuTFT; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713559274; x=1714164074; i=wahrenst@gmx.net;
	bh=Ee2ErIZx7CzCmYbEAO0zt6xBsCL/S6gjt9MXhMAFgOw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=efbQuTFT0agcm/m35iC2uSMcwHG8A862qHyPIbQ9VAgIjGby6ntgdo+aPp9HyDob
	 u5F+nDlicD1m4P60w05epNTj0ZQcszExI9LEi6EsBsgkNn0cPKFNYQbPMl6nnFtk+
	 LktpcDW6sRfvsEVmIaeZepqGlXNn8jFphTjceJhDhNtGp2AVNp0vObN8SKp65BZfD
	 I0NxXipIC6gzpUEsF1vLSLeZHa6RXT3JpoRb3o7RJxU/G5Uqtht71a+XXQuJbnQ+1
	 JPV/dOU09x57hJoz92Z0osNWYqPKF9zSTofEtE3wp3cII4NfMWMRopF79Q6HOkvTL
	 fKgr7qWJHYWoVcQ8aQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxUrx-1svNM83i9J-00xpFO; Fri, 19
 Apr 2024 22:41:13 +0200
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
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] pinctrl: bcm2835: Make pin freeing behavior configurable
Date: Fri, 19 Apr 2024 22:40:57 +0200
Message-Id: <20240419204057.86078-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QKwPfkHrv4cXmBcL73z06scgNcBK+4nRIFXRhtWMM2VJsqkcFHh
 8+WE7qUMv6HgRukjHrx5gK5uJKZsWoqoisCOJDnAD+kHpPHYMGu8nO3aMePe64YIrav2jug
 j7OnQq2t0DyfLk0CCBWItBzSuBAULfiZfErBVX09hNPQQUH2WCYYuxmx1sfeiHgD15Awfrz
 Fnzug3OwVUlfiXVvxtAYQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HIkY0K5dSII=;RGL7d6NUp6gLGvVlkcACnebL0rZ
 PQmjsCp13/pYaJR00Sl8kSc8HFJNvQB35rbFVpceq5fOc7prjdcq+z5/8sbCEKIEWxRxnkWLg
 hR8qFKQG3+AIbqRQ3dg2lNvlk253CW+hbDGbQR/9DAJ8ms13cMGMydKsicQ7qpX41XDpN1DJf
 LPYZtk5dQlGUglhyloTAzSNazNpVE6rU3h2cdzn6r0IYEQeapRgthBmQ0sFHYEM148fcAVrpZ
 JUtUeu+yyUdUAcOcWGEzNLlgnAsGiLs28ldL9IUT/ecpcfr4A5mhIYwowtS20pl/aMhFkN6bZ
 sdTHofYwaINwytBy3hJT3RPOghqYp9AjJUzup0u3A9uhvf8IYbP8eGzP8C5hSkAM6pAHTm/5v
 Jhy7x6lTt15cA8LIrkzGpBrL/6uckk+rGtblMTTmwHrDOnu2BFpfkdAft+CaU8+pvcFGWk8hA
 qcJLPNqEhV/IR2EZt2GYSNfCVhkG2tq24mioElgZ6cRZPndH1wK3nW/8gFu6wyqKr7/XDH2rB
 L45H0BuTLCCjUHWK0KzZJp8zLInf41OjdauktLRPyTk0kLVzFZb8Xqu3FmyqPfIrzwk5zztSM
 6LDH55CCt/emly60mUNaAxCGNawbvhOdcqt2LVYQ6YOIoes6ZU4VWls1RkOKDT7tN/Mu0tyrE
 ebL8t+Z0ZVFLYqiq28iXaIVh6P3J7WZTmwnuKqacx6nBSzGJIcK3C9mJ/sGR/RmqSKklHNXtp
 rGetaDmodxF3yHlsPVtyeVjPJW9iWJlyF96j/Si9L37PjfHhS+TzHQmjzlNcWbrshwhmjxJoF
 7jsPqRwh/2rndX2vpq1b2zy+buGaAOReYUjcMXkUq7va8=

Until now after a bcm2835 pin was freed its pinmux was set to GPIO_IN.
So in case it was configured as GPIO_OUT before the configured output
level also get lost. As long as GPIO sysfs was used this wasn't
actually a problem because the pins and their possible output level
were kept by sysfs.

Since more and more Raspberry Pi users start using libgpiod they are
confused about this behavior. So make the pin freeing behavior of
GPIO_OUT configurable via module parameter. In case
pinctrl-bcm2835.strict_gpiod is set to 0, the output level is kept.

This patch based on the downstream work of Phil Elwell.

Link: https://github.com/raspberrypi/linux/pull/6117
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/p=
inctrl-bcm2835.c
index f5a9372d43bd..a5b2096c97fc 100644
=2D-- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -244,6 +244,10 @@ static const char * const irq_type_names[] =3D {
 	[IRQ_TYPE_LEVEL_LOW] =3D "level-low",
 };

+static bool strict_gpiod =3D true;
+module_param(strict_gpiod, bool, 0644);
+MODULE_PARM_DESC(strict_gpiod, "unless true, GPIO_OUT remain when pin fre=
ed");
+
 static inline u32 bcm2835_gpio_rd(struct bcm2835_pinctrl *pc, unsigned re=
g)
 {
 	return readl(pc->base + reg);
@@ -926,6 +930,14 @@ static int bcm2835_pmx_free(struct pinctrl_dev *pctld=
ev,
 		unsigned offset)
 {
 	struct bcm2835_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
+	enum bcm2835_fsel fsel =3D bcm2835_pinctrl_fsel_get(pc, offset);
+
+	if (fsel =3D=3D BCM2835_FSEL_GPIO_IN)
+		return 0;
+
+	/* preserve GPIO_OUT in non-strict mode */
+	if (!strict_gpiod && fsel =3D=3D BCM2835_FSEL_GPIO_OUT)
+		return 0;

 	/* disable by setting to GPIO_IN */
 	bcm2835_pinctrl_fsel_set(pc, offset, BCM2835_FSEL_GPIO_IN);
@@ -970,10 +982,7 @@ static void bcm2835_pmx_gpio_disable_free(struct pinc=
trl_dev *pctldev,
 		struct pinctrl_gpio_range *range,
 		unsigned offset)
 {
-	struct bcm2835_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
-
-	/* disable by setting to GPIO_IN */
-	bcm2835_pinctrl_fsel_set(pc, offset, BCM2835_FSEL_GPIO_IN);
+	bcm2835_pmx_free(pctldev, offset);
 }

 static int bcm2835_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
@@ -1419,6 +1428,9 @@ static int bcm2835_pinctrl_probe(struct platform_dev=
ice *pdev)
 		goto out_remove;
 	}

+	dev_info(dev, "GPIO_OUT remain when pin freed: %s\n",
+		 strict_gpiod ? "no" : "yes");
+
 	return 0;

 out_remove:
=2D-
2.34.1


