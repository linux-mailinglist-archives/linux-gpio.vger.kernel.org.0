Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A36D12A70D
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2019 10:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfLYJqr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Dec 2019 04:46:47 -0500
Received: from mail-eopbgr1410114.outbound.protection.outlook.com ([40.107.141.114]:6848
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726025AbfLYJqr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 25 Dec 2019 04:46:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsJNneGk6UZFwbqTAW+99Qmip9rGVk4b+6cBzVzixr6ks7M00hCQa3WgLqSIClmP2lupOWCIOm+ItfO6kRB6OPf4RMc6kPYCnWj1WAORRTxTH8NtZ6Mijs1KAjE6eDPZf2zZ7BV3gs/Q3856CAZOZG2360PekgYOZYo2+lSIhh5gSGSIcJ4Sntkn9COI82g7bu7+2z8ZX5gN8rLjEHR4XC3X+yxcqy0DsK2EN7es8NG7WvhmVM3fK5ILKn4dtu3046weJQj7YyFfG28/OiijMyjnmSozXhb+lRM1wgSowT2tZl4Uyv6BtPQzn9h3xStVCq5A/yIuROlD0b6Kd21Z1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxBJWUqGQ1+L4NUQgfNcD4WUP0U68v0v9rGOLuhrpKY=;
 b=gad9t5IZ5ma+nDE76ylG/1TktWxJGrtUtA4viEA5YANvkeWIdwE++VlMddof8+4VZNDhnINwP+cVoPnI/L6N4d5cZ2vqVWDaGmSwMA3Vx+bINdDTor/jwabM2ZV7IC6MAdryquQ1QOcyE8lCSCJB1g3+qbV3rH7GfHPlewI+LHofRHaa6JN9Yyjxe8DQMg+1c8msuQEVvzLOb2ySN0eBTG4vgHlnHLY7jhvvK21ehKk2moM2r1gscGUWlhgvccmmrna10LrC8E/ABtnmi+g4oEfS8rsNfZ5I4COVZyiBpYyNr7xnY51krbPcXeQBULiPpSdHG6BnSG1fe0NlivZ9qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxBJWUqGQ1+L4NUQgfNcD4WUP0U68v0v9rGOLuhrpKY=;
 b=gjwZi1Y4t0zeYk1SlFzZkWPr3MghD/bb8AJDiG3UZThd2hqtVpRCugL8h9lRbM7r0YHoKzTMlU5TSSz/LMzySRpDS1WXBD3umjZ5f3Ve+IyxshhgHf22OfFbDiZB/MajmV7SuuF759V2fqlK4dISsLsM/cQeUCp/0h7aHiOYIuA=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2240.jpnprd01.prod.outlook.com (52.133.180.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.19; Wed, 25 Dec 2019 09:46:42 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7d2d:4b8a:a48e:d84c]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7d2d:4b8a:a48e:d84c%4]) with mapi id 15.20.2559.017; Wed, 25 Dec 2019
 09:46:42 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH] pinctrl: sh-pfc: Split R-Car H3 support in two
 independent drivers
Thread-Topic: [PATCH] pinctrl: sh-pfc: Split R-Car H3 support in two
 independent drivers
