Return-Path: <linux-gpio+bounces-10724-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5EA98DE55
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 17:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 036521C22B51
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6891CF7BC;
	Wed,  2 Oct 2024 15:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KQ++j/Qy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012035.outbound.protection.outlook.com [52.101.66.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187B410E9;
	Wed,  2 Oct 2024 15:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727881544; cv=fail; b=GCrn2DLaN5pprjK1PL7a4Xp1BPBRl0GDRWJ5j0snpT3txiVMyJafyfPxJMC/fNdT4SuVBv8hYnmalO8qMu1EZNaL6ExIIFGpbxvbIX3oGE5Zh8sh49D2F8ufiAhwrqjBvmtgHN0+qWsdrlWNtVSjn4hY3NYzS5RuvaBu3DuSdxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727881544; c=relaxed/simple;
	bh=oaMnVGbAXlbzHKxATDW8/6ltr8ftPp10xh+F75YMltI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nWpemS/anLMTIdnYc5BldEtsAGEMLJSJ5ENCNyfRz1tIQq0eZYJgr+sFEkbayd9CW8xzHfoA1JIaQsHfvtL9lqfmsqjS2XPwBPspo29DiobSI4+/cjBO5a6YiHVi7ymDFxTtxV7I3o3QP7PZWXIIsjeU3Es2vfPMCMWhwmsNmaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KQ++j/Qy; arc=fail smtp.client-ip=52.101.66.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TvahOKzMOl1edhn6FNwEs5NsRhGkHiE7N0w+l8laS3fdXFNTiH3zv0gyR0WkyB44FOal39MzvzSPPi2T75yLL5nLDLGF1sd2Sh7irAY6UDG1LH7d+apRj5Dgn7SuGuurVJGAM4xiFMhbQwWhsv7CCIJl8uWpHXgPakdbpUz9F06+VK0EeZ98PXhZynXdH6ukomVLIYCy8LVxcAYWOtFVDT27vFvtZCKbEB5VFc3ctDpS0RLWVyjYSgj5b4fjOw+F9fKtLn0jskfNdqBdFO0ZeOr5jv0Sms5Qgke/FeLwRXTYW73yBMR0qEiVDXh9aLxQDGNOF5RPJgjuBvlmaNyhAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a729Zl3WXFGsAvCb5vxDxsn2tqyAiUdCylPN4wQ+xdg=;
 b=EV2mH6I5ya5SacrvgjkSgswr/K4Yd1L7oSSW4EgELzKXnEDJGEgMDkc7FswAaWSSCVa/tzLJLxrNkUgyZ2lqJ7fQsEk/1kw7ggMRbSfAphGK3HmePIDC6Pp2XEN0zgCV9KsujygweuhhaviO9u41QQBCefbEnxo3mXfuw/IMTdJHtWVVMAOOXBNCtEdy1ifB/wLWXceD3+URPdpRhb6wDUh/0x0gTWBLX0e05wvUGDdh+pLpVn5nTpH4vEgEJTlqz7J9g617U1EDl66Vr6zXMfgd5uSJLuV7UImDZqRXgibbVoGhFkIcRlMwzchOpx274EMofv9ieXqZC2Jj6XZCTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a729Zl3WXFGsAvCb5vxDxsn2tqyAiUdCylPN4wQ+xdg=;
 b=KQ++j/Qyj3p+kcsgLfn4hCns7tqjYNlc/9PAdl2pc3JHUMIlv4JM5RbngbeOxKkOFamQ9qPTc7yzv7Gc+18YBrNVi5N/RV03+XokI5YLQagpR7Ean5lLI2iSMNtq/sRtsvUHLBgiLPXz7gxcMSE2jXKzGo3OWlVZ+bm7QzUyPDPf8ItBQ91N1ofvOpJS6dJh/qiHwvP9de902tuUZSnhxC2/Jhl4k4m0CpwMUiUjGU/lZluIADppBlu6Bv7JQPsyuxgfnOXRK9Vsr7nRecIBUUu49cXuh9+O/SisXkyJDHUG3ntq3yUUPnIqJHSgbtUsRcr4/m+6e0s8Sm90fTMl9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AM0PR04MB6913.eurprd04.prod.outlook.com (2603:10a6:208:184::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 15:05:37 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Wed, 2 Oct 2024
 15:05:37 +0000
Message-ID: <68b6b76d-f9a2-4207-a980-a319cd541381@oss.nxp.com>
Date: Wed, 2 Oct 2024 18:05:27 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs
 support
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
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
 <20240926143122.1385658-4-andrei.stefanescu@oss.nxp.com>
 <CACRpkdaYcis2r6eNDfdXV9zcXof6x_XfGHFADJ2RojxLNp7C-A@mail.gmail.com>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <CACRpkdaYcis2r6eNDfdXV9zcXof6x_XfGHFADJ2RojxLNp7C-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR10CA0015.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::11) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AM0PR04MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e87198-fdd7-421e-0dd5-08dce2f3abd0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEs1RCtMdEVYd3lWZm16TWwwUkFDYUtuRjRQcHVHYWYvU1psZFNFaGx2djNu?=
 =?utf-8?B?MlQraHdUdUp1VWd1Qk1qYzVlS2pqanhqbE80ZkhqY1pPKzJsWnE5OWhUN0Rl?=
 =?utf-8?B?U1BVeVNDTW5xN3ZRQ2IxRHdqYzJTN2tsdnVVWHdHcUhOM3NQbmUvTFNFUFZ3?=
 =?utf-8?B?WlBnV0FDTkRzckxscG10NXlQWmJBQ0RMTGt2R203Wk9vQnZqOFA3bndWTW5T?=
 =?utf-8?B?RE12cUhGdnJ5YW5UeGRVQVJYbEprdlE3VXZVejMvRTJmNDE1VU05Y3dBMUts?=
 =?utf-8?B?NFZrcnladDlMMmlTZU5QRy9QcXhqaEpld0l4cldONjE0SG5TcWxHMlROWG5V?=
 =?utf-8?B?T2tnWUE4NHdlOGpROEladTJMTXRMdWUrRWx0aHpYNEFkREEwVkdQWDhmdnBI?=
 =?utf-8?B?VTUzVGJaM2E1QjhoTVJWVUtZSks3VEx1ZmZadEp1akZPR1I1ZzkrS1pZQzBP?=
 =?utf-8?B?QWI5bzJmVzRzQlFxZ1ZRRWdSU3BsMkVsZzZFSTU0QzJqMnhYaEttOUpQbjJQ?=
 =?utf-8?B?dFlVR0tRRHdmQkcvV0JHSUdIckZDOWdQTURVUmpNSG03bkpSdlp1LzdvUXh0?=
 =?utf-8?B?SEdpV0F1cUwwNWtZQlRWb1MwNWJFeXRNRk9kVkxwL0JaeXArMEdJR3lFaits?=
 =?utf-8?B?ODlxeHJ2RVMvMDR4ZENpSmhQNWVRbkdWeUhyaGNWR0d2a0YrSERBYTQ5aVVN?=
 =?utf-8?B?VURpcS9ITHA1REZnd2dqRGFUMXpMVURjOHRMNE9vM2wwNFgyQTQ1U29TR2Nt?=
 =?utf-8?B?UnFjbDZMWGNPTjZXV1NiaURGVUdGMUFyK3QxclUwc2lEUC83MDcvUitZTXpX?=
 =?utf-8?B?MVhiNEI4Y2c0elVzeWNvTE5hMFROTURsbDVHS0kyVXZFTVpnUk95SEI3aVBw?=
 =?utf-8?B?R3VNc0xWRllLUDIxWVF2QU5jVlhGcDV4T3lHc3Z0ZENJNlh5SEpGTnlqRGdi?=
 =?utf-8?B?MDIvYmRndXpTbDRtTE5vaVByUnJ4aW1DKytBRjBCVkRoSzFSM3pkeTBOZFRL?=
 =?utf-8?B?M2hoOUE4TWhaTU5VNlRLOGtSbjl3S1JJZXlqTDlnckg5Q2wzSUlsRkJ6bXc1?=
 =?utf-8?B?azl6eHdSeWF4d2hFQXdlRkV1aVdOTk5CNG5RNS9yLytFdVJyZWkxNVRqUDJW?=
 =?utf-8?B?MGNGOUdNaHRVV0FoNVNiQUhSS00rbDI4Q3Nia3gySllMdDhBdUFVWTRVano2?=
 =?utf-8?B?amNOSFVHYnB2a2w4alU4Mm9kZEsyV2xMYnR5VmtUVDJJQVVianljVG11UmMz?=
 =?utf-8?B?ZXhRaGNLSkJUd2Q2a0FDTS9oQlpLVXlEb0t1RTk1dU5TR1NVaEhtYml2RGZj?=
 =?utf-8?B?aG5zZVJROGNIYWIzMGc3Q2FMcHhpWE4vYXNRb0M3ZDdqc0xlSnUyQUFRSGE0?=
 =?utf-8?B?dGdpUU1wQlAranJ5TWM3ZURQb1YrYVZGSk9aNkF2NkVYWW54ajROM0pmbktp?=
 =?utf-8?B?NGFicldRems0ck9UR3J6c1JVTlNoaU8zZHhZVGZZVjJ6cHJlTHk0QlJXOWo1?=
 =?utf-8?B?c1JYVkZOS21rczFodmEzSUFxK1VEcmFSc1d0UG1KclV1ZDhCaTB2WFBYU3Qv?=
 =?utf-8?B?VDM3dm5ySWIyY2FBeGVWdzRXWDlmMlBXWGNDNTV0WklOYWhhenEyWkpWTFcw?=
 =?utf-8?B?ZU84Yml6cUFOM2VEczN0Ylh2RzBURGNNWnFHOVdncXQ5RDZRNmxYUGFDdzhB?=
 =?utf-8?B?bU9OczljOG42TlJncTBFMnFnUUhvMDNtSVVka090cFJGMTBFY2F6bEtnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGdzeEV4ZGUyOFhRb3JqUDVYd0NDUXVid0JxOTFnTFlURDZjOVJwTENLRlF1?=
 =?utf-8?B?ajJPa2Y3dXhIdTVESXNMME1xODIra0FZdjJoMlNWNmVXdjJud043eXlzR2JO?=
 =?utf-8?B?NUk4c0dvdDdpMkZGQmlzUGw1ODBKS2g5UU5GQ0hmaGRUdlVaMHQrSmhwTXBP?=
 =?utf-8?B?d2p2bGJSWDVaZlZjSjc0Tm5HclpiRU1CMTFmb3Jyc1FxK2pXWlBEenpQZG1S?=
 =?utf-8?B?RjlVdmNONnRBYnFwTTN1SmVnVGJxaEEwMXcwanI1MHVuUm9xcXd1bWExaHor?=
 =?utf-8?B?RmlFSkJxSVUzVXFFYUNGQlhBRlZxcmFEMEt5SGFHd3VIVm04WFhvVllLZncv?=
 =?utf-8?B?NmQxQjVQWFNmTEdFYW9HOUhJSnNySmhDZUpMNjF0TVl3UE1FcHA4M0xRaGJv?=
 =?utf-8?B?SjVMUks5YU5IUVQxR2pTZ3l2Wkg5ZUxXYzFhV1pkdXNXeXh2Q0JoMDRlSWdO?=
 =?utf-8?B?L28zSU1JZXhvdVY5alVhNTQycE9wcmtRYjY1YnpoWnBGWWpyUFI4T1p1eWFS?=
 =?utf-8?B?NTUzQjZSWnVVWXE5UlRQR3hwc2IzbitUekQzdXdnYzFoZDh1OElYYXpTdjBj?=
 =?utf-8?B?QXJ2YWtPRWh2ZWhrVWs2dEZMTzdSdlpaRXlYU1hxOFNpd05zckhjMTNtUmI5?=
 =?utf-8?B?TEl1R3RhbmR2bzM2YmtqYlp5VDZadkNYbWpSQ0FVK1ZnT0kyM0lFUkowdEtI?=
 =?utf-8?B?SDlGVHFrL2JVdnBmeVNMVEdIMXFybC9RaDF0RnNZK1FWZXhZSHd6dW5ueUxB?=
 =?utf-8?B?L01hemhiMEdsT09kMG1ZeDhHMVZmdUt3SG9jZHp1YTRyaEVYQzlHT1g1ZXpw?=
 =?utf-8?B?R2lCb1dUMXJSZnd0TmFPd3VhZzVjdVBsSHU1TG9vQ1FVakJ5ZHZCN0I4aW55?=
 =?utf-8?B?WW9aUDhBNGVGbHQ1TEFySGtqWnRLZkhzQkMwQ1FHb1lOQWZEN2FDcFB2V3Y0?=
 =?utf-8?B?NjhKVktZREFMamxIOWNweVZTUkI1VEM1YXRmTEthNWY5bHN3YjZMbXJTZFJ5?=
 =?utf-8?B?di9HOXZxV3czS3IyTm9JOU1rUkFyNWtlLzlrd2s5S25zb2dvQUZ0NExkMVJD?=
 =?utf-8?B?S1NNVTMxcGVzUW9WOUZFZkJSWVdZb0ZTRHIrbnQ4RGx4eUorVEQ5WTZ6NC9K?=
 =?utf-8?B?Q3NMTjNacmp2Z3JGR01OVXp0bFFyUWN4K2pTVVpDTmFYQW1nMTdHUit1NXpl?=
 =?utf-8?B?NTdVSlJrRUl5dmNSYzN5UW4wamVISy9FZTBML3NaV0hzYnJJd3ZoVWM4N0Zk?=
 =?utf-8?B?WkZiRllwaGFtWWxGWDc3ZEx4MVFVdkN6ZDFFejBYTWtHd1EvTVVhbC9ibU5G?=
 =?utf-8?B?RmxnZUtzbzJFaGF0QjQvZ252OVl0ejBjMm9lNlRPT3NjZ0FvL0F0MWQzVytv?=
 =?utf-8?B?UGI5VHhmMWpBTkRhWGx1L251K3hSTHFndXZ5VTV5aVkrejNOUUU1TGVhKzdo?=
 =?utf-8?B?dWtHTUdZUUxjSmh0aDZEalhrcURGVlJzT2JOM0NZOStDamIzNnRpUzJQUFc4?=
 =?utf-8?B?S2NUVnZtYmI2YkJnaGxCbC95MGNMVzVrZjNlZ3lHVXdWdU5VOFJsTGNHc2t6?=
 =?utf-8?B?bVc1akpaYm9iT3dYTlhTdzc2UlVRclFQSm5oQmpMY1BLUGNoRWExbVNOREQr?=
 =?utf-8?B?Z2M5S0lxWC9vcTFkaUZkZm4rbnNScGtTQ3hQM0Y2TEhUekNrWDRrZ0dQaFdt?=
 =?utf-8?B?SndTYk9kUkJnTmIxS0ZqMGJlMXc4WDI5QU4zanhGSytOTkp2L3ZId3dqZU0v?=
 =?utf-8?B?WlgwZzhVM2tKdzJ4V3dDKzgwQWZFTDl0YlM5NXg5NnpZdG1uYU9zTElhWU56?=
 =?utf-8?B?NDVSamRmRmV6VHpmVXJMd253ekxHZjUzUTNRZ2ZsUHZ0NTYwN0dkN0l4MTBz?=
 =?utf-8?B?TVJ4RURUNHA5Q3Rsd1lNSlI1UEdzS2pia000TXRoQ3dlYktHZzRjRmNVMHI5?=
 =?utf-8?B?ejBWdjliWDlHZWh2OWgzb3FuZzJEbCtWT1R0bHg2L054RDBlb3FYQ3cyRkxR?=
 =?utf-8?B?aEtKSFc5R3VtSmRadE8wWUdzNUtMak96WEE4VllmSnBTQXZUcVVsODJ3U2Mr?=
 =?utf-8?B?UUpqcEgyN0l4MWMwYThJU3BuQSs1Mkg4c2ViM2hkTW16MktZcWRvNXhZNDcy?=
 =?utf-8?B?Y3VGWnVWeEJBc0VsdThrRzBnL1FPTWV6UWd3Tjh1Y3l5NjJvQ0NsRFgwa2t3?=
 =?utf-8?B?S3c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e87198-fdd7-421e-0dd5-08dce2f3abd0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 15:05:37.0934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: be/JK1DpVeTH1ttgGame4yFFvtIVWPGYUOoyvheUANwqNB98/XUq/AjXykG2Zs3AyP3p4yXgTj+P1zadyXacpjfUmm8NTm7DRPTc8C0KoMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6913

Hi Linus,

Thank you for the review!

On 01/10/2024 16:15, Linus Walleij wrote:
> Hi Andrei,
> 
> thanks for your patch!
> 
> Sorry for being so late in giving any deeper review of it.
> 
> On Thu, Sep 26, 2024 at 4:32 PM Andrei Stefanescu
> <andrei.stefanescu@oss.nxp.com> wrote:
> 
>> Add the GPIO driver for S32G2/S32G3 SoCs. This driver uses the SIUL2
>> (System Integration Unit Lite2) hardware module. There are two
>> SIUL2 hardware modules present, SIUL2_0(controlling GPIOs 0-101) and
>> SIUL2_1 for the rest.
>>
>> The GPIOs are not fully contiguous, there are some gaps:
>> - GPIO102 up to GPIO111(inclusive) are invalid
>> - GPIO123 up to GPIO143(inclusive) are invalid
>>
>> Some GPIOs are input only(i.e. GPI182) though this restriction
>> is not yet enforced in code.
>>
>> This patch adds basic GPIO functionality(no interrupts, no
>> suspend/resume functions).
>>
>> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
>> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> 
> (...)

I will add the Co-developed-by tags in v5.

> 
>> +#include <linux/err.h>
>> +#include <linux/init.h>
>> +#include <linux/io.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/module.h>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/pinctrl/consumer.h>
> 
> Hm, are you sure you don't want one of those combined
> GPIO+pinctrl drivers? Look in drivers/pinctrl for examples such
> as drivers/pinctrl/pinctrl-stmfx.c

Thank you for the suggestion! I will merge the two drivers in v5.
> 
>> +/* PGPDOs are 16bit registers that come in big endian
>> + * order if they are grouped in pairs of two.
>> + *
>> + * For example, the order is PGPDO1, PGPDO0, PGPDO3, PGPDO2...
>> + */
>> +#define SIUL2_PGPDO(N)         (((N) ^ 1) * 2)
>> +#define S32G2_SIUL2_NUM                2
>> +#define S32G2_PADS_DTS_TAG_LEN 7
>> +
>> +#define SIUL2_GPIO_16_PAD_SIZE 16
> 
> You seem to be manipulating "pads" which is pin control territory.
> That should be done in a pin control driver.
> 

This is more of a case of bad naming, the registers used for
setting/reading a GPIO's value are called Parallel GPIO Pad Data
Output/Input (PGPDO/PGPDI) and they are 16bit wide. I will try to
find a better name for this.

>> +/**
>> + * struct siul2_device_data  - platform data attached to the compatible.
>> + * @pad_access: access table for I/O pads, consists of S32G2_SIUL2_NUM tables.
>> + * @reset_cnt: reset the pin name counter to zero when switching to SIUL2_1.
>> + */
>> +struct siul2_device_data {
>> +       const struct regmap_access_table **pad_access;
>> +       const bool reset_cnt;
> 
> I don't understand the reset_cnt variable at all. Explain why it exists in the
> kerneldoc please.

It is used while generating the GPIO line names. The naming scheme is to
have: P + letter + number(0 to 15). The "reset_cnt" is used to tell if
the number should change to 0 when naming the SIUL21 GPIOs. For example,
for S32G2, the SIUL20 module has 102 pins named PA00, PA01, ..., PA15,
PB0, .., PG05. SIUL21 starts at 112 and reset_cnt is true so the first
pin will be PH00.

We have another platform which uses this driver and doesn't have the 102-111 gap
and the first SIUL21 pin is named PH06.

I will remove this. I figured out now that I can see if the first pin is
divisible by 16 and reset the counter in that case.

> 
>> +/**
>> + * struct siul2_desc - describes a SIUL2 hw module.
>> + * @pad_access: array of valid I/O pads.
> 
> Now that is really pin control isn't it.

This is again referring to the registers for setting the
the output value/reading the input value of a GPIO. I will
change the name in v5.

> 
>> + * @opadmap: the regmap of the Parallel GPIO Pad Data Out Register.
>> + * @ipadmap: the regmap of the Parallel GPIO Pad Data In Register.
>> + * @gpio_base: the first GPIO pin.
>> + * @gpio_num: the number of GPIO pins.
>> + */
>> +struct siul2_desc {
>> +       const struct regmap_access_table *pad_access;
>> +       struct regmap *opadmap;
>> +       struct regmap *ipadmap;
>> +       u32 gpio_base;
>> +       u32 gpio_num;
>> +};
> (...)
> 
>> +static int siul2_get_gpio_pinspec(struct platform_device *pdev,
>> +                                 struct of_phandle_args *pinspec,
>> +                                 unsigned int range_index)
>> +{
>> +       struct device_node *np = pdev->dev.of_node;
>> +
>> +       return of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
>> +                                               range_index, pinspec);
>> +}
> 
> I do not see why a driver would parse gpio-ranges since the gpiolib
> core should normally deal with the translation between GPIO lines
> and pins.
> 
> This looks hacky and probably an indication that you want to use
> a combined pinctrl+gpio driver so the different parts of the driver
> can access the same structures easily without hacks.

We parse the gpio-ranges property because this driver handles
two GPIO hardware IPs in a single driver instance. This is because
both SIUL2 modules have pins with interrupt capability but the
registers to configure interrupts are part of SIUL21.
We use the gpio_base and gpio_num to generate the line names
and to select the correct regmap for PGPDOs/PGPDIs
(Parallel GPIO Pad Data Output/Input).

> 
>> +static void siul2_gpio_set_direction(struct siul2_gpio_dev *dev,
>> +                                    unsigned int gpio, int dir)
>> +{
>> +       guard(raw_spinlock_irqsave)(&dev->lock);
>> +
>> +       if (dir == GPIO_LINE_DIRECTION_IN)
>> +               __clear_bit(gpio, dev->pin_dir_bitmap);
>> +       else
>> +               __set_bit(gpio, dev->pin_dir_bitmap);
>> +}
> 
> This looks like a job for gpio regmap?
> 
> select GPIO_REGMAP,
> look in other driver for examples of how to use it.

We use the bitmap just to store the current direction of a pad.
I don't think we can use the gpio-regmap driver because we
rely on the pinctrl driver to configure the pin(pinmux&pinconf).

> 
>> +static int siul2_get_direction(struct siul2_gpio_dev *dev,
>> +                              unsigned int gpio)
>> +{
>> +       return test_bit(gpio, dev->pin_dir_bitmap) ? GPIO_LINE_DIRECTION_OUT :
>> +                                                    GPIO_LINE_DIRECTION_IN;
>> +}
> 
> Also looks like a reimplementation of GPIO_REGMAP.

The answer above applies here as well.

> 
>> +static int siul2_gpio_dir_out(struct gpio_chip *chip, unsigned int gpio,
>> +                             int val)
>> +{
>> +       struct siul2_gpio_dev *gpio_dev;
>> +       int ret = 0;
>> +
>> +       gpio_dev = to_siul2_gpio_dev(chip);
>> +       siul2_gpio_set_val(chip, gpio, val);
>> +
>> +       ret = pinctrl_gpio_direction_output(chip, gpio);
> (...)
> 
> This is nice, pin control is properly used as the back-end.
> 
>> +static int siul2_gpio_remove_reserved_names(struct device *dev,
>> +                                           struct siul2_gpio_dev *gpio_dev,
>> +                                           char **names)
>> +{
>> +       struct device_node *np = dev->of_node;
>> +       int num_ranges, i, j, ret;
>> +       u32 base_gpio, num_gpio;
>> +
>> +       /* Parse the gpio-reserved-ranges to know which GPIOs to exclude. */
>> +
>> +       num_ranges = of_property_count_u32_elems(dev->of_node,
>> +                                                "gpio-reserved-ranges");
>> +
>> +       /* The "gpio-reserved-ranges" is optional. */
>> +       if (num_ranges < 0)
>> +               return 0;
>> +       num_ranges /= 2;
>> +
>> +       for (i = 0; i < num_ranges; i++) {
>> +               ret = of_property_read_u32_index(np, "gpio-reserved-ranges",
>> +                                                i * 2, &base_gpio);
>> +               if (ret) {
>> +                       dev_err(dev, "Could not parse the start GPIO: %d\n",
>> +                               ret);
>> +                       return ret;
>> +               }
>> +
>> +               ret = of_property_read_u32_index(np, "gpio-reserved-ranges",
>> +                                                i * 2 + 1, &num_gpio);
>> +               if (ret) {
>> +                       dev_err(dev, "Could not parse num. GPIOs: %d\n", ret);
>> +                       return ret;
>> +               }
>> +
>> +               if (base_gpio + num_gpio > gpio_dev->gc.ngpio) {
>> +                       dev_err(dev, "Reserved GPIOs outside of GPIO range\n");
>> +                       return -EINVAL;
>> +               }
>> +
>> +               /* Remove names set for reserved GPIOs. */
>> +               for (j = base_gpio; j < base_gpio + num_gpio; j++) {
>> +                       devm_kfree(dev, names[j]);
>> +                       names[j] = NULL;
>> +               }
>> +       }
>> +
>> +       return 0;
>> +}
> 
> I don't get this. gpio-reserved-ranges is something that is parsed and
> handled by gpiolib. Read the code in gpiolib.c and you'll probably
> figure out how to let gpiolib take care of this for you.

We use this just to remove line names for reserved GPIOs(in our case
not present, we have some gaps).

> 
>> +static int siul2_gpio_populate_names(struct device *dev,
>> +                                    struct siul2_gpio_dev *gpio_dev)
>> +{
>> +       unsigned int num_index = 0;
>> +       char ch_index = 'A';
>> +       char **names;
>> +       int i, ret;
>> +
>> +       names = devm_kcalloc(dev, gpio_dev->gc.ngpio, sizeof(*names),
>> +                            GFP_KERNEL);
>> +       if (!names)
>> +               return -ENOMEM;
>> +
>> +       for (i = 0; i < S32G2_SIUL2_NUM; i++) {
>> +               ret = siul2_gen_names(dev, gpio_dev->siul2[i].gpio_num,
>> +                                     names + gpio_dev->siul2[i].gpio_base,
>> +                                     &ch_index, &num_index);
>> +               if (ret) {
>> +                       dev_err(dev, "Could not set names for SIUL2_%d GPIOs\n",
>> +                               i);
>> +                       return ret;
>> +               }
>> +
>> +               if (gpio_dev->platdata->reset_cnt)
>> +                       num_index = 0;
>> +
>> +               ch_index++;
>> +       }
>> +
>> +       ret = siul2_gpio_remove_reserved_names(dev, gpio_dev, names);
>> +       if (ret)
>> +               return ret;
>> +
>> +       gpio_dev->gc.names = (const char *const *)names;
>> +
>> +       return 0;
>> +}
> 
> Interesting!
> 
> I'm not against, on the contrary this looks really helpful to users.

I can try to integrate this into gpiolib after I merge this driver.

> 
>> +       gc = &gpio_dev->gc;
> 
> No poking around in the gpiolib internals please.
> 
> Look at what other drivers do and do like they do.

I will fix in v5.

> 
> On top of these comments:
> everywhere you do [raw_spin_]locks: try to use guards or
> scoped guards instead. git grep guard drivers/gpio for
> many examples.

I will fix in v5.

> 
> Yours,
> Linus Walleij

Best regards,
Andrei


