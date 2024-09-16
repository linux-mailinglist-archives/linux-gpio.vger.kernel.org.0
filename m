Return-Path: <linux-gpio+bounces-10163-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB3F979AE7
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 08:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A68C282CB9
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 06:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79893381B1;
	Mon, 16 Sep 2024 06:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="guP7ReCZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2082.outbound.protection.outlook.com [40.107.241.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1813B43ABD;
	Mon, 16 Sep 2024 06:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726466504; cv=fail; b=FRTtc2HrUFWzifFsulOQMluwwmhJGktneNPzuJ5D2PssOmOLg1QiYWJG6E3+8vwF/trxneSpvjQkJK1ZKscFvpvj3aqxoSQpfXEakct0p2ZBF6RUJMVcrEZ6Z7aYhpbPDFFMSyFbq60Px4CSZ/eiQ23BV9LC7oCXkqLWL7Sr8qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726466504; c=relaxed/simple;
	bh=CiGEJ1BR2k7z6mSaBZKS7A/5tA5wIdL7n/f/2uLtIlE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QP5z+50lzIjM8zBfylVZvFME300rMvaVXDygxqmuLfDvRCgkU30gIkPEY9Vez2ITZ7CMDFQwilZEncVAmgendeLcuQ9K+9lTKvqHQaSiVNozBmbtIsLeN0zEvNfozPKttKh2AKvDgK2BR7h0GcJCW4GR1mrO2MolOpOBNvb6V0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=guP7ReCZ; arc=fail smtp.client-ip=40.107.241.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yl13R6NtHm7G3dXI/aeza787xHtdsIWV8Tl12hHXol08VLW4OXT372bFopeErYdYY+/7eLue97P7NOtGgEdNPLjcf79vHurnB45uDncNan7JIsgsfos4NgVg81Ff4Slu4ABLJAAjEBbl/VMZ9kQDqzEjwN5mprNvy3Mrrw1mA+uMJ8xPoRmyIgAOChQqfL/PiwWpAZQhtdVTioqw+/ug3mtRno0zeKEuduswQxBIZy+7SdC69qThBKf2P1hDKWmrj/EjOggKoNrWwvJCmgpqOZVzV38VZp2vQjzIx0VylY8oPHiLKfP2dA214GzhM8yqyl3VpirEEI6n7NuVo/kCcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkqpK/V0vwUaP9C32jybsz68lTfKlEHcv2BM7B8eMKI=;
 b=IZU6n7x5d2AH+dNocFh6TfGrCZ7TcGPpnrKneHlWBK5QyibeX8XPg1NOLGQ9QuyaozIzE7Y9az4SQA03mGyL1WCxFAVhwq3dbi+dO6ZyeVh7JNKESHhuDFEcCo4V2UPzOWVoeLFqv+neNF16+qJ+T8LzLCWlkZb5/+lQgqsmxYkPYY/aNbIQltsTKv1HFHARRV2hrhGfNm0gmO4OwDMrAZkY6ccVCHBWJ9jiU5PPRtOh6TJYWF7KC9Kkhy83HbJ1qRCZ3mZdAUMDeyGhpJ/fFp+pQm5b53MGdWhzDWjYty98k//wjEhZOlUaHGPF2hHEaHkNpXi2OIINFKOO84PBKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkqpK/V0vwUaP9C32jybsz68lTfKlEHcv2BM7B8eMKI=;
 b=guP7ReCZs0JY4gcpqT4dPKZHrz8fvEqacGLpl+DqwtW00sDVoQdOEoL460Q2w4M5WYhCTWwBXnwzTt6tIWFmQdb+fjSOZmKvi8AjDjS9VyOGZWuO4inO5SKLzREw2FFt39GkaK4h2HAd5BXHZqNm0fIBbinMzqdCB19/kY3cO9DqySsOp/2CbBiA3FLPNkTl7bB/U0RMpFLL6oAY13tWdTnFz335Cz7l3QIZStNmbSyllfGwDy4mg4xmRWOjAhRaZsbQ60h4cta8zmvkIkcIVT7Z6n/34gJbCKFPjneRZl+RPcoEVTG3J9kH7vV3RlQBqsW2/zJzAFcO/jA9wMmnkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by GV1PR04MB10559.eurprd04.prod.outlook.com (2603:10a6:150:20b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 06:01:37 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 06:01:37 +0000
Message-ID: <464742a3-2aae-4980-ad33-28142d98abd4@oss.nxp.com>
Date: Mon, 16 Sep 2024 09:01:11 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: gpio: add support for NXP S32G2/S32G3
 SoCs
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>
References: <20240913082937.444367-1-andrei.stefanescu@oss.nxp.com>
 <20240913082937.444367-3-andrei.stefanescu@oss.nxp.com>
 <20240913141348.GA3927538-robh@kernel.org>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <20240913141348.GA3927538-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0029.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::19) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|GV1PR04MB10559:EE_
