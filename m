Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3B19D3A6D
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 09:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbfJKHzs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 03:55:48 -0400
Received: from mail-eopbgr770044.outbound.protection.outlook.com ([40.107.77.44]:62998
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726461AbfJKHzs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Oct 2019 03:55:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRXJVCv8jrRThAvP3JyRAeSgduI9Loy7grJfo/v5/znGUkhzoFGyIlW3HBDgjTDaSjatJbHuKIq3Pufn3FMU7rbSs2hGRmXSTiv0BnGIlRaLSgUtKLzVvPVsMF+NVjnrcKwnyXJcCNAo+r//WLQmzCXCo6Iz5lYxaa5iFMyXj1rqD2REX5NdSEZCdFIqn3LWtlqedVx/dYsSjKJq381Q3Pya9sbiUtm+ZQFNTzx5qrX8cMrU5JJ9TIJKEAhBBXXwq5fNR+3UzuoZ7QzSDd5EJj29W/o1NNng/PrLPs/gxWy5DFbyHJGn+tTlFOGN6Zwz0+eJtHuTZZber9E/E0KTCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=okZTLIDlj0RBRhXFoaKKsRn+HB2lPVSL7EAKoU67yIU=;
 b=IgApdb/6BLIi/g7s8W0XbZyJhP9/UhJaoLN+VxfZBPFNWzFoXQlswZzy74AIroiP/ghIbOFeIXI4UxWm+F4OMgEciNyKwLDgeUrw1058pA+yKPOJDWfXp6v6ZpBTQPS8YW+FO1rfPIfKYks/ZRWAqH1xjyE3HEeDpegObClAYk0qGBVCluuHku2meOCtGu+oZEcvPNwRkpskv9QpUD0Y8wB4gb5vM7UajftM9Y+D6KW/tNedpbT/gELeb40TcSyysAx74n/Kttm4GHk0sm0kqyC/eT1UAdhIaAVVzYlljiGzUp5604KzRbSJNhvbVFJZ8YPPtqwipDAJHvc/r2UOhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=okZTLIDlj0RBRhXFoaKKsRn+HB2lPVSL7EAKoU67yIU=;
 b=mORW9XDHSfdVk1Rfaa6tc0stNBSUhr07Q9Mw14a5npwjof9xhDe15mv/UC5yyhw3KFn8meGGXgNixeCABeHLqXPHGVh8rxNrbxlJjsmpcgjkIKbvgrt2razGSZETdQftt1ZbWWsMEybpZg5fkQ3JHLesejcyj5x/Fnxp0ZKYFbs=
Received: from DM6PR03MB4778.namprd03.prod.outlook.com (20.179.105.26) by
 DM6PR03MB4731.namprd03.prod.outlook.com (20.179.104.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Fri, 11 Oct 2019 07:55:45 +0000
Received: from DM6PR03MB4778.namprd03.prod.outlook.com
 ([fe80::6563:173:4df7:3edd]) by DM6PR03MB4778.namprd03.prod.outlook.com
 ([fe80::6563:173:4df7:3edd%5]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 07:55:45 +0000
From:   Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] pinctrl: berlin: as370: fix a typo s/spififib/spdifib
Thread-Topic: [PATCH] pinctrl: berlin: as370: fix a typo s/spififib/spdifib
Thread-Index: AQHVgAlJGISK+LQ82kuat3nbzX3Udg==
Date:   Fri, 11 Oct 2019 07:55:45 +0000
Message-ID: <20191011154321.44f08f9a@xhacker.debian>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [124.74.246.114]
x-clientproxiedby: TYCPR01CA0094.jpnprd01.prod.outlook.com
 (2603:1096:405:3::34) To DM6PR03MB4778.namprd03.prod.outlook.com
 (2603:10b6:5:184::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Jisheng.Zhang@synaptics.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77b9c301-4060-4ae3-a6ac-08d74e206bae
x-ms-traffictypediagnostic: DM6PR03MB4731:
x-microsoft-antispam-prvs: <DM6PR03MB473161F55BA2184EAB406C1CED970@DM6PR03MB4731.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(396003)(366004)(376002)(136003)(189003)(199004)(4744005)(71200400001)(71190400001)(66066001)(5660300002)(81156014)(316002)(50226002)(8676002)(54906003)(81166006)(8936002)(1076003)(3846002)(6116002)(6436002)(25786009)(186003)(6486002)(305945005)(256004)(14444005)(486006)(86362001)(6512007)(9686003)(476003)(7736002)(6916009)(386003)(6506007)(14454004)(52116002)(102836004)(26005)(66446008)(2906002)(478600001)(66476007)(66556008)(66946007)(64756008)(99286004)(4326008)(39210200001);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR03MB4731;H:DM6PR03MB4778.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z+8qyjY+eb9taAeReE5ajfqhGqHS43kgJL9Js+fczMuqi1UZsCk6ZwZ652XPGorR+kIeeeFtkgWBrGB9fhKNEPfXmwiDMommUKa7qq3qUNo9PPrLcKTtepwQoOjJpRSkDkpBllegv78VDlt1FARK6kwtv24uxQg4NoDnhVR9NOr4Ym9xaJzx1uvGrpfwe6sV2lXh2vhbtN7dKkn504EN9QMMcqxzBAQbOlHsd+LPGZrlu5AclunQbQe0OrvA7fgTCPks6IZWBjsxbxK9gyw0yyZcI5571LTxoCzyzqi+vwdN+nYrtCyT4BpWvwdqy7qTwtxh5DisE0sp6hHMBoyx6HRIzDDsOGaodM4nSzruqG/SCc1gq75qhTeuiqoyLwMfnbKczuCPka6Wp6A5tultO4OxZF9YGRP77N8Zc+SuiKw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B7CC21E848F7224BB67D7EB898FF22DA@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b9c301-4060-4ae3-a6ac-08d74e206bae
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 07:55:45.0961
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: usBhHQwTlymreBGUBfodnGPdtgGkyf7L5qfuzA7Jxi5TDzG9k5gDS5q1lvpWdePiurjVJZpy6FuxCZqwznv/9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4731
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The function should be spdifib, fix this typo.

Fixes: 423ddc580b13 ("pinctrl: berlin: add the as370 SoC pinctrl driver")
Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/pinctrl/berlin/pinctrl-as370.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/berlin/pinctrl-as370.c b/drivers/pinctrl/berli=
n/pinctrl-as370.c
index 44f8ccdbeeff..9dfdc275ee33 100644
--- a/drivers/pinctrl/berlin/pinctrl-as370.c
+++ b/drivers/pinctrl/berlin/pinctrl-as370.c
@@ -43,7 +43,7 @@ static const struct berlin_desc_group as370_soc_pinctrl_g=
roups[] =3D {
 			BERLIN_PINCTRL_FUNCTION(0x0, "gpio"), /* GPIO5 */
 			BERLIN_PINCTRL_FUNCTION(0x1, "i2s1"), /* DO3 */
 			BERLIN_PINCTRL_FUNCTION(0x2, "pwm"), /* PWM5 */
-			BERLIN_PINCTRL_FUNCTION(0x3, "spififib"), /* SPDIFIB */
+			BERLIN_PINCTRL_FUNCTION(0x3, "spdifib"), /* SPDIFIB */
 			BERLIN_PINCTRL_FUNCTION(0x4, "spdifo"), /* SPDIFO */
 			BERLIN_PINCTRL_FUNCTION(0x5, "phy")), /* DBG5 */
 	BERLIN_PINCTRL_GROUP("I2S1_MCLK", 0x0, 0x3, 0x12,
--=20
2.23.0

