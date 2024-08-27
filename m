Return-Path: <linux-gpio+bounces-9224-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B2596149D
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 18:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62DD2B22D2E
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 16:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E6E1D1F7F;
	Tue, 27 Aug 2024 16:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b="uhe9puG0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from outbound-ip8a.ess.barracuda.com (outbound-ip8a.ess.barracuda.com [209.222.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010B83E49E;
	Tue, 27 Aug 2024 16:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.222.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724777514; cv=fail; b=DqyEcbbWDOo78dPlrmz8AlpPrXjsPosYLsTz3vHmI8QV7Gc5Gl7MqV7Pxp8ZKVc/H8ETQSwr6c2m2QOzxEGt/rS9vEnFe1Sfx29+HxF+UnKJcK2K7Y659OSCepSEWDgWPlpeJ9w+ap2fY3QBxMJ8qiYHz0d3UJxZuqKaeEnb1W0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724777514; c=relaxed/simple;
	bh=iACsNMq7a0sqDjEL0mpENBrozAxaajX+kS0S8R6rkUE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=ADy6AkCxiO+a+G5SPC4XQyFcwe31vHq/wkUNb5pZBVi8+hsBjf8Y3AVc4C85TjpxQCUiynrv9Lu/b3EA3ZKKsju7cv6MnV3fAwdZ3zwrnyzSdeMhzKsWMdHUUs82JuKKC/TTqbpmGhmsuvY3P7+Mp5l3BwyaJTVgrA0WGzJ7Ksk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com; spf=pass smtp.mailfrom=digi.com; dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b=uhe9puG0; arc=fail smtp.client-ip=209.222.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100]) by mx-outbound15-229.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 27 Aug 2024 16:51:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knb2QUiDuapKr177rgDrEhNVxNuTFYXVis2QuiKD31iN4KoLo0qc3dW7AH4cGh0sG0HsTNEDPdwsysrogsL0/g9d0m1lvDZ0N9hLwssGknSInqyZOwFCS3F58obNjJHkjogU5FuOVgxdv1GqEkd4eyyinuqZSTLLzqpHz6HF8TGZvxbH9O6jofTavQqPEBe5LjiPCc3mWf7VbNMFvLU1M7jEV06jSl4Ruw5AscEocXSDebC2P7khy+9me9iMbcIHlMUiG9ytBX8Qgn8D2/ywbdd2bzkD5JjXiqWZqE5tInrwxXtwcU1G/dXEjcIRynE+cn5DPir3xTef7+WVbDxgsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJjc7Vp4IBnkpRnUQWMCff+3/3B9eZs2VxNEtwoRaCk=;
 b=iqDjymTLOu8grcewHfYvJR7wqMdKclbE9vbAjiIQMbZyC+MABp1hua7Q71WNqW0cdlOzRziYYqokRT7svY6HA4TXTyJtfHZmQi+OiYfDDunAERrKeiiiiZpWzi+Jv+xCp9H21C6MOwwF/EmcnOnSRVZ+gILVDiwfLDpmfnXnnX+w2dDf95ebRCyNJU+7ruC7ycRfAAu0EIdoxU51uKRmNh8fT+8HX8PczWuBa65xPtl4T1yQThm8f4+7uHUlm2WXfqLSNgTxb6xk48SsDh9zP0wO7G2DQsoKJyAaEEiwJ6r0P1n7GRH+y7wbdG95Jci1KZE2qgMOuJ+2NduHSie21Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJjc7Vp4IBnkpRnUQWMCff+3/3B9eZs2VxNEtwoRaCk=;
 b=uhe9puG07y02bMYLb2bqJznZjHGwz1suwH2dpoYNB/emd0mpnsPm8FRVwaJR0fq6I7N4Rr60Fd9TPA+s3a0hPI1ZSZU79zD1vIHF3BTktcLEI19sgRKSRA+VNL53rpJHZCWfE8iTTI5SL2Jkh1DuW2reipm09QmekRfUafoTriUHof7Wk5q8nOlZ1Lrc9ojd4uOYnzQ0GdDI9wFY0o5et9hvO8zQliqKRQbUaj0zJMml6YiR+Ah3454S2LeqNNvIumKxm2N7mkTI1SeMaCt15qpk+u8QbYytOR/zkBpif1+zufSBeyN17vnDPXAp794J+N7idf44pNqLRxirwHkRSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from DS0PR10MB6918.namprd10.prod.outlook.com (2603:10b6:8:136::8) by
 SJ0PR10MB6374.namprd10.prod.outlook.com (2603:10b6:a03:47f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Tue, 27 Aug
 2024 16:51:32 +0000
Received: from DS0PR10MB6918.namprd10.prod.outlook.com
 ([fe80::3697:c0ef:caee:24ae]) by DS0PR10MB6918.namprd10.prod.outlook.com
 ([fe80::3697:c0ef:caee:24ae%5]) with mapi id 15.20.7918.017; Tue, 27 Aug 2024
 16:51:32 +0000
Date: Wed, 28 Aug 2024 02:51:19 +1000 (AEST)
From: David Leonard <David.Leonard@digi.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
cc: linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>, 
    Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
    Jacky Bai <ping.bai@nxp.com>, 
    Pengutronix Kernel Team <kernel@pengutronix.de>, 
    Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
    devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: pinctrl: Add fsl,ls1012a-pinctrl yaml
 file
In-Reply-To: <pywfy4ypttq7y2llfkdgkwgpjfvnzk3lcgd67efp2v6qu6f2it@fdgiw5pac7uz>
Message-ID: <f682476b-f7af-0d66-7105-1d064f5f1739@digi.com>
References: <a5c1eef7-372d-082b-066e-ecd5e001d1cf@digi.com> <pywfy4ypttq7y2llfkdgkwgpjfvnzk3lcgd67efp2v6qu6f2it@fdgiw5pac7uz>
Organization: Opengear Digi
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-ClientProxiedBy: SY5PR01CA0112.ausprd01.prod.outlook.com
 (2603:10c6:10:246::11) To DS0PR10MB6918.namprd10.prod.outlook.com
 (2603:10b6:8:136::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6918:EE_|SJ0PR10MB6374:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb02910-710e-4e4a-9686-08dcc6b880fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L9lpVpCwXIc8BNWHIeW7vw4LfGgYcdfKVKCSe1hlh+GYm+GZfQQguaBnFSJr?=
 =?us-ascii?Q?7a4tysqNDP2TkxCtpiS/RMlgMcjrGhE0ccaMmHckV13ycwDD6BSHjAIC58Yf?=
 =?us-ascii?Q?Rjv3EsQZjqlUjib5m/TRzmluFeRX3rg7F+GGn0pLMlHegWG5cb+ueZw4a+Lt?=
 =?us-ascii?Q?4lyqwPZBzG8dtdmW8VitwJeicnRj7FrvLrstS/Rn+TXoGitdU1dfGQVnxasH?=
 =?us-ascii?Q?Wy6KegdMNJQXG14hi7VK6VyuiUsj8iYU3du8AMbtcmcOQJ+P9xBQs6gWMGJ3?=
 =?us-ascii?Q?5apj77D82goPprVmf+00JRfyn+Nwaj+fgV8oNMSPLlMjmCH0Ls/ZQ/pC01MB?=
 =?us-ascii?Q?MnqUBHvRUYqBwMbA+rqhTD+elFKFZ8BIe29+tk/3ph4NAnaorzqFMGvD5G7Y?=
 =?us-ascii?Q?UOliUkqBvieI9SVPaa3Rdh9TNW59AUQ0bwq54q/HTVbUDkpTQwgCZzBwEDJ5?=
 =?us-ascii?Q?xKhPsGurYf5gBESJuYey6zG4gH7Hi17PNLbL/dmdsGdWBlG/WQwebAMVxBjt?=
 =?us-ascii?Q?+odxoZRfqGiR0lhpoTBIu4VDdcgd25RV5SEATn2qZa3Cs/MtPYQOsSfi8U+U?=
 =?us-ascii?Q?WeVwk54Wn1LI+AI3D41EkzqYMh14SKdmdIffERayY/7tCXKVS4zqM5LKZpwU?=
 =?us-ascii?Q?37R5tUyZQMHjV3IVHI/XbqdeMb/Keec6mUML52n7JJqgndId02F7QrgATvlX?=
 =?us-ascii?Q?Jc18KievKD+BmaYO3oB0JGL5gJKZU3gdn4E3wPCe/d4S4KtMcpvWAhYQIOYH?=
 =?us-ascii?Q?0IJVzRYdthmDqzfY6/4O++GSIzpt+r9WNBRlE8H4xtKwL1WqCR867i0iuH7j?=
 =?us-ascii?Q?AK5pJbS0qgw8f2/ASZmfxDQwYQckRQedozcHOGd7ieWYasnpRQDmfmiv2uBb?=
 =?us-ascii?Q?U3RNQX2ZOMhM0SYJykFJbRoPyRTm26HMjwqidjR9VyNrxE0Zm+ztOQO34wgm?=
 =?us-ascii?Q?kS5VFQ18sVkpNVa0LyDhgbpFscRlxoY1NlRvzizArxdYNeA2VLtgmlhpO71U?=
 =?us-ascii?Q?Jh3XaEAZ9NMtm4otboo1AQ9whVBDhHBtWTMxZk5dcl+XPePh8JIeQWgSw3NP?=
 =?us-ascii?Q?8/ua/T9dtmf2pMmXD2c1fN6iNTITXkSE/fjR2/myqMtCyCw+Vvlruh6pdH4X?=
 =?us-ascii?Q?WFDLRD4NLNQP+7P+Vg0WpST+jZrBV/GeE2VqumCPf4D7Jl7y2SN3x9H+AnRe?=
 =?us-ascii?Q?V1kYyY3yI/LeO/VfgF4ilVZqjfOWhkVzMmr+8uwqILWK69TLCPDzLeoGdwS1?=
 =?us-ascii?Q?1UfAutGlQBGY1XPjss04k1ppmwruBsXVlxHEa5D4iL5zBzQW3Hf0Rl4jl36+?=
 =?us-ascii?Q?rjARVfELqDmn7NbrcQY1oO8jv39zDQrprsJHe33Zs89oAw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6918.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/M5BYcBDgbgRVzpAO+lZHHRGZG+YvruKCCU/nJsWRYxUBwBclykKR+vARHZV?=
 =?us-ascii?Q?ygk4RP12pY38/5llFAtyD3dhrSYy5Vyo96BIoMOzds8i1VZyavw0CGjHGMUc?=
 =?us-ascii?Q?LF8kzvH0xICJd4VejNrFxLmJh62X1vf1m7Yk5xl838pNA2/OKplqLnq0nqCq?=
 =?us-ascii?Q?igceGFoehapA/GmOyVh5Nr9uoXyMNgu99le3K80FSHsvm4TABQtQof7lURmw?=
 =?us-ascii?Q?GvIjaLsDfUZdPbdnZw6lmRtkdgtzOqmWKdiIHtTIDmSHKGgl5HzyrR8cdNM6?=
 =?us-ascii?Q?pOf+5sS9c9wj9lbI9IcYiUBqmt5C7bQzqiJll3wrXYk8uG4VYX9zrJxnVIos?=
 =?us-ascii?Q?tdDWFzV9egHfKUx0JohnBW+PAhjsy5euxqcDlNCkXLQZ+OR6dFnQUMV5uyWJ?=
 =?us-ascii?Q?kXueI72N2cfrkpCJ6r3jKs7g66WaYswmmauohWK9PLOmo197crTFArsew7Nr?=
 =?us-ascii?Q?XmM9Ucu8VONsrwuxCdoEEkibS43hK6QuDbFFzgppY+HD/tk+hp9j7+z4JvWz?=
 =?us-ascii?Q?a8t9b1XYwN/CBg9IzIRor021BoCnuzH73y2eEi5qbcOQX6dVpnulkiY/DKHU?=
 =?us-ascii?Q?lziEEYsCYsO/qGNFmApNo0JOpplBhYJbq4VAIaH5wmcM/pYQmyFNluFMWCnr?=
 =?us-ascii?Q?7uc29Do7T+DsoSe9jBhMQ76XBaFUv+acw0NL1v0ij179Ji9kHTmlcpTQoDw2?=
 =?us-ascii?Q?hwjeSAZNnMP9lLfeuMKbcd7BlHymBvJ3rJP3HKXNMIRMaGCqJHrVCz13nKSW?=
 =?us-ascii?Q?k7kgnf7F9n1IBX8tn/1FYkneyXXI2OZkDm2EDAMvlD2iLYIOiXl+20iSnaGl?=
 =?us-ascii?Q?S9L9dtfpDPjYtnRq+rneej/bTJW0DPzKxWdk8IIjbrTHYLUdSUH7uBCtKh0A?=
 =?us-ascii?Q?oFnNI4y4lg7M0R5+/IgWFyjEKxJoYIiU+/d8ecy0E3am4vUwheIIXYClhcqw?=
 =?us-ascii?Q?dlh2Xmjtf5nP+T/RLkD81S8q34sTpX6YVlZcwbjuq5d5o2+70U+w6c+yr9Ye?=
 =?us-ascii?Q?aVs0hRwaaanepOf9uquXOjqQEL4HvS2sTOonG+pAg1C5AiCHbugfyioGz8Ix?=
 =?us-ascii?Q?ceVaAuqh3c+DizPPn7+NxdXMMj03IJ19REy71dWeBJapLRf9IpgRCOWbgdP8?=
 =?us-ascii?Q?9+rGIP/qWPXX9PGUU6FkCXUglUMPK0j5fDIc66hrqn670Rywd2vbNe+UFyBt?=
 =?us-ascii?Q?e1j/PefgC6edjmEkyg5cX1T3YQodQzh1W2aI8oEViWS3X4OmBNfXBubuGTSX?=
 =?us-ascii?Q?7uhFxPPPyXMXHTtK/zET4qEjlllskgbQH0f5DOnvMQCk2f6p6QKpfdu7+ykO?=
 =?us-ascii?Q?iC2ie5f0zpfG6zY1qx7vyPBCM55fUgY0kA26ZgaZuZW6rSIE/lRKGwIP5O8X?=
 =?us-ascii?Q?/F5GsRN0kF9PmhxiMSvML7xsrH2k7IhJ89YBByTEcNhvnJU8X/M7uyzedUHE?=
 =?us-ascii?Q?2iAj3PvJNR/iH4+fLlwLQGJowsJQXomFwBgeusWDWGLXVlpOnX2kMQVeWr5+?=
 =?us-ascii?Q?hC/ipi5oyUhE5Bp3w2/si/mFxb9jAVNXr07E5+XMI3hMSficWxER0mHa9+mo?=
 =?us-ascii?Q?6uYEa49DrjxF5rcKNY9Zeg+5Vg3HeIAP6PP52LjYpIisfdcWEQSZGfYZnf+B?=
 =?us-ascii?Q?uKH76uHYAJCzIqMbOPrjzNpQEvWymHFIFKyWLxWnth6q?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb02910-710e-4e4a-9686-08dcc6b880fd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6918.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 16:51:32.1925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xbkeLKvKtc+IWK51YH3qLiCwUgdJMff+8UEqr+YdfrWKFQS5Tw9+2k/z/kKZIZyj1wtpGdK9Bb4CmvlStOIn1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6374
X-BESS-ID: 1724777494-104069-10436-2024-1
X-BESS-VER: 2019.1_20240826.2119
X-BESS-Apparent-Source-IP: 104.47.58.100
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVsYWZiZAVgZQ0NjMIDHJ1CLRKM
	nUPM0izcIkJcks2cwwxcjUJMnMwNxMqTYWAJpgKZVBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.258635 [from 
	cloudscan22-205.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

On Tue, 27 Aug 2024, Krzysztof Kozlowski wrote:

> On Tue, Aug 27, 2024 at 12:10:44PM +1000, David Leonard wrote:
>>
>> Add a binding schema and examples for the LS1012A's pinctrl function.
>>
>> Signed-off-by: David Leonard <David.Leonard@digi.com>
>> ---
>
> It does not look like you tested the bindings, at least after quick
> look. Please run  (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> Maybe you need to update your dtschema and yamllint.

I've since updated tools (dt-valdate 2024.5 and yamllint 1.33.0) and
rebased onto v6.11-rc1.

>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,ls1012a-pinctrl.yaml
>> @@ -0,0 +1,83 @@

>> +description: >
>
> Drop >
>
>> +  Bindings for LS1012A pinmux control.
>
> Drop "Bindings for" and explain the hardware.

Changed to

  description:
    The LS1012A pinmux controller can override the RCW and
    alter some pin groups' functions in a limited way.

>> +
>> +properties:
>> +  compatible:
>> +    const: fsl,ls1012a-pinctrl
>> +
>> +  reg:
>> +    description: Specifies the base address of the PMUXCR0 register.
>> +    maxItems: 2
>
> Instead list and describe the items.

Changed to

    reg:
      items:
        - description: Physical base address of the PMUXCR0 register.
        - description: Size of the PMUXCR0 register (4).

Is this what you meant?

>> +
>> +  big-endian:
>> +    description: If present, the PMUXCR0 register is implemented in big-endian.
>
> Why is this here? Either it is or it is not?

You're right. Changed to

    big-endian: true

(This also lead to some code simplification)

>> +    type: boolean
>> +
>> +  dcfg-regmap:
>
> Missing vendor prefix.

Will use "fsl,"

>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      The phandle of the syscon node for the DCFG registers.
>
> Instead explain what it is needed it for, how is it used.

Changed to

    fsl,dcfg-regmap:
      $ref: /schemas/types.yaml#/definitions/phandle
      description:
        The phandle of the syscon node for the DCFG registers
        providing the RCW's pin configuration that is in effect when
        the pinmux controller is disabled.

>> +
>> +patternProperties:
>> +  '^pinctrl-':
>
> Rather -pins$ or ^pins-

Changed to ^pins-  See example at the end.

>> +allOf:
>> +  - $ref: pinctrl.yaml#
>
> Thies goes after required.
>
>> +
>> +required:
>> +  - compatible
>> +  - reg

Relocated

>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    pinctrl: pinctrl@1570430 {
>> +        compatible = "fsl,ls1012a-pinctrl";
>> +        reg = <0x0 0x1570430 0x0 0x4>;
>> +        big-endian;
>> +        dcfg-regmap = <&dcfg>;
>> +        pinctrl_qspi_1: pinctrl-qspi-1 {
>> +            groups = "qspi_1_grp";
>> +            function = "spi";
>> +        };
>> +        pinctrl_qspi_2: pinctrl-qspi-2 {
>> +            groups = "qspi_1_grp", "qspi_2_grp";
>> +            function = "spi";
>> +        };
>> +        pinctrl_qspi_4: pinctrl-qspi-4 {
>> +            groups = "qspi_1_grp", "qspi_2_grp", "qspi_3_grp";
>> +            function = "spi";
>> +        };
>> +    };
>> +  - |
>> +    qspi: quadspi@1550000 {
>
> Drop, useless and not related.

Dropped the qspi example. Examples are now

   examples:
     - |
       pinctrl: pinctrl@1570430 {
 	  compatible = "fsl,ls1012a-pinctrl";
 	  reg = <0x0 0x1570430 0x0 0x4>;
 	  big-endian;
 	  fsl,dcfg-regmap = <&dcfg>;
 	  pinctrl_qspi_1: pins-qspi-1 { /* buswidth 1 */
 	      groups = "qspi_1_grp";
 	      function = "spi";
 	  };
 	  pinctrl_qspi_2: pins-qspi-2 { /* buswidth 2 */
 	      groups = "qspi_1_grp", "qspi_2_grp";
 	      function = "spi";
 	  };
 	  pinctrl_qspi_4: pins-qspi-4 { /* buswidth 4 */
 	      groups = "qspi_1_grp", "qspi_2_grp", "qspi_3_grp";
 	      function = "spi";
 	  };
       };


Thanks,

David

