Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 616E654A2B0
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 01:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238421AbiFMXXa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jun 2022 19:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346266AbiFMXXV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2022 19:23:21 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2136.outbound.protection.outlook.com [40.107.114.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D48531DFC;
        Mon, 13 Jun 2022 16:23:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjM7kq+MDlumc8PXO2yGiKOYBCdQNx5mTwqQI0bzJlD9mAJz4/9g9/gAEIHyMhexB4wudQlZN6tDdmcstvim4ssgaequeYP3ydso1wfV9gmFlRgp9lPQ2a7Sndq+8c7QZUQiGnMcZ3JJun8kcih28Q8wwG3Z1w5wCchChgrxyS6AM/F0L7GWf860NNDDxzQr79DB+d4gqaIFtiPjYtldmziDpwV3f21dm542KLM1P3pzBITBXmO8HinMpi/6P0Cu2lWWloXF04tENDS6K8XbzD0CxxjfvXbYrM/nH7Xk/zBdim456bgXfkZjdB+aANDTn+aKl2cJgKxoptkSw1s1ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcbPnRt+hbvKGfVvis3t3c62RGM+q7S8i0cNU2tgWT4=;
 b=Vwr2aDuu0gxPNLVDDlKz066W1G9BPl3VdSzxhHq5jfACKZhxsoJj3j04x8ApvShI/lkomAZLcf7O1Ps3xBZo19FfgvkWDh7NPxwyywo0rRUvm9xM80LQgN/Z6/2NSIkksYsMce9/fyvOZTvAEnt2s5hweizGDl503LWOiLzKKGVZSVLWDGeDlN0WDF3/h9d3PltH0SRUA5OIr2Wf7FaqMjEHJ3GUTzzlC2wr7OBkPyo9vtg/K4Gn6LFUEhX1oqR7lm5yUAh2ToGl4ojekF40A16R/v/b2vMEctKSYpoCSgW9faw/r7wY8zd1rrUxnuQDLYym29PmWFZw9jqe6TSMWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcbPnRt+hbvKGfVvis3t3c62RGM+q7S8i0cNU2tgWT4=;
 b=Flmleo7M3WEGifR/1GkIcJO71j0HnNtB1aXkQsYlrosNzNoDij2OuwT3xldsL2WTvSctMfYI9HifWiXqku+nnnNQMN33mIcfPyxFPwniKVA61S9xz3qaEdVbLUhG4oFIZtWFMGQXcT0MxmfjFo/1gpDaGZ3AkfZPwtssyOHOtG0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB9501.jpnprd01.prod.outlook.com (2603:1096:604:1d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Mon, 13 Jun
 2022 23:23:17 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Mon, 13 Jun 2022
 23:23:17 +0000
Message-ID: <87a6agkv16.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] pinctrl: renesas: Initial R8A779G0 (V4H) PFC support
In-Reply-To: <CAMuHMdWUeynL0YSV4Qr25TymN49guTHLwVe2UgtFcHeyjJvvVg@mail.gmail.com>
References: <87zgipgu3s.wl-kuninori.morimoto.gx@renesas.com>
        <87v8tdgu1t.wl-kuninori.morimoto.gx@renesas.com>
        <alpine.DEB.2.22.394.2206101756520.828669@ramsan.of.borg>
        <877d5l1lv9.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdWUeynL0YSV4Qr25TymN49guTHLwVe2UgtFcHeyjJvvVg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 13 Jun 2022 23:23:17 +0000
X-ClientProxiedBy: TYAPR01CA0123.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e744faa5-f670-4de8-bb20-08da4d93b26b
X-MS-TrafficTypeDiagnostic: OSZPR01MB9501:EE_
X-Microsoft-Antispam-PRVS: <OSZPR01MB9501CF5E186FB760EADFED84D4AB9@OSZPR01MB9501.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6xMa/G3vGF5/HYc2x/GOPSjXH2hVmvJM+t32hqRpo+DMbkDCwpL3Qmd6vqKcwU66xzPEe/YzLJOb9qe1xo7gJMotvP2V3mkTxe5802YIARgeenqED8r5qZT6uEaHKiw0t2vd5CtnIUjwidBKp2/GDN2sEpxIKVX2klLmtXVvt89ok4+Gr+WOgzQK+3kcYsf3/NhyVA2Fytsg6yHP2MlznQXGjz3CGzzQa+MJF80KquQlf5VyeVhOT13J3sJCaDUbzqCjCw+RrGRaExX435p1EzTWFALN0gXZJbqn4N13bQmq6yhaQxVFlnJJf1xlIML9ffl9CHZAIaWyyBEaRUTgKwDrB2tIMFdaXtf9MLIPxREEmS6zKCVU1yQPFMPinUKJlqKjk4S74I/P8nL0c8bCdEToYgEVpBOwX9ZdtXxBnVE7y1377gXXxezLvOdTeicV4EV08zB2a46JAgWXeSqNMNWL4Uwsr+MdLNphy5tsNEAI4/w0ScWYoOFVL1RFhjgOUCDpyFHj4m+GlA1bfq3ebBzCv3W633yQiT/BkiR4fnPComQuNqlp3Q0AB9rP9ta54hi+S2p509sPZ0V3UKXgy2NnetmmqJjJSa0Gnzy9ZXlJvWfZOcdB6wmeFwh3O+jvreciwHfzIs/bhO6z42pqAUDjdu11PM2a+msituMq8KaubazjCtAIW/8meDgixY+69LJSPsct1BRzs/MpdGND1EO9zFWp6lwaClEjfcceLsw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66476007)(8676002)(4326008)(66556008)(52116002)(26005)(6506007)(6486002)(5660300002)(83380400001)(6512007)(86362001)(508600001)(4744005)(2616005)(186003)(38350700002)(2906002)(316002)(8936002)(66946007)(6916009)(38100700002)(36756003)(54906003)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vinCrZzkq5s+WGUou3ZreTgdJ/J7gEE/tJMcXFv1T4446pEOoUtL+iXbJKj4?=
 =?us-ascii?Q?Y7LzFuKAqpS8AoQG0FjTJn7mraobG+wa38AWpWiR/1TQkCUyFz5JjnrCxF/I?=
 =?us-ascii?Q?lWr3Cyaj/+HBK4/5IZglD32LEf2XCK239+p4QIDwJ9vne1ZPHXs1AS/DZIdZ?=
 =?us-ascii?Q?2ne/T3jolB8oZbk1k3YgHNBy0xuA7x7JLDHxwYgIs1zX5L3e4bOmhOhWOr6/?=
 =?us-ascii?Q?Ys4Ne6qpIERxPEk0P8IiQTzXWbJyi1VDxgcXt5/5MFUzynaTs2l1PpzQueku?=
 =?us-ascii?Q?uqqnkp9ZDeOa/LLul+Qup7SXZ8DtU8RsMtlA53MCFKAG/wH+3bn8J6MQ6e77?=
 =?us-ascii?Q?JVc21eZzutWC8KjOZzsNvSxGazTbNyDP3h84Yl4zt/K2PrflLgD8dj/t0vg9?=
 =?us-ascii?Q?4T2rMgjVBzrFToTzIrIB0cb5XkIPPl5ZdjJunV2V1Vz7pQqctujBiJjcy17V?=
 =?us-ascii?Q?/ZDjZbCjYGWPE3lXk67zQyImB2Mjw8bLNzMLlpQmBQKmFMoQGj0VZLhupk8/?=
 =?us-ascii?Q?zyshPHCGqyGD6JgdD7yyn46RYeYWDhVu4RLehBp51whdYCHIpfrjeKgPECe9?=
 =?us-ascii?Q?Df1LyE3iIbVbz8/d31Kz5yjwKUDjkFtmfX2zB5kO7d23Sen3OYUdkHOUviva?=
 =?us-ascii?Q?0kEooMsjtBsf0edHilFVPPskUATiPe9V7z6wpdfwL6RtSO9QJhdPWSAO1uvL?=
 =?us-ascii?Q?u8/pVAFW73ecUn/l//mytXxm5cFzeMjn1SdNEeJaIzNSnno2KJoxP0E8FCRx?=
 =?us-ascii?Q?li8cT6dSnHr7DrYufORsG+TQcS/Yp+9UWbW+wNEBG38O1ZaOr1umzZTfYWc3?=
 =?us-ascii?Q?fysVqSoZIPgeXrN35a/u4NdGr3kWTg1mOp1fKblL14YqNFl9n58j+1pFYT6h?=
 =?us-ascii?Q?IbqUcPBNZ2ZAVHPj+wz6VyyYbaWqYq7LR37n0pfYfFSQr5AH8QNNj6SUGEuT?=
 =?us-ascii?Q?b6PAII1dt8HyXQRtHDuhN4DfdKecxrfKFMwRTHiC4BFH2uYwQe1rLKQxVPig?=
 =?us-ascii?Q?5V/7Zc997CXw47An5G/Gzmyd3QSUTntOCO4CahsIhCy0gJFLdb7JmzZO/f4O?=
 =?us-ascii?Q?+7DQnQYX3OLlWtqung/uVTBR320RcVMQCKreNt7xSYaiBQWSVGxLrG9mlw/l?=
 =?us-ascii?Q?wHmD12DAp/zlyz8JeHcHRoBT3j6igalpyPLwkNf1Wqy2/xiksDDiC8HG/yaC?=
 =?us-ascii?Q?2iwmFSivXEZY9uav5o35vX6GLg5M9cS7ab3IV+LRGJI1sXn6jvUHgaNk6Utj?=
 =?us-ascii?Q?on5hZ03bGurEgJ3IhfYrHCes7vM7XLf+ABEaJpfwYwt3s3TzCYJ98WFhkv/C?=
 =?us-ascii?Q?23T/Jdy367XW7t5n2sddFUbPwOFdHEZLYVOGSDiwR1QU7efvbynkssRoTcIj?=
 =?us-ascii?Q?eh8hR3XeCQZi80xCT9Bmq6C+T9/gyyfX/KbIQtWqmqOM14UirmnSTqP4iJLD?=
 =?us-ascii?Q?yhWG8y9XR6X3s2VUdh0CRyUFlsHtHumx7MYLsmTrsJARLc6tHABwJeHzfeRC?=
 =?us-ascii?Q?AtGv6ajm58Ki/2v+ui2OgfAJAHA9NPgoaWLVXpY8sKz4DVelUDl1oV7kcete?=
 =?us-ascii?Q?HzvMtmoX/eIkqaqlEdiOTHMHJrLL3Uqpw9AQh7sDIJoxRJJjYJcwYeHxneVg?=
 =?us-ascii?Q?dj8JYkmU4y+SgWAFi/iUD2ff5+9Hyt/hKYrEC3vYAkZhIvVSDBWaN96TVTEC?=
 =?us-ascii?Q?Q1q9OzvvAJIJvXSuAs0M1wmMOdvKg1J3J73EKvWdpoT/c287wwAoJ/vHwn0V?=
 =?us-ascii?Q?7EnX8oYJezFVCP+j/2ef8jqWl/yc6cNM6N5/ifRyGZiabthO5JzC?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e744faa5-f670-4de8-bb20-08da4d93b26b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 23:23:17.6376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1+wl1vTPWEiH6tgaevtaROw5kPGPJQsl6nMjvbQbR+FTQ4894Ez1GbyPGJgMQJcpj8lrNSBTsS+XG4oxN86FY4x0lM1lhUXmTu674FCCx94i7LIQoX+DP7UgcTCjc+D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9501
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

Thank you for your feedback

> For missing features (e.g. missing alternative functions, missing
> support for using I2C-capable pins as GPIOs, ...) I agree: these can
> be added incrementally.
> 
> For descriptions that are wrong, I disagree: please try to fix them
> in the patch that introduces them, if possible.

Yes of course.

v3 patch of [3/4][4/4] will includes comment fixup, alphabetical order fixup,
variable name fixup, etc, for each patches.
Basically non code area.

And, it will have additional patch for missing features
(add xxx support).

> Unfortunately some of the (lack of) set names need confirmation or
> clarification from the hardware documentation team.

Yes.
In such case, I will use _X or _Y for now to avoid future conflict.

> BTW, do you know which devices and pin groups have been tested on
> actual hardware?

I didn't test, but [4/4] patches are, I guess.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
