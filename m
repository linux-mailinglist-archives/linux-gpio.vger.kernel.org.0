Return-Path: <linux-gpio+bounces-10381-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4A197EA1D
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 12:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 730E9B212B8
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 10:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E57196C7B;
	Mon, 23 Sep 2024 10:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xKFtmAFo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from outbound.mail.protection.outlook.com (mail-northeuropeazon11012006.outbound.protection.outlook.com [52.101.66.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5BD78C9C;
	Mon, 23 Sep 2024 10:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727088466; cv=fail; b=uhedeLnd/7xMKdT2DaaFlGBd5Er81ZJ97lmyxhz+A62l/h4u6SMbQNDo21/sB/mQrWfgQuUqxHjcQVPzZFelSgvfoIMfz21nxbB2wqXmclihlfltHtJer/CG7Mt0DRh291R7kNBFAHI2vhgkWSh+a7HcaHQYYw7Gk/c5hOMhV2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727088466; c=relaxed/simple;
	bh=LdpSgwdhtrysPlv4XvNvBXTeH1aZGUSGQSfILnvZ8Ks=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gs6vDeZ0sQmbTx5cfGwbfNx8P2mJckpJsYlcOAn7eqFxrf849jpT2l/YyA8OH6WdFzZVRskrD/+OQxnVIWkwkP7rKGr/mzc6oPArcWTJ0JObn3tX89kho1ad3sMgkqfhVyM2zLqIZJTb+NnMidTf6/R0nS+CUDohUO8m9kcIz+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xKFtmAFo; arc=fail smtp.client-ip=52.101.66.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c1YCva3A8wnn8e1hwXJHFSpp8qGzxyj1Q1EDu+YDh4u7Po/4kfp+bYaXvsdqC7MzoymTc8xsTworeZkOEJV6iMogNwD7J2DQYug8zuTaQQlBKyd3JrQ65J343rkiwkwIOW71yDHFcclUQbBeC5S6BxAZ/9gYPP9fKB4tjAmSs1g39E277M3AXQbBrVMjSidSbIKbmrAgx2su3G0BBB4YshL5OfudbXwTXWPfah3lX2PcOB/Il+xv9hQ0qqRrvkF+lDyF9dCXPtfqNR3ZwoHuHzxibN+AMIQ6WCEyBlIo9XpvrziclBiI2X22NSAH+d4p/XwDHPXL0B5Ei+eiQeOO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvCoYnfRkuGeeezYJemwS09KmZCiN3ekkYpCh5dKNMA=;
 b=SRbq53x6XQ/iJX5L7gd01cEv6c5RufdM8saRMQjUkS0MIKoLzHZrAMS9MQLaCkpJ5lXRAg4ZYahA6Cc8ZMtWvHXWEUdzz21J5d8BVT1PVLur+bmFeFx5pUugc8OQGN8wGsqaXePHWadoKdanwfM2v5EWFbUvS1uvx91KKcnk/kYxK9CHfAY7NR73jELCGL89jvLdEEE+L2NUo9HPR+RSfMkyLbw11PQ6EaLCHYahZt7J+aS65qK7o2IHvg/nXltluzpPoQaAgpJ8tzd+2tr3sR8GQ8TsTeS50l6GWJDK86rfDGORoaSmTS3AmaJ1BjcxPnIQNDi/3GEEBOoeaezMdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvCoYnfRkuGeeezYJemwS09KmZCiN3ekkYpCh5dKNMA=;
 b=xKFtmAFow1VTovSdeEm6/VvDNZJfKuJS+S94ubfArPx3FL8gcYHW4QhojW0fZekfxJbT9P/nNyBZj6Hgkx8iWX0OfSHmT7Jg1Iaag+5sVbamlsBw/8pRTI4uFtxxM4Ov0TXCutKhUrZFINuNPCGbWHivuifzpsLJHyxBKhuiWBKWB5eqeqs8/LcDCUVG56sSc9zy3XnN3LcDPhvVJmTNxtUFfrzw4qx8aTjjl2N2TvDwODx6ccshXkMLZd8yRYhvlfkzYB1CDGBvaSUMpSg95xsnS5L1aU/dPrJrgSXEsQ8gfcYLBE+ZpT3XsCZj3dtSu8PVhfTscNBeTgNw3UBN0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DB9PR04MB8331.eurprd04.prod.outlook.com (2603:10a6:10:244::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 10:47:34 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Mon, 23 Sep 2024
 10:47:34 +0000
Message-ID: <3b51ff7b-ab9b-431c-a43a-49b5a5e74dff@oss.nxp.com>
Date: Mon, 23 Sep 2024 13:47:25 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: gpio: add support for NXP S32G2/S32G3
 SoCs
To: Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>
References: <20240919134732.2626144-1-andrei.stefanescu@oss.nxp.com>
 <20240919134732.2626144-3-andrei.stefanescu@oss.nxp.com>
 <20240920-reapply-amusement-a37cf13fd910@squawk>
 <16950e81-e0ef-4e7c-b0ef-4f56415dceed@oss.nxp.com>
 <bd5a2d24-164c-4707-a5fd-6584e444ee0b@kernel.org>
 <20240921-party-glass-bfb7099c7ded@spud>
 <e6u3kui5md4km5xvjzlq5cfgwvtb73c763uep4j5ysaokmmucr@gz5nxiebg7gu>
 <20240922-plug-legible-74f56d898123@spud>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <20240922-plug-legible-74f56d898123@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0082.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::35) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DB9PR04MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: ec7b375c-5552-4e3b-7f89-08dcdbbd21f6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NEhRNTNjUWVQUHlsOEZzeGNZQnZCUWx1bmtDQjFzYzEvSTY0UjB5bFlWODJj?=
 =?utf-8?B?UFlvWkxnRE9aanNQNTVER1VsR3RLcWVJL1Z3aEhyNGxxTzRQbGM3WEhwM2JR?=
 =?utf-8?B?cytndExJT08rK0Myc21CM1FVcGVOQTcyMlVhMXlPL05LcjJuMTcyTVlBa0k0?=
 =?utf-8?B?Y0FXZm5YbEJjbGpwbnY4YTYzM0JHYVlGYTVQeGt0b2MvSFJEYkZZU1dIeGJT?=
 =?utf-8?B?QkR6OENPVTA4dVNWU2xtdUxSYlZuYXIxZ3IrM1ZMWFNMOUk1UmlRUTZiSVo3?=
 =?utf-8?B?NU4vNFhvYmx3VktEYlpYNndHdHRGTTNQS3FaUEN4NmcrN0ppQzVMd2tRSFBz?=
 =?utf-8?B?RnZibU90QUxyL0k3TkpxWXlZZ0JiaHBkVEZ1NkJrcUpOcEhvVHJpTWxyWWtW?=
 =?utf-8?B?dUlLNWdtcXJuSjFiUDh4d1JpVFlFalVFWnBtajU4UVYxMndmYkRWRkR6VmNK?=
 =?utf-8?B?bWxKM050eVVob29mdkovaDk2T3Fudm5XSkF1NDVPa04wdzkycytuVlROd25X?=
 =?utf-8?B?ZEp2OEVLZmhaVVU3dm1aWjY5Q0wrbTEyMWp5NmtHVkNaZVJkSzJiYVEzWmRN?=
 =?utf-8?B?T2NhY25SV0NpY2xWb2JZb24wU25iWXNndTRWWm1MZU9XdDNsZ3VQVmhJb1k4?=
 =?utf-8?B?N2czUEF4WGU5eEE3WTdUUzRYUThwVWQ2K0Nud25PRGZ3Q2U3a01jWGpJRXgw?=
 =?utf-8?B?ZjBuVkVLR1NxUWJ5ZGhCU0F3NnFWcTFLMTJiL1BlVExqWnVnYzNmOVFPUkp4?=
 =?utf-8?B?UFBwbDlEZ1NlMjJRQS9UcnVBMU5BQVUxbWZrWWpFWS8vZm9ueExpRWdPTkN3?=
 =?utf-8?B?U0R2ZEJ1cEEwbm16TXZNZGMxc3cvanY4U0loYUFkNFZ0TmZBcXVpSVBIM1pj?=
 =?utf-8?B?VGp0RWUzNjY1TUF3d3Q4dllzQUVZMHpYeGdVWHovd0FsQXQwSVdySXgyUUNk?=
 =?utf-8?B?MXY1RDc1RjdiaG5WN1lxLzNBSWppbWlUczZVNDNtS212UXdiWUF1cXVNd2Jq?=
 =?utf-8?B?Zzc0NjBsYWVicmgvK1RUUUpiYXpGak81TGJQSUF2czFYWTZvaXJDQWsyYzdm?=
 =?utf-8?B?c2Q4R2g2OEZkRCtQNlV4enZOR1lNMzZWMmpNclVqNkJQZnZwaVFUMjBNM3lX?=
 =?utf-8?B?T1BFcjlJRG5LTjlDS3BzeFM3a2xVNU1EY1p3MFlkWmFENzRMMWFmUVk4ODVl?=
 =?utf-8?B?QUxialRHemFsTStJRzJONlJPdFRUREdXSHNic3ZNdU9wTTZmak1zc0JtRG4r?=
 =?utf-8?B?RHUvTGVCN1dVVGtVbGFFMlNQbXpHTnVJSGsxZ2I4NGpFZ1VZMXdjMTdjUDV6?=
 =?utf-8?B?TGl5RnBoYXE2RnpVSUJjOWdHczF0K1Bpb1JwWDNIQzBxY3p6UnkvZEhJYThS?=
 =?utf-8?B?QUlSUENYT2VjVURTTVo4N0tDYmxJbi9LNHRUUUp5SE5HeUNoenN1Mk1CMVI2?=
 =?utf-8?B?Zzh5MEZ6bjYrZ2Y3MkJ0cVFwRU9VOXpDdHJkUVcrSGZ4am1ZY0pMcm43Z2xq?=
 =?utf-8?B?ZUZIRjNNY2VBV2w0ZHRtOFE3VDRRbmtiNHEyZDErZk9jWFU1YWMrZ2l5R1h6?=
 =?utf-8?B?Uy9sbUpPc1kzYnhqQ3V6aDN4dU5iQkZMZ1dlVzZCN2hHdFM0N01NYW1PQ0tj?=
 =?utf-8?B?ZHZ5VWl4SkR1YUJ0OUc5dmJTK1A0VER1RS90TklKN3p4Z09lZ1FGQ3ZjUnFN?=
 =?utf-8?B?dmdGcjk2amVBUTlqYlNEaWxGN00vR3M1dFVRNVNTTTY4WWN2K2xQZFZ1Q2pZ?=
 =?utf-8?B?ZCs1TkhiTE5GTkVhbThTT0kvbnhaV2pWekkxdGhMZUJHdmtYWHpKODEvbk9s?=
 =?utf-8?B?NXliYnhJNkNtS3J2T2MxZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVRWYVErRVFQcys3Zzk5YmRTVEpQVmRza3o0cmRCakIvSWF6M0EyWnAzbCt1?=
 =?utf-8?B?cFZTQTNrU1d3bTdQQUM5aWc4aVUweVZoTUNJREw5OEdGbTVienR5bmVVR2tv?=
 =?utf-8?B?Y1hmVDhGcVJTSDdYakhmeU9xb2tHQVBNODducEt2Z3U5bTBvVG93dEd6ZkU4?=
 =?utf-8?B?anRNN0dYamExbnIrdGV1MVU5SndheXpUZDVZNjhjTkJmbndJeWF6Q0ZORis0?=
 =?utf-8?B?MGNYVWRJeEhRTUtKQlY1M2JVd25INzE0YTRVd2cxVERUVDJhR1d0ZEhkUWpG?=
 =?utf-8?B?OE9MVGRDaWZBMGJXZ0JwMnJLVXpnOTdBb3ZXNEpPaUZlRDlGL0JJRUtHY3FS?=
 =?utf-8?B?aVRieU9iNTdEcW53QStYT3hSSEUyL09LSzEzU3RPVDJ0Z2J4aDNRWmUya1Ex?=
 =?utf-8?B?elM3QnJ0ZElRaTNqckFOUzdQcVhJY3R0c2tVQktRZ3VTU1ZiRXdWdXJmUU8v?=
 =?utf-8?B?WkRVd1dKZGhEdVRHYXJxbHB1R0FsazNRa0NyZko2bHBSY0dJZGNyU0FXbC80?=
 =?utf-8?B?dGY1RGpxNDFEdmdKcGtoY3M4bEtvTnVSaXA2WUJQbnp4ZXBvaHY2ZDVPSmd3?=
 =?utf-8?B?ejdYb0xMd1dzSk9zR1o2enpOMldzOHZSeTdoVDlzQkk3UWR1RU5yZFhCME91?=
 =?utf-8?B?b2NlNG5BZ2cxby9TSUQ3cVplNVRHMGYzeVFrdkprY0lwanBrODl1WVR0UHVn?=
 =?utf-8?B?WmRRcGh5QWZsL1gzT1NFc0d1dFI0SHhTZ1UxbmJjdml5RFdmZStad0U0WGl1?=
 =?utf-8?B?RytJKzZRNmJxcUpZZU1oV3RTL2VGNDhXdHR0bkRoZjBWa3M3S29uWFhkQ0Y3?=
 =?utf-8?B?eVpFaVZxcXU5Vkp1dnpHOCt1WnoyRkVLTDRxR1A2QXpUckpZQlJDbkZRdWV0?=
 =?utf-8?B?cHZLMDZ1UEdSeG9EY0xoa2RmRW4zWU1RcVZqWWJjS0xoTjIvRFRvNTliWGtE?=
 =?utf-8?B?ZjhRSDNPYkFVcDV0MklHVTlKeDR1N0Fsb1hXMmY4THlScDkvSE12UURHRVEr?=
 =?utf-8?B?UDFtSmJmSzZwMktjckZXK3hJVk5hb29NV2VrWXNGSVdaUUpUSmRpN1M3b0tZ?=
 =?utf-8?B?SWlFc25kQTRjcmFqUkxkN3BpczJZKysxc3NzRW9GTjNHU1VsQW1yUENyeC9l?=
 =?utf-8?B?bHZ5T08wRXJSVENCdHRWaE9DZ25NM0dSUlFTdnNpQzlJRXVwRWl4bTlSZUly?=
 =?utf-8?B?TTg4OGpNeHJrU3ptd2FpRGY4RlJaazdGWGZyRDN6a29PVGZXMEtOT3NlRmFG?=
 =?utf-8?B?bG02NFVVenJFa1FocDJmUFBVbkR1YmFYSFJPL3ZmWDFwemxSR1JOeDVsZmsx?=
 =?utf-8?B?MDB4bUViVE9BWlJNT2pwNk9wQURHUis4VWQ4YndPVCt6N3hXK1p5NWR4R0dr?=
 =?utf-8?B?ODFudGVHL3lYbnFaUzBHamU4M3lTRGR5THdSRjZpVWJtQng2YXRJdm9pdlkv?=
 =?utf-8?B?MWNNdWRXcU1oWUpqVXltZUtnN2JRWnVqSjN0KzhJN2lsaHQwM1hjYWczWmxw?=
 =?utf-8?B?L1NXcXFkcW1LblI5WHNLY1hHWVhTMWN5VHRzRXJwdFQwQllZYmRidFZzZFJV?=
 =?utf-8?B?NjREdXpvcG9QTEdFbVJINCtnVWdZVjQ1WmhzTW4yb0txc09CaDlSdW9pQmlH?=
 =?utf-8?B?ZmttN0k1Q3VEaExnS2dVQkhPUWFhSjU4S251S25IbldDdmVIV0FEeW52WTNR?=
 =?utf-8?B?aU9kQXFjZUtXRkd6ZUFOVkpMRjJ0bFFDV2Z2UjFUUnRtTDZXZmVqb1hMZURx?=
 =?utf-8?B?b2ZuTGt4eTR1NVBONTVSd3F3TU9vd1lZcHIrdCtpeWRjSkQyNVhuL09Ncnhr?=
 =?utf-8?B?dldMeGp0MnZWMkQwZHp6QTViSTVsM3pRMGNua3ZZN0JzVzA0Kzdtd3VVRjRv?=
 =?utf-8?B?elJqaTVqaHczTFN3TUpDY3VMZ0dmMjhreFBjOWVZSlExVFo2TldMcDNsMjNv?=
 =?utf-8?B?cDU5OVNmcnprbVc2YVU0L3BBS2FqRGUyWWwramVOQjZyandqMnRkeG91bTJD?=
 =?utf-8?B?UXhmMjZWeFlUWVRWMU9vOElyYXdCWVVaS29abC9WWjlyRWZuRFFqbVdqSm0x?=
 =?utf-8?B?Q3dsK3pLQUcyQ0JQZUpsQk1BRHAxNGgzRTI1NTcyTEZpNTEycEVyTDU0WS9E?=
 =?utf-8?B?Zk12N3dqK05CWW85RHNYejZDN0ZKcVo3WjVBcDlNaGJUdGFIYmVFZkZxV1Ni?=
 =?utf-8?B?RVE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7b375c-5552-4e3b-7f89-08dcdbbd21f6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 10:47:34.8206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o830cF0hdRIyUFKa13bmIG8FsuuYReRJGjlG6cD1l0knTp0sKH8josp5oqWF6zH+pkCvikNy5IDA8TWCvTbHL1XiHKjVR+7ua4aCY57jt0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8331

Hi,

On 23/09/2024 00:07, Conor Dooley wrote:
> On Sun, Sep 22, 2024 at 11:04:22PM +0200, Krzysztof Kozlowski wrote:
>> On Sat, Sep 21, 2024 at 10:58:46PM +0100, Conor Dooley wrote:
>>> On Fri, Sep 20, 2024 at 03:40:31PM +0200, Krzysztof Kozlowski wrote:
>>>> On 20/09/2024 15:33, Andrei Stefanescu wrote:
> 
>>>>>>> +properties:
>>>>>>> +  compatible:
>>>>>>> +    items:
>>>>>>> +      - const: nxp,s32g2-siul2-gpio
>>>>>>
>>>>>> Commit message and binding description say s32g2 and s32g3, but there's
>>>>>> only a compatible here for g2.
>>>>>
>>>>> Yes, the SIUL2 GPIO hardware is the same for both S32G2 and S32G3 SoCs. I plan
>>>>> to reuse the same compatible when I add the SIUL2 GPIO device tree node for
>>>>> the S32G3 boards. Would that be ok?
>>>>
>>>> There are only few exceptions where re-using compatible is allowed. Was
>>>> S32G on them? Please consult existing practice/maintainers and past reviews.

I will add another compatible: "nxp,s32g3-siul2-gpio" for the S32G3 SoC. We currently
also have the SIUL2 pinctrl driver in upstream with only one compatible:
"nxp,s32g2-siul2-pinctrl". Should I also send a separate patch to add an S32G3 compatible
to it?

>>
>> Just in case this was not clear - comment "please consult existing..."
>> was towards Andrei, not you Conor.
> 
> Oh I know, I was just passing through and figured I may as well leave a
> comment repeating what I said on the other devices :)
> 
>>> Pretty sure I had a similar conversation about another peripheral on
>>> these devices, and it was established that these are not different fusings
>>> etc, but rather are independent SoCs that reuse an IP core. Given that,
>>> I'd expect to see a fallback compatible used here, as is the norm.
>>
>> Yep.
>>
>> Best regards,
>> Krzysztof
>>

Best regards,
Andrei


