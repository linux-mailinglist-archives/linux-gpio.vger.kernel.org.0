Return-Path: <linux-gpio+bounces-10571-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F1D98A4C8
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 15:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8971A1F20FC1
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 13:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483481917D7;
	Mon, 30 Sep 2024 13:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="m+cBhlTy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2047.outbound.protection.outlook.com [40.107.22.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22893190497;
	Mon, 30 Sep 2024 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727702679; cv=fail; b=D5ZCXqxzXqztOPsKqGkF3Ofczsvpl/9d3K3UnlQ4oMh/OBEYHHScSTwLPd+RKyB2yScjLga+FYnzDf7IJUrNVTC+drcxtr5Kq398cQBxalvfulNM/pxsRo5OQCNtNjvcoTDrlGY/5DpgJJ/os+OeSKWUcUaEUj8SxjLrGuqe6PY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727702679; c=relaxed/simple;
	bh=imZdZl16eerDHdyzwQMfIhcAcOKcQ/0oh+QXZfNcbUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AKdJl8Ry+0uf8IeW+Kim586yfa97Syx8QqfKxOf1HUIDX5LyZTVAvtfwDFUGwfJoBqh4TyjWOXieB9e/cWg4z4K/qFp4bRp8Laq8nQgI+U9O5orlkgXkLOK6Ljx6qfk3cKBTRHihUYaK5n6oRZkPlbHp8tWVHycA8XBH1DKx3GY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=m+cBhlTy; arc=fail smtp.client-ip=40.107.22.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZFjUrI5W14VDfdQ7aV6bZ8OLQTQXpq381Elxoy+XKOcTbtsmkHc+M1hHBtjfqEGP6/0Hw1eqq6leHcSk402nhNm3KhhWeZtUi+FSH/lfc5GziEoOVTg9iiKVJ85czW6bxS5w6zMa2ty78xnK+moCD3X89qmXBqma++WT76EvN9JSHekk1ahECWfFgmdfPONS3trzU7wd8dqYLEq5bMT+GA8zb2rAf4FP1TkDQbWlwjCFFGdZb2QD0/FX4dMSyN/cwbc+alyVQohF+hT6Gd4BcdTW6r7/64Ztz+ZsnFUK84uxaPnzu1PyrC58r8jY2KSKtcT/gtwT6e/D0clbCHQFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjbcQj98XoohMLqPH9Z6t0YU4AUey0GjROO9jxUfnNU=;
 b=WVQh48UatE3q38ZFk+8NaM2bks4QeWiwRlPg1hYz3Jxu9OsoR/E9vZT7HtRbKRsVUl+k0MOpRFdceJy3/ij7IW+Fd/dhrxjCtz6hIEeXh7CX8Dwth95o7X5yDTnZHyHw048LynE/djnz5vyxUFgG4x8MJmXkbldvW/S4j9EWtMe4Ks6O7myGyX6XJv1PiKLczXgbSESSxMUwh/f2vvSwmLkLXnsouB2LvBz1N9T9pT5o1QX/DjNZ2rSwbVaSn05yCDrBQpvtz6IfOj2iWGOMeVCbHResQUgYTEHVQ6Cry/tg04Zwd+CDMhmnEGEz1DEw+PnqzFWj8zrFx3Z7NHMxaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjbcQj98XoohMLqPH9Z6t0YU4AUey0GjROO9jxUfnNU=;
 b=m+cBhlTyJKouRYHBGliuthXKmH91Hnf2I+Tv91CkxQAjUbRvkuWrJXw8LEGd0lH4JpRHq492nInWk9+aOQBKcYQaQJZLym1PHYSNLNLCYcZTurCnvyGstgocK/TccBTzFCwfggNrDMOgAgr9eXHQs3adMvHKA4T8G1p7njpa2s1xNjuKJ6pdJTVfSAFJJwoaSRS+ifs56PDgxVB/CDHW6Jq2GEzbSOqplwmj2hYbjjIrywUXEJTtZmlMCnJzE9dX97W1DZl1XWFVWuZxRjkG5qBzvxs0L/72CCAoaoRczvdMOyaxc/jr3cE7WL52eq9Rg5gTVJRUktBhEsVPk/78jA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by VI0PR04MB10879.eurprd04.prod.outlook.com (2603:10a6:800:25c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 13:24:33 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Mon, 30 Sep 2024
 13:24:33 +0000
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
Subject: [PATCH 1/3] pinctrl: s32: add missing pins definitions
Date: Mon, 30 Sep 2024 16:23:42 +0300
Message-ID: <20240930132344.3001876-2-andrei.stefanescu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: d4acecd4-14be-494d-5177-08dce15338ae
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VXl5SjN0dkJFVFFWN2FyTkxHNFF1UGJDa2hSZUM0dUtxZ0VPMW5zQ1pCUnZ4?=
 =?utf-8?B?SmlPMno0eEtWVmNTSU5MTG5vZHFibE1LWkhiSlF4YStuVjdzR0lNcnkyUFdF?=
 =?utf-8?B?ZVVtUjZvbG93eHptR2RTa1RheHdtNktXV0lTRnNRb3p4TkVOSStSYWh5Z0w0?=
 =?utf-8?B?WEtZNDB6Y0M5RnJzcDd3c04vY3VoSTB0YzFSY0NhWDVkNHhiaURpTk1nbmNJ?=
 =?utf-8?B?N0gvRFZNblVXcWo4V1hzUXlLRlFwU2pyYWpQdVMzRlkycXFqdnFJa2xubHd4?=
 =?utf-8?B?RUp5blE4OVpXRUkweFRMdkZQZ0tQSUFsUTg2VVpZcDlaRnZ3SGZ6U2svQ1Jv?=
 =?utf-8?B?NFp1dHUxdVhJS09nMnRzNXpBaGE0cE5qYk1aREhjeFRoT1p6cjBCTzA1NjVZ?=
 =?utf-8?B?dFFvYzRvSmVpWXRqNWRKbE42VmJtdTN6QkNrNzhEM3lIS24yVW1VS05uSEFN?=
 =?utf-8?B?WGVmRitYZGdXMkhJR0oyR0d3Qk1kMDkzV0NkbHBEaHhjMHd5dTM0MHM5Z0pr?=
 =?utf-8?B?R21FRFh3cUw3UnZwODFkcHdCbDhjUXVuQ2MrTjdZQUd1dDJkMkZHQ2p3QlBt?=
 =?utf-8?B?NXJPZ3NTVWlMdjFOUEl4YkwzYkQ1RHNac2Y3anExOURLUy9acUlTWnlJbnFQ?=
 =?utf-8?B?ZTV3SUFTaW5SNXBrWDhFNTFDNlZXeFFZa3kyYUEzRHhwVlZaMWdaNDRacFVP?=
 =?utf-8?B?VVJvSGVXaXFhWkpFb3FCemhiWEdLcDYzT1krZkZwRWYyRndTdWwyRkxoVHlx?=
 =?utf-8?B?d1BvSkVSK1k1SzJZblpQRGFQUkJUUjZXRDh6ZWV1VEYwU2ZQSVd0M3V2Mjg1?=
 =?utf-8?B?M0RNZUtoRzBzQVhMNnlZdmhGRFNCMHlkVGYwZGc5N2pxbjlxdDNMVVhxbUVr?=
 =?utf-8?B?a1hHdXZuZUhFKy9UTkZDSTZRc3Y0Undwb2wyd0FZdUZ2KzlJbjdKMnR3anRT?=
 =?utf-8?B?Z0FzUnRpZ0hWZHNieDIwTWtEMU1mRldjeE1KVy9PdUx3cWtGT0oyWWJFVWYx?=
 =?utf-8?B?L1pKRmVtQVBZOHMxNjc3L25ic05BS2h0dkNxUktpaG0xV3ZRbEY4VEg5Nnhw?=
 =?utf-8?B?dmE1T01TVjZkQUdQQlpWUzdiQjJLVzN5ZVpXb2lNcHE1QVUxLy80RG9CREhP?=
 =?utf-8?B?YlFjdWQyVnh6WllLVzVZTTBGSGZzUlI4aTRWbDY2bWJGdkZPKzEyNmx0WjB5?=
 =?utf-8?B?ODdheEN5L2IvN1dQWVFCNlJyeFdjN3puOWRpc3phaUxMZDJ3TlM2YmhvaE82?=
 =?utf-8?B?enpOaHFMV3RNVFh3Zzd4TUNjbmZKTTBWNGZocEg2N0VDdzI0cFc0RVBEdms2?=
 =?utf-8?B?NWdmMEI4ODhYOHg0SURmem1xMTI4dXc1cXFCbFhBcWNieGZuOWlObXpiMWgw?=
 =?utf-8?B?dGxuZHc5cG8rdDVMMmpwR1RJRkw4TGpFL2ltSi8zT1l5TzY4R2k5MHJrQllY?=
 =?utf-8?B?RVlod1FyUnp0TW1kYnhHTHJibk5vZ3JnZGQvVlZrNWJLRm1nR2hVdktvdGla?=
 =?utf-8?B?Qk1vbXBpR09VNGNDWW00Tjd6eEV3eHlCLzZGL1VHR1d5OUxlOTNZV052MTZQ?=
 =?utf-8?B?L2ZmOFVCM3VjbUVRN1J6K1JEZUFQYUcxY3B1aG5ZWGpFTXJjb09sMENkVzg2?=
 =?utf-8?B?WjJHVytSMVh5U0ozVGZWNTIwVUI2a1R4bGVEL1RnTUlLM1ZxdSttNjRVdWxL?=
 =?utf-8?B?cTZQVDJnY0E5WjdnbWtmMnViVjRiOG9RS3JPZkdGZXMzamlzZUVsc1ZvQ0VM?=
 =?utf-8?B?WW5nZUtMUElSeXBkaGN6dkxEbklMQzBJTkw3eWpyZk96emVFdFVxOUJRZjlO?=
 =?utf-8?B?ZFNXR1BmQlZtUlQxK0dpS3RtN1BPZ1hHZDI3cjNXVlBFZXhJcmZqSVU5K2NG?=
 =?utf-8?B?VlptWllCRS9CbnE3b3E5SEw4N0Y2WWxvMjhiWkM0VytmQlVGSTNZRk5KSE9v?=
 =?utf-8?Q?oH54sfLtTtY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3M2YkpxTUlhc2M0WG9kQm1JM0FZTllCbEFWbW9uUnB3b293ZU83WU5rQ2p5?=
 =?utf-8?B?TUhjVjNvYUZtWnlsUStzb0VFeGp2NXlnUnVGTlJpb2hIaEhoUnFVQlZZRUlG?=
 =?utf-8?B?OHZsWWo5bW5NRHQ3T0ZIYVM1bG1KU3dZeUk4SDViWENud3d3RjZxbzJxNXZM?=
 =?utf-8?B?UEp3WXltTVBNQlNTZ2ZCTWlLK3VVRDlzRWRYOWNSdlZtMk5paDNYS0xiNERh?=
 =?utf-8?B?Vk10NVcydkdiUThCNW96b3lLNHpMbjRLNFpFak1tQUM2eEo4QksyeUdBdFhL?=
 =?utf-8?B?TEExbzVXNDc5Kzl2VlJJdkFFR0lXRVJwdk9SYU1HQ3ozR1hkdFVwa0hGalBJ?=
 =?utf-8?B?WjFTL21ZOGJjdHFlWXgzMUVXdFFtMTh0Zi82OVNRdUNEemJFTmVrZ2xBMTVZ?=
 =?utf-8?B?OE9DR0FTT3ptVmtSYVg4NXVNd2JCVE11Zmh6TDUxandaMU5RWldyZFJjTWN2?=
 =?utf-8?B?UWhJc3NURlc4TUhWVitFamU1eTM3bnc3dVpSVUJHdU9ScFFzUlZZRzQwblZo?=
 =?utf-8?B?b1VweCtEbWRGU1grU3E2Njh6TWdvZERlQ00yUDNodmdSSXM2UFBwZW56RUJk?=
 =?utf-8?B?YzRYUEhENWwyZ0Z6U1dFUm1kYWxpckxtVGdVdzRjYkNYNFhDeDlNVzhaa1gx?=
 =?utf-8?B?dGkrU3dKSjhGa0ZIcU1OcTBJUHVNN3czNTgzSEVySHpmanhlTE9LR0k5c3dL?=
 =?utf-8?B?TlA2U0xQWnY3MlNKK0FpYmJ3VTZzOEFXdHhSUE9TaDlJc09TYTYwL2hOQzR2?=
 =?utf-8?B?c0xORGViWjk4YnNuS2RDdEhGclFtb1RLdFFERGQ4S3hXdFdXMERobC9QK3VK?=
 =?utf-8?B?elAyczBKU3BicUhIYUVSR2RsOGVHUzR6SmlTaWd5Tll6N3ZOUllOSmp3RDhJ?=
 =?utf-8?B?anVPZElJSDRFaWRsQnFDaUpQQlc1Z000SjVVaFN0L1FxTldRNmpQUGtLUXNo?=
 =?utf-8?B?TmsxRE0yMXNBWnZtQ2s4eUNXU3FtSGV4SnQrS0xFUjh6SU1rRWRnTFk4QW1k?=
 =?utf-8?B?L29JaC9iZXM2R3g2ajIvbzVCWXBvaDRBNTBTblVqallPejVzd0xXRVF2b2ts?=
 =?utf-8?B?akNubGFqbkFNTndLTm9vdmFMTVE4eE9Vc0grUzZYeWpldG8rR2tqemg3MEU4?=
 =?utf-8?B?L0NxNTdpT1pmbzIrL3hIbklPY3RRQUh5ZkZ2NFliVnMyejdXWitzWkJobVEy?=
 =?utf-8?B?aHk1Qmk3WjhtVVZrN2JNVnhJd3I2Nmh5MjQ4RGdBQzdKcGhWek9WKzM5aC8v?=
 =?utf-8?B?MWJkbUw5NGdGQURzb0dJK0FTamE0WTE2MStBMkJWUkNaOXpjN2VTVDc2cUZS?=
 =?utf-8?B?clpIQzZsaExiQ1lXaFBZY1ZmVEZoSzJCT0RCUG81TG8wRnREVnZ2QTA2anJ2?=
 =?utf-8?B?WmJGS0M1QVhhZ3F5WUlLYUJrMkpVUWF4blB1YnJwWmRXRXFZTFhnakNXTmJF?=
 =?utf-8?B?dXRJRlFwZjNOVVZIZzVzVGg0U3Y4UVNaOGUyNEpSTVNSa0p0V1BZWDI2cTRN?=
 =?utf-8?B?bk9vNGFWTTA0VGlmZWdzM3k2bTVWVDBWTnlBS0xITGdEWnN5ZVpxV1lLdHZZ?=
 =?utf-8?B?WkIxY0I0bE5weHhuZjRIc1NTMEQrRUR3RlRSd2wwdXRISmRzKzVnUS84bW5l?=
 =?utf-8?B?KzJjRzkvU01LbndnRVJDZzg5V1RrSlZBc1NSRmpuaGkvd3Z4WHlNS2o0RkdX?=
 =?utf-8?B?TEN2Z01XZlBJaFluVzVLbHp2bGJvL0hMaTNaQXRDbytrV0djR25VS0VHNmVU?=
 =?utf-8?B?SllaWlFQVG8yZ291eVhIR3NGMTFYWVRmcDVvZjF6RFp1ZlQxQlFIOXhMYjFv?=
 =?utf-8?B?YzIzN20xUit1VXgvc3lsVXI4MHlDMUswUEN1M3duSXM0SzdJMGp5N3l4bjJu?=
 =?utf-8?B?bDlzK2M4aG9OcS9FWnFKdmVTcXVQd3UzMEpabjhIV09NK2k2a0FuSUNhQ3hq?=
 =?utf-8?B?djlSOThodGxxbTcwWWVld2VkZXJsb2lmVnBuMlJKRWZoV1VEcWk1N3M3QVpX?=
 =?utf-8?B?VktObkoveG5nZ2tZQmFTQXBqdERvQzZiWjZwNXdrdVdKQ3lFblNrNXZwdFlR?=
 =?utf-8?B?eG93bDNhZ3l2a1VXZkhmd01YaU0wUmJ1ZTJaUDVwZ0t4SjVHUEdmem9XdHlm?=
 =?utf-8?B?L09JQjNwZlJKNTNaeklrN2tDcnQxRDkyY0JrcXpqRDgrc3BvUGtLRjY5RGZV?=
 =?utf-8?B?S3c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4acecd4-14be-494d-5177-08dce15338ae
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 13:24:33.1127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UCmuGs/vPR5hMecj3Fif9eApLRswbaCn/i2Jq+p8N7khtc2hJo6hJzKv3ESEmbxIkhk2GVRDCZV+UZx0RgqUWAoIoA7ZO3GvnlQdbAqno0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10879

Added definitions for some pins which were missing from the
S32G2 SIUL2 pinctrl driver. These pins are used by the JTAG,
PFE and LLCE hardware modules.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32g2.c | 52 +++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32g2.c b/drivers/pinctrl/nxp/pinctrl-s32g2.c
index 440ff1879424..c49d28793b69 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32g2.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32g2.c
@@ -216,6 +216,12 @@ enum s32_pins {
 	S32G_IMCR_CAN1_RXD = 631,
 	S32G_IMCR_CAN2_RXD = 632,
 	S32G_IMCR_CAN3_RXD = 633,
+
+	/* JTAG IMCRs */
+	S32G_IMCR_JTAG_TMS = 562,
+	S32G_IMCR_JTAG_TCK = 572,
+	S32G_IMCR_JTAG_TDI = 573,
+
 	/* GMAC0 */
 	S32G_IMCR_Ethernet_MDIO = 527,
 	S32G_IMCR_Ethernet_CRS = 526,
@@ -229,7 +235,21 @@ enum s32_pins {
 	S32G_IMCR_Ethernet_RX_DV = 530,
 	S32G_IMCR_Ethernet_TX_CLK = 538,
 	S32G_IMCR_Ethernet_REF_CLK = 535,
+
 	/* PFE EMAC 0 MII */
+	S32G_IMCR_PFE_EMAC_0_MDIO = 837,
+	S32G_IMCR_PFE_EMAC_0_CRS = 836,
+	S32G_IMCR_PFE_EMAC_0_COL = 835,
+	S32G_IMCR_PFE_EMAC_0_RX_D0 = 841,
+	S32G_IMCR_PFE_EMAC_0_RX_D1 = 842,
+	S32G_IMCR_PFE_EMAC_0_RX_D2 = 843,
+	S32G_IMCR_PFE_EMAC_0_RX_D3 = 844,
+	S32G_IMCR_PFE_EMAC_0_RX_ER = 840,
+	S32G_IMCR_PFE_EMAC_0_RX_CLK = 839,
+	S32G_IMCR_PFE_EMAC_0_RX_DV = 845,
+	S32G_IMCR_PFE_EMAC_0_TX_CLK = 846,
+	S32G_IMCR_PFE_EMAC_0_REF_CLK = 838,
+
 	/* PFE EMAC 1 MII */
 	S32G_IMCR_PFE_EMAC_1_MDIO = 857,
 	S32G_IMCR_PFE_EMAC_1_CRS = 856,
@@ -317,6 +337,13 @@ enum s32_pins {
 	S32G_IMCR_LLCE_CAN13_RXD = 758,
 	S32G_IMCR_LLCE_CAN14_RXD = 759,
 	S32G_IMCR_LLCE_CAN15_RXD = 760,
+	S32G_IMCR_LLCE_UART0_RXD = 790,
+	S32G_IMCR_LLCE_UART1_RXD = 791,
+	S32G_IMCR_LLCE_UART2_RXD = 792,
+	S32G_IMCR_LLCE_UART3_RXD = 793,
+	S32G_IMCR_LLCE_LPSPI2_PCS0 = 811,
+	S32G_IMCR_LLCE_LPSPI2_SCK = 816,
+	S32G_IMCR_LLCE_LPSPI2_SIN = 817,
 	S32G_IMCR_USB_CLK = 895,
 	S32G_IMCR_USB_DATA0 = 896,
 	S32G_IMCR_USB_DATA1 = 897,
@@ -503,6 +530,12 @@ static const struct pinctrl_pin_desc s32_pinctrl_pads_siul2[] = {
 	S32_PINCTRL_PIN(S32G_IMCR_USDHC_DAT7),
 	S32_PINCTRL_PIN(S32G_IMCR_USDHC_DQS),
 	S32_PINCTRL_PIN(S32G_IMCR_CAN0_RXD),
+
+	/* JTAG IMCRs */
+	S32_PINCTRL_PIN(S32G_IMCR_JTAG_TMS),
+	S32_PINCTRL_PIN(S32G_IMCR_JTAG_TCK),
+	S32_PINCTRL_PIN(S32G_IMCR_JTAG_TDI),
+
 	/* GMAC0 */
 	S32_PINCTRL_PIN(S32G_IMCR_Ethernet_MDIO),
 	S32_PINCTRL_PIN(S32G_IMCR_Ethernet_CRS),
@@ -638,6 +671,13 @@ static const struct pinctrl_pin_desc s32_pinctrl_pads_siul2[] = {
 	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN13_RXD),
 	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN14_RXD),
 	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN15_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_UART0_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_UART1_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_UART2_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_UART3_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_LPSPI2_PCS0),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_LPSPI2_SCK),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_LPSPI2_SIN),
 	S32_PINCTRL_PIN(S32G_IMCR_CAN1_RXD),
 	S32_PINCTRL_PIN(S32G_IMCR_CAN2_RXD),
 	S32_PINCTRL_PIN(S32G_IMCR_CAN3_RXD),
@@ -652,6 +692,18 @@ static const struct pinctrl_pin_desc s32_pinctrl_pads_siul2[] = {
 	S32_PINCTRL_PIN(S32G_IMCR_USB_DATA7),
 	S32_PINCTRL_PIN(S32G_IMCR_USB_DIR),
 	S32_PINCTRL_PIN(S32G_IMCR_USB_NXT),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_MDIO),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_CRS),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_COL),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_RX_D0),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_RX_D1),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_RX_D2),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_RX_D3),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_RX_ER),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_RX_CLK),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_RX_DV),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_TX_CLK),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_REF_CLK),
 	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_1_MDIO),
 	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_1_CRS),
 	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_1_COL),
-- 
2.45.2


