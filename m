Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA58550DC8
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jun 2022 02:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237348AbiFTASg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Jun 2022 20:18:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236587AbiFTASf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Jun 2022 20:18:35 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2133.outbound.protection.outlook.com [40.107.113.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C0DE614E;
        Sun, 19 Jun 2022 17:18:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YF1saUTkSzqAZuGz3IJGzHZKqGA88NMONSoQYhBztb1IMpYZPq8qFNgmJ6FMTcowOzXkLSH6V9BxsPQ1vtcXcYx7cVqZwtX/+gufs7RedglZHe60I15Yam7BsZRgpx3BSQPapHBOnRmP14zieiTR0KYgp9OZuuPuJDP21A0pWNa9YXPdA/cxTaLP2Z0q/eYfoo558pDOihPkGRDfFxcNe8kW3Si8kHb6iKmKnQI5NzYjlA4KLYtwLPbMico83eVRdevlCnAoattwjkVJ/VMV7hQdcbQ5/7XaeD28gruJ4w+y05fjlGOd3A0rtPVXuZMEQ9rcYiOR23J2KLOv1Tshag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VE5lvwT/oTJMoQuwL/WdsHBoJWsRL2RfXSIHOYPj/Mw=;
 b=iAHQiHpkOzRb+ubHXcLX2luaXwrreSCutP/yHc1p2zoET9bIQrFkkRLBWt1Os2kzhS+smmVF+sp3EdFadU3CoTKkoLINA6Olbw9O3nl4CwDtLGvfC1zE7CA4ADpHvLcOaHcgAFTp4CsIq9tCZ/71d8lKvAUTqzKIOOUBhDhgyUEiB/JZwr6846SI+2UWucN3mqPJBcuVzdCWkT4HkILxPDrDx8QiGyEoJVUrPVSPZiZcGwG6wNrsLj4wklwQ/5j9aCTvnNOQ1JCjfE+d+aDfPRkAMO/dsDf8tE7VpI5dSKexEIo4QW04nwhkuvTgNiBS5hrwhdXluYVSZ3fK4hZreg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VE5lvwT/oTJMoQuwL/WdsHBoJWsRL2RfXSIHOYPj/Mw=;
 b=ci9/qORRB86Nquyms5MwmSMUaiW5QchdvwtGbbv46BtC+t7fygnmflb5svyHpkIFslwtyBC/E4rUbAVgHrWC9eei0PuSTOdcL7Q1ZjSnGL0ZnLG7V1DsaLApZkhlQrDEcVUyYy3N11ZMpamEiRTUW0OBmkJnhZR6UEOKl88OEv8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY2PR01MB4057.jpnprd01.prod.outlook.com (2603:1096:404:de::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.17; Mon, 20 Jun
 2022 00:18:29 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%8]) with mapi id 15.20.5353.021; Mon, 20 Jun 2022
 00:18:29 +0000
Message-ID: <87sfo0mbl6.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 03/21] pinctrl: renesas: Initial R8A779G0 (V4H) PFC support
In-Reply-To: <CAMuHMdWU31FB90yn1MTSUyF4bfSEXnpaO2-tkXNXNQs8SPwWCg@mail.gmail.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
        <87zgifkcqa.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdWU31FB90yn1MTSUyF4bfSEXnpaO2-tkXNXNQs8SPwWCg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 20 Jun 2022 00:18:29 +0000
X-ClientProxiedBy: TYCPR01CA0110.jpnprd01.prod.outlook.com
 (2603:1096:405:4::26) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a898b6b-403f-4d82-d50c-08da52526704