Thread-Index: AQHVtQnJr1qU3YwjV02Rx/j9qo44qqfKotuQ
Date:   Wed, 25 Dec 2019 09:46:42 +0000
Message-ID: <TYAPR01MB4544936355182F4091F89EECD8280@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191217184242.827-1-geert+renesas@glider.be>
In-Reply-To: <20191217184242.827-1-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 94588f1b-02e7-4ea7-505c-08d7891f590c
x-ms-traffictypediagnostic: TYAPR01MB2240:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TYAPR01MB224069B9FCD9D5F109161B5AD8280@TYAPR01MB2240.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02622CEF0A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(199004)(189003)(54906003)(81166006)(81156014)(6506007)(2906002)(71200400001)(110136005)(8936002)(8676002)(186003)(9686003)(316002)(52536014)(26005)(4326008)(7696005)(66476007)(64756008)(55016002)(86362001)(66556008)(5660300002)(66446008)(33656002)(66946007)(76116006)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2240;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y7DNS5fZ02NmI1jDraBxqNiZtxv//+PUPuC/oNMZ/QpfFl3lr2y7Qc7SScVttMRL5R09PowFYpBsZl9QH2mkHO7DLtTMOmqs8401qibmA/rzyRnaYKW5kiLHCy8L/myBkjGdjT8NjdtUaIkGyO/WyCZDVyomuqRuNO4LJ/xpwck7t01BWSMyLLYHYCeePMFRxooY8cdy3rVcDZidKdAMPpTXp4ipmJ1DJh3UW1Hlfuj0uP4uWKS0rukmHtQFIhmbETC8OrCS50S0q3qrGVwizUx/opG9UjMCd5z20Q0dVrRg6cOiY/OSOEDzpDxj3F1HE3SbCzhc4aQFnDmKok4LLBCirpbI+SEs8PcYCTYU7cAhnSivtgrKBCAFUPlZnD5lUkhfECoAoKJ961iye7lljqFu7cqjW3TPWvaVSEW8JQL7Xfvz+4aVZSZJusGRRpy+
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94588f1b-02e7-4ea7-505c-08d7891f590c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2019 09:46:42.4816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z4CLL+pXIsikFhZ52l1RiIWQWj2l8kE6uKQkO5VvlBoJmkur+DjCLloefT3JWkhp0q4JvMpmv+pp4VGF/CyenCbe33Gi+63ddH2WbnmLW9wl30gB+m0s0sMeQVnRNSQw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2240
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, December 18, 2019 3:43 AM
>=20
> Despite using the same compatible values ("r8a7795"-based) because of
> historical reasons, R-Car H3 ES1.x (R8A77950) and R-Car H3 ES2.0+
> (R8A77951) are really different SoCs, with different part numbers, and
> with different Pin Function Controller blocks.
>=20
> Reflect this in the pinctrl configuration, by replacing the existing
> CONFIG_PINCTRL_PFC_R8A7795 symbol by two new config symbols:
> CONFIG_PINCTRL_PFC_R8A77950 and CONFIG_PINCTRL_PFC_R8A77951.  The latter
> are selected automatically, depending on the soon-to-be-introduced
> corresponding SoC-specific config options, and on the current common
> config option, to relax dependencies.
>=20
> Rename the individual pin control driver source files from
> pfc-r8a7795-es1.c to pfc-r8a77950.c, and from pfc-r8a7795.c to
> pfc-r8a77951.c, and make them truly independent.
> As both SoCs share the same compatible value, special care must be taken
> to match them to the correct pin control driver, if support for it is
> included in the running kernel.
>=20
> This will allow making support for early R-Car H3 revisions optional,
> the largest share of which is taken by the pin control driver.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Suggestions for simplifying sh_pfc_quirk_match(), or for alternative
> solutions are welcome!

I wondered if using weak attribute on both info variables could
simplify sh_pfc_quirk_match(), but such a code [1] doesn't seem better
than using #ifdef. Also, using weak attributes waste data size
if R8A77950=3Dn and R8A77951=3Dy for instance.

So,
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Also I tested on both R-Car H3 ES1.1 Salvator-X and R-Car H3 ES3.0 Salvator=
-XS,
and the kernel can boot on these boards. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda
---
[1]
This patch below is based on the topic/r8a7795-rename-v1 branch.

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 1ae7969..c6e86e0 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -888,27 +888,22 @@ static inline void sh_pfc_check_driver(struct platfor=
m_driver *pdrv) {}
 #endif /* !DEBUG */
=20
 #ifdef CONFIG_OF
-static const void *sh_pfc_quirk_match(void)
-{
 #if defined(CONFIG_PINCTRL_PFC_R8A77950) || \
     defined(CONFIG_PINCTRL_PFC_R8A77951)
+const struct sh_pfc_soc_info __weak r8a77950_pinmux_info;
+const struct sh_pfc_soc_info __weak r8a77951_pinmux_info;
+
+static const void *sh_pfc_quirk_match(void)
+{
 	const struct soc_device_attribute *match;
 	static const struct soc_device_attribute quirks[] =3D {
 		{
 			.soc_id =3D "r8a7795", .revision =3D "ES1.*",
-#ifdef CONFIG_PINCTRL_PFC_R8A77950
 			.data =3D &r8a77950_pinmux_info,
-#else
-			.data =3D (void *)-ENODEV,
-#endif
 		},
 		{
 			.soc_id =3D "r8a7795",
-#ifdef CONFIG_PINCTRL_PFC_R8A77951
 			.data =3D &r8a77951_pinmux_info,
-#else
-			.data =3D (void *)-ENODEV,
-#endif
 		},
=20
 		{ /* sentinel */ }
@@ -917,10 +912,12 @@ static const void *sh_pfc_quirk_match(void)
 	match =3D soc_device_match(quirks);
 	if (match)
 		return match->data;
-#endif /* CONFIG_PINCTRL_PFC_R8A77950 || CONFIG_PINCTRL_PFC_R8A77951 */
=20
 	return NULL;
 }
+#else
+#define sh_pfc_quirk_match()	NULL
+#endif /* CONFIG_PINCTRL_PFC_R8A77950 || CONFIG_PINCTRL_PFC_R8A77951 */
 #endif /* CONFIG_OF */
=20
 static int sh_pfc_probe(struct platform_device *pdev)
@@ -934,6 +931,8 @@ static int sh_pfc_probe(struct platform_device *pdev)
 		info =3D sh_pfc_quirk_match();
 		if (IS_ERR(info))
 			return PTR_ERR(info);
+		if (info && !info->name)
+			return -ENODEV;
=20
 		if (!info)
 			info =3D of_device_get_match_data(&pdev->dev);

