Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF5E788BE7
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Aug 2023 16:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343725AbjHYOnT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Aug 2023 10:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343813AbjHYOnT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Aug 2023 10:43:19 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2074.outbound.protection.outlook.com [40.107.20.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 038262109;
        Fri, 25 Aug 2023 07:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+WRyyXIpMryZTTBIuzbu2iYOLbTJL4pLwUCGVI9lf2A+zdCw8QiJMu2YObaokvFFeNl7PYJxJIZ/8ps1sxcZlYDbxWIHHZqiCZfHHq0jQXj1TMTCBz3usPqHdozbWd/5ZkdG+bdhnjxzsnI1/bOC+cozzr4niQCNw9Xzss7NwluIK5ixcBlaR/iU1/vSVpFrxN/vva7mqviN7wTqdHAwHloxF/VgpGWcN24NzNGUatjg6nsHNNMcOesk3hX5ODc4rQMcf2EJMmYi94Yqz2E1ci8rHzSw5yLFpDGf5s8BFC6JVPtJtXaZw7Y/akDNZ+PIKSOKu6Wme9YGIc0MLeaVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKu0XsIH7fZsMQJp7epgBQ0pYnq+MOci2Ok3BGweFp0=;
 b=nUV3LEWooI1bB9GDuUrip18vDGk6ZCGobHGayt1RK1IMxXEXgunLLnTpEOmevrGB/8pjRbBoQFNv4F3BQcMyQkM0e1AigxV05Uw64F0oyodtXzw8LFTzFepfP0OjbfxuHsWID4ann/RVTa3mWLwIfOukUgbBz9mwCaTNVOrEtWasEQggpNVRYOBJh5aiNe/eMhJrGhx/RT0IPgZS3iRtNCyQ8p3b9o6OJZeY6LgMbWjjNc7dPxyte0Ch/3BPr+opFVn7e8+a8TSl2Ch5+fs0l/4Ap3BsHfOKx0is60ySnUGAhYh8n4G26FZFQEgatYRBdH1KFxZD2+fSqJW07Xla5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKu0XsIH7fZsMQJp7epgBQ0pYnq+MOci2Ok3BGweFp0=;
 b=RG03z5duxHXS9WvPOggjpB+KNYVvSbQ/f+XLrNWC5uyoN9xG9v2QLGpw7X3aKo7RTrwL8mTbzkYAWjDw03BQ48o7ZVAV1uOVXSb6cxqVVg6nLzSo3lJjmTkGl9M8g3PKjoyQ9xoTu5ovYrZCp6bPhkQx/y/wI4ecA+vtFQbEQ9Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by VE1PR04MB7389.eurprd04.prod.outlook.com (2603:10a6:800:1b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 14:43:12 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::d4ed:20a0:8c0a:d9cf]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::d4ed:20a0:8c0a:d9cf%7]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 14:43:12 +0000
Date:   Fri, 25 Aug 2023 17:43:07 +0300
From:   Vladimir Oltean <vladimir.oltean@nxp.com>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Ioana Ciornei <ioana.ciornei@nxp.com>,
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
Message-ID: <20230825144307.jkogntveiafucpqy@skbuf>
References: <20230821124952.mraqqp7pxlo56gkh@skbuf>
 <a2e3fcad-9857-f1b3-8ada-efb2013a4bf5@seco.com>
 <20230821181349.hls6pukp5d6rc5av@LXL00007.wbi.nxp.com>
 <73d59dd2-88f0-3c1a-0de2-de2e050cba5a@seco.com>
 <20230821195823.ns55h3livxgol7fp@skbuf>
 <a66c9abf-5351-62b6-5573-cae38e6768e2@seco.com>
 <20230821224834.ppk4hmjyajupy7va@skbuf>
 <a4828cf7-9cac-286f-0aba-fcd1688c8422@seco.com>
 <20230821235917.mzawnkoi7oj4zgm6@skbuf>
 <54621dd6-275b-fd9d-a158-6871f1a04fd1@seco.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54621dd6-275b-fd9d-a158-6871f1a04fd1@seco.com>
