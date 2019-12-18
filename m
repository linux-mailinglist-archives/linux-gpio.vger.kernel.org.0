Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6513E124720
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 13:44:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbfLRMoC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 07:44:02 -0500
Received: from mail-eopbgr50058.outbound.protection.outlook.com ([40.107.5.58]:60166
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725930AbfLRMoB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Dec 2019 07:44:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LThZircIiJ8q2qyVuoqDaqEiK3rC/IY4mUGnDa2Nz0YVenmmApN75z3wLzfrFePXtJ9lz1PlwWbEcv0ny11fOHMko4FgMjm7BfPcWJ7CgR+Kxa+hW4S/4KiE0QbHPX1PdAc+SGerT1fvBRTw9GQ5PSIbk/HiqkWywMoCC3p3zal0snkTVt5V1lbPkHVHTYrdgl/lurOZZK7Tqe7qccanX56WZAK8aBxuDx8rQhot17P2B5JadiNt0ZNYO87rAi4IzQY7+L/r8EKlhodnmuhlgsqLnTo+1RYe7/damY7JsMaDQfA+I2F8Nqj94ONvDASEWbYnzLJf3TiBBoCDQFcLoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXmh6yLvhmI1rRF4OiSOjfrSxv0Mj/7HwudiBKb9Njs=;
 b=dAFymI14tRWKlfl+ezGfU2D18xR7+Q/K/eot3/1XlSa9srtF+lclqx+D/gm3GEesLXcZWwUwe0SefmHOlELJmbie7S4iKu6CvpXrrC8wwlOVqgewhChkq4DGXq5Dpr4g7StPFQASENASJjJn+SXh5eJCJDR+GJXr4Fcg2AEkUTuSFmqZrPM4c0kGi9+CGblGAlfVjgo6yTp8vcxLn4l1A37Al2/4xT+mYi6g+qBjWcpZzC5k5ERGiwptL2Vaae+/ooA62Tx/1dVYmVi+qIshdVtwTWHidw4NtrxsLJrDwn6Th5rZxSuQVnJqUyEX+/aSlt/y68N5H4bE5lj6o15kMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXmh6yLvhmI1rRF4OiSOjfrSxv0Mj/7HwudiBKb9Njs=;
 b=RNiX/2HhgFJ5EXwg1AG4pEg76pG97A5IJzNRHlzqWjKgvoNFEGPBEvUETewLxHp85wTofdDp4H6Eu+8yBYfZrGu1NM1FKiwckenSnBYEXFfjoLDo8DKPO5Jl2j0bidjTaxC+cRR4ZmGwrvYAARNmqoAlfX59Vabfn1pDp5vIhS8=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB4129.eurprd04.prod.outlook.com (52.134.95.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Wed, 18 Dec 2019 12:43:56 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::505:87e7:6b49:3d29]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::505:87e7:6b49:3d29%7]) with mapi id 15.20.2559.012; Wed, 18 Dec 2019
 12:43:56 +0000
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
Subject: [PATCH 2/2] pinctrl: sunxi: sun50i-h5 use platform_irq_count
Thread-Topic: [PATCH 2/2] pinctrl: sunxi: sun50i-h5 use platform_irq_count
Thread-Index: AQHVtaDQL4CWzSE89kGgSj94vmuXjQ==
Date:   Wed, 18 Dec 2019 12:43:56 +0000
Message-ID: <1576672860-14420-2-git-send-email-peng.fan@nxp.com>
References: <1576672860-14420-1-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1576672860-14420-1-git-send-email-peng.fan@nxp.com>
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
x-ms-office365-filtering-correlation-id: eb54d18d-a5bd-479b-4d08-08d783b7f27c
x-ms-traffictypediagnostic: AM0PR04MB4129:|AM0PR04MB4129:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB412971096A12FA61B77A61AF88530@AM0PR04MB4129.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-forefront-prvs: 0255DF69B9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(189003)(199004)(478600001)(6506007)(36756003)(2906002)(66476007)(54906003)(6486002)(81166006)(66556008)(66446008)(26005)(81156014)(186003)(5660300002)(8936002)(71200400001)(2616005)(8676002)(44832011)(110136005)(66946007)(6512007)(4326008)(7416002)(316002)(52116002)(86362001)(64756008);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4129;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gRrYOjtrox4pqGvZ3anZIbENYe7I6QpmsWi1H0WIG2UWko7LP5/B0UzXPbLgJ8FqrKO/f4bd35aVA7TCT3ex/TL+LfNRa4PM3XJ6AZMkLyP/1QO53Mjnj1RD3v3ii5Il2d0bZr3sOB5ohW5nkxTkp9KVCLNXWYvVuXOjf3UXBoR4zSB3LkGU5aR1J9iIIaWsXnabKIrfEo2FOotjk8LXiKkZ1dzxYy7zztq1wc0UMYhNxvnVCuxZEC0tTZIYCe6jDKZtJ6/lHDvcQMCXOEztjXIB49naJhbygiAcUoBgzFnd6fdW7HNn2rvPmE5150pYFojKlV6DtlKYkxdd4D7s7YjyB/uftak1Q+zQVkPDjxalOMcyzw0Pafy711Tj+mHWmUzOwM07J9gKlaHfND/YI7Hxbl5loCtJsL+2rKqvlKsGi3GXgL2Ooi0AUouc6NLh
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb54d18d-a5bd-479b-4d08-08d783b7f27c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 12:43:56.8409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9n8IYfVWK20ekLrvSF8rRjr6TznZzJa7HwOQ6IsXYwlqmk3/5ImxBqHCo/YPYDkPHIuI4RV9uQH10TRNYBzOoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4129
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

platform_irq_count() is the more generic way (independent of
device trees) to determine the count of available interrupts. So
use this instead.

As platform_irq_count() might return an error code (which
of_irq_count doesn't) some additional handling is necessary.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c b/drivers/pinctrl/su=
nxi/pinctrl-sun50i-h5.c
index a78d7b922ef4..31d62bbb7f43 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c
@@ -19,7 +19,6 @@
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/of_irq.h>
 #include <linux/pinctrl/pinctrl.h>
=20
 #include "pinctrl-sunxi.h"
@@ -549,7 +548,17 @@ static const struct sunxi_pinctrl_desc sun50i_h5_pinct=
rl_data =3D {
=20
 static int sun50i_h5_pinctrl_probe(struct platform_device *pdev)
 {
-	switch (of_irq_count(pdev->dev.of_node)) {
+	int ret;
+
+	ret =3D platform_irq_count(pdev);
+	if (ret < 0) {
+		if (ret !=3D -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Couldn't determine irq count: %pe\n",
+				ERR_PTR(ret));
+		return ret;
+	}
+
+	switch (ret) {
 	case 2:
 		dev_warn(&pdev->dev,
 			 "Your device tree's pinctrl node is broken, which has no IRQ of PG ban=
k routed.\n");
--=20
2.16.4

