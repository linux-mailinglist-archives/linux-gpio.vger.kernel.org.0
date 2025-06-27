Return-Path: <linux-gpio+bounces-22316-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F8FAEACD9
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 04:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CE0C1BC71F4
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 02:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8021F19A;
	Fri, 27 Jun 2025 02:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UBKPDjWU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011047.outbound.protection.outlook.com [52.101.125.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AEA3C01;
	Fri, 27 Jun 2025 02:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750991869; cv=fail; b=hbEi29RCLsjuXnd5kaLY1OY1eLYkgDfUd4b9NeOqA80m2Iy14x7iBJ1hpEDzkmYIZcbPlzizzHSrRdDLD7NK3KAQ708CXvvmHZJGln2VYtiIWWaLM0xqdiBbU/aGrLVMHMFDmYPHT0x6MQsvFfRkPGVF19Y2qj+6AnPregOqnPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750991869; c=relaxed/simple;
	bh=DFpu7vokhVsMMnBL7tv8km8yw9cq3Kdzrhd5KN7jWHs=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UB8MnBuCnFseUv+ca18QgZN2nD1geXT8SMcsJbJd7K/UYNltnDLO5YkiQuzlRpEOwg6KAjWXLFg3IdkP9GptfZMRaMdNMdL6t0zS6Y/aet2p7Q4iFyoWxPu1G+tnZHvArY3856feClG5Sw36XXTFtZc8rdI6rJ7TMxsQ3+aAFLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UBKPDjWU; arc=fail smtp.client-ip=52.101.125.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=By+3DnizegKi7ZOCZtENgitaG3MB1BFADQ0R2rCOMMMsWy211QxLy54E4cBjhbOtIhL4HYZsNYeHbX0N9cfCsD2qqbazx0+7BPpMi6PXQ8axUv9khS+B9G79awbT51bSjxRI3SWboBg7iOVdlBL2P0+5iftCYchnfBAelEb2G9iAaqSeeQ/GCQlsaLBZA+3OYOuiodcC0IOLr7T29CjQosHr1ffOXEd6WsmZFJEtmpFk6B4T+BdWcAbXYfWTT7frDE4kWLpJr0cM+fwvxooaFDnqhO/kQK+1doUsi0OF0+55JTKDrt49qJi6DEoCn4mkBkmTzHiGMLF50XvmrgobKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOTlUnCP9CzpM/XNPXklT6O581AmsBbghZGgne5bgPM=;
 b=V8yorDc4XHUeSJWWk61WU2p/ta+dN/y2QlG1sQEe0WZmQdN1w3C26Lg3E9MukyM7pe6npzM2abP3ASCTk2foYX6efwGz+Q7AGrr/sHcekvJM5m+vHvFJWal+DuKka1SB4f8qU99/519yQMZnob9laeub81fqmyqzn5BjOPksz3j7isuQsTsIGxVAzkN6Hb83TB2ycd1qqozX4+YPXBpKVmECfixn3NjFgl2TsWLg1DSdQsUQ40jVrlhafckwtTYIvm3wJpw313BrCVChc8VJhx767qS3ZviAFdY+1QgGuzc/YqKKJrC4CKWoHgZmVyrroWmNV5xedHjSR6euAmvkbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOTlUnCP9CzpM/XNPXklT6O581AmsBbghZGgne5bgPM=;
 b=UBKPDjWU0tWH3FOJRy24cSInrT1R6LhLBI+raYk2sHYsH2sBZ/gbft+jcbBBzNUjz+IAmwacpmLm30ydBUyfWYECA8pLyJe/WWeWY83HVdIXws1pEy4HKE0wv+UAAM7Dj9CEskNcwPNw3sB2JBT/lypxzkD8bZNraOFz9CKgzz8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11204.jpnprd01.prod.outlook.com
 (2603:1096:400:3be::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.18; Fri, 27 Jun
 2025 02:37:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 02:37:43 +0000
Message-ID: <87a55thpu1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: renesas: tidyup Kconfig
In-Reply-To: <CAMuHMdWst5fhcUgWbTqzG_DQmuL8tWtUuCpg4BoeqhnCfo_MVw@mail.gmail.com>
References: <87ecv9ragd.wl-kuninori.morimoto.gx@renesas.com>
	<875xgk4j9l.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdWst5fhcUgWbTqzG_DQmuL8tWtUuCpg4BoeqhnCfo_MVw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 27 Jun 2025 02:37:43 +0000
X-ClientProxiedBy: TYCP286CA0203.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11204:EE_
X-MS-Office365-Filtering-Correlation-Id: 31bad7db-a30a-4827-4497-08ddb52397ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BbaBE9P9wJL5U5Ln2QX/lArBfpi0tbTpDwuH+JygHZQTJM5fy09xfDgu3con?=
 =?us-ascii?Q?ff/pq/ZuGTP2MF8JBXRzjY4f87GDsO09SB6HqNrNoVAKe5yW7xbd5+93N2kV?=
 =?us-ascii?Q?wyYQR/fXXdjN3Qz1xshl1MDFNtNjK/IS5UNJaveAcA430xdk+D4QgYbz/fzF?=
 =?us-ascii?Q?JN/CGGeQjdEc4JHfJZr8br8dIQ8+b+EazmvTqgsXVdJBtChtbY5Z6m/o26M+?=
 =?us-ascii?Q?kYjlT4QniB44xZFBDWkHZ3sbVN7CNg3s+U0wWjkcldIHUiGUQznZem28lEtk?=
 =?us-ascii?Q?3Us6M47K5xxRzxTVqF2YOy3iJo59xlhDfhSXVZ41j08O9g/uN3I7n+IK4hdy?=
 =?us-ascii?Q?U+jBUs/0X9aIehY05RfmF1pLHBr4LGlu1OQbUkwtn43QiHnD/FFZpfsUS8C6?=
 =?us-ascii?Q?cFX+gJkj3H5R7gO7eL5xUfl/Kj28MYOplg79AUB6B0LeJx7j4dDQDIRZMYel?=
 =?us-ascii?Q?sCzjB0S2yEFz8Xj47R2NnhBenb7yWEAFYUDnKcyzQ1JS4Dc1wcQSs8WffjNQ?=
 =?us-ascii?Q?XBllcl9b9gzpzxOsJbsr7AFhVNnA+TOMuwGbxwXea6u73WT/r7F/o6mivtwh?=
 =?us-ascii?Q?1czVrWHMtbjtOfYBXHSE7hGaLTe3yG39qeBsjV6UC1g/C6lbVvX/jgr+izK0?=
 =?us-ascii?Q?EakFswqInmCVxLiF7Cc+Dv1Wrm0tQkBBkLDpnCSuY6YOD5ZUKb9NRwz2eqrE?=
 =?us-ascii?Q?NF3Wiooj+/8Crj1hI7jBYGw9qI4OtBhvd4BEGd+sfvsCeNoiwMXdhGs+bIAW?=
 =?us-ascii?Q?lrrSW3cpWGdVkVvFF9RJ/PfkkLFkTWRNW7gRfInhwGto6dhCPBjFucSPU/dT?=
 =?us-ascii?Q?qxceHtimPOGM01C+FSkd3gKmFYfh1F8rZ1kXaYChqM7Khi1hJsErDG7YhPxj?=
 =?us-ascii?Q?WeSnx634UHx4i67ymaKqHdhXmpKzOHbEAerBzmuxKFUOTNf0Yp8wgbgyp+vy?=
 =?us-ascii?Q?aBKD1ZmhbDO5ED/graz9we0PjRpJjDC8H5EdrR1yz/qEIRX4UWTIICLsQIQj?=
 =?us-ascii?Q?y1XUq5Nhu5UubaymCDRehCJhFH3MFUZfizQPTifu0AV2FcxrYDbYPvWCckDX?=
 =?us-ascii?Q?suRxZzJQR/3lG8KegoGGv5F+jOdspr1u6AqaJub5R68sSpHja5JQ4cCw3noc?=
 =?us-ascii?Q?yTD3YcHhbFyVw/S7HD1V318XFIkVn/gp2QKUCW41YbsLdsC3xRAD2xOAuJ2+?=
 =?us-ascii?Q?iOC/Qvy4u5/T5ND644hcGmCgjTjhmnpNl2KP4epa5rGkYh9C7q3oRGwhhDjZ?=
 =?us-ascii?Q?CKxiW7q0JQzqmNFszJWqtfuLp68XfQC/ZaTpcQuoL360XQDZrwvwEKE+UvEo?=
 =?us-ascii?Q?JFEjog8n4QBSCPdHLHNAAFVvKd1QioZMTMNphJPPNm4/xhU1bDaRx+KLu8i/?=
 =?us-ascii?Q?xMfiML5kFhvTrTT2Sp7PG/3IEccbXcNep8hI1HWOfjWUcz6m1XW0lKF2IWy8?=
 =?us-ascii?Q?9i3IouygKV4x9iTda6GOraHHLqzRrpe0TDkL+eAfL7KVhqMDFmItFw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J8ZBP/WX76KCPs1tbBi68WCwfexkLuRr/B9J3CH6IDCOXxs69tMRwlL7Ri4s?=
 =?us-ascii?Q?U6hKZTnm9LehZzKF+LFJnpc5lsU4AH5+sTYGCb0BLPL8fNBlAFOB3tv+BpjZ?=
 =?us-ascii?Q?4mbE80m/tjpB1KtGnCTanAiMo3cO9GpTQ4xL241IRK2fulAbZQix8PUgPc1D?=
 =?us-ascii?Q?jYdGd1fPSLgl91/3hce3r/sznCQkHTl73i33jpjrhdALejCzx10E7sQFD4Oa?=
 =?us-ascii?Q?vNzOSgIQm05vLcDU7Kdi+xebQEgIcF0jlCeV+9xjpCDIV3bG2+jFUtZjOYrf?=
 =?us-ascii?Q?xDcz6CBxU9iaHqkQDh/4S3Ub1pIQgScIeNrGV17gjaa3BCOhM5X7GpYG2/2t?=
 =?us-ascii?Q?rKMBP3LTBH99zervfuBY+OWosGH1uN7X0qrNZrmwpcASf3O4YRrYBrX/1mP5?=
 =?us-ascii?Q?6IwvCJmmG5E14J3WdSo7D4/skKkfunTFC6A8xtYXUpMyWUzyD972Is6lYZpn?=
 =?us-ascii?Q?bqDAjvMwHGdzLi6j1SLNQMVKYDw82frJgNogTLTVpQU/5KaEK9hL8//xkF+h?=
 =?us-ascii?Q?aeTvoOgTgt8FEE3ZtXWkcPWLcXwOdhDPlCUi50y9C0ripsiWoS9xdz6uGGkd?=
 =?us-ascii?Q?isstOXI/OCxpciqjjtfLM4xurvFEm071KgNrnuzSe0RLKeR+UP4AIkf4LrTa?=
 =?us-ascii?Q?4WV8Alf705iBRcK6vAlS/wc/rGQoxxnhPHZ+wwxM5KDYFgRu+6gWWA+jwK5x?=
 =?us-ascii?Q?d+eNv0YdQEeuCDO64pNnGzUMIMeDFqtgsfbWVKgwb7lqb/X1wdQyhd2ZbZPA?=
 =?us-ascii?Q?mKOSooRcVbj6DboRUNoxdr7qNS8FivdcirmCCrDZqi52GkHY64uGif8ed2Pz?=
 =?us-ascii?Q?GTmPRujaJay70/aDXHnm6q5C8etEIECtvYvZH82P/qLr+P1zaF77Q4eHrm1j?=
 =?us-ascii?Q?yUxoNj2N/KxmmP6z5iyDD2ZzwDDwS7TpPvkroQcOJPFZXpd18KxrdZIKJwEc?=
 =?us-ascii?Q?KCEA8ZgtcIo0ae4We5uoxMw3sAvItRLd7SjV4matmTei1d1JhPYcaFttTDgI?=
 =?us-ascii?Q?rcOZCF1kuDc+BDFQjw7zQ0UXrwPsEI2ssMigNN5SDlMcHvN+IMzpxgnHvOcg?=
 =?us-ascii?Q?BVJ2vhBfI08hsJk04PBFTzEYneM9O0lcOjhzazGiBd6lsx/z/xYPqpsfbXxd?=
 =?us-ascii?Q?v5AqXqSxHmRFFEt2rCydjkHiY/SmnsJfm61j8vP1/zTouD8R3Qr5Wn1Knxct?=
 =?us-ascii?Q?YwqIatghPTcewwqHQyX5hgDJ030hFZ/cFuXoHQETui3GJEoL1Q/P9guT+JAW?=
 =?us-ascii?Q?0bZNch/xqS0ppQx9N1faDvAzYHl3zgLpu2Umaha9aMDsB/W/Ib6I6uk3sA8K?=
 =?us-ascii?Q?5FivoLf2mbUffmfMj3wspVjX1Oi4VlkAiIO2Byl2BXDCk5Lo1A9EKywNGpIt?=
 =?us-ascii?Q?ArzgsJ2Fk5+D1AiPzSPyOnrtEkJyc2YXCPfTSZGDGrtUi+O2aR7EGCi6/h8B?=
 =?us-ascii?Q?3zUsIvH8aNZvk8sjwKXYEjwFstVGnbhpAZGVuCDnPNozUenQ7XqRsJGWNPTV?=
 =?us-ascii?Q?AAmGYObKEEfpgBk/LNdbPHEObg3NM4X2osulrtuEYa3XyoE3/xORl7eG7p30?=
 =?us-ascii?Q?5u0bQWM+gi6+cuUK9IRjtAufallJTGK3E5oqxTH/IslEjf4DiEzY/FNWZG4t?=
 =?us-ascii?Q?ChfA4DIqh+/yJYsI4Im/i5g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31bad7db-a30a-4827-4497-08ddb52397ff
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 02:37:43.6718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIF6znO7nNBinyGMKbK5LfNSVLn4SJ8IJ9TOwG84qAajHKvxoOmMjhdDw/niaJlk8j1Z6H38uAT3lP12W5Ydk6jFPxrl+jRj538pJU0yldqjn+uSabW5sMv1MrUKghQj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11204


Hi Geert, again

> Actually I prefer the sorting by Kconfig symbol/part number, and
> somewhat regret applying the aforementioned commit.  So if you agree,
> I am happy to take this series!
> 
> Then we're just left with fixing drivers/pmdomain/renesas/Kconfig
> and drivers/soc/renesas/Kconfig ;-)

May I suggest one thing about this ?
soc Kconfig is categorizing ARM32/ARM64/RISCV by if ARM. It can avoid
unnecessary compile, and makes distinction clear. Can we use it on pinctrl
too ?
	[ ] pin control support for R8A7745 (RZ/G1E)
	[ ] pin control support for R8A77470 (RZ/G1C)
	-*- pin control support for R8A774A1 (RZ/G2M)
	-*- pin control support for R8A774B1 (RZ/G2N)
	-*- pin control support for R8A774C0 (RZ/G2E)
	-*- pin control support for R8A774E1 (RZ/G2H)
	[ ] pin control support for R8A7778 (R-Car M1A)
	[ ] pin control support for R8A7779 (R-Car H1)
	                                   ^^^

Thank you for your help !!

Best regards
---
Kuninori Morimoto

