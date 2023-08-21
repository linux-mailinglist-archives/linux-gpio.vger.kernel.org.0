Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 152D5783008
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Aug 2023 20:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237094AbjHUSOA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Aug 2023 14:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232852AbjHUSN7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Aug 2023 14:13:59 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2075.outbound.protection.outlook.com [40.107.7.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8EE4F3;
        Mon, 21 Aug 2023 11:13:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZ6fRL+W9qMlHBncbgmoi+J99bgvwRIEjgU7TPylS3nlX+XGiocnVCpvHhJK6pZHdnK6/LiXl+biChN3HRtWtb0SC0JFGkq4EoVfrddxWJSO6Z0MybSQmZ1bDlF0Vh1lAyRcCrmO7ghpjEarWEovvNXPZQybYfpvtZ90QOnBl/FXXCsN0zc+/NBbZbheML1/autPw0OsAgcTs3S2SNabGwc1HeMS2pwHqrHNKGrwbuwEcmwnzEESouuEZ2NIyLoNHYmBbBmy0S4j83rlkcPv4EkpQhcGUNvnsN/uYV5UxuTsXgE3AR7uKHb+ej0rekfC1HXerRFkX4uzeu6HMJgu+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsIEqWR7rz++zCMHhznX1unVs4LMZnLE8QyDNy/CiQw=;
 b=RwkNyfvuDw58HVAHzVbqZHF3+r6+iyQHoOCjRcbo4EfBZ6bS+eqRyG3RCimg4Nne7YL8x4UGbJgW9dGMose0SpBUlJfiVKzNtUfdoXUKY7HV69g0wBrB9Y0Iul0wHSktHUlqK3QcOcJbKbJIya4tkpaMLkH/TadAqMbbwW7T0q1IQHFTUvQAi6TRZ/FPpL0mmGLgUnwFkbo8yB4lXNvJP87Jpr9Nc6MX9tmYLIk05CZAJaWDVyDgbfcDG+z/616mDsAO48KM1VXfAyq7RI7BeBaszunVPnDUB6+QXoKKs7icA3gbbTayehXOLT+AGtABrqgcOv103vdS9J3A/Xkp7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RsIEqWR7rz++zCMHhznX1unVs4LMZnLE8QyDNy/CiQw=;
 b=A3LIqWH/vOwn0MtfVCXkcNsSMKH9ycpyTTPx9N2pCIQUaREmH2TWi7FEKe6cmTQQPt5H5ri2iiQnXR5dUY9oMaPZ1RaxXX7FGNIpcxnO72t8QSl7drnGEOgY3WG0RE8hzr5j7ppeuKhBNyyBrXj5a6s76TfLd9d1YHnBh7MLkKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9070.eurprd04.prod.outlook.com (2603:10a6:150:21::14)
 by AS5PR04MB9943.eurprd04.prod.outlook.com (2603:10a6:20b:67f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 18:13:55 +0000
Received: from GV1PR04MB9070.eurprd04.prod.outlook.com
 ([fe80::fd28:f7a2:1bc1:53a0]) by GV1PR04MB9070.eurprd04.prod.outlook.com
 ([fe80::fd28:f7a2:1bc1:53a0%6]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 18:13:55 +0000
Date:   Mon, 21 Aug 2023 21:13:49 +0300
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
Message-ID: <20230821181349.hls6pukp5d6rc5av@LXL00007.wbi.nxp.com>
References: <20230610222123.mzmfjx7zfw4nh2lo@skbuf>
 <c702e2b6-cb0f-4ac9-86fe-a220284d45aa@seco.com>
 <20230612163353.dwouatvqbuo6h4ea@skbuf>
 <1dd01fe2-08a8-ec2f-1184-a58b2f55ba85@seco.com>
 <20230613142754.wr5njtjo4tbloqwu@skbuf>
 <20230811150826.urp2hzl3tahesrjx@skbuf>
 <26623d0c-8a5a-614b-7df7-69214aaec524@seco.com>
 <20230811163637.bs7a46juasjgnmf4@skbuf>
 <20230821124952.mraqqp7pxlo56gkh@skbuf>
 <a2e3fcad-9857-f1b3-8ada-efb2013a4bf5@seco.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2e3fcad-9857-f1b3-8ada-efb2013a4bf5@seco.com>
X-ClientProxiedBy: FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::12) To GV1PR04MB9070.eurprd04.prod.outlook.com
 (2603:10a6:150:21::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9070:EE_|AS5PR04MB9943:EE_
X-MS-Office365-Filtering-Correlation-Id: a3ec30c6-b72d-4717-e43e-08dba272612e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XK0HHKCMnE2WsMcOdbc2qv/wtLYXFLNz6RFtfJFxILGgdR0MhWa6rCR3iiKlVspaSIv8q6CxJFdB+dGVuaA0Zu4b0AxZ7dSmLEZ0ek29Uh9JrcZBeVV8Oh9i7ipJym1FWPgm0yCkryQNrNuFzfMr6yCnOf7+eK0gMKxlChl0x56w09XZKLCQrK5gnzP1vwZrj56AXAfVI63mgOJ3nzmw1dkLVbiAUtBWs9ZfoyUZtD6craus0rE4NrTW2uaCmxt/IDp/F01DKgPmXW5PJCy8lj1MPXKGaZ57EQY+o7/UO7/MQhPICVzDHmPeQcHS/Yfv3DJ7fwgFdNozc6JOvOlJ/iTkBUv5Jjwlh1ClaqU5sGKFoDfF1YmniQtSkF8Gz8fKVBjTTMOy7w6OE6+1xzwaEZoNlGA7O60F/eihUaS31K93T6mCJfjwzZNSVyHOorp3UfPvEdhDjlClO5Y15vF9an2h4MYYaLT8k+sZwbwjSOA2RtkymfQstxz1TNs72ELo1QxGcRbYjSopWk748uYqU8oaBlnpCCAZksnUg5P1acU+h3x7pKfcLeBTX7/YR3C5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9070.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(186009)(1800799009)(451199024)(54906003)(6916009)(66476007)(66556008)(316002)(66946007)(6512007)(8676002)(8936002)(4326008)(1076003)(41300700001)(478600001)(6666004)(38100700002)(6506007)(6486002)(83380400001)(2906002)(7416002)(86362001)(44832011)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yW79P8ege2IRwCx4iXxWeOwZRKIL3N8WOpZi/d5MNIQsonUY38N8rHTFPbZV?=
 =?us-ascii?Q?XxxGRDAwEkflob74w36RGwSKcmSs/A1PEkchL9LTVqKgfq5NKv47DKun7b+3?=
 =?us-ascii?Q?7zJy9Z5Y1hRnXxagmnSdaTNnNm6XGBlEC3vEScDg/kdYcMYA0gdjZE6DXMPO?=
 =?us-ascii?Q?fydtSivG9xg5oK1CgJ/OOtJgN/Pg6Ffqymzxv8ywFohZDe/IJErm1KjgGjWj?=
 =?us-ascii?Q?a1ZfryIsC7Fmap5+iZwWxvj/LT/xflO4l7+T6701J8iR+gK/M6VR5XZfpKxR?=
 =?us-ascii?Q?WUcsdCVIBROy+aIHcLTTlpvLCiKAWLUNfFli9UxPUUCOUT3Kmf6YIqJtEaEc?=
 =?us-ascii?Q?VdtSInkWLKkkJHHl1Zr5qWZOnFTb4I/HQ3fLVj0FLZ/kg8E53MZbi7pmnMpT?=
 =?us-ascii?Q?sRUYii5gjXiUBo4Ha5GrPvnoaDbd1L7BSfzEHvUwek8xqt2G2DUlHnPBIEwL?=
 =?us-ascii?Q?8cz/2Wq6VkO2waDRJC87EuPVO70CtEwC/Lo+8CBdn3dSTsvu17eLJz/0HZED?=
 =?us-ascii?Q?K5+ILofHeNauuTxjWl0aWrOldxP6XZ3SnjmEnjmo4eT91OgF241FVjRLPUTV?=
 =?us-ascii?Q?Hl8h7H+Q9Ads2NCEwAPtBrxpmmtouExbTgKPCguBLBEk0c1gMclGfWT027w4?=
 =?us-ascii?Q?FPdPLCdYWyku1KgGKr2SFdSrrZuA5vcw6VMUrQx4tUmkG9OSRf1ah7XmMV1J?=
 =?us-ascii?Q?+hUl82F++M3Zx0DmJPpGfibaa1wMc35eu8EdvQyixdsmJugRCPiPW1a/NOB+?=
 =?us-ascii?Q?676Q03yvBG/flr+Ap/nRFPJ5nTZ60l0rnkrlWZiOaGsA8Tkk+z5lxVCETJC9?=
 =?us-ascii?Q?HWuB0cK7MxRBDoUBtNiB3tWcdsEzMQ/wNySEZfKgUHk20NIlcbGNNm16hM94?=
 =?us-ascii?Q?nuLSPK3QMa6WTmpUeym3bma9tM83WgUXbvqAAanFfwd1mBpDK9Wh7Qhio70U?=
 =?us-ascii?Q?kK9Rgdb9FjjmqFNLaL1cipM+6xaiTe0m24v5v7+u85t5Qu8W4VzqjOoLhSsA?=
 =?us-ascii?Q?+yY8Y6PcrdMiqBECiMaNf2nyuvumArRrq0QyrR+eGH/3SoqAluquTCBVzKPT?=
 =?us-ascii?Q?K2BqdiJAa7DmGDIQ6G2XYJnS465DB+w6S7ToEbkZqp0oziE0LY4bm0YaKAsH?=
 =?us-ascii?Q?L0fiBQPpUfMvmH9E02f8FEAayucMIjmIg8TBcEj0rw3Sj4kMtNSCjBSYXCE+?=
 =?us-ascii?Q?5ms+v/iQiUj6Lw3B9sB3p/ULl/mh1cB9ZZ9D2dZ9jPhIELVKVBXqr7yacKgI?=
 =?us-ascii?Q?C/vBFzNoKMJjwLyuH2weQReszxHUZZdslfsyySljVnd8k4BghWwnelWscekl?=
 =?us-ascii?Q?6/3Ma+JAhb3OOgJsd9TmKq2V486bpP0V0mQsCa3CH9/ovnEj4w58TLBaPHMQ?=
 =?us-ascii?Q?PbMQ0wYXezdKjOZxfTzDfrAIwO/mbQ3ljAfmyJaUjNd1hwW9E2lkh/TYSehS?=
 =?us-ascii?Q?MWWkazIiqY/IfICcroLBCuNdxFgBGUtcXM2yK+A+0TmJ58Y6KkjTSjf2S/eA?=
 =?us-ascii?Q?9YJQwWQEE9RQ9KDq/EZ3ekTF+2V6V6lThi1zvykLj6s1RuBW/LfzZcxo/ORW?=
 =?us-ascii?Q?DzzAhgGr8vAipFroDugUF/ef0qIGye5w1tqAAebT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ec30c6-b72d-4717-e43e-08dba272612e
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9070.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 18:13:54.7060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XXo8bXiruKSLp6Q6/kk0emUV8Xxe8Bilatlh2cs4lY4Srs30PJk4Az6ABwzcHKMboylPxlimQCMy1E9zZVXw0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9943
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 21, 2023 at 01:45:44PM -0400, Sean Anderson wrote:
> Well, we have two pieces of information we need
> 
> - What values do we need to program in the PCCRs to select a particular
>   mode? This includes whether to e.g. set the KX bits.
> - Implied by the above, what protocols are supported on which lanes?
>   This is not strictly necessary, but will certainly solve a lot of
>   headscratching.
> 
> This information varies between different socs, and different serdes on
> the same socs. We can't really look at the RCW or the clocks and figure
> out what we need to program. So what are our options?
> 
> - We can have a separate compatible for each serdes on each SoC (e.g.
>   "fsl,lynx-10g-a"). This was rejected by the devicetree maintainers.
> - We can have one compatible for each SoC, and determine the serdes
>   based on the address. I would like to avoid this...

To me this really seems like a straightforward approach.

> - We can stick all the details which vary between serdes/socs into the
>   device tree. This is very flexible, since supporting new SoCs is
>   mostly a matter of adding a new compatible and writing a new
>   devicetree. On the other hand, if you have a bug in your devicetree,
>   it's not easy to fix it in the kernel.
> - Just don't support protocol switching. The 28G driver does this, which
>   is why it only has one compatible. However, supporting protocol
>   switching is a core goal of this driver, so dropping support is not an
>   option.
> 

The Lynx 28G SerDes driver does support protocol switching.
How did you arrive at the opposite conclusion?

The initial commit on the driver is even part of a patch set named
"dpaa2-mac: add support for changing the protocol at runtime". In
upstream it only supports the 1G <-> 10G transition but I have some
patches on the way to also support 25G.

Ioana
