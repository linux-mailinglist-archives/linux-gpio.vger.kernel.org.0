Return-Path: <linux-gpio+bounces-24872-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDDBB3379C
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 09:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 505213A6C82
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 07:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F66283FF7;
	Mon, 25 Aug 2025 07:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="SahAc3yY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E469345009;
	Mon, 25 Aug 2025 07:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756106318; cv=fail; b=cLg8B9xdWdzUs3pipQ1k2wyzxB+t6HBshadWaDaoD1xUt6FyKEgMNEPHDHpZr+WaaB8o44Ur+yuCd/sjUgodfbWbLxcKbPKl9q6UjBAlkyKnj6PHr0YcNQ33tKRjw0m24IPZK9WSC1ZyJqfBV7ixDMMobJGG/mSfTCZTWYszsXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756106318; c=relaxed/simple;
	bh=1DdhP1tvIWH8FfzpUWOrXKMVEwVOxzoCnFC+jccJYzw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=P1jpibJ/oBNwO65/9tyq+X5W2Dnk6s/aX24/yNcnzBVOCfvBAAV0e0TkqIiTK5bmU2+IKG+nmZmCMYjtvSGuL2DSU8fVhfpGTiIawqXXQuGsPqE0PDjz+21/JhVru8Ezw9DwuUuzcKgahAw01Qm0HJBee9cuPmc/hX33MLdOmB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=SahAc3yY; arc=fail smtp.client-ip=40.107.237.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOKaAgZe6LRMmj53ZA6OZeysIFB0vFCK6JGGRfxgtwwelUOu7jf4hzImbyyBrG8W4SVXzhLuGRK1OjKaQm9U6YQ/dtO8oztGxgG3UB+NrCWrYjdWZadBmJC4TTrU6GqYzxjbY7UfkK9ZT0PoFgyFE4IuYEexvw2hOd5S3UDa2tfNZMFFGuKmgCc10KO61UeRCrAy8C/Ru12xhyDT29xLxy99fA5d5qzOZ9rRI5iyasoDVpYcGR8Gf5DRnRLOROqmzI+2QH4Jjv3Dks+/U/NFPVSvcBAyLqwnPtryb7vxeSyAWRpU2aJ745yJnxBvwAnboF27NGP6uTwRcT2JF4E4UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edAsFy7J0gQ3mlopnOWmMNie/me7PBydlTDR8KsRKN8=;
 b=XFjyMyLUUNuem+BFCj7b3Tukuvr9g9AFZu0Iqx25WIWDTttEJDqVZmqYaDHpByEMVKBcwSKTRHGLXsEXeiza42sQeFd1pDW6MEU+35Mt2QgzbIux8rhDUx9fbxBTJycB6giC862yTOU74BeelMwBDLQvp5womjlOLaInCDmLwSC/4zQYvZ8cAg7J6sasnYpAFRCazSxmZJepx5trz4vnRJ3TuPboZNbLW9UHQhCSZ8Fauk98/pGJLk4A8hhzWLv+HbY4nlV9NfzjWxKMZLKue3q2Qh1mGe4xJOF7KN6RAN8OfDnJFHj+SNQxRNUlTu6or3lw5m/GcrbiSV/cTcuHOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edAsFy7J0gQ3mlopnOWmMNie/me7PBydlTDR8KsRKN8=;
 b=SahAc3yYBwI//OLMDLcOs3AeopGO/HN9qKMYLVdoLA8Q4cvvZI6S8o+13fbmWO3/tXJU/qPJC4WtjDRCv5nxXFzs9X82MoiG6vDZQSjq99WXH/FRdTNkYmxy8ovYaNzfQS/UI5/96GcEfPWdanypVeHdb4HrawWcS6HQNsL72LeFqpRz30GBxm9vX9AEWLFUMXfi/sYyQye6wjJ6plTKsoL/nxkX/YYMkrVYi6EzLd6VOXjVsch/rEjkCBDihVk6TrpTqC4J33RcRgoXOntGojvME+rrZV+av89F68lYATTDPCjj5Ndd5K5jtjodEor0oHMosARaDPJkrEdy+lfC/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CO1PR03MB5940.namprd03.prod.outlook.com (2603:10b6:303:93::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11; Mon, 25 Aug 2025 07:18:34 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71%2]) with mapi id 15.20.9052.014; Mon, 25 Aug 2025
 07:18:34 +0000
From: adrianhoyin.ng@altera.com
To: linux-kernel@vger.kernel.org,
	mun.yew.tham@intel.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH] MAINTAINERS: Change Altera-PIO driver maintainer
