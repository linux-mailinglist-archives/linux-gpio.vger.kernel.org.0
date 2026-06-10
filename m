Return-Path: <linux-gpio+bounces-38254-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rM09H1VlKWq+WAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38254-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:23:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4B3669AD0
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:23:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b="ZQn3A/vv";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38254-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38254-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB40130BE43D
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 13:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC7E40B36F;
	Wed, 10 Jun 2026 13:21:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011001.outbound.protection.outlook.com [52.101.65.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B2740960F;
	Wed, 10 Jun 2026 13:21:32 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097695; cv=fail; b=Jmt82KyGDvP1OmfA8bty5zR25QrWEkuuHOPA9RR5auQYNnJu89F3BR4LZM2YYppiLmkvU7/QC9JGBHtnEpFeKLQ9ROWV19kNnEUZgbc5+Ta9UBP2PHWaDELscGm5i3TjlzSiWVAvoVKQqhNDkS/E7uPtqweADjSdnwmv0oiHozA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097695; c=relaxed/simple;
	bh=D24LXAR2zNcQWLLbE3dBd5w439kas4f3lpwZKx/yPhQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q3I0aX45B38HJEOzAZQrnEgBLNScR9HEoXWLCJNbDyQfPW9j/PkO2YM6R6jq3k093bPM78uqoIG5OGQ/ID64BQ/eeAUKaED/OuHztioHth+BFKEhZQ05gilDtcdzhcsXuYMoWjeYn/WQqOty7mhiByNm3K3iKzoK8CLFyn9ZUnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZQn3A/vv; arc=fail smtp.client-ip=52.101.65.1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awwh3XWn43C4v2AJMqckyWY41E55UxnuSf1B9WXuqapkjpYVKehiOuQauZUaCc44JO1EaQD2pqrCo94BzU5P6rq0+ziVF8rcIN6SFOXneaGxjVbNkVQ/FEIyxKHsWp43ZVIWNObhdP/ei5OgxhgEdoa2B2YTq16AVJV4lYD4SLnECobVt9qU6djPl7wiz7b9pyV6PDX1QAskE3uzwgq5F7cHdR9fjEMhKq/Dw5KAfCNMttV4iVYwaIF6Ta0Lu3WPOegm5f8D1WRgfwDBZLcjM7vS9KbYO1DKijE3zPxLHmXv1mMOfsnbh4+oIcddNSske2xRX8jIKAq26KSQn6tPjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hdjxNWIUcH9VQeRIo/RvSYny2bXzyh/JNkrRYp+JGE=;
 b=ihVBfHDgtXwpeFUYhD3Tn4T5fyTm/3dDzjJXR5HnMzzROcytIUeylPEP9og3z2nmXaI+O+1wr+eu4IO99vRqXMs0PdAfaCoOb2Vl3Gf10816qy1clcH9l8lTeicDDqsNlbJJ2M+5xUrz+zdfvKwhHaNywZ7E1vOPJidbcEWcpB+Fuxd/2609ORj6rn/Wne62AHC1ddfW9V5BvIwdkYOM20UfHBdOJ5RzOd1S3FZvxNyL2fDoqG+hyFC1mVo4f7QxBkZ+uJVvpdtemhAF0BTnupGVLhLQ168sNShMI1pkKxERcdB/RPA08k4TvU4KEXyU5CY2y5rPskVgTpM2h9lldw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hdjxNWIUcH9VQeRIo/RvSYny2bXzyh/JNkrRYp+JGE=;
 b=ZQn3A/vvDYJwSsaMaZWw0jq4ZS1RDK6TizzC9ASl3W4tJNAgn5sK/dj2JUYyL1FwWgla1l7W3KXmN/5cdZmFLf5WmF1ve65VeciJ7VQWMV+R0XAGVNe4hXV1JUcJXpGk0flWdPltrjWLmurikVqPVNseLlIW7Dy/90vLggKoL/0sG9LdxbNg06ccEM2NCjFou6mMYDHdMBilI5RyPbf+RAlambyD5VjHUph0V4YjT+OcXXKesptjCJ9rgv71KF5WdHZyDi+s//xC3Dw+SoxFhVWOuqbq0Rf3QdZ5tu6+ZnpjK8IG+LAf1GVGRdeyw08iCFvgVL9Da2H35jE/V+QcvQ==
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PAXPR04MB9121.eurprd04.prod.outlook.com (2603:10a6:102:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 13:21:22 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 13:21:22 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v11 3/6] pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
Date: Wed, 10 Jun 2026 15:21:13 +0200
Message-Id: <20260610132116.1998140-4-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0040.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::20) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PAXPR04MB9121:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b5053ac-193d-4bf4-ac84-08dec6f32a16
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|7416014|376014|921020|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 S5uuDw+LucwBBHtEhvsMOO49W6Bb1t5Yaeaz8eQzknwS5mgrmExvEq22nNk+M1QcK7xAoyUYlZSKMYLuXwK/7sK0LiY3c98GxRJMGTNP7uTMke0x8xTHHzmh836Ei/WjsmgYGdI98ux4xeJ23JEEUdl1Ufnzc+RJK2YBPKFRk46w/CzK9zeCzFH9h0Fhz1qo0IskPhjpodHsQHU7NjqkTPv6esWQd9/zRfNTGjZcxYGArDAhCEZPuVC0VVkBsOxz2EALvM7FknifpJgxvWZZszt5G2Wk3Hl/H2x7cuIF8TxkPoXsi81bkdwC2ZFDEjhsW8N8U+dd9KZ9OmKOeYsNI/m7SRuPRRHYYxTjVMGm2XGz7ERx6GTs+mjb30XacGSZMWMOlUvEjK+uFNvAtKIoCRRU0CbrEihSuS1EJ0mu4cHE7eBLQHbeuYoFOwaRmFEH8dTrGQhgGWLNgJ/SQ0Dqu6jR3SYBcMJ6aB28unqZvF1xaDFsPZw+4HL9T1tHwO0bPAwBKhP7KkVEG204fDWNXWBkQacqFR3yWPh1HFRKbLYfzzXM6wKhz/4yq+/rkquk/AuZJr48aFZgTkJVCQ4WuWpg7obD6HHCne+Xoa3ATI/097sER8DN/CgQn1aLi/9CQGmAQLon/9ftXA4ihlKdzuQ0R4ED6nG8CcGVBRtSUYK3QrCVPkLs5klrc+1M7yANEBM0mv93iZDQXwnisxFXsjodkjMEWnb2g1PPDqP12U8=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(7416014)(376014)(921020)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Tk5IUkdKZ2JwYkhyTkg3cnI5OWk1SDFIMGdzNi9vUzdsNVAxeXpiZENOQVhj?=
 =?utf-8?B?OG0rMUlhNUtNYkRMQ1ExMEtlOHl6Z0pXOStxSEZDQzllWEdSZXExWDZsWlhJ?=
 =?utf-8?B?Z0FsaEFvRWgzeTFOdjliTmlqZzZQTGkySk1MaXQ0K2xFK3Bad1crR0tnQUJz?=
 =?utf-8?B?MUNxTXhNOXN1ZWdmY29LdmhZNVExNHRMZnRFTjVzdUdOYVk4ZWdaSkhmZDZM?=
 =?utf-8?B?aWtGUkpNdzRjbGdYc2ExYkhzcllpVzdHTEtaalZWcjhWa1VTekZnMGFraDND?=
 =?utf-8?B?Ymo1MUVOWDlnM0wvYlRoQXRYbW4yL25JZ2RDbjR1N1hJQTR5Y1Z6UXNKbkRT?=
 =?utf-8?B?ZHdWWjZIK3ZXZDBJS1Rydk8zTVg0TldsdFVwZ243eXVrUzYxSmFJa1dxeFV0?=
 =?utf-8?B?WW93Nko5NVFDQ2VYaHdzcEd5QlRDWXlKcGJJTXg3RjdRT0tYSWF5K1NUbERT?=
 =?utf-8?B?Tk1oVmo1dG9LNkpIRjN2dEpyZ0NGWXdaUjVLbmlzNUU0TW00d0V5ci83QVRD?=
 =?utf-8?B?ZWo3aklWYzJHSHRhTGltSkE4bzQ5bGRZRWJRRHlKamFFZ0FvWVNjMXQ0Ulpk?=
 =?utf-8?B?NTRSc0dsVmUzcTRJMUh3eGRWdk4zR25nZXBYMFpocm5ha2JsVkxiekZWa2dZ?=
 =?utf-8?B?dmJxdkZvd1cxallXN05jOTJjdStYMkR4Vmx5V2ZVR3JuT0JXcGUvd2FQdXJR?=
 =?utf-8?B?LzFjN1F3WGltOTNwVCtuOGlKemFMMTRaNVEwS3pZbkFvYTlGUitHWnB3VjNU?=
 =?utf-8?B?U0IrNGZJYjYrcHB0dlJYanZzNVVQMk16MGJhaDFZMmhabW45cE9ycDRjRDIv?=
 =?utf-8?B?dUJ4TFV0Qno3Zkk3Y29FbHk3TDhib09zd0VESU9NNFBSc0dLYnArUllDR25Y?=
 =?utf-8?B?UlZhQnBxMzEwRFFsd1lVdFdmUW41ejZqbmNLenpvcS91a2N4UktoZW9McGhs?=
 =?utf-8?B?VFR4OVZuT21VeEo5bkJpZ05TcGIvWFFHNldQalBoV0RPWEJ5UnBKY2Qvc2Rm?=
 =?utf-8?B?cDkvRSthRXBraUVGVkVwUnZ2MWo2UGh6aGZObzEvZzcyclpLcExzdEtTZ2x3?=
 =?utf-8?B?QjByT3Bab2t6WFh5Y2tVZ3k4V0ZOZnFWQ0dRSGZRdDI0N1ZLMmI2blRXZHRF?=
 =?utf-8?B?Z1l6eWpwOVNwcUJqZ1l1VlVmSmJkQjR0RGdxeUU4cDBRdHoxMGVBYmdzaW5U?=
 =?utf-8?B?QUJKeGNKZU5lSGhITmJ1RUhkTDBvZGFxbERCUUpsZG04K0cwNGdpQnM4VWxY?=
 =?utf-8?B?L0hhVElLblVZbXFOd0Q0RW0yR3QzNVE2WWhoeTdFL0s1ZDl5TUt5bHhiZDFa?=
 =?utf-8?B?SnNkWCt0MlZWeUZCQlBhVEV3OUY3VnVSN1oxS3g3OG1DVEg1TkVyN3crbVpL?=
 =?utf-8?B?NC91QUNuVkhBMGtFUEJLODJSV2VDYnVlbzJndUlZTlJ6U20ycnFsVkcra3dx?=
 =?utf-8?B?eUR0TVlQYmtOWVlmeTRHVE80U1N3U3pab1NZTGVqb1ZwZThaZUVkdXVvMTNl?=
 =?utf-8?B?cHF6T3JoWFVYOGpIZnY1RVQvaU5GMjNuV2FDK0UrTUpVNU02S0habVhDNEZw?=
 =?utf-8?B?MG9yN3NWS1ZZRUlnZkpWQXR5SWhJZVJFQXp5TU5SSUZCaXhRaFBmb3pma3Rh?=
 =?utf-8?B?dC9pM0Qrdm05TVBXUGZFN3o5dVJRQ1RodWxzMnAwZXpDM05rMlovc2NySVV0?=
 =?utf-8?B?NmZhTjkwaWZVdlRyODVjdUwzVFJ2a21pV2ovSmRDZU5ORmpnTTNUQ3U5Nkh5?=
 =?utf-8?B?amZES2pBRWNtc05sRmR0TmEyNE94RitsdXJxM1drZmdJZHhkUkhzblNtTkxT?=
 =?utf-8?B?NUJzRlB4a1hMOTZFckhSTTk0QzZpVS9oeVhaSFVJbk9YZU8xV3BGdGNQNWFV?=
 =?utf-8?B?KytIajduRTY4VE9SRXNlUlpWZWtVREVtSHNDamZtTVhUSjZTZnFPK1N3VGtk?=
 =?utf-8?B?UlN0b0UzTVFjNjltOEIxM0hJdElZVlJKTld5bDViWDE2NVZaeW0yWHYrYmEz?=
 =?utf-8?B?WWNqQXBxZjRaR3lMMGhxRFlaeHNIeU1ucXA3cUxRZ05rNjE5aHYzeFlocDI1?=
 =?utf-8?B?dUR0SDF6Nk50VHFuK1FRTGVhSXhTWGN4Q1lpRElLS1Z6dUNvWjBlUUVOb012?=
 =?utf-8?B?QjVjbUFQa21zWGRqbEpJRzVLb1pveFplbGd0bzN2NVpOU2U2NE80TmYreVpQ?=
 =?utf-8?B?UndDbjBXRHR0RXBtZzJGNSthQWI5UTd6NUk2TncweFlnSzdWM2phNEZsR0tQ?=
 =?utf-8?B?L2pwamlGKzdvRk1BVVl5WW5IMXEvVytHU1pLR2hTRm9mSk9SYmpqZzY0QWwv?=
 =?utf-8?B?NDBoZUJObUd4QzJSbm1EMUlUeElnTktBUXlaRmZ4dFF0N3NCTjg5OEtBemJj?=
 =?utf-8?Q?Hpt8z+EPyXjwcmiMkizfAPGfA4OXk5XIKOZvo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5053ac-193d-4bf4-ac84-08dec6f32a16
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 13:21:22.0148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9VPrp0ZvTf8n2XHKZLEGpN/8SgyEWAubMh6FWiL2uj28YDPYC3VABt32UWlzO/v1R04oH+kfQcT2Ir2PSPzy7Lv0hnZa2zKG0ctMaM8EM04n9L4hEqFz+0Zr9EK2/tgQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38254-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@bgdev.pl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:ghennadi.procopciuc@nxp.com,m:larisa.grigore@nxp.com,m:lee@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:festevam@gmail.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:srini@kernel.org,m:aruizrui@redhat.com,m:clizzi@redhat.com,m:devicetree@vger.kernel.org,m:eballetb@redhat.com,m:echanude@redhat.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:s32@nxp.com,m:kernel@pengutronix.de,m:vincent.guittot@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,bgdev.pl,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,vger.kernel.org:from_smtp,qualcomm.com:email,nxp.com:email,NXP1.onmicrosoft.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.nxp.com:mid,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B4B3669AD0

From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Switch from "devm_pinctrl_register" to "devm_pinctrl_register_and_init"
and "pinctrl_enable" since this is the recommended way.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 2645a92df0ba..89a4eb2000ee 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -978,10 +978,10 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 		return ret;
 	}
 
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
@@ -994,7 +994,12 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 		return -ENOMEM;
 #endif
 
-	dev_info(&pdev->dev, "initialized s32 pinctrl driver\n");
+	ret = pinctrl_enable(ipctl->pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to enable pinctrl\n");
+
+	dev_info(&pdev->dev, "Initialized S32 pinctrl driver\n");
 
 	return 0;
 }
-- 
2.34.1