X-MS-TrafficTypeDiagnostic: TY2PR01MB4057:EE_
X-Microsoft-Antispam-PRVS: <TY2PR01MB405714476D8D8119FC38C457D4B09@TY2PR01MB4057.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lu0lkHPElp4MoDWT+g00Tga5ugAlGBt9ANHrU6vfhw9s6JdyUfUYEh/CLHHE2YI2hK0UN2AmVBrU6SkMlqKlYA1rMkZjHk4BTW3fq8d1XL8AZ6/q1RMqDlY7KpumHZtuFyuaV1QKcOPXMSIe+BRTrIYpSY+pmbkOAkz0d3AAtCjEZIhOXtjPJx2VUyK/UiKZvE3mL7bRscC+egHLZk0mYV/w7KySLn8S1w4Tdeidc9EKTbePxhjrONfxonIDJxrQFvg6QpLkUzP+WqoiizeZMhsU+udLI8cz9yvmix3a+ou9Kd7ywXW1/D1W91BUZJ3cRIyeW5igZwBh7ryTl0zTgBs0zvLSblNbtH6gMpnHt+jFmdJv60b/94ahOTutVn9qBAdDlnKBzyUI3WgWz4orb9wufK+7tf6dSwT7bHa4T7uCPGIXQ2FNAmoO1TFDg+fU7JMTedL4jOLHpiADzsb5w2IwphZwxb16kQoR0bABefR/sBPyB+KiJp1DuTpNfknrRPNoreVgvd8hVmUXIWvqvfo2UVUTfiPFG/aVjjmZFX/2spZuqTXsFPM2JtGWKzcZBFrUhlEKhSsgeHV5Hjx5jqwimTOkKB3yzaNTqRCK95J5Snxn+Oh4MTQO0MSyZoRQRgoQt5ApF6gwqzhNjurNlcMBCXPWi0Rro3i5/qSov1JkCAwGSHu1sGCoKBdRCnH6PaVMXzwWC9bJX4t82AmQZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(4326008)(52116002)(4744005)(54906003)(6506007)(6486002)(6916009)(86362001)(6512007)(26005)(66556008)(38350700002)(2906002)(8676002)(66946007)(66476007)(8936002)(316002)(38100700002)(5660300002)(186003)(478600001)(2616005)(41300700001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yJZY6m7B3iG3mMAzF/2Zu4StCuRKWALG0vrcOgzKwNGm6jAnd9JjJ68YnGF6?=
 =?us-ascii?Q?IjgTePEMhddq+gXf5chuAPpneabv5DIKhRGuppWN5gSsB6zAC4BzjWM2M8kV?=
 =?us-ascii?Q?8kT0zng+C23joo0JKhdndMFn44EAM6EAVDITad9PnuoGm5Zm3CoKU33XEwyi?=
 =?us-ascii?Q?naXS3Ah+Y9z/FmCmfuCk8XvPyvqqtRIb4Z9BhKxzJ4aLhrxE1S5/pHpSDFNS?=
 =?us-ascii?Q?Tv1JK+mfpxpCNFlg3Cg9R8O4G9YSpuoBzrWRtbC4+J9ObZmYXJtnHrE+jla9?=
 =?us-ascii?Q?J7rQXPGbKgabI1jAD6BQRqcj6NWoJG0KcbOmVMF7utuPmiKYcF/JJ0lhqS7h?=
 =?us-ascii?Q?vGYZchr+EY4f+hX4Q+jqdGJqkVTRYVbNLO7foFzHlae6pxU5ROmcLg11s5Yx?=
 =?us-ascii?Q?eDqfTsF1iiAoHJeeVif7o5OIXYR62+H8Z3y4dXSqX+JDFTasAqSWYGw8g+QC?=
 =?us-ascii?Q?QCFCElAHS0EB95fY+1Lm+CKjVyCDMvE3hYAjP4rzKo/mRbdUPSHKkzzI2fdE?=
 =?us-ascii?Q?Ci8yYubg2jKVzRsAwI+Zy31Qf4peLQJtMaq+lTCh4/xtu031O3SdngsYeE8n?=
 =?us-ascii?Q?qDq4LaCWWdvzF3/H5cCvXmz3Af48IpqYXhXNUVSge+vMSwG4VvSeNYcSN/2w?=
 =?us-ascii?Q?/Rb5sxk2O38HxOjkiJRzVD7aJJpqcYGJp2bwjkvqonw0qymJS1esDA0qdI+I?=
 =?us-ascii?Q?k6dGFnLLqKenB2/Z3rD5/AYzNwnpDVkHNE0GX5q3IYcf4XnDo6DWtg57vpEM?=
 =?us-ascii?Q?TxM2HX4M+Kye42TebdNcp5PFDB3bfC0CDt2vcemb8ltq1ilwAxupIykM76rs?=
 =?us-ascii?Q?by1VQQfR3AI8mbryLamrs/b76YFZ5N+7oDAgd9DmTHvjXX6/TYg/7i+E2IiM?=
 =?us-ascii?Q?AtGbhfRC/vLXd6IDviRStmBSTP41QvTbfKw5CyELtJna95EvruL+x90zbLdp?=
 =?us-ascii?Q?lSXSG/ezEP/SiuoI2ayY2Wia+p/aPaDnPkVpqIl/qv9OgQBOV94LLyZNkpSe?=
 =?us-ascii?Q?UT9GoirE6Au2dYIb/lSqd76lrDRpX7V0TwQjNLkJm9F1eaSg7D3z47EJ/ILS?=
 =?us-ascii?Q?QCBeJwpjdmM6EJ4NDLoXqn0pRdG0pHXh97vPzNf4GrBO+JeE6BOewY83zS4a?=
 =?us-ascii?Q?nxgLkmqdzLo/RdKMavb0Q4WiOnHFK6+I71tdb9dbkLJfB/wIvHCPN9WNBuK6?=
 =?us-ascii?Q?yslYM/mCf6++G9W0+Pl1bm6geED//pddQuHqt9bbODeIXqK8t7W7N/RTeqnf?=
 =?us-ascii?Q?bczk7A5FWVgPZed6KNRIa5TJhcXfHU5xZuxka2KAw1JuPKLfYmfVjiUni/0G?=
 =?us-ascii?Q?38arCmMj4dgpNpKUg03BvhbBicKen8Sk9AvCCNpOdyIQ5GW7sOUD9bY9TmuC?=
 =?us-ascii?Q?Blx6Oz7KN4eqtoa1/McYCkmk5cpcrIrpHc+5qGAYto6Tks5vw1CV4EGNiFtA?=
 =?us-ascii?Q?vmCYO16lYUhJiOxzfyDJnw05gBcKB7dzrdKHtoB8gCvQKayj3r5MtyZPI8YP?=
 =?us-ascii?Q?KRMjzXr+KA6T3yyf+GSjdEyOdwEXicgH4AKE6bonUhZqItBkSQdoN4F9+sMV?=
 =?us-ascii?Q?NcaBoTQ6bbGlJv1h8/k58G1xoOoIDUyJMKTu/gh1pvyFELYqMKoDAqB0BQP+?=
 =?us-ascii?Q?r5B6VqrjCLmh8nnKiVslfUX9TQhs55UzF8/5fQTj+OxIA37r4XLYPRchsUIG?=
 =?us-ascii?Q?PIBjfbseEnIjELUqiQ+vv2NVJILH43bxIIJWvDsL4o74MXRGbwiQrqg7eepB?=
 =?us-ascii?Q?wiKOPJhSv+iCX14DR139F0xcXAUFwSQKjEuLemymNWmiVdDWvWuq?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a898b6b-403f-4d82-d50c-08da52526704
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 00:18:29.6449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5oKihKCNEaSiH5kB+anZWTUAhAVvtxZRTsEyxSu7YfZc53JqI6bpczDvECI9ycUTTzf0UcGZblGRWsZpgGuXhbEJpWxN6KTCWF2/493RPD2juatuwNjhk5bq3gYCJ7BS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4057
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

Thank you for review.

> > +       /* IP0SR8 */
> > +       PINMUX_IPSR_MSEL(IP0SR8_3_0,    SCL0,                   SEL_SCL0_0),
> > +       PINMUX_IPSR_MSEL(IP0SR8_7_4,    SDA0,                   SEL_SDA0_0),
> 
> These are definitely still wrong, and not fixed by any of your
> subsequent patches: to enable I2C0 functionality, the corresponding
> SEL_{SCL,SDA}0 bit should be set to 1, not 0.
> Same for I2C[1-5] below.

There was such patch, and this patch series merged it.
Now I'm asking why the patch was needed.

I will fix and re-post v4.

But, 1 things. As I mentioned before, I want to keep original patch as much as possible,
even though it has bug (missing pins, having unnecessary settings).
In other words, the difference from original patch is only cleanup:ed.
I will keep current style on v4, too.

About suffix, I'm asking it to Doc team.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
