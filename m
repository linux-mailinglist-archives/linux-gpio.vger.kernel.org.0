Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2361F56284D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 03:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbiGABfZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 21:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiGABfZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 21:35:25 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2098.outbound.protection.outlook.com [40.107.113.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EB0A5A469;
        Thu, 30 Jun 2022 18:35:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvdCXpCsKOUjzYg97O7chB+Z24Sg8iEPNjdCrlQ8WbOgecFVndnr3UTUidUbtvaI8PdYgbi1SBh134038rPcR1rwEPIaukVvWkiL4xtjfQYrKdd2ffTBeWlJ5wOvf/siJ5Le3XWt75X72w+pfUXARcpivMONv8ki5z2EUlkUbFzlfZEJmKL5KbmjWtDdfXntD1R0rszYCgNXDfqcXXicVS4MR/lTmo2lvBuxHrvZ//C+IUXaooA1H2nuY9ZtIswRoinrE6F6SIHMaFlVpFHHcODFUNo46l+wSboY30Ouzw5JSaVSDG+VQUHHektvccoiH5r3HbVF8TxXJSAFmdjhlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEkLVhI0xhawNvQvG5Sqz28nzHW5K6zWJqSQB0vPIG0=;
 b=TvwEMLU8GoM+oZs77+jJRdS6vmcmKTdW8hIlC2zdH4WyrD/87hw1Yv3oR8lm1449/PtHU0ZZ4A72bQILxB6hAox5jo12bkNZoFbYPqpxtJO5+1zl60qsL8JRMesjrgot+ho5n7s7N4ZF/m6spB0k+zp8Zvxo0pEe3s287EoYVwqRSi/6xMtNnUJtQywy6WNCjDoWhLrtdN1OUpDodo95px1qkQDMczKA9G2k7VAZktAcPPMy4eYhYuscjQlOQ3YXB7Nz966gemJFlqkwLZbYY+rlksxKeNJX7VWbGxhWdi5Y3j6LrQOwEelgW4hggS7h+o35HUjiMbWxZV5LqjPz8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEkLVhI0xhawNvQvG5Sqz28nzHW5K6zWJqSQB0vPIG0=;
 b=RLQTWyabuxrNXwHI5nqsT5PNAG0jCA1T3EC2jPg1D3Ou88/5mgVqV3FWwUD3nfmrzsOqx8cz3gUf5PXVaLDNfVzJ5Bpx9M7MXtihvtpzQvcM9Qr+ILRvNq6EyQ02V0KLB4fKZ1+bdlXszVg0oO/U54sMEvZxCca6HPGRrjulBfY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9275.jpnprd01.prod.outlook.com (2603:1096:400:197::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 01:35:21 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 01:35:20 +0000
Message-ID: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [PATCH v4 00/21] pinctrl: renesas: r8a779g0: Add pins, groups and functions
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Fri, 1 Jul 2022 01:35:20 +0000
X-ClientProxiedBy: TYAPR01CA0085.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::25) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ca4ed1e-3702-4501-ff71-08da5b01f5ed
X-MS-TrafficTypeDiagnostic: TYCPR01MB9275:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pikEMf0Z8cDHGD0ZvHluAg97yQpCeBWNd5YP1ihSRSlhCkAn0vzW2qCnAfGfDf/q0Ok0HoNhqDvhM0nrYFbaSG+/wiL0G6kYULLPMjvP4k7MQExtHVdpFajCAY1MtlZDHuv+iFZgTU9y38tp/GQcuHvGcx4NWnQguzd0Fzk4wz4Xrmf/HoA4ULZO4g9gVPXtIONAbdzcxW47XijZCIvK6lRZgZ/IFsUWitCrcgxGBTPpC8+Fvk0xLO8luFX0WO9laAy5HfHdZP6JqgESZlNlu1vnd1PYbrnF7wipe/7lf3aNHJkegEqgMncIiZUiz6m/rzjONah4nJaY2mZbOxJ7kLujnsx2CFe162OzqwUa6QZag070D+jXAfMyZ60AvspsSmg4AjRqq/ryUb1zUTcgqn92HssrjjAnDVgbfT/bc0SOhlgbzWq3Stwi0ZO/1UeSrJ+hm8j8okMb80+nUfH8isY5IjfFTu55VkVNSx9bfhyuOOdRiOKQ6GK8cg5F5abS0TGpOWhMivL1P/Qr+ZFEjIQdVJgWy9AeRILEMoDrEXpmcQ/nEwFsxKOzYIegiorGR00RjDfvcqy2dSPVdDD32U2x/nA5L6swnnC8mKBeyVUjhCmC0XZJ7rn1K+8GC+KnFwRIx5NRjBYwq4WW1XKKBgGuW2xSkvC4ep1AomzSLdbAkHL66dwhboskhQS3D9BUBNsn8U8JoPPF4rOhV4jL/LndPWXinQCbMt0Ge8z/SNLjo6Ie+lKeMKdf60uueOAs3ohPueV/OiC0nDn9+4NtnLX51O+R/O/jcbNks+QX8vAkVDW8z5kbv1UohcAWRQCNe8Y13LFiD8CfW3Zw7/Tsrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(346002)(396003)(366004)(376002)(36756003)(26005)(6512007)(6486002)(54906003)(8936002)(52116002)(2616005)(5660300002)(478600001)(110136005)(41300700001)(2906002)(66946007)(8676002)(4326008)(86362001)(316002)(38350700002)(83380400001)(186003)(38100700002)(66556008)(6506007)(66476007)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MGdptn3uQV8iDFGs8NnYuYXZ8+OucuvDPT9m4y6k9DZmSIlqOJLx4tPX5S98?=
 =?us-ascii?Q?5wGKV/mmj8dwS07dc3k1zxPpcz8Uun3nqk520l9+NNvYC5uYRlXF1mtJ/XrY?=
 =?us-ascii?Q?sdAnuRMIzzkqM8YLwq3/avHEYtXAzw1EMRKT8KVFv5eNg/ktDZRkwyYzFnAr?=
 =?us-ascii?Q?J26dT03WrfSwssN243NMkZ74rm2YSgEsvaBz8vR5niayiJ/iIPNEMs/QIf1Y?=
 =?us-ascii?Q?99O35cHWO6t7kjl4w42rnmohlloJGyMiQEtDPYVzeXt4oZAkxQM8bsrZsSch?=
 =?us-ascii?Q?USIlz3pnVFRKuJ0teDxX69l8SpSkEzStCxWbUj48OMg0YmBJ4pnJ/0D3dCbl?=
 =?us-ascii?Q?0piZ97GiwXkDkkRtAzSrn+eDgYrtHEaHKF/aZY36AqVS4EXKEHtzg8tOJIyX?=
 =?us-ascii?Q?ICeoTaalmQftzXa6I1Mp1KJYfxXyE5NqywbsQRqGtlWiTv3mtSyM3KU4eR4i?=
 =?us-ascii?Q?+st5y3earoqUJrKvKFiyR98EFKMIZJgSpvJvWiIteYMDa2ue0kxqPNsPWAg/?=
 =?us-ascii?Q?yXrRlVNWRCfpdRUapxwiXmFWkN6D6Pb4USghYIXqmvJ/fxK8aKlgTIPS3DMD?=
 =?us-ascii?Q?IroEqtkdbZLZkrtKwdS4zvyZAF65UkRrc+ehmvlZY9BRuxmer8spd+f8YjoZ?=
 =?us-ascii?Q?AR8wBQa/wDqPphNqDT0ktGa31etU9rhyakR5WfLTaptdVWmOd2j6/qMt6NoG?=
 =?us-ascii?Q?KdHhaSU8uyE+ExPegWEpoRliauz+w4jKQFiyFVc/Sv2STu+5CIa4eseT0W8L?=
 =?us-ascii?Q?M4vGhusNhvDRI4aplRD4Wi1fqiDmxSc8Ek577lkTAc6JvAY8QP7fuN5cRXfI?=
 =?us-ascii?Q?ZJZAgc27LC9o3c+v0FAiGvOvRnoDZMJO5fVnS/O/HGR09KkJoW31cZDT9XAo?=
 =?us-ascii?Q?RUaF7fM1fvsGKYoBDM2/YgXNkbGZSwA3OrUw7+qGsojt+ZM6x839GPxqivcQ?=
 =?us-ascii?Q?3EFknmSYM8Dprbf4TmyoW3Y//K7yMBzPeFpPDODtvAdCsZWzOoM9VBcSZSLD?=
 =?us-ascii?Q?I1SFZ3weSW/APQ1ad1tGlTJZoIrfqG82d1CarE2+IfXksDG8yvZ/tJ3YgLiH?=
 =?us-ascii?Q?8pQuWxRebft6O+AB7bqH751yHLbnXqlLsja0zI2pntb3qqgb46mrBGmYCpqD?=
 =?us-ascii?Q?64GorSS9aV2he89G389DiXvK3DPYoODhov9WraDiZpN3yClD1fFUMa7VPCm8?=
 =?us-ascii?Q?rxn1UkX1ExARvB6WZ7EQj4eAvziCArpmk4BMCgmtRCyMiDVqy3RJ1IIp9zAk?=
 =?us-ascii?Q?J1BCa9SQHUdNH2cXDsiW6WQtnmWBmzQaFZ2JoJzQgA9ssYfPtqmH5Muc11ry?=
 =?us-ascii?Q?JFUd+I6Aq9NYKL9tFlW31kvIkls4UgR00kpb3f5drwkDTlB3F8u3WPd063Jz?=
 =?us-ascii?Q?DcJgkGiUnlaWNhf8oidKlXTf8ka8eQmS9FynDOIlyoCyyMTXG0IXOsR3Fzj7?=
 =?us-ascii?Q?NLF6ALJjZJyFaTZ1zg3G9pt5tEr5VU6CVC7DHnpk99jkU/krwbOzXPyP7A83?=
 =?us-ascii?Q?S06ieq1Mnn9ERqZRYAUqhfFX4TvrYgYBpRvH4EThdTTwzseEZYliHjOAaFNk?=
 =?us-ascii?Q?Lhwv3BbZFjbEzEwglgtX0EWgdIBCLh5dj2JgcqybTVm+HpcYiZBNcUaAWPaN?=
 =?us-ascii?Q?su56BpTCUhOOGtSm/IiaMbs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca4ed1e-3702-4501-ff71-08da5b01f5ed
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 01:35:20.9139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /y4VYaFvmn0xOl1oBXJc2xCHgASMAWUXnBFx4c5kTcnb2aeYLPX3rLR7QUC2Avk9Y0IWPe8idH+CfTldtl8pTFg3DuJv2xYM4rxIX8+VsfF/ucnrTcZMwtFJ2nq/thxu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9275
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

These are v4 of V4H (r8a779g0) pinctrl patches.
These are based on renesas-pinctrl/renesas-pinctrl-for-v5.20.

As I have mentioned before, I want to keep original code as much as
possible to avoid unexpected bug. [03/23][04/23][05/23] are for it.
[04/23] or later are incremental patch.

These are based on Rev.0.51 datasheet, but we already know that it has
many unclear point, mismuch, incoherence, etc.
I have asked it to HW/Doc team and it will be fixed on new version datasheet,
but we still don't have it yet. This patches including the information as much as
possible. We need to update the code when new version datasheet was coming.
But, these are not direct issue for current existing board, it should be OK for now.

You have mentioned that you are thinking MODSEL5/6 setting is needed for MII case too,
and I have asked it to HW/Doc team. It seems MII don't need the MODSEL settings,
but their comment was not very clear for me. Because they are very busy, it is difficult
to have frequent communication with them.
I think current code is OK, but we need to double check it when new datasheet was coming.

Because it is related to DT, some IP which suffix might be updated on new datasheet
has /* suffix might be updated */ at SH_PFC_PIN_GROUP()

v3 -> v4

	- add Geert's Reviewed-by if it already got
	- uses original value for MODSEL8 on [03/23], and will be fixuped on [05/23].
	- suffix fixup IRQ4 -> IRQ4_A
	- suffix fixup on comment "xx#" -> "xx_N"
	- suffix fixup xxx_A_N -> xxx_N_A
	- remove unused IPxSRx/MOD_SEL lines
	- remove POC2, not comment-out
	- FlaxRay -> FlexRay
	- merge same pin groups
	- fixup comment MDSEL4/5 -> MODSEL4/5
	- add /* suffix might be updated */ on some IP. We need check it when
	  new datasheet was coming. [20/23] doesn't have it, because maybe
	  it doesn't have suffix issue.

v2 -> v3
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

Kuninori Morimoto (21):
  dt-bindings: pinctrl: renesas,pfc: Document r8a779g0 support
  pinctrl: renesas: Add PORT_GP_CFG_13 macros
  pinctrl: renesas: r8a779g0: fixup MODSEL8
  pinctrl: renesas: r8a779g0: remove not used NOGP definitions
  pinctrl: renesas: r8a779g0: remove not used IPxSRx definitions
  pinctrl: renesas: r8a779g0: remove not used MOD_SELx definitions
  pinctrl: renesas: r8a779g0: tidyup ioctrl_regs
  pinctrl: renesas: r8a779g0: tidyup POC1 voltage
  pinctrl: renesas: r8a779g0: add missing TCLKx_A/TCLK_B/TCLKx_X
  pinctrl: renesas: r8a779g0: add missing IRQx_A/IRQx_B
  pinctrl: renesas: r8a779g0: add missing HSCIF3_A
  pinctrl: renesas: r8a779g0: add missing HSCIF1_X
  pinctrl: renesas: r8a779g0: add missing SCIF3
  pinctrl: renesas: r8a779g0: add missing SCIF1_X
  pinctrl: renesas: r8a779g0: add missing CANFD5_B
  pinctrl: renesas: r8a779g0: add missing TPU0TOx_A
  pinctrl: renesas: r8a779g0: add missing FlexRay
  pinctrl: renesas: r8a779g0: add missing PWM
  pinctrl: renesas: r8a779g0: add missing ERROROUTC_A
  pinctrl: renesas: r8a779g0: add missing MODSELx for TSN0
  pinctrl: renesas: r8a779g0: add missing MODSELx for AVBx

LUU HOAI (1):
  pinctrl: renesas: Initial R8A779G0 (V4H) PFC support

Phong Hoang (1):
  pinctrl: renesas: r8a779g0: Add pins, groups and functions

 .../bindings/pinctrl/renesas,pfc.yaml         |    1 +
 drivers/pinctrl/renesas/Kconfig               |    5 +
 drivers/pinctrl/renesas/Makefile              |    1 +
 drivers/pinctrl/renesas/core.c                |    6 +
 drivers/pinctrl/renesas/pfc-r8a779g0.c        | 4259 +++++++++++++++++
 drivers/pinctrl/renesas/sh_pfc.h              |    9 +-
 6 files changed, 4279 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pinctrl/renesas/pfc-r8a779g0.c

-- 
2.25.1

