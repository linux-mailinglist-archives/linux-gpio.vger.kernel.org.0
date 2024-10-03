Return-Path: <linux-gpio+bounces-10785-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 312F398ECE1
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 12:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9474DB218DC
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 10:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEEB14A084;
	Thu,  3 Oct 2024 10:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lbTZLxWo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011035.outbound.protection.outlook.com [52.101.65.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C7113664E;
	Thu,  3 Oct 2024 10:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727950966; cv=fail; b=RvX4do0sP4IaC4V7IQ5OOL66KO4JgZHa+ThUjggFiul6c5Mv4EgnkEy21V5AC0N2ghJszPJk/CLMviVCAsIx+u0j6Oqlar8hwdXAJah1Gmf/eLBR7exNwPA9V+hK8KyHwxti4ybmSZHbkNsCbC2l2AR7JtnwjiNSbt/qzM608CM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727950966; c=relaxed/simple;
	bh=iaOc/3NsC0LSBGI41pfM2zcZJWdFzNU9Ph4I2/hFiBg=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AlEcHwpNgpZDOYEtbmNshDg5AZH7Hjwor6SYnf60UgotSGNvVoB4ksiV9/mszDAeKiVFSEcscYi1OG5oiQUlJ8Gu7hgCWMm9HVJf6CjUOiAxLt2DPyG81+mBYDFnZNcekfJtLQv6diUtlmv9r6zbnqRbbNfUdKI2RGS82jz+TAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lbTZLxWo; arc=fail smtp.client-ip=52.101.65.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZ2sxzz4YVaqKHejC/VChZ+8EFfwrcQ08P7hrTIk0oXJe4QU5wJS1mCpdKc74FW4E4XDucAVbT4VYU5KB+xr3XcU8RHX8XendlDB8DReyaWmhsZxPMLP5r3nviQBRtfzVmjIuxX0Xh00Sd1NjqpAMiRpwWlQ3PoGku341nRqdw7r22RRMdbwzqXlLn5aEBbm1vZUsEyOV0yVvvlWWX9mFWorRmjHVg3aAuqGhqS1fPEgx+OcbpD1DPBz25yf4APYywlDzn18jyTe0MxnkZIoF7TLDFEXbIfnIfJ6ya4U/QOdGRCFqBQBffBOqo+2qMkJzB0NmeODGCBwoK5b5EcKfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBDY99+/cHJTOUQd7FnLx9Y/OL1FjIbBrYeDvSM9e7g=;
 b=fXPVk+ZnMYlT7YHUYyL1956A5Hsk0IpCvkixzpYshUSuYxKP/T3wrOAFzIVGbUPQbE42tODrH/BKW4gzimmkfqz27a5HGZMCA/q0/3PQTabquQ6lotyNeJO53vjBRyTDkYOe1XqAu4Lt4dcYtldg06+DzfEtZsLC5fV+rh522yfAZEI4DHdz9RQ/mL4wLPbAN/r+kUBYJ0IddO3Ewplarr7V2Z/CdN/ADC9wPHtvjcB4Wa1LMqEv13I8ODLW/daHOvQNMZ8/vzJjIVC2hUv+K3BY8lclyvE7DiIcvuzYIJEQLyBIvRvpeC/vNHsapqVgwzd33buKRTFKeGl3Ydeb5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBDY99+/cHJTOUQd7FnLx9Y/OL1FjIbBrYeDvSM9e7g=;
 b=lbTZLxWopapq+ktuGt2ZH5ppGk6nnbFD/7XtaVxP5VWHG4GeMrygUBv5CejPNyT5fgBKpDH5umZ8+4zMr6HNZNuEppW4ZT5mFsa0QlIE1nw75Mx9baBbbvlhBjSPW8Gkb9BTOmRGt+T1As2wHLjL0LATcz2Cy+e0puSuchXI+FyA2wkyuqmVLdcBmdFFdrGOAwl+T1ksBvE180yuWSDSUPhjo+cgHC8AvyF2dIOzNUFv+7k9FA5z6R1utzLmslmScMzZEoEkXUbwGz0BYiN4d/lkP7SOTY/cm6e1xSabToBMoSl+UaF7eoMTeI73S8HfApmpYE2ytVQlNu6tyl4ezA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AM9PR04MB8956.eurprd04.prod.outlook.com (2603:10a6:20b:40b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 3 Oct
 2024 10:22:39 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Thu, 3 Oct 2024
 10:22:39 +0000
Message-ID: <230e575e-b8b6-4671-a37a-085fef761240@oss.nxp.com>
Date: Thu, 3 Oct 2024 13:22:35 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: gpio: add support for NXP S32G2/S32G3
 SoCs
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>
References: <20240926143122.1385658-1-andrei.stefanescu@oss.nxp.com>
 <20240926143122.1385658-3-andrei.stefanescu@oss.nxp.com>
 <20240926-apricot-unfasten-5577c54a3e2f@spud>
 <c2d8f121-903d-4722-825f-c00604ef3991@oss.nxp.com>
 <20240930-shortness-unedited-650f7996e912@spud>
 <20240930-bamboo-curliness-eb4787b81ea3@spud>
 <20d46ef0-8c58-407d-9130-3c961dd1656f@oss.nxp.com>
Content-Language: en-US
In-Reply-To: <20d46ef0-8c58-407d-9130-3c961dd1656f@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR09CA0002.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::9) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AM9PR04MB8956:EE_
X-MS-Office365-Filtering-Correlation-Id: 85ae8394-1d0f-445d-da60-08dce3954eb3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXYrd3ZuSHljWTdEbVpOOTJidUZzek1ITlhkUDJjMVRHNnJ4N0ZaRmVwNnNp?=
 =?utf-8?B?VGM2YWdTK1NMZmlkcms5TzB2QzBlbEtqL05wVzhkS3JWTzlIYW9kYWI2M3dZ?=
 =?utf-8?B?VDVIVEViYzV5eDhEZUF4dXArQUxjUlViOERXQWhQRG52Vm4wR0tnUGRPT1lM?=
 =?utf-8?B?VkRWRzhHakRrQ2tIalVZbERFL0ZTemJFcENJdUtzcnBoZ3Rpamx3dmVyT1Iy?=
 =?utf-8?B?TGZTMmxsMDhLWnVwbndVRFllb1FwU3U2MXpXMTBuMVE5NU5sRGphWit3ZTdV?=
 =?utf-8?B?VnpsRjBycVlFNHZnNlVPaHg4TWFpWHRCeGFMc0lBUDN5VVR5Zmc4RnhUSFdt?=
 =?utf-8?B?R3Z5c2JMZlUweTRGYjUvL1hqemozU1JqcGVEaktJTG9GYWpqM3ZaOS93SzlW?=
 =?utf-8?B?czA1SFpUL3NtTlFrOGhKY1I3cVJONHR1ZzZmeDZQUGYzUTZtY2huS2FjZHFN?=
 =?utf-8?B?RS9INFB4SWd2WXdJK2hjZTBvZXg0N3RkaURLbmliemUyVWQ5Zms4RFAvcUxG?=
 =?utf-8?B?VGhjNk1aOFFGMW05SlNBdXJXOTNWK1d2dDNGU3ZXRnhPNDhTdkhMajhOUWdH?=
 =?utf-8?B?U1ZpdFJHVGlhNWs4OXBRU3hnUnNQUlNOb2kvOXhidHFtVUwwRVE1SVZWNGs3?=
 =?utf-8?B?YzM3Y1huQWxvRlhsMVROQlVKb3NhZk9DT1FibGk2bmM2QkZmNWJLMHdnamxW?=
 =?utf-8?B?WERUUGQ3Z3h0WTVJTmZ3eVF0ZWdTQVlDMWpIWG50cm53YW4yaEhTUUxnWmVo?=
 =?utf-8?B?L094cFAzZ1JFTWQxdTlYRzhvVmduc1FJVFdTaWpTNG5vNlRPLzRCMm9hVTU2?=
 =?utf-8?B?QkJiNzZJMHM5OFhPWXRib2JhbU12RWZCYTRGcHRXeGdqbXhVN3dNMmpiQVpP?=
 =?utf-8?B?ckMvcm53ODNJTXVXUmdreXpWMzJsVUNRYUNFU3E4WjRIK0JMWVRRNDZtMDlL?=
 =?utf-8?B?LzhZYjBHVEtzS3NhbGZ4UmlxTUVRNHl1L0MyakVqTitEUVVHTkZYZ21MNi95?=
 =?utf-8?B?K1ZLemM0M21lWjlzSVdoNkRia1BtM3p5anRUY0dySERDWG80bXFLRU1NRmRH?=
 =?utf-8?B?b2tLM0JpOEQ5MzV6dGtZM2Y3OXNLNm9qZU5hVXBSaWtwNEttK1c0bmhmTmkr?=
 =?utf-8?B?ZVZ0UHJpL3BPR0NqVGdUT2FvMXdpV0d4VGtUcVRLSHBCZ3VvYTUvRGxpTS9Z?=
 =?utf-8?B?SFBTeWhvbGV0Y0VCdytVWjNnYklFbjBEbWpvS25Leklvak16a1ljYlo3WlN0?=
 =?utf-8?B?SndXWVBHNklESS94bnpRSlZybHNuVUcwSWp2THZOMEo3RUFDcmJBWG5PSG5G?=
 =?utf-8?B?Tm9qS1hla2R1VHBxZ2kzYjBNQnBYUlJGRXgwN1pVa3l0eGZBZms5cENTVnls?=
 =?utf-8?B?SWVMSjdnRFYzQTVpVDAwcUExT1NITFlEMk9iT0x5elA2MlpQVmlZTjk0eDJY?=
 =?utf-8?B?WTZqNE1YOEp2UlhoVlRFU3dxWThJNFJGSmRhcFFzbFhSRkF5eDJ5Y09HYUcw?=
 =?utf-8?B?Vi9uUVdYd050T1N6Mk1LRit1ZlhYUEl0QkF3WGlKdy9jdVlwblIxVzlIZmN6?=
 =?utf-8?B?MWFYempYY0tGNUQ2NnlEb3Y5dlZPSG9FZDgzaGZNUzFBeDZDNHgvTktKZHQ5?=
 =?utf-8?B?bU85VlBUaTk5SW5VUVZHS2Q3VGFuaHBNVHRYejNsQXp6QzVnOUl3MjFpU1Fj?=
 =?utf-8?B?cThWUUdYUXp6cGJ5eUx2SmVsTlpjZjVGdjAvcHBmK1dncHlSeFBGZkdRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cW5DNWxVOEk2SFh6UmlSLzlsL2NsRlZlOFlYSG1sZFJhSldyWFFiQnJIZ093?=
 =?utf-8?B?N2pBU25RRzBGWlREODJ3bjZLZ3NHbTdBZ29hdGRxOEVWY0FmbnJ6R2dCQm5J?=
 =?utf-8?B?aVFlMzNxTGhhMUs0NDRhSUZiQW9aU3MzaWRVL0ZQcGRidzJpeVB1RHF2MTVq?=
 =?utf-8?B?ZzRtSVVJRi9KbjMxa3FBZkVoYTZuQ0NIREF2RzBGYlNVa3p3djR6aFYwdUhk?=
 =?utf-8?B?ei9VUFVuZnQ1WkVuT080eXg1NVJvN2hDWTMzem80QzYwZ1BBY3h0TzhHTTRR?=
 =?utf-8?B?VTRabkgvQldpd0JxMmhMUW1XNWlsc3RsTTFiV0NQRG1jVXVlSDJBQjIzcmNk?=
 =?utf-8?B?QW1kUmRuaHFvV0FDcVJlRzdoVXdnVXVoZDV1ZVdsMzFTa20zODJqSGk3ZExC?=
 =?utf-8?B?MGhzS2JiU0dab0x5TWpJRjJSWEoxS21ZdVRxZ3prQU9Sb2lyWXdRSGNBaVJV?=
 =?utf-8?B?SXdlcjJ6eWpVay9DYzVSRUhiY3lQZHpyWW4wL1RhV2ZZQitURkVIcFhoaXZE?=
 =?utf-8?B?OXQyb292OXgwYXE0dTdKUW5XRmxmQXEva1ZtU1ZIZi9HNlF5azUrWHpuUDBX?=
 =?utf-8?B?NUR1VlJteWlIL3BEVklDNTlGTmVJQVUzSGNQaUsraHdjQkEzM0MrNlRiRGNE?=
 =?utf-8?B?KzhFVkNCazNnbTVnT0xFVjhITUZCMVhYMldHMERiZldqZ2pBQ2ROME44a3Ey?=
 =?utf-8?B?NXZDWVRxaXo5NERsSld0OUNrSlJWUzJxclRGSk5YOWJFWVJEdmZ5T0s5MjEw?=
 =?utf-8?B?UGVuYWlKd3MxRGhwR0RqQUpZMXhYTFVVbXNzUXg3b3oySmtIdmp4T3U4Nit6?=
 =?utf-8?B?U2tvdDZocytTOE9xVHFDK3RRc1RUblJ0WlgrU2JQaVkrV2kyd1p0QTc1U1FS?=
 =?utf-8?B?QjdSdlVrclIzZkpKYm9ZNkNpRlVwTmREaUpIbEo2VU5GZ3MySlk4blQxMmpJ?=
 =?utf-8?B?VCtqSEgvSzZzS0ZMbDMwOE9YQVpIOThUMmtXOUlVSUZYUVRBcjZEcjZQN0Zm?=
 =?utf-8?B?K0QwRGJYdzRTa2s0Y0FicHBmWXRTLzArOThxOUdMTks0OUFjUll0d2VPSEVm?=
 =?utf-8?B?UGRmdTl2a0xpeHdrY3o3MmE2UXJOL2I3b3BGZ1RqSjB0aE04Z1pqL0R3ZEJj?=
 =?utf-8?B?emJrQ2NJTUN1L09nUG5MNUJ2NjVwRTNuOXd5MForTmhqUmVvVHVidDAwa3NF?=
 =?utf-8?B?OEV2OXltWTYxOUZ3N3ZTZll0VS80cnNLUDJwL1NCbllIZTB6SWZMd2h1cXNm?=
 =?utf-8?B?VHRTdjM5a3UzbDhRWUR3RFpmLzhTZnUveW5SODFzUTI1MWk1Q3lJVUhsZWs2?=
 =?utf-8?B?SW1lOTRMSUh5ODUvSlNBOEJYRHdySlBtRXhtSWZlTDZndGxvRFJreVNZWDhI?=
 =?utf-8?B?eEpyTWpMcDRUdGFmM1o3TWhlN1JsdXR3RnY1REdtOEdJQS9uaXpUZTNaL1hp?=
 =?utf-8?B?OW8xK0JobHY0Q05QWnlNb2l5K1dQYkpZKzdUSmc4NGxGYVd0U1JERGZDMzRL?=
 =?utf-8?B?cDJ0VXRKZksvZzZNdlBjbnNIUC9XTGxvUUJkSkNxbnlSY0s4Q1hjNEZIMlkr?=
 =?utf-8?B?OHpZMk5iN0ZNb1lIZFV2Q3RFZ1dLQkpUZGNYVzNoNEtWTExPbWU2YkxEc1Bx?=
 =?utf-8?B?KzEySlJEckRFMVg3Qk4zRG9YZGEzYjZjQno5UWlFM1hvTWR5MnFzTTBEQUJs?=
 =?utf-8?B?MVRSWmdSMktWUWpQcGVnZFJXRjJZckdDdmpIVmpvOU8vV3pOQ2gvYnExQlRp?=
 =?utf-8?B?ZnBKT29MdXl5T1VGWU5icHZWeUgxK1ExSnBxM1ZMZEVabHVaUENmRTRHcDAz?=
 =?utf-8?B?akdDakk2bVhZK0VwVVhHTVIzeERBb0FScWQ5b0NJRWFaM0RiTGV5MldrMlV6?=
 =?utf-8?B?WHN5NEpQUkVGc3JaTkFVMERnVFN0VmVxN1ViOEpKQk0rcElJbXNucm1va29O?=
 =?utf-8?B?akZUc3hMWTNRL2hHeWtFTkpmbnNZUlBtOVdjRWQ2OXR2K3Q0cjFIa2VSZUJl?=
 =?utf-8?B?ZzBlUFZzb0wvdHRoT1lLSTlQNGpIV01qcFJlRnEwOWI1bGhEMDI3ejNDTHJo?=
 =?utf-8?B?QWhaYlVna2cvSG5DT25UK0VST2FuTTdlQmF5eWFnbWNXMndnczB2eUNrbXRt?=
 =?utf-8?B?bVViR3plYUNBZjhBazZJQlNFQ0FXMzIweTNJL3NxMkdVMmMvaGZwZ1hIcTU4?=
 =?utf-8?B?Y1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85ae8394-1d0f-445d-da60-08dce3954eb3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 10:22:39.2298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mGr7I1oJUfj4cIsfAQx1IwXzTnfddnPhJgYUeu8Sg7AeQVMFhpeP4HXiiCgswMag4rMrjeihJvgu9rgtCTxXpklV6Img4NGDWCecK0hUxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8956

Hi Conor,

>>>>>
>>>>> Huh, I only noticed this now. Are you sure that this is a correct
>>>>> representation of this device, and it is not really part of some syscon?
>>>>> The "random" nature of the addresses  and the tiny sizes of the
>>>>> reservations make it seem that way. What other devices are in these
>>>>> regions?
>>>
>>> Thanks for your answer to my second question, but I think you missed this
>>> part here ^^^
>>
>> Reading it again, I think you might have answered my first question,
>> though not explicitly. The regions in question do both pinctrl and gpio,
>> but you have chosen to represent it has lots of mini register regions,
>> rather than as a simple-mfd type device - which I think would be the
>> correct representation. .
> 
> Yes, SIUL2 is mostly used for pinctrl and GPIO. The only other uses case is
> to register a nvmem device for the first two registers in the SIUL2 MIDR1/MIDR2
> (MCU ID Register) which tell us information about the SoC (revision,
> SRAM size and so on).
> 
> I will convert the SIUL2 node into a simple-mfd device and switch the
> GPIO and pinctrl drivers to use the syscon regmap in v5.

I replied in the other patch series
https://lore.kernel.org/all/a924bbb6-96ec-40be-9d82-a76b2ab73afd@oss.nxp.com/
that I actually decided to unify the pinctrl&GPIO drivers instead of making
them mfd_cells.

I have a question regarding the NVMEM driver that I mentioned earlier. I haven't
yet created a patch series to upstream it but I wanted to discuss about it
here since it relates to SIUL2 and, in the future, we would like to upstream it
as well.

We register a NVMEM driver for the first two registers of SIUL2 which can
then be read by other drivers to get information about the SoC. I think
there are two options for integrating it:

- Separate it from the pinctrl&GPIO driver as if it were part of a different
IP. This would look something like this in the device tree

/* SIUL2_0 base address is 0x4009c000 */
/* SIUL2_1 base address is 0x44010000 */

nvmem1@4009c000 {
	/* The registers are 32bit wide but start at offset 0x4 */
	reg = <0x4009c000 0xc>;
	[..]
};

pinctrl-gpio@4009c010 {
	reg = <0x4009c010 0xb84>,  /* SIUL2_0 32bit registers */
	      <0x4009d700 0x50>,   /* SIUL2_0 16bit registers */
	      <0x44010010 0x11f0>, /* SIUL2_1 32bit registers */
	      <0x4401170c 0x4c>,   /* SIUL2_1 16bit registers */  
	[..]
};

nvmem2@0x44010000 {
	reg = <0x44010000 0xc>;
	[..]
}

- have the nvmem as an mfd cell and the pinctrl&GPIO as another mfd cell

The first option keeps the nvmem completely separated from pinctrl&GPIO
but it makes the pinctrl&GPIO node start at an "odd" address. The second one
more accurately represents the hardware (since the functionality is part of
the same hardware block) but I am not sure if adding the mfd layer would add
any benefit since the two functionalities don't have any shared resources in
common.

What do you think?

Best regards,
Andrei


> 
> Best regards,
> Andrei
> 
>  
>> Cheers,
>> Conor.
>>
>>>
>>>>>
>>>>> Additionally, it looks like "opads0" and "ipads0" are in a different
>>>>> region to their "1" equivalents. Should this really be represented as
>>>>> two disctint GPIO controllers?
>>>>
>>>> I will add a bit more context regarding the hardware.
>>>>
>>>> The hardware module which implements pinctrl & GPIO is called SIUL2.
>>>> For both S32G2 and S32G3 we have the same version of the module and 
>>>> it is integrated in the same way. Each SoC has two SIUL2 instances which
>>>> mostly have the same register types and only differ in the number
>>>> of pads associated to them:
>>>>
>>>> - SIUL2_0 mapped at address 0x4009c000, handling pins 0 - 101
>>>> - SIUL2_1 mapped at address 0x44010000, handling pins 112 - 190
>>>>
>>>> There are multiple registers for the SIUL2 modules which are important
>>>> for pinctrl & GPIO:
>>>>
>>>> - MSCR (Multiplexed Signal Configuration Register)
>>>>   It configures the function of a pin and some
>>>>   pinconf properties:
>>>>     - input buffer
>>>>     - output buffer
>>>>     - open-drain
>>>>     - pull-up/pull-down
>>>>     - slew rate
>>>>   Function 0 means the pin is to be used as a GPIO.
>>>>
>>>> - IMCR (Input Multiplexed Signal and Configuration Register)
>>>>   If the signal on this pad is to be read by another hardware
>>>>   module, this register is similar to a multiplexer, its value
>>>>   configures which pad the hardware will link to the module.
>>>>   As an example let's consider the I2C0 SDA line. It has one
>>>>   IMCR associated to it. Below are its possible pins and
>>>>   corresponding IMCR values:
>>>>     pin 16 <- 2
>>>>     pin 24 <- 7
>>>>     pin 31 <- 3
>>>>     pin 122 <- 4 
>>>>       (Note that MSCR122 is part of SIUL2_1 but the IMCR for
>>>>        I2C0_SDA is part of SIUL2_0)
>>>>     pin 153 <- 5
>>>>     pin 161 <- 6
>>>>   The IMCR values should be aligned with the function bits in the
>>>>   MSCR bits. If we want to use pin 122 for I2C0_SDA we will configure
>>>>   the function bits in MSCR122 and write the value 4 to the I2C0_SDA
>>>>   IMCR. 
>>>>
>>>> - PGPDO/PGPDI Parallel GPIO Pad Data Out/In
>>>>   16 bit registers where each bit(besides some gaps) represents
>>>>   a GPIO's output/input value
>>>>
>>>> - DISR0, DIRER0, IREER0, IFEER0
>>>>   These registers are used for: status, enable, rising/falling edge
>>>>   configuration for interrupts. We have 32 interrupts called EIRQ and
>>>>   each interrupt has one or more pads associated with it (controlled
>>>>   by an IMCR register per EIRQ).
>>>>
>>>>   However, one important thing to note is that even though there are
>>>>   EIRQs for SIUL2_0 pads, all the interrupt registers mentioned above
>>>>   are only present in SIUL2_1.
>>>>
>>>> Because of mixed pins (I2C0_SDA in the example above with the MSCR
>>>> in SIUL2_1 for pad 122 and the IMCR in SIUL2_0) and the interrupt
>>>> configuration registers in SIUL2_1 we decided to have a single
>>>> driver instance.
>>>>
>>>>>
>>>>>
>>>>> Cheers,
>>>>> Conor.
>>>>>
>>>>
>>>> Best regards,
>>>> Andrei
>>>>
>>
>>
>  
> 


