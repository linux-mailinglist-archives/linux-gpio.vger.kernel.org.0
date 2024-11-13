Return-Path: <linux-gpio+bounces-12929-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DF79C6C93
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 11:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8556FB28BBC
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 10:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5C81FC7D8;
	Wed, 13 Nov 2024 10:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rNYCsnJu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD701FBF66;
	Wed, 13 Nov 2024 10:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731492768; cv=fail; b=U2inCHS9gaRhGEZ0wZ7MmOLjlYj2jiKxilMPDZK0Fq41MQ9aRrzcZEWKKnpWhbEJcRsKXOuRanWIMIq6E/ZmfjKPn+N01Wgd6tSTEa2lsO/Q2pf2f4Ikhpk+YpehC4nZ/4zYkK6mq05y0dHwthKZt2EtgkWn1Gscn29wtLaAZ98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731492768; c=relaxed/simple;
	bh=uzdA015KYQl/2xmqSJmjcQRItTpI1vR5P6TwGEo6hUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F3ggNkMzalD2zns9TC7uCblpTapNlnZOAI5Q5vteld6eDTDH0JmtsZt7z6wQeGbXFIvjy7KQLOJ1Ctp+FOPzHSvL4D7LQDv0y/DERINQnNhrHJXPs6gEJA72xCLST3MGMjnRkHlLoQMoFjGiILJxxC+FnTe50bDdvVP5tUqbEX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rNYCsnJu; arc=fail smtp.client-ip=52.101.66.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PlyvtZgkBQG8riDQ4fne9SwjZZ58bAAt8esD3UCBISFWMzCRPqMcGNn0EvRMA3gO5sm1hd1MiwyDxayu5MNDiOihIGl7n78QOG9i5pU+3bQTQq7LqydY3rOPtMebwPq8VGgJL3tm9xlCPe1hRKWSnCI3atBJ/mbx39mTEAsFHuIN6z8D6K5+jrtskIr2xESTFlykpxzqI94pCouTfmsTt0LQ+oYgjihRefGB8xg/n10fGxjTPy1YJ6cqkP3z9LFlidVzouIHUDCqPgZt0dops/JBgrZ2+8fk0mmUXSnV4uwFq0LhdG7LV4ojnnatlc/EwQGO2ofisWjlTpmUVNDhgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiP7UIlersJYQQUVj+ieic4nekKdRvNUeyEKCnitCJ0=;
 b=COXsKyOOJ+GxP9z4b9zmSKdLnpLEIDWk+Z+oWzEuBuvibmWWiR1VNkT/+ZLLfaOtmboRHvXsCAogV1ZcIrZouSCCiboIZKaYoalt/zOBYjO95A+QZAND+1jvoefsJo2HR1MbWJT+9xY/M8gjsuAapLmIZpjLGIlOPiYpU0i0zbYOc0Oh0ZbFr26GZHbQbchBf8CuHzoSe5yNiwgSBu/Idwzy07gdaWrQ8Qv13+jQ+m3j6g22qdgvatzJ1LHWLqkWLebdfcaamH1AHyPV1bshpDrjnkYCNXlXs9kgtFOc8NTew/6/JUK7mNNokVgKuVWpXzzOgiI8sAJ4fD1pDrhrqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiP7UIlersJYQQUVj+ieic4nekKdRvNUeyEKCnitCJ0=;
 b=rNYCsnJueXYyWrXQtUumILy9XocCHHU540x+Rna/ZxtRD5nfZE+pWTe7bakN3kFeJBg32p3USljYuEh0EmGwuIXlXcJzQYSlJ23xK2Zh05Xm4lmMHe8meVZ5qOnP6QI34/kBK8XIu7cj1GxDH1vcfJiu4THRW9Z7sC9aiv01s66T3lXtcN9wWHmAzfa6+YJFnqfu+AcA+T70dTVb8I2/zIs+pEyWPnMj3gvXKYsHE6jyfrpu75WP3zmH2+JVj57mfaRjK350lz+w+sw3BQyQblG6jnzYdp43cIQJaJNJeroSxhIoJvlttKLIi4wDsmg5bVqGG+uU8lhKcFny+YdMDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DBBPR04MB7739.eurprd04.prod.outlook.com (2603:10a6:10:1eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 10:12:41 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%4]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 10:12:41 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v6 5/7] pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
