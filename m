Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC1D453C3EC
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jun 2022 07:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239529AbiFCFEL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jun 2022 01:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236793AbiFCFEK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jun 2022 01:04:10 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2117.outbound.protection.outlook.com [40.107.114.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 428AE32EEC;
        Thu,  2 Jun 2022 22:04:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PROLwHskAT6hU0RUJWg6mhKikWZy5BIObOWYzGd8/VX3poAmUlepLhBl7PUoVAj8Arsf9GDwn4OuJULFzzPhgXNWSyAR6qz4b8f6Af2bYMHDH4oG5Ju7pZujkGd78+G8/IzApcCN4N5BDxhQZUD5oB6y912Xy4VGPMN6/kwoRktUW8bl0oYbEAMkcuOdmSxtdNsPjVEx0DQaivf2HFxOcJb2Oeidxj58zMPao+uPNq7l1csoHR1ymSPS9tWIEn01Cli2hrN3MxEwLfYdDd3pz/05XkYPDBk4JEUhrkNrrWVfcB08GVihNkIJWJfEO1bkr3K8v3pZ4KYH0IBpOzaLXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IW4slktJcMZi3Sv+opY54C/fLvEPsKTMp2Bvv4KOfrg=;
 b=WmWfXByEDoTAbFRTSTs+HZyueB7n25MqFDw41RsJl1f2uDnPVDeDInhexuafBWfNg/iZ5ldqGXdWVxQ3wj64uRhd3s9dUSSyjfDKCq/xGg6P5E9yOrIHUQWDGVBNqebT2oaUVRRQ/28PIr1ySNH23UH/zfFD9GFNMYgfzk9DdWIVP0zmtjAgswi2ka3v4i6Qs8wYAQGQiAWmvAFwAyr5/kehMPAOMrRlqGi96OHS7SlfxADJjiQoXB6NTtrrgdRokiQDaPziHniH0JHxRFo3jxvxMsoTlnFNfy28RK6VoHAsHMLyA4BbGtin1RN8f/bsRqcDCIFSzlyK4pfCMGeTcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IW4slktJcMZi3Sv+opY54C/fLvEPsKTMp2Bvv4KOfrg=;
 b=ENSJjswedJZM4Hb6DRlVAjs4Mi0VqozYLYQUb6j02gpPAUwqL4kwVxorZt0C4hszH7gn60iefo7ZmLS76ETo8Bk70s/hFN5Ws33pDURLP6d6OPnXqwsvX624xQ1dpAJorDDVCMeIU5i4MT2xprZ2ElhLj3rO3RSTyLJwzDFePAI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYXPR01MB1758.jpnprd01.prod.outlook.com (2603:1096:403:e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.14; Fri, 3 Jun
 2022 05:04:05 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a%9]) with mapi id 15.20.5314.012; Fri, 3 Jun 2022
 05:04:05 +0000
