Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DBC25510CD
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jun 2022 08:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbiFTG6f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jun 2022 02:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239044AbiFTG6a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jun 2022 02:58:30 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2123.outbound.protection.outlook.com [40.107.114.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF56DE8;
        Sun, 19 Jun 2022 23:58:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXoF7VkyiCMgqvM9k0VFGxMIBH5JILoJZNKKJkfdXiuMyzMHyY0h0FYK8+T6QONMEIaIKaJE9ArmWSEdjrw6njybyqOecVVoGzuYMXauiSDqDaA6gT10HgcXvR15QGpxl6HDh0gAfPUjdpRpUoiHAUcTe/u+Ae5wZ/Az9M/yPgKmUg0x2uyJX4r7U4N3f4fFs7Rc8iWfvuZ+oD6yFEX3aswnAT9X653ZorcaHOKF5HOHe2IIAPu/H2/EeCoOS9Xm8bPna57LIyeqQiQawG0vZo0s/wmV8HD85PlhUdxRQRo5gu0BUrl2Rb9FUKzfqbxYCY9nVwF86jLevOSxi/eRdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvWjZ12KYouRIAkY4ilCdjSu7pqOLiXoQRY/9yaWquk=;
 b=ZMt1UL6jjAhefN+oLuRLLheA1ey18Lm4Bvyn2nnhlrwnF+oO9DLajzwdIYTvHu2FcqI4n7DUEFi8UuPrhurN6gGCCJb0CSCNuX2EvCo0S1vhvednY/lYyRANNa/pfh9LaYYdHzPIp3/mthzhAB13WDwPx8Ztd9pm2EFL8lgHo0K7hW1IGcqdXe8rWvhYLABX2RbR//K7+rrAY0/JFVoJR0SGZPHb90L3ZYQyB+N5aBk2Tsr1udp43J8FB9xrw1vEDPfnr8RwHSiTWovbuok849zVjOLj6ziOdCUsG0GlUT9C+/oQx0dB5j8PI4SlAg9aKVQjEPVvhTaeqgO3nRghFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvWjZ12KYouRIAkY4ilCdjSu7pqOLiXoQRY/9yaWquk=;
 b=NYKYAwaIeqX1iJx+hqfb+GaTgy+KOAbDXTJBx2da48FTnPseDloaTsJ11Q4mr9Cu/AXpC3pJApxiGi9tfjjeUma8xH7IFPiyiWQ63M5+exOtxhgImaSFE1+k6k8rmx7uX/CP16Ww8O56Hc8+lpA27/M1fvu43v6Ejcq8M0wFQLE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6240.jpnprd01.prod.outlook.com (2603:1096:400:78::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Mon, 20 Jun
 2022 06:58:26 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%8]) with mapi id 15.20.5353.021; Mon, 20 Jun 2022
 06:58:26 +0000
Message-ID: <87v8svbz3i.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 03/21] pinctrl: renesas: Initial R8A779G0 (V4H) PFC support
In-Reply-To: <CAMuHMdVUagrtv4C5+pBQ0kdkLhNPh5Qu6htV9JOrvjdNdjykiw@mail.gmail.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
        <87zgifkcqa.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdWU31FB90yn1MTSUyF4bfSEXnpaO2-tkXNXNQs8SPwWCg@mail.gmail.com>
        <87sfo0mbl6.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdVUagrtv4C5+pBQ0kdkLhNPh5Qu6htV9JOrvjdNdjykiw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 20 Jun 2022 06:58:25 +0000