Date: Wed, 13 Nov 2024 12:10:57 +0200
Message-ID: <20241113101124.1279648-6-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
References: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P251CA0005.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::10) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DBBPR04MB7739:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d6e7a88-10e5-460a-83f2-08dd03cbb560
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1J0N1NLRWczZkNLMWRMWEJlVjdKRFNHc2ppNUkzSmV2SFU1bTF1aGltSWdV?=
 =?utf-8?B?cFhMZkQ2d25GVnl0cU1jK0VacVNaVUJCQVZqWS9jRm85SHpveFNpaUNrOUFx?=
 =?utf-8?B?WXpMQURhbmw2U1g5MllmeUdFb2hpOEhBcnQ1YlRUZ3VacFBFUVZZbWc0ZElE?=
 =?utf-8?B?V2w4OWZNb044WVpMbDVoTkxITWVpYUZkcTRHM2dFU1EzSHdTNjNNQjNnTkxr?=
 =?utf-8?B?eVcrTjlhV2NhK2htSGtVR284blU1K3BJZy9yakNyY0xaUlhyWTFhOGhIMEp0?=
 =?utf-8?B?WEFWU0hDTVhSaWZXb3hLNU8zTEVyRlRlaG1UM2tqSW5RVlBidzByaXZBL2Q4?=
 =?utf-8?B?cjVZRlczRWZySUI4TDA4V3BVTUZCa3F1WVJTcFcyWkxuc3o3Z29JaUlzMVFH?=
 =?utf-8?B?aGNLZUR0bzc5TGN6eE83SnlqOXFONUU2VnB4cG1XcEYyTE5WMEZqcEFhVXI4?=
 =?utf-8?B?V3phQkFsa05ZbXlwcmFFdDVHdXVnUUFPczRiVjgrNVd6RVRqdkdrZ2ltZ09V?=
 =?utf-8?B?TGpiSnFZOFRhKzV1NjEydXB4WjhnUENIcW1STi85bmwvZ3plK2JaUmdSNTRH?=
 =?utf-8?B?TmxxY0cyZzdYTWg3RkdkTUk3eS9RU3dza25URVFoejhsWiswb3FDQkNXQ1hT?=
 =?utf-8?B?VjlrRDRJSlp3cU9pVDltN1kxQno3NDRKZU8zZ3NpWEY3WTUzVHgwUU5UOHF1?=
 =?utf-8?B?Nm9wTzRoMWJNY1NqNzdNbjh0Q2VURlNaY1lZeXpjbHprRXlkS2gveTA2YVEx?=
 =?utf-8?B?OVZTc2ZJR2pFSkRPakh0WnBtT3F1WlY4UitPTi9JRVk4YWh6SXlqZ0U4ZDlT?=
 =?utf-8?B?ajBSRDdYaldLNXVVYTFnb05LT1oxRVVlWnRib2I1UVgyanpsVGVocWxEd2Zk?=
 =?utf-8?B?NlhBbFpZd1E1SWwrUHdvMEJ2WlFqalhUT3YzTG5YMXRyT2hYL3U4MXFJdUlp?=
 =?utf-8?B?REZxdk9sbUxzVktySEVtNlZIczNGYnJ2aVA3eG5tWHZqQ3RJcWt0QjczWFN4?=
 =?utf-8?B?RmEzWllXY3pHc0dNcnJEL2J3bEZ5NU5IQ2tuYldKbmFOS0szc3hHNmhMN2dP?=
 =?utf-8?B?U3I4SE5mU080ME9vZC9VQ0gvMllQa1ZsUzlNdURYMExpSDBqUXZieWFNU0RW?=
 =?utf-8?B?dm9MTjJYbEpsZ3hKM21iMFZ0blNoTG5jbEF0WVdDSE1yUHkyYXdhaHNBZm0w?=
 =?utf-8?B?QllhdkdtT20rMUVPZ1Q2Q3lVenJDRWN2SW1pdXFodnFuN0xaeDVwK0Joa3cw?=
 =?utf-8?B?bTdFcldlYWFFWlAvTWpqYmI1cTJxWEdROVRmeE1OQzlVWkR1azdHcWEyM3Zu?=
 =?utf-8?B?S2J1QjZTbWdPUUcrdkdGTW1BejdJM3pwVDJYL21IVDUxYXk3U2w0S1VzOUw3?=
 =?utf-8?B?MjV5dFB6RHBXRE1WdklQclpFTW1ZeU14Rit6cHZzYXhoMnYwKyt0N0dGNHMr?=
 =?utf-8?B?LzYycDAvVkxNR21Gbng1RGxvL21oQ0M1ZWxmTnl1R2QzalhXNWxsTDRqcEJ2?=
 =?utf-8?B?K1VST0RkQUc1NlpEbXJwQWV4TDFSNHRwU0laZ2VUY2hJUU9BK3BBUkowWlV6?=
 =?utf-8?B?T3JvZEpkcHovd2l1MDFReERremQ1UC8rU0V4ekU1ZUhXU1cwS1lnOHF5dGoz?=
 =?utf-8?B?SmpHK0IvWUR3SjZwRm5wN2VSOWFtMXQ0ZEZRQXcxY1Y4aWdOaUR6UkRmcCsy?=
 =?utf-8?B?eG9meWRwUzhrdzZvMGtHSG96VS9Yc0ZKbklnOXlVOGpUeUlnTkxwSzNDaTR5?=
 =?utf-8?B?eEZndnlGZTJMcDBteFR1R3FCYXRFeDU4bzhjM1ZxRjZ4NGd3NHJ1dVpjdmo2?=
 =?utf-8?B?Z1BVMGU3dHBNNUl4bUxsWUE3QlNlenVzNE11endVQy83bzJ6KzJHd1RFZW1u?=
 =?utf-8?Q?e0eqsN318yNZr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3RSa3VXWGlZYzNFMm12OTNjelBBcXgzRHFabDBlQVJneDUvMWQ3ZjNSL3Bu?=
 =?utf-8?B?K2FFc1hHQ3RtaS9zS0MvTjVQMk5FRG5RN1h5bGJwN2hqTE1WZEoreE9oTkRt?=
 =?utf-8?B?N0xCMmN2NjBRR1FtQXlDeEh5M0FPc1NQZStVUkRtZm9kMWZBa0FNdWcrODlY?=
 =?utf-8?B?S2lDU0lKejJvM2FkRjF3S3NNLzduREVsMjB0T2ZTMkloZTJCVkdKeEExNTBK?=
 =?utf-8?B?TnB5dTZ1VlpiRUpoMlpBTkFXckZnZ3RydDFpUHhtM21WR2pRMnc5S2w1SElT?=
 =?utf-8?B?ZG5wbjhHTHlwRVFuaWZVd0VhWDJ2Mnl4ejhPYmtmQ2pvZnA4bkxMNnFzRy83?=
 =?utf-8?B?d2x2c3dTQkxxMWlHdHNqQUlhZXIxYUtzNDdKRlc5QmJjZTJ3THlsVUtjbW02?=
 =?utf-8?B?YUdhQ2NYckMwNGFPbEZwQlVjbngyTk9ycy9VdWxub2RUOG9CaHNIM0NGTkd5?=
 =?utf-8?B?UFJ3cHpZMUtPcHRXYWQ1VkJsMlk5SGdiQ2VCR0NVbTNFUUxWeEUvVFMvQW40?=
 =?utf-8?B?b0ttZC8vbWEzRTZMYVZld0ZCZmJvVXpDMEtZRlBaRy9MS056dEZxN3FzUm03?=
 =?utf-8?B?bEpKYSsvVFJOOXZQR1pTVDNOY2F3MzVuMnEyaG1YaFErL3RCRTdzaEROT0I5?=
 =?utf-8?B?WjgwbHJFbld4bGl2N1B5TWJVcGFQMU52UmZEcTJaVkRzaXNHMzlyYm9yYnFp?=
 =?utf-8?B?MTd0cGxSeUtiUFplN0gzejFYZ24zN0Nzck4vMmtJT0hTZnNjTXZxUmMxeDNr?=
 =?utf-8?B?VDZLUUY5NGNoR0xtczdiTVBmY3Fldk5QZGEwcW9LVG1kMDFHeTRGcUczcGlx?=
 =?utf-8?B?Wi9mRG41cGpVMmdwbGU2OEpocnBKdU9JeXJyV2crYWIyeWYrQm5UdGViQVRW?=
 =?utf-8?B?NXRJSGR6OVc3UGlJRlkvQ0JTMUVzb3RnWWRzK1NlZnFobkR2TmlnNisvdjlh?=
 =?utf-8?B?OGdkWkZJNGt3MVNZY3o3UjVyNTBmOUx3Z3VzQ08wODFJOEhwRmh2cnc2QUhX?=
 =?utf-8?B?OFpZNUliVHlBQlAvQ3BoTVVML3B6UVhhYktyZEhxS3pXSUE5aUVMSllVbW5p?=
 =?utf-8?B?RzRRNUhCZTczdXZDczMraWhIK2FCRkNSU3V2REh2WE8wYmROWGt4SFkyUjA1?=
 =?utf-8?B?MUZRaE5VMEpCUGNnUkRBM0VhTVlhK0xKUzFpcFIzMnVYNUc1dWxLL2hha1Rw?=
 =?utf-8?B?OHhwM0pTZE9DZlpZdTkzVXZYTnVoazdNd25UeENIL21JZXdYVDd2R0xlczBu?=
 =?utf-8?B?Z3hLU3FVRHVLRmw0alV1T1g2NE91V2tEQ1VqVk1iamdwSHhML2hLSm9vYXBv?=
 =?utf-8?B?YXAyaUZiK2x4U3hFK1dtM3MybmljYzk1UDNhOHZaSThhTXp4ZXpBaWhVUUQv?=
 =?utf-8?B?Q0pqMytiRlFXNHM2OWtuZFV0K0tCQm9ReEhoWEs2QXV1ZnE4SW50dHU5NytV?=
 =?utf-8?B?SjhrcWQ0Zm41aC9mMmVZbFZzSXNBWDNENUh0WlcydDgzbWppdUVVR1djdEdi?=
 =?utf-8?B?SmFZSVMvV1d2NFROSWl3ZHZtSnFxUGdqMk9GTkw5Q2hKWWMxMnpnSzZxdUlS?=
 =?utf-8?B?K21aSFgxMjhBeUZDUUZtdVJrNjFtM3FaZGU3aWEvYklMRkhCeUp4QnNxaHN1?=
 =?utf-8?B?M2d0SUdNVkE4R1c4QlBNQmdPaGR4SEd6VXVpcis5eWFSa1AzL3Z0ZkVLendO?=
 =?utf-8?B?Q3BMRW1yYTNMWG9iUG1rMkVhSTN1TzlMUys5MjhnOU8yV2ZJR1RkNmV3cFpH?=
 =?utf-8?B?MjFPTnBYU3lsOE1DQXI0QXNwWXhsbTBjcDVOdmdsRGR3ZXpFeU1DMmd2NG5Z?=
 =?utf-8?B?c0JEZFFxM1hxT1lQalJ2emZOcGp6QXNicHVMZ3ZCbGZBeUN4Z2J6Y2dCc2lu?=
 =?utf-8?B?VW0xYkNWZHhRSHE3STQvNG9VdE8zYjFFT2pDMFdkVnZRWENVaTA1UktwU3cw?=
 =?utf-8?B?d056NjhhOHFtY3pMV0E3c21RZGdqSjN1M200dUcyK0dpZ3Y4NmdlQnJaeVZJ?=
 =?utf-8?B?K09wSEtJeE03WklwTkdGaHpLWFI0NVh3NC81UEJ0S3oybERLUEd5d2RyNTU3?=
 =?utf-8?B?Ym5NV1dZc01lREIzSWwzRWhucGIrZjZ5cHp0K3h1NGROZ0tCTTM3VFZmLzB1?=
 =?utf-8?B?ZFA5eXVlZjRSaHRmUlVJZGdIZUt3bWhiSFBRYlkyUFQ1YXgrWmlSa3ZrOGls?=
 =?utf-8?B?elE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6e7a88-10e5-460a-83f2-08dd03cbb560
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 10:12:41.5003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iO/RC+jiMN4+/vvKy/cisJUWVaTO6ydFbYgXfOcuaErhSdGAn3Wp/wROEbitjvj37gQBbWDK5LDNP7ztrVlwXGNM/CRlrPahTWsQ0RuBkvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7739

Switch from "devm_pinctrl_register" to "devm_pinctrl_register_and_init"
and "pinctrl_enable" since this is the recommended way.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index bb2f8127c2b7..0b79c7445929 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -945,10 +945,10 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 		return dev_err_probe(&pdev->dev, ret,
 				     "Failed to probe dt properties\n");
 
-	ipctl->pctl = devm_pinctrl_register(&pdev->dev, s32_pinctrl_desc,
-					    ipctl);
-	if (IS_ERR(ipctl->pctl))
-		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
+	ret = devm_pinctrl_register_and_init(&pdev->dev, s32_pinctrl_desc,
+					     ipctl, &ipctl->pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
 				     "Could not register s32 pinctrl driver\n");
 #ifdef CONFIG_PM_SLEEP
 	saved_context = &ipctl->saved_context;
@@ -960,7 +960,12 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 		return -ENOMEM;
 #endif
 
-	dev_info(&pdev->dev, "initialized s32 pinctrl driver\n");
+	ret = pinctrl_enable(ipctl->pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to enable pinctrl\n");
+
+	dev_info(&pdev->dev, "Initialized s32 pinctrl driver\n");
 
 	return 0;
 }
-- 
2.45.2


