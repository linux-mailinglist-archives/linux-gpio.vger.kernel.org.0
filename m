Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA92A54A90F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 07:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235972AbiFNF7Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 01:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbiFNF7P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 01:59:15 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2099.outbound.protection.outlook.com [40.107.113.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B0F3585C;
        Mon, 13 Jun 2022 22:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRs5x+qS+8OstOZ2OkA1Ds3T8AxFrBjaASBY/iDkPoAChvw8F34aYbIP+SA7dJ/WyT5o0vQZba3DmrWDd8aZkVzokZ5vRdifazMBzaCzJdiZiIJc0buuDSg3FKvuGzwo1eEcVI3sbMQf9EGQutlRNzs/gUIzl6QsiAYj5KW6YA/wcRydCbhFLOwgFjy5D/BuI9sxgRpEScgRVaQXcn9F2Jf1rJkC9FhCGAYJnaxRrTFRPLrg87xStqFu0ojxRAqikMUIhT0pSnNDL4WbXmYYYMUpTTn3DbGr+toa3wuUBxYuTe/gmikqUTJ54q6OLkGuEBoWgdujZTFRJebHPa4v2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/etd4b4ldXP9X/7BSAugtOd82cfhP6Xh7GVDCxmCf4=;
 b=bpxQbrW66BiLe5DmH6AaH5EgpP0/aE2UtGlLBi53pPKVRiXyg7qCUT5V6Cyt9yWIvRoLVMTHaFy2hPtGHn3n5K4eUWMgEjLWb4c8Z8oigFDq8QP2DuG/+pspJ/H6Zvcom78N1eJA5CySNXIpDox+Jx4TrOP3tIkLdPK5WcX9Es0o/Jj/+VEjvxGLc+f7XB63oNmKRLxP+uw7dbm42VssgTCE9aa9+CwD7bhpZcBUOfaU5fEarYxMukAZ9OdALYxKXaHR+8vumYR0odtVfiyooIRooyt3QcOfvmUespOXDKckZa8MVov4IGwUoSGXFDUfSqV8gV0/+mSlE3Yt5DGzlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/etd4b4ldXP9X/7BSAugtOd82cfhP6Xh7GVDCxmCf4=;
 b=bwJLHAQPwKx5gQ1ZkxyIKBRAVYeBaQR3rN+ez5/PShX8Nhr7anTsGXZlTrSYJSFdnpkMmM2BWPQR8tem0eVh6TBrqWF0YFNzCM40OZrUOy3ipH6D1niNYpOImjs9MBfM3N50Vme3NqF9Wr3fV4Q7nk7yylgtaKgTq5wfsuYMKwQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB3613.jpnprd01.prod.outlook.com (2603:1096:404:c5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Tue, 14 Jun
 2022 05:59:09 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 05:59:09 +0000
Message-ID: <87v8t3kcpe.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 06/21] pinctrl: renesas: r8a779g0: remove not used IPxSRx definitions
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Jun 2022 05:59:09 +0000
X-ClientProxiedBy: TYAPR01CA0118.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::34) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 770b5960-5d45-4249-c665-08da4dcaff99
X-MS-TrafficTypeDiagnostic: TYAPR01MB3613:EE_
X-Microsoft-Antispam-PRVS: <TYAPR01MB3613D9C4B86CEBCAC6736C94D4AA9@TYAPR01MB3613.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n2ZqHO8Z4Xe34luieJOlShznq2i4+ilphcxwRkqBSv8Pbd2o/ILG34ZOVYWILnX1rWAmKWbrn1wNcSwn2NT9H0/IH1SqZXqQ2rdCPZSwuQdUf1fvrXTqS1rleAKnv793iHO5Obl80QKMgD49w65j3jJuGgsFSaDGFfk0yDbKjzFnvzHC1lS8XAhUwzc+nNCLleiCVpVy2hd/EAS5hXH9uaxK+ssoeQIHtkTiUG7GIufNYf+a4lHUcvqchzU1v21x/VtpLOZvf75okYFYFKbm3OF7djjQMCM3yKd0AHbdSm3mo7lPQeZWMZt24OfKWUBT6tFPSFr/BhJ0yW2AFjnGtefysxHj1qeLikiylLb6Zpz3nTIl7t74xrnwlLQS/O+laD3cKEOxyh6/nvm/HHNEFBktoqnulLC7kHtz9Qx3yd8ov8EXPwztWUnATaG2ZWBtdeHUQGcY8pYuSE5aj30pSRiZNh1fjklOOXsQPhM18GA7CGKKZdvN04Vl71SUNDcwLkUgPE722VRDxyAZP3DhLChZW5FB8/+fP4LsV4CNgJ887RGgXpfzb5VKL0u3SbEReGHjS192Iyvv+EgSUhZ4XgB+IVJWeTrwsdymCIhDwck6Dve4UHvPcyyXxIGo6ktR2EmXohbuOREEqm7Lq7r+OqRRUexwQhRYW3013FsLuS0NH3gJmHfM9FOl0EqQ0cmPR967/bCzh/R68C19BOL9rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:is;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(316002)(36756003)(2906002)(2616005)(6506007)(38100700002)(38350700002)(52116002)(86362001)(4326008)(8676002)(6512007)(66476007)(66946007)(66556008)(30864003)(186003)(26005)(8936002)(6486002)(83380400001)(508600001)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xO26Zqo35CBmC6kx4ruJA0PlsqIrSS6UkyCTcjlXkTKZEoTjLsauGc5cOnpO?=
 =?us-ascii?Q?/eY3+47L7asnsaEK0Qe0mL/ET++7S8HN9zvmx+PoJl76rQtPpV7AjidyJ7wj?=
 =?us-ascii?Q?OAmEMYxGoD3AygqKpLqauc26FfwWovP7w1Idz3X9gESukQgGt6SeYN+ie3pq?=
 =?us-ascii?Q?1/CBFfzlmyDZ6y/Yt3y9w5Cc4f2XumTlPROhTgf4dbIhbyYwNb/W4tKEje7k?=
 =?us-ascii?Q?UMuuNvCfF92ZaKPOIu5nmL4iyZN3T7exBmIo0OVk89XNbuJVIDGVUd63c+p7?=
 =?us-ascii?Q?eFKdXyW8WJsHUg3pmOHesPRcfsED4wz6FhD9WFEIeeLhe1hbqAabtmRGTIXj?=
 =?us-ascii?Q?jcwHdHBJI133g+JepOhB8C6+InxjRhVMtAN66mr/3NdWdsdjzYdKNEb4a7Uh?=
 =?us-ascii?Q?obB8gSa8qrXfXUmo63SpDHTAVOY//zW5/ukSP1MNfRpPjj90ffdoYJIHyfxJ?=
 =?us-ascii?Q?/6t6doc1erA0F4CICekMzz6yf3bqM+/H8uRkNXrCCBWcZkRW8Cp78fCD3mNf?=
 =?us-ascii?Q?0RAiVDx+lHuhGp2+hs8waSLtGfiAJfSXrmKSYoVl6vLK/CtmgrqxoFnVLDRY?=
 =?us-ascii?Q?v0Wc3FUN/B7s1X2ajdrTAgsOXCs08Lt6Cz/NWnwtinUBllqPevMCYh1DQhPN?=
 =?us-ascii?Q?mY/x6FCQ2m17c7BMQVdqW5ENML/W4+eJGyRqrw7If4xyphaNX3f6AK6jyY2N?=
 =?us-ascii?Q?5h1xCxWxC2Z2RLMqZn1Jp/4xu3PbsF35uVn1DnlWcxmiWAVPWC/DqGuHrxFI?=
 =?us-ascii?Q?DP+K5QKbV3cFtl3A5qnD/faI7qvTvs+IIal3CFPrfk7ddPbS52AKcK+9EE4f?=
 =?us-ascii?Q?VmB7nA+ZZiUnMhLpeyxKDS/1gpb4ib2yAciYfOhSOild66zfhUYuJLLgoDz2?=
 =?us-ascii?Q?f48IZGbmU/cjn0yQfPMhin+x/z35eieEO6rvIpWGsgSExEA47oyxiys3CQIk?=
 =?us-ascii?Q?Fq5msnwdSKSocR2Gk/yLC/r1R0B8Zjjv+a98xjCutgpaIvO2PpOel4RW4Kzc?=
 =?us-ascii?Q?v0Y3m5Z4tc/IBe7sOa7DDw1ACrb0s2G4/ANbmVxC1SHfG7icBlfqTshH5noj?=
 =?us-ascii?Q?YtDDlTlrxlgtE/VOTrx1WEpzYjIe5JnJ6ItjqXRQrd+Y8FYO1vPdf78n6YDO?=
 =?us-ascii?Q?Qz6nlOhUdRbbH3Ac5+2CjDKNI86k+NoHR6S0Kpq8igW7BBoY4MMwzKU8Lfzt?=
 =?us-ascii?Q?IZMvHH5dNW0ebwyAa+foIz2qPoXFtjE8Nz+b9D5p5KABpDWVViBQ/zS4xxpZ?=
 =?us-ascii?Q?EIEjTlq3p765f0cMgtW74kV+j9yci/2QVYrUxRT+BhnGtziNalyys12aGw6p?=
 =?us-ascii?Q?B1qS+zlYFXJJUI9p8SEwua41MdVDLA6wr4PlCjXLD3aDl0J4Rffr/oSadpMm?=
 =?us-ascii?Q?h/AfxoHCiqRy9C31ssNKuOAjhTnms79JxLdT5eTPzn+6dLwPpQcUNwOJj5ZW?=
 =?us-ascii?Q?kUP2eQr1BfyNlDcxzpoXcPfzDqMPuoHaQsUkPs/H/d5ct4LXV8AxF1VQ5M9N?=
 =?us-ascii?Q?Mgj/UM4Q72U3pwGCcwv5fUbEC2PioRzFiVFmTck6uWy/evXneP9gtKK0SHna?=
 =?us-ascii?Q?ki3Q4nPLOGHAvU3wCk2EBPaZgj1GmWPzNGCM1SmooEsmB8yqzV9HLz00Q3a7?=
 =?us-ascii?Q?Q+S56HtUWz+fPsPArz3fUdMeQ71Vf0cO6/xU8fAl5iyr8MNoCSJEyqKx7O5o?=
 =?us-ascii?Q?Oi2Dintt/g5oAA5Vl3gfQzfRS0rWAO+D26tCQrs8hkDSJzZxHhlX82ik4XsV?=
 =?us-ascii?Q?I7HMlNsFj/CjXOW2OBUMsjkncaU7EE/lnlrjLa0SudWL9ovOXGgn?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 770b5960-5d45-4249-c665-08da4dcaff99
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 05:59:09.8346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 91eOazWXF4TMjivPGCAtr8ozvOp5CisUoR3GQwQnIiJ9o4mAXiTJLgLBpGtLD/Ky472luPp6KpExQ4426sQdbPRTRYHQikmqxd4FY7mXWuXkmTQwQ3ZHOouGE5rwPIC9
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

