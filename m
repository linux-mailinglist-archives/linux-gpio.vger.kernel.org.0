Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4026560D9C
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jun 2022 01:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbiF2XhG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 19:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231426AbiF2XhF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 19:37:05 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2111.outbound.protection.outlook.com [40.107.114.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8310DB10;
        Wed, 29 Jun 2022 16:37:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YU8bKxbs+AmdP7sEBr+RrbhqdlI+NFUS7Op3iooWqO4krHCVNniA76ylX2QBLWuYMV2isU3L5P6zQo2JNiJlyso1G8cb899xDzGy6z0621Q9ybHfPKlZnx6FSKHNSMHL8IJY4axRdCYO0DPsMs3WhBbzzaQ+liK4edIvzvCLZnvm0BtRaPpzgjQmp91q8AZTQZwob0eUHG66qWBWLODbHu5eRkyyO/09liewzQbabKzIzFdHnEqb9yEYohNpe2wbNzeq9taQCN4ldPLY1TiyK7er/660v/HQqpJu/aSHvElGnzrPaZO70ka8K3tvg3YC/x+NMGba99zKe4vuZM6x1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaEThjyNPOLrNoxTb9Dq/ISjxljSNlfEIe3s9YRTpio=;
 b=M6q5AzXq21c5v9ruya7C5c+jo4qr3pHGzSKwT19KBcpJZsiAsszT8ysxA5mzQ8yRv11Ut2WOrnq/gBEyroUnIOSLWw+SFOAdPOk00OcnXV/lquys+8pKejdrYz2gbOOIZkuAvurQH7+BTcdzwGPPvWYGMCfAe1WQ8/DpMQ8FICeYerDcPXSh7GytNhBQLj4xzulKzYaDjFmuDGDzwHLyYeWJj6wrZnvy3cG+MOADM1Omk5K3QwhJ6iomM1qnQu8Xk1z4tNRwDcFd096qaeOcpDPEl9cz9AmiRcYk2Ky5AyViPKvQ5hcbLs2e93ilnMz5KL6UL6v1KTBtIiYmMmWzFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaEThjyNPOLrNoxTb9Dq/ISjxljSNlfEIe3s9YRTpio=;
 b=nq/ttg1EFGVLI8nFoE/IRZ8YSqZZ6hiLd42J+v2s+9FxnxRErOAoAPkk9LeLLjpQTfRvTxUv/XRxztv/KdsBEyoTQjaieIhDIQLwaN0jLN9MJbcLEpPRJSL7DuVL3yN7YDV2aTi1lhcPS3BaM1E0E2w3AQ+tHSh7hZyu4FxalfY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB5674.jpnprd01.prod.outlook.com (2603:1096:404:8054::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 23:37:01 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 23:37:01 +0000
Message-ID: <87y1xf59eq.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 09/21] pinctrl: renesas: r8a779g0: add missing TCLKx_A/TCLK_B/TCLKx_X
In-Reply-To: <CAMuHMdWPWzhBoDeTR-ueS9Y9sBVWx_zUAM+6b168Tb8LYcGxcg@mail.gmail.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
        <87r13rkcos.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdVVPN-dhnjw1y7WqQJjZNO-YG8PjaFjmCvawMAhZJJLsA@mail.gmail.com>
        <87r138jm3r.wl-kuninori.morimoto.gx@renesas.com>
        <87k090ji9t.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdWPWzhBoDeTR-ueS9Y9sBVWx_zUAM+6b168Tb8LYcGxcg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Wed, 29 Jun 2022 23:37:01 +0000
X-ClientProxiedBy: TY2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:404:a6::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e1a6dcd-a3c1-42c2-8691-08da5a28441d
X-MS-TrafficTypeDiagnostic: TYAPR01MB5674:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 95Ro4pa5gij+AqGoN6Pt/Z9sJ2LhC5i3NQ0KRpsQqgft3tgLS5btDYye3WPdzK6+v+IutBPiulkvTT2HuawXe4p7D+6MaPQEwcAumgxbsgDgvy9i7CpzsSAtsq/I/D6FBZ+yRatMMPVEAp46cvanoM02ebgswIHS37/VuIXi4EXSpdY7chMVT22PyxslkCq5u82eHq00Y7UCDAdZCUwvIdFqEgORLD1SRNldCMcPWqXaMRPNrkGEZLm4COab3uFGqKPJ5yV7O6P+mK7SCNonLY6c5yDCE8Iglv4GT+vEOdVviMClFC5wuCvf8JGettCSNivQ1RIApo94sGVVvZQLEKNEfSPOP8/HrTkwgu5q+3+y53o9PWZrXHPnDOcDDyNHiesPnXREAbf7o4P9BD0pbIgalQDUHmWvUpcvNSbGtTjDlGQ5OPF2ggNUPh05PBx+fSXnDGo49DAWmxmnXLiKBtqtJ2VCpk+4aZ05VgT4DHKOoIiDPamh41M+AuX9kgMo3JZX6rZNAsl0I8cM2P+5G6xSK3uJVCFWhJECPY3zuLcUuEu35vK1jrX9P9xS6M1/EDfGP4IYUqYC1Bm/mrpswxdWTjtwSJ+sc0oMXZMZsusoBPMUHcR4jtEYjshX43iYDlQt6jbEcBdBaQ8sJ90mAAfkUxIoVNKOosmpFKp9d5MNRcucCFVmiwMW6JCOFTaMNHhsz/iPWAN80VSGfaT+pjx11nQraGZeF69PfvvNY26Rv/1vRjWEErZbbq1Sij8vZvUQqHtQ3DU1TJZuX3dt0GuRtdf/l10qZc079Yi46ME=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(6506007)(41300700001)(2616005)(478600001)(186003)(26005)(6512007)(52116002)(83380400001)(38100700002)(38350700002)(36756003)(2906002)(86362001)(5660300002)(316002)(54906003)(6486002)(6916009)(66946007)(8676002)(4326008)(66556008)(66476007)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0DZG2DLC+MkXHLRwkvIy98yXRTKN3803TmMlLV0CjbFAn4NpXWQJl+gzZSEz?=
 =?us-ascii?Q?qbTKmnFF1S+bdS25XpLCZvLpDhyjySyv/ZOnTYrRKVJGvMay8KHRCJV9jNyb?=
 =?us-ascii?Q?5fK0Q3kHfJCpXlMjyEvjKuoq/j/BOY9T091MvntRSwJ9gPfWIzvepmEQQiTD?=
 =?us-ascii?Q?wPhmt1inKlg7wZW8v8s7ji/DXFPvptByPL16W1BiwPRodzTKM0f1Q1lgt58N?=
 =?us-ascii?Q?fz4lu6Ggf89pqm1Ml7lU4UAbDFoCJjoMhFRtfg6kMaXupQ2ysmYS83sOJuXy?=
 =?us-ascii?Q?v3Py2yqc2+6PQxhl9Z0XwvDtY1vWSRvxJaHhyPCbtCNqPui2ofK8iHH5etQH?=
 =?us-ascii?Q?RcIqepqv9yCrd8ljwTFRbwvwcR2BgSTahbxpCi/to2ps+v59QfTbCYvPFTFa?=
 =?us-ascii?Q?aui7hHRyU4IpRzxvM0396ZwOAHAOgEQyMp9Z+cFDNNHmxwOMHE4xp8NyEZfP?=
 =?us-ascii?Q?HI5Q9jCQsYSThr7FW7TZVZhPEzqz5RL+jBIFoOwJVqRPrQKegVQrjDOh6BBs?=
 =?us-ascii?Q?IbCYlw35dC/IM+bWflbG1vLEDT3NqDJtey/9JyrXi7MZRHumRRlve1tSHWIY?=
 =?us-ascii?Q?2jpIS9/fMtVViPCLvY7Qzq8GqmDL8eW8CSAVY79hxnaoO/RPVaVMhbZswmhH?=
 =?us-ascii?Q?JHoIH9dXZwW7T8Ws0l4yhJIXEvZGMO98Uz7p5zD81EN4bqUFNbBv6frSfKj8?=
 =?us-ascii?Q?ycGKwAc/c4ltaPDzEv/onQWt7buzpYfk291wbIcEvEX0H4HUbpsm+JFXBCRY?=
 =?us-ascii?Q?oPyIP5efq1GuhyaUU/07y5S2gXW0yILEmGUH0Mlx0blTa3HQGA8PgALsMgJ7?=
 =?us-ascii?Q?4fDu1sANLihcysU+KgPKKuVXDgbPbZNh4DZvir8nxce2SJfxulMQ6H7YQ4va?=
 =?us-ascii?Q?oKItR+3rNleD7EcMy7ZBDXX4ubjI2BDQ+Li4jGNd2xFfjnM/Gdb3khFiKpJo?=
 =?us-ascii?Q?VBgCqy4E9gxQuSnqA/WjBY9DRR0sKm38g676qgmM44GttOTb3apYoRUKyuEp?=
 =?us-ascii?Q?0ECK0bNItPNO+BnZ0iI26QXUQYB/n1zffHugSRrQf6Q1upHBLrM2DwYjWLwL?=
 =?us-ascii?Q?iqzqSftqMW8+kfhzHOJhjcxSpK0Ew2KYJF+88LXJ29tDTh77sf1vOrBljlNV?=
 =?us-ascii?Q?EIHx02NIDzhM64ilA0lWIge97dyhE6oIDZPLp+FR87gPmLoH9BE1EaUuleoR?=
 =?us-ascii?Q?HAgINaHpmr0YrM6gFoheIwGFFlyVj+5Is79+GxMBvh5A1u1DRn8URUQEppcj?=
 =?us-ascii?Q?OZea49yTeHPmAfLgWGhu9Iq9of01ErZOgpe+cP2FqoKuXfMeYxGbSwm/YoRh?=
 =?us-ascii?Q?GdXZ+2SHgIpNuiBIzQj8v3IzGCarxnFuF81cMgclUqqOHZjdOZh5FLIRZX1n?=
 =?us-ascii?Q?mV/RC8L9XecwzMBLe/rUi5T19ADPvHrBoRY9Y0PhvNLsY/Zq26ajffNHgna2?=
 =?us-ascii?Q?S3LgJHp2sr2SftFyEFfKP0kNhWqY0JWX4idaAnOKDtcEprW//blFYO6PAcbu?=
 =?us-ascii?Q?Tiyf7TdObc+YLQJjTFU4EsGsJGKdfshIGVziBqjJBi3/MzGyG8zscC2gzWvv?=
 =?us-ascii?Q?HOGVr0J0pPHS4JGmpc3+HVbakyNy/ONjrIODnIR10xxNmK2SK8qpagpLmHNl?=
 =?us-ascii?Q?HMDdOze2eHAmkoi5HurDpHU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1a6dcd-a3c1-42c2-8691-08da5a28441d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 23:37:01.6667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPaXZb55UR7jPRXwMrr+b7yEaZtIqaekEOOOQeaKB5GSfMC/OuG/lTD6l8gspKSOUBzdhcV2BoBHm6DhA/UDlOlOlSunDD3OhPpB5IOl3XaaLL5OZQoQgByg4NMbglbg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5674
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Geert

Thank you for your feedback

> My worry is not about the group of pins marked _X, but about its
> siblings without _X.  E.g. your patches have SCIF1 and SCIF1_X,
> but we do not know yet if SCIF1 should be renamed, too.

Yes.

> I agree it is unlikely to become an issue with TCLK soon, but (H)SCIF1
> are more likely to become enabled, also on real products.

Yeah.

But *current* product (White Hawk) is using (H)SCIF0 which doesn't
have rename issue. I think we don't need to super care about not
used SCIF for now (?), at least it is following *current* latest datasheet.

If you can accept about it, I will post v4 patch-set soon,
and will post naming update patch when new datasheet coming.

If you can't, I will wait new datasheet, and post v4 patch-set
which is including naming update.

But one note here is that we don't know when the new datasheet will comming,
and we don't know it solves all naming issue and/or there will be no more naming issue.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