Message-ID: <87mteu49tm.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/3] pinctrl: renesas: r8a779g0: Add pins, groups and functions
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date:   Fri, 3 Jun 2022 05:04:05 +0000
X-ClientProxiedBy: TYAPR01CA0237.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::33) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccadcc72-01e0-45c6-ecc2-08da451e7bdf
X-MS-TrafficTypeDiagnostic: TYXPR01MB1758:EE_
X-Microsoft-Antispam-PRVS: <TYXPR01MB175816554439CC5648FEA61CD4A19@TYXPR01MB1758.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u8Wd9MUl2VbxkKlaZe+g3RSRCpJhVPd9leJhp3KB8x9KUQrt82lgtCezg3hpDyfC5M71zBqZxtOXEfWuOnYAPy6+LMbQaO4LOqi/bdF/Pyn1r3aQvWCJc4RDywZx+JWIupiUax8zacAfjerZ2g5Asv5bNA1sQR1pxkB8nQcrJFMHrYCgXMiXfNmj9APtexKKW4lKOqhpqW0ckImiCByx6pksUxpa6zwBT+Ay3ZVrzV4+YIh+tcWgMoqEeyR3Rr7k7pMe4Zi1aBB45UYetN0205/eG/2jHUqDkUUbg9NB5vG/0HDMHqdaFVweQgM+XdK2i2i2tTT1Z+F584/UznBdu0W+I2cM5sovmIusflVGqkS3Rn4Q+nfRnzoXpcO/zc9uvbcTPfrNZZ82lABVYwqPtwbVuHLhUpjdF/VVKfgC2GlDX7RrfMGkHFfl2ie+rPTEgLd2YchVg9jywIRUengf2vpk1hlUjRA6j27TZ/bOCdxId/SXidZsTGwtERyt1kbWT5lM8TWmq5loIVWoDlXiHJsgmkWEpDwacNOpUWAu+uH3YjOcLrUiYJXHjSOc+46RBWVIx5pN6vCE/HLLWHIvM+uowsUOQZAOqgKfGeeXTuOaRU0NL6xXHAAe9yJAVj+7e5Lbt40ygUL2X7P2VqfVEZpP6x9jNf9gzppU7wskl7yGIK8Gd4WwS9nXcf4kIu4hGESUx9gYyqSI3loy8w2OgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52116002)(6506007)(26005)(2906002)(4744005)(6512007)(8936002)(2616005)(86362001)(186003)(6486002)(5660300002)(36756003)(508600001)(316002)(38350700002)(38100700002)(66946007)(66476007)(66556008)(4326008)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v7bYfZ++GI3fKKY3Rv7v1O7IKHhKpFzgq/ScOczewnegloSeyl7aMaKMwWRV?=
 =?us-ascii?Q?b4AqfauOQmikQu8GRcYELuwgTDJvqN/LYa5/WeoUHbJv5aGIsyfv7IusZjsT?=
 =?us-ascii?Q?UV4fdgEMYYr9AycOOQoVUvKy8tK1TY2pZJk0RZJXG+jQQ7S5f9uOHyRQ4G7D?=
 =?us-ascii?Q?wWerqXGV/FfAZjthvJ2LgklJbk48uUEhPVvKqZE9rFVUb4MrNEUKn1ECSUUB?=
 =?us-ascii?Q?fTbZwL+Sb99TV8y5wCIqhyH1XM/gcKjgw3JUH3RZ0J9ekOmrsyJa0uUpuo36?=
 =?us-ascii?Q?hTs+3h7X/oYFFj4w1CywRKMzxU/fSkMZ9IWUEasmpiwGxrd7b0FiAAXXI2cU?=
 =?us-ascii?Q?uORuTgbqJzFrVng57qXPjEhATszCY8POc8xqWc02JjVYoJSGDxz/h10DIFUt?=
 =?us-ascii?Q?kldqnrvsyR29oz2hXxBTKOT86ND9Kb7tTh/1GDWzBOuifw6rxwlMmZU2xnV9?=
 =?us-ascii?Q?GDJej4pEN+tow3N9Fek2Z0LacbKwtI91CkKKgucugasFhCBXgrFunAqinTAe?=
 =?us-ascii?Q?thVQ2d5LbUk66Xszmc1S1X09XD0YpkqOkxAClX1Pb9DDnMPNhG7xtPgW+ep8?=
 =?us-ascii?Q?jSr7SJlIaFJY7JJrpntkb80H6TsPIlJDhA2JEZ1fmkCdddqWqojcf3akN50e?=
 =?us-ascii?Q?opyu/I2h89BPkL4Riaa9yQmsbRjP03AOMT6t9xr34V4MPa5VGQx6T8c3ZI1r?=
 =?us-ascii?Q?930KNdfyaPJabVOaafkM3ZuI1WFMPJeKkouZ7HobYOy7PQ8faaz/jyLKZWIO?=
 =?us-ascii?Q?3RAFFz6ygTKZw833EFxlRAPDfznK9kyD4VQdhj3Z+SjCbqtrRovMlW+MBjLg?=
 =?us-ascii?Q?61zOO7wlJ3hOtnCkHkqqystH+L29TQz3N46HoRU5BOqX3wJGxu+fzDX7sUED?=
 =?us-ascii?Q?2gzsmDqP2nYvxwJVBFTeMziZAcWIlJEaQjYqfGiGGProp9yCUcBqCcUcMBsM?=
 =?us-ascii?Q?HX7V2SMZIcEZCMPDu1IzdbdscIdfNAKgIVEMbQj7CHylEgZgqQodllMsQ8ie?=
 =?us-ascii?Q?HsV6Mw4CHLCC6faB5AfmeeQEq7CjPRRN88E8MJKEXW3uVy91JeshYv3b0V8q?=
 =?us-ascii?Q?NxL1W9gmITvZrTDOkmydHXZ5WMB8XrBzNT4EkRffHzADFsoVJN5/hyV4WPyy?=
 =?us-ascii?Q?paSL9GoGho8FbgS+pLSV1J0eUN6XDQ3KgILJwzqUpbPxeB5tpvfdPALV2GWJ?=
 =?us-ascii?Q?yUqRvp1sx6BgwU2ruEXKMWAzENiI8UH7ln0iZCYZ+Q2p2EAyW7xXPQXe9GOj?=
 =?us-ascii?Q?pQEy8kxF51UgRl704MRWWjVcoDy8HvZnhqBPRieAqYFX4zgDxLWf8P+Cz6pw?=
 =?us-ascii?Q?zvnlDS/KzBCeFf8pRGHOrkstR/nwmnV4Yy61y302tvtNzJedNWmVIG/bazBL?=
 =?us-ascii?Q?IVcKSMsIfA+Vu7PDwgIXXOGwJ7TZqBy6Aq+36Td6OCdEEG/oX7hZHLjjjfXc?=
 =?us-ascii?Q?v8us+OjTP3ll9I35OOX+erOeJ/WAAbpJ3ZwWh5UJlVbqaA1EcljxJU2wtCvf?=
 =?us-ascii?Q?u9UTkPiNrEf0CuMi2qIuAMRkUuBnMQnSQfQW2AVuZ5YXySfJn5F5BYULiY73?=
 =?us-ascii?Q?lhpsp7tX4lccyUmGLPzuEGTPwRnY2MlrWhJcJNT/+OyHL5w8uZKfoMfGeRq0?=
 =?us-ascii?Q?Pb7B5jM3bHPpBq+SmVMNrW+7H/XfZ4IxrLeH3aqzCe30hPt+CuICJeOR97ld?=
 =?us-ascii?Q?xt9HZ3eMspWFfGWYnfhJKm1zd5HqSamtsrSNVx5rlx6UpI4b6jiIa4KS9DoA?=
 =?us-ascii?Q?3NiZuihdC8eOfi6LdsKdEwCtVPZ68R17pYfCb+lNaCFIKSHG2t4u?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccadcc72-01e0-45c6-ecc2-08da451e7bdf
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 05:04:05.7048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxatrg4DN97bpPnF4afMMiEzaovH/dIDnB3nRAvg/dBWVDJPhCnG/XbvNMdHoKMDmw3VAy3zWw6KSIx3wD1CJRa9PkB0fVyVdAZMI/4CbWLH6MiUlKvcMpHFdSZONgC+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1758
X-Spam-Status: No, score=0.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Geert

These are for V4H (r8a779g0) pinctrl patches.

I have separate new macro definition from original patch [1/3].
I have cleanuped original initial patch, and merged its fixup patch [2/3].
I have merged original many device settings patches into one [3/3].

  [1/3] pinctrl: renesas: Add PORT_GP_CFG_13 macros
  [2/3] pinctrl: renesas: Initial R8A779G0 (V4H) PFC support
  [3/3] pinctrl: renesas: r8a779g0: Add pins, groups and functions

 drivers/pinctrl/renesas/Kconfig        |    5 +
 drivers/pinctrl/renesas/Makefile       |    1 +
 drivers/pinctrl/renesas/core.c         |    6 +
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 4232 ++++++++++++++++++++++++
 drivers/pinctrl/renesas/sh_pfc.h       |    6 +
 5 files changed, 4250 insertions(+)
 create mode 100644 drivers/pinctrl/renesas/pfc-r8a779g0.c

-- 
2.25.1

