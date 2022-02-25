Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6AFC4C4474
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Feb 2022 13:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235429AbiBYMTi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Feb 2022 07:19:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235824AbiBYMTh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Feb 2022 07:19:37 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2129.outbound.protection.outlook.com [40.107.114.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEEF0268364;
        Fri, 25 Feb 2022 04:19:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPlbgFMHT/eBDp2tKzFAaOW0i+G9Zn4lVllOL+a22eR37JdF+MuXFcjTa/tceioeA51rcIFPuYSvLMRlBHic61SwZOwUveQYe9ETFXSLT1llfmNpCeZBeSh8Iz6a3B6NagofUhElqQXXCidDnq9skmlU6fyuicWbAFn6vVlTc0tOa7gVnTOA8+moL1NsXdJmZqOxXj0i4vhMPSIHe78nj5Tm85fGlclxRiNk1WtEe+d5EE34RXnGLJ4hHWRlZx/QOJMQZMouzRwZk0q/lYC/8fyjDrrg3yUQgOLlVsPZ/AAH0+DFbE3qenwKJlQINTqiD6v4Q1taYMpjgjYTAUIQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4fqdjRBJdXrneZOb9p19NQflFDABCpGbKiaPNz9HEI=;
 b=gBq4/Vqt8ik6ppbpnXdalk++X693lqOYEokYUb64SnOOnEHHZ9JqR2M7x8MTyDTFAPJCbp/CBg0s8a5frg97R5oES7skHPgLqyQ8PqJBhZjlqnfXzWw9OMbME+6oEmTzK7Qn8QuL5d+jbVIMed1fbVg5zzSvEyL1aJfXXxTf5qUI7UoUzbUOIPDFzSoQrE/DxBLURYiYKVWCWjDrqRcRPFVxUUE+sEAGizOA6ffYpErZZSaYsZc1ebf1xa7iJiv9CQ5VJnK2HzHkB7Ob5TmeMDWZFltkw340h9ICHShIaWWN1sCYpWRX4eVz12Wu3xBS37ugT+v+8fEiz0JHMxLs1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4fqdjRBJdXrneZOb9p19NQflFDABCpGbKiaPNz9HEI=;
 b=bya613MaoxOTX0rW8RAfwp9hHmpyc50Q/mB8KcjYo+D01sjoUY1xfB/Xp1I1ItueiuWZUtdcHkII4v/62ayc++YX2QbLXmgU0voY9C3D9kcEl7Byuogd0Bl2zq+wEUD9S8gvwLW6V+6N2fHFRg/7R8aw5q5q3xjBqnrdYc12S+Q=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYAPR01MB5071.jpnprd01.prod.outlook.com
 (2603:1096:404:124::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Fri, 25 Feb
 2022 12:19:04 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::458:e316:da3:511a]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::458:e316:da3:511a%4]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 12:19:04 +0000
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
Subject: RE: [PATCH v2 00/12] pinctrl: renesas: Add R-Car S4-8 support
Thread-Topic: [PATCH v2 00/12] pinctrl: renesas: Add R-Car S4-8 support
Thread-Index: AQHYJzn550WXJE2EB026+uhOJfETAqykMgRg
Date:   Fri, 25 Feb 2022 12:19:03 +0000
Message-ID: <TYBPR01MB5341D1FD7DE5F25522211140D83E9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <cover.1645457792.git.geert+renesas@glider.be>
In-Reply-To: <cover.1645457792.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d4304bd-332d-4db0-7d40-08d9f859034c
x-ms-traffictypediagnostic: TYAPR01MB5071:EE_
x-microsoft-antispam-prvs: <TYAPR01MB50715289E74C62FBC849E8D4D83E9@TYAPR01MB5071.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U8QLugZ6tl85u4Q8EHl9wsjvqrjZNNg9h/29K4RbY5fI/vnEn4AbKc0eLrVuLSj32e5SXTE//TnBAjA+a8/PQtqDFgO08Cud+3uLXN3q92ooCcCvfeJkM5LR3JHp7Q9vGCv7wHEWfcSz3J+kVd10LEQohtpuBwmh2wCJ1+qUEKM87Mwh0J3kmrb7DL1p/dqZTKZHVrIBqWAcoL4SOGfhnjyuYDwVi9A0VuodPF3jbznSOWNdksX101gRpJoFNulDaxAMlp94b18aGlX9cjTQdZvIObxMXSkt4SfPXhELGbZime840sHHBIcVbO+6WnQy+tw5tjtYJ11sLo1IDJiAe2KV/FuP0WjGf3mJk8b9g40CE3el+F3BkQrE3oab7SgSYX76nWi+tjCu7qpDaAjuoktAybQ/ZVN+gXUGsQ89RctHcCDRgCzjsxOpPCXT0v8DEfqBc6bhvuM4y2DmE5zNYAguBuQDEo/AbXElGHvIV9xwsETLeJ36OAv8Qi19SFSIkcnDd/jjdaOWC5KxM982ePZf2Wxkh1676IiVfEwXTGeSPzcvq+WEqt923UtLvS28BhdHCtdYN8eq8bHqvCBVRGqEoUWTyBzpO4N2qp0R0FeTJl+tnnvE5TLz573fvwtBI0SfSwWWiaPWX2vci4ZDd/o4LS06cFNlYgIbmx4VYXTNjlxJg6GH6CPOgqmkNXQnDw76f0OU6uL3i+3SvgzbkQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(9686003)(55016003)(6506007)(122000001)(7696005)(38100700002)(33656002)(54906003)(508600001)(86362001)(110136005)(66446008)(66946007)(26005)(186003)(38070700005)(2906002)(5660300002)(8936002)(8676002)(66556008)(66476007)(52536014)(76116006)(64756008)(83380400001)(316002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?S4rQ1BIaBokWKoDVfarbI0aIlNYXxDxXNeWNyF9OxZY+Rt2OPNobO6Xooh96?=
 =?us-ascii?Q?tPcaque6C6yfKSeKCrdlYXyUMvL5Lv01/OpJNtJyi/Cf9W0ixjDirAwR9ILA?=
 =?us-ascii?Q?8DAIb+bBLJsh5W3rNeJNyJABsEy2Ox7405vFy0S+z3mAvagelSigCGYvFvPN?=
 =?us-ascii?Q?abzW3m1TmEeLw86StnbmVJY+6a/Tq3+nCVZVRIolhwhgkBWZp5aJpiacVmXh?=
 =?us-ascii?Q?372ax6pcrvvxavsx8FhhJ1NfvENivyjNhzr3QcBdvbKF/nU8LnMt9isdy7Uu?=
 =?us-ascii?Q?lDD/20uH+TQyOxCe3siQYzU2Gh8rTaZJRyatQpHsD/z/6eI+Rd3X2yV9N5Pj?=
 =?us-ascii?Q?AK24anE0m5MEbgi3vNV69qTik0xd9wSLPUWozACrr/vB0muQCrQVcQUo9+nK?=
 =?us-ascii?Q?XXFwxFAh50F8ejRn+UbFR736b57UQ50fzzr7Slx3XQbXqWJFc6o5QxngK3FH?=
 =?us-ascii?Q?9QGkx4gXqzbKGtbYzW626KPt1TJa5q1FNVNl6kuBnlmef/ktoDpktduPYYkq?=
 =?us-ascii?Q?0a3uEFk8Oldd8XkB5vnzndtYceXRtcZzf91y+nzOPYbXv2NbAe4qqMD7Ml4r?=
 =?us-ascii?Q?Oi/lMr2QsXbiGQRazlmCY/kdhtKlq2+Fi4rxVH1DnH06ggEuYwLYR2G3C9fe?=
 =?us-ascii?Q?SFGbvve7NmVjaoS8FTJeqVLBQ3vWBpBeUJCsec04q+oSYcTLx63d6DeKU7dh?=
 =?us-ascii?Q?VjX2f4zscov1/oPhcYcehmUB2r/dgW2+OKCyyOztUEvNAps94lPjoqt+mzvG?=
 =?us-ascii?Q?tRAWY5AqBre7ZrKlanQzzVhLZhrhogStHz7mIbhpGrZCHgxCEBuo1uvWNf+t?=
 =?us-ascii?Q?UhVo0PRjrgWsafzzoYtd5rCIcxL6e7swcJb1PH0PGUZ9hnUkyNljVZgEQALO?=
 =?us-ascii?Q?q0rgCDUFPPMOVJHLOGGtcaeuZDBrZwd/LRL8bej/soTxvh+sa2kCZZisPlpW?=
 =?us-ascii?Q?zjvjcPSbhln+CDTXd+afy5A8WG5K9jdfCyg5f/76YxJJ10HEHcclBQEdUGAS?=
 =?us-ascii?Q?Oal3Ktl5fDSqCFZ45D4hKOhEaMygnU2pJ/StU+odDW5mOovthmoGkaQaPg7K?=
 =?us-ascii?Q?2AYhKML5313UxrLSOQN0nJ404vLwSAs1R+Y+Nrz6yPf4VIkrweKD7rIPmKZ1?=
 =?us-ascii?Q?ABh614Yl+aRAY/DJmobxH8Dt1e5gVVNoGGypcarG8dRvwt1xrtQ0g8yEAs4t?=
 =?us-ascii?Q?bcwHTsxA5RrgT53zFaouQDxCh4Tj3nnXMNpY0Av/T1eS+8R+49/PzyG0gmwB?=
 =?us-ascii?Q?ol+ouy8R4zwAvYxtOZdCxYbX8CypDdp05w/P9OVxyXY5a5O2lQU5Li9C3r71?=
 =?us-ascii?Q?SuKJAZoxF6N58EWuCKJ/vHlhIfQjLrAxf+kCMQME5wDV/HLQAuS66Z22d0+Y?=
 =?us-ascii?Q?PDVq5dZWC2vAb5PcDQ4gFq47XVeiBrdPKK324pXjCXp5aBMhxG5DKt95U7h8?=
 =?us-ascii?Q?ST6/oGi5voYIqC0Y1dF/XfrqTWdT4BFEtuLPmmJn024s811jKulu4kM4EyUk?=
 =?us-ascii?Q?pSC3oM+PTxTxpY4cDpbgaQ1KUtSQL1/T207twz5U9pU+TK1IVB4rPCLpyEbG?=
 =?us-ascii?Q?P6ab6wph6bYhZkkmA7zIhq03+67qaywLUC5AZRFCeqzHgowJ7dl4m6sf/e+Z?=
 =?us-ascii?Q?benYZYh8L8xl11fKQcK2RGsY+QbIa5OxzDJ4R1qruREq/Q0rJELXSz3V7g2L?=
 =?us-ascii?Q?ilOX7E1ZOX7PsyTZItqYcnE576ND9LntaIhB65v9DjkI1i8paZku0Zj01VHH?=
 =?us-ascii?Q?BFNIyF3OyA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4304bd-332d-4db0-7d40-08d9f859034c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 12:19:03.9976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /5M1ydaUoAe6BESp7yP6VdDOv+acB0vG1ZrDlhZmCoCvqh2KhcAr3TZtD37DkYJ7XkrUZUwf9KMMQXBY40BypPFDw4GYVJkWZZUmsqK2jcKqssOXGngCJG0jXlsOhfDM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5071
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

