Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 673D853DF38
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jun 2022 03:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236943AbiFFBD6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 5 Jun 2022 21:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235315AbiFFBD5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Jun 2022 21:03:57 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2095.outbound.protection.outlook.com [40.107.114.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7379A3980D;
        Sun,  5 Jun 2022 18:03:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAYtdFY3AEPEwSMl6mMivnQFXCETntOCqPkTs7H4YO7rBW39YeTLvOkmCHdohZTpXsGatntpv/TXGcGIrUwoCidvVXRhc+YAg9l0AaUluTnfA6L99K/C9rJ5mqR6RtQFpTdwn3sN8Jr3HJobQEJWbBvlLeCanfE+mblPutmTZnG6hHgdu4M2/rAjzCRKY/9UErSFFJJkGZQEy4ongLTFXNxGGkNVHG0+p21vmEE1N0qXso+VHiuK6+V2BYyClRwBraFw4VJC7/9/VTiJ6rZU94R9hH5nJ9VaeYUbMnQ4y5Phmu+LWSOFioo0k2+0K1fkSVr/PlxzhDkEqz/dbbEiTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fx6nEO17c/AoK4H/ehlOj+aLrIZvN/l8W/tpQFZkYJs=;
 b=mXZtB3Um+b0BASHJrS9feotuq1nRowxexGtdK41Ac3FOJUmUKdAriJBfDBNSUgA8QM9R2BckLlkYkvsU+QQ6I5QAqggiY0SllzRG7VYb7xGbsYEIBat9yXmpJeYkIB0BzNnM1NAj+KHxN/rmHvrhmtSfIjGkMHrXGPNa6f9yUk18joSU1hTF5evPiAVaSJy52dOWVZJ/2sFL7dQz3SjLbuCmkgwQkWSaVyR7yFzQVCzmRwz0dmowPiE15A2Olfd/0m6T3MgufV2rz5ATET/O//CVhN3XpQkRegomWjTbcAZU1CR7BVmBF50afXy5iRZ/LkzIEExT99FtVqS9kmkPYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fx6nEO17c/AoK4H/ehlOj+aLrIZvN/l8W/tpQFZkYJs=;
 b=P7Z0KjSxFTKhf1/ORvnpV26xbDm12L6Vodzei1zRh9txNCL+ZRpHPRmuqG07e83TB0G4luOYZCKqsd33Y4p1s9fLwWJvCNS94BrwirlsVWsdOV2wCM7WD3CNrYgAZvJaBxjgirjoW2VUuiNeVQxkuLOShFkXHM3Crk/cCRQFoTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB7210.jpnprd01.prod.outlook.com (2603:1096:400:c7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Mon, 6 Jun
 2022 01:03:53 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a%9]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 01:03:53 +0000
Message-ID: <87leua38nb.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 0/3] pinctrl: renesas: r8a779g0: Add pins, groups and functions
In-Reply-To: <87r1423co4.wl-kuninori.morimoto.gx@renesas.com>
References: <87mteu49tm.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdUWCjFRnjVDzrjDh4ODDyh5hV5zdM9o4i20c4mLXhNpHg@mail.gmail.com>
        <87r1423co4.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 6 Jun 2022 01:03:52 +0000
