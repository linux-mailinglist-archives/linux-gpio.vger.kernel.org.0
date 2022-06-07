Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD1353F330
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jun 2022 03:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232894AbiFGBGi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jun 2022 21:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232513AbiFGBGh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jun 2022 21:06:37 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2117.outbound.protection.outlook.com [40.107.113.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D3F85C36D;
        Mon,  6 Jun 2022 18:06:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4FBr9W1w9BeuxpKU3M4iG9vFSEnftGQtutEtBh4BEy1jQYb/ZNeJj5OvcosptIjl5tyrMeg8ivE6u+VHuEPszjkvhJ0Y1LqlWBYBilfPLBOz6Z09WfiO2ASJ7v/0ue3GcikS6jLL/h/mGvf/LEgo0o3mmrcc9bYLKQI9m96A5x0EDYJ9UvYhNbquAJfwItNTCK2QtTYb6IlUrVRmGzk2qmYB/v9tRDp4uhrZpfZCJcHAXCQvd1OYjUoDE1uzWdQONPQ+dEobPO7Dl3AMLeSIynG1tKdp6B3X64w6OXtQlJWMH2gip4WjIT6+jKX9SjGPHNYbxTc3Paqk0Ul7WgyNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCPkyWWJbICzs5p5W1Rw9NlkoywSlB6gqrBKgPjL7HI=;
 b=gIrrrcDMTe9mo1E2n13EpNTNTK8/9wwVI2qhWE8osZD+ch5WG/peacSKbwCU5VJWc32VZ1Etp3rl4EhHInTHnx3qvZRf3dySDLa40w+x3BpW7kQAKGHFgFF1x0xSN4LR6PnlH+sGY0iS+evzpc4c4jKcrYmR3sth3neMOtLt7yGQZJRXE0QZ9SBauRiUYQwYzFpMHQAWzYXSUTZqJT3v83YaMyKNGtTW7Dzny2zDZ4h3kg5UOqIhDxlAKkK9WYuHtrfTRfXCV4aTT8Te2M9snZvwxP4boooxSb5aLZWpr0jsk1oOPC7EK6LH3A2iKxroOacJQQ9Tb/5ZfS3n72Ou0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCPkyWWJbICzs5p5W1Rw9NlkoywSlB6gqrBKgPjL7HI=;
 b=cyrNt2jn6RdPIX5wlpxQSOG73cL8FLI1Uwlp1TqQYyVuKcNxe8sU5IJi9KXAQJFwQuy2jMsI4DqX5TvnsiLxriFk1IEUPiBMibLwF5ChtR4EDeS6BGnlMxt/VPx/plf6EhvlyqTpO8FmiOcvAYLLkCBfK/aquIpUMayocCTilOA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7781.jpnprd01.prod.outlook.com (2603:1096:400:119::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Tue, 7 Jun
 2022 01:06:33 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a%9]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 01:06:33 +0000
Message-ID: <87zgipgu3s.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 0/4] pinctrl: renesas: r8a779g0: Add pins, groups and functions
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 7 Jun 2022 01:06:32 +0000
X-ClientProxiedBy: TYBP286CA0041.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27391dc3-26c6-47d3-23fc-08da4821f652
X-MS-TrafficTypeDiagnostic: TYYPR01MB7781:EE_
X-Microsoft-Antispam-PRVS: <TYYPR01MB778134C4BE514EA05008B496D4A59@TYYPR01MB7781.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xKn/w0nNOdoM174676vNEVh9Q2/sQBKJx4cL7NJvCGuzbrqqxG1G6Gj3NuEUXMxbKsT1L6BZjwSaLU1sFvoKtNIxowGndJCBrb7IjZylpVv2nx48TYCyqW4Ng1qlvoivXVzZVJjLk7lZVDDnZd+85Ze+Ea7DfMK/jmnaOQHFPAntDxuxnysVsifgNKbgEr5BimdCErbNRcgQlV46o7UOuHG9M+4bOahba44R6ngMekuhhCFi8yC60P2BhpHyJ0IY7IfEzwFk7z/WpUtAEyPcxJq32yDUDyEIjwzuPwL7L2wyWvfLIKbld6TjEsj2tVZ1jnVQrk1LCWndsCFq63c+UqudkhFf+7Godmp0/orJHsEKmDveWMtndbXaTGXEeTy60CRcAy6IAUbvACBvC57O+kFP54W4wGHMuwb35mFtb/ePngVlk+4vdKCql0oSkx2cQrRwcja5N4OT8TMXqK9A2V8xj0BGrQW1Clq9KZhCBrKjN/HprKGRlhu3JnO7E9/JgoH1AegodfcCiOUNPtMMtoVwgZ9oDlHO+a2dQsC6zHnzyYZCFkZ9zyrFOXTGzpGcwpmOcC4+qbqBLVU4thXTbpKGHt+DpOZKISRtWFfARz2PYmZLEds7I5JfBb1V74dhsABf7e4uWcUCJ3uj5V2uVoeX27QoJYR9T9hmsWU7bsgT1FqcqXkGICK4wTi1/1nDNVdVQcrDFBtQ/i2oatiqOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(8676002)(4744005)(36756003)(2616005)(66946007)(66476007)(6506007)(52116002)(66556008)(4326008)(6512007)(83380400001)(26005)(508600001)(5660300002)(2906002)(316002)(8936002)(186003)(38100700002)(38350700002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AkIBXg64l0xwiRTbdbBRUqUsVjGLRR9kVWU+vTQhrXylKgE1yVFr8s0Dg7GC?=
 =?us-ascii?Q?jiMsToOYLNUfEIEmpKCkN7Txl+6IJBO2p9Tsf8+7oPlY/LTVuRhPAsDCxanP?=
 =?us-ascii?Q?GzeHsM+i9NYwX4CMHHOlpfVYSlYln+jMFf4O0WZSszJ+TW7vwvE15m6OFc2o?=
 =?us-ascii?Q?UUGFiJHRJfykTFtWUtYePAY1r/HOvXE8aQ+hLnI3y/38Q8uR6irI/E2uP1D7?=
 =?us-ascii?Q?9cXpLd/81XEXNs3ZJJRCAjhq7bfQQWo3vPA2q9pq2OWHGGswWTY2483dVRt3?=
 =?us-ascii?Q?ph1GPv/RgqTGPDtcXHACyoZ3+BjbFybioJy7O9LUf3wtG5A/HQTaicyO5e/s?=
 =?us-ascii?Q?hdqaexPnVmcFehVg8Qr8BUEalruXxUlP+0c7Unvt6d+CWcYd72Y8nwvddfNf?=
 =?us-ascii?Q?5L8uLMrRPEesf+1gYszENAFYxlQGuNK9A8GO+mq7Wqmj7x4yYbFjOw3zEdK7?=
 =?us-ascii?Q?SifFyMUazJFHP8577Nn1qK0gz0InpgBr5nnDT5n5hpdvxP8ox3WsPwI93K/f?=
 =?us-ascii?Q?SA9EmxxXx8VGatgz4p3Th/loRjvCVw3zHnQKTbQXbmR6rQG9LYOhcGkqV0oj?=
 =?us-ascii?Q?hhM/2ZZFYvGn6VcUJ9MgwoQjZQ9Ckueti5ViMd2zqPb+D5HUMcZBuUjCkyux?=
 =?us-ascii?Q?WpDdLJNfTUteVOq61gXBScoZpCQfZbzzZLRbT5s/DIpQlsVRUhtUZD808pLJ?=
 =?us-ascii?Q?UJZIs1JD2KqljyaHwgNx/YIX/T2NManEW2XsZ47ak429x9aj3K+y0sIZGEQh?=
 =?us-ascii?Q?nKW05bj6o3TnkE1U7vE+FCZweeqcr/H2JdM6qWUIaEONlqII2DDECYg/1oOC?=
 =?us-ascii?Q?dyIwEJlFxavLt2XDtRA7Qwdrx2K384/rJrXMYoVXR25SEapEwFjOpjhJ0jjT?=
 =?us-ascii?Q?+ykANMi7aNJNrTrobNb5bOS8cExlYSYgx43/zjRJamZ9Ue1eu9ZQx//B+cKM?=
 =?us-ascii?Q?8LmUlm4YALyIqtsoU/qi7Kye/CJiC8LrVGjoavvB7QhBUcBO+1Nw3hHJ2HhS?=
 =?us-ascii?Q?Bfuij/by1WgfkG87nDufaiSn6o3tmav2Ugw1MebZrIz2HTmHmwwWmi4LcHPd?=
 =?us-ascii?Q?A4qW6CYk9Sl0YOwLybG9DM2GWDIDrRB7Y9YKXIxQbwsIVAnm/s0fVvBtHuSF?=
 =?us-ascii?Q?JZNKPocm2UNpof0pwG/ee33ZcHV4MrW6jRIz+R1Dm39LtuTEwvf+Dpcv2MLO?=
 =?us-ascii?Q?Qow7QQfTAfnGN33Jz4HqpdG6j0CbyvBPsTSUo81c9qEAdWDiJW4bZ+r/MA3n?=
 =?us-ascii?Q?GacDzKHPjLRwe9VEOmFsxTQqYyOnlqlRG+NJPvEFlGlqNXe70KnGWqAKvvJH?=
 =?us-ascii?Q?jQmq+7f96l0VawyqGklKLFitt8ljj+VLAM4qhYAWc0mEhqr73Nc3B3adhAAA?=
 =?us-ascii?Q?9DdAtHEaZrHPM7bHIm8Kb5rrA2KWkIg6IiKNTYdFENwotx9sieH4R30FSkV8?=
 =?us-ascii?Q?CFHyYGZsr3Fo72t+VzCAlHGddPSi7RGJ1Y/8fcnKljW3LtqqSq08jhyDmTHT?=
 =?us-ascii?Q?Y2QqjVAFfUX+/jYPLu9pMIqhSXUA9gE9BsTUtuqvUZ53JjnnH100btQfO4zv?=
 =?us-ascii?Q?pX9a1pFdK7gcsqZPanzn0j46yqsZSTXtCviPou1gKP2wMeXgjsUcyqOVKQPm?=
 =?us-ascii?Q?xO8mxNYJwfAKBTIAycLcA/2IbFayOjyFtbjaYlDq9n1Q+wgS3qk+ZA8zD30H?=
 =?us-ascii?Q?4V90/Wze+ZMOj2+ClDgGvw8Zm/k0lwDu20Q/reV9YIv8dpoI9uAk1i64Vp4n?=
 =?us-ascii?Q?byBRTLk3oGU2iDSRE++/1d+0Y3jimGRT4A70Ks176XVveQXjA8EH?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27391dc3-26c6-47d3-23fc-08da4821f652
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 01:06:33.1451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZVVH09YlkPs7TOO0guMhZBsf5hcH7A95u23p1yxLFv+iF/gzLCrn0R0SlUNH90Jx27Zb2ypbQVru5VEErRU7y+n1lfqgKdjxJvbvZ1CCixZlBdIAZOzbHdbnnwqbxVG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7781
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

These are v2 of V4H (r8a779g0) pinctrl patches.
These are based on renesas-pinctrl/renesas-pinctrl-for-v5.20.

v1 -> v2

	- add r8a779g0 on renesas,pfc Document at [1/4]
	- use CFG_13 on CFG_14 [2/4]
	- tidyup WARNINGs [3/4]
	  - tidyup tab and/or white space
	  - care reserve bit/fields	  
	  - fixup settings miss
	- tidyup tab and/or white space [4/4]

  [1/4] dt-bindings: pinctrl: renesas,pfc: Document r8a779g0 support
  [2/4] pinctrl: renesas: Add PORT_GP_CFG_13 macros
  [3/4] pinctrl: renesas: Initial R8A779G0 (V4H) PFC support
  [4/4] pinctrl: renesas: r8a779g0: Add pins, groups and functions

 .../bindings/pinctrl/renesas,pfc.yaml         |    1 +
 drivers/pinctrl/renesas/Kconfig               |    5 +
 drivers/pinctrl/renesas/Makefile              |    1 +
 drivers/pinctrl/renesas/core.c                |    6 +
 drivers/pinctrl/renesas/pfc-r8a779g0.c        | 4084 +++++++++++++++++
 drivers/pinctrl/renesas/sh_pfc.h              |    9 +-
 6 files changed, 4104 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pinctrl/renesas/pfc-r8a779g0.c

-- 
2.25.1

