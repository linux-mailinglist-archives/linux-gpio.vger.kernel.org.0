Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 982AF54A2C9
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 01:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232149AbiFMXem (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jun 2022 19:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343491AbiFMXeh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2022 19:34:37 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B57E32ECB;
        Mon, 13 Jun 2022 16:34:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlDRGqevG87MGcS+v6xk/eTziatcct4Cq+m7WX37SXCSEIDjMfZKZZgLOPZugk8MiZln/fWbb6cGP+jIiDL/KB+f8yDN7MrdntporkR6W8yzasiX/yWGycskt53sLT0EX5QGFTO9uiCiYMfcK6WZsN8IWTe4OIBqX3m5siYwmidsi2kiDfwQFHIlmKkEjp/CrpNmRmFJmc4Iv8OPZ30AXVFlZUAcuSK2PNuGAJXpuXJFNZI/16XiAAQWG0kS7fSd0hPsVlm8VrqpoYHLtzKhxUC1sF4XY6U7vfxDzkghqUE38uzP9UO6quyk1KNCaiwFH+8PXVqmKr6U/qlmitEknw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3r3k4Yu6nQOwTpeloRdh7WRv7ydqMOOD5sErZ3rk0k=;
 b=X7RMiWoFYGbb62Ybu0p6xarPqLYlRYHBvMf4eUe9kbVQaVXeH0egzv/KAHx2L4zqjfQvNHdauruPg1qKVUvYXX0A8L8Or/nSdaqrCBZDagtTnf96L0bZSHrkUpV/C9MdvhVi1A35LM91fU4aAuBWrIxXLvzLoW3lWgVPmh01k2eGg7QJc6CuBq98Y1r8XbezVhkmJrlXpC3iI1PyYWZPe6A4lqbd9LTGIiTjf1Aj8NPIyBQmnK3TAPnqF5mvjs8Hlzat3FK4ywPzBeeOjMkXa4lmxOHpO9nZn98fEaEhQcoMGYe1Rd63GTwAmTm5tvpy9vBLX1rzNoFSaF0MgpfdNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3r3k4Yu6nQOwTpeloRdh7WRv7ydqMOOD5sErZ3rk0k=;
 b=QGnPVeJiRbfqp3Z6N1PH8kIdLEzucscHWe3uiqzrQ90cwm6QrhcDnfFNCLp9dbVwvMroakxiTi156vGHHrrTJCRF8gHsLlA9F23+oThjAo/tqR/vRclm4xzF5A/vanthiCeTuSXWahhffCIEhzTly5FqLUpViI+89m3tAr12dss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB7211.jpnprd01.prod.outlook.com (2603:1096:400:ec::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.11; Mon, 13 Jun
 2022 23:34:22 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Mon, 13 Jun 2022
 23:34:22 +0000
Message-ID: <877d5kkuiq.wl-kuninori.morimoto.gx@renesas.com>
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
Date:   Mon, 13 Jun 2022 23:34:22 +0000
X-ClientProxiedBy: TYAPR01CA0135.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::27) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acd4f64b-65dd-408c-08a9-08da4d953eb4
X-MS-TrafficTypeDiagnostic: TYWPR01MB7211:EE_
X-Microsoft-Antispam-PRVS: <TYWPR01MB7211EF8BA42C8706FF5E0232D4AB9@TYWPR01MB7211.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wCA0b3Ds2BS/4pxmjpIJ247xuUDyr4c+XvlDL9123soTq8Zx3/ssmygGsNHrv7RKU3Ke6fSyjrWf7DJZLQqRQW+7pM6S/z56FFDYNLvqgj+qNusLFskQ1+WXYhk/UfJ9RfzCUf+drW21WteusrW+snYp5XA87OG62bnYKgYcG4iwB5k7QUlJvp+DkXBRjxms/E8SEfq626pcgrbAfdZ38cBzAeYPg1xpJ8lhMqmM6CaNirxq4aGzmjjw6HOeyjkmE2E6XnAHkLrapABe7cQRVdlUMXeMs+sj5pPXiHVRKfrP6HRbyH8aFzD9vywRd8N6pYLaYhxPhXMrRQaUJXpE5Wb5CyNBZM3qSpDeH3HhrFBZjBGoWvQXwvkf0gA099wRGrM5O+S+AZbb7//ZT9k3DZptTR2pY+jC3I61kyP6uXde6TdBPfdwEgkpA79AHpmOWZtO65j1Jg8ouFeJ5DDNeDqiCnTG1vtJRcA4n/OmwzusAYb8Q1PmTgpORjfbHgj+tzcG7Gw+4CzL04GRJW5zMXB5LW+DRUsXsCAZ4a1EtPxJQusxI/NX3KRAGTq7YvWgEXZXxeRNYAEkSle8LkxQwxmqdETbW6dwGTfOQkMxuTEB8rKC8QFOAT4BiVtYOA4ZZqWTRr93cReNFnwHXVkuUsCsQXV6edxfZvd1GYAKEq1bFW1MKBSoA4D98E83JoouqxjEr9FFNIysn0ZfnV4fqvyF0ez5FRBFOCd2Gx7eD4s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(5660300002)(2906002)(4744005)(86362001)(38100700002)(6506007)(54906003)(26005)(6512007)(38350700002)(52116002)(2616005)(6486002)(316002)(508600001)(4326008)(66476007)(66556008)(8936002)(66946007)(186003)(8676002)(36756003)(6916009)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yxonu/NyvAQIvK1GKUwi5IC5A3kijbJZaAaFbu9GLPSL6TVNx3bE7WOwubxK?=
 =?us-ascii?Q?omUeYjH7JJ5Myf0kwI3Q8zQ6wbVq5U59OsZ3G6W4AzcU16X68O4oq/GH2HU5?=
 =?us-ascii?Q?BBZg+QzIW9zNgvNuF2PkfNDv7y8Id08Ed0SGoCOH8cL/toyKCf21YBvitdo3?=
 =?us-ascii?Q?NsQU5mBQiZJYQ2ZghA1AWc2asrbZGkIXxpwswHgDshBf6bpK5M+4kNg5JpEK?=
 =?us-ascii?Q?N/oGLy0QCWNvyq3821WhQ4mRsgXVvJ9scmp4gwkNW2fIlDcT+llCbv4UXagw?=
 =?us-ascii?Q?3L/VKP6wApo6dIEYvXWmj0jMaPBnlqGmL4n/6u0I8riQJF7kE+LwqbOijhUz?=
 =?us-ascii?Q?UeXD31A1wUKVUMsC/+EL1+DyS6wtDNuJti5ihjsm2PZsS7Pi4A4Z4ZW+nbVM?=
 =?us-ascii?Q?8dl3DqPYJHorjhxpdaWmRwBywR625SPhRIFQDkovLdLzdwhmhkuTD9w4hQ1P?=
 =?us-ascii?Q?ZqjPI8xDNJk3hSJTGAMgULaF2p5cqN/mindkjTUD5rZr+Mq/yMphSB0YeyWZ?=
 =?us-ascii?Q?xVpHfg2M1p0BL0BlSkvjW8RDpsZEdA5rbkhPwTD0F8z2bvGH4EyYrIVYf8IO?=
 =?us-ascii?Q?0ihMotus0JbhUkmK1MgbJBwNGFxsxF/S/X90eTaBItj8DJVnlCDX07U3Ntg+?=
 =?us-ascii?Q?xcPjY3iq6kXkuFVIWwuhaIkg7lwuzKfRW2Pdr6gUYXx2Xg81EJfdGlDDK+JI?=
 =?us-ascii?Q?sCz8puf22pshPJqVsPY58LKZRoKbBUDA4lGgbzxEfC6tUUTginKTA3YYl5DP?=
 =?us-ascii?Q?HD/LjqdsSxf1UXAydYXrCArNVFBHEcE/uUHcyGYWN+ftF2shHR3xXmFQpay+?=
 =?us-ascii?Q?CpE77cugAbk8F4DvNbODvgTXLAp+T7O8qOA7o0BnT0P1wd1Sv1GnmPIMwi/6?=
 =?us-ascii?Q?3SUP+WhAdoO2rBtDQU86jVDbhgeSOwOfHAOQalAcRYELObPHV1UjuK12ydTw?=
 =?us-ascii?Q?HjQ60HLveQ+vnnMiuAPyQJsSgvmFcKjSOMW+yXUrl7lcaR1sHd/8AeuAl3M8?=
 =?us-ascii?Q?aKLRTwCtlLSI5t/UjS+pk2HzOOT9jfhjlF0518tRqkGZggbZGddZOXiCoj3m?=
 =?us-ascii?Q?zwRKASQ/qFW/s1z4ct5t8bMJhSg6gxyHTPqioU8FBnUlt5SRvOKgtUcnadM7?=
 =?us-ascii?Q?lHjsVb1+1AtAzdJQRjFIs6df3pKxS/fqf6lfMfQYyUHoJxQpjLhve/o2ls2p?=
 =?us-ascii?Q?LXDxVQlsDii3wHGZrS29sl9dxjMs/1VufJx1f9uBQGW4jFiPv8GQzOdbuTbI?=
 =?us-ascii?Q?AxeOIZ0kOaCoRBxkrBrRgshG8iRNy5ok38lwTwMyrdRonXW5G/JsIqFy7z4o?=
 =?us-ascii?Q?nwPxKQ/UsDmUUA7nwZ66By9UZoVe+iFUl6PJMqt3/dNWlhMSYuJYiTWWviFs?=
 =?us-ascii?Q?FqjVGbNqC+RJ5njayDAJ21njWw5sbqyIPr0XEU3PkRz3vn+Z4AwhXF9N4Eyx?=
 =?us-ascii?Q?VMiXHOCxPuKiMcyx6dRVRfOfKutOviw75MBrpDSk0NzBzQcMTkLyjzzcrQ8S?=
 =?us-ascii?Q?Z7otic4dqw9J0dcOykktsjfDP0/CtR7B8LdqzywMx6164SsJciicCtIVrbaS?=
 =?us-ascii?Q?UJKmuNTRGrYR7FJglbA9gMFsxVpgOPm5OpY7eob5cRituMZaFwJXICpH4nGf?=
 =?us-ascii?Q?Idl+EBnAt0OxvgwrwJz+LQJRKZN6HVADn26Rb3DTaey43LgSQwNsWIc1Rb/S?=
 =?us-ascii?Q?e9r94f0z8zkp3opOLxkYGn73BEEwFswOOsZny8Z9UdAvPsjrhd53xJeqUXbd?=
 =?us-ascii?Q?hpyoHrFRXeZ9rC2bMwl9TfYV/67xV5PJqcC93CRoqmHP4FUXH0kg?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd4f64b-65dd-408c-08a9-08da4d953eb4
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 23:34:22.4891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2tUeHBpyQneLMtYPzMz0Bdn6ktqkEaKmq/f/fwbma4SAMsZg+I2hM3c7/TVUVqAoD807IDAB7IUGxOJ/56nMv2CIuAIVvW5ZIxinKuRFM/lM/W98BFVfTKmJPFi/ZOY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7211
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

> > +#define CPU_ALL_GP(fn, sfx)								\
> > +	PORT_GP_CFG_19(0,	fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),	\
> > +	PORT_GP_CFG_29(1,	fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),	\
> 
> GP1_23 to GP1_28 do not support voltage control.
(snip)
> "<= RCAR_GP_PIN(1, 22)", as GP1_23 to GP1_28 do not support voltage
> control.

Am I missing something ?
I guess GP1_23 to GP1_28 are same as other GP1_xxx.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
