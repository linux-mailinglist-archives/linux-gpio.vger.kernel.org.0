Return-Path: <linux-gpio+bounces-16345-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE94A3EB8B
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 04:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43BB83AA709
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 03:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B401D63F5;
	Fri, 21 Feb 2025 03:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RQzA+gtQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2083.outbound.protection.outlook.com [40.107.105.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E120C2862AC
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 03:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740110283; cv=fail; b=d9/nwacEuiKZVDbixHdWH3g8HzleWBxCYHDkxIsZlu1ctMHIJnC24Q2G81/1PNyhVIMRoOODdGS1XJ7twjg0Nw2W1Cb0a89eFJF7usrHmf0njTK+7DTlOL6PTC7OYUaZBTbaWXEGnyIW/2d/1v1a36fD0ZUC2/TZvwzyU7i+444=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740110283; c=relaxed/simple;
	bh=Ll8Zid/DtubiUT8bjLt17enEClYsQgZbdnGo9RkdCRI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KTqd2oLr1GjdG5Ijb6d6qWfOeVaYrL/GnL/oCxwSwzLORhHmZTqCoIlhpkMOjDzRzVMXXFh4CrusGuOnY+aXaDd3sZ2aK6X0/EwRheZwDuPE8cjJFRSPr5t0J7PfqHMD3nJiMZsbIUPC2xBqQ7fnJ5PHEVgIPeSjx8JVyHj7UGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RQzA+gtQ; arc=fail smtp.client-ip=40.107.105.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IpiZx049+62XhEZZcT2iBOOOY4+34Ozr4BeuM7U5YCWTz7lfzbxKyIOdK9rMQdesyikxXhTAyF/+IJlVwNYJWTVCBbFNrkzhUPQ04jsfeBGklUhCGqyV56AbJWXavU/UadVQz/1RX/35WwucsIT6xpjQDWaH2p2B3HLhUgDaPNJK077grksDi0XxXym0vUt8YEV92WY41ih1KftJ8owBRB77QlGALnCSRMdsbGqcx92oj3/xE1Ji9NfK31C+i+YggcHkdDZEF4FFGlQS/jlQFSzapussFwHzUtEPXq92y+APrKaH+83qnP7EMbgoNnY+c4MM+c5QSgWI6a4tZnUWMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ll8Zid/DtubiUT8bjLt17enEClYsQgZbdnGo9RkdCRI=;
 b=hfCP1pMKieqYEmF3eVA1k8AwtiznpZJzdxiABzxqvR1dLsTgQ+UG7+9DsZTxETzHd/DcjPuv35EuW4/p/SJwuOYnA4CeLTpvY80ZzkF9NVf5jIiNGG1hLBCAoIrcrna6SzB40RNuAeLlqHIdFxomQo3Wt89S045Zw8uBGZCLKIS5Py7n6b6oVZoG4Ohm5t0ZYRdCQaMFbhcgYD4PGmYGYuN9aA5SGrIrEIVbLDU6jWMLpKTqVP0kJemh9A93zQR7rck6ZYhcpJgG9ShFJFnJMB2j4ue+/RMU8NIumdUUzyB5SH0gO2eMXaszkLsL8tYnLNFN4pfZnf1Q/IUr9FsZDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ll8Zid/DtubiUT8bjLt17enEClYsQgZbdnGo9RkdCRI=;
 b=RQzA+gtQ0n/Hf4LxSMxfziBNsg/iGWGQUVaCl4kyQufpi4rTx0Qb4SVf6nY/NDqDuLUhyBUE3l3nQBgLd5DVh2ywNyDzJ8wwv8IlfR2XYooCbtodVuZG/Z/VugxbwPByaXRNfQxFTCJ/7qe5UeCkJsyz4gVIyKZ4FJn74712zfKRR1ZEBNhkBezh55A16kxHjAWEtn+ijAHfjouMSkC6k6qRj67l4X6k0+8g2h8FRvTx2KdXfGYK/z8bsKsWX7VCqF63zlO++54tYDdIA0YKsruevAGFlaEWeEFq2ZMf842cW0lRFbNtIYJut57e6f8FZqSFLoIv2pKFhE25JB+GTw==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by PA4PR04MB7774.eurprd04.prod.outlook.com (2603:10a6:102:cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 03:57:57 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%7]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 03:57:57 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>, Johan Korsnes
	<johan.korsnes@remarkable.no>, Bartosz Golaszewski <brgl@bgdev.pl>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] gpio: vf610: Switch to gpio-mmio
Thread-Topic: [PATCH v3 2/2] gpio: vf610: Switch to gpio-mmio
Thread-Index: AQHbgxHlamlDOGy+hkS3+3B5R316U7NRIYCg
Date: Fri, 21 Feb 2025 03:57:57 +0000
Message-ID:
 <DU0PR04MB949620686274212D9E6F074190C72@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20250219-vf610-mmio-v3-0-588b64f0b689@linaro.org>
 <20250219-vf610-mmio-v3-2-588b64f0b689@linaro.org>
