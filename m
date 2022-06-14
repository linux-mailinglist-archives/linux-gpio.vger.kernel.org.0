Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E386A54A916
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 07:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238483AbiFNF7v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 01:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233258AbiFNF7t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 01:59:49 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2108.outbound.protection.outlook.com [40.107.114.108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5353F35A9F;
        Mon, 13 Jun 2022 22:59:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZaey8f+HnH+R9dOmF3606k2Tlazc7P3VXbYo2c8kqtfnjLeJHBLRcmnoNVmrSk0sYyuU/TSH6h6zhAfV8nuNCNUMs5nWJNFVZ05nlyRyjGNVTF5qDLnfTqxE/VcKbTjoKMYfA4wLh5+ZN++TKEDIu8V6WEWzK1+IzbWKkLI6BfvRJ9WOP+7JZymgfm2KakzMrWKqcft2cToUKn8I4jl8t+gps+PoxM0AfdFhc937zcVkJn171Jd2qLLjOxQtahUYn9v8vxI1EDchigDWgar6HuiPKxLWPIAge5nqqajXJldT+sEKQO6UbKWSbLzkKbmY6u+fYwfTRezIZ5i+KdbAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gy0SItlweDDl9f8qavrQSiZKRrCfnWmZl1D5UndDmIw=;
 b=CChkzN00keSx6kVoEZmghBCKGxBUn5HbYfZwbAOKWNoO5WgoY6mXUbn3ThVIVJNkCnKKefhw67W2F6CjOgHJ9wcHtlIqumyaFJSjjWjZfswAzaIHMGhHWRu8te3STGC+oMtQdh92agVynXnQUK3OAmpBPctkDMANS/YNrQYfB2a+KbCCiVpD7BDayiJX5AAzqjwvm7RMabnCX9yj4PXc8fdezsVBoQXBfsGEtgQkTyoD8axjAJuP8fFXGMBYqGr4pOxqTqteyoIgjlpfStF4EOFBqoTmxVONVf9Qq488sLFd86Tg6ul/qMl3RM8VDZKPLFXEo4TX1oB9AKOrLDWcmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy0SItlweDDl9f8qavrQSiZKRrCfnWmZl1D5UndDmIw=;
 b=eN2xZcCiL1G2TSZdKafIjAY06Kbe9yC1gcQZ1u2cKstzySUlt7xve93fQgM15Y1EN6pb8/W5McZgplrnP5DSj4oG8Jso7Y/rDtqv8w36iYxCFKXYp2fyqSW3/AW/eZmdTlKZp7UQZgzbthg3h22mS94jRWmfhlMkBkQ/RK42f00=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB2142.jpnprd01.prod.outlook.com (2603:1096:404:5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Tue, 14 Jun
 2022 05:59:46 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 05:59:46 +0000
Message-ID: <87o7yvkcoe.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 11/21] pinctrl: renesas: r8a779g0: add missing HSCIF3_A
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Jun 2022 05:59:46 +0000
X-ClientProxiedBy: TYCP286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f7c9b4c-20e2-416d-192a-08da4dcb1584
X-MS-TrafficTypeDiagnostic: TYAPR01MB2142:EE_
X-Microsoft-Antispam-PRVS: <TYAPR01MB214216A4E42D8AFF9F4E8D6CD4AA9@TYAPR01MB2142.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ArRUq1aRpkbgyEZmGWYqQ4mU5Dio3VbR56PoAJzf/QWfE6/ZbEpZnrnWnTIq487USGfdJ/6bSdzBexudwkxRU2Y5ojLwfAD+fYIcbsZRPFd7JTwGPo43GT6aWhSzI1p+RC2mv4IARpBg3eeakcThdVdVi091Jd7ZZyas/4CPpyWezPS0nqcoqltoHK1ASMlh0u3MzBMYjztdBZe/naD73dA3XQdiNXTtb1Zb95xeLiq7MkTP69XL6zSe7trDuGEoLJKOOXK7P447n65H+yAq6pnGnCxgU0n/IO5ecAHTT9QcjsnTlrX8Nc131W2DkqQhF3LxJDO1g+3jlHl/A9Z69Po5NeON0/QG2A2V6ivMhtPSdenZ22C56wRd2pPjuyDhE0TrVTGBuIm+rl+1jXQ+nmMN/SiGL2bZDK98JSM+aqF+oL3GS4yLhnmjVO9YRn4mgX6h+j+7HBFrNC+CXI+zhEo1ZbuN80cwYe6ItexPfIGRYEwtOuHLTExEwwABe4bZRoNoiPeBk4RZ08Qn8QIvjmKyMa7af0q30t5lMSBkba4B26/oEtt5oMvKnPVZWwPjVyk8PdAd9pJcREqMsghfFSpV13gB1eZtavZEKDQcjijKlKD2kOx31cRnMC7lfJH3qbxKhJz9fFQm6WujOTTqF2W5jseSVvfi59AZlCA9nKQKPr2zbv1VtI0oVqNARL8cN4Y0dhHsi9JE7gTu8oCsUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(2906002)(8936002)(8676002)(4326008)(66556008)(38350700002)(38100700002)(66946007)(5660300002)(66476007)(316002)(83380400001)(508600001)(2616005)(6512007)(86362001)(52116002)(6506007)(186003)(26005)(36756003)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/4NMXoM1Oazo8HzRNt6ge5NFDxLRKzi3STY7wsP7UJyg/N7JiokEAWpFiE+P?=
 =?us-ascii?Q?4vFacJMon0bQkopx86LKS9OFyOYgZeQqWcocJ7pIFyDtMMIsJXD53dRtWxKg?=
 =?us-ascii?Q?WFShg4NIcTqPjSM2m2EPgLvhoHVzxl0pnu7nSON69bjLAV2P4s3s3YwauXMM?=
 =?us-ascii?Q?aRpEOF3YJyqHOE94LJXiYSNusg/31vSCt9rOqkxbYte5XEiSofC9mZxmCI2C?=
 =?us-ascii?Q?QUvowJEZTsyNJZU5GMpIzK5WPBO9bUrKTrgq4AytRyXB7DJOBNBhuJdtGeZp?=
 =?us-ascii?Q?x+6qsoTxZBtnSjYdHyW8FKhxqha5J537II6pcJ55kpkChnvdfoVmRb56wrTa?=
 =?us-ascii?Q?iJ8JQIqM9ZPxO5XmBKYuBcBQuiL29CQedPQMMFIq4QyFEq9V1HbRT7sSZ7bx?=
 =?us-ascii?Q?6SqJE+jGaz2fXW71e1BqfxJHdBuU/Ve2ID5Qwqan3un3ccQQg58WORqnNaA7?=
 =?us-ascii?Q?3fjTAx/BR4X4AvILfUwzJAznTjWxd33sZe/AJCNxw26Z7Afb9/0NTRp9YH/h?=
 =?us-ascii?Q?VKXiq6TJyDc0tY0sbo0eSsECMTwzXUFsJ0lUYKZzX5aHNXNiiZDPUqNdEvMB?=
 =?us-ascii?Q?VARdFlUzJOVyWCX9oTrwlxrC9FNgPtEVKUXZ3CShTpmfsiU/NO0aYU9E68/X?=
 =?us-ascii?Q?ZPYPiNxgNu3cudL8ruuSx/GuY6x6dMLuFgOX5cv27TebdPzAfqdI7cpldOVS?=
 =?us-ascii?Q?A26uBAprjYhmoB9YCloplNdClNCyDM1OWj8mnL3PLlgfcrXgmYkA+iIN0Jd2?=
 =?us-ascii?Q?p+50AOkgi6I7nv80Oye28ZltZyhoSHVUcldQmnboGnv1WqXCS0557ubrnjyc?=
 =?us-ascii?Q?nB9EoPCzUqmFRL0/Nm3W2ITXtiMBrpuvk9UPLWXfu1bs+dqiDodOktfjV4Os?=
 =?us-ascii?Q?a5ecCVZZA7llFCAIzRZlhJ3mffgom2X8EoVYz7FHJgqBTXZHewU9ls6vn8zL?=
 =?us-ascii?Q?01xKhQ0ETwTkuLVQZ+oz75yfon3wPxvnfNVyfhrdxINHwiw7GsB+NzBx3b1h?=
 =?us-ascii?Q?XsLxnY4Q1EiNgZbuRNznerIGSZUvuUfTfWqLNzYw8j5EXhNyRDXUzRWWqke6?=
 =?us-ascii?Q?5aRvAvNp3z05x2mo8mktAIXPsR82aZAROVaCbd6AjOxMQMZZ4+BeA1cUhbAx?=
 =?us-ascii?Q?22k2qrOrNM/+Ai6CjTCscR8muBbkfd92RC3m6y6pzcaLaf6mHdmHf2xLVWpZ?=
 =?us-ascii?Q?dzzkUyyPkIx7GCDpZHMNTmGa1vuhw1ZOWzNRLWjbFxK4mwWUxJpdtyofiIn6?=
 =?us-ascii?Q?5DFiyQLtoWej8/zTL8VoNQe4wGW4fSt5WDCzK+8vBZVW6MsO4LhX4U8mCc7m?=
 =?us-ascii?Q?R703Xq3UHT2qxxaWc5FdYfkI7QLnHcSM9BzVGaik4Aww0DYkA+rc9/NMP42t?=
 =?us-ascii?Q?Rqo1OoXOesfdiJ/e9w09aGTvOS25CwlLUOGhsUoo1zb60OsI9AbVcfznl77o?=
 =?us-ascii?Q?o4NU9/KnfYitpZc1IJG9rbXIbuEPysoXoZ6nMOFM3v6ldlrjt0NfrIkm6zuC?=
 =?us-ascii?Q?Nzi1MeNQx0FYIBpYkaH6zLYjOt8UEYkEhxGOZCX4uagAQ96yEGF01OLK0qIr?=
 =?us-ascii?Q?dc+6z+LqjgGOvniSFB2CqRwvO3TYr9X6y8IFMX+U3N2LLrHiVlU6gVk0gimr?=
 =?us-ascii?Q?E3kuxO0/fdvyqwPOrmhl4XvxQUyhLtUeBvDlRojw/kO8+YLbvMTTXX+gncoh?=
 =?us-ascii?Q?VIT9NySXAS0WRA7vg8ZrDnb82ZXIa/YjYorh3yDvJ1XgfaETHlLdl1dTrsr7?=
 =?us-ascii?Q?yUMkjW5C/hHuZdYv48xM34fbqUAapMTHJsH9PbfrvKWMr0W3cxLi?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7c9b4c-20e2-416d-192a-08da4dcb1584
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 05:59:46.2431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ZFtk2I/xMOqy9TlN8PMfPw1NG7IddzptSVxxX7lWUY5K/Q38d2Scqxc4/rc43GUiQKyEEswf7dlJCAq9ODgHNeHjX3QyICGgvX+gdUgLq1GF5X0rLXvtfTJxxbfli3W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2142
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

This patch adds missing HSCIF3_A

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 53 +++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 4e4ccbc32dac..d84fa59a0bcc 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -289,11 +289,11 @@
 
 /* SR1 */
 /* IP0SR1 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP0SR1_3_0	FM(MSIOF1_SS2)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_7_4	FM(MSIOF1_SS1)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_11_8	FM(MSIOF1_SYNC)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_15_12	FM(MSIOF1_SCK)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_19_16	FM(MSIOF1_TXD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_3_0	FM(MSIOF1_SS2)		FM(HTX3_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_7_4	FM(MSIOF1_SS1)		FM(HCTS3_A_N)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_11_8	FM(MSIOF1_SYNC)		FM(HRTS3_A_N)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_15_12	FM(MSIOF1_SCK)		FM(HSCK3_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_19_16	FM(MSIOF1_TXD)		FM(HRX3_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_23_20	FM(MSIOF1_RXD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_27_24	FM(MSIOF0_SS2)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_31_28	FM(MSIOF0_SS1)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -824,10 +824,20 @@ static const u16 pinmux_data[] = {
 
 	/* IP0SR1 */
 	PINMUX_IPSR_GPSR(IP0SR1_3_0,	MSIOF1_SS2),
+	PINMUX_IPSR_GPSR(IP0SR1_3_0,	HTX3_A),
+
 	PINMUX_IPSR_GPSR(IP0SR1_7_4,	MSIOF1_SS1),
+	PINMUX_IPSR_GPSR(IP0SR1_7_4,	HCTS3_A_N),
+
 	PINMUX_IPSR_GPSR(IP0SR1_11_8,	MSIOF1_SYNC),
+	PINMUX_IPSR_GPSR(IP0SR1_11_8,	HRTS3_A_N),
+
 	PINMUX_IPSR_GPSR(IP0SR1_15_12,	MSIOF1_SCK),
+	PINMUX_IPSR_GPSR(IP0SR1_15_12,	HSCK3_A),
+
 	PINMUX_IPSR_GPSR(IP0SR1_19_16,	MSIOF1_TXD),
+	PINMUX_IPSR_GPSR(IP0SR1_19_16,	HRX3_A),
+
 	PINMUX_IPSR_GPSR(IP0SR1_23_20,	MSIOF1_RXD),
 	PINMUX_IPSR_GPSR(IP0SR1_27_24,	MSIOF0_SS2),
 	PINMUX_IPSR_GPSR(IP0SR1_31_28,	MSIOF0_SS1),
@@ -1590,6 +1600,29 @@ static const unsigned int hscif3_ctrl_mux[] = {
 	HRTS3_N_MARK, HCTS3_N_MARK,
 };
 
+/* - HSCIF3_A ----------------------------------------------------------------- */
+static const unsigned int hscif3_a_data_pins[] = {
+	/* HRX3, HTX3 */
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 0),
+};
+static const unsigned int hscif3_a_data_mux[] = {
+	HRX3_A_MARK, HTX3_A_MARK,
+};
+static const unsigned int hscif3_a_clk_pins[] = {
+	/* HSCK3 */
+	RCAR_GP_PIN(1, 3),
+};
+static const unsigned int hscif3_a_clk_mux[] = {
+	HSCK3_A_MARK,
+};
+static const unsigned int hscif3_a_ctrl_pins[] = {
+	/* HRTS3#, HCTS3# */
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 1),
+};
+static const unsigned int hscif3_a_ctrl_mux[] = {
+	HRTS3_A_N_MARK, HCTS3_A_N_MARK,
+};
+
 /* - I2C0 ------------------------------------------------------------------- */
 static const unsigned int i2c0_pins[] = {
 	/* SDA0, SCL0 */
@@ -2351,6 +2384,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(hscif3_data),
 	SH_PFC_PIN_GROUP(hscif3_clk),
 	SH_PFC_PIN_GROUP(hscif3_ctrl),
+	SH_PFC_PIN_GROUP(hscif3_a_data),
+	SH_PFC_PIN_GROUP(hscif3_a_clk),
+	SH_PFC_PIN_GROUP(hscif3_a_ctrl),
 
 	SH_PFC_PIN_GROUP(i2c0),
 	SH_PFC_PIN_GROUP(i2c1),
@@ -2555,6 +2591,12 @@ static const char * const hscif3_groups[] = {
 	"hscif3_ctrl",
 };
 
+static const char * const hscif3_a_groups[] = {
+	"hscif3_a_data",
+	"hscif3_a_clk",
+	"hscif3_a_ctrl",
+};
+
 static const char * const i2c0_groups[] = {
 	"i2c0",
 };
@@ -2765,6 +2807,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(hscif1),
 	SH_PFC_FUNCTION(hscif2),
 	SH_PFC_FUNCTION(hscif3),
+	SH_PFC_FUNCTION(hscif3_a),
 
 	SH_PFC_FUNCTION(i2c0),
 	SH_PFC_FUNCTION(i2c1),
-- 
2.25.1