Date: Mon, 25 Aug 2025 15:16:37 +0800
Message-ID: <20250825071637.40441-1-adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0108.apcprd03.prod.outlook.com
 (2603:1096:4:7c::36) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CO1PR03MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d00de93-26cd-4bf8-1c85-08dde3a79a01
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uRhZhkQK7Wuf7LItH/DvX5lko97f7NlBqSk6XwOoNgjdnzUO9MErq4g904u3?=
 =?us-ascii?Q?oQwRKz6wtUdMYk3VhsBN0MniXSbhd+DW7mJWBKwdiQgBWf+USiUdswzI5kis?=
 =?us-ascii?Q?L8IdTPSkMowVn4CxXKBNXbbvU23aeMxS9gXeelnL1pTR44gTuhd0Z6Apt7Gx?=
 =?us-ascii?Q?STkbSg1WqPVM8mDQThZOkFr7GEQc9Nldl9mJFPjEoTG4kV8/UofrQnmegFzJ?=
 =?us-ascii?Q?az6ACigT4tL4U0NoeI5wg4uRLXnxiuffNhJK2Y038+D0vWbJ3LE/IlkKGglc?=
 =?us-ascii?Q?UWAxpPf2ua2DoNZ6o7Jxc1PatoK4eQ9lyvNBg/sksSWhu+MWzJsidbhZrS1C?=
 =?us-ascii?Q?4BJhQzX33rFyuH/1pABxwVC6YWt/5kYkS2/iOiWOJ2vrHcL1mb6m35FGhEbA?=
 =?us-ascii?Q?zr7G4L/Q/RbqZfS4Ciy2BvAllrgmQ82sltfetA2Z2lZn0/lUnxs/xKgzPk4u?=
 =?us-ascii?Q?r58dN6p8BZusUgbmQgH+QZBm4iFlvXJWKYiHyOLQtPj5c4Q1oogUf/7KeciX?=
 =?us-ascii?Q?vi/ewS3wj3sDsuzqB8dB/TnIi6TdA8GA0xfC6HiiTNF5cbYO9tLcWLhWlfgi?=
 =?us-ascii?Q?vgWcX3WcMRtQgzGW+w92k3VdyjelwzMTBanXhWGpgAzUJLQNQA+9tBT+uxOf?=
 =?us-ascii?Q?J8Y7pSJV99v/DSMA3aaqcS+IGIp8hKzG/8zjAJ7Bs9K2EjsbBU9+xvnAjURC?=
 =?us-ascii?Q?hx82qSM+TIAVq5yHO+Ls3HXp9pBMRzu+VvvCAkRfjDCDEYtiyzGnncGk9zGf?=
 =?us-ascii?Q?ZnrGYQJ8iJ6SE2p23tP9CmCcMISGXtKzE1i5d7EslGIPTVvZVvf+gPLFjzaY?=
 =?us-ascii?Q?1CGak/ICxC+zaPcGIoMKYVdf3MUyQi63r32sW4RblHeVtaiBkwGeM9VzTs25?=
 =?us-ascii?Q?OFirtCoBrwgkDy1+drCQfMUxKJeNcE8Ehjo8BAHb5wXHXDuyhMt79EXLTsbC?=
 =?us-ascii?Q?8jguMYnNEgV6x1/ndiW3xw8d8WrBtw4LzIwyRu+xeqqZD1zRmwaGRpY89tX1?=
 =?us-ascii?Q?Ht+HjYZl/beVFw8usHQPbBZTm4h3Ms7J2BPJKKjVYs7INK/KfRi7gR84DouA?=
 =?us-ascii?Q?8Hd+QNHf5yF43moANSu89i8YN8Y+nX1FyY+1QAyjBeDDtxQE3Uhew7XizvmJ?=
 =?us-ascii?Q?TD9MiqEFzi3zj2qepv4uQ+ujPzON9g0uWZARBqZlvjdlDgkPGAvL7Kwsnpln?=
 =?us-ascii?Q?I4EoZ1c9P6w6hTFYk/eAxUmdlS4Poe+fkNSREHUITH1Cbeo6C0oID1MbXmtv?=
 =?us-ascii?Q?fuMtXwqKO0Q+H3SE2eX3B9nTquZdt+k6hrcn0aT/+8RIBxs1EZYjx3Q9VJDS?=
 =?us-ascii?Q?YvdA+KVbrKxZCkJHcDtBemnh2zA5AX1T+Tv25Z6FGBve8O2Ip8HgmOYzbWYL?=
 =?us-ascii?Q?+5OZHlSVg0FhuxMnbXg4nrdJoZiHWe4UGhmvddGrAqja0YX55W5GRHRvFz8Z?=
 =?us-ascii?Q?uWC/F5KkgCY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gz1+56LPnFlVrGqpWV0oSG/GiB1c0s6WrBMRZ5G6Gvu2VRwu+wiMbknPtoGw?=
 =?us-ascii?Q?Vxw18h8KLCCE0YQk9P+68K4OICEYuoaMkiTYZx0Fl9tq8KJ4+zaK+5MiU2io?=
 =?us-ascii?Q?BWb8pzKFfGZVz+hb9Y4RZnx1OxyFZGOAtIYPeuiU8rteFKCjT/tkSzfWvhKx?=
 =?us-ascii?Q?Y/5dYzXpeodIsjiVvNhxwOSO6W+sFP7FRE5zwONRe6RlNBQGi+V4bOLO2OiR?=
 =?us-ascii?Q?QC5IJM3soRY0xJVnyp4vPB29jCnk9TuKxnxgnLqQ4RaY+sPcj0Ol3bwI+DD2?=
 =?us-ascii?Q?nj1s0MVLIYmpZeU1K+qX0b9GOP6IN6m7076jQqk7Ydwppf+3id9P6uSf6dUh?=
 =?us-ascii?Q?mIIQC2AZZnf7FkzC6o6gOeRy+M2ojvgEAhJZlp2k0k/dBbyE8Quy78VeSztU?=
 =?us-ascii?Q?Aa/5MbMB7D9T6hMOyWigrE+/vp7lSxCq44pP30RihqKHcjL7eKwlJHkM0M+I?=
 =?us-ascii?Q?zQVAxk/cQ+BmRXGJwGzRSE6sPy6fU2OkwZMZS8tc8TaWJkrTeGOoISORm2zG?=
 =?us-ascii?Q?+fkJBWdXejswmqDqFEa+qWSvZf24pfZ5I6R7F89/SMn0DCFLiGUatD+uiuBR?=
 =?us-ascii?Q?WLZ0qQh6flNkJBh67mOdhm/82Xotx9G5axyuKEtizBQEsBOZCvPwsp/9a10F?=
 =?us-ascii?Q?kofGoA8kWLaCTTzz8M4WtcwM9B+cS2fcBVsKglbFwCwLOp7hGxb/ezBvFDeT?=
 =?us-ascii?Q?aImGSz4ApHk5W/J+GS/5CB2Mgv022ej6VdGSVIXfWaMzSqOECxuCnfjp3nzI?=
 =?us-ascii?Q?rMkJ9COTt+1h1bwMwSkbXDlLE8E5gN9ggmxLRJFTn90o5aSheuH1aBd4NDDq?=
 =?us-ascii?Q?dcNuSCmrZE2ZWA3Odty7yYxVrKzEUTbRSl8/klj4jKKQj0Y4F4v4gdqeJmjr?=
 =?us-ascii?Q?kHjZOU19kwn8bbYkTWZUaFwlT1b5bB4ZWjsjLS2K9g0BXxsK23TQqut4zI9A?=
 =?us-ascii?Q?F0SnERd6S2OG1hTlcbCUaQtELxOmyFEsbidLdlrId/AhmZEjcdu8AniqelFI?=
 =?us-ascii?Q?zFP1oobBowzo4ZjthH3ZkoKRx8W+9U1wKIlIOogbJd6FOKhtX6FFzQO+7nOt?=
 =?us-ascii?Q?zR9SBZXd6b+JHscVe1HQc3wVdbmK+//VpqbpVBB62Lrj50zvw2UeSoNbvH4G?=
 =?us-ascii?Q?zbVic6v1wuuGFcQg1+MfWLv+YqHlIaD4Xg4jYtOWrKLXv+dElwcrHt2x7AKi?=
 =?us-ascii?Q?3YUOZE7FMYjWBUqbfTVYGfdkcFVEmArKlVgPNZsHwbrVjEVskojW5r0WIq4p?=
 =?us-ascii?Q?foeiQV5kGW6QdrwHbvWZRmDVqBgHF1r1m6t7xDgPGfuL2pRW1I1iwBiBfrr4?=
 =?us-ascii?Q?2HZMxMAo59GiFGc3IbanlRv92G9yAwY+BoR5V7EUz+mzkP8XsVSaEUFrx+/1?=
 =?us-ascii?Q?JT2ehfp8I8L39IWjZb/3UwsNDHWOE5IVvHlSztZVEFBnfZngCtLJnFxf4gCo?=
 =?us-ascii?Q?HFQteGqej/zyCMsXduet/gY5nCot7S2PTK7mM2tp/CWzLYiYV4J+bXA8SwaI?=
 =?us-ascii?Q?NR9ptMrPFImi8gEChFlhZXhcqNJPzfyjSApHs2rraCxwVS2u+Fi351t6ewgx?=
 =?us-ascii?Q?PlRxJmK2Q4aXoaRwoUp/xdGRUHk70sI7AELIgFecgYQH5gduCUWFChPXW+Hw?=
 =?us-ascii?Q?eA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d00de93-26cd-4bf8-1c85-08dde3a79a01
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 07:18:34.3352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNfS/RARzLVh6gNaFXVmK6jQOiEsNiusS7gaHdyWVHsTA/mHq1wplfDWn64iwLR59HrFCEmFPwk0TavYx5kirWtKJteofE5uAwTXaNNXNpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5940

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Update Altera-PIO Driver maintainer from <mun.yew.tham@intel.com> to
<adrianhoyin.ng@altera.com> as Mun Yew is no longer with Altera.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fed6cd812d79..5b3f80f42f3c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -931,7 +931,7 @@ F:	Documentation/devicetree/bindings/dma/altr,msgdma.yaml
 F:	drivers/dma/altera-msgdma.c
 
 ALTERA PIO DRIVER
-M:	Mun Yew Tham <mun.yew.tham@intel.com>
+M:	Adrian Ng <adrianhoyin.ng@altera.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	drivers/gpio/gpio-altera.c
-- 
2.49.GIT


