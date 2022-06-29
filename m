Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1235E55F2BF
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 03:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiF2B0x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 21:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiF2B0w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 21:26:52 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2125.outbound.protection.outlook.com [40.107.114.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D25A193E8;
        Tue, 28 Jun 2022 18:26:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfXC7yJ4WNwlPQyWiLlhbjrPDDh62s6CtwXE3mnbP2aAqRyNmo2Cm9AtzfX+oFpQFv6gtkay17k1GRPv882TBl237VNsC0H/42o/E4qZNWMFctBEWE9wdOKEou515o2fE+g+TdNmwQHzAV4x5sYK2o0/qcDNly4KkdM+ATZUBW0uekmBLjv+6JSij+3o135OZOmBcZekISKAFMIU1xexeAes7J73Dn1GElaZ+8den+CjJ00fIuF/59iwR7DqyI7uB2wXFPkFMJ9Ouzfp6HAft8Nn4wiusHkoxPMHxEVo25GjXMQIyJhBF078OZjaE6IIagllB6Hbr2eu+wOMqNTu+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16+Z4oNamAMXgCVekdyQUzDPlaHPk3vlN9MDX1g5EbQ=;
 b=jLrSBODPsNI1GF1nkk99yKyJ+W/ex+WaG+UIsfaef4MYqNjrhPN7nTBTqXamRAwqPM6TkfzIhhOJLm1sTbttIaweW0CzMoMgpwe/kJal2fTtLV5QlzSW5U0G3wZ7VvjWWUtjppoCjD2WD+kXcZbnD7NeGGGTXkY4A4nNEGI9oHoUE6zbFduvFW/3PGWZfJv1Q/mcCLzOSS1CoRSPeNmj0ULUrZdJOI6R0Sx6lVwigoUE/HmXuW81VCqKV/R6+uet8DrQ/M+oLb4mFUVsFHFLuklDbt9A+eECx72ZCfFUDcKa9S6kyzQpd/Og5F6D3lHG19hO1CrLLp5E6tKuT83ozw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16+Z4oNamAMXgCVekdyQUzDPlaHPk3vlN9MDX1g5EbQ=;
 b=gRWmUzXZ9ZXhdzelOKZ9mTOizKbz5XNJQquRVejqAHx4/e843MC9yBP/OQEwEK1dwfMkdsHYPJHzlivbkoLRR9A954yEXQ8hh9DaX/l+ePuKURDxo8y/xCzWydbsyFoTPs02HyCi78zeUqarHD8peTMzU8G76fVuheCE2BfWI4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY2PR01MB5068.jpnprd01.prod.outlook.com (2603:1096:404:110::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 01:26:49 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 01:26:49 +0000
Message-ID: <87r138jm3r.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 09/21] pinctrl: renesas: r8a779g0: add missing TCLKx_A/TCLK_B/TCLKx_X
In-Reply-To: <CAMuHMdVVPN-dhnjw1y7WqQJjZNO-YG8PjaFjmCvawMAhZJJLsA@mail.gmail.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
        <87r13rkcos.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdVVPN-dhnjw1y7WqQJjZNO-YG8PjaFjmCvawMAhZJJLsA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Wed, 29 Jun 2022 01:26:48 +0000
X-ClientProxiedBy: TYAPR01CA0123.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 358fc79e-5add-473a-7c1c-08da596e703d
X-MS-TrafficTypeDiagnostic: TY2PR01MB5068:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ik9Cv6nqzleWIY8RCmg600s6yHNZE+Re/tpT+BMDxV3u4i4AGQ4df8FZsDwE2/5dv1UnigZ7cYuCzACalFqBd8A5UofTTQ3L+NMtr9Jbolru73yNns4MabjkuNAbdYKp75E8Y1uQYWCJD284qhFe/LByJ6uj1RkwGSUFeN1OnaMyw4Tv5xVeymuqJKUcUQda5RLnIBI5ycCH631IfqODPITwCWnnrETRuky//un6ghKJ4Ze4HMHp6ukOAsNzRQwTafiv752U8XPBBKnbQ4D5VORJY+K9YJsokR838SMXRkUQ8ciN/cKyI596mbmUEJK387Ig8txrW7zqSp93B7HcidK8+qHX5Ar+5lgnunq62N/KyBWOr25A3S1cvvwjI6VO2okRPzkTSVv3Euu9w7ewkIKya519G6PUumk6C5Ae/cEva6HxuFUOycA0vDtPrKKlAXjsA+wazb9vJiOULBPsXlydmEAug/oRidBilQJ0IHYaD0wDyWNi0o6PRXknLOfu/ZPSMH6M3ebhzMIcoeZBw0ZDcRcs3jLrTUrWbUIo6YZp/LQg4XxSbqsMxsUPNXHo54bIn0uk5knEil6Fqc8CGKUdn5zokiZ7f0OKUkscgjaVyUzHyLJC6kyvV5mgQ524QUtbY2Le1aKCwKrNd6kXnvEgESGjVlYpz3LuEPQqR3UXx+mmoThsKee28POi1byMcQfuEllfqzi+Uc31r/9H7IAexIDNd8U04GHGriXG3Wd/YCIqd2fFuH/euPV/uAWeIYJVeF3f9JODk1eEtiBQwMiQPt3ngQX2U2ha1XnNkFI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(66476007)(66556008)(478600001)(4326008)(6506007)(86362001)(5660300002)(8676002)(8936002)(2906002)(66946007)(41300700001)(6512007)(52116002)(316002)(54906003)(6916009)(6486002)(186003)(36756003)(4744005)(2616005)(26005)(38350700002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WriN0YgXeuW3P5VYt1rVVSmDIosi2EoG17MwHUVni9mYN/zwZnJAgRiNNone?=
 =?us-ascii?Q?7/RUhLCw2a2/nVL2WlvwPIxx5L4+tBpL3VTee46HAsATWhzBhpGArzMkCoEa?=
 =?us-ascii?Q?ECac2FSiPzxgx7wqB6YtTVAna7P1vZwTvetZKG33cXgB0RTeYP63LME+J8E/?=
 =?us-ascii?Q?fZIc5lMemJM50ZIixgSUvpZUWJg1xGGmftaz/O9xo/DQ0Lkao9VND+HfYPdF?=
 =?us-ascii?Q?4dDs1MjDYjG7jDW+kU37hR44Jd+Cyg9wFOceiqKqG6yQlNM3/o52tgQUKOoV?=
 =?us-ascii?Q?e7ChQMkgPX9OhwrC5fQAnwPjbHeg+wvTQJRBfPxTqp8dns17t3F94wi4OCy2?=
 =?us-ascii?Q?Dwd5pIUSp1fTpVoM2bdl4wOTseoy+IT9c9wakCmb1HyDA0eJ6lIYEGOFxebT?=
 =?us-ascii?Q?0Vn5szVJhL/wLCmI9nuKHGDNGS6daymRmN3WEEwLCAT6wxQG75C8tT9tNnv/?=
 =?us-ascii?Q?HflKpC6n3tQQDNpKksH8cgDQefEG0lMuuNIQqGIym3GqM3mkkanTmWTqTjWs?=
 =?us-ascii?Q?e674o+OpezM3f71knNaa8MVrPftggJ7J2LE5uovqAMET6WJy6kw+l4Uqcly4?=
 =?us-ascii?Q?eFEEa5pqysmkAy2u3UWjCq3GXtrd9RZOKj8PeWAkAaxepREpWtVrlelBoocD?=
 =?us-ascii?Q?fLlZmGvg+1hm4mmicVcv1z9VZLSGdm9gKbmCcQrZIl1JPmcuA2ZpA6u8HZuM?=
 =?us-ascii?Q?2vnGj9nXJgZ6zBpllA3hCkDTU9t0WEjXfE7SX4WXoTOSpjEuTAIpmnuYJczH?=
 =?us-ascii?Q?W2aLw293i+PPJ45d7cCPl+SUaVAdPLILrPTenejESE0VJYxkc3AqdZSxr8yP?=
 =?us-ascii?Q?1si/CS0SL38pc/8Sk9fBUJ3RjFLL/Awh/cLOO+gPPkQqA8oK/PRl/AWzN3Ym?=
 =?us-ascii?Q?ClSFI4MvqkZGzT84OCvKi5tUCjCEwEloo867OzVvb77CcZ8RIXGYZ5jF4hEj?=
 =?us-ascii?Q?pWogWJGBBftH8/zvxWou87B5mHwQtewEclSPlh5HN6N9ynynD/2Q/popKrYy?=
 =?us-ascii?Q?1gF5q6kEgItZm/HCbOxJpowUqbICdCzhcwlAZDE1tnjFCY6xdObC15xNy2UL?=
 =?us-ascii?Q?p/fHKBdXzTv0/zkV11sKy+9iH3iO9X95ZfQlVdWwzy0DYMQT6Y3wZth0sG2W?=
 =?us-ascii?Q?Z/le4ZDJWo/oDasz49wrUzFr5nDyNCgz+fIb1w1h5aATgKfoJPKyDxwVHvVF?=
 =?us-ascii?Q?2Nd4LKM9jbbQzuZAFBkOXaDaBK/TRgy4wc6sz33cRtM/TdaK+lgnOnuAgNjM?=
 =?us-ascii?Q?8BaatWDE2NKImRC/yozfmMyEstqxUgM3zgOzljQmxFckDGYU8tQeI+PvLaCb?=
 =?us-ascii?Q?jM3RM8rSo+EjLrcqlna4Q6GKU1cmexrTjVDGMcaHEOcMwq1w7wCgkQF84Hf1?=
 =?us-ascii?Q?ZInyssNrss+IS5dO/scrdSr/9p4v1GfON0fpE7WVjDac43GquplTnhzUK6qw?=
 =?us-ascii?Q?U0joOQsXH0J1yerSixxowRIEo4yyNzLOovpLCIRlYYqiWXZx6Vb6vi4M6Msv?=
 =?us-ascii?Q?xK7UrpmFpFkhZ1nCoKv8WSzbn5uFwMW0iUYC1t6Ogo/GG3PtQZevaoudntB3?=
 =?us-ascii?Q?B1AfeaaBtwNUCj/Vk1RHUsr7tt/4HUoLTg0tlX72QmqyTfah6uSKlbUy20oD?=
 =?us-ascii?Q?uKTdukCkcrI323sJ21XCq6g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 358fc79e-5add-473a-7c1c-08da596e703d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 01:26:49.1948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cR1DLMWPckjiDhKaeSegY/rR/jukE0pMdmqKvfoJKKgHku7aXjKRW8ikkp0ZRthWSwmReiierVSe/R/ACa/kBgaqNOIK8gFNtDTCXnlbiK1EPfAExd/K9Ojw1Jmc7Oik
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB5068
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

> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >
> > This patch adds missing TCLKx_A/TCLKx_B/TCLKx_X
> >
> > Because Document has 2xTCLK3/TCLK4 with no suffix (_A, _B),
> > this patch name it as _X.
> >
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Thanks for your patch!
> 
> LGTM, but as the suffixes become part of the DT ABI when defining
> pin groups, we should get the conflicts resolved, and this cannot
> be applied as-is.

It seems HW team / Doc team are now fixuping suffixes.
I think I need to use new Doc for v4.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
