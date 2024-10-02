Return-Path: <linux-gpio+bounces-10708-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4684B98D8A9
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 16:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56AB91C23052
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 14:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2B01D1F5E;
	Wed,  2 Oct 2024 13:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="F8boFRD8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2070.outbound.protection.outlook.com [40.107.103.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A591D0B88;
	Wed,  2 Oct 2024 13:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727877596; cv=fail; b=eCnA7p32a1QARiLXotmrxuNrbhd9g47+6tIzjKxvOwBR87wcDt21RfW9SyvvJVmqDwDatHmiCKpPsJc2wjc1tvS583ADrtNtSVGj5FHeQ9nq8CDarlHS5CdYeeExPLUhlQYo32XXsItUACZ2+I/KVYRzwnUMUOc4z2nl9ylNwd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727877596; c=relaxed/simple;
	bh=6zS9K/Miii4hzxvKLglBJBcz+Kfsc6DaKy3wPXfZHd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sooEJx5m7JojCpOn8WFfvrl1WWkecfnYlqJI/XsBopMdgIdeWAex9vvrNf8JeiNwG2BpK+T8PTQ593w0foF0dyIceu1RvrnuQSGUHkMtk1fRmEm7H9XRQX7q/K5lP9UYFVodoKy45PQJzoz32lmI0GTBd+wqr4RJPE9mD2vOsQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=F8boFRD8; arc=fail smtp.client-ip=40.107.103.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmrjTh5rPn/Up97RFOcywdzkecGFngCft4WDISDVtw1cdWM4/znjk/LXjeuhsg1VsYDCg7HjGageToMoRS2D0gNXdGsoW6SAxdvV58adPMJtPs/32NDMev0kjrlfR40JSl7WoFl2pywNfb+2BeQK/FwyI/Pmcj3Z1XYCUkG8qUwFU76O0EBe4BIpnrYtFXBMlnFVItwO14JjlIJFxOjjMwMjH4ZtW8tCFvdIA9Gx7uBrRkirrqcAIbRHZBovHyW7Z7AUlhonnk1p8tIAvLX31lrfcckj9hlMuTTXWoaIW/kdJnAmuoXpRL1kBD/JgCJTAUUEyeFSufkMfepUxJDS0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4jcHwLOD1LnJc8zZR0v0f5YxujrslXVHXsWta5jzQw=;
 b=YERKPrJ+/wQAQ6Kw2PoUAPZxSms66u9Ge7XgKOHEkRFXJok+4a2tNCztNmpq085yaPDxI4ZDjEuvudTCaqzFXcNnHXI5gb01xi+Lo+Y2huf+Ob/I7CDa/XdEfTsSnwbEwJTeTZDJOKO/pgboKGH9FZKA9Wfn2EQjmb5DJXluAmaHZf6uWREWtB9RIZcslZolS0F+a8BGjdNKkLzgsOZv2ejrd2I2rk29B5Rl6ah5Klxj+eAh6Iu9C8iofBp/vzR2clXp5KxR90t4ylU+hLdy/CqSE15cU1kCuv24m4/sFok8txIsbbIBMUrYgM4n8Z0DoWWzIV0P9TpEufw3FYjAeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4jcHwLOD1LnJc8zZR0v0f5YxujrslXVHXsWta5jzQw=;
 b=F8boFRD8ucoB/r2YFij+OUyYJDhIyMS95nOnqqHTTF7mWD1UJJgEKqa4YjttYM9AqiI+iqK4YV6LToHzLKkap3sj3l6c2pzNTsumgWXU3eTXDmCxqDMbsOPlQ8YXatLaxVrI3ALQCyZl9YfHGrnSNWC24Z3Of+d6Zd+xeqG9JcNhjrGw93GUrieaJ+qDPDhvIm4I6jF8Wrllh8qAN35f+0c17wfwZpNsuQN2DPip3+s9UNXAdMbzmm9BfzR17ZEz3tS0uZbqDivSTpBm4hPEkRkG9T1XfqM2zAbvaf0V3x8bcDKAnvio/Zmm9LavbwDewCNIzlIt9PJfm8b/z4yucg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by VI1PR04MB9739.eurprd04.prod.outlook.com (2603:10a6:800:1df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 13:59:49 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Wed, 2 Oct 2024
 13:59:49 +0000
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
Subject: [PATCH v2 1/3] pinctrl: s32: add missing pins definitions
Date: Wed,  2 Oct 2024 16:59:18 +0300
Message-ID: <20241002135920.3647322-2-andrei.stefanescu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 36a3813d-ab18-4228-6f7d-08dce2ea7ad9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OTFIZ1d1eFc4VGkzWXowenZqNHBrZ0ZvcFRVNFAwKzkrcnpadVUxVWRQZDdO?=
 =?utf-8?B?RWV3TG42bytBbnhZOUs4ZnhVNTZaeWdmZllJL3BZZmtKUE1KV1hQZXhFanhF?=
 =?utf-8?B?NksvNVVXNitlQks2VjJyZ1l3b2gwSkpjUXpIeDJSTFQwMkM1UU9PUDBPV3Zp?=
 =?utf-8?B?Um1KTmo1dm02SkxHSmJLK3Y4REJPMm44MWZyOUwrTzlmUFZYM3I3RTdiVFZ3?=
 =?utf-8?B?azhETTk4MGdnSEltVVQ2REtHT3ZDM3Fqd3pFZjJxVkxmbzRFMVcxWEZjb1BS?=
 =?utf-8?B?bzVJUkErcm0wWTcxNmNZUXlsZ2hYTjFkOXRUOVN5TFZDSXlyMWpPSDF4YkZW?=
 =?utf-8?B?Q0R6RkVBMVphWFo4VW9UR05kckkrV2gxdE1FRklyY2xiQWpKNUVocGIrWnd3?=
 =?utf-8?B?bXNZdWR2Sm9kWk9VcG1BNzZOTWs1QW1INnR5Wi80U3p6NU5QVGdYMjEzbkRh?=
 =?utf-8?B?R0NRaVFTbW1CSUdvdTZOM0dVVlkwZFRpdEVWdS9scGR4dVM4WHBOdVExL3B2?=
 =?utf-8?B?eU5CdXdhcGZEZ0hYZlBDK1FGdVlPL3ZXMWp3NEVCSCtZcmk1NXZ2QnllSVF6?=
 =?utf-8?B?T2IvWkF3Y0ZRVmRyWGhjYW5FK01BRFBJV2crYVVBRjl6QUJ2TXNOTDNKRnVy?=
 =?utf-8?B?amY1ZlhZdlJqcVRYTVhPTG9tSUtob2ZoZkhZeWZ3ZU85cm9WQW8yL0IzZnVz?=
 =?utf-8?B?Z2xYNlhrUUUvQ3pMR0NDMXJrYlpVb1dKNEVIdmlqNTF4QjQ1V2hkVmlCOVk5?=
 =?utf-8?B?Szh1dTRHU2E4dThPQXVzZWJwdUsxU1p2dHFxNllsaEZaditoczBTaE5OWEsr?=
 =?utf-8?B?ZDBxY1N5QkZnMXlRd04xeExjS0E4M1YxR3k2cm9xV01ISnhyUktXYmcrbTZz?=
 =?utf-8?B?bkVTL2Nvems5TTJCZmhZUFRZRGdDbndnZ0xwNmwwU0I1L1MrLzNHYloxaGJh?=
 =?utf-8?B?NlFYdXZiQVAwSUwwU28vNDFOZlJFdk9hdmMrQVdlcEg5a3Q3Ri9XbDlEUWRJ?=
 =?utf-8?B?MlluL1diTmJkM1c5WnFjMmdlVWtuY2RCTUc2NGQ5cm0ySzZKb2JQTEZQMXVQ?=
 =?utf-8?B?VEdOZUxNY3VHQ050SytjelluVGw0TW5zQnpZMnROaGRKTS9xYnZKanl6TUlS?=
 =?utf-8?B?dTkyRjdLWlV0UloxVTdxQTVhVmNxQ1RGc0d1LzdRQ28rcXRNNi9LV0RPd1Fp?=
 =?utf-8?B?K3ZtM2IwOER1NDM2SmlsNDJ1a1pPeEFBd0tMZVl3Y2hiNmNuayswUjcyL3pk?=
 =?utf-8?B?cnNjNXlpeHNwRVU4RkdJKzRQNzJPakJNajNoT2MvdzZKQWQxSmw0Z092bXNs?=
 =?utf-8?B?OU5STzFRRW44eXJLdGlMWFUzK0NKOWhPM3N1em4vOVBaYkp6eXdaZUc1aUJT?=
 =?utf-8?B?czRMTHQ4azB5VVNpQ3djdFAycEc3UDlGV2o5b0JTYi9Sa1U1UG54TUJieHdI?=
 =?utf-8?B?c0NvNkpXM29YWTZFaGlQdERaSjlaNGM5RVBhSUxJdmtqL3E1emVCTWI4akdN?=
 =?utf-8?B?azlaZmtHa08xcmN4c0lHaXJSUWVqOFYza1BIcGhlOElOZEVHdTM1RXpzWWl4?=
 =?utf-8?B?K2VSQXZNL2xhSE5VQVY3ekJSUXJEb09FYVA0RTNFWXFVSU4xU3BwcXFZRTlx?=
 =?utf-8?B?ZWc2eHJPZTI3WnJCOHFmWUlqVEtVL244U1RQby9INi8xRkdXUGFaWVk2a0Yy?=
 =?utf-8?B?UkI2cWl1L3FHMlFZb2VxUzBCSTBBc3hqMXcyM1JSQTE3dVV1a3pJYWFvNGlZ?=
 =?utf-8?B?YUlxMm5YdkxkMmczQXBjTTQwVnBHOEF3SlZ2bHFYZytKYmcrbzJjTXdBaFd4?=
 =?utf-8?B?OWJjUVRLSVJjTkFqQXNGQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnhzNXQwMGE0bmFGUCtOWnJjbmxFbThKRUkwRExxZ2ZWWjhBdGZzNnp1cWNx?=
 =?utf-8?B?cEcxNm5NNzF5Q25HVTRaR2hpVFU2Yzk3Uk03YzczR2VYMEExeUpEYXhndkVK?=
 =?utf-8?B?NVA0QWFnNXgrUVoxYTB6aG9TN3FsMVd6Uk84Y2VhbGkxcjkyMUEzOFJVb3B4?=
 =?utf-8?B?ZE5pck40WkhxYitKaXR6cDJ1SGlUYmtEZUlZTXg3clZ3aCt1YkFGa0FCaXZt?=
 =?utf-8?B?L0VaS0diaGNHbHVQTEdnRWx0K1hIQVczSjdPa3lvejhoS0JlNVNRa2dGN0Nr?=
 =?utf-8?B?NEswVDFSNTZqOFBOdEZXQVZ0QlRLalkwY0hmR3IyZnlKOENFeTYyQVhLY1Nh?=
 =?utf-8?B?cmJORDVua1QrR3J0NmhnZTdCYmZLUUVtZXRTSUhOeDE1TGlkcEpPTEhkRFRY?=
 =?utf-8?B?OERhWi9qamdlekgwamEwOXJMMDNhTU04Z0E4WnlyQlBiUXRCZ0dhNjE5TGZm?=
 =?utf-8?B?dkRmbjJWczdnUEhFT3ZYTDB5eGpZYU1TZncwYW5xcDlsbmJScGRNUHlhcmw0?=
 =?utf-8?B?ZXljZGJucUVpaXFwem9PR0NlSjZjRU1Xekk4SWJySzArVERYc1JDS012ZXBR?=
 =?utf-8?B?VlJBaVRsSUtkVEtEWXFLWGhYV2Zkck5MZ2RtSGN1MVRoOVBVSU1ydVl4c081?=
 =?utf-8?B?OG9Bd2RLdmZ1aXkwTitnWVhoRWdldnpMZWVXS080U3ZDVE5NOFVIaDlBNmIr?=
 =?utf-8?B?QklPRVJJRW5nTmlYLzRwUittam5HUXFyUThJRHZjR3VmRGJySCtIamdJazdE?=
 =?utf-8?B?NmVETUQ3OVF1VGZnT1d4RmlhNVk1c3dyL2VOelFIWjExZVlMTlhOeU9FWldU?=
 =?utf-8?B?MURyZHJJV0s3VmtRZDQweDBreGFHdkkrSHdZWFdDanVDN0x1VWdlaEVaWmpa?=
 =?utf-8?B?bGR6YmxNb0F3WG9wdUl3KzlVRkhwMWVOR250UHRURDZKeFhDbmo5UkxEWW00?=
 =?utf-8?B?SFowdHRNN0VMRXNhR1g4WGg0TkVtdmRMelFVOVlWNE5HSzFyM0dWTjl4ZHRD?=
 =?utf-8?B?VWRFckN2VE9WdmF1d1NpTFVmM3I1WVFsTC9EeUR2SEg0bnZDRzRlYkxyODhv?=
 =?utf-8?B?NTJTWE1xLzFMRk5ub3ZsbkdOaVJJSkFDRjdIcWRja2JvNFFWOHl2ZlVQMC9Q?=
 =?utf-8?B?RkpIaWxzUVo2bGFoVVVKSjdJOFNnaVNtRDZKam56ekJncG1pcWJaVEl0THZU?=
 =?utf-8?B?SU1GMi9jbDRpdzNXNmdMVUhjM2RDWEg0SE44YlNCdVYzRUt6TzZhV0Q0WnM2?=
 =?utf-8?B?dzk2QVpYbCtWVHg4WTVwRHRnZ3dRb0hqcExJeWMzRHZYNUg5cU02bEdCZTY4?=
 =?utf-8?B?VU5OTkFvbUFzK0VuRWY4OGlCRytPa3JYOXAvTTNlTmhEZ05ydlltbXRWTG1H?=
 =?utf-8?B?bVZhSUxISzNmemVYNHlxMVBPcjI3OVJzaTNFTVQ0V0QvbmlFRW9tc3ZMcFln?=
 =?utf-8?B?a3MxakhpN2taR1VNWW13S1MzOEpmc2lyT2ViVzZOUGpTRzFVNWlmK2Jsa1dZ?=
 =?utf-8?B?TGxTY0lTWjc5dklzU1pjM3lXYUtjUGxwbTZ4SE04anJjdzNqYmI4bXNab1Za?=
 =?utf-8?B?VC91NjVUOVAwYm9Qa2Q1TDBHK3lZRUdPS0Z6ekxKN0NpbFBFc3lMQkY5MkJQ?=
 =?utf-8?B?ZFFXTWljOVhtWHBmcDVnMGlzMzFVWC9XdFhOUXpkWUNPaVl3ZzhBZzQranZw?=
 =?utf-8?B?ZUJjbi93YW9PU2cyV3NtN0g2KzJxb1dQV2R0YlNPTy9GWW5TUHRqS2NBaFBZ?=
 =?utf-8?B?c21vZzJEdkswV1lQbnlWRUgxYjN1RHNTbUhQTkc1bEUveTBUR3BwT2kreTZF?=
 =?utf-8?B?ZHRmUGEyblJjU2VnU2tCSkU1eFV0TVNrV3hMb3g4b3Z3bHJmOEI3TytLUnNn?=
 =?utf-8?B?YUVmWlNVM3J0NHg2a3M2eXlzSXNYRDJYK01aMnBxYUhWaGZJWFRUdEpya1I1?=
 =?utf-8?B?VDJrOWtwbHhSVDJYNnNFOXJYZzdUSk5hczRMZXFFNG9PbnczOWtYTGFLK01r?=
 =?utf-8?B?cy8vd3Z4dnBURGw2S3pTUGthQktaZi9Pd2JIL1BBb3FtN2JJbkFJZ2NVOGF2?=
 =?utf-8?B?RU02UHl3ZXkwRHc5anBoSUUrelNEb0FBWktNa0VFZUsxSXJqbCtsdkJzTVBj?=
 =?utf-8?B?eVF2bDBsNllLYk11eXVrWmEyR0VTbUdheDBvejNhYityQWNDdXA1MGVsRXNP?=
 =?utf-8?B?d1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a3813d-ab18-4228-6f7d-08dce2ea7ad9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 13:59:49.3534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXQOogm9VXVziH737R4P1z/qUrBqzoJisStv2qC52033U9l0ua4VW/TJIXe4jQy59sBVIdse1lXeD20bYXPWNR4Ky+pE3kHahFm5G7Cg2SM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9739

Added definitions for some pins which were missing from the
S32G2 SIUL2 pinctrl driver. These pins are used by the JTAG,
PFE and LLCE hardware modules.

Reviewed-by: Matthias Brugger <mbrugger@suse.com>
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


