Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9A4C7844C7
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Aug 2023 16:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236986AbjHVOz1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Aug 2023 10:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233629AbjHVOz0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Aug 2023 10:55:26 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2052.outbound.protection.outlook.com [40.107.8.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1616198;
        Tue, 22 Aug 2023 07:55:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVuo8A24PCw6Rl38JfcYoVJJCAVBmgTBDkr08WfryThY2wu8r8JEyLynZf6+eS/RqPoRzXy3Xgnq3nIld7trJFG4ll/vUpxMieyYxktbvUEh+dc2voIQoWjrbHI84iYv1uZ6uKpZydVm2Sq9m9WNUxJOk6UDf4vAkYq8fu5/7GQhjj9NZtH1iSmO2D1nbLuLiDYtkFkx9VPRGd5EjnchOltDoswkmx0sBZTQIGpafImZ/6TPZd+Nrrex0qD1YKBk22s95mJdH5gG1rxJu8FN7NHKOvaO8oaYjxSjF69+QlvAwdacBNwUd4a7EHH6ACMpD0ai/RHikeYpllCVziWZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVqB6QIr0Oy194tvuxVk0WB6vOoANW0evRTgIrd85a4=;
 b=mhbgSoGKr9LK5Js4stcpv6o0sB3NyE9SAWOCNjrQ+MaTfgWZhJ49UvoJPQSBiWYpCXCcSk/hSq0N7NaaoM0LHP4hyH0d2sWR+XVe0GyRccXqF1AtG+rz6ko5s5rz4K1FHCakuHkATx0+lYXO9xwQ1i1GYlDA0INDQM0gaPoEGEeR8PoyNdARCACx0YrPcB4dCy2z2Q5VStDIHGyTUZMmfWichYj6p+CXFEA4AkEaQmKQ8uGt8Sr3Uq6l3NJgkNt0UUndRulFLddwBEvs0AqFZfdPFXcyZoEo8QNZt/hSX9X7b6zw+/EBZs97IfBOa5+EPLNSZPEvwGKJ6USAdfZI9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVqB6QIr0Oy194tvuxVk0WB6vOoANW0evRTgIrd85a4=;
 b=PY0VteW8P8i6pRQbtFxcHy+DsToKlbwsl1JlDUWqUzemwNunANhS1uGVdAvzWFo0l2TKYVWGyUVnDhZ4OeEmr9wui62FDfJCtrbjL5Zi2KbqYQ73DjKyYwALVBSbRM08DCtmM6cvh7DLgWB+wjwZONj5Msp3IbquIqVO3CvHXlk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9070.eurprd04.prod.outlook.com (2603:10a6:150:21::14)
 by AS8PR04MB8547.eurprd04.prod.outlook.com (2603:10a6:20b:422::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 14:55:18 +0000
Received: from GV1PR04MB9070.eurprd04.prod.outlook.com
 ([fe80::fd28:f7a2:1bc1:53a0]) by GV1PR04MB9070.eurprd04.prod.outlook.com
 ([fe80::fd28:f7a2:1bc1:53a0%6]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 14:55:17 +0000
Date:   Tue, 22 Aug 2023 17:55:12 +0300
From:   Ioana Ciornei <ioana.ciornei@nxp.com>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Vladimir Oltean <vladimir.oltean@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org,
        Madalin Bucur <madalin.bucur@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linuxppc-dev@lists.ozlabs.org,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?utf-8?B?RmVybuKUnMOtbmRleg==?= Rojas <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, Li Yang <leoyang.li@nxp.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Message-ID: <20230822145512.pc6qd4ovvnw4y3en@LXL00007.wbi.nxp.com>
References: <20230612163353.dwouatvqbuo6h4ea@skbuf>
 <1dd01fe2-08a8-ec2f-1184-a58b2f55ba85@seco.com>
 <20230613142754.wr5njtjo4tbloqwu@skbuf>
 <20230811150826.urp2hzl3tahesrjx@skbuf>
 <26623d0c-8a5a-614b-7df7-69214aaec524@seco.com>
 <20230811163637.bs7a46juasjgnmf4@skbuf>
 <20230821124952.mraqqp7pxlo56gkh@skbuf>
 <a2e3fcad-9857-f1b3-8ada-efb2013a4bf5@seco.com>
 <20230821181349.hls6pukp5d6rc5av@LXL00007.wbi.nxp.com>
 <73d59dd2-88f0-3c1a-0de2-de2e050cba5a@seco.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73d59dd2-88f0-3c1a-0de2-de2e050cba5a@seco.com>
X-ClientProxiedBy: VI1P194CA0051.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::40) To GV1PR04MB9070.eurprd04.prod.outlook.com
 (2603:10a6:150:21::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9070:EE_|AS8PR04MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: 54584efa-0dff-41a4-178c-08dba31fcca5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QUz2pvSPJ8nkLvCZguMDVEOIoeZzTzgoBR5iaEi4y3K7Lkx7K95UJCVSXj2kDGkoYDTJ2f9zG+hbQeCaGj5NOAHu7qu2RKjtQfQ9GGwhwc1dtepTA31yvVc7rhakulyIIHytzVpOhb6PdCrNYimjHGiOzfPOtUut77kT0LOGOrLlEs8CiNF0fA4hSll1lbCVI4JsqYBW0cklqn4/KHZtAgeA8kl6FwmbbnQwZCW7R7u8/pLv87RCqbtB5wpLBeWEFsdhA6Okof/SHNenUFVQ7xtJr9jme3gEniC2PTGXEy1BbS8CWFe8OeestrVoMCH84CPyT1iHZeTDz4ygkPw9jtWn2MjwYBLXdFlZM3q3CoaTTc1Bggo4ZnBRBYm2zo2kWVbRvbI0xHq2bVXw01nC/3rW4zdwVVgAhEwlqfnrtQRoTeYkdyT7HmRrrhVgJRE66jM6m1Lu7kes4WqLtBLWSoi1ZEy7F+Bitn2KxND6EdMehmr9EFE48WNNvyKrPXp0JjIoR1fpsxWOzudZcNJzWthz2WSdQ2iylA156pTQvX4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9070.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(346002)(366004)(1800799009)(186009)(451199024)(54906003)(6916009)(66476007)(66556008)(6512007)(316002)(66946007)(8676002)(8936002)(4326008)(966005)(41300700001)(1076003)(478600001)(6666004)(38100700002)(6486002)(53546011)(6506007)(83380400001)(2906002)(7416002)(86362001)(44832011)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vlzlZgil1aNwyhrB2b9V7gLe81GcMP+g9pCLRPZ45Xnfocn3RsogTp8fxyTD?=
 =?us-ascii?Q?YxMTsbsxJ3pqzRhBQZHj7SEJAhvwZtJMbFq2y8NLBhrMLuyxyQ9mdvYqcsxv?=
 =?us-ascii?Q?qVyVCwDAFz27Dd2Db7fAm579tm0beU9OFU52DZsScMHk2782rf5jOxIaragT?=
 =?us-ascii?Q?VPLRLbC+/Iy8rNc2CrkUU/mZLRz7lnBKVHDrJdzX6FKRcJ1NCrByvJAv5fwG?=
 =?us-ascii?Q?JCed244xDNWFgGD4AFwYATpcoNlHn7tLOEkZsCcrzlIdzFQj9rgsSJemHXNt?=
 =?us-ascii?Q?eDQH4OTD6U7/jeo3ICIDk8UT1mDEUp8XUueKvftc/PP0ZOrgLH35KRSrKCZ/?=
 =?us-ascii?Q?ZLidJxUUgmEnkRPSuCsvSzhTTf1g/rYNVvW2oW9RNhWomF5BlOYI4ISQuCwh?=
 =?us-ascii?Q?XwasCL4d9nBM3hshyvMzrRpYjagzkkpd13hw1HfvU356JWamcXg/+PAmb5B4?=
 =?us-ascii?Q?xDddnl9FztLX2rUDVzOu6df7bY7dQJ1wXf/Vjb7keu/Dpr8uddyx1hwZ0Hcj?=
 =?us-ascii?Q?Kk6luiW3z2QDQpH3LWP7kVCM3hmn2pCh+z0O4cHoEihSHLwL2uCfhYai7LzD?=
 =?us-ascii?Q?J9pQJAJtOCUhzf52LhOHdpBr0ndq580QgATZ5FD+L5J5KaUf9+Dm1ludgiZ2?=
 =?us-ascii?Q?Anib4qwtT6AKeBErRseM/u9LInMbfMY7U2RUMtKkmh4RTN9p2pKOr3Zek8KT?=
 =?us-ascii?Q?vsV/kqpqsfEQJWPcjNLlDfTiSS2GM9z4CJK5kNoYAeHy0tYsA/lprFxn4Ey3?=
 =?us-ascii?Q?1SY/5u7TcRazNb3FRcvv91KZwdFlPsAEZsiGduet4wnOSmJvqPk8n8QBbLbD?=
 =?us-ascii?Q?BKPgJj0bbp0w23N0p6mzEdMfNR/gRLfxshSEttcXn3pjSmMIipc/zjND0ULu?=
 =?us-ascii?Q?DvkMOyRJV8dDNJRPRqG0ozgx1gA2S9OzObZvmRsMEjHH+TTTva21AjQe6Bux?=
 =?us-ascii?Q?QgRsl7nIOeIbxj846ftgfapYWM3FqdbSwanC2VwpPm3mRQbXILf4i8NZ+xI8?=
 =?us-ascii?Q?yVpn8vp0XTxHfMIbPCBGrLmh0eKnFRV4TczGMdWg31dmxUIol2Z88XP2rzhj?=
 =?us-ascii?Q?glGfPRNBwqMnELnbAhmapJe/BnyaWglz9uumS9Yc+Aqlc9aLXFhestEeR3HP?=
 =?us-ascii?Q?QvISoPyxOIMh+r4T/aA9Oprd9T/4QvWH1WB2I+pEd3VYEvG9AVkOes0zzmAg?=
 =?us-ascii?Q?kB7Kdj7ZMvzzhq89LWdgFne9GbyyRZDfyYgqlDY0oup4ql4ZWLhNrx/APaRx?=
 =?us-ascii?Q?ZUYhxFwFv8Kk8k3OgYglu3w6jWMnEy3S0A0SP5Ikkx5JhiN2kQ/rQaizoDDf?=
 =?us-ascii?Q?afFTYpCc35xraFLwKg5gJPJVhlHiHwb7MmMflI2mqKXZwsxATS3d12DzQmue?=
 =?us-ascii?Q?JYlDk6PWPv0jndkPaSyscrz20g8k0SJoii1SK6XR1BJN3Buocp63v4IBTzK1?=
 =?us-ascii?Q?G4ABpaJuCHKO+J20isE2w7ofmSYwnplA8XWz5R6oNnM0Anl60P7jN9v9MQdd?=
 =?us-ascii?Q?sNMsCV9Q30+UqUsYG8S71vcnSBBkhcRPBz0LlgNh5oJ0n5v6pzfvLvubGTVl?=
 =?us-ascii?Q?wyG5Nv5iBK5/5rcAVZFFbqeLLkz0eGLTXiQnbjRR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54584efa-0dff-41a4-178c-08dba31fcca5
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9070.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 14:55:17.8808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPR8Y+BRCl4En17NB8tef9OvHdiTZUoVrcnhtbZSfX/b5+0fJnQ9IUKwFKlcijgoxe/yC83jwCh7EOvXkE3NjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8547
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 21, 2023 at 02:46:53PM -0400, Sean Anderson wrote:
> On 8/21/23 14:13, Ioana Ciornei wrote:
> > On Mon, Aug 21, 2023 at 01:45:44PM -0400, Sean Anderson wrote:
> >> Well, we have two pieces of information we need
> >> 
> >> - What values do we need to program in the PCCRs to select a particular
> >>   mode? This includes whether to e.g. set the KX bits.
> >> - Implied by the above, what protocols are supported on which lanes?
> >>   This is not strictly necessary, but will certainly solve a lot of
> >>   headscratching.
> >> 
> >> This information varies between different socs, and different serdes on
> >> the same socs. We can't really look at the RCW or the clocks and figure
> >> out what we need to program. So what are our options?
> >> 
> >> - We can have a separate compatible for each serdes on each SoC (e.g.
> >>   "fsl,lynx-10g-a"). This was rejected by the devicetree maintainers.

I previously took this statement at face value and didn't further
investigate. After a bit of digging through the first versions of this
patch set it's evident that you left out a big piece of information.

The devicetree maintainers have indeed rejected compatible strings of
the "fsl,<soc-name>-serdes-<instance>" form but they also suggested to
move the numbering to a property instead:

https://lore.kernel.org/all/db9d9455-37af-1616-8f7f-3d752e7930f1@linaro.org/

But instead of doing that, you chose to move all the different details
that vary between SerDes blocks/SoCs from the driver to the DTS. I don't
see that this was done in response to explicit feedback.

> >> - We can have one compatible for each SoC, and determine the serdes
> >>   based on the address. I would like to avoid this...
> > 
> > To me this really seems like a straightforward approach.
> 
> Indeed it would be straightforward, but what's the point of having a
> devicetree in the first place then? We could just go back to being a
> (non-dt) platform device.
> 

I am confused why you are now so adamant to have these details into the
DTS. Your first approach was to put them into the driver, not the DTS:

https://lore.kernel.org/netdev/20220628221404.1444200-5-sean.anderson@seco.com/

And this approach could still work now and get accepted by the device
tree maintainers. The only change that would be needed is to add a
property like "fsl,serdes-block-id = <1>".

> >> - We can stick all the details which vary between serdes/socs into the
> >>   device tree. This is very flexible, since supporting new SoCs is
> >>   mostly a matter of adding a new compatible and writing a new
> >>   devicetree. On the other hand, if you have a bug in your devicetree,
> >>   it's not easy to fix it in the kernel.
> >> - Just don't support protocol switching. The 28G driver does this, which
> >>   is why it only has one compatible. However, supporting protocol
> >>   switching is a core goal of this driver, so dropping support is not an
> >>   option.
> >> 

Ioana
