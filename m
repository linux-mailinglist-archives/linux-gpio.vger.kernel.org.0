Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35FDB54A8FC
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 07:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbiFNF6F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 01:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236679AbiFNF6E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 01:58:04 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2117.outbound.protection.outlook.com [40.107.114.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E572C3054F;
        Mon, 13 Jun 2022 22:57:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTHVSdp9dfTWCU/zYqDRSsuA4e2cuPjNdTcgdmae7spFzQ7N1+buJW302IWSebQ6MlPjHI3mZD8I61r0XwZa+e+fPoxkoj0UhDyzWuNfh/hPMJTzqmS0roS9+5F3Opi/MhjWPFt5jVRVsL9b8CB4PJx3A6UBxRJv0ajmGU40+iJHVSUhBI4D1leWCi+DvPZ4itCNYyE2erets723q/zh+nIFjqwD7xA2t0Syb6Ysjpbx25YRzwa572UWy444YzrpRtxWAgM9Xb1jwXRhgjwwT5Ke/74Pt/JVctfxWP6DtMP7J+bBNs69hWsyhuXGG5emtQkXH/wrGOEoaFkVyXqWRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbfRNbT1Rdka1Gkwfe6539KULwXiuR+VQaJAWabe2/Q=;
 b=PfBv5kCv20ZnOot7vM+B2w6CX6w0KO4amptcDgCrgSO/it7j4Fdxd2+M5Zd+4vmfbxyZ0lL/TsAkV4So0LfW9eEOa704SMAr5czTxSwRexhbU9hYzz8hmSGnFJWIcDlr8wsqLwuIfFPVrtePVsDSjH9zg4UDNxbTtnMG+bNpbTAiE9Iksvjb0PygxRk2ReFmfs0n3mF4iVMvj5i+BZMj13RdyRJWbh9TTJplWJhNeFT4MslNmDE4klBE1Wx6/GI5LFnjOCmi6PeqYPMFX5cCLFX5pyTHOwohlDYQBRThdL7me1niZKD5lZqY/CilmP/8HCC8VtyjitXDVy1xRpeBBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbfRNbT1Rdka1Gkwfe6539KULwXiuR+VQaJAWabe2/Q=;
 b=XL/ExmPezEDkt7io89BayVImUMysSNij/CnLu/Bj0vD1CsSkkEvoqwXoXVqeeRc0fAAJpyLHRQ3bDcSW7XC3U+XXlP1Epuk7/s5Pim5Bq8cMVh4Dz7Jr0jI8ClN4BriZjxZuCEIGgmr7E3PUFPVPFQ+7ulLGXF9CCPEPlN+hCnc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB4816.jpnprd01.prod.outlook.com (2603:1096:404:128::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Tue, 14 Jun
 2022 05:57:57 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 05:57:57 +0000
Message-ID: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v3 00/21] pinctrl: renesas: r8a779g0: Add pins, groups and functions
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Jun 2022 05:57:56 +0000
X-ClientProxiedBy: TYCPR01CA0019.jpnprd01.prod.outlook.com (2603:1096:405::31)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d372768b-5cf8-4902-9cae-08da4dcad482
X-MS-TrafficTypeDiagnostic: TYAPR01MB4816:EE_
X-Microsoft-Antispam-PRVS: <TYAPR01MB4816D5F0B9B6897D908474F7D4AA9@TYAPR01MB4816.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iv4k0g5FzyJsNzm17nAiVqdO0Sulk+83/KnHyTQ6lcbzJKRKTgGrAHyLwe42TTx2MeiRKvw1RejZxHM5sTFLfvO/BZwfSp8F5ZKsAcbqS+wIv+THtccS+ADbrCMGPVC6zkAfCN1Beg1Tmm+UrOcNFMRf3FIgQ3B1/PBob0lNE/onlZ/B4wOW/UAgBRmi6MEyJeeUPumBjfn9UgeXX1fAXbTbsXW+IvL4OopYVUPCg3RYT32ZG8TRuu46zGtoNHXSkXKqOYxO3Pho2tPJ5mOqAvZQig78LQIvHSGT3H8xg2sO/Zg1SFC3B/hRQLSjAdtzJcZ4APxSe99OPlhIKN9Jlil5vXOUdr8VeBs5X2mPbnByaiLPSBHev2l4iB/B7arhsuAIBUzYoHLXYxjiS+lbYlRbrOPg9dsWnfObk8rBaMpWepA4cBuFwGnYB9k364gwjQzkm4/xZuOYJR2M0PEQrHAEjWi6BOok6W+5IiT7/3omN0e2zNlq9AMhUBj4qZhJDzEaI1BtIaj1kRljc+ivp1+cMsIM9jVJpBNYPeR2Kjqrgt5ZX3yJ7PU0odH18feuNWbkLVkwIFFUwPYndVjjjVtVSrKZ4ona+zDPqWyOeugGJeVD3euY49NWuBirTysiL7SL3s1FtEfOdw/Fud1hMNR4JusJJawZlCgpyidHuatB/khKi1Y/YF3JPM4HuTFAbfqSuM0ijSIpJEGxH+oEYQ404amsOpUPwXCwpCnXW3A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(508600001)(52116002)(66946007)(316002)(36756003)(66476007)(2906002)(2616005)(66556008)(38350700002)(6486002)(186003)(5660300002)(26005)(86362001)(6512007)(6506007)(83380400001)(8676002)(8936002)(4326008)(38100700002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ajTtGkS4TYzixvpFL8P8mZzvkB2C34S0WUrCKktCeDjAAxggHvQEcMIttCYP?=
 =?us-ascii?Q?wm0JVhpIbVQJcXr5xh0RmkG6olFacHCY9Q4FihP1EqkTzW9whGHlZHciLnPG?=
 =?us-ascii?Q?qZNoH1k7BqRNkZVV6vmYmPM7LwNkNEpnKxyrCf1TkncnSb3GYgNadeh4ID3g?=
 =?us-ascii?Q?EbI3uBq5FRH4c4VltVKcG+3by1FhfAS+yAfk3jyXNzC9AkEY6mCpC8nmcypM?=
 =?us-ascii?Q?2Z4xb0ibWSsxtZ623bFSN0QW+FOtuenL6afxNrzL1AI/P8hfSYRoqO5DvZlf?=
 =?us-ascii?Q?QYFXMrSk43UuL9ZLI8x4BeUzDyiJ89ANWgWtrWthOAkhvCf+JT5bqrn5bcRR?=
 =?us-ascii?Q?knJRfEdqJKZ8rvkOKMkAbiFiSa80rFDkKtTVBzbzXeSH6gRWv3eIbe8ozNGo?=
 =?us-ascii?Q?gvupnLvn7rCkvdwxUQCzjHwkAuEZLdtyDmK4VvyE/KJJQvUcwwyQXbtMvAHG?=
 =?us-ascii?Q?CCRJ57gwLH0JHzn4cJnJ7EKpSdvoCcYgM5KpqsKEWgO6FtdUMzKA9ZK+6j9r?=
 =?us-ascii?Q?euLtW1JZEgHsZpORnJR86sNSMg4ZwUsxjZHc2ZfYF0utAXlEwBFvCqeWorTh?=
 =?us-ascii?Q?U3v7s3Yt3MtYrrCuMf3yZSaQQyA4g9Dere1nMnzJgo+9FPQ0DpbQv1gQuP6p?=
 =?us-ascii?Q?PK2qmWQmmRz4G+2EdobTXiptmalnticeW0/jpma9lIgqgNQYkHmqW87PeLbb?=
 =?us-ascii?Q?FwBoxiXKjGyQFIitT4oQzNyN8vZPW3nj4bjX7jdTOpKP9+KLG+pRPU+gVzBI?=
 =?us-ascii?Q?UUlBzfcAJC/3XJa+rmmMUvotxVQ4zAh3P6DHa8XX1Ewmjojb6Bn8sQn/YhKQ?=
 =?us-ascii?Q?9aJ9Z6Uq55A7ou8Vi1cJ5B7X8Xrrrv6ln3afqmn+C3YunzatrzbVa6wDiQhw?=
 =?us-ascii?Q?2DxXzNnR7PvhzLzsr9N/I07NvewSQps/g5yzsEP3Woa2hO0RP86cgmDIB2AY?=
 =?us-ascii?Q?M5cNBu7lgrdpohkf0eLOYFjmJTLxuRDsEbhPIF3aXaWqlRKpSw9tUFy3N6Ra?=
 =?us-ascii?Q?Vqmb13f3KRWTU0HW1+ndUo/+ktfcxvi79UbehuC/ery6oFDHqnht9cT16Rbq?=
 =?us-ascii?Q?NfQ6Fb4dsvq/jJ5tRxVpTpd47NATwxk/fP4U96r03vOpNLcMk1hYD3iSOOp1?=
 =?us-ascii?Q?/kJeo8yFquw2niC8FC+9oF8Xe9W0niN3cO010IftRi3syBOZUvlET4reXBwf?=
 =?us-ascii?Q?O/dA2+jAxtPbVTDf0SYyW+52t6p7lnne/2hm+UJLWlDPZmsLDoZH33KP0GFk?=
 =?us-ascii?Q?aAjO6jXiW2DXyQrnuxNlHsoODRBImJRQ5waDIbzFyWwWCQ62x3K6zOm4hnrd?=
 =?us-ascii?Q?Q+Fb3QVHrYOugrAXemcUpSjU2QkunK55pFSXZcrVTsLm1NUV/EQ5zyIEYiDl?=
 =?us-ascii?Q?+4pc6Do3a542ijXMpyTRQuuswrXeiuacrp+y8FEq44cjTzeXsYRwBVP/ytXn?=
 =?us-ascii?Q?MQvbRxqIFlj0pw2W5Jgs7TsHKn7sFAfZ/UJCDKjtNUwg/HSJ3p/Mu7hJqdEM?=
 =?us-ascii?Q?HhT2YQvTBB+8tllmK1FPR7BDXnbtaa293uCmITdVN5F1WhtFu2KyVxN5sdwa?=
 =?us-ascii?Q?m3blu01nP+zkMMGNvf2xs7i+5yT21ZjV9767SsFatSFz3ldAnMRREQwusQDk?=
 =?us-ascii?Q?VRXe+ZdKHLM5xNINrGoQ9dxRI1DTQVdCd15SbeSfvp3vPGE7lyDR/muKWaN+?=
 =?us-ascii?Q?VfxeGTiNhuweReBueJ31STkYjxV5G01vOrztQn7beQHAaIUVOgwFG2z4Y3zJ?=
 =?us-ascii?Q?DuVQp/skqKqSG5/Ppm/AUpD5stdYvFhgjR6A68GpSmELK1s5YOeO?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d372768b-5cf8-4902-9cae-08da4dcad482
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 05:57:57.3376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMZxroaf+3ETU7FbZtXdTYKukUIKIGl1MLc5RXH4bHjzqpQWzY4DbI3GoBoMDCdawmAo5wXNhNCmCleHthbwOeyscCX3Mn5S9MMPZzX1ab/i+Mil55UfJrG3ykqPmdfR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4816
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

These are v3 of V4H (r8a779g0) pinctrl patches.
These are based on renesas-pinctrl/renesas-pinctrl-for-v5.20.

As I have mentioned before, I want to keep original code as much as
possible to avoid unexpected bug at [03/21][04/21].
v3 patch uses incremental patch to add missing pin settings, etc.

Basically, [03/21][04/21] of v3 is cleaup comment, alphabetical order, etc,
no code was changed. [05/21] or later change the code.

Please let me know if something was missing.
I'm happy to add it as incremental patch.

This patch didn't care about GP1_23 - GP1_28 voltage control,
because the code is same as document.
This patch didn't care about RMII pins, because I'm not sure.
This patch didn't care about I2C-capable pins, because I'm not sure.

v2 -> v2
	- for [03/21]
		- remove "core.h"
		- drop DRV1 from CANFD7 comment
		- rename pinmux_ops to r8a779g0_pfc_ops
		- fixup comment XR_TXENA_N -> FXR_TXENA_N
		- fixup comment RPC_RESET -> RPC_RESET_N
		- fixup TPU0TO1/TPU0TO0 order at PUEN2
	- for [04/21]
		- Missing blank line.
		- sort modules alphabetically
		- fixup comment RX,TX -> RX1, TX1
		- fixup comment MSIOF1_xxx -> MSIOF2_xxx
		- fixup comment RTS3#/CTS3# -> RTS3_N/CTS3_N
		- fixup comment RTS1#/CTS1# -> RTS1_N/CTS1_N
	- add missing pin settings.

v1 -> v2

	- add r8a779g0 on renesas,pfc Document at [1/4]
	- use CFG_13 on CFG_14 [2/4]
	- tidyup WARNINGs [3/4]
	  - tidyup tab and/or white space
	  - care reserve bit/fields	  
	  - fixup settings miss
	- tidyup tab and/or white space [4/4]


  [01/21] dt-bindings: pinctrl: renesas,pfc: Document r8a779g0 support
  [02/21] pinctrl: renesas: Add PORT_GP_CFG_13 macros
  [03/21] pinctrl: renesas: Initial R8A779G0 (V4H) PFC support
  [04/21] pinctrl: renesas: r8a779g0: Add pins, groups and functions
  [05/21] pinctrl: renesas: r8a779g0: remove not used NOGP definitions
  [06/21] pinctrl: renesas: r8a779g0: remove not used IPxSRx definitions
  [07/21] pinctrl: renesas: r8a779g0: remove not used MOD_SELx definitions
  [08/21] pinctrl: renesas: r8a779g0: tidyup ioctrl_regs
  [09/21] pinctrl: renesas: r8a779g0: add missing TCLKx_A/TCLK_B/TCLKx_X
  [10/21] pinctrl: renesas: r8a779g0: add missing IRQx_A/IRQx_B
  [11/21] pinctrl: renesas: r8a779g0: add missing HSCIF3_A
  [12/21] pinctrl: renesas: r8a779g0: add missing HSCIF1_X
  [13/21] pinctrl: renesas: r8a779g0: add missing SCIF3
  [14/21] pinctrl: renesas: r8a779g0: add missing SCIF1_X
  [15/21] pinctrl: renesas: r8a779g0: add missing CANFD5_B
  [16/21] pinctrl: renesas: r8a779g0: add missing TPU0TOx_A
  [17/21] pinctrl: renesas: r8a779g0: add missing FlaxRay
  [18/21] pinctrl: renesas: r8a779g0: add missing PWM
  [19/21] pinctrl: renesas: r8a779g0: add missing ERROROUTC_A
  [20/21] pinctrl: renesas: r8a779g0: add missing MODSELx for TSN0
  [21/21] pinctrl: renesas: r8a779g0: add missing MODSELx for AVBx


 .../bindings/pinctrl/renesas,pfc.yaml         |    1 +
 drivers/pinctrl/renesas/Kconfig               |    5 +
 drivers/pinctrl/renesas/Makefile              |    1 +
 drivers/pinctrl/renesas/core.c                |    6 +
 drivers/pinctrl/renesas/pfc-r8a779g0.c        | 4316 +++++++++++++++++
 drivers/pinctrl/renesas/sh_pfc.h              |    9 +-
 6 files changed, 4336 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pinctrl/renesas/pfc-r8a779g0.c

-- 
2.25.1

