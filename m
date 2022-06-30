Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9515E562725
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 01:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbiF3Xfe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 19:35:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiF3Xfd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 19:35:33 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2110.outbound.protection.outlook.com [40.107.114.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8041E59243;
        Thu, 30 Jun 2022 16:35:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFQzb+7jtvgCqpGN8Jcf8dewghrWnXhLEUK9wQx9bOenwvBpStCiMVIhxL6QrzwHlU9xCsYImMu2sxaothRo6LFd14MhgmiEVafnvIayNueUDb8pJHS/9gGNkQ+Y3tgjCfQ9ZZ6l8JQL8NF4xxx3l3jagMYd/OC+DxVFwSve+3bc6ATb5eaYnptpbDvttc+irKsOtKaDYvT7rlRuQ6r1r6GHZDwKmFte0bmCN9s0k39NTZ7rhf9eT7yCisrmSF594yTcnobEvKq7GOoBszR4VTwYGh0P5vzn8ndbw0fbMS6KQ3AaRZBT7WS9QgkBbBW+yYJWlcIVR9ZO67y+ZNF8Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1iOmPem4El7Oh3IyiNnb3C2znR3Y+8cBKm/h7zrlhc=;
 b=BEXU/gLRVRulLxINas23+WnT68O4chBF1XsYWi5vUfYQ5CvpjMts+dFc9K/gvWxJBftUQ7Hdk327zGwmPzsVn3qFQKV5A2hh0AQIHilNK07s8FdvXRjearJ/9G6/Aqp0GgT9DUBTIq+PwWs91xZXMG8/VWJ37JfA2NWepMCLePp2SW9eg1LKLEnlz9GAMKuTYJIUFd00aCzyt2E/2JprzGNEMT/FCF1qBFYME8Qr7HNiD8bpd4ruQwv3jVl5gqKeQ7ylyZUTuSJcahl9SfV44GwIT6gJ6ZgP43/IilPv+E5HVsnoCclmTrokJ1FJUFlntFf7uoB2dT9z5O99QVqWWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1iOmPem4El7Oh3IyiNnb3C2znR3Y+8cBKm/h7zrlhc=;
 b=lkuH323FzF9dglVHjB6AOjUWZv6QhsKc5ObaE+ZW+TYl+tt0Tj9JevhZGdyTiJ/lOpDzuZRuuhemhw7uJBRt7KUoEavTsEyappp0+uAaPgWp8X579hdqdyWGB0z/7/WJeIapie7QYzDrjgejkhG9/fPZwb7DSfY+8D4q0+prp+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSAPR01MB2691.jpnprd01.prod.outlook.com (2603:1096:604:5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 23:35:24 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Thu, 30 Jun 2022
 23:35:23 +0000
Message-ID: <87mtdtu3lw.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 09/21] pinctrl: renesas: r8a779g0: add missing TCLKx_A/TCLK_B/TCLKx_X
In-Reply-To: <CAMuHMdW0WwW=dxVKhDAc55Erra2qYwoVgmw5hvY4rjt+468e7w@mail.gmail.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
        <87r13rkcos.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdVVPN-dhnjw1y7WqQJjZNO-YG8PjaFjmCvawMAhZJJLsA@mail.gmail.com>
        <87r138jm3r.wl-kuninori.morimoto.gx@renesas.com>
        <87k090ji9t.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdWPWzhBoDeTR-ueS9Y9sBVWx_zUAM+6b168Tb8LYcGxcg@mail.gmail.com>
        <87y1xf59eq.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdW0WwW=dxVKhDAc55Erra2qYwoVgmw5hvY4rjt+468e7w@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 30 Jun 2022 23:35:23 +0000
X-ClientProxiedBy: TYAPR01CA0013.jpnprd01.prod.outlook.com (2603:1096:404::25)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93fddf00-fe8d-470b-6c69-08da5af1344e
X-MS-TrafficTypeDiagnostic: OSAPR01MB2691:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aRVHRfB8dQoynjq6LjQN4rZODk7jkw0Qy1dwFknW5+e3QUyf5SdecpL5Lxwdw0UZGojm5pegSwcU2Fdmd08gDI3k6y/kgSjSxaA76hZlQtvZGkr+Vz9MZhYbWAujDQ1yrErccaPaaH4UsOnTvD0st7S7t7u+JXHSagWAkH1/vjJCYYu0n+Pwac12LEbrMOWLIY53xetBwWa4XbYpygop6SVQ6CNeNF128c79d/IeMrothcpn7mMQuvNG5XZUzLTLlb2DTUIswsvD8P+oH0duFh6umfoAz/AtJkZoibQ98ozW3SOUSKcYMjv5Yyq1dnbV4+jTOxxWD4WhIdsvpN6fyxH/QwLPwzhtJ6wEzWivsr3NosFu256ZAiqm2R7RqRgv0VipAdV5tIQ7NAYM3bcuKTFWMXQTFCu9lddv0lzz+OS1lEArn0NXsQAEZ4Dsu47DOipm5rwZy5cyT3N3XvMx8niADMntCV4cS28EDOaudGobobIkJf0AmvcA6xJijFsLCaq5pA2O0b/K8JoCs5xp9CAfgbx03VnroTrVZPI5iUYelUBZF+pNgzrfgFzk7260s1VSgwTX8K+S9vUz89A6JOAQ0MSvGyejF5EPvqqbyyxwiFNJzyTA18BLpagNtziO9X/0jzpee6SnOp3ZyBtEsHI1xqvt++W1Jnh9chgB+3O5L6mqlgDySeYDM5uQdT2RG2DpP+1vbaah5ygs08IcIe4S3nlCWpWOdhkQFs4U10pvkHL+HduCZSEtVIYFF2wpEaF43pGSPXASQgWuL8egeuR0w0KRgN5zsAwYERaErfo7/dggp1sRnYell0I8DhAm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(478600001)(41300700001)(38350700002)(38100700002)(2906002)(2616005)(6506007)(558084003)(6512007)(26005)(36756003)(52116002)(5660300002)(86362001)(8936002)(54906003)(6916009)(6486002)(316002)(4326008)(186003)(8676002)(66476007)(66946007)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G/lzx9RwTNc9F8TyCDLA7P0gsdgmZ3hIuSO98Vc8dS2CB/0/4trehSo4zklf?=
 =?us-ascii?Q?KF+EXiALapTe5pjJOrW66s3WPtpb2orYSMWBwn/yAZWEwbEyjCSMiOtQ5y/V?=
 =?us-ascii?Q?Yib1nfpmYc/h38Dk00KEb81NCF8WYpNdhYErlkOwdAoh3YEio4LbjjWYV9GV?=
 =?us-ascii?Q?fIMYJE0Hd7HyJxudhQjRQlOHPYVkvu5avOG4kQHlBVpnkKSxLifvaC2ZIUDP?=
 =?us-ascii?Q?IuM1gRDpXhxvtBfhENk4lT2tieJHRVDHl0p6lcuRv0NXUqvBvt8N/ND25siF?=
 =?us-ascii?Q?97sFOdkUEAiGPVRsZJ566X04tAQjVd06R1ENZwGwQ5TpuCsEe/f3wlnsWzih?=
 =?us-ascii?Q?2STeZ9glq3t5B0jbUJCiPIDOMR0qC+9ne2fVHQdPU+EB48TmzwLlAOUxIYlv?=
 =?us-ascii?Q?C2rQvB6VdShRa/yurrQf7DjVXl6RTXjCrLXHNc+Twvmu+6jgJGbqxapq3EuG?=
 =?us-ascii?Q?YrXMv8rTlttXMXYU9ih8usP5ZToFAeL4VXYqUeR4Af9mKl1JTFAhqQj0RuRs?=
 =?us-ascii?Q?jcY2xz2N6Nk3BxLY/osH3XvabQ3SHxMHQS1qN4T81H4S34LkKvoWpj3iCNHi?=
 =?us-ascii?Q?NvxNURidP3T93lvfBcE8aQLEBRKHxHUnf8NCHzbTfyZVdlziFh8pV6eRCYKf?=
 =?us-ascii?Q?UF+5dnmWXo9thpCLHKtsbSzJZt/TzhZ9x+GKc1EyRYntO+V9+pXlcfpFpMWq?=
 =?us-ascii?Q?sXz93/BLnE7LOpvpoLTXistO2wQdQBpjhP5MkXbQOsQBr9jqKQLOKr3O5MzM?=
 =?us-ascii?Q?f2MH56bkwisi2Fvfxxcz9N2p8rsSegK1fwm9p5RJ0767oDxShA54myhVvwM9?=
 =?us-ascii?Q?8MY9LSCFWZ/yvip0WWNOtr3UlRl02nND1NaD4dW+Li7rR6e04+J+uMWib1Xc?=
 =?us-ascii?Q?CYKN+aN+gAvMMarlZ8FbczUZEavLLfE7BXSxC9iPUQmzcrV4x6+lfYuqgvnO?=
 =?us-ascii?Q?mP/yFSub3P1aphS/zx5zHhIEGhlJdYZ2H5LRP/4ixLIpK8ZNaJMqySziFWcZ?=
 =?us-ascii?Q?3TMWMwLvp9YebDEqPtdd2OcUa9i6scBK8zKYW1N7a7/csA5aJUB1PtF9j8og?=
 =?us-ascii?Q?GK02c5VNIj0I8gzeYPsEVRYEKHZnRwG4kQejDyykNDum3P5mRbNmXFoFdb48?=
 =?us-ascii?Q?YHL2qSy6VT8QNlDycf8o7q4EIY6qbpO+0FWk6qGM/9ejStyKcDE3BzJkRwzh?=
 =?us-ascii?Q?NtAOpH3mROTYA1mkIZgFX3WJtydKTrDkUA/xr5HKH7dzprmMIj128Nt9mnf+?=
 =?us-ascii?Q?HV7gqf681ISdKcI7IzW7cI9EI+9zsW8/T6WKAeJxNmSiHiMZ0v0OcqZxUERT?=
 =?us-ascii?Q?iSuEwjhal2GlmFA0wWAtIma8i9BEpxdW48oEq4qVffDV65Ne8e8jfmkVOo3A?=
 =?us-ascii?Q?fNgxcK4UyClPNXN22BR8vBhfEVXpKmM5wvCUwcAARQ73jobmBbgkeWDx8Y9n?=
 =?us-ascii?Q?C6ajOyaTtxQT0KNrs9PPESWM1C7eNshH9Zn2ojRQFNjmNKIdBtnxnpSz46Nq?=
 =?us-ascii?Q?3SnrWuAMdX5t37aZ7h8nHb5ihTKMW8b3WTg1Q2+PkX/3LQRXxnSQwhs25T6H?=
 =?us-ascii?Q?WrpMHYn9X24TkU0ZL/s0XgTJMcPK2ZMt7+Itszn5O0hjwXA2tvMxYyMYPnVC?=
 =?us-ascii?Q?eFl8ToJnlPcWyeCG3xZAsg8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93fddf00-fe8d-470b-6c69-08da5af1344e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 23:35:23.9081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /bSGwlDOwo0pHYOhGvQDrsnVOgwm0o/Dy+DaZTnKJZAPFEJvU5EKyUCWJ4Ktf9aVSbyWQbJ+MdBJC0H7g0etURGgE3MkAwmAcxAaqAp2LeXkvBSr5vvK/DUl9xFoy+ey
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2691
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

> OK, then please continue.
> But perhaps add a comment to the SH_PFC_PIN_GROUP() definitions,
> to make it clear they are preliminary?

Yes ! Good idea !


Thank you for your help !!

Best regards
---
Kuninori Morimoto
