Return-Path: <linux-gpio+bounces-12926-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9229C6C88
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 11:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F4B4282A31
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 10:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6641D1FBCAB;
	Wed, 13 Nov 2024 10:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ujhtVSCd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2051.outbound.protection.outlook.com [40.107.105.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF69E1FBC88;
	Wed, 13 Nov 2024 10:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731492763; cv=fail; b=CLeZfJ52SQab7/upewqEl9qLJpNZ4L1xmedtANO2Rbbiij0gjVRfUndQKo8Q/VUuX8JeIpdcMDAo1FSnL4aRDmBwQZUGqNgLvbCWEckn0WT0X+O2R1CqkMcUolUKhh+UwBZt9X6wfcyhZH86Y3K1oi3bU5+FP5uhAVO4kHC1tjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731492763; c=relaxed/simple;
	bh=C8dXkibmUw1yapXhteSlfYaNcIUC87kKnuZBfVDZUJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F80JDGuC3G58gK/OeCrxddeNBy6c5Dqe55wc/TVfID7QVmi3aLEBi9j1TXbQeVNZmUfGo3TEuTNpzrJp1Sdok2j8WTsj6YRoB/HpkfioZiUPyc4W3ibQ3kjWuLmv4EnjzjiXE9TZQpuXOAOtxZ+vp1vqCfFS0hhr4y4ERCOu1D4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ujhtVSCd; arc=fail smtp.client-ip=40.107.105.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LawweWnjj4x++eNajQ1zzpJKUU6XAorJKXjXu2V6FPyFVpW7dNLvatyQYWwvGoBOcBUp/1QOXmOg8zo7RPJ2nD6/mrMfdg7cDKYKbZllIaNnWUHjuesW+LAGCMNf3X/YZoi0PGydq34NAqL6xNqkNblZO7/MnNrT7FGIaUBw2J1M7BJs0HUxn7DNP6XgZAXZ9wNogkAuWIoWKuyxMbFZ8HgaYFIlkMWj+roqB1mH5TlxETrAk3AjKJGoI8cHYjlFXLfLM+MRAEgHYVchVwFwhB5JanylKlm7tBqsQPx3Vbfhw/0Ij/++LLtHx9QB3cCT0XUryeYxPVBcb7GCbNnnoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHX5hYTYU5Vx0dDy8P8XmUqnrwWHmblGMTu8xZWtmV4=;
 b=RgxE214KgHUw2XXL6Z2MNArxtjfeFDSPLJbHJxqreZV7iBp+p9i+U/UJQyL/euf0VfFTYM2Uj/OAb60QCxk8X1THx7nwEcVBuVtA8UkfZyEUD2Kp0VeT9bx22bRlm/4cS5eNWG+ahEN8fP08CooVbIzKWahD0U/eAmiGQ4a7cCl027rT+1chASM7LH6SAjyUuNbQg8WZScd5xI3qX0pm6lYcaTvDdVRntdotorDReB56MCNg5ZqmgmIyvsTS8XnXFroxvxYU/uq9RIx9qg+lxrIRizvH41wtWWBHdLa4HTj2gfcq9tb/P8zbjv/3Hztcf7rPdE8nH4q375lDv+rIqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHX5hYTYU5Vx0dDy8P8XmUqnrwWHmblGMTu8xZWtmV4=;
 b=ujhtVSCdM7bbHn+yY3TJDdNkUwNiQo4baEyvU73Bhh6zE3taubNqY8AWxZOLVQAVID7EDhRn2mKhh4gcoJEHek03bPlslJMl17SGWPFUmuLrJo9Z+kL6x5+ccM3SFgbUVr/f5dNjLWKMM44T0VOdYaUddjb3X76Lqi/4tPTRauKXp5ovDWY9HwGkcTZMN5kbWzeF47NX5odAhpSrjJzFc0lLHiA14V3iKmPFJoXZALxCiU13aLIJyJLpbZR/eBlV/CWG3CCMyt+8gTL/+SdaPL+MsQkr9cYCHsQIAzd7FeE9rqIzEjQVguZxA6ta/RyyK/jwCOEAeP4A1mml7em4Wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by PA2PR04MB10129.eurprd04.prod.outlook.com (2603:10a6:102:3ff::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 10:12:36 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%4]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 10:12:35 +0000
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
Subject: [PATCH v6 2/7] mfd: nxp-siul2: add support for NXP SIUL2
Date: Wed, 13 Nov 2024 12:10:54 +0200
Message-ID: <20241113101124.1279648-3-andrei.stefanescu@oss.nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|PA2PR04MB10129:EE_
X-MS-Office365-Filtering-Correlation-Id: c6591fdf-9b8e-41bb-99e7-08dd03cbb1fa
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjZJcC9FSnk1eDNncnEyUTcwcW9ycWF1L0RGVEJ1S1VTQzBCQ2x5c0E0Qzk5?=
 =?utf-8?B?ZUxjRFFDR1hjMkxLdmtaQnhnSERGVHV2ci9Td002VzJMTmRYcUpmdTZqRmk4?=
 =?utf-8?B?TnpYOEVhM2sycXJaRnhpMVZjRThRZDd5Q081VjhQMlRyY3Fib0EvVUUwT2Q5?=
 =?utf-8?B?dHhxd1haWFlXMWtkU3NQaVBYT3I0bkp4YWRaY2wydlVGWUo3bWxZNjlzd2Nv?=
 =?utf-8?B?QVdkZkhaTmZXUWo2QnE0RHhlRVhNdEV2OFNsYWNqQUVaMndBcW5VSDlscFVR?=
 =?utf-8?B?eURyYTFmQkZqcmE5cXkxWnZKTXVUMlRlU3BxYzY5TlBJN2daU2hjaHh3d2J6?=
 =?utf-8?B?YTNQQVJRcXNtb1habmc1dUhqZ3h4cmYrZC9aMWhLZ3M0bFhOZlQrV0tGMjRi?=
 =?utf-8?B?NlJ0bkxqMkVONEgyMDkrdXFoRnhyc3ExU1VpbS95d2dKUFJXcTh2OC8vbUFE?=
 =?utf-8?B?eUtKQnIwL04zMmsxV1VzeGtERWlzbkxVRUs4cFRiRWFORy9qanpKOFhYeU5L?=
 =?utf-8?B?VzBzS2lNbDhUTzRqd0d4ZHJRZEVRU2IxZE00WVVFQ0Jsd2Fxb1YyeW9HeU9E?=
 =?utf-8?B?TjViWitYTjBreTlEelludTJDajYyMnRrY3h3TWI2MGY3Tm1hK3lXK3ZFRHRq?=
 =?utf-8?B?MlovaFdZcEtoekpwekowT1NacGRqRW5vdzVCUUVkaTBpVkpiSGlJU0U1NWU4?=
 =?utf-8?B?S2pxbkxEeVY4K0VXYU1QWmxyRzVLYnhpT3JTaG5vS05TbkFEa0l5SUNzRldx?=
 =?utf-8?B?THJxWUxVbmpSNmFMb09OdXM5WkFGSjF0L1VtTTFpM05BM1VYUDFvWDNBa2Zt?=
 =?utf-8?B?WHlvcDVaZFZlZENocDVjaFgxcGlpeEZzNjVzbnRmWEExdkN2eHJwN3IzaS90?=
 =?utf-8?B?bXY4MXJGMFk4UVN4Q2NuR2ZBL0N2MGJFUCtDUitVR0djdVlGdnFXWGRkYkt4?=
 =?utf-8?B?MkJ4dllMRTErVWwyTlVWRHRwa0lxQTlJVWl4b3BVZUNqSDI1YTRsSW81TFZi?=
 =?utf-8?B?REI2UFpkY2dlTFM4RTE0dFdyNVZpa1kwTGVLSm4vZjgzU1gvZjd5Rk5LOG1w?=
 =?utf-8?B?RklBL3VMbTBhTjBJMlpsMllGZUJ4d3YyanFrclJ5RGZ0d1ovVkpVeXh3Zmhx?=
 =?utf-8?B?cUxWS1FvTlJpamdmWmJJRWxsZGxYVTV1Q2N6UkhCL20wZFUzZkZsWldFR3Qx?=
 =?utf-8?B?bDVXazhmZ0JNQ1M3QjlWSFRMY0NZNVJGNUlpc2ZBMU5hNGE2OFROaVhpb2lo?=
 =?utf-8?B?S3p4TmlGM2tQWExEM0lQOWV6RTVlUEZyaXlCNGRqRGo2dTgvcGU2TXhPemZq?=
 =?utf-8?B?Q0cxK0l5N29kSXFPQTM5c0JYOG4vdXJvVXYrY2RpZ1JEbno2UUhYbGNVYVpQ?=
 =?utf-8?B?WFM4eEp1bGkwS1VkdE5VU1lLMXFlRjlYTy9WRGlwOERFZUdXZDhtMWxtMVVK?=
 =?utf-8?B?TkpTaDhaVVRmSGhSMnVja3BFS1hkVTUyVUxDVS9kNFpZRlE1NndnaFFiR3dG?=
 =?utf-8?B?Si9uKzNDSk1mOHFsdWJWNHRyUlZVWDJCb2c2SkZPQzVEWDkvaG5EN3RnaDVw?=
 =?utf-8?B?b1ljUEZxMWFGVmJmUStNOXRGV2tGbFh5aFpCWis4bmpWSEhDQ0J5SnEzUkph?=
 =?utf-8?B?dXoyUkFibG0xbW1iMm42SFp6NjRrcXh4amh4K3dlaHlMcmhjRzBFc2Q5eTdS?=
 =?utf-8?B?Ly9YVEo2MDVESWoyUmJXYjhad1hHTWxDUW0wL09FKzJOVEdGL2pBNkI0NFVP?=
 =?utf-8?B?emEzZGkySDJucWZ3TmJTQU41VnpYV2p5Wk9tZXVKZ0daWTNiRFV1QUtlcEw1?=
 =?utf-8?B?WGJqbmhEQmxPd09QT1h4ZUJkMWdPNGhiUDFkZHMrcUdncnQvT0w0Z0gycVFD?=
 =?utf-8?Q?fZsanlTGdvX6o?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHhBbHZlTkVMaGNpMXd0RDQrVTQ3dFBhVDhxc1VRQzlOOW9xQnl4ZlJZamNu?=
 =?utf-8?B?V3hiQ0QzL1gzMnVhd3BSM0xZZlJ1ZjRyUE1OOUs4SFBPUmJaL0FlUDFtdldG?=
 =?utf-8?B?M1JmdTJsYTUzTkNjNG1SWlRvakV2aDdVcUNqTTRQQzJHSVRPZDh3aGxHbU5X?=
 =?utf-8?B?dE5aand3SWtNSHI2a3cyNkNNbVZQOTU4NHJNQVY4T25LRVM1RkNhd1F4a3hi?=
 =?utf-8?B?RXFHRDR0NjJteTkyeENydlVlYkNJZTE4c2dlTzgzRkh6S210UkdPMHNqUHFr?=
 =?utf-8?B?c2VHMThweXAvT2hGcEo1K2g5b0hCVGJnWkdyZDY4R3dwWXVOcG5zWmY2VytV?=
 =?utf-8?B?akFzNXRnK2lNT0tlRVQ0MFZjMVlDaFBVZE9QT3Q1OFV3N2ZMbk5BQTB6QWFH?=
 =?utf-8?B?NG91aUZwQ0s5OXpRMWhOZUlUYWdud0dOb013Wk1lUk1KbTQ0SDRVWEVUTVNG?=
 =?utf-8?B?V2FibHNaSVN0SVU3UEdKTmRMY01UN3dXdGNQdlNjY2tOYW9lTU5ZZ1Y0WHVh?=
 =?utf-8?B?ZjlBVUlITXh5VnNhZks4cENWTklTTk5CZUVDMmJuM3A2OU54NWN4RTNDb1lB?=
 =?utf-8?B?OTBENUFjc0VYQktKYnZTRjZqbG1RSStuRDhDM2ZnNUVVKzFCWFJ0MFlwZlJK?=
 =?utf-8?B?S0p3MFlteU51VmlVWHI3SjZ1cWZRamNJOG1HeGFFa3lEWncwV0ovUnFFOFdJ?=
 =?utf-8?B?KzRwM1VxYVVrNEJseHc4L0k0QS9EaDlBL2VpRDlyM2VGdm9SbHh1am0zMkti?=
 =?utf-8?B?TFVXV0d6NnNNcGM0eS9vR2M4TGtFbzM4NnZHSFVzaGJiSVdXZm9jQmZhTzdS?=
 =?utf-8?B?N3ZaWDJHMXREcW9YWDkraXc1WE5JL1JJc2NGbEw5UWwwZVNLWU53UTFtbFN0?=
 =?utf-8?B?UkRGWHlkQ1hmckl2S1J1aVRUZjJyOE9pOFBTSnZDekJKSkZ3dVEvb2FRbCtu?=
 =?utf-8?B?alpXSzdBVUhnaEVxaUsrcGZkMHByZ0NJU0kwRllIWHUrc0ZFMVRBZlBzYkVs?=
 =?utf-8?B?NFlSKy9LM3E5R1QrS2pjRW1Ua1YxdnNTMmJLNkprM3cyS0NHMDI4ZndneFdp?=
 =?utf-8?B?NEJBa3IrTW9YUHdzQ3hpMm9ndjR6Q2dKMVFJYkhzdEx2ZWxqaGJtdlF2WUtr?=
 =?utf-8?B?N3Z1SlVYeGhMRmNXUmVBamg0YUhlWi94c2xFbUtzQ05nQXpsaHUyRko3MFhk?=
 =?utf-8?B?aXFLb3dlWXNjTXE1aFphWUhVSVZzRThGdWI2WW1LMjQxbXF2Z3k5K2Y0RjBO?=
 =?utf-8?B?eVJMK2pNT1FqbHkvM3NiS3Y2TnRRY1UvQURhYTgreUVXNi9nR3JHSHMranF1?=
 =?utf-8?B?K0t5UlhCWUk4dEpZb21WODY1QTZDZmFMU3BtNC84Y3k4VE94NjErN0ZCK2Mw?=
 =?utf-8?B?SlBLS3R6TjlteTNzOEVId0dtV3dtN0NLM2luRWtYaTYydXkxalhSVG43UnND?=
 =?utf-8?B?RUFWUnJsU2R4dTg1d1Z3ZkVwejIyc1o2WnJPSzhvT2N5QmxneEJsSSs3bXNS?=
 =?utf-8?B?SVk4WlpZODhRMGlSL1RvckNLWE45dU8zMUJ2M1d4dUM0Znp0RDlncnJMNVZt?=
 =?utf-8?B?cHdvV01Ub2VVVGQ0K0FjR0dTdUtYcFhIYlNqY1NuTDJIbzJmYnhjRmYwV1Zv?=
 =?utf-8?B?RlVlajZWbTQwY1pYaHN6MXVEc0Z1WSszaFJXQVBUVktrSEZ3MWtZVVhwWEFW?=
 =?utf-8?B?dk8zM2h3NnBwbWNRTlM5TlRDbDNaZitvSDd6UHI2TjQ4ckozZitqdjZVK2dE?=
 =?utf-8?B?R3N5RUFiLzNWOGJ5cDRqVFdyaEVnSXVjUGVqMERsMHdSN0UvY2FqdmtodDFY?=
 =?utf-8?B?SXFLVFFac24xVmw3MmpQVWMxOEFRellLT3NwV20wL3VORmZ1eWhMQk9SM081?=
 =?utf-8?B?UUQ3aVZSMEtpbzM0UU1vd3U4dFdDWkk3L0JvMy9DSHA5NkM5cCtocWgyVERu?=
 =?utf-8?B?aks5Q2tHcG1kMmlYZzNuYWswWU82VXFlQkJraitZRlF6ZW9WbW1IM0ZZNzZN?=
 =?utf-8?B?ZGVnL1J3OFg2a3Z1My9TeFM2cWx4OGtSaldZZlY3dVZYbTVoUXpXcm90MHlB?=
 =?utf-8?B?Si8rb2tDSldnU3lEaG00YlFxckM0TXNBQ2p0OWkwRjhYeXE4akxOMVlxTWN5?=
 =?utf-8?B?eHpHRDBYRTFJYStKdWVBSUlEYXRVeEdVUERwbjZFc2NhbnJRUDVUNGFYL04y?=
 =?utf-8?B?elE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6591fdf-9b8e-41bb-99e7-08dd03cbb1fa
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 10:12:35.8989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N98eUuO9MRg+cz4uQsJMiN+o09PIFSV/DvKnKNlmwob+GEOVuTopebgn2ZjbXdwlhAZTGli3y05mB4P6wxtnf0oPiTMvIlQ+p+L2WH9nfKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10129

SIUL2 (System Integration Unit Lite) is a hardware module which
implements various functionalities:
- reading SoC information
- pinctrl
- GPIO (including interrupts)

This commit only adds support for pinctrl&GPIO(one cell). Further
commits will add nvmem functionality(a second cell).

There are multiple register types in the SIUL2 module:
- MIDR (MCU ID Register)
	* contains information about the SoC.
- Interrupt related registers
	* There are 32 interrupts named EIRQ. An EIRQ
	  may be routed to one or more GPIOs. Not all
	  GPIOs have EIRQs associated with them
- MSCR (Multiplexed Signal Configuration Register)
	* handle pinmuxing and pinconf
- IMCR (Input Multiplexed Signal Configuration Register)
	* are part of pinmuxing
- PGPDO/PGPDI (Parallel GPIO Pad Data Out/In Register)
	* Write/Read the GPIO value

There are two SIUL2 modules in the S32G SoC. This driver handles
both because functionality is shared between them. For example:
some GPIOs in SIUL2_0 have interrupt capability but the registers
configuring this are in SIUL2_1.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/mfd/Kconfig           |  12 +
 drivers/mfd/Makefile          |   1 +
 drivers/mfd/nxp-siul2.c       | 410 ++++++++++++++++++++++++++++++++++
 include/linux/mfd/nxp-siul2.h |  55 +++++
 4 files changed, 478 insertions(+)
 create mode 100644 drivers/mfd/nxp-siul2.c
 create mode 100644 include/linux/mfd/nxp-siul2.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index f9325bcce1b9..fc590789e8b3 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1098,6 +1098,18 @@ config MFD_NTXEC
 	  certain e-book readers designed by the original design manufacturer
 	  Netronix.
 
+config MFD_NXP_SIUL2
+	tristate "NXP SIUL2 MFD driver"
+	select MFD_CORE
+	select REGMAP_MMIO
+	depends on ARCH_S32 || COMPILE_TEST
+	help
+	  Select this to get support for the NXP SIUL2 (System Integration
+	  Unit Lite) module. This hardware block contains registers for
+	  SoC information, pinctrl and GPIO functionality. This will
+	  probe a MFD driver which will contain cells for a combined
+	  pinctrl&GPIO driver and nvmem drivers for the SoC information.
+
 config MFD_RETU
 	tristate "Nokia Retu and Tahvo multi-function device"
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 2a9f91e81af8..7b19ea014221 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -226,6 +226,7 @@ obj-$(CONFIG_MFD_INTEL_PMC_BXT)	+= intel_pmc_bxt.o
 obj-$(CONFIG_MFD_PALMAS)	+= palmas.o
 obj-$(CONFIG_MFD_VIPERBOARD)    += viperboard.o
 obj-$(CONFIG_MFD_NTXEC)		+= ntxec.o
+obj-$(CONFIG_MFD_NXP_SIUL2) 	+= nxp-siul2.o
 obj-$(CONFIG_MFD_RC5T583)	+= rc5t583.o rc5t583-irq.o
 obj-$(CONFIG_MFD_RK8XX)		+= rk8xx-core.o
 obj-$(CONFIG_MFD_RK8XX_I2C)	+= rk8xx-i2c.o
diff --git a/drivers/mfd/nxp-siul2.c b/drivers/mfd/nxp-siul2.c
new file mode 100644
index 000000000000..7751992e4df3
--- /dev/null
+++ b/drivers/mfd/nxp-siul2.c
@@ -0,0 +1,410 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * SIUL2(System Integration Unit Lite) MFD driver
+ *
+ * Copyright 2024 NXP
+ */
+#include <linux/init.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/nxp-siul2.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+#define S32G_NUM_SIUL2 2
+
+#define S32_REG_RANGE(start, end, name, access)		\
+	{						\
+		.reg_name = (name),			\
+		.reg_start_offset = (start),		\
+		.reg_end_offset = (end),		\
+		.reg_access = (access),			\
+		.valid = true,				\
+	}
+
+#define S32_INVALID_REG_RANGE		\
+	{				\
+		.reg_name = NULL,	\
+		.reg_access = NULL,	\
+		.valid = false,		\
+	}
+
+static const struct mfd_cell nxp_siul2_devs[] = {
+	{
+		.name = "s32g-siul2-pinctrl",
+	}
+};
+
+/**
+ * struct nxp_siul2_reg_range_info: a register range in SIUL2
+ * @reg_name: the name for the register range
+ * @reg_start_offset: the first valid register offset
+ * @reg_end_offset: the last valid register offset
+ * @reg_access: the read/write access tables if not NULL
+ * @valid: whether the register range is valid or not
+ */
+struct nxp_siul2_reg_range_info {
+	const char *reg_name;
+	unsigned int reg_start_offset;
+	unsigned int reg_end_offset;
+	const struct regmap_access_table *reg_access;
+	bool valid;
+};
+
+static const struct regmap_range s32g2_siul2_0_imcr_reg_ranges[] = {
+	/* IMCR0 - IMCR1 */
+	regmap_reg_range(0, 4),
+	/* IMCR3 - IMCR61 */
+	regmap_reg_range(0xC, 0xF4),
+	/* IMCR68 - IMCR83 */
+	regmap_reg_range(0x110, 0x14C)
+};
+
+static const struct regmap_access_table s32g2_siul2_0_imcr = {
+	.yes_ranges = s32g2_siul2_0_imcr_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_0_imcr_reg_ranges)
+};
+
+static const struct regmap_range s32g2_siul2_0_pgpd_reg_ranges[] = {
+	/* PGPD*0 - PGPD*5 */
+	regmap_reg_range(0, 0xA),
+	/* PGPD*6 - PGPD*6 */
+	regmap_reg_range(0xE, 0xE),
+};
+
+static const struct regmap_access_table s32g2_siul2_0_pgpd = {
+	.yes_ranges = s32g2_siul2_0_pgpd_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_0_pgpd_reg_ranges)
+};
+
+static const struct regmap_range s32g2_siul2_1_irq_reg_ranges[] = {
+	/* DISR0 */
+	regmap_reg_range(0x10, 0x10),
+	/* DIRER0 */
+	regmap_reg_range(0x18, 0x18),
+	/* DIRSR0 */
+	regmap_reg_range(0x20, 0x20),
+	/* IREER0 */
+	regmap_reg_range(0x28, 0x28),
+	/* IFEER0 */
+	regmap_reg_range(0x30, 0x30),
+};
+
+static const struct regmap_access_table s32g2_siul2_1_irq = {
+	.yes_ranges = s32g2_siul2_1_irq_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_irq_reg_ranges),
+};
+
+static const struct regmap_range s32g2_siul2_1_irq_volatile_reg_range[] = {
+	/* DISR0 */
+	regmap_reg_range(0x10, 0x10)
+};
+
+static const struct regmap_access_table s32g2_siul2_1_irq_volatile = {
+	.yes_ranges = s32g2_siul2_1_irq_volatile_reg_range,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_irq_volatile_reg_range),
+};
+
+static const struct regmap_range s32g2_siul2_1_mscr_reg_ranges[] = {
+	/* MSCR112 - MSCR122 */
+	regmap_reg_range(0, 0x28),
+	/* MSCR144 - MSCR190 */
+	regmap_reg_range(0x80, 0x138)
+};
+
+static const struct regmap_access_table s32g2_siul2_1_mscr = {
+	.yes_ranges = s32g2_siul2_1_mscr_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_mscr_reg_ranges),
+};
+
+static const struct regmap_range s32g2_siul2_1_imcr_reg_ranges[] = {
+	/* IMCR119 - IMCR121 */
+	regmap_reg_range(0, 8),
+	/* IMCR128 - IMCR129 */
+	regmap_reg_range(0x24, 0x28),
+	/* IMCR143 - IMCR151 */
+	regmap_reg_range(0x60, 0x80),
+	/* IMCR153 - IMCR161 */
+	regmap_reg_range(0x88, 0xA8),
+	/* IMCR205 - IMCR212 */
+	regmap_reg_range(0x158, 0x174),
+	/* IMCR224 - IMCR225 */
+	regmap_reg_range(0x1A4, 0x1A8),
+	/* IMCR233 - IMCR248 */
+	regmap_reg_range(0x1C8, 0x204),
+	/* IMCR273 - IMCR274 */
+	regmap_reg_range(0x268, 0x26C),
+	/* IMCR278 - IMCR281 */
+	regmap_reg_range(0x27C, 0x288),
+	/* IMCR283 - IMCR286 */
+	regmap_reg_range(0x290, 0x29C),
+	/* IMCR288 - IMCR294 */
+	regmap_reg_range(0x2A4, 0x2BC),
+	/* IMCR296 - IMCR302 */
+	regmap_reg_range(0x2C4, 0x2DC),
+	/* IMCR304 - IMCR310 */
+	regmap_reg_range(0x2E4, 0x2FC),
+	/* IMCR312 - IMCR314 */
+	regmap_reg_range(0x304, 0x30C),
+	/* IMCR316 */
+	regmap_reg_range(0x314, 0x314),
+	/* IMCR 318 */
+	regmap_reg_range(0x31C, 0x31C),
+	/* IMCR322 - IMCR340 */
+	regmap_reg_range(0x32C, 0x374),
+	/* IMCR343 - IMCR360 */
+	regmap_reg_range(0x380, 0x3C4),
+	/* IMCR363 - IMCR380 */
+	regmap_reg_range(0x3D0, 0x414),
+	/* IMCR383 - IMCR393 */
+	regmap_reg_range(0x420, 0x448),
+	/* IMCR398 - IMCR433 */
+	regmap_reg_range(0x45C, 0x4E8),
+	/* IMCR467 - IMCR470 */
+	regmap_reg_range(0x570, 0x57C),
+	/* IMCR473 - IMCR475 */
+	regmap_reg_range(0x588, 0x590),
+	/* IMCR478 - IMCR480*/
+	regmap_reg_range(0x59C, 0x5A4),
+	/* IMCR483 - IMCR485 */
+	regmap_reg_range(0x5B0, 0x5B8),
+	/* IMCR488 - IMCR490 */
+	regmap_reg_range(0x5C4, 0x5CC),
+	/* IMCR493 - IMCR495 */
+	regmap_reg_range(0x5D8, 0x5E0),
+};
+
+static const struct regmap_access_table s32g2_siul2_1_imcr = {
+	.yes_ranges = s32g2_siul2_1_imcr_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_imcr_reg_ranges)
+};
+
+static const struct regmap_range s32g2_siul2_1_pgpd_reg_ranges[] = {
+	/* PGPD*7 */
+	regmap_reg_range(0xC, 0xC),
+	/* PGPD*9 */
+	regmap_reg_range(0x10, 0x10),
+	/* PDPG*10 - PGPD*11 */
+	regmap_reg_range(0x14, 0x16),
+};
+
+static const struct regmap_access_table s32g2_siul2_1_pgpd = {
+	.yes_ranges = s32g2_siul2_1_pgpd_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_pgpd_reg_ranges)
+};
+
+static const struct nxp_siul2_reg_range_info
+s32g2_reg_ranges[S32G_NUM_SIUL2][SIUL2_NUM_REG_TYPES] = {
+	/* SIUL2_0 */
+	{
+		[SIUL2_MPIDR] = S32_REG_RANGE(4, 8, "SIUL2_0_MPIDR", NULL),
+		/* Interrupts are to be controlled from SIUL2_1 */
+		[SIUL2_IRQ] = S32_INVALID_REG_RANGE,
+		[SIUL2_MSCR] = S32_REG_RANGE(0x240, 0x3D4, "SIUL2_0_MSCR",
+					     NULL),
+		[SIUL2_IMCR] = S32_REG_RANGE(0xA40, 0xB8C, "SIUL2_0_IMCR",
+					     &s32g2_siul2_0_imcr),
+		[SIUL2_PGPDO] = S32_REG_RANGE(0x1700, 0x170E,
+					      "SIUL2_0_PGPDO",
+					      &s32g2_siul2_0_pgpd),
+		[SIUL2_PGPDI] = S32_REG_RANGE(0x1740, 0x174E,
+					      "SIUL2_0_PGPDI",
+					      &s32g2_siul2_0_pgpd),
+	},
+	/* SIUL2_1 */
+	{
+		[SIUL2_MPIDR] = S32_REG_RANGE(4, 8, "SIUL2_1_MPIDR", NULL),
+		[SIUL2_IRQ] = S32_REG_RANGE(0x10, 0xC0, "SIUL2_1_IRQ",
+					    &s32g2_siul2_1_irq),
+		[SIUL2_MSCR] = S32_REG_RANGE(0x400, 0x538, "SIUL2_1_MSCR",
+					     &s32g2_siul2_1_mscr),
+		[SIUL2_IMCR] = S32_REG_RANGE(0xC1C, 0x11FC, "SIUL2_1_IMCR",
+					     &s32g2_siul2_1_imcr),
+		[SIUL2_PGPDO] = S32_REG_RANGE(0x1700, 0x1716,
+					      "SIUL2_1_PGPDO",
+					      &s32g2_siul2_1_pgpd),
+		[SIUL2_PGPDI] = S32_REG_RANGE(0x1740, 0x1756,
+					      "SIUL2_1_PGPDI",
+					      &s32g2_siul2_1_pgpd),
+	},
+};
+
+static const struct regmap_config nxp_siul2_regmap_irq_conf = {
+	.val_bits = 32,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.cache_type = REGCACHE_FLAT,
+	.use_raw_spinlock = true,
+	.volatile_table = &s32g2_siul2_1_irq_volatile,
+};
+
+static const struct regmap_config nxp_siul2_regmap_generic_conf = {
+	.val_bits = 32,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.cache_type = REGCACHE_FLAT,
+	.use_raw_spinlock = true,
+};
+
+static const struct regmap_config nxp_siul2_regmap_pgpdo_conf = {
+	.val_bits = 16,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.reg_bits = 32,
+	.reg_stride = 2,
+	.cache_type = REGCACHE_FLAT,
+	.use_raw_spinlock = true,
+};
+
+static const struct regmap_config nxp_siul2_regmap_pgpdi_conf = {
+	.val_bits = 16,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.reg_bits = 32,
+	.reg_stride = 2,
+	.cache_type = REGCACHE_NONE,
+	.use_raw_spinlock = true,
+};
+
+static int nxp_siul2_init_regmap(struct platform_device *pdev,
+				 void __iomem *base, unsigned int siul)
+{
+	const struct regmap_config *regmap_configs[SIUL2_NUM_REG_TYPES] = {
+		[SIUL2_MPIDR]	= &nxp_siul2_regmap_generic_conf,
+		[SIUL2_IRQ]	= &nxp_siul2_regmap_irq_conf,
+		[SIUL2_MSCR]	= &nxp_siul2_regmap_generic_conf,
+		[SIUL2_IMCR]	= &nxp_siul2_regmap_generic_conf,
+		[SIUL2_PGPDO]	= &nxp_siul2_regmap_pgpdo_conf,
+		[SIUL2_PGPDI]	= &nxp_siul2_regmap_pgpdi_conf,
+	};
+	const struct nxp_siul2_reg_range_info *tmp_range;
+	struct regmap_config tmp_conf;
+	struct nxp_siul2_info *info;
+	struct nxp_siul2_mfd *priv;
+	void __iomem *reg_start;
+	int i;
+
+	priv = platform_get_drvdata(pdev);
+	info = &priv->siul2[siul];
+
+	for (i = 0; i < SIUL2_NUM_REG_TYPES; i++) {
+		if (!s32g2_reg_ranges[siul][i].valid)
+			continue;
+
+		tmp_range = &s32g2_reg_ranges[siul][i];
+		tmp_conf = *regmap_configs[i];
+		tmp_conf.name = tmp_range->reg_name;
+		tmp_conf.max_register =
+			tmp_range->reg_end_offset - tmp_range->reg_start_offset;
+
+		if (tmp_conf.cache_type != REGCACHE_NONE)
+			tmp_conf.num_reg_defaults_raw =
+				tmp_conf.max_register / tmp_conf.reg_stride;
+
+		if (tmp_range->reg_access) {
+			tmp_conf.wr_table = tmp_range->reg_access;
+			tmp_conf.rd_table = tmp_range->reg_access;
+		}
+
+		reg_start = base + tmp_range->reg_start_offset;
+		info->regmaps[i] = devm_regmap_init_mmio(&pdev->dev, reg_start,
+							 &tmp_conf);
+		if (IS_ERR(info->regmaps[i]))
+			return dev_err_probe(&pdev->dev,
+					     PTR_ERR(info->regmaps[i]),
+					     "regmap %d init failed: %ld\n", i,
+					     PTR_ERR(info->regmaps[i]));
+	}
+
+	return 0;
+}
+
+static int nxp_siul2_parse_dtb(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct of_phandle_args pinspec;
+	struct nxp_siul2_mfd *priv;
+	void __iomem *base;
+	char reg_name[16];
+	int i, ret;
+
+	priv = platform_get_drvdata(pdev);
+
+	for (i = 0; i < priv->num_siul2; i++) {
+		ret = snprintf(reg_name, ARRAY_SIZE(reg_name), "siul2%d", i);
+		if (ret < 0 || ret >= ARRAY_SIZE(reg_name))
+			return ret;
+
+		base = devm_platform_ioremap_resource_byname(pdev, reg_name);
+		if (IS_ERR(base))
+			return dev_err_probe(&pdev->dev, PTR_ERR(base),
+					     "Failed to get MEM resource: %s\n",
+					     reg_name);
+
+		ret = nxp_siul2_init_regmap(pdev, base, i);
+		if (ret)
+			return ret;
+
+		ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
+						       i, &pinspec);
+		if (ret)
+			return ret;
+
+		of_node_put(pinspec.np);
+
+		if (pinspec.args_count != 3)
+			return dev_err_probe(&pdev->dev, -EINVAL,
+					     "Invalid pinspec count: %d\n",
+					     pinspec.args_count);
+
+		priv->siul2[i].gpio_base = pinspec.args[1];
+		priv->siul2[i].gpio_num = pinspec.args[2];
+	}
+
+	return 0;
+}
+
+static int nxp_siul2_probe(struct platform_device *pdev)
+{
+	struct nxp_siul2_mfd *priv;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->num_siul2 = S32G_NUM_SIUL2;
+	priv->siul2 = devm_kcalloc(&pdev->dev, priv->num_siul2,
+				   sizeof(*priv->siul2), GFP_KERNEL);
+	if (!priv->siul2)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+	ret = nxp_siul2_parse_dtb(pdev);
+	if (ret)
+		return ret;
+
+	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
+				    nxp_siul2_devs, ARRAY_SIZE(nxp_siul2_devs),
+				    NULL, 0, NULL);
+}
+
+static const struct of_device_id nxp_siul2_dt_ids[] = {
+	{ .compatible = "nxp,s32g2-siul2" },
+	{ .compatible = "nxp,s32g3-siul2" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, nxp_siul2_dt_ids);
+
+static struct platform_driver nxp_siul2_mfd_driver = {
+	.driver = {
+		.name		= "nxp-siul2-mfd",
+		.of_match_table	= nxp_siul2_dt_ids,
+	},
+	.probe = nxp_siul2_probe,
+};
+
+module_platform_driver(nxp_siul2_mfd_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("NXP SIUL2 MFD driver");
+MODULE_AUTHOR("Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>");
diff --git a/include/linux/mfd/nxp-siul2.h b/include/linux/mfd/nxp-siul2.h
new file mode 100644
index 000000000000..238c812dba29
--- /dev/null
+++ b/include/linux/mfd/nxp-siul2.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * S32 SIUL2 core definitions
+ *
+ * Copyright 2024 NXP
+ */
+
+#ifndef __DRIVERS_MFD_NXP_SIUL2_H
+#define __DRIVERS_MFD_NXP_SIUL2_H
+
+#include <linux/regmap.h>
+
+/**
+ * enum nxp_siul2_reg_type - an enum for SIUL2 reg types
+ * @SIUL2_MPIDR - SoC info
+ * @SIUL2_IRQ - IRQ related registers, only valid in SIUL2_1
+ * @SIUL2_MSCR - used for pinmuxing and pinconf
+ * @SIUL2_IMCR - used for pinmuxing
+ * @SIUL2_PGPDO - writing the GPIO value
+ * @SIUL2_PGPDI - reading the GPIO value
+ */
+enum nxp_siul2_reg_type {
+	SIUL2_MPIDR,
+	SIUL2_IRQ,
+	SIUL2_MSCR,
+	SIUL2_IMCR,
+	SIUL2_PGPDO,
+	SIUL2_PGPDI,
+
+	SIUL2_NUM_REG_TYPES
+};
+
+/**
+ * struct nxp_siul2_info - details about one SIUL2 hardware instance
+ * @regmaps: the regmaps for each register type for a SIUL2 hardware instance
+ * @gpio_base: the first GPIO in this SIUL2 module
+ * @gpio_num: the number of GPIOs in this SIUL2 module
+ */
+struct nxp_siul2_info {
+	struct regmap *regmaps[SIUL2_NUM_REG_TYPES];
+	u32 gpio_base;
+	u32 gpio_num;
+};
+
+/**
+ * struct nxp_siul2_mfd - driver data
+ * @siul2: info about the SIUL2 modules present
+ * @num_siul2: number of siul2 modules
+ */
+struct nxp_siul2_mfd {
+	struct nxp_siul2_info *siul2;
+	u8 num_siul2;
+};
+
+#endif /* __DRIVERS_MFD_NXP_SIUL2_H */
-- 
2.45.2