X-ClientProxiedBy: TYAPR01CA0151.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: effd6ee4-e884-41a0-1e8c-08da528a45fe
X-MS-TrafficTypeDiagnostic: TYCPR01MB6240:EE_
X-Microsoft-Antispam-PRVS: <TYCPR01MB6240177D619190C53F8C7801D4B09@TYCPR01MB6240.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: byHuREPMaJqePs02M9aqzd/e3MLdDt220d6TJBUf70Cq+SJKgF0V07g7JdT60iyC4ROJd2F0TZpwQDHAHC6bZFP4v0Sv87w/bARJqmRZxbd54XuigEytN148xSVXcdpfhgkaYtoTUDAZZefeqyF7AWgg8T/S/PIzr0rNNqOJr/8LaA6xOJh0djcfZLsO6rYuvLBkNJ8jXxt0VXYAU66RkpxZBgl/UegwSci+C9uAH1Q8wgUtzMhmHH6lXgd8lF7eYzeaY8T/iAJbqa2H7vHCqrkyY9Xh7R7Y0M/mFDBAvgfiY3nPC4RCwKB+R+eokWNi5zBZ2OYExkXos0l8D/JblHuhjwOQT6bZ0s8zUjQFNhDoWMK1frtQojGyiwsAm9QMhLj6I0ROrCMfOl2cwU/7RcmkHOIJP2gIK6K5j2j+2OwFEKbO6PcpIhqZDuEPkLlgsrUzxVMRZZFn18zHJyVE/PvCmC33Jj0xlb2Pu3gmhO1+DuauD123Q2+TYCtX2bFGR4l7cSWrSBveit/9KyV2Mcia6mxg1aHOGdYKnGd8aUM61+KqhFfkS1MPJcwZH3Ft03quB/lkSeOF38MnZDz25nlMJY6pQK8Zqzsa+TN8ZZMhQCmLLhBWOmqo4sEHLQoyRxdQ/SkS4RX2PLHWrlXNJNPUd5Htu8Nd1vC/rpgLy/2Of3/l4MJWeba1tCr9AZU9See3gBX66MDoKa5uDlFsGsT1a76vNs3wD+806QU1qj5YENT6XyKw3dhoF84YeLHRtMM6k8lmbSG/cWrLvubwSk7Rgd2yRnMwgDtaMte4Is4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(186003)(2616005)(38350700002)(36756003)(38100700002)(52116002)(4744005)(26005)(6512007)(316002)(966005)(6506007)(66556008)(54906003)(66946007)(4326008)(8676002)(6486002)(86362001)(66476007)(5660300002)(498600001)(8936002)(2906002)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KOLFPF8Z95w/VSJOZ8WpJw2P715UTK77UkvM0CfZszAF/1b3b0lDcEKTWlfv?=
 =?us-ascii?Q?uCFpGQr+Z+1lR+Wf+XW1DMWqoYXaDMFy6W3B9C6Kl8oFK1AhARHQQ0Q2hqfO?=
 =?us-ascii?Q?c/d6F/BvT0qXTjtCt6pIlH88r8nbi6MOBGgVDio6O7Q2eUcV8Qs/gGLG4H+v?=
 =?us-ascii?Q?SbwXXs2Anfd236U/YE9j6uJLG+xt3q4XZ3keNEjON4GPruvCxOCrOSKdvoEU?=
 =?us-ascii?Q?+qFAzHvuYNZeGBKcl8Pnp8I2+6NSefO7JsFllh/Nk0SPC5CJEYFhWw/v695A?=
 =?us-ascii?Q?N7ln+qSPgkzEov06Q1dQIzumeArI7SNXTOCgh4JAzj0+s1H1uqfQMBhi4bdy?=
 =?us-ascii?Q?vwhkvtf0W4uZM9Y/HBdCuMJyOfLf5UEMa8iInPT7Xi9+szUbXZW4dD2BADVh?=
 =?us-ascii?Q?ChqdOpOTWhno1Iwu61PsM/eqiC4ha19dIBHYkc4RZEwnyGBc+Mu9nTserKmJ?=
 =?us-ascii?Q?DhGgvnR6lc0eu37Gd0/gf5Xwd9IcI/ybfqxmIQgY7Yi+E78oQAdvi43ZLP5/?=
 =?us-ascii?Q?92B+An30U3Iyou9nw+1qwsBulVq9f1RkFfpOwggIGimJ4b3JZm8OAqM0Pzo8?=
 =?us-ascii?Q?DNhg9krExfcRGMFR3Bly9gwFKW290ahEIoQThraQuAl5jslEGp5KwNuRcRfG?=
 =?us-ascii?Q?yOJL0+4YSpBbZzLp5LgjglgcBR6HQ6EX/pvop9lT3PJ+sshsJdW642vB9crq?=
 =?us-ascii?Q?jIFivyqMxdgwWfw1g/xPqCLE06XaGDbo0EWqaPNqxYXHCire3mpNqaphS8/a?=
 =?us-ascii?Q?zvGNJriq4gu6+XHkz/P6jeh48vy+RmDtkvikzigY5o5+C1SYB+CwWHkMrjOb?=
 =?us-ascii?Q?vuZtWVrBFJaMseSyciR+qBY5MuG3vExM309Ig9eCPTYedjCY67OXRnLyrc9T?=
 =?us-ascii?Q?tsJSwoo+jDsifmKEKUBK6eiWyiCjqNiT98yE1MTAEpBChp/9XQNFgsAYROl+?=
 =?us-ascii?Q?8u1rQxZaU/GrjXn1pDKAUr4Ua42tbyYWJ/5ua1RUBa3oz7nYn4E44pOvUBoK?=
 =?us-ascii?Q?kvy7jyDC1BsemtAzGGJKyKFJ9k/rwRGlO9WvW+/geeWOxodSenRTa2otAP/W?=
 =?us-ascii?Q?XM1TdXqKr1F1znjBhJRuvaMZq/0/dyw8OQ2y0Sylm2UokOWn21QMkh/SIrYF?=
 =?us-ascii?Q?h/v604zKVVJ8C8pmV2fje3GN6nqeSJF3M7SdFRPVCdAeeWcVG3T/q98g5vTg?=
 =?us-ascii?Q?pgqglBli5fiZ7jFWrqc/M62nCODUr5Oqy8sm+cpGY70yD4/GwcTaduXwF/AS?=
 =?us-ascii?Q?JoeCOnfD2o15/U2iEgSKPlYJNN02DWTeFKZofe+WmfkLu9Yyb3xouBtrp7bg?=
 =?us-ascii?Q?U1OslOAsZcsT+W7vgV+X+c/IBAl9DI28oF5vcdnyFMr45r3x/rMHEbju95+R?=
 =?us-ascii?Q?lQGkHDAKqGbzJAI2Fmt4akNWEZGrAec29ttUzhZrvrb9ChFCED9t69CJxuiM?=
 =?us-ascii?Q?ePydjpiS19jcK0LzCmi9Gkon7wnocNK39OgOpzy9Ej1UHbuvx8YjzBmGH9go?=
 =?us-ascii?Q?tmd2K9Nlb3FQvohvpEdwcMl9HimljSAJEICjBQUzafI3j8JBFvIPEfW1p1l3?=
 =?us-ascii?Q?KPzMzGzB8Bau7DpSUT1Ytu14MWTutcWoma2G2u7YilUuvAiln8WQjUEGF+WW?=
 =?us-ascii?Q?yB8GiWaVqdOqYdNe/V00QDkQWathYEAGGZiBBFYAzmax21SiVGbClIMoSL0w?=
 =?us-ascii?Q?uDlVT6kp2X85p2jbg/rAHVi2gilT9OhGHperYS9KhHeLW1CiU9GcrghHASWt?=
 =?us-ascii?Q?Rm+XkRKvXsY39utF6gV+0pwx6SDpCFGpEAvuaiBul4fW3iVm7qMf?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: effd6ee4-e884-41a0-1e8c-08da528a45fe
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 06:58:26.1155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJD9tZGhCZk6EK+9cUBTvgj/JaUOq0eKeHyFBZ5xTA9B2thWFsV8Jh6kGNivYv2ehTuL170hm2U14lF7kee1cHh6kWK6DzwUt3wQF4QQu/2cFpuqnLdvrSgMhvu/vdqv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6240
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

> > > These are definitely still wrong, and not fixed by any of your
> > > subsequent patches: to enable I2C0 functionality, the corresponding
> > > SEL_{SCL,SDA}0 bit should be set to 1, not 0.
> > > Same for I2C[1-5] below.
> >
> > There was such patch, and this patch series merged it.
> 
> I don't see such a patch in this series?
>
> > Now I'm asking why the patch was needed.
> 
> Sorry, I don't understand.

Sorry for un-clear explaination.

[03/21] and [04/21] merged some/many BSP original patches into one.
[03/21] is including I2C fixup patch from Kihara-san
which fixup the SEL_{SCL,SDA} value from 1 to 0,
but this fixup seems strange, and you are now pointing it.
I'm not sure why this patch was needed, now, I'm asking.

https://github.com/renesas-rcar/linux-bsp/commit/2155127dacd61a4bb2f6f316f716a9338799a786

Thank you for your help !!

Best regards
---
Kuninori Morimoto