X-ClientProxiedBy: TY2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:404:a6::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5e371d5-9535-4459-0d3c-08da47586c6d
X-MS-TrafficTypeDiagnostic: TYWPR01MB7210:EE_
X-Microsoft-Antispam-PRVS: <TYWPR01MB7210F78F3323CCB708902F28D4A29@TYWPR01MB7210.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o+2ymPhf+5ufjFhpqxKvfUxtGuhXqJoQy2PrV6VrZAbczxBVTVCgue7YsvlY84COx+hJphg5gTAMuwdCWa0C2HtkgH7yPAM8WO8x4vEQdl4VJ04ipynXwAZ8Lx6LIW185Tt6V2iM6P2quKC4IE83Iw8wWGyo4wXKFMUAg5cBbuXuoOUsEbK1UTvxJjFx1HqHFZjXDNVULnL1gSlr6grz/6mkZNfqDBV3bW3DtiIAaus3jalVdHJxQnb2RFVkCfC17YC5LGFYfH7thF9YdgPhkEkF+Rk7ucPIJDAJDJFm6U33IbdtGpJd6ArMy36uYpYLqmWL3wIyYIvRSVtz4riLXx8LCo3iBX3DGHlNM78VN6trgFK1TM/faXyRGgBHnDUZcjsCdGxiMY5GqDAC5G++Kfc7/k80mDD5doyI3ssxKp8WL72eWKJN81SRzmE/xdtz11Rqns1hfoBugrVgiFBoQrHTOgvMB093cqSvcJi1zfLYxdsSeKyn8Aw33XZiT4413Ds81Qi8jfywqVl2m0qlKrBSo5Q7zJ2bW28cjM0vcVz0y6Oxt3+wRKiGXIfny1OnS3T8hNxC1Y11KhgM6HOjvk6er5I9RZb5hLs8ivzG8LntXLQK1vBZ6qk4Ly0U8YULc1osDrJp3jDRI4gpCewvY6Pe/vxRi95n/LEeAXyv8Kf1WTfY62uniNJBiBRF/8/ht5ZeQ2ohwm/EC4mgvbyoTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(38350700002)(6506007)(508600001)(52116002)(6486002)(4326008)(86362001)(4744005)(66946007)(5660300002)(36756003)(2906002)(186003)(8676002)(2616005)(8936002)(66556008)(54906003)(6512007)(6916009)(26005)(316002)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MBiPIpAS70oie002KYWLjE1PJTixzgKdecwDzopPr84Hr6mEPUeC3PCroimj?=
 =?us-ascii?Q?pIhEqmN4fbXgbKUyFv1edHWhQZmzmz/cwgq0RWePaVf7rctD1PYw78ZxxJVW?=
 =?us-ascii?Q?/tsIwqiMD4mV6ZJ5LUzedpMcvf/Gk01y6zhIvjb76/tTAYEUWAd8OSKMm7DP?=
 =?us-ascii?Q?ZhoXci4mwnFJVxH8zyZZV9CCuQho2EiQrbNtN6NOS07NbgvTefgZugc3Dpai?=
 =?us-ascii?Q?1JLOSTq72mgkoYSKFWvCosa+wJWwJBaug2e8GVRZXP9KwA8nKU1VKz9TtPEH?=
 =?us-ascii?Q?Ii+NES6qvu7mR94fSa/C8oV1YYr9qjdIdakAPLzQtrQIwBEz3pUgbXEyPDpY?=
 =?us-ascii?Q?iWjqISa16SsoPe0KKtfB2FLyVEpvtsFJ3nTidMMoZ3Hxxh7ExlN53XLWSWOB?=
 =?us-ascii?Q?96VPMl1ETiHTmidweQRKdD20+1pvoTC7w3smtbCTGKwAdeekoQPMybr13COI?=
 =?us-ascii?Q?WuaTs8Cjbb8k0tCmspHVL8w/nHbuEShncthraqBN94q56ZO25MCqgFC1Fe3K?=
 =?us-ascii?Q?YMxu73a1cyiUvmqrBt4aXsd8QXklfDBB+QfGHEQoIhTwAWbgKmEd0RNk9xmu?=
 =?us-ascii?Q?BGSPEXvv0ok0NvGS6ZTXhRmp/n9OqHbANt0KWljbAJfjlG0kN2fkvyFSwLr+?=
 =?us-ascii?Q?UWDab25bqUhh7bTA4YrGEf4LFZg368ZB6ODsucfpCYLiztGSD4z6t6KukFm/?=
 =?us-ascii?Q?2jsI74FgjPsbRldBPhJCxPIM6BsuicYYGco8aVygWXJAzsRw5XDvzk1ePcQQ?=
 =?us-ascii?Q?yFuM4mOkNOvCmUGLnmb6wAukKzEDpsWrlohKMGQcXsti1n0iCV1jpdbqvL8b?=
 =?us-ascii?Q?VkyzBe1VmiTDZKVUw8l/3J/0WW2zGJOXPfwyPjeZMjYdAJ5uUoS7xn8T1Q0f?=
 =?us-ascii?Q?vKWpTxzH68EsvizsgaTXJh4vLHVsXoLyS98kzShKkmRX7dbf6mrWVupCGTVZ?=
 =?us-ascii?Q?mmgLRUs7Iblrsy5YqEeJzmmDLRFyILpVA8WlvwqOvKDdrbAMO+CfEOlY5C5U?=
 =?us-ascii?Q?5Ic+/sjUcoULVJzdYNwQLWYsZAPUmwhff/mauHx1QlJAeatygAg8O2hsswaz?=
 =?us-ascii?Q?RZ6+tg85ZycXH0iF7n2qmxcWfkouxmDqplQtaa4HQfdqb5tEyszeaJ/eVZIH?=
 =?us-ascii?Q?iGya7ezOBG/eyf9fwQQFJHpFtL/TuEHFFMHxA0O6f0vY5SuLGvCitt1NoLfg?=
 =?us-ascii?Q?dV2cauVIEFvAnMUoUzUcUJDr/s+/aqwEZE4mUwFvuHfLmFdzfeEaFhNuy1Sw?=
 =?us-ascii?Q?KL1PRUj9yMMzp3rTQkgP5WfRgPm+nTZUrB4ZEnnsImzhQPxmlpA4qUxpdD2z?=
 =?us-ascii?Q?V/9aTASW0UQliXcTML4oOxeMnn8Xd1pGJHCRQ5Quq4kh91K8/AEdm3xA5sOd?=
 =?us-ascii?Q?AQohE/kBFpvFrrWxQSlv1T9U9HfIlY2TPiPTb7lKHt3Iril8jd3Oe03bQ0dt?=
 =?us-ascii?Q?+98jUxbcQO/CTSBcyBiLi1vRFYntjF4h8eYL0ojD0YW6aPs15XJD8E96luhe?=
 =?us-ascii?Q?G4dNbB14+J1qqsm+nvNWRd3Mlyy/ORzGnR6DzJyZTwd87nilpZzlnHJLzKem?=
 =?us-ascii?Q?sKpve+74YDR+X394r18rpccYyEAam+XvDNQo3ML77Q7bCkj/z6viTAQrAKXU?=
 =?us-ascii?Q?x2Q4twvX1bFSelhHBX35xxXyWz+ddfbs248+VNqRVH/lXoLMcWyfwmeZKgSN?=
 =?us-ascii?Q?btCTZNOINmKMuSVNo0vn/PNBWtKkIPEwr4REsI3v4HmnJaUHMCA8BljDQaPn?=
 =?us-ascii?Q?zLvx3E3c7qkIOLVw21S7HhodV/Y8+brwLUnByy/w9DmeeAtrXbRY?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e371d5-9535-4459-0d3c-08da47586c6d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 01:03:53.3295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNtwnnJvqUU/QxrkVaCvUBgya3r5JRfpUkxfsXwvJbsjeX8mLIAUAF4RQUp5c/soHcu0LVuQOKa2n/ynx/DWRNzac9GIk0X4tWdOix5x2o/GkwArUL8JL9FdJpG4PMhL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7210
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Geert, again

> > >   [1/3] pinctrl: renesas: Add PORT_GP_CFG_13 macros
> > >   [2/3] pinctrl: renesas: Initial R8A779G0 (V4H) PFC support
> > >   [3/3] pinctrl: renesas: r8a779g0: Add pins, groups and functions
> > 
> > Thanks for your series!
> > 
> > Here's a first set of quick comments. More will follow later.
> 
> Thanks.
> I will fixup all, and will post v2 patch.

Which git tree/branch should I base ?
I can find many pfc related branches on renesas-drivers.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
