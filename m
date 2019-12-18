Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1009312471D
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 13:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfLRMn6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 07:43:58 -0500
Received: from mail-eopbgr30044.outbound.protection.outlook.com ([40.107.3.44]:5796
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725930AbfLRMn6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Dec 2019 07:43:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGe/2rzd7woiJY+bSydVu8ZVaUrph5EuLsvaUhF3/z738znFziHBghYIFn0AcrK/AgBEe8KRM2PJYLl1rUxKqp89Vwu9CYCu16OwT6n++hpfZi5IXp6KWlogBM3tyi/8y4up1VP9SJsL7unmNBonW+LKbsp7ZenzuL19Nxc7SiBz2N0gyDk2WCpG98q7zD5Guw99qV4Glv5SXxbZDWuvZFMobOKduxq8Xh9HOe/y92o4vWYqgGjsaiqS3Hw4jerXQhCV/LIurw1rQX/IrlkmGkZKNbUm4k3+Uk8TkbTb4JerpJ5RA25POsGsxD7Mm8hrPrt+xSv38Gr9/O9cCdDmJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zssb56up1R/q7ZqlqzZltOvkUEbo+1At4Et7FtWROWc=;
 b=ZJ39VXNfFSobej6oDtNgFp0SJz0+Mfg2lQ2Ze2hTNFbDAME1JZZkgs/awG3oPygdrjhFjF1PKstuu2Ld8olFMFx1Y+SjjPalvbWD5OdGxF48wxWP42KVLJqJ+qkUSUOGXY7WeH8NQvblSIJFSbpBDNe9T/33cqO4vwtPxkk6TrmRItF6S7XOlVHfSOlyr4Rw2cd0U8OEMDRBD51+m0fxd+231CsN9wSsvFfpm6LpEQVvx5ns176WMnqAS9FHDKrsLDPxUZ9cRvfuzHNkdujaf0IYsOmtHJdrIZqCxdJ/iKpUYl7fYMm2G3Ea0lxtMFPy10y1aNmvsi2A7fZMuDT/Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zssb56up1R/q7ZqlqzZltOvkUEbo+1At4Et7FtWROWc=;
 b=TqLBvSxOovSV26r20M3B/fgu70MCFLrtB4+H5pXg+vZR864CDF/wPrfupJMcByR+b8ypeiMe6yF98V5VcFlovvInvHisroVs3zFXlPT2F1taKt1rGbpP2/KJBulKETr7oq1pWf/pL70Vp3oA68ZZJajQKY/vK5b213PUEOo3FYA=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB4722.eurprd04.prod.outlook.com (20.176.215.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Wed, 18 Dec 2019 12:43:53 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::505:87e7:6b49:3d29]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::505:87e7:6b49:3d29%7]) with mapi id 15.20.2559.012; Wed, 18 Dec 2019
 12:43:53 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "andrew@lunn.ch" <andrew@lunn.ch>,
        "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "wens@csie.org" <wens@csie.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 1/2] pinctrl: mvebu: armada-37xx: use use platform api
Thread-Topic: [PATCH 1/2] pinctrl: mvebu: armada-37xx: use use platform api
Thread-Index: AQHVtaDOy35Q6KpKLESPO8UEr8sdHw==
Date:   Wed, 18 Dec 2019 12:43:53 +0000
Message-ID: <1576672860-14420-1-git-send-email-peng.fan@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2PR06CA0007.apcprd06.prod.outlook.com
 (2603:1096:202:2e::19) To AM0PR04MB4481.eurprd04.prod.outlook.com
 (2603:10a6:208:70::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5cfbedf3-6676-48e9-6ac9-08d783b7f066
x-ms-traffictypediagnostic: AM0PR04MB4722:|AM0PR04MB4722:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB47229E82078D44E9E632F9FC88530@AM0PR04MB4722.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0255DF69B9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(189003)(199004)(6506007)(110136005)(54906003)(5660300002)(66946007)(66446008)(71200400001)(2906002)(26005)(316002)(7416002)(4326008)(52116002)(81166006)(8936002)(44832011)(8676002)(81156014)(478600001)(66556008)(6486002)(36756003)(6512007)(2616005)(86362001)(66476007)(186003)(64756008);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4722;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2zt38CnXp6UZQjLEFBDj/kyNU7gw1do5wuTm/kLdJ5dFUtRk7nEy4ONOuW/RQ376rOQRmDlelQ0emDoPF/RJxYGYhmsYaul6SxYmR+0iEMFYxp4sxWf82WGFSb9liB6LbVzdfWTLobh0YAGCpzGkj8GZhrIB1WV8mZ/B3yMCnqpFTN4iS9VZQj+nb5xvFx03gaXU3V1IsE+Fi6j/FHy1uEkCUSTiE5J/XfWFEcSFl1atOnjOLbdAqKBY8bML9WzJ1ewbNO3fOoKUgS2u8DM41AXVFraBncOYnHgViV5yKhR3aCC30bBNwjVmNMjED89OW2jNVnlAho9nliJlcby/f4duIfdyu5+gG+Wq/n2TeqCpWyIz/n6gI4eCVfW21O9hB1kI8ypIoLpgTm2nixex554FSAIx+KcNRI0kZKs7pWJBrJBSn6DzUXi1A4ESACv3
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cfbedf3-6676-48e9-6ac9-08d783b7f066
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 12:43:53.3511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gr7MxKJ4SsFNJJXERNRLVXv06YjaPYmwMbHk2Q/bpSOCFxSFd8CnBduuH3DibSHSfuaLpukmY+2yaNduwwIZLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4722
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

platform_irq_count() and platform_get_irq() is the more generic
way (independent of device trees) to determine the count of available
interrupts. So use this instead.

As platform_irq_count() might return an error code (which
of_irq_count doesn't) some additional handling is necessary.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/=
mvebu/pinctrl-armada-37xx.c
index aa9dcde0f069..cc66a6429a06 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -15,7 +15,6 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
-#include <linux/of_irq.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -739,7 +738,14 @@ static int armada_37xx_irqchip_register(struct platfor=
m_device *pdev,
 		return ret;
 	}
=20
-	nr_irq_parent =3D of_irq_count(np);
+	nr_irq_parent =3D platform_irq_count(pdev);
+	if (nr_irq_parent < 0) {
+		if (nr_irq_parent !=3D -EPROBE_DEFER)
+			dev_err(dev, "Couldn't determine irq count: %pe\n",
+				ERR_PTR(nr_irq_parent));
+		return nr_irq_parent;
+	}
+
 	spin_lock_init(&info->irq_lock);
=20
 	if (!nr_irq_parent) {
@@ -776,7 +782,7 @@ static int armada_37xx_irqchip_register(struct platform=
_device *pdev,
 	if (!girq->parents)
 		return -ENOMEM;
 	for (i =3D 0; i < nr_irq_parent; i++) {
-		int irq =3D irq_of_parse_and_map(np, i);
+		int irq =3D platform_get_irq(pdev, i);
=20
 		if (irq < 0)
 			continue;
--=20
2.16.4