> From: Geert Uytterhoeven, Sent: Tuesday, February 22, 2022 12:44 AM
>=20
> 	Hi all,
>=20
> This patch series adds pin control support for the Renesas R-Car S4-8
> Soc.  It is based on patches in the BSP by LUU HOAI, with many changes
> on top (see the individual patches).
>=20
> Changes compared to v1[1]:
>   - Add Reviewed-by,
>   - Fix whitespace in Makefile,
>   - Remove GPIO and No-GPIO pins, pin function definitions, and
>     registers that can only be accessed from the Control Domain,
>   - Spin off clock and DTS patches into separate series,
>   - Drop RFC state and widen audience.
>=20
> Serial console and I2C have been tested on the Renesas Spider
> development board.
>=20
> Thanks for your comments!

Thank you for the patch!

> Geert Uytterhoeven (11):
>   pinctrl: renesas: Add PORT_GP_CFG_19 macros
>   pinctrl: renesas: Initial R8A779F0 PFC support
>   pinctrl: renesas: r8a779f0: Add SCIF pins, groups, and functions

I have already reviewed these patches above independently on v1 or v2.

>   pinctrl: renesas: r8a779f0: Add I2C pins, groups, and functions
>   pinctrl: renesas: r8a779f0: Add HSCIF pins, groups, and functions
>   pinctrl: renesas: r8a779f0: Add INTC-EX pins, groups, and function
>   pinctrl: renesas: r8a779f0: Add MMC pins, groups, and function
>   pinctrl: renesas: r8a779f0: Add MSIOF pins, groups, and functions
>   pinctrl: renesas: r8a779f0: Add PCIe pins, groups, and function
>   pinctrl: renesas: r8a779f0: Add QSPI pins, groups, and functions
>   pinctrl: renesas: r8a779f0: Add Ethernet pins, groups, and functions

These patches (4/12 to 12/12) look good to me. So, for the patches:

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