X-ClientProxiedBy: FR3P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::21) To AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_|VE1PR04MB7389:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bb88f74-d651-4aba-5b08-08dba5799b75
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X/cbV8PiUiegA+KSzcWdvcS5V9FRey8tBlPLwNKeEhCvQuwTv5IvvRTLWYYmh4s7Ji9onl4MDRercxMDFicsEj8hFlqya7wnPJdctJCOyj/a8lhPMttxq2TEJ3XltLOEZOSySNNHAmtNwJjKhrzDr9TevKWhGdNU4fPaqLK5T50pRWUv6ixWJJmmDYRc6AmBug5k1sDOd5dIak7cjC58Cewo+Mq2qQoKKPSQf71qNoW8xNJDQy4GmJtebcE7rTPT7qtvp7+DfOTYSdePNfvahWzPZjMxvwttN9ULpDwwY8ciesp44sIqmZRp8i69/eZLvClMVeMbeHDEO6+UBELPUSqIPUvhfNARZ2ePCeXYjTip6L/Aa6e6isQ6cFDtcechXeGWbxju4ALUq1bXJRBGSrHJvUf6HBwe3WHxbkTtVsf9XKc2MASltqxaoWJ6aIa86mTZCJ5nxlMzdBKl/OjXdKynoVVc/bCjJjjHBnyrNlWN0SRU36J0EoXXiKLDFMVhyFaMSrV8xkpP1Didi1FPE1S5+zv8hVzd+RiDk6AfrjN1vuylOkv2so0TApRymB8H
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6452.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199024)(1800799009)(186009)(86362001)(33716001)(38100700002)(6506007)(6666004)(6486002)(8936002)(54906003)(478600001)(26005)(5660300002)(4326008)(316002)(6916009)(44832011)(8676002)(3716004)(6512007)(53546011)(9686003)(83380400001)(66946007)(7416002)(41300700001)(2906002)(66476007)(66556008)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CJ02Qg/461uz4cbMJTex/NjMCy7ck6mSpCnvvJGAVrNBe00XGV0D5R3//kG3?=
 =?us-ascii?Q?u06pbgSyg3W9rYSjgGXRlPAZ5/8gnjfIjgSNRAkF4rhEfw4qMDtZ/+unyyaE?=
 =?us-ascii?Q?wkdMAZa/ceU54De0Q+I6kBRaTyf0TQnsG8L81104jvphdmPP0rrp4VsheVe8?=
 =?us-ascii?Q?pQkg0GUzM0Z530L4UhUpCyUpotRmgVPU/xwxNO/pFRz4KHKSY4qXv6IxAvs9?=
 =?us-ascii?Q?RlD4AKNgZV5aZJzLpJThr3CtLCpWU8COmi2qyF+sQwC/5kafeRyMiR+ute5T?=
 =?us-ascii?Q?ep1ehVef5E3O1qxaaFObciTQvRnxt+1uzBGlTw1R0b+tcKb568ufEzG5XrGQ?=
 =?us-ascii?Q?BPSNkShXSm52Zo7KpyOGZcNyiD+oLrsf1rJYF0mKvA0zQz2+b5ML7J8BkRGI?=
 =?us-ascii?Q?buYmc4osmaLuMVMMskUSw4PBi7HoV1Q7YdATucVObwyY7WeB1jJy2GSbp4Q5?=
 =?us-ascii?Q?7nMaYypmeZReWha2nt5J8sym5fLOnf/tYMRP9m78WmDEzZZjdVichoDf3c0u?=
 =?us-ascii?Q?8XSbspVtFPuhnnTf/NkBreWneAM2LYImYlazUDHsHE0pjz9krije7i5o9sWx?=
 =?us-ascii?Q?Eziz7IrYRVG4goC9RoAdxYjl3MCEr+hoMaLbrBfBAQxLA9GDebTRrbx35hx7?=
 =?us-ascii?Q?zzRUP9ObmJWICftiBBUrCBp6t7jQfRLyqQLhkotZ78byHAeKOGWQjZ5vHn7D?=
 =?us-ascii?Q?hHxJ1XyjI25j4ACZIbgZi18i4J20flsZacC7+BbCDhrnYPIsjc1DRJksyOCB?=
 =?us-ascii?Q?pIUJO0DMy+zxIFG5PIBzBw6x4BbV04ibBQtFZjfbPE9cJkCrkpe793zP1xZF?=
 =?us-ascii?Q?QrzRIy8ncH+JoafwqylwGBdAaDw9FW7E3TH6ho6IDvQaDJZYEb/Kag7lk7na?=
 =?us-ascii?Q?n2Z8/wZFiN3lJtmrLCA6D2RjgpPkiccI5HRsZDBNxuymIHAvBuEsNEUnbGsG?=
 =?us-ascii?Q?giCD6d+h0/ypqmsOarVqLHe47Uiy+KFDsDM4ay9Y1PLDZuUxSbHWl7RFotfC?=
 =?us-ascii?Q?2p1OMVTfjiugP763r/ay6WOuD/1aT1PilUMC0yd0dFj/q+QYNnSAMrO2F7df?=
 =?us-ascii?Q?jXg7xNCRNkpY9gs9X6MnCsFoQ5U6Ud6iUXylcL+QVlc8eB4TsfHU4xAJKjf6?=
 =?us-ascii?Q?6lzcUpYlF5EsvUySEA0e4r1DUYX1BbwCfhZc9fV/ScFW9awotwqCy0c8uR6k?=
 =?us-ascii?Q?trTqZkBu64PgsWtxPadkVbs53N7b+yoxKEYptbIDiH1L9CMHj8pHpn1AZ71T?=
 =?us-ascii?Q?2QiBMzb15Pppil+AegAi6kysXVxwENIuvqS+kMoa6CTR9FEzZZVdsSyANwct?=
 =?us-ascii?Q?o12O5sWSsAa/W5ee27zWPNaB8Pu/uLzgZ9XcBrmXMi8hvftsPaiUZkkNaFsb?=
 =?us-ascii?Q?BofBFMPTVY/nNiThGpvT+9/gNqXCoRQ/wEDoC2DKVXrKJPv5/RQchENA3sLg?=
 =?us-ascii?Q?ZEG6xvkTVL7NhJdTyhwpc16CVIXVBWWU9+4o2K9B8zWrnavgQSBgwVSAb2Lc?=
 =?us-ascii?Q?uzqzqoxvhE85uQN7Z2hxqonK/e1ZIPetYdJUzZdTy0dDE1rNmnsiSEjexXXe?=
 =?us-ascii?Q?IFA+kSPH8lBeN9Oi/sgfNAcnpDZI8xI4yMrR+RooLiqXiqx6ZUDg8XOsF+N1?=
 =?us-ascii?Q?sg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb88f74-d651-4aba-5b08-08dba5799b75
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 14:43:12.3777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCe/mjJHrdklRp4K5fe0Krg3/Ve+cCeA4R/GmDP7W5WbdZkkKk3cBsfcdNrYmJeCWPMi5W2l2DlV4MUKIkFKrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7389
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 24, 2023 at 06:09:52PM -0400, Sean Anderson wrote:
> On 8/21/23 19:59, Vladimir Oltean wrote:
> > On Mon, Aug 21, 2023 at 07:39:15PM -0400, Sean Anderson wrote:
> >> Well, I think we should take the opportunity to think about the hardware
> >> which exists and how we plan to model it. IMO grouping lanes into a
> >> single phy simplifies both the phy driver and the mac driver.
> > 
> > Ok, but ungrouped for backplane and grouped for !backplane? For the KR
> > link modes, parallel link training, with separate consumers per lanes in
> > a group, will be needed per lane.
> 
> Hm, this is the sort of thing I hadn't considered since separate link
> training isn't necessary for lynx 10g. But couldn't this be done by
> adding a "lane" parameter to phy_configure_opts_xgkr?
> 
> Although, I am not sure how the driver is supposed to figure out what
> coefficients to use. c73 implies that the training frame should be sent
> on each lane. So I expected that there would be four copies of the
> link coefficient registers. However, when reading the LX2160ARM, I only
> saw one set of registers (e.g. 26.6.3.3). So is link training done
> serially? I didn't see anything like a "lane select" field.
> 
> --Sean

There is one AN/LT block replicated for each lane, even for multi-lane
backplane protocols. The primary (first) AN/LT block handles C73 autoneg
+ C73 link training on that lane, and the secondary AN/LT blocks handle
just link training on their respective lanes.

In other words, each AN/LT block needs to interact with just its lane
(SerDes PHY). A "lane" parameter could be added to phy_configure_opts_xgkr
to work around the "grouped lanes" design, but it would complicate the
consumer implementation, since the AN/LT block does not otherwise need
to know what is the index of the SerDes lane it is attached to (so it
would need something like an extra device tree property).

C72 link training is independent on each lane, has independent AN/LT
block MDIO registers, independent SerDes lane registers, and independent
training frame exchanges. There is no "lane select" field.

You can see the "LX2160A lanes A, B, C, D with SerDes 1 protocol 19:
dpmac2 uses 40GBase-KR4" example in my backplane dt-bindings patch,
which shows how on dpmac2's internal MDIO bus, there are AN/LT devices
at MDIO addresses 7, 6, 5 and 4, one for each lane.

I know that Lynx 10G doesn't do multi-lane backplane, but I wouldn't
want Lynx 10G and Lynx 28G to have different designs when it comes to
their handling of multi-lane. A single design that works for both would
be great.
