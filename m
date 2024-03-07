Return-Path: <linux-gpio+bounces-4187-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E99874869
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Mar 2024 08:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2B5B1C2142B
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Mar 2024 07:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3C31CD2B;
	Thu,  7 Mar 2024 07:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="bSGtJOtQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7D11BF3A
	for <linux-gpio@vger.kernel.org>; Thu,  7 Mar 2024 07:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709794906; cv=none; b=VlCE5bkZDdF0rufhvXROkukyZs71402DIIL9ZEbwa169oZAN2ps0SkfyoYfMBLdxLjIW5f/i9CDU4lTkYOsuNhUvzb8D+CKMrZU2YbTrT9L4sO76pCPpG6N/RXWkd0QSLo/nPmJMbs+LndrJhFAsBYMjT6dOib/GtOE5vPwlHcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709794906; c=relaxed/simple;
	bh=WZMlvwhKwo0STQynbUFCeOquxvFPPnzMmc2OHbcnTSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WFG/fx/KJUCvEDaXd1rP8XniEWPX3tFZO9eD8xO/kevejW+t5o7+I6cXa2Zfs35mnXi7uzZJOZeM22+U6KEllwTOauk72xgcf4eEnOrgWNr1ZUcZclvku3KtvJL4ckilKphxJsz5HMiqvWbLOlRGRTXQ+l7SE1BpIVRLmxNkmXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=bSGtJOtQ; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1709794895; x=1710399695; i=wahrenst@gmx.net;
	bh=WZMlvwhKwo0STQynbUFCeOquxvFPPnzMmc2OHbcnTSE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=bSGtJOtQCwGmRxFWbMCqCHaIEgtZYi72ssTsB0TtzgKm6fpKwDh/YoEZxEE+i6RS
	 urpgrR0oayH2n48dgj0xbpLKOCQUP95amvHkw32pt+kj2uMcdTaArvKtixEDycwsN
	 7C5LaIzuSn2BTXmFEdcBgrKpDWFKZhu/sV0tye865iRRfx9UiaZ1LihPZRn/373Xj
	 ANUk8JywdsIc7qTuomE2gwY9BFK7L1we+RWLfTvVTr9kXM1kM4UGBDt41v5S5m83g
	 QF/5enQoJdjkyk6tLR039aOpNhx05NUHkgnzWtlGUUjdtikJHgWWdGLdC0hawHxM/
	 hdnqTWOcmtZWA/WtyA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsHns-1qpkkX1Fda-00thyx; Thu, 07
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
Subject: [PATCH V4 1/2] pinctrl: bcm2835: Implement bcm2835_pinconf_get
Date: Thu,  7 Mar 2024 08:01:12 +0100
Message-Id: <20240307070113.4888-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240307070113.4888-1-wahrenst@gmx.net>
References: <20240307070113.4888-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:S0BhBl0JbCOyPPu2k+xrDPamKFGD//J2ncjVL7zhBiDxFRw2s/f
 hlSD6Q8wZJ04J/oTovXTGPlNQ6UXQdIDmFcP2hIjoPs/cR7usMhnId0Xqb8Dq/zQd4v2Jq/
 KbB084TcACkSeAPyTVMGzUYcX1EwY3K6G/RFnT8zCowe+UJujKMH12lXBJNODhUUNl4aHBK
 3tyBoIwPMr1XmurKOaFrQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pgIKXaKr3hw=;Z6QWGg3qUCMEVtWDFZwkCRtEkKa
 Sn/0CRpYhar8ibZkcTnO1fSr2AoojCHo/RDnGqV8TaZFHn3/W2PbnVKGKE2uN24CzER8DbR1Z
 wfAFf0keDgFD4qnQyNLlpndeg0v7es9z80illnROIhNKSF3APm4erhFNUMH4geO3s74HjfVGI
 K3JdUxv4+QTo/PCRcdyLV73Ft3hpkwVAAU5/+m3KzYFdwH0FdIQlx8AWGWBDipvjpppyBpPvA
 jDJ/w0IhPH5bjcnBIzeTlVoygADOKLAP6sVFE70RipBIgXojoZeXgeDR+LUgvST+O3P6W090b
 RoYX8625tDpQe1I1yJFVDicEMMUk03tHWes48HMJG9kpef/AYimEOuLENuK/4NtIAE5G5qN5Y
 GerhlRoETPqLbNp+QeL+P4LB6cw26Ow9wDSdgfaq8IWdoYL0LGSWGk2PhSQgqLyxRFfmQh6sb
 B6oiCy3oohjIbSX78l4G++DUkShf7U5NtloCdeELnqp5MvI6573pwUINL/LzeFg+w33FoCfSM
 Lt3cYyjoZVxt2ibd6kjL+o264Ycr0ZMBLOyqABNt8cu5kvcrxTf5AVYKo7Shaqpl/2vfR4HUe
 mCJnYwYLY0rSIi548b/QJOYouff2o6rIN9GGIKGaID1Alf4bpNZZQ4rnp18vc6rP7lMoKaiN7
 zD2pgut4ggv0MKK+Xb9dm5+nqBCLleIOEurULwhJKsC0baOW7lfM7cnaV6+4a6BJSki4eT5zP
 2PcbaSDGPklPOYxgOKb2CdeUVxW32Zqnzwj0e8fea5t/IzFDJmHaxpqUPXquigN3QNWGEMDgQ
 juEBhcPhDWqdhTL9QdUAbgrJ+EIvypFCWgviAvLMfhDF8=

Even the driver already has implemented pin_dbg_show, it could
be helpful to implement pin_conf_get for a more generic behavior.
Contrary to the BCM2711, the BCM2835 SOC doesn't allow to read
the bias config, so the implementation is limited to the basics.

Keep ENOTSUPP here, because it's only used internally.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/p=
inctrl-bcm2835.c
index 1489191a213f..5d2b188a1ef4 100644
=2D-- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -1003,8 +1003,27 @@ static const struct pinmux_ops bcm2835_pmx_ops =3D =
{
 static int bcm2835_pinconf_get(struct pinctrl_dev *pctldev,
 			unsigned pin, unsigned long *config)
 {
-	/* No way to read back config in HW */
-	return -ENOTSUPP;
+	enum pin_config_param param =3D pinconf_to_config_param(*config);
+	struct bcm2835_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
+	enum bcm2835_fsel fsel =3D bcm2835_pinctrl_fsel_get(pc, pin);
+	u32 val;
+
+	/* No way to read back bias config in HW */
+
+	switch (param) {
+	case PIN_CONFIG_OUTPUT:
+		if (fsel !=3D BCM2835_FSEL_GPIO_OUT)
+			return -EINVAL;
+
+		val =3D bcm2835_gpio_get_bit(pc, GPLEV0, pin);
+		*config =3D pinconf_to_config_packed(param, val);
+		break;
+
+	default:
+		return -ENOTSUPP;
+	}
+
+	return 0;
 }

 static void bcm2835_pull_config_set(struct bcm2835_pinctrl *pc,
=2D-
2.34.1


