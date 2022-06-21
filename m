Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A70055287F
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jun 2022 02:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241583AbiFUAMc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jun 2022 20:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbiFUAM3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jun 2022 20:12:29 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2112.outbound.protection.outlook.com [40.107.114.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA4C0643F;
        Mon, 20 Jun 2022 17:12:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMVv1Gj3uJEMjmaqZlFe9yL59ofkgeKi0SukBOMbbZlVBK4jOUPBEp369mr9W32cCo8tvwYO52A14DY3wTk5JoIhOO/Lsq18XtL7nFXt/3B1ma+EIETmM0VNWp/PnekKZMxl6HgXZ+JwF3FpEyiILrayaXpl/pTFv7bpNpw3tXFBnppMlhz//jQWLDU9KRnWUqSQu7X8DD+YkLOS3cAA6h5vBA3l2I6b/b1ftoBBoUXDcEzNK8JMP/QCo2sPvj5Bm+OFkZQBRbpfxjsYk/exfVahsmkfd3waS8/OAIlCSXD6JlB4yXvLMqeJeCY9Dd7ellypb2nkQlHKGLcmKBh8yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D28RkzHka7BxYQhkWNo6LqvVDOsMJE9swY/GdTw7cvc=;
 b=HCY5Mpr7aaOc4c5LUdIf21LebQqzM04tuueuZivKlqnvLOg2+4Q/wuB893Z2wFrZESovbkpUrVYEAqF15anexTrOn3aZBQQLIlvZSTR/Gc4eQZjImwvB4cCRXLrkMloIK6ud7sdkQWu6z8CABSGpbyVV3ljm30wE5JTzziToaM++K6cvWhTEQl0iLOdqgEg0D0QaNYZkFSCFPDHrk8eWxtskJwiv3EqbYTXUlh307EKKj0E1L9N8+T/aCrTdJloooEFWqv3wEybttITRjRXuLwJOoO05rkImpbZcXyiK8z85hLeVhEzU5yc/Vmh4st55tk+iXa9dRgGVmyXLKVvJog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D28RkzHka7BxYQhkWNo6LqvVDOsMJE9swY/GdTw7cvc=;
 b=ClzOIh1X/4Lj2EWlf6IGz1oNCX68rG6ZvoJfpquHmyeXNTGIgqE6z2IrBUcz/i1prPCtTsUIuBjkh+WZ1ZroTqq+pQFjeEW5iJ+V0QO1vcO9YRGUPBPJTFN0zyhxtV0t45TDTwzesir1Z0yyrDSgcyxrSFtiBH3L06SVB1Rep54=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10107.jpnprd01.prod.outlook.com (2603:1096:604:1e1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Tue, 21 Jun
 2022 00:12:25 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%8]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 00:12:25 +0000
Message-ID: <87czf2ub6f.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 07/21] pinctrl: renesas: r8a779g0: remove not used MOD_SELx definitions
In-Reply-To: <CAMuHMdVV6z-nCTvJyG_TV3Dj65QU8K=x85JAKDStQVnP3edO3w@mail.gmail.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
        <87tu8nkcp7.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdVV6z-nCTvJyG_TV3Dj65QU8K=x85JAKDStQVnP3edO3w@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 21 Jun 2022 00:12:24 +0000