Current V4H PFC code has many IPxSRx definitions with all 0.
But these have no meaning. This patch removes these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 67 +++++++++-----------------
 1 file changed, 22 insertions(+), 45 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 1716399350dc..d049bb71dfe8 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -286,11 +286,6 @@
 #define IP2SR0_3_0	FM(MSIOF2_TXD)		FM(HCTS1_N)		FM(CTS1_N)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR0_7_4	FM(MSIOF2_SCK)		FM(HRTS1_N)		FM(RTS1_N)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR0_11_8	FM(MSIOF2_RXD)		FM(HSCK1)		FM(SCK1)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR0_15_12	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR0_19_16	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR0_23_20	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR0_27_24	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR0_31_28	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* SR1 */
 /* IP0SR1 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
@@ -329,9 +324,6 @@
 #define IP3SR1_11_8	FM(HRTS3_N)		FM(RTS3_N)		FM(MSIOF4_TXD)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3SR1_15_12	FM(HCTS3_N)		FM(RX3)			FM(MSIOF4_RXD)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3SR1_19_16	FM(HTX3)		FM(TX3)			FM(MSIOF4_SYNC)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR1_23_20	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR1_27_24	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR1_31_28	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* SR2 */
 /* IP0SR2 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
@@ -359,10 +351,6 @@
 #define IP2SR2_7_4	FM(CANFD4_RX)		F_(0, 0)		FM(PWM5)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR2_11_8	FM(CANFD7_TX)		F_(0, 0)		FM(PWM6)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR2_15_12	FM(CANFD7_RX)		F_(0, 0)		FM(PWM7)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR2_19_16	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR2_23_20	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR2_27_24	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR2_31_28	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* SR3 */
 /* IP0SR3 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
@@ -402,8 +390,6 @@
 #define IP3SR3_15_12	FM(RPC_RESET_N)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3SR3_19_16	FM(RPC_WP_N)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3SR3_23_20	FM(RPC_INT_N)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR3_27_24	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR3_31_28	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* SR6 */
 /* IP0SR6 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
@@ -432,9 +418,6 @@
 #define IP2SR6_11_8	FM(AVB1_TD3)		FM(AVB1_MII_TD3)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR6_15_12	FM(AVB1_RD3)		FM(AVB1_MII_RD3)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR6_19_16	FM(AVB1_TXCREFCLK)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR6_23_20	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR6_27_24	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR6_31_28	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* SR7 */
 /* IP0SR7 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
@@ -463,9 +446,6 @@
 #define IP2SR7_11_8	FM(AVB0_RD0)		FM(AVB0_MII_RD0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR7_15_12	FM(AVB0_RXC)		FM(AVB0_MII_RXC)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR7_19_16	FM(AVB0_RX_CTL)		FM(AVB0_MII_RX_DV)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR7_23_20	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR7_27_24	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR7_31_28	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* SR8 */
 /* IP0SR8 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
@@ -485,9 +465,6 @@
 #define IP1SR8_15_12	FM(SDA5)		FM(SCIF_CLK2)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR8_19_16	F_(0, 0)		FM(HCTS2_N)		FM(TX4)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR8_23_20	F_(0, 0)		FM(HSCK2)		FM(RX4)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR8_27_24	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR8_31_28	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-
 
 #define PINMUX_GPSR	\
 						GPSR3_29											\
@@ -526,29 +503,29 @@ GPSR0_0		GPSR1_0		GPSR2_0		GPSR3_0		GPSR4_0		GPSR5_0		GPSR6_0		GPSR7_0		GPSR8_0
 FM(IP0SR0_3_0)		IP0SR0_3_0	FM(IP1SR0_3_0)		IP1SR0_3_0	FM(IP2SR0_3_0)		IP2SR0_3_0	\
 FM(IP0SR0_7_4)		IP0SR0_7_4	FM(IP1SR0_7_4)		IP1SR0_7_4	FM(IP2SR0_7_4)		IP2SR0_7_4	\
 FM(IP0SR0_11_8)		IP0SR0_11_8	FM(IP1SR0_11_8)		IP1SR0_11_8	FM(IP2SR0_11_8)		IP2SR0_11_8	\
-FM(IP0SR0_15_12)	IP0SR0_15_12	FM(IP1SR0_15_12)	IP1SR0_15_12	FM(IP2SR0_15_12)	IP2SR0_15_12	\
-FM(IP0SR0_19_16)	IP0SR0_19_16	FM(IP1SR0_19_16)	IP1SR0_19_16	FM(IP2SR0_19_16)	IP2SR0_19_16	\
-FM(IP0SR0_23_20)	IP0SR0_23_20	FM(IP1SR0_23_20)	IP1SR0_23_20	FM(IP2SR0_23_20)	IP2SR0_23_20	\
-FM(IP0SR0_27_24)	IP0SR0_27_24	FM(IP1SR0_27_24)	IP1SR0_27_24	FM(IP2SR0_27_24)	IP2SR0_27_24	\
-FM(IP0SR0_31_28)	IP0SR0_31_28	FM(IP1SR0_31_28)	IP1SR0_31_28	FM(IP2SR0_31_28)	IP2SR0_31_28	\
+FM(IP0SR0_15_12)	IP0SR0_15_12	FM(IP1SR0_15_12)	IP1SR0_15_12	\
+FM(IP0SR0_19_16)	IP0SR0_19_16	FM(IP1SR0_19_16)	IP1SR0_19_16	\
+FM(IP0SR0_23_20)	IP0SR0_23_20	FM(IP1SR0_23_20)	IP1SR0_23_20	\
+FM(IP0SR0_27_24)	IP0SR0_27_24	FM(IP1SR0_27_24)	IP1SR0_27_24	\
+FM(IP0SR0_31_28)	IP0SR0_31_28	FM(IP1SR0_31_28)	IP1SR0_31_28	\
 \
 FM(IP0SR1_3_0)		IP0SR1_3_0	FM(IP1SR1_3_0)		IP1SR1_3_0	FM(IP2SR1_3_0)		IP2SR1_3_0	FM(IP3SR1_3_0)		IP3SR1_3_0	\
 FM(IP0SR1_7_4)		IP0SR1_7_4	FM(IP1SR1_7_4)		IP1SR1_7_4	FM(IP2SR1_7_4)		IP2SR1_7_4	FM(IP3SR1_7_4)		IP3SR1_7_4	\
 FM(IP0SR1_11_8)		IP0SR1_11_8	FM(IP1SR1_11_8)		IP1SR1_11_8	FM(IP2SR1_11_8)		IP2SR1_11_8	FM(IP3SR1_11_8)		IP3SR1_11_8	\
 FM(IP0SR1_15_12)	IP0SR1_15_12	FM(IP1SR1_15_12)	IP1SR1_15_12	FM(IP2SR1_15_12)	IP2SR1_15_12	FM(IP3SR1_15_12)	IP3SR1_15_12	\
 FM(IP0SR1_19_16)	IP0SR1_19_16	FM(IP1SR1_19_16)	IP1SR1_19_16	FM(IP2SR1_19_16)	IP2SR1_19_16	FM(IP3SR1_19_16)	IP3SR1_19_16	\
-FM(IP0SR1_23_20)	IP0SR1_23_20	FM(IP1SR1_23_20)	IP1SR1_23_20	FM(IP2SR1_23_20)	IP2SR1_23_20	FM(IP3SR1_23_20)	IP3SR1_23_20	\
-FM(IP0SR1_27_24)	IP0SR1_27_24	FM(IP1SR1_27_24)	IP1SR1_27_24	FM(IP2SR1_27_24)	IP2SR1_27_24	FM(IP3SR1_27_24)	IP3SR1_27_24	\
-FM(IP0SR1_31_28)	IP0SR1_31_28	FM(IP1SR1_31_28)	IP1SR1_31_28	FM(IP2SR1_31_28)	IP2SR1_31_28	FM(IP3SR1_31_28)	IP3SR1_31_28	\
+FM(IP0SR1_23_20)	IP0SR1_23_20	FM(IP1SR1_23_20)	IP1SR1_23_20	FM(IP2SR1_23_20)	IP2SR1_23_20	\
+FM(IP0SR1_27_24)	IP0SR1_27_24	FM(IP1SR1_27_24)	IP1SR1_27_24	FM(IP2SR1_27_24)	IP2SR1_27_24	\
+FM(IP0SR1_31_28)	IP0SR1_31_28	FM(IP1SR1_31_28)	IP1SR1_31_28	FM(IP2SR1_31_28)	IP2SR1_31_28	\
 \
 FM(IP0SR2_3_0)		IP0SR2_3_0	FM(IP1SR2_3_0)		IP1SR2_3_0	FM(IP2SR2_3_0)		IP2SR2_3_0	\
 FM(IP0SR2_7_4)		IP0SR2_7_4	FM(IP1SR2_7_4)		IP1SR2_7_4	FM(IP2SR2_7_4)		IP2SR2_7_4	\
 FM(IP0SR2_11_8)		IP0SR2_11_8	FM(IP1SR2_11_8)		IP1SR2_11_8	FM(IP2SR2_11_8)		IP2SR2_11_8	\
 FM(IP0SR2_15_12)	IP0SR2_15_12	FM(IP1SR2_15_12)	IP1SR2_15_12	FM(IP2SR2_15_12)	IP2SR2_15_12	\
-FM(IP0SR2_19_16)	IP0SR2_19_16	FM(IP1SR2_19_16)	IP1SR2_19_16	FM(IP2SR2_19_16)	IP2SR2_19_16	\
-FM(IP0SR2_23_20)	IP0SR2_23_20	FM(IP1SR2_23_20)	IP1SR2_23_20	FM(IP2SR2_23_20)	IP2SR2_23_20	\
-FM(IP0SR2_27_24)	IP0SR2_27_24	FM(IP1SR2_27_24)	IP1SR2_27_24	FM(IP2SR2_27_24)	IP2SR2_27_24	\
-FM(IP0SR2_31_28)	IP0SR2_31_28	FM(IP1SR2_31_28)	IP1SR2_31_28	FM(IP2SR2_31_28)	IP2SR2_31_28	\
+FM(IP0SR2_19_16)	IP0SR2_19_16	FM(IP1SR2_19_16)	IP1SR2_19_16	\
+FM(IP0SR2_23_20)	IP0SR2_23_20	FM(IP1SR2_23_20)	IP1SR2_23_20	\
+FM(IP0SR2_27_24)	IP0SR2_27_24	FM(IP1SR2_27_24)	IP1SR2_27_24	\
+FM(IP0SR2_31_28)	IP0SR2_31_28	FM(IP1SR2_31_28)	IP1SR2_31_28	\
 \
 FM(IP0SR3_3_0)		IP0SR3_3_0	FM(IP1SR3_3_0)		IP1SR3_3_0	FM(IP2SR3_3_0)		IP2SR3_3_0	FM(IP3SR3_3_0)		IP3SR3_3_0	\
 FM(IP0SR3_7_4)		IP0SR3_7_4	FM(IP1SR3_7_4)		IP1SR3_7_4	FM(IP2SR3_7_4)		IP2SR3_7_4	FM(IP3SR3_7_4)		IP3SR3_7_4	\
@@ -556,26 +533,26 @@ FM(IP0SR3_11_8)		IP0SR3_11_8	FM(IP1SR3_11_8)		IP1SR3_11_8	FM(IP2SR3_11_8)		IP2SR
 FM(IP0SR3_15_12)	IP0SR3_15_12	FM(IP1SR3_15_12)	IP1SR3_15_12	FM(IP2SR3_15_12)	IP2SR3_15_12	FM(IP3SR3_15_12)	IP3SR3_15_12	\
 FM(IP0SR3_19_16)	IP0SR3_19_16	FM(IP1SR3_19_16)	IP1SR3_19_16	FM(IP2SR3_19_16)	IP2SR3_19_16	FM(IP3SR3_19_16)	IP3SR3_19_16	\
 FM(IP0SR3_23_20)	IP0SR3_23_20	FM(IP1SR3_23_20)	IP1SR3_23_20	FM(IP2SR3_23_20)	IP2SR3_23_20	FM(IP3SR3_23_20)	IP3SR3_23_20	\
-FM(IP0SR3_27_24)	IP0SR3_27_24	FM(IP1SR3_27_24)	IP1SR3_27_24	FM(IP2SR3_27_24)	IP2SR3_27_24	FM(IP3SR3_27_24)	IP3SR3_27_24	\
-FM(IP0SR3_31_28)	IP0SR3_31_28	FM(IP1SR3_31_28)	IP1SR3_31_28	FM(IP2SR3_31_28)	IP2SR3_31_28	FM(IP3SR3_31_28)	IP3SR3_31_28	\
+FM(IP0SR3_27_24)	IP0SR3_27_24	FM(IP1SR3_27_24)	IP1SR3_27_24	FM(IP2SR3_27_24)	IP2SR3_27_24						\
+FM(IP0SR3_31_28)	IP0SR3_31_28	FM(IP1SR3_31_28)	IP1SR3_31_28	FM(IP2SR3_31_28)	IP2SR3_31_28						\
 \
 FM(IP0SR6_3_0)		IP0SR6_3_0	FM(IP1SR6_3_0)		IP1SR6_3_0	FM(IP2SR6_3_0)		IP2SR6_3_0	\
 FM(IP0SR6_7_4)		IP0SR6_7_4	FM(IP1SR6_7_4)		IP1SR6_7_4	FM(IP2SR6_7_4)		IP2SR6_7_4	\
 FM(IP0SR6_11_8)		IP0SR6_11_8	FM(IP1SR6_11_8)		IP1SR6_11_8	FM(IP2SR6_11_8)		IP2SR6_11_8	\
 FM(IP0SR6_15_12)	IP0SR6_15_12	FM(IP1SR6_15_12)	IP1SR6_15_12	FM(IP2SR6_15_12)	IP2SR6_15_12	\
 FM(IP0SR6_19_16)	IP0SR6_19_16	FM(IP1SR6_19_16)	IP1SR6_19_16	FM(IP2SR6_19_16)	IP2SR6_19_16	\
-FM(IP0SR6_23_20)	IP0SR6_23_20	FM(IP1SR6_23_20)	IP1SR6_23_20	FM(IP2SR6_23_20)	IP2SR6_23_20	\
-FM(IP0SR6_27_24)	IP0SR6_27_24	FM(IP1SR6_27_24)	IP1SR6_27_24	FM(IP2SR6_27_24)	IP2SR6_27_24	\
-FM(IP0SR6_31_28)	IP0SR6_31_28	FM(IP1SR6_31_28)	IP1SR6_31_28	FM(IP2SR6_31_28)	IP2SR6_31_28	\
+FM(IP0SR6_23_20)	IP0SR6_23_20	FM(IP1SR6_23_20)	IP1SR6_23_20	\
+FM(IP0SR6_27_24)	IP0SR6_27_24	FM(IP1SR6_27_24)	IP1SR6_27_24	\
+FM(IP0SR6_31_28)	IP0SR6_31_28	FM(IP1SR6_31_28)	IP1SR6_31_28	\
 \
 FM(IP0SR7_3_0)		IP0SR7_3_0	FM(IP1SR7_3_0)		IP1SR7_3_0	FM(IP2SR7_3_0)		IP2SR7_3_0	\
 FM(IP0SR7_7_4)		IP0SR7_7_4	FM(IP1SR7_7_4)		IP1SR7_7_4	FM(IP2SR7_7_4)		IP2SR7_7_4	\
 FM(IP0SR7_11_8)		IP0SR7_11_8	FM(IP1SR7_11_8)		IP1SR7_11_8	FM(IP2SR7_11_8)		IP2SR7_11_8	\
 FM(IP0SR7_15_12)	IP0SR7_15_12	FM(IP1SR7_15_12)	IP1SR7_15_12	FM(IP2SR7_15_12)	IP2SR7_15_12	\
 FM(IP0SR7_19_16)	IP0SR7_19_16	FM(IP1SR7_19_16)	IP1SR7_19_16	FM(IP2SR7_19_16)	IP2SR7_19_16	\
-FM(IP0SR7_23_20)	IP0SR7_23_20	FM(IP1SR7_23_20)	IP1SR7_23_20	FM(IP2SR7_23_20)	IP2SR7_23_20	\
-FM(IP0SR7_27_24)	IP0SR7_27_24	FM(IP1SR7_27_24)	IP1SR7_27_24	FM(IP2SR7_27_24)	IP2SR7_27_24	\
-FM(IP0SR7_31_28)	IP0SR7_31_28	FM(IP1SR7_31_28)	IP1SR7_31_28	FM(IP2SR7_31_28)	IP2SR7_31_28	\
+FM(IP0SR7_23_20)	IP0SR7_23_20	FM(IP1SR7_23_20)	IP1SR7_23_20	\
+FM(IP0SR7_27_24)	IP0SR7_27_24	FM(IP1SR7_27_24)	IP1SR7_27_24	\
+FM(IP0SR7_31_28)	IP0SR7_31_28	FM(IP1SR7_31_28)	IP1SR7_31_28	\
 \
 FM(IP0SR8_3_0)		IP0SR8_3_0	FM(IP1SR8_3_0)		IP1SR8_3_0	\
 FM(IP0SR8_7_4)		IP0SR8_7_4	FM(IP1SR8_7_4)		IP1SR8_7_4	\
@@ -583,8 +560,8 @@ FM(IP0SR8_11_8)		IP0SR8_11_8	FM(IP1SR8_11_8)		IP1SR8_11_8	\
 FM(IP0SR8_15_12)	IP0SR8_15_12	FM(IP1SR8_15_12)	IP1SR8_15_12	\
 FM(IP0SR8_19_16)	IP0SR8_19_16	FM(IP1SR8_19_16)	IP1SR8_19_16	\
 FM(IP0SR8_23_20)	IP0SR8_23_20	FM(IP1SR8_23_20)	IP1SR8_23_20	\
-FM(IP0SR8_27_24)	IP0SR8_27_24	FM(IP1SR8_27_24)	IP1SR8_27_24	\
-FM(IP0SR8_31_28)	IP0SR8_31_28	FM(IP1SR8_31_28)	IP1SR8_31_28
+FM(IP0SR8_27_24)	IP0SR8_27_24	\
+FM(IP0SR8_31_28)	IP0SR8_31_28
 
 /* MOD_SEL4 */			/* 0 */				/* 1 */
 #define MOD_SEL4_19		FM(SEL_TSN0_TD2_0)		FM(SEL_TSN0_TD2_1)
-- 
2.25.1

