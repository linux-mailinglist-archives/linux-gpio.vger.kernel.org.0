Return-Path: <linux-gpio+bounces-13098-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9C49D22A3
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 10:44:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D0D42832CE
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 09:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC711BE226;
	Tue, 19 Nov 2024 09:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="q44lySCh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2061.outbound.protection.outlook.com [40.107.104.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAF919B59C;
	Tue, 19 Nov 2024 09:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732009484; cv=fail; b=FldN9KWspQEPHiCkUecZG9iZWWQpj2c09sKU4MrKI9r66vrqsmAWkRR+QAJZ33Y0pdRPiDfBbKk1PPW1F2UxTlrl/K1b12Y+WR/cC0kDCjWSR7Qtz6Ua6CtRRN0EFfBeD5rzkXw+szWw6DgzK/Fy6D0dLIOAwZ6fziRuIQ4KVMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732009484; c=relaxed/simple;
	bh=LtFguv9uaaqqISm5ETxFjRI7BWx4pVZuGYH/FD6qp+s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NVAiYk55KNMc0ujDgmMMYN728UM/CvYH07edbpQ6IyKhm3eUpgruszj1XkLodL0XCXCHK13FfRdmfxpuwkyiWGNRnZb1izOZZdXt+zpi46HoyIFSLdF58YiWYAvPLnKGZKDebVe4KyXvqYyxNiZ1FqmM8vaFhhLklrj0JkIxQh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=q44lySCh; arc=fail smtp.client-ip=40.107.104.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHc+HEm0kXd9Wahlb9VexpnwmLV4g2jHDzVDNeXogkG2b9aq7k+MpMceMZvr9IlIHSVPmG9bvpvacKD1pYoXmBH5HL40gkppk4tgsnTS15ma08vhqG6rsX9M02dkC7j5OYwfpJXjrwbSnwckB82qU/E7vBgg0bad72pi38ELN+unoJ1s3vC3s2APu7xB2UGIvjn95ucvT026IvVtcS6phovJJbwl7hYsHCuUiQZ4dWQsuHkjeYJhSWkYoCP66aSVGfAEzF2N4ScQxTuHv63/dmT6tCb04ccfoLfGYE0/HyViffRgjwc3NCxHAbS6JJUxYJTbS1AjOwsKfLaLDfneow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zlJyr9rXMNTHhVC7e5Cn7xESlHXcyJK/9I5YvpcEVc=;
 b=rDN7kfF7bz/iFaGe6hk070zbaBk6KdoAeMqR51uE5U7m7UhMMMRB1NlBgDyf6gkobmhXOD5Z9RUIAtTshNItLSr/Kn5Uz8pUXsCcedQdiwcrzmySYCZczqc9grcHUaE+++YK6EiqqXuaxEIFqQVd0K+/HohdnXc53gnM4UW17lytexJqPbUqjnDppmhbHGzpo8/CggPHVejBbbEH6Zjboje9dTYhWJZyPc8kDoiS+eQqbvmXwxHMmSTOndt8FFV0NbrFzIj7+ItR+TXNvx6ttgZzX+FQgXgMbzcLKODZINXIEN+kyHRsNB4+fwrEEAAP9Vm29LS94kVnOpYS+KKntQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zlJyr9rXMNTHhVC7e5Cn7xESlHXcyJK/9I5YvpcEVc=;
 b=q44lySChJmRxkdgxilLgta/3dXLbHjx8kA01LZVfzu851nh+lAnyPIPYRq86Ks6SZbK61I9px5dWJ8ppbml0gmZpPH/skkASdVWPNhBr77kIcxG07Yk4lpPT0FTZaT9wvP4PCHeX6VjawQls/gaqUdDe+WwVIGgCmqVFDVHyvp1czGJv6FgC9uSDJG+Ka4DfZDOXNp6LZ0qIwTxwSMUtVrv2V+HgMbwxkhpITr7M7F98DzcGJpOwh4DFMfLzMlqDjiYMhlZkXv3f/DJwOY59JapcUh50a3EWAxzEkwjskqt/o8JW88KEcRAJ4STaflhy+wYbjYxmwldSxSz8Cf47IQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AM7PR04MB6952.eurprd04.prod.outlook.com (2603:10a6:20b:107::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 09:44:35 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8182.013; Tue, 19 Nov 2024
 09:44:35 +0000
Message-ID: <72b3b5e7-739f-4f03-ac40-a9cbd37972b8@oss.nxp.com>
Date: Tue, 19 Nov 2024 11:44:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] dt-bindings: mfd: add support for the NXP SIUL2
 module
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
 <20241113101124.1279648-2-andrei.stefanescu@oss.nxp.com>
 <18e7a32c-a8de-4e5a-80aa-248b2090e346@kernel.org>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <18e7a32c-a8de-4e5a-80aa-248b2090e346@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P193CA0018.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::23) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AM7PR04MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: 07ef77f5-ec9f-438a-8130-08dd087ec6ce
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2lKUTlVbEV6N3RCb1A1b2kzYy9tOVRIZGpJTFVOQ1dQeUFOSW05bEVQU1V1?=
 =?utf-8?B?NTlGZEVmRlhFa0drS1R0MjUxQnNOVEZkRy81THpoSjFDc3RUcC94Y1VQaVJS?=
 =?utf-8?B?WW93L240bFNPUWxYMzB3em1CeVlqMlV1akovaWR5dDkyUXVnaXh6ZnFadUlm?=
 =?utf-8?B?bGxKMm54bDljZGxLd25KTk5rQjRKRTk5aXRZdEg5YlpGcE1zUjNBZFVvSXdh?=
 =?utf-8?B?dW9JRm1JOW1uUzNsSVpVWVpQeTNzOEdHSngvOXBPaWJhM2p0MDl5RlZkNElq?=
 =?utf-8?B?Y0lwOWsvNjFmMisrUjQyK2V6VWdzMzZUMFdXOWs1TzczaTlCaEVnek1LbCtr?=
 =?utf-8?B?MHNpMHRncWpDZ3lJWUNRQUV0Z3U1YndCcW5LaHMxVDBJcU80aG4rS0daK2dB?=
 =?utf-8?B?YnBkSWtONTF4cjRsUUFSU0lmUjFybHVkdDd4TytUakkwTVMxQXpjL0xzOW1Y?=
 =?utf-8?B?NVRRYUM5Y0pEdm9scHBsdk1zZVZ5TTl4elB1QkZma3hmOGRocVFVTWgvZmt0?=
 =?utf-8?B?QzUvK3dlcS9GeGM0ZVZ1cHhwNXFDNy8yeE5iZ20yekpveGxMR1Fsek51QzJE?=
 =?utf-8?B?NzhjSW1GdE9OK09XWUtaVS9zT3k1YmM5aHB2VFlOMjQvMk43ZWk2dC9wT1BD?=
 =?utf-8?B?a1FkT2NZOU5LMnNzTXNyM3gvV21jVW9mazB5dHA2Ky9uM0d3TzBNSEMwNFZ1?=
 =?utf-8?B?cGRKUGxhUWlTN24yVE41eCs4YVVnUUdHdlo2ak1UcVVlUnZQb0lvV3N5cEls?=
 =?utf-8?B?SGRWSFVlYVNRUlFpY1dHeGI2cStEM2VHTThOeVJVbGlNbWsyUXpBcmx3QXI2?=
 =?utf-8?B?VytlVmVVVHMzeWVXYlQ3aEZiaG1LNzNtVUFyQlhmWElTZ0Ezc2x1V01YUjIw?=
 =?utf-8?B?OVV3clZqb2IwMmxMbFhDRWtVc1FDZm9yYXVhTjBtTlNLd29SZDFsWXpDY0Ji?=
 =?utf-8?B?OXNsR1F6K0dVRFl0bUlrakhLZ01HZDI0MktmSW03aW1SVkVWanB6V25OWmpq?=
 =?utf-8?B?NXUwMDJPZUhmYjJVU3VUUHIyaDljYVJZWkZ0TXdYL3BVYWJUbFRmN2tHOUsr?=
 =?utf-8?B?L1RHdzBXaUtjSkFseEk1N0pHTmlrOGtmUlFwR0JaTi9Ha3gvKzNFaWlaTE9L?=
 =?utf-8?B?T1Juck81L0JRKzlpdjU4bWFzeFljSkUveXp6TjQ3WTRTczNuOXQ3a2JmT0lJ?=
 =?utf-8?B?MWlQRjhzM3I4ckczZzdjalZJOEpBY0ZiMHVLSktYSjJPclpkUHc5dERXUEVS?=
 =?utf-8?B?OWUxbHBMTEFOZDV4UTAvUjFWZ0VYUHdQenRzQVNnOHJHR1k0SXdYZFI2b1U2?=
 =?utf-8?B?ejdaako4K01YTlYwbVc4dzNVTEczV2xTT004bVFJNnpPc0JCbzByVDJKK2tZ?=
 =?utf-8?B?dFBPY3F1RFNjaGRGRHp2eDNHZE5CRlZqbDgvUjY0TUVKRnp6ODZlVDNQbWJW?=
 =?utf-8?B?Q2IwczZ6T0R6K3dUMmFUejFJVUlJVy9QcGVLTVI2Z1NLYUFPamFneDd1ajBj?=
 =?utf-8?B?SUtMaStMdldMeE5zbDlMR003a0JrUWhOdk5sNmpZVlgvK0FKRWtQVWJoMVJy?=
 =?utf-8?B?eW95WFJlNGdyclJabjBwSXd4b25zUVY0RlIyYWpycEgzVnRQTWZMb1QzL0dx?=
 =?utf-8?B?d3ptWmtKYnRNbFdsOFlYNWZNSko5SW1pdGptbXBNRnh2L3FpYnplSXlTYzFF?=
 =?utf-8?B?TVpya2JibmtydFdGT1RNczF0YURlWVdsWngyVlVwdkFLSXBhL0NKYXQ5YmRj?=
 =?utf-8?B?MmNTdUlxNEdHS2lTUkVTVVFyQ1JjRTA1cW1uRG02Ui9CTEFoSmpheWZUVXc4?=
 =?utf-8?Q?xrqPvDFRs1Voud5SOS7s9thsSHnS4N0ggQg7k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjRJb3RPdlhhdE9MZVk4bnRpUmI3ejZ2ZkVOWktsQ2lkVVdsYjluNkM4T2pp?=
 =?utf-8?B?b29VVWEybzZFaTMwNSs3WDJPNzh4bGM1TXkrSFU4QXkxcVFOV3Y0U2o5eHFW?=
 =?utf-8?B?REg0NFBMYVJSK1RyT3RSQ2h6MlkzN09PejhmZGhNS2VyRFNDOW02TFY5OHI1?=
 =?utf-8?B?RTFocFIyQnc4N21Oc0o1QXRweStNTWRMaHEwZ2JWQzlDeTRlUTJZbFVieVJj?=
 =?utf-8?B?ejNlNlpNVUNLTTNVZVFaKzdEUThMVjk2a0pOcGVYY3ptL29kK3BRMmpGWXda?=
 =?utf-8?B?U3pPdXV0dzNFenRZVThmWkp4ZG1OS0d2RE9HWDh2UXI5alZMMGUvRFpHK1BW?=
 =?utf-8?B?eUVuYnQvZmcwT3NHRUhDNkRzNmxPWlkrUTcvYXgwUG0yU0UvWks4SmVDYytN?=
 =?utf-8?B?TGlKVyt1RGZvQ3FIUDVNZTBRR1VkY05RQk8wMXNZaXl5M0dWeGpaU0NLbC8y?=
 =?utf-8?B?ekFhMXlxQmlhYXV2aUpjMXFhVms4Q2U3dlNQY0xlaHN1SEFrL3NZeTlObXd1?=
 =?utf-8?B?K3JvMEFCcXpKb2Nzd3FWYVVrWWVzZjAwYXkxWUhBUWNLN1cvWDUzNVJiampG?=
 =?utf-8?B?WThyWjYrTXNCWWlMcytwNER5MjdERjBLMitaOHFlSXk4a3FnY3ZuOGFGWnd6?=
 =?utf-8?B?LytZWE0wS2kzMUVIbFpwemU2aTQ5cVJ2OWxpMnp6QmtZTjNQclRGYk1BblVJ?=
 =?utf-8?B?OVZKQ1NXNGNpNk9UYWlFUm1VblltMjh2ZXNXUDNOWDdSaUlsNnhPaGNMN3U5?=
 =?utf-8?B?N0ZWUU9sSEozRFNYd05JKzhLVVRSZXA5Z29sVGpPeHUrbVkyNVpUazlXRGpE?=
 =?utf-8?B?TlRBaHJqREpYaVhqaGIyL0RybHhwL2xCZkg4akZJSDUyOWh6cFBtV0RNYjVZ?=
 =?utf-8?B?bTBsbnRkMkhLWFBOUVZZbDE4ODVaaUIranRqTXVUcktsdHU0Uys2SDJRbFJN?=
 =?utf-8?B?YlFzQ3grdlVScENLRUt3WFVJRHJNWTVZVTM1bXplT1pYNkNOS1dPVVJYVDJJ?=
 =?utf-8?B?bXBseU1SdjJBYUtiektISlArRzVKU3JuQ2ExVWM0akFrUGEwakVOSXBnVXRQ?=
 =?utf-8?B?NTV4MkxXSWhlZlp0U1JNckhueTRLY29hM2RnMlUyYmJyR3ppSG5hREtOd0Nv?=
 =?utf-8?B?bmpGVjRCWmJic3greGFQL1pHNDAwSVc1MHlGMEtQSnZiQXVCSmhBVE5RSnRq?=
 =?utf-8?B?c1dWVnNCaTN4K1FWZ21IWlJoeXhNbGY2ekhWb3ZmRjZTL1JweEduc1JYbm5x?=
 =?utf-8?B?ZnVBa1ZtaENGMnQvQzhSUVBzV3lqVTZOV3FzTlhITk94V2tqWGw4S2xianpG?=
 =?utf-8?B?T2VKV2FiOFcrZGNYUGFvcHI0QVhRWkxKak14UWtHVmdyajRCa1ZpcndINS91?=
 =?utf-8?B?SXBiS0h1aFFVb0tLOW1FTDBqNFNiYTcrelVaQWRPbXYxcW9vZ1J6OW1OSHZG?=
 =?utf-8?B?RzNDcjRHZXg4Z21YZ3NsZWR0bmpsQlU3T05PRVZ0MnlvREQrenBaVVgzemMw?=
 =?utf-8?B?MXU2WEZYK3ZCbUpOMm5aR0pkcXhnUGNnU1k4MnRMRklkeFVsMDZGbE5Wa1RM?=
 =?utf-8?B?Mkg4d0h1TUtRUnFKb0xwcnoxdkF5VHJzdU1MREpRS1psYmRab1ZIQk1TclF3?=
 =?utf-8?B?Mjdla0VIWGRFZXo2dzQ0TUlvZ3RKS2JUNHFnWmxWa1dOd3RpS29zbVFwMlp3?=
 =?utf-8?B?SGtTbzZZdElOYkxjUlA0VDRaWHk5eU1BZ1M1VnB4VXVJNjFHTjdMMkpFS0x0?=
 =?utf-8?B?bVRoeW9XRTkrOGU2UVREWkorMTFYWllDRkdWWFN2c2RyTzVRVUFtY2Z3U1JV?=
 =?utf-8?B?dk9sSUJJMldYNWpGUjJrVHMxYmFZaHNQSTl2OWh4Wjh3QnBpbGpEYVF6WDVv?=
 =?utf-8?B?NVhQQS9RWTNUWnNCUE40QVR5RDVrTmZvSkMxNW1YK1Qya3Y0d3ZXSFZDTjQ5?=
 =?utf-8?B?WE9NSUJYcndlTVFDRlJUVVBPQ2RCRnJqRy80QnhEQTFMMTJMcGF2cHFvR2Fo?=
 =?utf-8?B?cVVDMVR2cnd6d2s3VENFOGYvNjlFZ3Fsa3dUT09ObnNYdjFHdnBIYThCMFRm?=
 =?utf-8?B?U0xEK096S2dKaWRXdnhkeUkwVklqYytSbUV4TnByVHZ4Q2EzR2RDNHBLRzQw?=
 =?utf-8?B?UWNJbHhqT25HMTlhOEcva3hMeFl4Ni92SEdqbUMzMzYwODFReUJPODc5YUFh?=
 =?utf-8?B?L2c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ef77f5-ec9f-438a-8130-08dd087ec6ce
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 09:44:35.3543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I1ZqIDii1BDifLMLFvvw5VZDDcMl9xrnNtNbZYYRfqSZ6nSRUTkFAVUK1gxMTwFEot41UnKOApM9KLUCZfss5N+B8S7qe2i5dmsJ/JS7rIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6952

