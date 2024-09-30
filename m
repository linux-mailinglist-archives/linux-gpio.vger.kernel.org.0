Return-Path: <linux-gpio+bounces-10573-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B29C198A4D0
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 15:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDD5A1C2166B
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 13:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B34191F9A;
	Mon, 30 Sep 2024 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vBO/P7qT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2047.outbound.protection.outlook.com [40.107.22.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38324191F8D;
	Mon, 30 Sep 2024 13:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727702684; cv=fail; b=Hx4tCFasrhyEqQ192qs9VFz1BIV7BYEq0lyZUMb4GHmcfWpU0t2s7SsKZlEJF2hGVqkPoiEIKNfuKigEGDBhJ39sqJbOeJeBUCGyHBwrFiw+b3CZbyhjP5srAdiT6oPM4DcfckdfEny/yLK/bqkx//N+zY0Uab+tx5O+YamOZ04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727702684; c=relaxed/simple;
	bh=IIqydPKUuRwRFV10OA8VqChS+LzE6yxUEEmJPWphX+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TlkLButeo5QhGmbAA5ZqPf81UMFCyTv12/d6Iqey89jfnxBFQGcN7bdqUq7pS4zw0M58M2pdLTXLEFjll4h+TN9lxsGdIU/Esyp/gr6UBQ0Lh+8JK4zIPv5n9N7BFTCVOKb3FDaU120JSBN29gfDjjWqnwupoSWwEsvm1dTpde8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vBO/P7qT; arc=fail smtp.client-ip=40.107.22.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQHZSr1ypzl2C3kjVlHOamFnQAM+cjyarG8O2oOUMVn9gVtPFp0UEtWGW9pAx9dNg2nJv4elgS3XlCZyqCicTduLwshJBM0g7gE7guNjSqUrSdi5tKmGiuSNeCCt/LH3HgvF0Sy1WyD70mK2kl21NcxM4YzXEFFw57ex+mXck/3Y+2iO/KfhbgP+eE1V/m2A/9UVkoxf8Pyk4xN39Z7jLyaskYEbxJAZmmxD7HqKsyX6gooO3fKoD5o4NqemNAiiUFNQsWId9eMRfUD4OzclUghVx2BH5Gdi+huBDoJp2+MyEYxFy/MWyLNMFxf5q+1tDxeV0Xxic2LQV8lwiq36Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0sGpbSZvn4g3Dyz4+7AQ7G+gkRvz2cxmfGJ3F/p0k5U=;
 b=rR5eookFAQ1aMKQUpD7vbmjePnVtkncWCfS7TgBxuJlTnmhkX2gs9BK0C/IIp1ixdK1vqcrYAJgIuuq0KHnGjuNLLC5+2TtQDk5MTFsUYoSxoKPy5RsOotKHDXklkgVIyfTL0KFOTGpMmlY+IB0/uULEvzLy7WJfIv0EwSWSQ/V3ND1mv5vuUOnLv2MoohhSgFxHqDL65JznoGn6878xk5UkIN9v4txAkJH3uZHEaCVtlWItgRHPvZ39MrR5HkUCyazscc9dIWdtmmUknHK943JBkOrfEMJRUhZauPknDHeb8XEh8DxbrZvnc3EDGvXDpk6ggrX/JakkQj6r9Nif0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sGpbSZvn4g3Dyz4+7AQ7G+gkRvz2cxmfGJ3F/p0k5U=;
 b=vBO/P7qT+Yc7taKtag8OSVRVFqS1Uaj0inAuBRu2AxFWjh/kApps6kY2ixjfGTPbIYHKhC705uMoLOiPOMdjUDpGTPdSBAwgxQd6V88sasQVEaZjDJDvtMyfrkalZeqmWF6nqMAYGb70ktpHUZqRbddJABbgjc/WbhEtZpHWM3pQK/5KgicqBXogPRQCpdFlZIiPha7IoqfJtg5bnrOdkqC5LjlsL/bOh+0zssa/dbfZiyxQgj3If7QRHKLAFQD478UlTMCwcyZGaXR/nXU/3a+q9sF3cx78itCe/N1vswsDvbE5ytZWyOPL2i5zAh7ImtYPP75SrCACyjpu5kxNFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by VI0PR04MB10879.eurprd04.prod.outlook.com (2603:10a6:800:25c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 13:24:37 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Mon, 30 Sep 2024
 13:24:37 +0000
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
Subject: [PATCH 3/3] arm64: dts: S32G3: add S32G3 compatible for the pinctrl node
Date: Mon, 30 Sep 2024 16:23:44 +0300
Message-ID: <20240930132344.3001876-4-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930132344.3001876-1-andrei.stefanescu@oss.nxp.com>
References: <20240930132344.3001876-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0116.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::13) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|VI0PR04MB10879:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f5c295-a6a7-4184-a29f-08dce1533b2b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0pBdEUwRi9WWmdNNFgrTDQwczRONFRTTm01aEVCM1lUN1Q3NWtSbXlKUCtN?=
 =?utf-8?B?anpYTkFOeDBPeDBJS3o1bGhUNGxNejdTaDlGMFQvbzdrb05sYmpuTmNqNUxj?=
 =?utf-8?B?MjNteDlnejAwMHZpZWV2Q21NUnYyNk5YSDlHczJ1MTltS1NvajBvcWhRcEU4?=
 =?utf-8?B?ZklkMVFIRkJybkhvbWlYaHRKVUVoVjdDT3M1M0c2b01DMkl3aWc3RklFZnpP?=
 =?utf-8?B?NDQzSjRaTjFDakI2SE9qaTgvVlVXZ2hLZE1kWlV4VG5HdExwUE95TzY0azZM?=
 =?utf-8?B?RkhIUzNNZUt3aE85eEtGK0hWZzh1OHMwVHVGWHZLOUloU09FdGdhbEhUeUtr?=
 =?utf-8?B?dXZsNkc4a1V2T2lNSkgreFdsOXp4SndQNjRiTmFvemxSZWtEdld2M00yZDV5?=
 =?utf-8?B?b1UzMk51TEswRG9CcGtJekhNZDhqdHd5YUt3S3FudnNzKzhUWEszeVJEdlVV?=
 =?utf-8?B?SmNkYWFmRmsyeFdualpickpHdTFiYmtiVmxNN0ZHaVBrMUJuWDJSR2JFd0Rm?=
 =?utf-8?B?NE80czM5TlJyNkwxbm9BQkxodWRHenpxK3ZmY3hJc1MyWjNjQ2RMVHFBV0Q3?=
 =?utf-8?B?NCs0cFRzT3FoRkMvOE8zMDIvVlZFS1R3ZlZIcnNEUnNzOXdLRTFncWlvckNF?=
 =?utf-8?B?QnJjUlZLUzlGbHlsdWZXUUhhbFFLM1c4dzZVS09VdXZiZlZVdnhVYitLNTBL?=
 =?utf-8?B?NWtSOFU5Z3pKODBoalJMcFVqR1FLR0lBOTlIL2ZlWFJlZDA2WUpyeEowMDdN?=
 =?utf-8?B?UTdrbnlsMjQwVzBmaGJqcE5VLzc1aTVDaUlLSE5xUjE3eVFpeGlyUWkvSVMw?=
 =?utf-8?B?TDN2TXdmZ0puV0dCazFMWUM2SGRQc2gzQUs3TkdXL0EwaVFJazRvZVplR2F1?=
 =?utf-8?B?aStkZUFnckljdkgrenNoREd6SlU4RkRWaVQwUmxMSXFuRERtWk5oUGJ4YWdu?=
 =?utf-8?B?Vlpvdm5wcHp6dk94cys4aHBjOHdhRCtJc2dIQ3Y5cThMVHBwRisvanRjcnRi?=
 =?utf-8?B?YnVuak9USHAzdlBiam9JUXFwTXBUeTFRUG1xalUvYWNSWTlZL0J6cXlJNmwv?=
 =?utf-8?B?eXkzL0ZQejZmOURvMkhvOVlaQWdUaHFucFdiZmY0ZjcxOFlCbnYvUlI5OTJn?=
 =?utf-8?B?ZThVWXR1UW8rdk1DazlLRkNZTllnd1l1UmFJOVRiZGd6aWVNallXak0xaDhj?=
 =?utf-8?B?NjVwanN5ckphaXlIcmp1am1CZm5PSFJ5SDBVbUgvRlA5QmVSa05pYWFySzBK?=
 =?utf-8?B?SGxtbnhPYVhLMzBxaStteTJNbE96S3gzbTBHeDNaK2MwSk40bjliT0RDVXc5?=
 =?utf-8?B?a0NEYUtUVUU2dW80Q2Zaa09jVUp6MWRjdUFub1VFOVIydzVaV1dUaXBVNm5N?=
 =?utf-8?B?WU1HV3lObGJPci9Jc1M0ZGVsUVhZbkcxNmYvemllOU9tcGs0N2h3bnhGN1Fj?=
 =?utf-8?B?U29NZENoeFFvRWdmdTRhV1g1cVFMQ095QXVJYjFtdFJIV21RZFN3NDBjVkcr?=
 =?utf-8?B?NS9aS0tTMlRsdWFXWG90WFo5L1JpMFdaL3V0K3U2YkE1TWk1QWUxS1g4SDFX?=
 =?utf-8?B?ZEs2U3dhZHorRjlTNmNYRXdzQzA0UGRXSDl2SFhnNnlrOG5Ielh6M05nUThs?=
 =?utf-8?B?Rk9CVUw4SytnK09vZTYvL1FLUEtnUTQwQ2d0Sm5kYThlaHNLV3JjYTR6bEtu?=
 =?utf-8?B?RjdabXZqR0U2U1NMb2kzSXVXQ3hoWDJxUURZL1dWblVXcWJBNFBzeHlSeFk2?=
 =?utf-8?B?dFR4em9WYzlrZityZmdwU3FzdHByTlBEQjBqYnBJcUpWR3pvNi9xZUFqTU40?=
 =?utf-8?B?a0ovUTliaVlOUzdGdFZaVVFMMGJ2Qnh5WXVGdUdDRk5jUDRzR3RRS2Jiemtu?=
 =?utf-8?B?aE5BYm53MnRQOFJ5elNwYVdsMjhkTGRQZDhSYmVqSmJVSjZiSkZFcjROSVR1?=
 =?utf-8?Q?qVktou7sDEs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVZEdmNOZ05qZFZWVzlDbFliOFFncjZMbDdJVXZpN1hDaTJPRmROWVl5T1B6?=
 =?utf-8?B?MkwxOW1wNkYrc0lHZm5NSXY1bDNmZHpNYW1ibVdxUlpWS3FqZXF5TzBIN3U3?=
 =?utf-8?B?SkVlMnhPNnRNS1puam5pNGNGZjFGeVFpRzgvRG5oTkdJSzZlM1dCN1d2K0pG?=
 =?utf-8?B?S3JTWDl4TTFVSVBMSHhiOUJJcGJmRXZhTlBvZy82ZHdzdFNMRDRmY0g3Q3pN?=
 =?utf-8?B?d0ltby9mSG5EMGEwYk02Nmg2TFl5RkEvcmdGNmVQMERQRnkzZGRxVnVJL0xZ?=
 =?utf-8?B?em1wMzR1bjhLcFp3Yloxb3RnTmF1ZVcvUnUveUFqTDZJZ0E2QURiZ29WeHlw?=
 =?utf-8?B?Z3k0dGQ5REpNWFB2Mk5zNGtET01pY3dNM0QvWStOVGhqWXovbWdVbTJuN2Nx?=
 =?utf-8?B?Y0YvN2FiazQ3MW9lbCtwWjNRd05SRml2NnZkYk9GWjZXZXdLdUpZREtLc0FC?=
 =?utf-8?B?RUVneFRGci9xdVJMN0xQS3lXQXdPOVpQdUJRVUdZNGJlUGw4NnFLblkraVJQ?=
 =?utf-8?B?eGxnVTNhMCtlNGorWmZTUEJTWUs4OW1IL2orSEo0Z0tXSDNIdUdPOTJDdStn?=
 =?utf-8?B?Z2IzN2Y4U2dZMXZkclZaMXVVWlR1L2tGV3VmT2RYS0M1eWxhdjZxY2RGcHBY?=
 =?utf-8?B?RndDRkdrMzZEc2dzOFhBT1ltaWtCRXplTVh3c1hZRWV2U0VjVGJRNU9idmpw?=
 =?utf-8?B?cEZTZnNsc0tsekhtUGhJL0Y2VjdtSDZsVFhCZzVhZ2dsVkUyYTNLZWpiV0RM?=
 =?utf-8?B?NVVoU2k4Ui9jVUI5TC8rQlRsTldsMkVOcDVWK3krdDRqbzZSMGxXeE52cFUr?=
 =?utf-8?B?YndsM0lIQlF4SFpSbDR1enloU1p2bDQwbDZhRzJlSWVQTFdEZDZXN1RMYUsv?=
 =?utf-8?B?KzFFbTJLdnFWcDh4QjVxd3oxOFpjWXVUQXcyZHYyOWlJZHhFTStnNjZzcVI1?=
 =?utf-8?B?SmxXZ0NIbEcyRXVvU3d1TkxSb0JwcXFRREFZY2RtaWNsTXBoYXZJdXNvcDZC?=
 =?utf-8?B?VDY2NDlvOEFzRmRRUUR4c2tNZWswU2ZzU2RlQU5BaTcyVWdQMFNkUjNjWm1w?=
 =?utf-8?B?VFMvdTZtb0FDbnJJbTBQYzdlb3lUT0lhdFZaT2dabjN3QUh6ckxwM0F3OU5X?=
 =?utf-8?B?dG14VkE5M2MvZm11L2pMVDhKQlMxV0JrK29DUG9NZnBiWUtjT3VUQUVrQjRO?=
 =?utf-8?B?WkkyeEhsSnh1Ui9MeU92N3hPb0xhSHMxUmJTdW56emt5b3o5a0VmR2I1cER2?=
 =?utf-8?B?elFkSFdEZHhCZUZOdEx6R25EQjVtWURpSlBIWnB6NDJPWkYybHVBRUdkaHo3?=
 =?utf-8?B?cjhUVnloREtOYmo5VDJWcU9Memk1d0U3YmpuRjY4Y1R2Qmd3UWtSUVhTZkxx?=
 =?utf-8?B?QXhJaVpMM05BaEN5U1MyM1hlZmFxYVFQcWdYL3VxS0hSTXZQUVdPaVJNOWJi?=
 =?utf-8?B?WFN4cFN1TVVmMTRRd2l1a2Q5YXR2VmVqem1CUi8yNWFPMFp5eURKQVNiUWpj?=
 =?utf-8?B?RUVMaXR1Q0dmV1Z4cnBPWGp3MUoyL29uNGE5amdqRDR4Um9PZUtMNTdMdzIv?=
 =?utf-8?B?aGRaUVpYbU5PMTRMbEdPd2NyWE5FWEVzUTE4SUVrS2hOd1hEQ3Z5RkV4ZFRv?=
 =?utf-8?B?T2JyUERRdXl2VE1GSXdpNDF3VlpYQXU1ckIrUk9ta0ZSWU1LNTlja2VVMXh3?=
 =?utf-8?B?NU5yMkp4clNnMHZWTnVrNjI5dXlpRUJIM2NBVTlaTmhkVWFBa0xSL0xBcUpV?=
 =?utf-8?B?ZWZ3ZTVpNGJuUjR4RTBFeWx0MVY1U0thUXdRQTVJbVc5OFZ1MnUyaWVlQlRS?=
 =?utf-8?B?R2lORXp3bHhhbktFZHk4TXVhaU5MTkszYWF1MStDbnRtMHR0RXVzeTlUbkMz?=
 =?utf-8?B?TndkVVRxVHM2TWFER2VFbmIvTk15VEZRQmVZVlN2YzRydnAybGU3cGczUVBW?=
 =?utf-8?B?UFgzbjdJZHVOOGNFTktpVEowaU0wdTB3TUViU2dlWUEvR0lteS80d0xPNVQx?=
 =?utf-8?B?cGhuM0VCWUJHTmlRbjNIWkQyS1VhNzc4TlNtbG1SOXJlYm5lZHRXZE1PT1RH?=
 =?utf-8?B?N2FrNXhRb2JzdjNQTDVHdEI0ZzhLKzFpQ21EcnFMay91SUVrN1lISFZrTVlY?=
 =?utf-8?B?cWJ0M3FxQ2gxb3dpZHMxRWlNa3E5ZlpFUGFQY3AyaDZJT3NoLzY4Q3p3VjlV?=
 =?utf-8?B?c0E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f5c295-a6a7-4184-a29f-08dce1533b2b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 13:24:37.2787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 822kueiGHzAEsWl6UG7LVILSgKUKCubej0A1AzarKe6ZO3rvhvLVAb4dkayHL/ajm0roqws/HR2bCpBSFRXVI0ics+Y5v+OXrzAyxq/Cd2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10879

Add the newly introduced S32G3 compatible for the pinctrl node.
Currently, it will fall back to the S32G2 compatible.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index b4226a9143c8..f6aafe44c9d7 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -172,7 +172,8 @@ soc@0 {
 		ranges = <0 0 0 0x80000000>;
 
 		pinctrl: pinctrl@4009c240 {
-			compatible = "nxp,s32g2-siul2-pinctrl";
+			compatible = "nxp,s32g3-siul2-pinctrl",
+				     "nxp,s32g2-siul2-pinctrl";
 				/* MSCR0-MSCR101 registers on siul2_0 */
 			reg = <0x4009c240 0x198>,
 				/* MSCR112-MSCR122 registers on siul2_1 */
-- 
2.45.2


