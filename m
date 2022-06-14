Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF1B54A903
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 07:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236692AbiFNF6o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 01:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346255AbiFNF6e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 01:58:34 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2105.outbound.protection.outlook.com [40.107.113.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29AFF33A26;
        Mon, 13 Jun 2022 22:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6UkYJN+5sDDqPOQKnnIUaPLzS5F0txyyRiyAkO8Mo0szCmnRtdLz/pbSgdaioCXy5eowJS7zSQVTm+68Vz5fHxupjdhZqK1D0YjzxAUfrB0rLyvXiWol7EdfxEcmg65QdC+DfvYyH1hzizuydtyYYV1BFikyzGQ3zRGNpJOdB1zwklvBFTV099ZEtWWO7S8RK44h21ZwvV1ag+dTAcC7+ebG/t69vay8hgYDf/jcitX1ql+O3tT57AHflnCqfYYFGjH/BrZ/6d4ycGc/stP3eBNkW98OIosOnevYuXdWUmLQBaw0eM8zRAlBCBJUResMmj3jFdhlie8FJFkFBwbmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J25OCSGpaPgDw+jPjFuRZ4uVwwouJy+2KnXihvRVmmw=;
 b=J17bLrIS4gX7UqZPdJEBQjpWvzuXMrw145D8hbGNubqbIIPBLQ35fdbXCw1lL47STJXbgJGT6uBI4DfR9pxky4AMmg+f9XTdAU+YHfyhe3/bo8NBwxUzqspkx0t6/ug43BPie1dfWCRCCl6hteCjEajyqigvczb85MkV+0h96tTaoCBk0iTMiNFxmvModl2UmrXBU/46/ahPa4c8mn8rxpoO4OL+bibmiRX/s8+gb85OBNyzn++Pzb61ioQ5SY0zlKFRq4ruiSR4t9T5YG5l4pEIsXw9IauKsE321/agQc6Bqi8KNIXNloZBlK7erEtX8V6mrjxL7SLsODjaJDu9qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J25OCSGpaPgDw+jPjFuRZ4uVwwouJy+2KnXihvRVmmw=;
 b=OLJCOgcloeEn2J87C4CWKmppWACeoizYbfTsWW/jZTrVVbobcU3NGVV9CYxqt/ha2uN2v5dlfXDsJtLY1yYESxmPY4bvELGb927zarMv3Jl3BufEUvo0UWtCX/jgcrflbmXv9I6YG8k4dNtz61rdc2dl3h8t7j2NQOr31Y+DWpA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB3613.jpnprd01.prod.outlook.com (2603:1096:404:c5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Tue, 14 Jun
 2022 05:58:30 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 05:58:29 +0000
Message-ID: <871qvrlray.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 02/21] pinctrl: renesas: Add PORT_GP_CFG_13 macros
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Jun 2022 05:58:29 +0000
X-ClientProxiedBy: TYCPR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:405:2::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2953d7ef-d71f-413d-821a-08da4dcae80b
X-MS-TrafficTypeDiagnostic: TYAPR01MB3613:EE_
X-Microsoft-Antispam-PRVS: <TYAPR01MB361385F0A38755ABFF6ADFB6D4AA9@TYAPR01MB3613.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: onGb23oh73LtO1vPuwZUHma07oM0PYiVi/RI/PZAbyBjg3iJqSuUx/ZJH5mCWfRabKrJVgk9ILysJn1a0lCGH/BZwaRZ/11XlSbeQrNv9fz9ORG4WexffU1wBkj/bJsfBXQu1ajqxHG9KGEItRM6+bupK3YGfbQ49j6CJcuWSCRieSFUmq9vjZeQZQZlJdzhVSoIj1UpOgBTto9S5BuUI+3BZ1ln22J3WGaB0zlgAZOAHGIBYVao97xiY+I3IPGzINq9/gtJ3rzqFCdrFOfONbE2dNoojM977cTca9Onuk5C4GIbdn+2mEt4LQijsGQPwZJflBkUOC7M36y8MmpRvyRLD1BvxzdSJITyECVLsAeVof5D0uCpaTYspI/id2sS54hPsdYP0igxIPHlSZtM1BLk8tO36OwlpbnQYBK5P91+PiKg47V3bZ668J7erQkIEdQlaMcYXx9xa3NrvwOFBnZLUnTtKkkWZlPKCVb2QwXQBCZLts4Sp4wzZx4mdz1YqHnOneR8L1Mru8Z34qRpIbEQ5hCxGY8C4EbwcAySvPrUEv+Y1B4FBjAJjAjXQojQAPjPLzJQgBuFUBwhU+gYTpBsRrf5LmZ0PoiccNKJBg7CksFE942vWNpX0yvmfqHjg+5y4MszvVeWzpomiw7WbhzVmvtx3J68iEFhmQaTJNglk6ec2UP8NRi4o+ScbcC4yHAzqIB7iBKFoKGVBZ9v3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(316002)(36756003)(2906002)(2616005)(6506007)(38100700002)(38350700002)(52116002)(86362001)(4326008)(8676002)(6512007)(66476007)(66946007)(66556008)(186003)(26005)(8936002)(6486002)(83380400001)(508600001)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ruDMBQNuQ1HVu1rvu6hvXH6dTwnssXa/cL7AlOe5vnHHzocX4Zo44phciw2K?=
 =?us-ascii?Q?/ZQM6/m+swMJGOaLrZlI11v6Md7GOurl+W/EJ8RyOJNMPDmnkfgGFHUmdHz0?=
 =?us-ascii?Q?ywA6UZ7L9yATM9wzIJTjkRow78HcCcP0tJPWMazyLlgpt6xGts0yE10V38nS?=
 =?us-ascii?Q?zFszm+MJnyJyW0X5z1OMIIKsXvNgYwZcp3eOj6mF+Ncp8xWUfXL0XNHwrRse?=
 =?us-ascii?Q?COAE2HFTdihuNaZ5cX458ANkX03tudKaFRoqPRqb0ocHCaTo/vy8UchnUNBW?=
 =?us-ascii?Q?wY8SOZ8UMPiD7YfrMH+bcTklQW5XGjzXQPfumTV3KYpyLJBIEnpFYKc0NaVK?=
 =?us-ascii?Q?VCmi/+8i62THqMW/IA0b3QQoOsW2WScOw1B7Z5aqmqeGb3CmX1hhvtmjVc9w?=
 =?us-ascii?Q?t9voHS1m2L0Jmo4DtDu703VN87cw2Xd0WxscfTm45An7UR1RJ7AqlHV4ZMv7?=
 =?us-ascii?Q?OS9fotbHBjz9T7Z1xokjUmIM0+Z8NRhKjF+hs+O9ZEL7UeGk9t57c3EYxZdH?=
 =?us-ascii?Q?WGP20XYl15e9a8MzVEKunRTY4gaVA+/EZHgUgaFvQgRs+n80SNp/17mcvjze?=
 =?us-ascii?Q?Iev4oiQCggJKIMoxVd0OAo1LGMZoPZBJkcLaUDzBVaXgn9Erb6Mdd/hHxthS?=
 =?us-ascii?Q?LXMgji5Vw4XKULN7poJwY8kWfMzRWbQCCkYkqVFeS4bZ7WmUrcTf+FlcgxDr?=
 =?us-ascii?Q?+4ehyA7Iq1vFUouQwkQfXIh8fPG2TnLfNnMBEmNNxNevOZ5ZeXMa9fFyX0+5?=
 =?us-ascii?Q?b7ckoiJNpoHTTZYHpmzry1eIqZrrYnWnaXj3hto8W05aNhPrMHJMnojkzm37?=
 =?us-ascii?Q?7WTjGrXAYmOb3kRv1wZHhiiWhLq0OXwG3LrzqV5GK0sLgqVfmvQn5crf9iSM?=
 =?us-ascii?Q?v5oJ5jn/OSCogzrIDOQG1WR8Ywp/zpJRoSJNpjrvX0jbjOtgI1Mm2f33aUal?=
 =?us-ascii?Q?roERrWBwLv1FT0Ag0vZS9hBa6WwossnH10p+kWOLIH3uHcSS0FWqH9xnH60Z?=
 =?us-ascii?Q?42P2VBU8C/tOZKFwBAc4Jh3h13H1W/wO9iv8snmFuCRr4KNlscZLKpANp/qu?=
 =?us-ascii?Q?F0G3/jEDmQrJRAu0SbDM6D7Kmh66etDLF4j8iHjcDaVXWp9iehZniXw4IB1o?=
 =?us-ascii?Q?xY1jprisZRWGHTvZ3xZiNk3drIfMv/+HiNIMPOHwKxf+S5bLBqJQMhc7UA5n?=
 =?us-ascii?Q?4BdKP72wWvnOoNyngCtnk9ztWEwJea7juPNEd7tcvkFc3kz3XH/R3z1KufH3?=
 =?us-ascii?Q?kLrucDW+cMEoOnZ4Lem+El2vBT0+D131AFOwtZ0XW9L0UyfpBABannc+PYrb?=
 =?us-ascii?Q?nZhWyAiGWk9nXCVk8q+3uCpCr5ikRQ+Su7TWFp+6o2Xh2KkF4Vk7XL9KjUEq?=
 =?us-ascii?Q?yLCLDWG83mIsbb2kilR7SkZ9WyauMZtYp/pcjDhaqUU4hrnJpSx1o2dn3aUO?=
 =?us-ascii?Q?VLCxtvJ5tCkCPoGnz005ySoFw3+5GcW7JUTjDVia2JYIDGlwRHyZbSpfn5Vp?=
 =?us-ascii?Q?qaVGwKEsmFewAMAdepEpAYgKGy+EAhwirLp5n8q/svcjXvh8m5dh6CaE+BTG?=
 =?us-ascii?Q?CMkLRuMr6IpeToPJUQcwZzoLz4Rs+hbq2QeP7xT0hOrTNBdCYGrOfLseULaI?=
 =?us-ascii?Q?6nqDFMiWv0Dzaq3ZZUuJ34UhMMmDSNJI9JiZb+tagFUArManeGC2nRdyAzyB?=
 =?us-ascii?Q?CxhbWYzDpRYN8zeGc8JQhLja4d0TvVFT0W0g3m9uD4KzWmIUMB9Os9JmYBPK?=
 =?us-ascii?Q?mlhRy/k7vkPUqDBdyLBkLpcw7l/JmOeA2wF1VeF2rWUyOPFoK16G?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2953d7ef-d71f-413d-821a-08da4dcae80b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 05:58:29.9397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ul3Rxz0X/l+eQl6fAdJmDInBmTN3rAQamttz3uHpf/v4jwVKbjdqh/LTWeIasDdoH+AYe/olvQ2cpvZRAqeYHCm2JdGfatmjyAbWG3jKhyeVETZGg6d+9IEbqEkAMt5f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3613
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Add PORT_GP_CFG_13() and PORT_GP_13() helper macros,
to be used by the r8a779g0 subdriver.

Based on a larger patch in the BSP by LUU HOAI.

Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/sh_pfc.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 12bc279f5733..bd0ae9d7005a 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -492,9 +492,13 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 	PORT_GP_CFG_1(bank, 11, fn, sfx, cfg)
 #define PORT_GP_12(bank, fn, sfx)	PORT_GP_CFG_12(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_14(bank, fn, sfx, cfg)				\
+#define PORT_GP_CFG_13(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_12(bank, fn, sfx, cfg),				\
-	PORT_GP_CFG_1(bank, 12, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 12, fn, sfx, cfg)
+#define PORT_GP_13(bank, fn, sfx)	PORT_GP_CFG_13(bank, fn, sfx, 0)
+
+#define PORT_GP_CFG_14(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_13(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 13, fn, sfx, cfg)
 #define PORT_GP_14(bank, fn, sfx)	PORT_GP_CFG_14(bank, fn, sfx, 0)
 
-- 
2.25.1