X-MS-Office365-Filtering-Correlation-Id: 82c26659-63ce-418e-573b-08dcd6150658
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWh5dCtqTE5aV09kMm9QNThXTVpEeTB4dms0N0xBSXcrNTAxWWNiT1lUV3VG?=
 =?utf-8?B?ckgwbjhSMkcyQnA2QkhqMjc3aVZaZy95UGlsOG9ScDQ5THo5elNsVHRNMll3?=
 =?utf-8?B?dVA0Q1o2U3FpazU0ejZtODFDVXNGL3Y3eDVnK0E2RCt4TzB0NEh5WFJObHdo?=
 =?utf-8?B?VEhBYmVjME5mTElaa1N6MmJtWWlLVUgyb0xDUzlOdGtYRjh0ME4xYzA2OVRW?=
 =?utf-8?B?MU5RMUplZWhjck13YTJXdG5jRmR6SVBhL0N6T1pZSVBXeWlWQ1ZaMEgzREJW?=
 =?utf-8?B?bnNwSnRsWGxJSWdZY1FFd2YwdEFyVTQzWnlEaWE2Rno4aUVCenVrb2dnRGZr?=
 =?utf-8?B?UzRkY2w0amNUc0lDRjNGa01IdjhiQ3JyalMrdThkOXZwMVFha1JpUHpUNG9X?=
 =?utf-8?B?N09EajUxVURLMWFzZldMRFBnSG9GUXZMOFliVUwwZ2NFZlJYMDk5QmRlcHFx?=
 =?utf-8?B?Vk9Zb042cFB2ZkpPZ3hBejhCOXhEckljZXdtd1doN1FkUklwaEp0L0w1YStk?=
 =?utf-8?B?QXNNMStGdm1vYkc3ODNVb2RoVklhcEhhclM3SThWS1dQdk1WM1BrdTFteXdL?=
 =?utf-8?B?R1djMjFNQmFaNDlwRkFzbEtNN0F1WHU1enhvdWR6ZkRuZUVGcW9NU1loQmg3?=
 =?utf-8?B?TGUzNzNlSk5FdTJNVjlTSzNpU3luK2RMdi9FZTlNbGhrVlpoSTNaU1NKSkp2?=
 =?utf-8?B?dHRsSVlkM0lLM1ErQThsRG1Eb1Q3TmlOWG91UXBMOURlQnQ1UnBWOFR5UlJq?=
 =?utf-8?B?RXlFYTA1clNMQXR0TUtzbE5zSzZCRmZDaGdVZFpsZ0dQcHFyL2FQeGNBSlVU?=
 =?utf-8?B?Z0ZXaHlwWHFFMjdUOE9CVWJqOG1XTVBUbHl5b3VOR0pnZVE1ZU0xNTNWTWE0?=
 =?utf-8?B?WEh6aHY2QW9abnppaWM1UGRtWUMzVlhyTWhCcWVyeTV4UlhHNWZBRllMT1lJ?=
 =?utf-8?B?U2x0aWFQVlQwOWdOWkN5OVAxUGZoeVJUQWpYTFprWUNiM1JxVE11azhXZ2Zp?=
 =?utf-8?B?OVdZaGFVblc2VGM0RG5VUy9oV2M4bE84THpKNlZEN2xtUkRpT3pJTnZNbndv?=
 =?utf-8?B?OXVpSWdRS2k2Q3FxamFYYVVsNUtwQnNrUzZSMHhiTWQrTWVxcGJ4LzZDclVj?=
 =?utf-8?B?TzdycGhjSmEyaWVGaVhiOWRvQ05oZEdURW8xM2JpMENURmpDRG9ZdUVwbWRL?=
 =?utf-8?B?RmczZEdOKzJLNHpGdU1QTXpzMENmODN1QWFMcllIdmV3cG5OcEtONWFRT1Rm?=
 =?utf-8?B?TEo4WWpSSkRBMlFZSVBGMmVBY1czeDh1Y3lMLzhrN0lxK1ZZVHhORVU4QUZv?=
 =?utf-8?B?RUVvOE4xanQrRnB5U3hSTFVOeHBlMlhlQmN0dURuWlhaTU9kN3hUN3Axbitw?=
 =?utf-8?B?ZnBVbURCYkN5ZG1YdlYwRWpRMS9hQkZnTTZ0NWNEdDl1eXFjTkprb0lYT1Y4?=
 =?utf-8?B?YmlDUW1oWDNCQ2c1VVV2ZmoxSC93SmM5cFpQMHFIT2ZjOTZuYmtLaTJHK3Qz?=
 =?utf-8?B?R2Njb2c3R1dKK1pyMVowSm43bDZRVFR0QlE2S1krWGtrUkVGVGpzSGhBMTAw?=
 =?utf-8?B?Z0Y2Tm12ZmpZU1Q1YlIrV2lJd2dkSUN1am5GNFNRNzR6NUFNbis1bkdVL2xm?=
 =?utf-8?B?alNVblcwK3ltTVNESjRVaXFzNDVsQzl2NnZDc1hlV1FaanFiUXR1bE8rQUJM?=
 =?utf-8?B?WTNOQXhEZFJXZ2hhZ0Y0NXZyZ3l2QUliUDhET1I0ZFI0MWtyTVYyWWVMa2dD?=
 =?utf-8?B?RGNVaDBqU3ZXRmUvNlEwKzFhVU14KzRaczZPd1VXUG5jcmFjVEFuZ2pIWWpa?=
 =?utf-8?B?bjZtR2lhclNvTVoxRThFUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0lNL3JQSXRianFjTlNpNXNNeEhwblFDTXV5OXlXeTNJMkFYc0FtWkNORmw4?=
 =?utf-8?B?Zm9sMzhaU0lVaGoxWlNsd2R6c3Z3akdNWkFEVFYyaUtLLzlmNUoxR3lPdlFF?=
 =?utf-8?B?MjZzeFBFa0YwSFR0NE92T2RleGNDZ2Z2akFoSXVoTHRrb3BSekh6VkhyUXVp?=
 =?utf-8?B?WS9JbHd0ZkVJb2Iyc2prd3hoREQ3dlhlWHp2azJMUjhHMjZzc3VlUTNTVHZ3?=
 =?utf-8?B?ODdxR1hYMXZYcC9iTmRmd2xBb3pFQ2dLM2gxVXVKd1Z6ZXRMQXdDR3hwYTQ4?=
 =?utf-8?B?QlEzbDQvYTZaVFdFVDQxRXd4MDk1NEJCNjB3NjdQREg2KzlpaC9GbVBETXFS?=
 =?utf-8?B?ZUd0YWh4bVdlZUFyQWgySGR4VGlsS1kwZlVCNy9wbGFaM1JVSDN0R1M4ZlJK?=
 =?utf-8?B?M1dXQ2toeC83QVZmRlBIU0JMQmYwdVV6N3pNbmNQb01LZ2FRNDRwWCtoTXFp?=
 =?utf-8?B?QmRpVnJNMHY3V0llUVJNQVdocE5DKzVORms4emkvWHFVWDRtK1hSQjdZc0VG?=
 =?utf-8?B?Sks4R0E1YlNTdFNvSTA4enlCaW00S2dVdDdvVkwvcWRIVVRDYWlUM3hKb2Jk?=
 =?utf-8?B?dnBHbnlIVk5lZzdybVlHNVJBM05ic3FHTjZtNmc2Z1BZVkM4Q2JyTENCZVNK?=
 =?utf-8?B?Y0ZzRlZnMkJHVGg5Zi9XS0dkVklhbmVwbkwrY2t6Q0c0L0h4TTZOdm9nVkJp?=
 =?utf-8?B?NjR3ZFVVblVTTDRYMCs0bThveTR5aDJZaENtNGVoQVoxa2l5enZDYzZDdGRF?=
 =?utf-8?B?RFZtZHFnR3haUnZPbC9YNm5tazZJV3BXUVVyUUVKQW9vZXNYVjZBMUxQT1ov?=
 =?utf-8?B?SkR1emE4Z3lqMFdyWjBoVmRrWHFNK01qRis0WVRZRkNMY2RhZWZVam15Vk1x?=
 =?utf-8?B?K1NoYTBaS282T3JhQlhBVnZ2M0p1dEFGUVpsVVZZaGFaL1Q1SFIzeHplUkc1?=
 =?utf-8?B?QTBuSE9nZmFKVEt2Nk5NQnVkT2t3aGhjSXZYUUJSRmVSYTBCNEk5cmNSa2RR?=
 =?utf-8?B?WDNSMFU5NHZQaUQ2Z0Roa1Q1YjVtcytPR3hYNEFuaFNTbGZ0NEVLZ3RyVW9m?=
 =?utf-8?B?Y1VVY28rU21BUGxrK05OYTV5N25iWkc1UkN4bWlNQVVpRUQrdnduVzZvbG5x?=
 =?utf-8?B?MURHSFIvdzh4Y28rSEwzU0F1ODUrZk5jWWNXS05KV3hZUk1sTEZ3Vmh4TDlT?=
 =?utf-8?B?dGFRQzdWakhvMnFTQWUxbVlBUit1UE0zOXNjRFFsdW9LSERtVGpCWnBrZ3NR?=
 =?utf-8?B?bnBrTlorNTBORWFsWG9UZk1QMUhjU2FhNGpCQUFJQmVsSWhnWVZDZGhPaXhy?=
 =?utf-8?B?Vm0rZnpaYkpiSGV2NEJIY1MvNEp4V1AyY29UdHdSWWZ2Ui93WmJjZXZOUFJk?=
 =?utf-8?B?cVRzTXlFdVV2Y2o3NEtDb2oxb2RrQ2swY3hhVWhFQThzbzBSK2sxVndKSXpy?=
 =?utf-8?B?WHdMUDdGMFljS2swZHZjUWJRRDBwWkMySXVYV3hWM2piNkQyQ2ZmTHAyMmhQ?=
 =?utf-8?B?enQycjgwaThWS1hlM1BMZW5lWmZ4TjVvYjFwN21xM1BVSzl1dEl0SG5WVmdT?=
 =?utf-8?B?N1hha1JneTdBWHAyV2hkVVhqQ3dRWjRrVkxZWW0rNGEzWFppcGwrVWNrMmdX?=
 =?utf-8?B?YndSTGliV01KOCs4VlR1L3dabmpveThIZWJ6ODQ2U0E2Slp1UjRIaUtOUno1?=
 =?utf-8?B?NVpJSU5CQ21EU2EwNUptWSs2cjVmMWRVSlVtNTcyOS84ZlJ4dVFTN1dkVERV?=
 =?utf-8?B?OWMwRkpKL0I4MHNkMERwSmQwTXVOUUprNUhjaTJBYlRPanBtZTRMd2lHV3Yx?=
 =?utf-8?B?ZVpQVUtzaGs5YWpycW9HZFFNL1hwZjFpQVgxV0pUeElhbzZYT2UxOWxuZ0dV?=
 =?utf-8?B?dXNsUC9OLzg1Q29uaEo3UWdiMDR3YXBjM0Z2RHAzc1hURnZGYkFSbmFVUjI3?=
 =?utf-8?B?WGdWUlhtTnJFRDhCcVdkTWgySEJzL2dhckdZUHMzSExLNThYYlVTbW1PcUNr?=
 =?utf-8?B?aDdtRXpQaDlZMHRFcEljZGduMXJ6QmhHKzB2M3EyRFZBbEVWWDFmd1JhVkpj?=
 =?utf-8?B?SHI5ODRWN3hoaExhRnR2VzlYM1NKQmpsOTIzSDB1QU9SV0dxeXlWaC9INW52?=
 =?utf-8?B?bEVPYnV6NFdad1dNUFBYWVdCTmNEckNNb3hFT3JUNlNHcjNJL1JoenZrUTA5?=
 =?utf-8?B?VWc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c26659-63ce-418e-573b-08dcd6150658
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 06:01:37.7061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvT4hPIPkiKmnv1N44749iJxz/nx15jLqG12fKIUga4gfJ0FkGbEeToKcjTYFwz0YNVG9NQddN/EWReMAMGf2MP4iGTcxE6nI6PxLPN6VSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10559

Hi Rob,

Thank you very much for the review!

>> +
>> +  gpio-ranges:
>> +    minItems: 2
> 
> This gets expanded to 'maxItems: 2'. Is that what you want? If not, 
> maxItems should be explicit.

Yes, 'maxItems: 2' is what I want but I can also add 'maxItems: 2' in v3 to be
explicit/more clear about it. 

>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    gpio: siul2-gpio@4009d700 {
> 
> gpio@...
> 
> Drop unused label.

I will fix in v3.

Best regards,
Andrei


