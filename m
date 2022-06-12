Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB3F547CFC
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jun 2022 01:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234988AbiFLXvp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 12 Jun 2022 19:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232350AbiFLXvo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 12 Jun 2022 19:51:44 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2091.outbound.protection.outlook.com [40.107.113.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18EE928716;
        Sun, 12 Jun 2022 16:51:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCPBkX/RXwAwafJsijnGmsLaFjKlWkaDN/2mvJcfTaDS2oDKoxnBFISS+ibCRBmB7NrltbB4WXyQjjkKLualGwStUzUNafWjowGNDtRnz0CHACrnfdDi/A7uMBTcUdenXfR1fEkuAoiMzrjubMIjVk+WyOySy3YW6QUQEwcEx4KTHaseSdjVJsEwC07OqIeb2sRQq49OmeO1uNBeB2NBvG7xSwxoQogGfP1F/zBtfprZ9o6Q0ERtYOJReDfADBqCy9q0wrGhsducK4kZL6ZTKscXobWs/DGn3PIBSHGssmJB//BEFe8Z8KjBWy8KHAmNQInmpXwfijhtUr2QyMRAcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlC56lG363JgV0Tm5utO+JQs9BAtIj0NODa3a3BSbc4=;
 b=gt7aLTGw7er9xzvzni2c5Cs1LOXYJ3KmQVGa6UbdO3/O93slyYSuJSnQ/G51kOtMipfYyzHIJ9IGsRu15BldlcjW7cSnwHQRgvpj6lnc8FAK6UQzyeIrRhdzEZ+FrK0YtvGFQdrUHrF76SQzCrHPGj9ad2toU0uI0ZLobd51iPSdjyS8KQmM3KaUTTvTiwy+m7AVJRPJIvF90diCVP8/Bg195uRPsToNVnOpvnNoslYLf6wrH0e5V7xVNvmEqb25oSb678DBcmphdBCyIQnHR72VToCM1jzXuB2jsHUcG7LMuTqowAwdnCHIYYytAOE+oOeB3kHKhECmSpCMOf4TaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlC56lG363JgV0Tm5utO+JQs9BAtIj0NODa3a3BSbc4=;
 b=hMA0uysIiyvRqNO/gGJ0CwGF+PpxIb7gy3pIQ6xCQ7keZP1QMpao+AJrK5pAaJX4MnVCO0xKsFYzt5ngP44f1V3XiTxrU/6roJzohVNAYyOzSCJ/E2vGrBRl5aFsdztcGxBqBb1CgAL0Vo+yEHEt1v9/BrMWtmJXmlTESjIjqs4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY1PR01MB1754.jpnprd01.prod.outlook.com (2603:1096:403:7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Sun, 12 Jun
 2022 23:51:39 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.020; Sun, 12 Jun 2022
 23:51:39 +0000
Message-ID: <877d5l1lv9.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/4] pinctrl: renesas: Initial R8A779G0 (V4H) PFC support
In-Reply-To: <alpine.DEB.2.22.394.2206101756520.828669@ramsan.of.borg>
References: <87zgipgu3s.wl-kuninori.morimoto.gx@renesas.com>
        <87v8tdgu1t.wl-kuninori.morimoto.gx@renesas.com>
        <alpine.DEB.2.22.394.2206101756520.828669@ramsan.of.borg>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Sun, 12 Jun 2022 23:51:39 +0000
X-ClientProxiedBy: TYAPR01CA0125.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f0457d3-a0c9-49d2-f9c3-08da4cce7ea2
X-MS-TrafficTypeDiagnostic: TY1PR01MB1754:EE_
X-Microsoft-Antispam-PRVS: <TY1PR01MB1754F877FAAF6E9B6D3DF465D4A89@TY1PR01MB1754.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3VUlK9H1gv2AwCmwS7Ww59qkdyYOd/88axWeVhlUPI2gtEHu1rU0QdD2Z8xO/jI1iURnCKMPa5toYtIOVhniH3cv09+w8HbqPxUg/fWV5xR15kFtvqM28NVePWUQTF9Sqjde3DJw2FzELo+Hw7W6ftU20+/aD6FJBhZUyHKYXnUeNnk/CC7YaPtOBJ2x+icULKwuomGtqSOBqtVdeR/aD+DHMAQIfLfEH2ZJ9NZDwnxXvdwU/tWV7XUeW0RzJo5P/xcGAJCeHGcT5BX6pbODyonwvR0NO+cSgQc/rhayvxdUE1LGWiTQZbbMMO9Uh6mxy4PfFVk9KeYcFAU4I9Tn/mfsgel576nv+UGeTnYXnU+ncehbL/X5o84XmvBONritC0rOd7ZXu2cb0ZJR/qMGWrjkPFTus/gtxFWkoa/tfC2YoCZu/pfNPi3MbvDxSBwGIV7ajVEHcv4qNcQy2v09BU7d7mL7QIu3Z1SLBW9v694m+DgxG8PMEcAQ2NFQCX9hHim3Zp5FWVvkb1JCePzb8BuNaMAwOFACwmqwQ2rp0r/GskMiR0b9oaxWx/YMCxyppz54pstczQbC8sW3pPGhtlXFjL8GEQNm4FIkV+wdnqYx9DO4N1RXSfF9uCb5Y2gXajVbR5ZNmfPlYAy2g1iV4N4qG/bwSAfK5HxiOvLzXlhZeWKgVKSwc6THEpFGQuO8H4BVpDbijduu+ZwR9qCb6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(52116002)(38350700002)(38100700002)(6512007)(26005)(6486002)(2906002)(508600001)(6916009)(54906003)(6506007)(316002)(86362001)(186003)(8936002)(4326008)(2616005)(66946007)(5660300002)(66556008)(66476007)(36756003)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HS1vS6BqlVYYukknphnQYaUfF2nn1TpGtnFfK8FacLSUgUGP2VhEfzVJnZu8?=
 =?us-ascii?Q?ZlpeC7wPxvn7PC/SiNDLeu+AY0OvkvrXhZ49ZcXxnoU5TE1gELkPhzZ0e6VA?=
 =?us-ascii?Q?zBsWCtzsY38GyU7zd/+IDkRqCWNAGTSacm3XJG6FqChUmhT8KGNcdJsZj5Lt?=
 =?us-ascii?Q?xpO+0Rs+g5fVAfvs9htPLPpsl+XlA/yac4ZXFMpE7fHPVkcneLHnXMiDtrNy?=
 =?us-ascii?Q?f4FqlHi42JiD07G5zM5xuRH9TU4wbhAjesrk4D50tn2jgchZFPnZvjGq5Lka?=
 =?us-ascii?Q?rex7lpOX14umOkhWaQkunUqlYIi0gMOphUwKKp3fOYvsRqE7w5wFfhJyF66i?=
 =?us-ascii?Q?TsENC3RU2a1VeYz6rIxDuFQGbRVR0t3f7arG8BHBOBEqNfKyaHz97oea7ii/?=
 =?us-ascii?Q?tJHwMjidZ0LTJd18gCfsnuQgtreoF4OG99TIFUBSK8JsDMMAQfcbHnJUKA3E?=
 =?us-ascii?Q?Q+p6WFyIt/6AcX/cBegEuxkBpUpSrs4YZjKe2jOEYb7KoUnAqs4Qsidrdzoz?=
 =?us-ascii?Q?xLnl+tL5pW4Cnhd+LeErxZ1zJaZRFH7pqer20Abcgaw8RXlip7pIU0IEyfT0?=
 =?us-ascii?Q?bZar4bu++fqLYZEB2HcBH1O2ltIXvaEgtbgTdc5wxcscyXesKAhfS2TiMd1O?=
 =?us-ascii?Q?6xm+/5MC6ljQLu6KXmynfQNf1JTQy4PsEeFvJBQJcH8slYZTX2aRRuAefMbu?=
 =?us-ascii?Q?FU9oAx+2pNJ2rLSft1BaTAJWefwSs7wyy2UbRfOERlKcx9YS7CdlHeGMURM7?=
 =?us-ascii?Q?7Wqnf4H6trM2TkUAh+DXvONrqPefcSmoAmwG3KzC9GVtuVGTcUhdjDoEtrpq?=
 =?us-ascii?Q?Cv8lDZnQW5vSnxYmrMy5ziejKKkf6Ms2W49E7cJL1gZZRzfIUG6tfN7xu0ky?=
 =?us-ascii?Q?MvC9gHZgArRDVtkqw0bNsuJmcJMjMBoMrhCbkyycOwSSH2Jd1P16pccEg/Bx?=
 =?us-ascii?Q?u5ztLwmNxf3Z6ekgXibI3M3tPOK1e7cIMmsKrAzaiztZWL023SL6NFV9hH70?=
 =?us-ascii?Q?/L+jr1haEhx8BYIA7euP7CvwfrSf+ko2nC3jcvNfg5y+Be8h/sZC8bTafCpl?=
 =?us-ascii?Q?F4mI0StXD9t8cuEGC9SrP1x98XtzXZ7/Zohm2Ars5C1FFSOowuslglNuDIwY?=
 =?us-ascii?Q?OrBekuAlB5WuEHIPOh8wHf+s2NyuQ7YQKunu9hBEUnLW5/H89w5ftCqIdwLx?=
 =?us-ascii?Q?E0G6GN8Rt0FzzoswRDKT+Lm8P3ctVr7VBJvJlMSOUF6KxP91b/k7dzkIS5A5?=
 =?us-ascii?Q?/9fjnacwJxM9LR0ttNpLAIhQsJQ39hyQwwL/ey4YxUJxVzDjhY7UYC9+9D/d?=
 =?us-ascii?Q?k3ooz2umWUopjkA9tDNHwLdfGxpqTD7/6sCnMlUoxSxMUak5mtx4L7KGg2XG?=
 =?us-ascii?Q?nljd4Q5BbIqHdsG0ou6HODmy8SWOx1wNedEwG53w45P9WpRHo8UvU6eYdwCg?=
 =?us-ascii?Q?eXuqS4w0ZDiMPeDVK6M4EImQUT77nX4gewdDeA1bpGnqBI97n3fd0lNODkBd?=
 =?us-ascii?Q?JcEcG+jIJPPZKu1TSOkZagFjIXenarDNX1l8ac/exNEUDY+5NFIxjZiEOsYz?=
 =?us-ascii?Q?nEJSpuuOZoPQvblso7arYkQG91sTHTUlkiaDh3nmVh9jVXSoo2+HqwXV/pNa?=
 =?us-ascii?Q?QWNbf8964vkqpzdY8fuVewUfvUD6OVrSIW070V3OCsrfCqGAZDnZJiggtEj/?=
 =?us-ascii?Q?pCpIRr3P4E4V86b9hJH8nZYg/dQjCnU5oBSPCfCx7z0GVXi/1/fv0Yws3KD+?=
 =?us-ascii?Q?2qr3am0M2EHJRihaRXpHuV7PQyaU3kwbr7x+TrqN4XJ3EXG641qc?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f0457d3-a0c9-49d2-f9c3-08da4cce7ea2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2022 23:51:39.8711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xupq5ZsignQiHdUJIGOzuHD1VfA6hYUB6K5/LgWwcySB/WZxUnh2faINzUjtSPq+W/QcOCef7uODnb3FLxV4G24KHg0JjeNftSv2T/5cOHGOqvcP4KPBeWoky11u0ScE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1754
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

> > From: LUU HOAI <hoai.luu.ub@renesas.com>
> >
> > This patch adds initial pinctrl support for the R8A779G0 (V4H) SoC,
> > including bias, drive strength and voltage control.
> >
> > [Morimoto merged Kihara-san's MODSEL8 fixup patch,
> > and cleanuped white space, care reserved bit on each configs,
> > fixup setting miss]
> > Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Thanks for your patch!
> 
> Below is a first set of comments.
> You can expect a second set of comments after the weekend.

May I suggest ?

v1 patch was almost as-is of working implementation,
I did was just cleanup.
v2 patch was tidyup implementation which found via runtime.
So far, I think we can say "v2 patch is cleanup version of working implementation".

But, v3 needs too many tidyups, and it is related to very deep parts.
I'm very afraid it breaks working implementation for some reasons.
In such case, it is very difficult to find and/or fix the issue
because PFC file is too big and too complicated.

I'm happy to fix all of you pointed, but I want to make it as additional patch.
But what do you think ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
