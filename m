Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4873D4C4444
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Feb 2022 13:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbiBYMHr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Feb 2022 07:07:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiBYMHq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Feb 2022 07:07:46 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2128.outbound.protection.outlook.com [40.107.113.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CFE714F995;
        Fri, 25 Feb 2022 04:07:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbUdkCdqZFbTFReGL6tBykeVcKZgF4Sn76FycRbh0E7HBvP53nHgPmqDDHZ6Rz/aycSO2yFCo4dGwOMn44KFqNnE6LLqe3XSD1IXTDtzNCooTZYcv+M33sPM/MtQDtOqdkcAipCuSu3u0EMi9NJskOMxFxV2/U/kblIuiuIXpW1bYA4w+YIbNVscPkrNuI2dkGwQylyXFnXiSilf5DJYOqnztvMUDOWYVR1hBTQgodbt1JBtzW31AWBkl7zqWT3cObWP1XF4JLt4Xyo3q42Q1txQxJVg4TbVJae0gZD+jWk3Xer5aqJnUTD5KTI7Nf0m3mcLwgaCfS6uRO1NOy65ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6g1cF1ZBByta3LCkk3FLhsvhmRdONJ0Kk7g74hyHpug=;
 b=iqjT2iIrHJQFzCOLuAwOyNq7JW1XWzIckUZ7hrSAcjCuvHyjjRH7M9pPjSsGKZJm5xZu4/g9zl8NZFOPpokf4aI9R3PltbnJvfkVXZnks2w4iLBG5Bw6/hlnf5lvFMWkTKNhSFzbsD32iodt+F2iuhlJJedJIAbbF+TAFZ/7ETDJy2AtfGyCjnZNE/90I64NrFw4pnSPWri1Bx3VJ3G5yU+6Gfg/xTzRopvxqZLvo06Uswh3fp/roG91YTFPRiZ1oBSopzFy275zv7CfDSxPSSez8/BEEc02vWDdBy24dhE+Ns08NuZepqqroHXZCvLAAHzukkRXeyglBIalZr1AhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6g1cF1ZBByta3LCkk3FLhsvhmRdONJ0Kk7g74hyHpug=;
 b=Sam8qWRAWdW4Bmj/QPeSLVmChuk5S5pSluaaga/QlT64x+CgZvx9ZgtCum85tHVGglOtSzgDogvj83bDMO1VjwC0RBiaowvf8lLWDw//arHRDCE4OIKaPMBhZ0hn9J7XKW3RFM4MjroaMZMBHqAH6YiuTExkgEu/s3qegfuTFXk=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSBPR01MB5175.jpnprd01.prod.outlook.com
 (2603:1096:604:77::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 12:07:09 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::458:e316:da3:511a]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::458:e316:da3:511a%4]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 12:07:09 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC:     Hoai Luu <hoai.luu.ub@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v2 03/12] pinctrl: renesas: Initial R8A779F0 PFC support
Thread-Topic: [PATCH v2 03/12] pinctrl: renesas: Initial R8A779F0 PFC support
Thread-Index: AQHYJzn9j/NTCl01GUOurrPpJWxL9aykMNgQ
Date:   Fri, 25 Feb 2022 12:07:08 +0000
Message-ID: <TYBPR01MB5341194E803AB92109AA3ECCD83E9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <cover.1645457792.git.geert+renesas@glider.be>
 <fd8201da404b7b0897130b254380ffc97f437266.1645457792.git.geert+renesas@glider.be>