Hi Krzysztof,

Thank you for your review!

On 19/11/2024 11:21, Krzysztof Kozlowski wrote:
> On 13/11/2024 11:10, Andrei Stefanescu wrote:
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nxp,s32g2-siul2
>> +      - nxp,s32g3-siul2
> 
> Not much improved. See other NXP bindings how they do this.
> 

Do you mean to have the "nxp,s32g3-siul2" compatible fall back to the g2 one?

>> +
>> +  gpio-reserved-ranges:
>> +    maxItems: 2
> 
> That's odd to always require two reserved ranges. Does this mean all
> devices have exactly the same reserved GPIOs? Then the driver should not
> export them.

Yes, the driver exports GPIOs from two hardware modules because they are
tightly coupled. I export two gpio-ranges, each one corresponding to a
hardware module. If I were to export more gpio-ranges, thus avoiding
gpio-reserved-ranges, it would be hard to know to which hardware module
a gpio-range belongs. I would like to keep the current implementation
regarding this problem. Would that be ok?

> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It seems my or other reviewer's previous comments were not fully
> addressed. Maybe the feedback got lost between the quotes, maybe you
> just forgot to apply it. Please go back to the previous discussion and
> either implement all requested changes or keep discussing them.
> 
> Thank you.
> </form letter>

Yes, sorry for this. I initially thought you were referring to the
label name. I now realize that I misread it. It will be changed
to pinctrl in the next version.
> 
> 
> 
> Best regards,
> Krzysztof
> 

Best regards,
Andrei


