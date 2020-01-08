Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5F7133C0E
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2020 08:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbgAHHMu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 02:12:50 -0500
Received: from mail-eopbgr60051.outbound.protection.outlook.com ([40.107.6.51]:37427
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725944AbgAHHMu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 Jan 2020 02:12:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7Key2wQeMcXhoY2/w9eSXufu1AmhYNUFxRQF/Vj1ofieWSWPxqv5XbRgLiTI+GpMDKe0zc3aQvSudVQ+KlOu+HqPbIzzwk0AFiJC15g3pHbs9aSCoovBEMvIrAsMGokzNaCwnWDHYMiZJTTCYtUm+DhXIWAebn/txaj7yUVMduC30QzTNimWHZNZ8GmV0BJJpA6FB9KrHwVlfoT1QoPX46JdlMPSluevGd2QzAsdS8fdVaP2SjVNw48MNTfRk05h/unLChpJPCRDbLv1omFk4noIdTHQl+VaghadPDMc+q6YMmx+Qf3AK5q1p/50a1xsYcuja+f0TKiesCDEizJKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHBc7bhKL1JTAicntMKpuXc3mIEe4ThyvkYFvoOguPs=;
 b=TnK8bBNHnr4S/qtQbIBZcwcO/XYc9SwQY57JM6QMPMpAeYFwLjxftWni2s1aheDFriXezyOhfwnx4YWLcl63Fz+PW39uNiH101RIiHzAGmI3vcHOxUIzaSPbf//AbjtgJw2PV1vfR1IyKN5ewjS+nNyaeStQbzV5Q6cMIfFDXXEoloLgwDym1MA/5/tCFIU+fektwH5Z5EG9TU2uTkQXCtzXLgImXgPtVJUUXvWo9SShVOK7+hK8Rr7RcYTfJvOxW4sL0xGX0sEl84czay9UitdcRhcGhvGbjidh8WDJN7XxF+qqty7ycOVUcRdaLrP+0e2+Pkn16sZD9b1D+AvmGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHBc7bhKL1JTAicntMKpuXc3mIEe4ThyvkYFvoOguPs=;
 b=FN4Rpd6YpnlCg7UomGyAkDAWMwTjC04C5lHhF6tLQ9xoG64/4fI5XuNk1EXKN4sgAU4qJGUJmSnnbiYxTeQRvjXzhZYS3/LD6Qz4XLCdNSH0Q0B6u8ziukJfdQIU+EVlYZmSkCPpddlMUHUV3uTBDf2is4dlsieLdEqY/sF67gc=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5185.eurprd04.prod.outlook.com (20.176.214.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.10; Wed, 8 Jan 2020 07:12:46 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::c58c:e631:a110:ba58]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::c58c:e631:a110:ba58%6]) with mapi id 15.20.2602.015; Wed, 8 Jan 2020
 07:12:46 +0000
Received: from localhost.localdomain (119.31.174.67) by HK2PR0401CA0022.apcprd04.prod.outlook.com (2603:1096:202:2::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2602.12 via Frontend Transport; Wed, 8 Jan 2020 07:12:43 +0000
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
Subject: [PATCH V2] pinctrl: mvebu: armada-37xx: use use platform api
Thread-Topic: [PATCH V2] pinctrl: mvebu: armada-37xx: use use platform api
Thread-Index: AQHVxfMHPnlAs5oA3UGqZu84LtJVaw==
Date:   Wed, 8 Jan 2020 07:12:46 +0000
Message-ID: <1578467325-4189-1-git-send-email-peng.fan@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2PR0401CA0022.apcprd04.prod.outlook.com
 (2603:1096:202:2::32) To AM0PR04MB4481.eurprd04.prod.outlook.com
 (2603:10a6:208:70::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e9d67365-11ed-4a95-90e1-08d7940a2969
x-ms-traffictypediagnostic: AM0PR04MB5185:|AM0PR04MB5185:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB5185E74729D79A510FC91CC0883E0@AM0PR04MB5185.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 02760F0D1C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(189003)(199004)(316002)(6486002)(69590400006)(2906002)(478600001)(36756003)(4326008)(71200400001)(5660300002)(186003)(16526019)(6506007)(7416002)(26005)(44832011)(86362001)(66946007)(6512007)(66446008)(64756008)(66556008)(66476007)(8676002)(956004)(110136005)(54906003)(52116002)(81166006)(81156014)(8936002)(2616005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5185;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZbhHmMYnl6jeezWBbuQBi+gVNrrhbZqLE2j1n31ebC47yImLz4AMgwRm961P99cdzN5h+39vY9NjSZU29mtk9TtqwUAg0LlVJtv2WZ8N0MbvxHhTHKW4k5DlWbtnlVR57Of0RWYeaUj72RgcdkKPMA6KY7ZfuEYPW/p7njmLWputqV8xx49eizKIjcA/AWg310ck00X+ke/QbMvm4TOFu5q97pQiYvHPLXd0pqTGzoP4mKMaB0asRQ7vyCUgjEEmQSULw8nw3QeGaSSyMZ3kqHIk/ODiCRXSnWVb/Lo6bi2Za9y1Y8uzyawoivObosWe0wQFUb+frxqT7PcNRNai8ZEe4aIIjvojphYNeqpWIYJK8xj5j+7hqtACH3FtEGQcLDWoetnTktxlfM4YzKcdguFXunXvErBxjf/bQUqpXgc8u5fs1Ikx5cBSRFwlCBjnbssOdWFrYfriyWxqOEi9QxkFY7D//+Gzon+glPu7bjiRB8PLc3rI7ELJPDOzGrTh
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d67365-11ed-4a95-90e1-08d7940a2969
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2020 07:12:46.3201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wzxEHbzaUNg5JlAz6hQT8xn1mT8xeSFpIRPqqY/vMsIIahw3PHyjcuySgtAJw5G2aS3ZBoiuO5A3ostqIBv0Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5185
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

V2:
 replace %pe with %d for err msg.

 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/=
mvebu/pinctrl-armada-37xx.c
index aa9dcde0f069..bede168917ba 100644
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
+			dev_err(dev, "Couldn't determine irq count: %d\n",
+				nr_irq_parent);
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