In-Reply-To: <20250219-vf610-mmio-v3-2-588b64f0b689@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|PA4PR04MB7774:EE_
x-ms-office365-filtering-correlation-id: ef496b8b-b323-4aff-1594-08dd522bed2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?b01RTEt2Z3kxWlArMVNCd204eElPbm5VQUdVZDJsQUUrenJDVWF0ZnNhTUx1?=
 =?utf-8?B?eXR1Zk0xVmtQZTVweTd6VWRGNW5OeVlWVmw4YlBJMnRnVFF1a250TkErTVEr?=
 =?utf-8?B?NWFpZlgwcENKdTd0R1JkZ1E1OEFuaTlmNEhJZG0xdWUzckdKVkpRZU1wVUJo?=
 =?utf-8?B?cnozajd5OUhYdlZMTU1neEJyTW9odENkeURqMDQvbkZXbnpWZHAvSWUwN1FE?=
 =?utf-8?B?OGpTUmNDMUk5RFBadnQ0RU81THYzVWNMc2tNNlh3Y0ZWdmhZcDFZS2xoRnBV?=
 =?utf-8?B?eUM0b3YxYXVMSmRDSjhjbWhpTllvcEd1OEJadjg5Q0szc3V6UzhuZVN6ekFX?=
 =?utf-8?B?L0NqNWx1UnhPd1ljdGdNdU1BZGkwZG9GNG42TGdpMU9iNkprQnVkUVZPUHVE?=
 =?utf-8?B?QUxya2x1bUphRHdPbUhKUGYzTmVZOWtYT2ZTM3JIWVlsODcyc0ROTlVwZU1C?=
 =?utf-8?B?Qng4K3RYcndnSHFMNG9YSnZwS3dlKzcxcW5UaitvbzNnd1gvbjQ4T05XMEow?=
 =?utf-8?B?a3M5YkI5TVJqUjE5ZUd4SGptRTVzdGh3bnU2Sm5qSEpkalNIRFJ6RTZTZ2JS?=
 =?utf-8?B?Q3ErbDZrY1dNTVQ1bHJ6MXFYN3ozd3UvdmI2SFJueXZCMm9pYVVUZ1BUc05x?=
 =?utf-8?B?My9KMzlMakVwVm05VkQzMEZQSFg3ck93U2VnbUw5ODVoUkRkcjBHcTJwVGtW?=
 =?utf-8?B?OTBmWHJOLzJpWlpGMXd6MkdyUkxDaXE4WDIrSkw5WXZDeFN4SWw3K09wRDg3?=
 =?utf-8?B?clpvdTJPRTNCb0w1YVlrampKK1lSNStwdU5vNmtWdVB4VjZBcE9CV2l3MTZt?=
 =?utf-8?B?aUN0WFdWa2tEcmhtcmlUQVFmWG9Ma0lyaE1SQXhpaFJtOUFiSnZyMjNZMFA5?=
 =?utf-8?B?UVZsekdNRVNvU0k0ODhwcVJPUXhaY0xPc3F2UmhTNGwxMkVLMlJaOFlBK2ZX?=
 =?utf-8?B?OE9jWEJkVGxQRFlOUVBSUFJ2cU1seTd4MGFpbGxtS2dmS0swU0daSW9aSmtU?=
 =?utf-8?B?WHlpYzk5bWlsTlIyUU9wbld6WCtvYkNheUN4dzB0RXg2R00xRzNrdlhZTVQy?=
 =?utf-8?B?TlhPSlc5a1QxY0dPOUIzS2lKWEpqWTdjKzJydUt4RWNGZGllTzd6SU9QYWVQ?=
 =?utf-8?B?UWhJSlVxdXo3d25BOVFtc0hrRFFBU2ZPdEo3ajdUbVJHNHlCSENDbHUvNVRW?=
 =?utf-8?B?ejZzZWRJbW4zb1N1Y1pjWllnUGlXQlkvamcwNDJZSDNtVnUxQkxRdU5aUkhL?=
 =?utf-8?B?K0RxdUxyRFp4VE9TdjkwV3BpUitjamhiTUNKLzlVVmRDNHRjZitoQlRQOVlR?=
 =?utf-8?B?SGw5L3VYVitxK2pMZDBwaUdzMjdybytGWkM5cjdFRWJ0dXUyUTYzeGgxRm4z?=
 =?utf-8?B?NnRCS1VqTS9GWWFVTnhYNGdWNzRTRXJKWjNURTZ6K1NQdjQ4S1RJbEVVYkho?=
 =?utf-8?B?dU9nOE9YVW5aQURaMDVxTTRVQmFIeGlHNFhKT0l2S1VoODZ3K2R1Z3dXWmtr?=
 =?utf-8?B?MElHeXlPS0Z5cG5oMkVFNzJld2NRaFU3UGRRMzlrM2JTTGJSQkRqRC8vYkdo?=
 =?utf-8?B?S2VNY3YycTJmZUxUd0V2OWZpMUdTQis5OTdiWDU0ZTlITDR4Vk9FQ2p0T08w?=
 =?utf-8?B?aGRyRTZjU2NMb2RIT0hzU0s4RU1lRmJKZy9DSzlNaERtSTM3V2lvaDEzY3Vj?=
 =?utf-8?B?ZWdlZXRtWkNubkVsNTZxM3llSnVDN09ZNCtRVFpqMlZZd1NrZTVYSmtjL282?=
 =?utf-8?B?M05LckxkaTNPZGxnS0paSkVRSTBCWXgxZ240bjhWQ2l6VTU4SG1mdjVhcXFT?=
 =?utf-8?B?TlhyYjJHK0VCNTVmaEFFRlNjM095VXkrNmE2SWlNVHcxK25HWGVUQ0gzSnIr?=
 =?utf-8?B?Y3FUenM3WFBtWG9MUFczaGVNblBKOVd3aTEwM054dmlac3JNSm9jckZjdnZq?=
 =?utf-8?Q?pv/X+tNp1UXuz1H0K3YVVvDLswnKD2y4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MDRjUENnQ3hvNDNJRDhldWl6MkNKdDJsZ2JzcENjWEVROFJLUElKSEw4N2tY?=
 =?utf-8?B?RHdTWTBjZUEzZk9SdXE2K0ZaV1VMZWt0aEhGTE4rUFFrcENmcWoycTdyWm9w?=
 =?utf-8?B?VVpDUWppQkF1ZGw5ZzV4ZUhvSTVubU16T2RDUzYycVZXekd6bzRJRU43S0g0?=
 =?utf-8?B?M2ErWFZEVU91cy80NW0wQkVreVlQQTFLUzFueVJJZElyK1FoS3hCWFlRSjIy?=
 =?utf-8?B?NjR1NXY5M3g1TXQ1Z1pNOWZkUTdVVnUreVJHdENlYUhTWTVQbytRbTVqaE1u?=
 =?utf-8?B?Yk5aeG0wM3c5aUxJNURQTG5RTVhQcW5VNzUydFA2NHNPS2VCNlRMaFZtZDdj?=
 =?utf-8?B?eDRHRGFjNzA5V2prRmZnSXZ4ZTlFVWcwSS9VSGpSc3AwQ3NsTkVhWGRWaG9V?=
 =?utf-8?B?U3RoYnliVWE4ZzhDamVpN1hNcWdVL2trQi9RakxIQmlxc0J4N0w4VHJuU0h2?=
 =?utf-8?B?Y1V3amduc2w3Vm13ZmdlclVSMFRVY3VlQ01PTG94TUpXb3A2bTYvWThJZkpX?=
 =?utf-8?B?aHY2djBIWjMweXdSNWdlQXlud2tCaHR3eW5wZEd5ZGhnOUJQZ2JVYkhrcXlE?=
 =?utf-8?B?MEljY2E4dEdZOFh4a1YyOWw1dGJqWG1NRE9xMjBGY01icElqWWl0dXhVM1Ji?=
 =?utf-8?B?RGk4eEkyLythZVBiNTBQa256YlQ1V3hYZDl4Rkk1bzgzVkU1ZUVoakt6ZXd6?=
 =?utf-8?B?ME5ZVE9ESEp1eGd5aUNuVm1Rd0RCWjhuWi82WEVCaXhWbUtUcFhTR1BWU3Vq?=
 =?utf-8?B?cUVCOXJjVlZsVGl4NVFUSVNDK0tTNkhBakJJMndNYzN2Z2ZZT1dVK1N4VmVx?=
 =?utf-8?B?ekJXZHdlWXFpcVgrL2FDTXgzaERjMC93QkVlNXNGMDFrT2tzQUtndWNPZDV5?=
 =?utf-8?B?a3N1OXZocmFxK01ua0tuME9ZREltYk1HSjE1Vm50eW9xaFcrOFcwejg3UzVt?=
 =?utf-8?B?Zk5uOUJ6Q1pNMzBIRVBpR3o1bmZlUlFUOEs1d09reFFNM0hoK1BTcFVZZGhG?=
 =?utf-8?B?N21uVGRpR0o2Um5uaHFlTU8vaUtaczIwZlRCTmd2eTZNYlRUZFlBQlBUMFA4?=
 =?utf-8?B?TEpkV3plSlR3bGFIejRkMmp6dnEzNUpKcVRXbHFPdVBnLzNyOWlPdEpjZmJZ?=
 =?utf-8?B?eE5HOTM0a2VyMHd3ZFhIclB6OHBYNzNxNlcvd1BYb3ZxenV4S2plWm5JVFRP?=
 =?utf-8?B?SC9VOU9Ib3EzR0xxVkRsL3Q4ZzNJREhqb2kvU00vcVZxbVFKZU5YWmVUbURh?=
 =?utf-8?B?b1h2YlNFN2RWOUJheUJkMWNvYys4NUxab2d6ZzZKcWh3b2FWcmNGTXRXMDhH?=
 =?utf-8?B?dmwvZCtpZ2ZTYUF1K05oUE1pRUQwb1BRclJOYVdvd0E0QXMrYW9seG94UEpy?=
 =?utf-8?B?OGVOdXFNUnlKMlpDeXZRa0IxUlVTRjl6ay9VaGlHellHQXNaNW0rSGQ0RDFu?=
 =?utf-8?B?QjJhaWNiMW9rRHdaVXlHYnFrWEZXNnFWVnAwU3ZZODFvUm40RjFUSkVuZ0F3?=
 =?utf-8?B?bXk2czJKemY5aTZTOXJxeWxzbHFzallTdHNmVTRiSk4zUjdJTE10eThReXNN?=
 =?utf-8?B?Zys2aVhYcG9SZlNFcXJCdkFZOHlQYndmOHBKd0ozdnR5U1JrcmhsQk9uTHFa?=
 =?utf-8?B?Qk4wQVMvNEJXVVM2KzRrakd5cncvSHZLdGRFaFBXL1VpZ2Nhc1JGSXI5Z2N6?=
 =?utf-8?B?OW5TYjdBeGNpTngvcmp6d3hib3I5NnRJa1JWMDdFYmphUVRnTEhaTlJ6Z21a?=
 =?utf-8?B?OEtiQnQvbWNycU43d1dRVUU4aE4reHF4d0xYbEhDNjU3MmMxOHhTUkFLRjV6?=
 =?utf-8?B?c1FXeWg4TUhwOFpRSkFzM3hHSUV3UEtlQlhpNHBVVlFBN3dMcUs4MCtaMkNY?=
 =?utf-8?B?UFlzeThldkJIcllaNHZHVEFtVXdJM0hKb3c5djNvdDRJL1E3U1F4YXNWTjhS?=
 =?utf-8?B?QXBhaXg2SFRXajF1eStWWlptTDRyVlQ2Ym5qb3haTzhGcjYwZzVVeWtydlpX?=
 =?utf-8?B?ZFBGbXpmUDJuck5jazlNQWlDYnBINzNBam1YZytkYi9uaTdPVWdRYnFDdEJ5?=
 =?utf-8?B?alpINzhNZmhHSzdZenEyc1NUUFlGdVlYZTJ5cGx3LytuY3FROTJzbGc5a1hm?=
 =?utf-8?Q?Wizk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef496b8b-b323-4aff-1594-08dd522bed2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 03:57:57.2113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A/yVm1uXJzEqjcfxR1d+OZskmu++MGbpIGquZDhnadcgyoXplcedGOl6XgDLsMQslk9IfdOLtVNwixND0rEtBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7774

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+DQo+IFNlbnQ6IDIwMjXlubQy5pyIMjDml6UgNTowNQ0KPiBU
bzogSm9oYW4gS29yc25lcyA8am9oYW4ua29yc25lc0ByZW1hcmthYmxlLm5vPjsgQm91Z2ggQ2hl
bg0KPiA8aGFpYm8uY2hlbkBueHAuY29tPjsgQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rl
di5wbD47DQo+IGlteEBsaXN0cy5saW51eC5kZXYNCj4gQ2M6IGxpbnV4LWdwaW9Admdlci5rZXJu
ZWwub3JnOyBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+DQo+IFN1Ympl
Y3Q6IFtQQVRDSCB2MyAyLzJdIGdwaW86IHZmNjEwOiBTd2l0Y2ggdG8gZ3Bpby1tbWlvDQo+IA0K
PiBBZnRlciBhZGRpbmcgYSBwaW5jdHJsIGZsYWcgdG8gZ3Bpby1tbWlvIHdlIGNhbiB1c2UgaXQg
Zm9yIGRyaXZpbmcgZ3Bpby12ZjYxMC4NCj4gDQo+IFRoZSBleGlzdGluZyBjb2RlIGhhcyB0aGUg
c2FtZSBzZW1hbnRpY3MgYW5kIHRoZSBnZW5lcmljIGdwaW8tbW1pbywgaW5jbHVkaW5nDQo+IHJl
YWRpbmcgZnJvbSB0aGUgZGF0YSBvdXQgcmVnaXN0ZXIgd2hlbiB0aGUgZGlyZWN0aW9uIGlzIHNl
dCB0byBpbnB1dCwgYW5kIGl0IGNhbg0KPiBhbHNvIGhhbmRsZSB0aGUgYWJzZW5jZSBvZiB0aGUg
ZGlyZWN0aW9uIHJlZ2lzdGVyIGJldHRlciB0aGFuIHRoZSBjdXJyZW50IGRyaXZlcjoNCj4gd2Ug
Z2V0IHRoZSBkaXJlY3Rpb24gZnJvbSB0aGUgc2hhZG93IGRpcmVjdGlvbiByZWdpc3RlcnMgaW4g
Z3Bpby1tbWlvIGluc3RlYWQuDQo+IA0KPiBTaW5jZSBncGlvLW1taW8gaGFzIGFuIGludGVybmFs
IHNwaW5sb2NrIHdlIGNhbiBkcm9wIHRoZSBkaXJlY3Rpb24tcHJvdGVjdGluZw0KPiBzcGlubG9j
ayBmcm9tIHRoZSBkcml2ZXIuDQo+IA0KDQpJIHRlc3Qgb24gaW14OHVscC1ldmsgYW5kIGlteDk0
My1ldmsgYm9hcmQsIGdwaW8gd29ya3MgZmluZS4gR1BJTyBpbnRlcnJ1cHQgYWxzbyB3b3JrcyB3
ZWxsLg0KDQpSZXZpZXdlZC1hbmQtdGVzdGVkLWJ5OiBIYWlibyBDaGVuIDxoYWliby5jaGVuQG54
cC5jb20+DQoNClJlZ2FyZHMNCkhhaWJvIENoZW4NCj4gU2lnbmVkLW9mZi1ieTogTGludXMgV2Fs
bGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gQ2hhbmdlTG9nIHYyLT52
MzoNCj4gLSBVc2UgdGhlIHBvcnQtPmdwaW9fYmFzZSBmb3IgYWNjZXNzaW5nIEdQSU8gcmVnaXN0
ZXJzLg0KPiAtIFNwZWNpZnkgb25seSBHUE9SIGZvciBzZXR0aW5nL2NsZWFyaW5nL3JlYWRpbmcg
dGhlDQo+ICAgb3V0cHV0LCBob3BpbmcgYSBSTVcgb24gdGhhdCByZWdpc3RlciB3b3JrcyB3aXRo
IE1NSU8uDQo+IENoYW5nZUxvZyB2MS0+djI6DQo+IC0gVXNlIHRoZSBkdWFsIGlucHV0L291dHB1
dCBzZXQvY2xlYXIgcmVnaXN0ZXJzIGZvciBvdXRwdXQuDQo+IC0gUHJvdmlkZSB0aGUgQkdQSU9G
X1JFQURfT1VUUFVUX1JFR19TRVQgZmxhZyBzbyB0aGUgZHJpdmVyDQo+ICAgYmVoYXZlcyBhcyBk
ZXNjcmliZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLi4uDQo+IC0gRHJvcCB0aGUgbm93IHVudXNl
ZCBzcGlubG9jayAoZ3Bpby1tbWlvIGhhcyBpdHMgb3duKS4NCj4gLS0tDQo+ICBkcml2ZXJzL2dw
aW8vS2NvbmZpZyAgICAgIHwgICAxICsNCj4gIGRyaXZlcnMvZ3Bpby9ncGlvLXZmNjEwLmMgfCAx
MDUgKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA4OCBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vS2NvbmZpZyBiL2RyaXZlcnMvZ3Bpby9LY29uZmlnIGlu
ZGV4DQo+IGFkZDVhZDI5YTY3M2MwOTA4MmE5MTNjYjI0MDQwNzNiMjAzNGFmNDguLmFiMTA0Y2U4
NWVlNmNlZjE1NDlkMzE3NA0KPiA0NjI1YmNjNjI1ZDc1MTc5IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwaW8vS2NvbmZpZw0KPiArKysgYi9kcml2ZXJzL2dwaW8vS2NvbmZpZw0KPiBAQCAtNzU2
LDYgKzc1Niw3IEBAIGNvbmZpZyBHUElPX1ZGNjEwDQo+ICAJZGVmYXVsdCB5IGlmIFNPQ19WRjYx
MA0KPiAgCWRlcGVuZHMgb24gQVJDSF9NWEMgfHwgQ09NUElMRV9URVNUDQo+ICAJc2VsZWN0IEdQ
SU9MSUJfSVJRQ0hJUA0KPiArCXNlbGVjdCBHUElPX0dFTkVSSUMNCj4gIAloZWxwDQo+ICAJICBT
YXkgeWVzIGhlcmUgdG8gc3VwcG9ydCBpLk1YIG9yIFZ5YnJpZCB2ZjYxMCBHUElPcy4NCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vZ3Bpby12ZjYxMC5jIGIvZHJpdmVycy9ncGlvL2dw
aW8tdmY2MTAuYyBpbmRleA0KPiBjMzZhOWRiY2NkNGRkNTQxNWVkM2I5MGI4N2FmYjQ3ZTc2MzRj
MDI1Li40ZGFkN2NlMGM0ZGM2YTNmNDEyMDgxYzcNCj4gNTAyYzBjZTZkZDU3NDBkYSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncGlvL2dwaW8tdmY2MTAuYw0KPiArKysgYi9kcml2ZXJzL2dwaW8v
Z3Bpby12ZjYxMC5jDQo+IEBAIC0zNiw3ICszNiw2IEBAIHN0cnVjdCB2ZjYxMF9ncGlvX3BvcnQg
ew0KPiAgCXN0cnVjdCBjbGsgKmNsa19wb3J0Ow0KPiAgCXN0cnVjdCBjbGsgKmNsa19ncGlvOw0K
PiAgCWludCBpcnE7DQo+IC0Jc3BpbmxvY2tfdCBsb2NrOyAvKiBwcm90ZWN0IGdwaW8gZGlyZWN0
aW9uIHJlZ2lzdGVycyAqLw0KPiAgfTsNCj4gDQo+ICAjZGVmaW5lIEdQSU9fUERPUgkJMHgwMA0K
PiBAQCAtOTQsNzggKzkzLDYgQEAgc3RhdGljIGlubGluZSB1MzIgdmY2MTBfZ3Bpb19yZWFkbCh2
b2lkIF9faW9tZW0gKnJlZykNCj4gIAlyZXR1cm4gcmVhZGxfcmVsYXhlZChyZWcpOw0KPiAgfQ0K
PiANCj4gLXN0YXRpYyBpbnQgdmY2MTBfZ3Bpb19nZXQoc3RydWN0IGdwaW9fY2hpcCAqZ2MsIHVu
c2lnbmVkIGludCBncGlvKSAtew0KPiAtCXN0cnVjdCB2ZjYxMF9ncGlvX3BvcnQgKnBvcnQgPSBn
cGlvY2hpcF9nZXRfZGF0YShnYyk7DQo+IC0JdTMyIG1hc2sgPSBCSVQoZ3Bpbyk7DQo+IC0JdW5z
aWduZWQgbG9uZyBvZmZzZXQgPSBHUElPX1BESVI7DQo+IC0NCj4gLQlpZiAocG9ydC0+c2RhdGEt
PmhhdmVfcGFkZHIpIHsNCj4gLQkJbWFzayAmPSB2ZjYxMF9ncGlvX3JlYWRsKHBvcnQtPmdwaW9f
YmFzZSArIEdQSU9fUEREUik7DQo+IC0JCWlmIChtYXNrKQ0KPiAtCQkJb2Zmc2V0ID0gR1BJT19Q
RE9SOw0KPiAtCX0NCj4gLQ0KPiAtCXJldHVybiAhISh2ZjYxMF9ncGlvX3JlYWRsKHBvcnQtPmdw
aW9fYmFzZSArIG9mZnNldCkgJiBCSVQoZ3BpbykpOw0KPiAtfQ0KPiAtDQo+IC1zdGF0aWMgdm9p
ZCB2ZjYxMF9ncGlvX3NldChzdHJ1Y3QgZ3Bpb19jaGlwICpnYywgdW5zaWduZWQgaW50IGdwaW8s
IGludCB2YWwpIC17DQo+IC0Jc3RydWN0IHZmNjEwX2dwaW9fcG9ydCAqcG9ydCA9IGdwaW9jaGlw
X2dldF9kYXRhKGdjKTsNCj4gLQl1MzIgbWFzayA9IEJJVChncGlvKTsNCj4gLQl1bnNpZ25lZCBs
b25nIG9mZnNldCA9IHZhbCA/IEdQSU9fUFNPUiA6IEdQSU9fUENPUjsNCj4gLQ0KPiAtCXZmNjEw
X2dwaW9fd3JpdGVsKG1hc2ssIHBvcnQtPmdwaW9fYmFzZSArIG9mZnNldCk7DQo+IC19DQo+IC0N
Cj4gLXN0YXRpYyBpbnQgdmY2MTBfZ3Bpb19kaXJlY3Rpb25faW5wdXQoc3RydWN0IGdwaW9fY2hp
cCAqY2hpcCwgdW5zaWduZWQgaW50IGdwaW8pDQo+IC17DQo+IC0Jc3RydWN0IHZmNjEwX2dwaW9f
cG9ydCAqcG9ydCA9IGdwaW9jaGlwX2dldF9kYXRhKGNoaXApOw0KPiAtCXUzMiBtYXNrID0gQklU
KGdwaW8pOw0KPiAtCXUzMiB2YWw7DQo+IC0NCj4gLQlpZiAocG9ydC0+c2RhdGEtPmhhdmVfcGFk
ZHIpIHsNCj4gLQkJZ3VhcmQoc3BpbmxvY2tfaXJxc2F2ZSkoJnBvcnQtPmxvY2spOw0KPiAtCQl2
YWwgPSB2ZjYxMF9ncGlvX3JlYWRsKHBvcnQtPmdwaW9fYmFzZSArIEdQSU9fUEREUik7DQo+IC0J
CXZhbCAmPSB+bWFzazsNCj4gLQkJdmY2MTBfZ3Bpb193cml0ZWwodmFsLCBwb3J0LT5ncGlvX2Jh
c2UgKyBHUElPX1BERFIpOw0KPiAtCX0NCj4gLQ0KPiAtCXJldHVybiBwaW5jdHJsX2dwaW9fZGly
ZWN0aW9uX2lucHV0KGNoaXAsIGdwaW8pOw0KPiAtfQ0KPiAtDQo+IC1zdGF0aWMgaW50IHZmNjEw
X2dwaW9fZGlyZWN0aW9uX291dHB1dChzdHJ1Y3QgZ3Bpb19jaGlwICpjaGlwLCB1bnNpZ25lZCBp
bnQNCj4gZ3BpbywNCj4gLQkJCQkgICAgICAgaW50IHZhbHVlKQ0KPiAtew0KPiAtCXN0cnVjdCB2
ZjYxMF9ncGlvX3BvcnQgKnBvcnQgPSBncGlvY2hpcF9nZXRfZGF0YShjaGlwKTsNCj4gLQl1MzIg
bWFzayA9IEJJVChncGlvKTsNCj4gLQl1MzIgdmFsOw0KPiAtDQo+IC0JdmY2MTBfZ3Bpb19zZXQo
Y2hpcCwgZ3BpbywgdmFsdWUpOw0KPiAtDQo+IC0JaWYgKHBvcnQtPnNkYXRhLT5oYXZlX3BhZGRy
KSB7DQo+IC0JCWd1YXJkKHNwaW5sb2NrX2lycXNhdmUpKCZwb3J0LT5sb2NrKTsNCj4gLQkJdmFs
ID0gdmY2MTBfZ3Bpb19yZWFkbChwb3J0LT5ncGlvX2Jhc2UgKyBHUElPX1BERFIpOw0KPiAtCQl2
YWwgfD0gbWFzazsNCj4gLQkJdmY2MTBfZ3Bpb193cml0ZWwodmFsLCBwb3J0LT5ncGlvX2Jhc2Ug
KyBHUElPX1BERFIpOw0KPiAtCX0NCj4gLQ0KPiAtCXJldHVybiBwaW5jdHJsX2dwaW9fZGlyZWN0
aW9uX291dHB1dChjaGlwLCBncGlvKTsNCj4gLX0NCj4gLQ0KPiAtc3RhdGljIGludCB2ZjYxMF9n
cGlvX2dldF9kaXJlY3Rpb24oc3RydWN0IGdwaW9fY2hpcCAqZ2MsIHVuc2lnbmVkIGludCBncGlv
KSAtew0KPiAtCXN0cnVjdCB2ZjYxMF9ncGlvX3BvcnQgKnBvcnQgPSBncGlvY2hpcF9nZXRfZGF0
YShnYyk7DQo+IC0JdTMyIG1hc2sgPSBCSVQoZ3Bpbyk7DQo+IC0NCj4gLQltYXNrICY9IHZmNjEw
X2dwaW9fcmVhZGwocG9ydC0+Z3Bpb19iYXNlICsgR1BJT19QRERSKTsNCj4gLQ0KPiAtCWlmICht
YXNrKQ0KPiAtCQlyZXR1cm4gR1BJT19MSU5FX0RJUkVDVElPTl9PVVQ7DQo+IC0NCj4gLQlyZXR1
cm4gR1BJT19MSU5FX0RJUkVDVElPTl9JTjsNCj4gLX0NCj4gLQ0KPiAgc3RhdGljIHZvaWQgdmY2
MTBfZ3Bpb19pcnFfaGFuZGxlcihzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MpICB7DQo+ICAJc3RydWN0
IHZmNjEwX2dwaW9fcG9ydCAqcG9ydCA9DQo+IEBAIC0yOTEsNiArMjE4LDcgQEAgc3RhdGljIGlu
dCB2ZjYxMF9ncGlvX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ICAJ
c3RydWN0IHZmNjEwX2dwaW9fcG9ydCAqcG9ydDsNCj4gIAlzdHJ1Y3QgZ3Bpb19jaGlwICpnYzsN
Cj4gIAlzdHJ1Y3QgZ3Bpb19pcnFfY2hpcCAqZ2lycTsNCj4gKwl1bnNpZ25lZCBsb25nIGZsYWdz
Ow0KPiAgCWludCBpOw0KPiAgCWludCByZXQ7DQo+ICAJYm9vbCBkdWFsX2Jhc2U7DQo+IEBAIC0z
MDAsNyArMjI4LDYgQEAgc3RhdGljIGludCB2ZjYxMF9ncGlvX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UNCj4gKnBkZXYpDQo+ICAJCXJldHVybiAtRU5PTUVNOw0KPiANCj4gIAlwb3J0LT5z
ZGF0YSA9IGRldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOw0KPiAtCXNwaW5fbG9ja19pbml0KCZw
b3J0LT5sb2NrKTsNCj4gDQo+ICAJZHVhbF9iYXNlID0gcG9ydC0+c2RhdGEtPmhhdmVfZHVhbF9i
YXNlOw0KPiANCj4gQEAgLTM2NywyMyArMjk0LDI1IEBAIHN0YXRpYyBpbnQgdmY2MTBfZ3Bpb19w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ICpwZGV2KQ0KPiAgCX0NCj4gDQo+ICAJZ2Mg
PSAmcG9ydC0+Z2M7DQo+IC0JZ2MtPnBhcmVudCA9IGRldjsNCj4gLQlnYy0+bGFiZWwgPSBkZXZf
bmFtZShkZXYpOw0KPiAtCWdjLT5uZ3BpbyA9IFZGNjEwX0dQSU9fUEVSX1BPUlQ7DQo+IC0JZ2Mt
PmJhc2UgPSAtMTsNCj4gLQ0KPiAtCWdjLT5yZXF1ZXN0ID0gZ3Bpb2NoaXBfZ2VuZXJpY19yZXF1
ZXN0Ow0KPiAtCWdjLT5mcmVlID0gZ3Bpb2NoaXBfZ2VuZXJpY19mcmVlOw0KPiAtCWdjLT5kaXJl
Y3Rpb25faW5wdXQgPSB2ZjYxMF9ncGlvX2RpcmVjdGlvbl9pbnB1dDsNCj4gLQlnYy0+Z2V0ID0g
dmY2MTBfZ3Bpb19nZXQ7DQo+IC0JZ2MtPmRpcmVjdGlvbl9vdXRwdXQgPSB2ZjYxMF9ncGlvX2Rp
cmVjdGlvbl9vdXRwdXQ7DQo+IC0JZ2MtPnNldCA9IHZmNjEwX2dwaW9fc2V0Ow0KPiArCWZsYWdz
ID0gQkdQSU9GX1BJTkNUUkxfQkFDS0VORDsNCj4gIAkvKg0KPiAtCSAqIG9ubHkgSVAgaGFzIFBv
cnQgRGF0YSBEaXJlY3Rpb24gUmVnaXN0ZXIoUEREUikgY2FuDQo+IC0JICogc3VwcG9ydCBnZXQg
ZGlyZWN0aW9uDQo+ICsJICogV2Ugb25seSByZWFkIHRoZSBvdXRwdXQgcmVnaXN0ZXIgZm9yIGN1
cnJlbnQgdmFsdWUgb24gb3V0cHV0DQo+ICsJICogbGluZXMgaWYgdGhlIGRpcmVjdGlvbiByZWdp
c3RlciBpcyBhdmFpbGFibGUgc28gd2UgY2FuIHN3aXRjaA0KPiArCSAqIGRpcmVjdGlvbi4NCj4g
IAkgKi8NCj4gIAlpZiAocG9ydC0+c2RhdGEtPmhhdmVfcGFkZHIpDQo+IC0JCWdjLT5nZXRfZGly
ZWN0aW9uID0gdmY2MTBfZ3Bpb19nZXRfZGlyZWN0aW9uOw0KPiArCQlmbGFncyB8PSBCR1BJT0Zf
UkVBRF9PVVRQVVRfUkVHX1NFVDsNCj4gKwlyZXQgPSBiZ3Bpb19pbml0KGdjLCBkZXYsIDQsDQo+
ICsJCQkgcG9ydC0+Z3Bpb19iYXNlICsgR1BJT19QRElSLA0KPiArCQkJIHBvcnQtPmdwaW9fYmFz
ZSArIEdQSU9fUERPUiwNCj4gKwkJCSBOVUxMLA0KPiArCQkJIHBvcnQtPnNkYXRhLT5oYXZlX3Bh
ZGRyID8gcG9ydC0+Z3Bpb19iYXNlICsgR1BJT19QRERSIDoNCj4gTlVMTCwNCj4gKwkJCSBOVUxM
LA0KPiArCQkJIGZsYWdzKTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9i
ZShkZXYsIHJldCwgInVuYWJsZSB0byBpbml0IGdlbmVyaWMgR1BJT1xuIik7DQo+ICsJZ2MtPmxh
YmVsID0gZGV2X25hbWUoZGV2KTsNCj4gKwlnYy0+YmFzZSA9IC0xOw0KPiANCj4gIAkvKiBNYXNr
IGFsbCBHUElPIGludGVycnVwdHMgKi8NCj4gIAlmb3IgKGkgPSAwOyBpIDwgZ2MtPm5ncGlvOyBp
KyspDQo+IA0KPiAtLQ0KPiAyLjQ4LjENCg0K

