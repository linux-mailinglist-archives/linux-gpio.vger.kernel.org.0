Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 360D254A923
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 08:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238080AbiFNGAa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 02:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiFNGA3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 02:00:29 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2135.outbound.protection.outlook.com [40.107.114.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B38835DC3;
        Mon, 13 Jun 2022 23:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grDVyjg0qPjGACXtsVL/fxqsgp6gzmAdBfB6RAuH2qiPsqvyO1bHmFa/p9Z+brxI+1uaN+R5AljWKBcX9LoxbIAYTdqrnTFFpysBFCO1M/bnNKrEyADK97ZWo9b1NRH6PnVs4LY1V7rZ9wH5kERhtAV+4aePcBANMuf2MtlGRhMudhK0702L6LkjZXRZ/E89aKLzog4pKMRaFOqEMcuhbXaXsNjL5H7qhy3+MhHjqfWwh8XRBfxgiNSYnIixwFx3jVO+m3wGfA+ROGnDruZoZsliUMnIkDs2sYHFeyDipTxRErWLThAH2t6ATIAyXnG36iXQMwzIFKm8mLrA1try8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWq4+laBX4PSZLuE7eH5Mwtw+qziR33+K/M7ffEcAaM=;
 b=QztckL/MtVYupn03HXyK33BlQLnrK66cyRltrzS2ktwdocvySyUzwkvKvPCXhwQ3rkX6Cv2iinkYn4nBKyfaiwPH6nnxvdmc05R5iUdTODarftFP3cC4URTmX8Mr7iN7/0F7+S2ov6llIW11eMqJsBKLN5bKIKFqnsoaI0M9ffvFNe5WCIpfmeWtfm74SoIxtdy/yv9Dk5ixam+QeyOTj7E4A6DHsfyOX7usGQbno7JBVZ756G8I9DhVZ/aaZF9DFkaz8asc6EjTrpUdClCmcmmWrga3/1UsYP37AESpyw+JwOvw4Pje9PntBTYmm6eUBsSQWgtgu5WOeH6GnIW+Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWq4+laBX4PSZLuE7eH5Mwtw+qziR33+K/M7ffEcAaM=;
 b=azjSiabrG6DbN1+4eynUmKMcrioTDATYYA8g/MMxzJe8MQJBIqx8GkqClXQkhRUPSPXIy6ZQzxHYXtmuW5TQSawY2hZVy34IVrd9hAUlOdqZdk/W0zEpi3G2QfXGhqtGAqyXm93lxQSbJLMUsSKL1Nc3/VYv65Yz32LSJM4F/uM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSBPR01MB3093.jpnprd01.prod.outlook.com (2603:1096:604:17::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Tue, 14 Jun
 2022 06:00:26 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 06:00:26 +0000
Message-ID: <87h74nkcna.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 16/21] pinctrl: renesas: r8a779g0: add missing TPU0TOx_A
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Jun 2022 06:00:26 +0000
X-ClientProxiedBy: TY2PR06CA0003.apcprd06.prod.outlook.com
 (2603:1096:404:42::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53e04e45-e75e-4168-43af-08da4dcb2d7f
X-MS-TrafficTypeDiagnostic: OSBPR01MB3093:EE_
X-Microsoft-Antispam-PRVS: <OSBPR01MB3093B8F4655AB45F86DEF4EBD4AA9@OSBPR01MB3093.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ecfKwgRRXGWcADTSIS6VNEhNQOOCZdoWwHmnyisl4cFtqJdarhWGVw/Z1M1onJ219PENLtN4kuGjfGTlCIp+fCreyfGZUqPFqYSdfuOmh7ux1Jjzkf5xqaWRY7t9sjHtWcAQ7MTeIT/faRnN3C3ecWsalX/wyATvq9tb+yq8K9A83xvKkeL2fsIELTDYxaxUiEQEc6Z0WEtibF/+swhRLGfgQ7cNxiyr+/W7wjC/sLF6g4GoE8ejPrdu/FtXQzrJBzT3zJ3ctTlldPX8hxnvzGFCXOk1tKuU1JunpYVQsbxOTRRBLMGjzGrj1YAQF3+1SecpxAXg9zAGz7hyKDaVvdeZf//ldftmevKlARdSNRBRZ1crBi/8KgtzPCs7ahdmYmdXEHGG1hM+XXNh5/T6WqXAy0jBynL5sqbmVp5a6pHj9Uw9OYSHZCfn/N7aLJ/m46FBNd9I2IZDD5ROnY/st5b1HZs8tpoFIqgNv/7IXb4yxEFDMeIToA/792TvOdR2HduSkF5PAax1y63vvRF6nKsnSH5Zai6zOocQOCATkMncTWl7jqgmj6kkFn+boTXe+xPuAOv5c52PijeZSGw8TbXOjdNH07KU0LvidsHPlf1++3W2hWNHz1moYqV2zEhBRTW+sUmTzuoUW96kuqfbmMlzgz9CXgm0rqMpWfeu82j0utYY5Wnq7dL/dNz9bVOBzGGFqWyCjsO9pBqQjDh9KQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(83380400001)(6512007)(36756003)(26005)(2906002)(6486002)(6506007)(52116002)(5660300002)(186003)(86362001)(2616005)(8936002)(508600001)(316002)(66476007)(66556008)(38100700002)(38350700002)(66946007)(8676002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v5SuX/tpzA+IqR6RP33eYZ3EkUeMNpgFMEEj7i1O5cHpnyHzjlys6Z7JPU5n?=
 =?us-ascii?Q?9QY4yGjMD3giCqQGMpXtC2RByaI+QHNkV+bletrzxFLt2RmcEVbuh1YPpS65?=
 =?us-ascii?Q?ViUdltE9lbaE64sUugi9itZlUXXHFxv4Rp7dgV8dcGPhU1TOrtMmOhVTDKfq?=
 =?us-ascii?Q?jhVyckVhvaQIGEoWHDAfGxk+AeRZBPKRzbCsWvzDjImx5KCvSH4Zya3KBPme?=
 =?us-ascii?Q?MulnmiJV/nMdYhgnqYqqQGnHe5EHuahCsKViYLP232h+kA+HIjHe+xqKmfFH?=
 =?us-ascii?Q?Ng3zoZnjTWMbWa4suDBqxj7ZPTuiaxhxwSuVJu9ZgK3sevS5h7KRAXLqe14I?=
 =?us-ascii?Q?xOHEEVsDiiLdkEaC9Z00/DeM2cRXIPcWKRYvyPcmpTzk/xkvxSTQRK/oheHU?=
 =?us-ascii?Q?yHDhqTadP37CadTaviI5vQOBFWIUFdGg2Qp8YMpUJztouyXlkieFI+mFycl8?=
 =?us-ascii?Q?zpl0V6+5BUmJshZVCk9dVB5rm3XZQtYsq3XP1G8lOccQhcJOcd6QtUpyCnhg?=
 =?us-ascii?Q?LlCx3C9Unk94/fTw+OipCQuta7pfTqQ1e/rdFk1xyq8zMs5bNUamPFE/2cRi?=
 =?us-ascii?Q?rnnN3pBvDLNaBLE+HRlJt7i1rbPnFFnHP0u58QfwABj8V04VrAPl3TE3BrYc?=
 =?us-ascii?Q?DWJFQ9OsJsRGQkfJK2yTyPZP93TK6Pv8EZs/1+a/vhTnOyTWOkE6KJciM7OW?=
 =?us-ascii?Q?WAKwvRhQkDA4QWYvSbSQNqmjFFI5dGoMfVh1KAYqcqfdgBHeBsfKlL+99pv1?=
 =?us-ascii?Q?AOne2psKi42fbzjy6nXPpFKPuhF0dc4Wms+QBn2rhariR/llFTk3wB5pxojc?=
 =?us-ascii?Q?yy3v/Bwt2Km2iuHvyyCgneLfUnap6WFsL6Is6/3s1TPSOVZ0jinbCbAXyIOD?=
 =?us-ascii?Q?osthABbQCns+Ch/mBBOl8b1yGNmkRvI6iCePvaxvjVtEOJSVi3hcMMjiYRAS?=
 =?us-ascii?Q?38Xo9mlTmmHwYRLhFL1Lr4OHNVm1J8MMG4Oi1dMIIOQRckjtb2gopHmYXw5E?=
 =?us-ascii?Q?LSYprCB8er1qglKqPS0FCMjLxc+DQEZnd9JwSwKr/Y5Yl1DURe321w1BcQtf?=
 =?us-ascii?Q?J+LIN1PkGbxImYHu6mvaO2yM3WFUND6Au2UFNyfKOfQe/ElKJAjorz9iPtVS?=
 =?us-ascii?Q?JEZKVFAX1NOP8x1ir036Yp7qkv/946SeG2YcV0bPFTFV/jNrLFhN5Jmi+ijT?=
 =?us-ascii?Q?GRa8pepm6dSr+cVQ4BEs3lScKPdOEPqESCzO6q3Ey9ZfNzs/L+oaBOEKECZb?=
 =?us-ascii?Q?L45cBPyFhcKodplwAxq+IFoygpxtngrQ672J4FsmX95UmKWVQd7G4ff9Z+P1?=
 =?us-ascii?Q?FQT1Km+4nkqtaGxdPDjrLELWkF3YnSR2fQ13WBPv+T+XA/WkFQFK0hvxGW+b?=
 =?us-ascii?Q?QrenGGn6lv9XyM1NPZ74YrqyzX/V8PZiVYIXYHdWnbnZ0ejeH/+yDflTQQqF?=
 =?us-ascii?Q?QS5eVv5CAH6A8Yjfai8JTPW3nUQq4qYlhmYfoK3peeYx4dRfgypsNJCwdURT?=
 =?us-ascii?Q?FL/emMihRzRpLiwDkxo/fmM6IcbdMMzRBDuiq/LWeGkHpxe8XymjrM71Ncr7?=
 =?us-ascii?Q?JfyqCCCzpux54AxWEjcvy4ynOJq70AHSh+hpw+uQJ2Rwha5Wm+sREPtK1JHa?=
 =?us-ascii?Q?/f5dR/GeQ7mJfiPJ20zhK95suwoOpnff6HvwkI3UKbLH7m12GWCjw/KNSmW5?=
 =?us-ascii?Q?c+pGh5UTzooniqt4d+40vEvR48lqLEFq26ERNS0N/FZslV2Q4bTqyD70MFb5?=
 =?us-ascii?Q?DxK40D0eWn60zfpthAKXhUCwN8dt3ii4Q/tA5s10cDm8qzHcE0gs?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e04e45-e75e-4168-43af-08da4dcb2d7f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 06:00:26.5079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hSvMfA26YL4vk9XE3e6Y8dkb4sE+2S4w4snLtY47jqiDYFj3EE06mcAwvzoGbMCfB+YP49WFDDBrol2vYgaVKfhEav7TRT8F+Tgpxdk85z5X3p0vkGL0mZx4vXvi6+za
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3093
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

This patch adds missing TPU0TOx_A

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 54 ++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 5bee4ab2d132..18881a651d1b 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -320,15 +320,15 @@
 
 /* IP3SR1 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
 #define IP3SR1_3_0	FM(HRX3)		FM(SCK3_A)		FM(MSIOF4_SS2)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR1_7_4	FM(HSCK3)		FM(CTS3_A_N)		FM(MSIOF4_SCK)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR1_11_8	FM(HRTS3_N)		FM(RTS3_A_N)		FM(MSIOF4_TXD)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3SR1_7_4	FM(HSCK3)		FM(CTS3_A_N)		FM(MSIOF4_SCK)	FM(TPU0TO0_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3SR1_11_8	FM(HRTS3_N)		FM(RTS3_A_N)		FM(MSIOF4_TXD)	FM(TPU0TO1_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3SR1_15_12	FM(HCTS3_N)		FM(RX3_A)		FM(MSIOF4_RXD)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3SR1_19_16	FM(HTX3)		FM(TX3_A)		FM(MSIOF4_SYNC)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* SR2 */
 /* IP0SR2 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP0SR2_3_0	FM(FXR_TXDA)		FM(CANFD1_TX)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR2_7_4	FM(FXR_TXENA_N)		FM(CANFD1_RX)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR2_3_0	FM(FXR_TXDA)		FM(CANFD1_TX)		FM(TPU0TO2_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR2_7_4	FM(FXR_TXENA_N)		FM(CANFD1_RX)		FM(TPU0TO3_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_11_8	FM(RXDA_EXTFXR)		FM(CANFD5_TX)		FM(IRQ5)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_15_12	FM(CLK_EXTFXR)		FM(CANFD5_RX)		FM(IRQ4_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_19_16	FM(RXDB_EXTFXR)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -919,10 +919,12 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP3SR1_7_4,	HSCK3),
 	PINMUX_IPSR_GPSR(IP3SR1_7_4,	CTS3_A_N),
 	PINMUX_IPSR_GPSR(IP3SR1_7_4,	MSIOF4_SCK),
+	PINMUX_IPSR_GPSR(IP3SR1_7_4,	TPU0TO0_A),
 
 	PINMUX_IPSR_GPSR(IP3SR1_11_8,	HRTS3_N),
 	PINMUX_IPSR_GPSR(IP3SR1_11_8,	RTS3_A_N),
 	PINMUX_IPSR_GPSR(IP3SR1_11_8,	MSIOF4_TXD),
+	PINMUX_IPSR_GPSR(IP3SR1_11_8,	TPU0TO1_A),
 
 	PINMUX_IPSR_GPSR(IP3SR1_15_12,	HCTS3_N),
 	PINMUX_IPSR_GPSR(IP3SR1_15_12,	RX3_A),
@@ -935,9 +937,11 @@ static const u16 pinmux_data[] = {
 	/* IP0SR2 */
 	PINMUX_IPSR_GPSR(IP0SR2_3_0,	FXR_TXDA),
 	PINMUX_IPSR_GPSR(IP0SR2_3_0,	CANFD1_TX),
+	PINMUX_IPSR_GPSR(IP0SR2_3_0,	TPU0TO2_A),
 
 	PINMUX_IPSR_GPSR(IP0SR2_7_4,	FXR_TXENA_N),
 	PINMUX_IPSR_GPSR(IP0SR2_7_4,	CANFD1_RX),
+	PINMUX_IPSR_GPSR(IP0SR2_7_4,	TPU0TO3_A),
 
 	PINMUX_IPSR_GPSR(IP0SR2_11_8,	RXDA_EXTFXR),
 	PINMUX_IPSR_GPSR(IP0SR2_11_8,	CANFD5_TX),
@@ -2357,6 +2361,36 @@ static const unsigned int tpu_to3_mux[] = {
 	TPU0TO3_MARK,
 };
 
+/* - TPU_A ------------------------------------------------------------------- */
+static const unsigned int tpu_to0_a_pins[] = {
+	/* TPU0TO0_A */
+	RCAR_GP_PIN(1, 25),
+};
+static const unsigned int tpu_to0_a_mux[] = {
+	TPU0TO0_A_MARK,
+};
+static const unsigned int tpu_to1_a_pins[] = {
+	/* TPU0TO1_A */
+	RCAR_GP_PIN(1, 26),
+};
+static const unsigned int tpu_to1_a_mux[] = {
+	TPU0TO1_A_MARK,
+};
+static const unsigned int tpu_to2_a_pins[] = {
+	/* TPU0TO2_A */
+	RCAR_GP_PIN(2, 0),
+};
+static const unsigned int tpu_to2_a_mux[] = {
+	TPU0TO2_A_MARK,
+};
+static const unsigned int tpu_to3_a_pins[] = {
+	/* TPU0TO3_A */
+	RCAR_GP_PIN(2, 1),
+};
+static const unsigned int tpu_to3_a_mux[] = {
+	TPU0TO3_A_MARK,
+};
+
 /* - TSN0 ------------------------------------------------ */
 static const unsigned int tsn0_link_pins[] = {
 	/* TSN0_LINK */
@@ -2588,9 +2622,13 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif_clk),
 
 	SH_PFC_PIN_GROUP(tpu_to0),
+	SH_PFC_PIN_GROUP(tpu_to0_a),
 	SH_PFC_PIN_GROUP(tpu_to1),
+	SH_PFC_PIN_GROUP(tpu_to1_a),
 	SH_PFC_PIN_GROUP(tpu_to2),
+	SH_PFC_PIN_GROUP(tpu_to2_a),
 	SH_PFC_PIN_GROUP(tpu_to3),
+	SH_PFC_PIN_GROUP(tpu_to3_a),
 
 	SH_PFC_PIN_GROUP(tsn0_link),
 	SH_PFC_PIN_GROUP(tsn0_phy_int),
@@ -2906,6 +2944,13 @@ static const char * const tpu_groups[] = {
 	"tpu_to3",
 };
 
+static const char * const tpu_a_groups[] = {
+	"tpu_to0_a",
+	"tpu_to1_a",
+	"tpu_to2_a",
+	"tpu_to3_a",
+};
+
 static const char * const tsn0_groups[] = {
 	"tsn0_link",
 	"tsn0_phy_int",
@@ -2981,6 +3026,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(scif_clk),
 
 	SH_PFC_FUNCTION(tpu),
+	SH_PFC_FUNCTION(tpu_a),
 
 	SH_PFC_FUNCTION(tsn0),
 };
-- 
2.25.1

