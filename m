Return-Path: <linux-gpio+bounces-10709-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAB398D8AD
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 16:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA39B1F24A94
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 14:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E897B1D2201;
	Wed,  2 Oct 2024 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aABRvZXj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2070.outbound.protection.outlook.com [40.107.103.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1701D1F69;
	Wed,  2 Oct 2024 13:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727877598; cv=fail; b=Gf/qG4SJvLrMfS3j5sfJxncAjbCopBcGqMH5SXbsBg7WUsfT3GQrcMW7PVxE2TkiCD6njBEYrR07R1vfLkNHu2wF1btKeTiiVb73cOCAVI9wcuWZw4Y9A5RfnSUiQY1zpASVcpQwjo5I0YEgRYFlUuJbOce88GPqYXvTCYUqvU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727877598; c=relaxed/simple;
	bh=95JVftgT6ONfJIJ8HcYr2bAItQxrNtS35Ka2+9XIUOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TU0Fx3jqRkk0zYsERRjnafkOoZbZltiNFG/gbvcSaAj7hFllvL4vnmNyL7UqygBUskGYGLLuoTNsDuZTWsORv7pDCtpCllKpyXcLLZQmLK/7g+iDgtDbX2gG5Wk9+G9WITNkle19TWjNbCRKAJpQtNio+S91PrcRDdovMyKwmOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aABRvZXj; arc=fail smtp.client-ip=40.107.103.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PI7CImKryG7+tZP14gylAXWh/gVRcEzBr6iI4u7LYigDzjbXfvS37ElXTrR7g/1N+BwYRal10KYXSnjCQcd0+yk68hGKjyOT8BoBgk4zUubo1/Zd5JcaBRgjSh2XOQLHo5wgDjZLy7kYs1F6GoUWfwo0MI3IuAPyM4A7fFK3QnrdGWxYgfAfGnzqzn3Czwkfmdn+puAK4eH490bPP7cZWLl7ydjrHDotbw4nY1QeEIkWG2pKsLmN7GorT8WqkVvrGFbQMqLrf1Pr+yYFJd8oG/omawQEDs5NxAJb9DJjqBJqQp7CZxzo/VK1TpWdxdiKl4fflWWRruNFcWtNIprXqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6cIYsQmakLrIfX+MHS5+gBl5VKqpXLaSLWTj3pgz/I=;
 b=l+68vW09UuVvPvP4dhXiAM9gr9kKBUWgWJnhdGjHcw15U5QtrM5dtfsULFaHt3VgAk51LT5zHzY/tWzlaH42s5yveyHY2L0+0q58BZGss5GjTe3DD6pm+OHkTtpKT1klO1sRtTmtkv5lQ91A51OML8ZZRSM9+GC5lSYjeZUxoRkb7aEcEByifYj2kC0Y/sq5iwV6efSwUfNMHEpBlLm6OgLqdj2yTrldvUIUHKHrawN9heYTh+QnSaITDP7MOQ+kBcOjgEnHGjw6NJbeEgwvAEixKyGutnjTVoITZ+UhYZcUw3Ezf+oCXxQ0rREzOWxdJLaMAUx9PvIC/oiXB6a02A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6cIYsQmakLrIfX+MHS5+gBl5VKqpXLaSLWTj3pgz/I=;
 b=aABRvZXjDNRbPaFyVKtHVHgsqIEb4fyypUq2NdPjizaxjerdP4GU5eO2Q7H287qm55fjatSzjWIqYB/AmOIJ9LUqQWXDrGGMd92ESsTTbX4cttqJ2XjBTU8N5gGNCbWkGAy4dWZE+JMqEIVeFZOP2X+ceUgqEojTQ88zFmiPJgg93EB3RioKo4JSAPKWA/OLJAENG4mE4gEPOJc+kL+vgebsvh5JiSd98iiqPyE66HWOAAzx/eGqNLKjTWChcfjyF8qJXgMsOTvwVmjLLIDKAkR52DN0msDwBAn6QgG/DevVo4BEM1MS10kXpcjg5pvvmMDwVnBAnnZsFqErZzRxyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by VI1PR04MB9739.eurprd04.prod.outlook.com (2603:10a6:800:1df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 13:59:54 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Wed, 2 Oct 2024
 13:59:54 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: add S32G3 compatible for the SIUL2 driver
Date: Wed,  2 Oct 2024 16:59:19 +0300
Message-ID: <20241002135920.3647322-3-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002135920.3647322-1-andrei.stefanescu@oss.nxp.com>
References: <20241002135920.3647322-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0007.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::18) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|VI1PR04MB9739:EE_
X-MS-Office365-Filtering-Correlation-Id: a4aa33cd-0038-436f-f42a-08dce2ea7e03
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEs4d2hkWlNaQ1VxUlJYS0VyQ1dJTSt1ZlhyWHJNTkpMYVFUQXFXNHhDb1hD?=
 =?utf-8?B?UEFwTE1IdXpQYkJtRXhJRU9MelNJanJ3ZlpuQ3BHdzVlV3h5UFlaanlWaUFy?=
 =?utf-8?B?ZXZNYm8zajhrSjJ1d3FpbEJQbnVRcFV4c0dwa21VRlVtTndLL1k3bHV1ZmJ1?=
 =?utf-8?B?TGxacm51REMwenpvUHR3VHQwbUZFM2dWQWRpU2FqbkVNVlhocE03OFo2cm5M?=
 =?utf-8?B?aExtRFMxTkJXQWlCTXBjZzhaWUtyKzRjd1Nqa3k4VmdCdk1nV1BsNnRTK2lN?=
 =?utf-8?B?WkI0YU5mcExwdU1xUVhtbWVtUm9WcGd6d2syMVlFK2tNQmdNdVlNbmRsWFp5?=
 =?utf-8?B?QkYvWmRjcVY0U3FaWGFoRFZOSFFOdkpWTlZ5cEh2ZklGVzIxbHBMUjFSSFBr?=
 =?utf-8?B?YWlaa2FPNGE1VXlROUdMaC9DMy9xcTNHNFJ4eTJ6NHhxbWJ1QVFSOVBqb2NQ?=
 =?utf-8?B?RHRERDFQaXNPdDJvN3kySmgycUxpMGNDVXpTMkErMGZhQ1FXcjJoSjZIM0hZ?=
 =?utf-8?B?dkVDSFpiSmhNUEIwQ0syYzJacElyY0t5VkMyNTl4RFBoKzdMQmNJT0VIbExt?=
 =?utf-8?B?aTgwM1ZEeDQzRW5laVY3Ym9SWVoyc1F2aWNzcFZ3bGlodVZNUWxRMGZYZ2xC?=
 =?utf-8?B?YzFQMXNLS2VGdk4wdWc3bktnR2VRRUtQVmxLYTlrdjVKa3Fza1JpTm5meVQw?=
 =?utf-8?B?QVRNSG5QRVlxY0Foc2xYM3VPY2dyZklLY1JkQW43ZGF6Mi96Zm5TL0NTazBP?=
 =?utf-8?B?WTlrNjBxUUJocXJ4U2t6c1V6dmZUM2pzWHZmc215cStWRWpJR1hYcURQQ25T?=
 =?utf-8?B?VUdCWU05aHNka3d3VmR4YlNUY2JNNCt0eFE5OFFiMU03OU5wNlVxQnFMNThu?=
 =?utf-8?B?Y1BPenRseHh5SGlpMWtkS05iU2VJbnMzNWc3cExHZkR5QVVCME8wM05uNys1?=
 =?utf-8?B?KzlvS1o0ZmpiMEs5cVpOMy85aTAwcEowOEszNlBOTUFqTlk5Ky9iZ3orc0Ez?=
 =?utf-8?B?ZTZCYkpPK1ZwcDlDV1NNcE1Ick5SaTF6ZDdkTXpBQkk4MjJPTGtuM0FzNTFY?=
 =?utf-8?B?TW5jbmdrRWszejlmWnRmV0tkczUwNDVValhEdk1vdHNYaVNUWUhyOGpnNFFu?=
 =?utf-8?B?amI3MUxld1NUVnRoODYzUUd2VlRYaDcxdTR2c0ZuekJmNi91bHQyc1ltWkw0?=
 =?utf-8?B?Ums3TkJRUUJHMnlkb3BNOHhER3Bod2d4UW1WV01UQmhzdWxiZjAvZFJub1k4?=
 =?utf-8?B?QUNYTHlGU2pZdm8waWw0bjNiSlpPZjkwM01Qd0RnbG1OalR3ZFVhR3dLVEtj?=
 =?utf-8?B?d2VnUjhFZ1cvbWhwOUc2ZHZNRXZ4MStPdkY2cXlHVWszN3JBaGJ2ZkNqaFM5?=
 =?utf-8?B?YUV1bGJkRVdwZytScjh0NWNROGRqeHpYd2JnbllGOWtUbmlSUVFEYWRuMmVG?=
 =?utf-8?B?eDBxcUxxTzNmWCtuNW1aRWlZVjVUZDVwVGVwL3dLWjZEVVJ1NGkrY3hsczhF?=
 =?utf-8?B?THRRc2IweHFma3VlZXIxclFlQkxOUHNwUlYxb3VQZWJMUWpPNG0rUVpOUDVt?=
 =?utf-8?B?Y25zWW5WWFB2aWtUSnVzYXRjbzZCWWxGd1JYYUJHYW9GLzdFUmRZWkM3Y0Z4?=
 =?utf-8?B?US9RMXUzQ21DYWhnTnZWaFdYM3NoRytXalZwbkc4Mm9ka0V5UTB6cnlmcW1O?=
 =?utf-8?B?b1dmM2dNNDVsdVZzUkowR1g1QVdDMmpXWkNoNXB3a2NFYnY0aThmeG9WMGpo?=
 =?utf-8?B?UXZEb0J4TUlCWDhvQW0wTEZldm91QWlUclFHSWFiK1BjTElXaUEyMURpZndl?=
 =?utf-8?Q?vSRB0w2i+yMkc5CmRSYFcyR+8L+/hXwbM9Tl4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1NuUlBUWnUvUlVyd2Q1N0tjVE5ZOEZwbURYWUExRFpiWVdXRnZJRHowK3BX?=
 =?utf-8?B?T2lmTW1sUmtGN3Y4dHJ5ZUdLOGhwaVcxNVZHdmF5Z1BvUkJGNHdLM0ZEUmlT?=
 =?utf-8?B?VUJOT3h6b0Z5Vk0wTmY5N3cySXBzcWVoMDZ4SUQ4TEVwVk5icGJuMEJ5OS9H?=
 =?utf-8?B?RzViSGF1Q1BTdytLY2RQQXRFcmthbVRKU0grSlNoR0psZ1ZwbndiR3REeHlK?=
 =?utf-8?B?bGRZTjlxK0M5YkdvMjg4VWFjZlVyelFnZWVvUW5ybWVNTm4xV3VoWWxXelZB?=
 =?utf-8?B?WGdQSXVWYVdBeldISWp5RVVGY3I1WUxxU0hxa1JIcUtnUGVlNk5teW5LOXBT?=
 =?utf-8?B?dUN3SWQvdWdnWGRyU3R4QmdWVE9NaVplcVBBbWNRc3JVUUx1VHFYblFNSkpZ?=
 =?utf-8?B?c1JjUmpBWjlNeTJ3SHlUZ1AzSk1DNXo3c0dORVhjaXB4bXN0NS9QR3lOc2tw?=
 =?utf-8?B?QVZpWWZBREF5UVE5dUNJSnR3dlBtM0NyMkpRT1AzblRqMHBJakNybDB6M1hC?=
 =?utf-8?B?eG16Um9CYkFtSXp1NnVFVTBwUWp3Qi9jdDU0T2Y2VTZaY3Z6NlNNaWExUmZa?=
 =?utf-8?B?ekhLb3c0aEl5WjhQeldpMnpNRHdmUFJPMEJHNTFjNXhvUjlOZ0EyejJFTHhv?=
 =?utf-8?B?ZENMb0hqNStHTHFDbDV3eHg2U3J3NEZFdmNSLytGVUJvT25sOFBzbDJtTTdQ?=
 =?utf-8?B?aWdLTTJ6VVFUbGNEUVhsMXpJeTNUUGVSV0JDMVlVRTBhamZpK3B4TitjRmVl?=
 =?utf-8?B?eW5tNlBwRHZ4eUZZdmhRNndxL29wZHVNRlB2RVd1NVdxZ0Y3aFgwKzdsS0Z1?=
 =?utf-8?B?SmZQOXlqNm5kRW1xeUpsQThkVVF5bXVESkRkZUwwejdMa3UvdTMzWTM3cm5w?=
 =?utf-8?B?R0xjQW45NkNNVlRSN3N6TWl4QjN1QXZUVFg5Q3J2TFFKdVZOeFFzaUJMTWkr?=
 =?utf-8?B?VDQrVHFYRTl3T1ZpaU84RG5KSlRvUTVOVmZ6bWlOcE5LUmhMYmdiV1BXMmtO?=
 =?utf-8?B?eWQ3ckNKV3o1VllkaDVOc080aWp1SmRXRFVxZm9tU05pbVYwRzBNeU1SZ3FZ?=
 =?utf-8?B?ZGhnSGJzSCtVZGlVYUM3aXhLb1JTcnpuZXJkVGk2cXRTaFZ0RzJPQkd1VzIw?=
 =?utf-8?B?NG8xVnpBQzRTbnNTbXdSYVkzaGpoZjVMMGlvV2FGOVE1QkdjZEg1ak9TVE15?=
 =?utf-8?B?eUdWYUl0THZrUWdrbFJ6YW9EU0VPZ2JvdGw4M01nQVZhU3lZd0krMmU5bEli?=
 =?utf-8?B?dG5EempZdlltVUplWG9HRlllZlBuV3ZSTjVDRlBmTTdsM212NGxxc0ZFSVRS?=
 =?utf-8?B?QVdjcDhQc3FuNzNsVEdHSHhuYm1tdEFscUNtenlRL0FhdkpRUFFvVDZ0bmZa?=
 =?utf-8?B?cXM5MHJsa2E5bGhnK0s4bFdnVEllcjRYeVNPY1JKYXpHNkZWSnc5VzhGaXdR?=
 =?utf-8?B?UHErd25zeVpuUkU5T1BtV1NKQ1JXU3p6Szl1TlFTMWwvQTdKOFlCSFYvdyt3?=
 =?utf-8?B?OU1vQVJ2dVo3azJvNE5LQjJ2WEk1RjdwZFZObzBhZ3YxU0p1S3RTMlh6cDZa?=
 =?utf-8?B?OUZmUnlFaVowUjlDeHBvdlY5WXZ0MWRsMlZ3OHl6Y0NKYXl2K0twQXJOK3la?=
 =?utf-8?B?akJMRHZ0dVFydC9ySGNpb0Z6MEVobUF0Sy91aktJMHl6blJqM3M3NlhmQlgv?=
 =?utf-8?B?cnBYNnJxYWR0bE5xUThxR3hVZm9FZ0d2eXhUVW8rUkNnRE9OL2xuK0RLL01n?=
 =?utf-8?B?Y0R3Ry9xQ3V3NWJ6UUlVOTMrSFJYUDFzelI0cnRlODkvUXlSQTZlZnNJa3hw?=
 =?utf-8?B?ckp3RWU4K0pyUkljMldLSkRMRVQ3c0hqUElNYkRXQ244ZlgyZkFOV3ZPMGVW?=
 =?utf-8?B?a1FvdkdHVmJqenVERnhGVmlIaGllWlpjM0hna3U3SkpKaWVGUGlKcXZhQmJp?=
 =?utf-8?B?WkhXcmx5bVdWT1ZWSE03dWlSQ05SRkN0WkZqeXAxdjY4aDAzalRsQWJ6eXZk?=
 =?utf-8?B?anhFM0k2UWZ5TGlXcGR1dlljS2xyZjhSaTFXY29QaGFvbndydENGQ2tpaUJp?=
 =?utf-8?B?NlQ4ZTBWSmZBOWQyOThGSjZzTDRhRjhNclFKNmdBTFhvZE4yM1ptZHJJY0ow?=
 =?utf-8?B?cDdOVmlOVGMyV1ZVY1FyOFVLbENFbmM3R0lDemRCbWhPYWtUaU5TK3RYRjBX?=
 =?utf-8?B?RVE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4aa33cd-0038-436f-f42a-08dce2ea7e03
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 13:59:54.5999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jOHV8yzatXHhv9hkoe8FnzFKr/DiBeEc7iOdMgV1G+6dStp6u57SbB5IY6SKMGD9Kc6FdwEi4uL9NLDKAyRyI3GynRKdikW72iIlqQfpVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9739

The SIUL2 hardware module is also integrated into the S32G3 SoC. Add
another compatible for it.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 .../bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml         | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
index a24286e4def6..cff766c2f03b 100644
--- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
@@ -25,8 +25,12 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - nxp,s32g2-siul2-pinctrl
+    oneOf:
+      - enum:
+          - nxp,s32g2-siul2-pinctrl
+      - items:
+          - const: nxp,s32g3-siul2-pinctrl
+          - const: nxp,s32g2-siul2-pinctrl
 
   reg:
     description: |
-- 
2.45.2


