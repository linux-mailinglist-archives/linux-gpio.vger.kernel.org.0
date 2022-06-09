Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12B125458A3
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jun 2022 01:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237001AbiFIX2O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jun 2022 19:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiFIX2M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jun 2022 19:28:12 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2118.outbound.protection.outlook.com [40.107.113.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C575BE3;
        Thu,  9 Jun 2022 16:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQuuqWJgapf3cIuXkjbLMVFlBzwyDwPdZfpdi+VciHN7TSxAHC0RhzMrYJ+4WzJ2XXFGEWyyMzmO+lgf6LYkc3Ce+UE8ue8Q7Tzn3HONtuSFUrDYrsGnrFB1nXWqSwRjcB0gUy3I+Wa74fan2exP+CkTOq9SgQC7fYYuTbSIjZLsPdtF20g5FS9EpFxMzN9xh+oQmeIE82d+h/+09vqb30tpy3L2jZjwTz3puTcO15WdHNqqUZJg5yCdi1ov4f+Ks9MGBXijjaYN2KwVq+l8ESzhEEaNpJ0i9tGGn8t7mvvc0L/eHPCb3SCVI0Q0zMIbo9lRpRUgUb7VBzJafogv1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aa7fSAiV38z94cE2S9YfD6fDoM3fXeM0NHKCoFKhLug=;
 b=C3tLKbO4CfTUc8b8gFAwOqa+BnUgd9+Mu6Dla84gocxfeODxrBa+Lo6RqFLnbrtbZx8JsZrvNQiHLFcdo0kZgNhsEBsFA5DUwcLGjFl8EWcVbs/z9dD8NHW7I+o+cF2QfW3cLzNp84CpLcBq/ys2EpBykAnONj3cB/jPmpdG+q9QA4CEFqeYWozSty5e0b3kC6QSbmrUwCNn11Zj2DWhAzjwwZNW8sb9GvIh2iywjt72wehzbgIfqaKmkkMwkopigwhZcEBrRGaHG9ze3uAcNWtflBLtG7URKpDhgKMFpKTADiJ7teKBEPb8Nuww+IMtIwf5JijJ/XOZY/MpsslkNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aa7fSAiV38z94cE2S9YfD6fDoM3fXeM0NHKCoFKhLug=;
 b=hidPGRuupy37wBckY/QLdA27xy80RhMvpJW1ex2cBLbPOXgyFszeR2FwjWEitN271wTPY0MfmStgiKtmdN/JKUTo+4WuvIunvL99PXTO74vqBb5EPvjvqakXlEEDyrAA4UVeCXBAQ4MzmaCuhwCtZraxZSMXH3NNjOiwz0I5B9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSBPR01MB4648.jpnprd01.prod.outlook.com (2603:1096:604:7b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 9 Jun
 2022 23:28:08 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 23:28:08 +0000
Message-ID: <87mtelfmd4.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] pinctrl: renesas: r8a779g0: Add pins, groups and functions
In-Reply-To: <CAMuHMdUeRtBYp_B_EKd4UkVoUQeOqwAuBCdSeaiiFJdhYS6_nQ@mail.gmail.com>
References: <87zgipgu3s.wl-kuninori.morimoto.gx@renesas.com>
        <87tu8xgu1f.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdUeRtBYp_B_EKd4UkVoUQeOqwAuBCdSeaiiFJdhYS6_nQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 9 Jun 2022 23:28:08 +0000
X-ClientProxiedBy: TYAPR01CA0213.jpnprd01.prod.outlook.com
 (2603:1096:404:29::33) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffd6df77-02ed-4ae6-07a0-08da4a6fb5fa
X-MS-TrafficTypeDiagnostic: OSBPR01MB4648:EE_
X-Microsoft-Antispam-PRVS: <OSBPR01MB464835885CAB7FF7A8E8DF78D4A79@OSBPR01MB4648.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ikxR5ezPPTlOjuHshoHU4GTSjMK2skgYfxmPKPb/fFNEyxuIf8DHeEIDt3da3HMrwIuPD09z7QwhOrN1Ma5+W3Qmeq1hL12lrHERdT+8BgSiE1UdrCA8pfLvk9sl0/vAafMZquikVhx2L2No6dBrsEUSv7ZfXldDWOeFTGSXmIza8Pn9zht7LpO8TwNr5kU5mjouJrGy79o951fW3mR9yPwwll5pH36ZIe38muaJxS+cbArf6lfxivBuVKc3y1hcPx7SZeM6H36h/6CzkeqrrVijLcN+MMDS4gbgE2XcUaq57xSJg9QqAmQFbxKg/gCd+cAHDSvly9X8z4EFUktqa/KoKTV+vNQz3cDMl9+UyHqJZViv2hNWKBxWMd82iBE6uxqES+XkJjIMm9vDjI0jaRG69HUs6HKzgfbcIQbuxcYx/Y7GSFFkSX0/pE6wUECdTdhaEYe4fFNMbHHzJTn/8B+7uiJbqJBiERbb/zjkURn8cD6fp2sO9OIzljTEP5xr3ZpPqhEVAgmxCe87k6GtFBCrc6oKhiMw6NLXOMJfpc/SIT+3nvSVuFLh/bodisyLB/UjNxxEZU7FAz7G71aT7wgCSYnAZ3HLk/+WhXRkAs5z0mIsP/kzLTPkDlh9OjwHu1Q/WrGv4YWnbGfkFxuuIkoPDoKCSqCOQlLpRB8JtQACucjKg+ILIkr1zE/09BZk8vpnqa2hMb1wAtmws1A+Zg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4744005)(8936002)(316002)(2906002)(6506007)(2616005)(6486002)(36756003)(52116002)(38350700002)(38100700002)(6512007)(5660300002)(26005)(54906003)(6916009)(186003)(86362001)(8676002)(66476007)(66556008)(4326008)(508600001)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oINpXfRa9GtcTKtlv/A0V84Mwt3t6DFB64+drnIvteEFswmUHmxCjLSss29T?=
 =?us-ascii?Q?QbouX0riUlVkgzXbgm7kYcRItvo63SY3zVKHXk3Kvsh7oD0VqinOArwNjuhO?=
 =?us-ascii?Q?O6wSdpVwvFkEunQfwgV2Jc/jhwrPQF5dFX6RUvdZIAWeb0LFVYuhM/aqb1+i?=
 =?us-ascii?Q?oSEmGi018qAgNNcIRZZFphafYLKYMPqTn0Fyhwrr3KWULa19JndY34MFSC8l?=
 =?us-ascii?Q?A7xIAmNQpjwg2Jd29lLffRjgv5d0011mVGwFagN5vywWM0w0o9EsZnVxBfKf?=
 =?us-ascii?Q?RoMEE6RiXs7r5WshIHYo4x6Kdpp3PR24Cc05vHyHFrZ4rCzFGrZagq/1/zjv?=
 =?us-ascii?Q?to20WelyYnya780cshXMRgMrdimkrG8vNE3tT1uhQMOA9eniEj3wfUe3LRVb?=
 =?us-ascii?Q?bZTyXVc+3Z40hHqJEKPrsgiYjxUCAf4mfpLYeEZivXmKcnBI35Mva1mja0tx?=
 =?us-ascii?Q?QRJmDAv464JNu2ZRCdIIo5/2xFBuMQIR+7HZs5UOfWOcxTY5/1qg57D+NylM?=
 =?us-ascii?Q?8h5BEulTRay1JDHwpABDeQvBGr9WZ53Fx50+zENgTlvlGjo5bes5zkziMPKa?=
 =?us-ascii?Q?68zoEUAVR7B5pyO50DbC6OJzqPGN0exHhvmL5glIONQPcT8gVuyrUiWyTRuY?=
 =?us-ascii?Q?/fTuGfZPFMhM1QYiXKnf1b3w7dYilmYixavzanR0tR65lpjeImQLArqijfSo?=
 =?us-ascii?Q?hJYKifzy8l7AHH/kK2DtHbLBXDRAQf62ppptMmyuy/Wn+GroVEMltP/Lyumr?=
 =?us-ascii?Q?gdasBbJ8tMrqjf5CUVyo5oD8SlHs2rgYR3emEz+LfDJBCMfi++ZDOOUYnNeN?=
 =?us-ascii?Q?TPGfAbWLB4yCB72xTCOWfzoFwNx5BTMYWq7n0xt7gH7TpdcD/VW2jWbejZ3a?=
 =?us-ascii?Q?RsIMh5XUDalTGXUGUqBS50HJ/YgECxTrVkthiumevX4luteBKE3PQD2UdE1m?=
 =?us-ascii?Q?vp3sQhQqCxKcGP84RaGg53uxVOxSRvkr6V/IFBQYRaVKlSiBgtPU2gAJnmIC?=
 =?us-ascii?Q?3gRt2PLegR0pdO89JeKrSe4ZPxMF19Fx7Z9faPf4HlF8vC3h8aoMpd/Tel7+?=
 =?us-ascii?Q?+PaUOMnOru8LXlb6O1JRGvPF2Clt5oK8KF11jsVEZwGwkuVTMZV3kJwwV1Bk?=
 =?us-ascii?Q?Vx+1OE0ZyZDohHtLODz0RD1sy3Z8D9NzVXd52L44VY7CEedaghMisxHiX1Rd?=
 =?us-ascii?Q?MceZBzeEFJSdghtcRjxtwDh6LKCO4Gwta9IeFlLGNnynd4mNkihRmFzi9ma6?=
 =?us-ascii?Q?GeHwyqGvAvGc6DN0OQ2E9pRE68+jnFGrz/xCEbfCMwH/VnHXOGF69bvZiopK?=
 =?us-ascii?Q?3iI72XhRBpTyaTy5FWE2wQSmtMWhHP+rc7Y9g/F9/bQjJRcFXnney3xwt2XT?=
 =?us-ascii?Q?7qrInkE9Ich8IJUu5lj24rR9yNz9hNQt30iZO0JdN6wUGOuo14A5mq/ipd+z?=
 =?us-ascii?Q?dOsO19y8XvhIibmiYYISZM3hXlUO0eJ3jffFk6tyOXrG/xPq3/TgtnFQKvLm?=
 =?us-ascii?Q?kIxsZEWudP0nuVlQ1nAMwF85rHcPNm6uuYTSrx4qm+H/VGe98+aNyQ80l1ri?=
 =?us-ascii?Q?fwIchXCddkyK58uNIqvxxlW0s41wuUG4RU8AQ4I/XwjRnUDyuzPGWb0tC3jP?=
 =?us-ascii?Q?BFhgeUtOkeuKGAuMH2js9CKYmURQVhzD+rTpuisrcZ065bNrjtH1fd9tE/OF?=
 =?us-ascii?Q?/YULI9FZc5PZtyJwXFqln9Mp05wdt3Kg3e3AUwN9NEaQQTQWG95yPBxyosA/?=
 =?us-ascii?Q?zaaJVNkiXfaGFcewORSRiVJ8tXWncDpMy6tMdseswH8v1GnV7HLP?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd6df77-02ed-4ae6-07a0-08da4a6fb5fa
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 23:28:08.2014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oO0PGhW+4ftrox6pJiuBc9kRPfHF7HwhfFWyI/gTSs7eQymrG/parfvqndfxffInkvN2EObzer4xSuhWi/mN/BexVMxaKJS/KlNGHYI+IiadT793yBEqYV2D+rrSQakj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4648
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Geert

Thank you for your feedback.
I am very grateful and respectful for your reviewing
this kind of very large and confusable patch.

> > From: Phong Hoang <phong.hoang.wz@renesas.com>
> >
> > This patch adds SCIF, I2C, EthernetAVB, HSCIF, MMC, QSPI,
> > MSIOF, PWM, CAN-FD, Ethernet-TSN, PCIe pins, groups, and functions
> >
> > [Morimoto merged above patches into one]
> > Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> > Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> > Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> > Signed-off-by: CongDang <cong.dang.xn@renesas.com>
> > Signed-off-by: Kazuya Mizuguch <kazuya.mizuguchi.ks@renesas.com>
> > Signed-off-by: Tho Vu <tho.vu.wh@renesas.com>
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Thanks for your patch!

Thanks.
I will fixup all your pointed lines, and post v3 patch.
Maybe next week.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