X-ClientProxiedBy: TYCPR01CA0001.jpnprd01.prod.outlook.com (2603:1096:405::13)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e444f804-69ef-46fd-c884-08da531ab814
X-MS-TrafficTypeDiagnostic: OS3PR01MB10107:EE_
X-Microsoft-Antispam-PRVS: <OS3PR01MB10107EC21AFC2CFC85912A352D4B39@OS3PR01MB10107.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: brrP73JmOHQ+xYTuWMO7Dz+F9Eo5rjFfaS9xKOEiHjwsUqbtDsZCeS8mNTp7yuSzp3EMNPMtCrgEEYb40hAPUboR40UlMD1gJLdL2DzLnuVMm3Nz8uZajlZQihxGnuqLVqva+LORPrMelHaa5FdOSytjrFuED+cvXg27yr7eY/f1SOYFIiSjObHZ4nK/H4xw5qgAKupS03r2GSZDdkSYhAc9mn1w/vEWXCrQJrxDalVH5EHZwwQVJizId7hZUOXPzgZBkyH8kKIsKONLphiQViOXSoXCnARv1yIpNu7wElrsDETKcfWk3HS+Jnd3vRT4GNmLYPZHTu+mkEqTqj7wbIZ0ythCRBk/WXd2E56WwOJw8/C3kKAHMDX2NMMuBtpgec2i3hhzo4d+bXSA4zbHNSLhiyH+nOskweYoHPXjamkJBd9qekgCKc7iulpVj0bu3vwv87LB4dxWvsOttn+BONzElEe12NTOALYph3OoUvPYknNzIY8ZcnTaDCuK4/mi97e6AY5PTYsYH3rjskeaI8TF3ZrUdl+zgLOcDTI2Nmx8DC0BfUbbz7CJF6dBLCiuJ9xamTW8GUdWbn3FC8cyEFgwQLZhgIJ9f/on7BKvXbi+fYjxvTwbzoX/rxYo8rGT3qCs4u0pSQKnh2P9r5VHTWnHJ9Z9fmEPSCZ2C7uo0a47FqwFL0EvMmAIK0hzuqgy4JKWppxB/oZpY6TLXG1Whg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(478600001)(66476007)(4326008)(86362001)(4744005)(54906003)(83380400001)(8676002)(66556008)(6486002)(186003)(66946007)(6916009)(38100700002)(6512007)(26005)(6506007)(2616005)(52116002)(38350700002)(5660300002)(36756003)(316002)(41300700001)(2906002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nJp6yLLHYTAZJRZguHQPKTjUJZ9FkMgfuBhnLOfL3koiVtaOXsWq+pYFTEGD?=
 =?us-ascii?Q?oN4V2UD0rEZQRg8oxovLCOCwOZKHbfmXQAKVFllABQs7wdbsI4QWIzRJGorF?=
 =?us-ascii?Q?vuhBwYyRq45H7IOuV1KAYKnSGb9dUp9aiStSN9GxaNHX32SWhW6RBq7sTgE3?=
 =?us-ascii?Q?hcW1b4hC6sWzjYy8iQImCZAic0Vdy9QeTStMDxg6SlfkE3Jq2mA4ebB7c6WI?=
 =?us-ascii?Q?fkzd2SaDKWrHNW0vySWQJRaKMghwHQ9q/yL1n4DbS4wzvVLA7hsSmgA379Qb?=
 =?us-ascii?Q?ByRF+seWGUug4PkWtaQVqDglvjh1fCWADBxV5ng4C3AJK1nDSi6t+jhndd/w?=
 =?us-ascii?Q?mkQU4AdNJ10G4BLn4Bhji6O22TYHaeHGCQujrAzKaTaWPMEsO/oDarFvGhez?=
 =?us-ascii?Q?z73hBvOqawKGPNclvSAcOeQyP5x7MaIwXm0emoF5VBaoMxP0wD8lo6W98Rcz?=
 =?us-ascii?Q?iG7OkwKeZM19e286YsU+tKPmfgCH3yM+Fg9R21VqXbDnS+rLM+O8q0p/KBYp?=
 =?us-ascii?Q?FEpD0uVSqh/xs2KlgOXlYTJFNxu8eEqHeojhAM1IGhNCqB4ScFhtribw9Ywu?=
 =?us-ascii?Q?42qVJGonjbbqNzRjwvzscsnkAGqAAZe2yt8u43r2g25s7iARUPrAmQBbGIP8?=
 =?us-ascii?Q?kGHpd59yRy2GnLvTaFLle614dRKS9kmdbqiruq/vga6NS+JQbwIc4rjno1z8?=
 =?us-ascii?Q?Nhx6uJBYVAWUzmrkBUwOFTcKGrMfX9apwyw1go2ePztkJVjPA/lFnfYIDlX7?=
 =?us-ascii?Q?1yU+WYahn6qxqwfs+jdbbPC5f8vyJ99JWZhyn0AHHsZ6FuKzTa4j3KajE5z0?=
 =?us-ascii?Q?3M6WUQUWaUFECpZWgJtcRUIQjnAMKn3pW+iXtTWFjLfyBdtjhZ19wNjp1xhu?=
 =?us-ascii?Q?kJiHdOZAJXD7ZX5raf4efX7aJy9b3Nlx9dVK2cTcHTtaUbgAapIQ0pQNqDz2?=
 =?us-ascii?Q?ap9Yynrsqa0bkM9MEvkTgbSTM46K42Lqq+sKRJgdgPqLGd1m7edwV/3d8wl+?=
 =?us-ascii?Q?s39zvOREi3LwltmfBqR9qIrGhUu+j6IlVVxAzX7XkTGL3y1sURcLiuqigi/T?=
 =?us-ascii?Q?NhYx3C8fCRRye3voqsf2E46eZc7IE7auNBC4ZyrjAo3yo67fWmsCcZkEe7oX?=
 =?us-ascii?Q?6dbVJxtRc64nGRonP1C4gB9R3lXL0Pd3za/iKkg6Zt9NzgAIYXmSnQ+F74Is?=
 =?us-ascii?Q?+R6K338qaU0sSNNzu738S+SWcLEkSwVniG5XP+5VG9vFt4mj0BSNH/AiIsDw?=
 =?us-ascii?Q?c5aMTJSLB+ddfTePoixtYKCgWQEhtA0fIqQiuNTlQbuMyhqiv5Ldmi/elJgB?=
 =?us-ascii?Q?4q9l/ovnGAtJ3xi2n7xK73SP42faIMb/HIqfbWaMNVnSxULAEmeDK03Bs7S6?=
 =?us-ascii?Q?XlKptOpMSu0zNqeLlwQTTq6DkvQ5xKHViOVffMVR0bX7TvG/Z8UOYzlXexjD?=
 =?us-ascii?Q?btDWqlY5ng8X5vuHOGHu3Gl4n4FpoHIbtQnklInscsxCuIdpN3AFo6r8lBVG?=
 =?us-ascii?Q?gHhY8TKXcCiUs3CItGaNQ0qtJCuQDI+6f6FAbD1QbbFAWOpwDADC81E1oZwM?=
 =?us-ascii?Q?YpFBAPRhMfE7oZhKqxh2liCwxNrwfEfgqRj5KQb/KuujXBmCaRoO1OVEWLQw?=
 =?us-ascii?Q?zmO/5wHd4Eywkjas6QSzpuVePwI6K8kuzS+QeVfOv+ztc5APo5eD2hzOWaDI?=
 =?us-ascii?Q?58q/1Q2H9E1PpzBt+TDg/4AWd3DgmBx2a7jyU7xcTaOTRZxvFJMLao+tEipn?=
 =?us-ascii?Q?JeanN2sVOWCZUB4WvGWMYyhPzKMMx/tIU6rGDwK+ywV9ljxDGjNT?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e444f804-69ef-46fd-c884-08da531ab814
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 00:12:25.3814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TV0RtpWHGN2Z7uVdR83ts5/h/ldJgNqgzSb084nYClFhs/sr/2m8mmZevDLdAhYShVplHQcbahW2IQxYqHZ/PKrRDBGNa8tOG+oB0u4E00iFc1zSLcN81Ccttdo1vqV2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10107
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

> > Current V4H PFC code has many MOD_SELx definitions with all 0.
> > But these have no meaning. This patch removes these, but keep
> > its definition to avoid unreadable PINMUX_MOD_SELS.
> 
> You can just replace them with blanks, keeping the structure of the
> PINMUX_MOD_SELS table alive.

Sorry, but I don't understand this. Maybe "blanks" and "alive".

Do you mean
1) "remove unnecessary MOD_SELx, and update PINMUX_MOD_SELS table"
   (= need update on v4)

or

2) "use NULL #define, and keep PINMUX_MOD_SELS" (= no update on v4)


Thank you for your help !!

Best regards
---
Kuninori Morimoto