In-Reply-To: <fd8201da404b7b0897130b254380ffc97f437266.1645457792.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de98ccb1-9e1a-4ae1-b278-08d9f8575923
x-ms-traffictypediagnostic: OSBPR01MB5175:EE_
x-microsoft-antispam-prvs: <OSBPR01MB5175A24195CA99507ADB2ADED83E9@OSBPR01MB5175.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZNdXF3MA2Dxebqu9d3RGgBh1K+sJZOJaQUxUSI8gj1IFJ9NYriWptHa5V99jDjaXNZAnHHCDCh7gH5MKSQeQvpwnTXVWzrg5fW4v9Lbrv79b0TlUt4a8yn0sNQyybW0yBnEilEzqcXSFQyY/RVqRueFlKFi1eXShkgfgEmkkuM4UV+MQc1Bpjte/a6mGyNBwou8D30hU2NHs7XIhwD9qgC5PiMhIzIsGH+RHpD8AhsW+HLHrvO4BELR5/Hpiz7G2GXhC6mOKMU66k3awk7MLuhrf30RDJFRvheu4QRozCc4xWAy2kWG6yRFdcPv2Y5JT8mNtZ+jA1Gk/U58lGuLUzChCsQLqy2qvum+guhmzQu8fZExHRcFnK4EVym7Ni87LOJYuaiAR551W3XBCd/fHNrWoZVezfz+qPy9/iRb+SVtTRXaZqEIoLLg6MC/Tmxiz79u9xpCNuVn1DP0uSMd6TacaBqey8mXt66vev9k9bbx/PLYHzk/A7Txw1z2ICPN6PFqfV1jJjV7AvwM142F7ovPkU3K/0fp0WlAENt6bRYNDPvDBQfHXnFyzA6U+TwNJWo7jt6ev+OGqXQAwoKZMoFw0MR/4ZzENcYn/Rv34qm/OWqmPRUq/9NDBX9oZZnH0NdlasWVb0c82/LJe55iY6YKJrSzTrML9/ehQ8VdCEUSDsnyJf5ENGxxibA9gBz4ixVws/RyqZkUicUGgPs87MA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(6506007)(9686003)(7696005)(8936002)(4744005)(2906002)(71200400001)(186003)(122000001)(66556008)(66476007)(64756008)(66446008)(110136005)(316002)(508600001)(54906003)(8676002)(76116006)(38100700002)(66946007)(55016003)(86362001)(33656002)(4326008)(52536014)(5660300002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xPA/hWJMg59yqMUJgcPnxNepP0yveZGb/+OoWGFZljm6rHAuS5ZH+CUxER28?=
 =?us-ascii?Q?0Ez4A4UO+lo8ljGF6Sv/uaAiBGdUkGEO/Ua9TQmPQd7vUo8De4jTZw5oWvFS?=
 =?us-ascii?Q?BjjlU31V7ITekuML9TImiigBGQ9dIAaiucOegGNI/kHYQer+8bSHS/p9IhC1?=
 =?us-ascii?Q?QsTcRU19czW4VACZOK1NVwHc8Nx/Dfi838b5tf1meok6MVrpn3rZYS4jDv4X?=
 =?us-ascii?Q?KZCuQu7ioQAHHK/9P2VdjD/UkXj3VKKOdJSYq6f4mnzhk8FF88ESEN29XiNG?=
 =?us-ascii?Q?DWmET/tHm3GuTGZ9yC+XFTN8FQPpXGec8KE2QQgQaRsWRJAeUSznE+c3V4Mr?=
 =?us-ascii?Q?Y+LWvoIgNocEKFT7PyalipO5U34mbBhU7BGAQ1MadaAMn/S7LCJmYDbMN3r5?=
 =?us-ascii?Q?J8JHbjahKxjOU3YKUT2wKUMFc+y2mOh5P+MuHPakOdqDsV5HCBbxkivP1j6D?=
 =?us-ascii?Q?vXp569oA+sGxpb42ER/jgB6bm2b91UvMuxV3XZox8+/SZb+HM/lbji22h4EC?=
 =?us-ascii?Q?v0bvEgnU5FTeUe5Nv1Kq0vkIPj0YT8K09mJrEmptdddUSvTopwVrAdF17ZL5?=
 =?us-ascii?Q?Z+3YA8N8xocWwYAvobJGtsWa52N3YZzWV/S/9aEG6Um5ZWSz17/I3KbFkayN?=
 =?us-ascii?Q?F91I/niZRs9YvjhRUHuaDJQh9DX7jbuXfdah4/KNfb2FXvtCqEhMs97ShhQW?=
 =?us-ascii?Q?Cf6sF8w5TTnQg9WCmhs09GAE8ap/jZvnovXawY7vhd9ID2bX587iqs+HKsk0?=
 =?us-ascii?Q?l+/8f6N6dQwKZcpUEHUMu+rGEYAEtRZKSeDU7sB4g0RAClUMDCMs7B2xCeeJ?=
 =?us-ascii?Q?BBRD+ZI9q68b/xPagcMIWUxlS/htMPiL/UJZAsCBY2IG5L5Lp85lkMrBtcMK?=
 =?us-ascii?Q?rJIKl5uQRcMRD/KjayUEUoRPpuQw7bA2/7B86O7hl9h2l1cRqAsWffyWu2pv?=
 =?us-ascii?Q?ZmqXNFTs4T7jImwgzyT7NvqvvDuwFcHUb5ZIrPUuuRoU5/gxCNOYA8vgHMkB?=
 =?us-ascii?Q?P2H/38RyW20kzYSJIEul0kl9iudTnpT06UNqC4al0BV5p/G18saJHHMFdBHp?=
 =?us-ascii?Q?dy4TAUbHnpST0d+1O2eflAAqvd0tyK5GwnY0E3vcf+D/A6+m0KY55a4tTEFi?=
 =?us-ascii?Q?OA8e/a/vXR27KzqamUHoJEm33bFpcf2568bmJfKDohCyreskf6YyiEBn8/hr?=
 =?us-ascii?Q?qMmByNtm6wt4cTznibF8QA2J3TbToT4yoUwHDVQigJw/dcrusMBBhbLPVLF0?=
 =?us-ascii?Q?5Us2IHXQZuqqt1SeqWPn3WlcdXYXFC7raAo195yr9uZgtVdpd26EhR87BiwQ?=
 =?us-ascii?Q?EJB0wSbGxKRI0dFDMTMe1+Ylyf0W0tlriNLSrd9r0lwWQXRpfuebAktN+Z6a?=
 =?us-ascii?Q?+5guQRc4DN9BRMXewWLeMhGlL/FAcHJtOR07pbriU29flnmX+bIzuQHKJ518?=
 =?us-ascii?Q?7i5L0uiytgQIz2N67R6S8g0B5VgJmessF6U+6PIhgl45JU+AUccQe0FA851f?=
 =?us-ascii?Q?jgWiDvoyiIDDOXl55HtspWbhQhgmKFxd4mCNmOiceg0Vk12kGBO1SJoAJ0D3?=
 =?us-ascii?Q?CynBkMCDLK20/dWnbmCli+2uCvSjn4pVQN7dTM0Q3Z1bgWmnWaGTCGF9QzGG?=
 =?us-ascii?Q?XLP/hJgsEwPEwH67rAcfFTshVMwRVn4nNboLYYKPamD/A6jeyjlTgN8dfLU6?=
 =?us-ascii?Q?CHJCyNriP0xN+Bz4EA+qSTxNjPy5ThECObxSpvnpOxu1JTK40607MDtjSVPT?=
 =?us-ascii?Q?s5rhn0amLQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de98ccb1-9e1a-4ae1-b278-08d9f8575923
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 12:07:09.0365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2uwqJur71mbFRyYl+QIb5v/Nx+hwm7x3GI2eo53nf6In9hnJ96qllouoz9ETHrRh7t0IN2UtmAdmbROwMmkP1tIDlihY9jLpO1TX9Bo/CoiJB58HVQg2dCS6X+6OV8k+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5175
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert-san,

Thank you for the patch!

> From: Geert Uytterhoeven, Sent: Tuesday, February 22, 2022 12:44 AM
>=20
> Add initial Pin Function Controller (PFC) support for the Renesas R-Car
> S4-8 (R8A779F0) SoC, including bias, drive strength and voltage control.
>=20
> Based on a larger patch in the BSP by LUU HOAI.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
<snip>
> diff --git a/drivers/pinctrl/renesas/pfc-r8a779f0.c b/drivers/pinctrl/ren=
esas/pfc-r8a779f0.c
> new file mode 100644
> index 0000000000000000..2f3fbb794eb635c1
> --- /dev/null
> +++ b/drivers/pinctrl/renesas/pfc-r8a779f0.c
> @@ -0,0 +1,1024 @@
<snip>
> +static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] =3D {
> +	[POC0] =3D { 0xe60500a0, },
> +	[POC1] =3D { 0xe60508a0, },
> +	[POC2] =3D { 0xe60510a0, },
> +	[POC3] =3D { 0xe60518a0, },
> +	[TD0SEL1] =3D { 0xe6058120, },

TD0SEL1 should be 0xe6050920 (0xe6050800 + 0x120).

After fixed it,

Acked-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

