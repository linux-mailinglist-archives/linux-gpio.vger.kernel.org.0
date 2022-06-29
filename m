Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6FD755F37D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 04:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbiF2Cti (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 22:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiF2Cth (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 22:49:37 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2101.outbound.protection.outlook.com [40.107.113.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADCE521E3A;
        Tue, 28 Jun 2022 19:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chGO1w1FVrYdkRT4/8WhKdYdkuLwFag41mj9iqANX7uHzq0lqntRTHmrP7vn33xcUCAZYBARMTbpHV8xzPfDqlMyq06iVJLG3CebUdEyQ6lrs2hr10YpY7fxjdqQ2EGKurrCK12ssriDg3jmVXruGZuBQSApeWvUQbO0IeDHR9uX9SvsL4V8KB7D8ykYS8oNqgFVgyE36jhSaMNY5G5NRsEkRBgLL6G+inJrHvBdcWpJJX9dUc3JH13eXC1x3YtyyxctNqcyGcWWj1LwIEq2ktzQ+9C9gNG2enKjqnTKhhk9+FJc97fzAlSngRBNzUnrG7ftve3G9WX2LYZAttW5/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bnE1orRfzHLeKQnPJPigQ2D9UXQbXoxs8VZ4JOz7/8=;
 b=OZEuamPJfmb6F4Dtqfd07K8g57ufg/9KrmzztKaUPfWujtNXEWMToAzGWY2qwXbjfgv42swp0bmwQqjG37or3GlPdluNbLJmoebAbmA+xe+m1jmUaDgLmJXz+uavkM1HSm9vz1nA6h+OU/UkDG7ZeFQAmDAdI9oHijmZxNrE2V6baqqbdzlxs/uCUNPcQbEaCIsIseGS9EleNlHXSErGvNzu8zL7C7xicZUZdIBSqEWV+hjI22sscCcpPp7tdN4LrRdmenRjpyixhsH/Xjs5xlfoYANv1afwnWcwFU5ib5gm3Zh4Oce4foU8pBYfaFrkM66cSjA3keq0bQ6OOI1ckA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bnE1orRfzHLeKQnPJPigQ2D9UXQbXoxs8VZ4JOz7/8=;
 b=jYmnvoTYZGjUKc5gDlhFlVwourciEezqXJP/5tTOaDLY1aH+hmOly8aq67hUgGumc4isaa5w4oY0LhAzpJjkVyS9YLjQSNhGtYSsIZEfIL2K3gHEQ7hW0xuX9Gppj+zc+6B5aKFZvbtAhB/wuf2THg4D2SxV3bL5+/MhU3oMaPY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5878.jpnprd01.prod.outlook.com (2603:1096:604:c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 02:49:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 02:49:34 +0000
Message-ID: <87k090ji9t.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 09/21] pinctrl: renesas: r8a779g0: add missing TCLKx_A/TCLK_B/TCLKx_X
In-Reply-To: <87r138jm3r.wl-kuninori.morimoto.gx@renesas.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
        <87r13rkcos.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdVVPN-dhnjw1y7WqQJjZNO-YG8PjaFjmCvawMAhZJJLsA@mail.gmail.com>
        <87r138jm3r.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Wed, 29 Jun 2022 02:49:34 +0000
X-ClientProxiedBy: TY2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:404:a6::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6000fe74-4c67-4785-e557-08da5979ffd2
X-MS-TrafficTypeDiagnostic: OS3PR01MB5878:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3FUEqsoi/qTkkDqN+51EPDX0dzlafpwDaWhWSHxgj4BlCtjO1ylAjohKEKBiR+z5gmnXzlZAeBb0kRqwdA2bvNn8YZ81SdclqsrcanqYO58NtqEk/WRJCZVt2X9pTfo2+sULcjvKTPQpN0NdEpvkbcfl2U2yazo6KB1JRNJfbuzF5gO6o1L1MKnnpJ3S78h64Fp+QjeRViEKjJvIVw2qZ4SzTYLRoQAFYAeQfNCHDkSZLMICPaxyk6UCeIJvk+IYgPvZWmjGIftdRgpVj20Ct+M/OTGuezCKboyOaEEWMWdYPMEsGpEXWhsHMIEzVS+1nBq+42h0VhgH/QrPZKyr10+SeYxVGfekfv9/KbCuSF1UV0TSHWA+hn4GR6oqHuqUUMS+WdzowdOOla5qS3c0pelPwZlDwZkqqN7hE+xLaS41W+PW+RRdpu65GSzuubS5SQW0hhpVQePuuXGcV8XbwmixZ7IP0Ch3D6L2dgupEgrbkIh78OwMCx2OliFGNBzOZ+ZyjZGYTezohLBxUeSqCdxHX8cPZZ/tXh/ja4yWIL36IkTcrHyKlYxuSDNnwNSo2/S2KS1kX4mTn4DDqSKR3741c/lPUjEfAMH/tcue/RY6V66YJtcbesIQntXrAjv7seFgSSRayDOGQmCbEuzfeNUPdWPK2xPFUzN7IarsdMGvgq534kZDbYmxRNkMkMOp4b+TKTCE4uvsfudz/fwz6Pf3PGvNfDZyAuyvoORoy8fqr3D7s4E57clkWq7VSBQw6KM0JuWtlwkG8lCh+n7FmY1xAPyVpq0FRrBTuAQH7/I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(478600001)(8936002)(5660300002)(4744005)(83380400001)(36756003)(66476007)(8676002)(2906002)(66946007)(6486002)(6916009)(66556008)(186003)(4326008)(2616005)(54906003)(86362001)(26005)(52116002)(38350700002)(316002)(38100700002)(6512007)(41300700001)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kDqMCt1+jAAhQdgMjeWPS3n/aU0Uc7F3lN/B5Uz3yr1Ku106CKd+I8TT1TOu?=
 =?us-ascii?Q?kLVRz8OTWSTg7wHRMsQVePmfbjodlXT9N2TMwMsbBtl5BauZVS1hE/VrFOuq?=
 =?us-ascii?Q?sv1R0Ay3OEqG/PhnGk/B7aUl8IarD/CIkw7W0TSbK2PKf4xNlYIGA1TVM0WT?=
 =?us-ascii?Q?hU6L4nIkSM1s7A+JBiuklCiVnbUdLG4I85BBoKh2bZZyfzPzAl9jBpj1aI8J?=
 =?us-ascii?Q?dGCOaab6v0dfnzi4ADT2tiQR2AE8+8ARo8Z5uVXsgt4ZwgGtqgy45wOxE93R?=
 =?us-ascii?Q?TM5XpYHfcnTPhqo7HbwyeZTkBuwqyJD+GJcNVRgWXVKDir9xPqX32CHC4G3W?=
 =?us-ascii?Q?Z9Av0Y0tfFU5t/x7dS8O7kT6n3rMBbILlP+aoUeYWLLopbaMHnHZX2G8ATvq?=
 =?us-ascii?Q?Z+A81J5qaH+33z9S3nM2imHIfQg/5/ydPJlyz4Uuu9pHaaZcLhyidyluRcnT?=
 =?us-ascii?Q?TJP1QtKV7dy/awjxUKskDVFSlkV0ood+mBvIj4op9fbIwqFZAXEYf/zKB0GZ?=
 =?us-ascii?Q?NsqQCDGUfcoWOl5PPdF9JlJrTjKEO3M8PM1ddzycS/ai/nCR8NpcMnEqkZCh?=
 =?us-ascii?Q?2QRFVN6VZeJF2zbdDQsGX13EFb2QxwJ7VaglqI5u769H7wbTZrx/cVk9h2Gc?=
 =?us-ascii?Q?qDJIJdEiaR2hEU4CJ1xYxp7AXfMB8jVxVVtVF7ho3tgsAa+H42EAw58e4spl?=
 =?us-ascii?Q?xqvlQqjR7z12rOoYuyKtCsgA1qrviQeW4dKgdCarBKwZELn194jk2NGOuEPz?=
 =?us-ascii?Q?mifp+XsAQHEO3pMgMg73Xn/XTlmNl/67Z4BEnS26wl4gaOUTjUM4/pZTqhCA?=
 =?us-ascii?Q?WpiARHiYitqHvh5l+12trmiXhR2dI1eN+d9ce14PP8yonxIOtLh+LzhpcDVM?=
 =?us-ascii?Q?nF6jNmE2yshl6fbKgu61P56oomgeil+V1IAEfrlQ/57kt0zC9QrdLFvVd3pN?=
 =?us-ascii?Q?XxILtAuprM0otVQ3so+EAloV/bdEs1ryswniYgSSkTasz8jB1/GFgv/Op7+U?=
 =?us-ascii?Q?nW5KvtQ5Rm9Nm3ESDU3keVMokeP5Xu02CVrkzTsRetAPL53puBr7d0BQ9j5N?=
 =?us-ascii?Q?KdmfiXKnCOW/ntbG0uuzYFW02CVe8jHV09pEya9WPJTgpE0dKMivu/RiKs/r?=
 =?us-ascii?Q?p/NbKkI8u4+B7METQle6Zc90fAaf88bSrjeMUKTw4HCR6im+i/KrKVwR5kVR?=
 =?us-ascii?Q?DKcskid6W3WlOPCFW/zO/Em9OIg6yplOuU4drkm/G/q34SQTF/hkiej3aVyW?=
 =?us-ascii?Q?+JrctvtlF2ibzVsz52Ucld5uVD5VOumtEX9NTwh73luWdilD3I6zo7+kwONY?=
 =?us-ascii?Q?f12RMfCo840f88qeiPRijFjQtxH0cFBCoPBn+nhINKguK3T/9n+Qh/KFJ5LL?=
 =?us-ascii?Q?OdBO8Gci+MYoN234z9wKx1fWQXaSLb1ehyTZZur91GtMKKPNAwMwMATGObVM?=
 =?us-ascii?Q?SL+YVCHHTb+1pEA2CuAs/7sD1k3p90l1P7BGTNXDg9cNV3l5fDH+tX32TFb0?=
 =?us-ascii?Q?rmj+g63qfmI79s41Bge0zfen0qlhw168KGwJDd1ZGrDsdxWuWK5jqvcBbrM6?=
 =?us-ascii?Q?ApK11a4BMk0FO3IY4/YoupQ9vIFKCxlMKzBXF2EqF7xhAnKxymnw/8LYNtQJ?=
 =?us-ascii?Q?f/sgkbJN1tdSN0ZNgz9oo5I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6000fe74-4c67-4785-e557-08da5979ffd2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 02:49:34.5366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYsFrjOlVyJatdX3Pmv32ajYyw9uHLsisFDhQgG35gxfzRbdt3ORyQKvhtVGavIeE1jVbd1wEgwOnvj7hI/E4j+RFvJfcByiA2sxKT/WRmQkxwJfxOCL6NCkw12ziBDB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5878
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

> > LGTM, but as the suffixes become part of the DT ABI when defining
> > pin groups, we should get the conflicts resolved, and this cannot
> > be applied as-is.
> 
> It seems HW team / Doc team are now fixuping suffixes.
> I think I need to use new Doc for v4.

We don't know when new Doc comming,
and I don't think there is someone who will get DT naming exchange issue for now
(Because no uses).

So, I'm happy if you can accept my next v4 patch-set (suffix is still using _X).
and I'm happy to post new incremental patch which is for
"update PFC to adjust to latest Datasheet" in such case.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
