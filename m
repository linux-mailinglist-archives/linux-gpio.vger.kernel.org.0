Return-Path: <linux-gpio+bounces-9108-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C189295DD85
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 13:26:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 368771F22269
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 11:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C9315D5D9;
	Sat, 24 Aug 2024 11:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="RH+rHcQT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04olkn2016.outbound.protection.outlook.com [40.92.45.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6339A29A1;
	Sat, 24 Aug 2024 11:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.45.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724498811; cv=fail; b=Th7tnDbHWWRSHLwjpPUCIxstBan8ZnTTCkz6Qqun2lfDFL0LsjeVobMLBmqXcvxrjD4Bj49l/LiH2/Cj2qzE5EGKzb9HRsto3xIcywf7a5ifTBULC/eK41xur3kNgM0WlU9Iuf5eLJWpKk7Yzl7SgZ25ai4zO1x4+IVyHaWsh7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724498811; c=relaxed/simple;
	bh=wHEUJFZjg4xm7P75oS4RfveTTUWQWirKmHVLmjN78Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o9lfBtkxa9LbANOQJ6QkohY0XA8UJYvpIvZunf93VXTnXhDKQkfk+1CqjnGVl6PeXZjNAFXABA/7dbgQ1Vegr5NDLJmrBecCzJs31qYxuOId1hPCvE3nUfvthAURHkmM44C2cb6e5tcj5GZwlg8jvEDEOc4pRR4Uwe6J0iGauSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=RH+rHcQT; arc=fail smtp.client-ip=40.92.45.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=inOZLpNPTF3+6CsJ6w7oW+NE1sEqKL8VMXMgCkJaWrigZd+ZOy5BLZr2U5EC3DeXyom6JgSKjrYFVxRLMS5+Q7TXXSB2hLoZLHoTnguQ7oGZ/HOVpySgUCt/wXBcgbXePiy3TGewgB3wkGn/Xrn2p4ejEFVxpAbJvqaBYGqVmQB4qcLUJBMmOK3G3nQnk4lsNEtQgS5IeIa8Gs65yeLbz+vcZvtdZZrPkxsoAIZ2ONVb6fPRx08KENGaM7KJsFcWS7Z1oQRlOaDGkjR3YSucBhPOlxM1irk7Q9HsYss8iBuug1RWxiGeBkGxUFv5axZ5c54fScnS3iBDjbHdm3ibRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBLuGQyrA0UiV3q1qvXYkxmO40l1w1qrUJWVC3GFFls=;
 b=seweTF0bU7/0P0A2oChpmDkzbFuxnZU/lyT5JhHviozEDzOvsLIPHZ0NwAG31ouF4/vU9bEclCF3G/vTwvgGpAfYJQU7x7fDDhoNgCJyiXTrz2O58+t4Hg9YLY/1yJOvbpgmOMoH6szYpufMWRT71jXtyuQ305OkXxiR4xZfmFICDOKoDZcW6VrIPPyx7sJZHOGZdtPLoK7mchk4NQ5jw7jmhkM/yGhXuviqdIewVjHlNglOU03KaVGIUBTim99FrmXVWcwHp6E62n7QQEsjlqI+AsQFODM/Gas8bJIY1OWnXI315evLFbxtiHoz38pgeaBIhhCfdhk1K9zRSUy4fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBLuGQyrA0UiV3q1qvXYkxmO40l1w1qrUJWVC3GFFls=;
 b=RH+rHcQTVIezu4Z/mlXJDumRUkOaDGptTOr7qfr/KI6RhvxGSjONMNUMix6/YhIG+haDWq95dpwtAcISpbfyqzqMrUmmuel6bOhuHeoGhEM3m2JI38pw3kLD2aybDw5CkqhjcYIIH42nYRwPITKZ9v6uBLKPuv0Y4yxRqgVqxRgJfCyXT3b9WfBWLDUOEdUHin9FuDK98W1zy/1qxBM1Jp/KLc+sy0OZng4BrKG2GxAuSrLhLm9MBxnIJnuAT7IUQr8Huy1aUpdYSFGbAHX/R9jrGeaMiQhxJCL3+yxy51KrQsh30GVH65ac5x30w7lYTq6cBlysQHdBFefPa03QJQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DS7PR20MB4623.namprd20.prod.outlook.com (2603:10b6:8:76::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.23; Sat, 24 Aug 2024 11:26:47 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7897.014; Sat, 24 Aug 2024
 11:26:45 +0000
Date: Sat, 24 Aug 2024 19:25:39 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Drew Fustini <dfustini@baylibre.com>, Haylen Chu <heylenay@outlook.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/7] riscv: sophgo: Add pinctrl support for CV1800
 series SoC
Message-ID:
 <IA1PR20MB495368D784BE3F977617BF39BB892@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CACRpkdbaDW2=R881G9C=r1iW4YNdYpRZ2kHaN63T7EX1A0xVrA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbaDW2=R881G9C=r1iW4YNdYpRZ2kHaN63T7EX1A0xVrA@mail.gmail.com>
X-TMN: [kmkp2C/EmnCmC7Jcgvw1pcjR0fK7SgW9QqOiXh5ATfk=]
X-ClientProxiedBy: OSAPR01CA0263.jpnprd01.prod.outlook.com
 (2603:1096:604:29::35) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <k3xyfjzfslqae44rdsv5dfw3ybfphfzkfkv5vvmtruykxuqbnw@z2c3yqlvtsyx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DS7PR20MB4623:EE_
X-MS-Office365-Filtering-Correlation-Id: 19c4338c-d834-4167-b889-08dcc42fa2cb
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|19110799003|5072599009|15080799006|4302099013|3412199025|440099028|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	mZ4GQTeAgAJYWgPffbSILmpVEnEghBLryoiyCnFFnFso9zwbHkXwWnvkA6CDhUmfbfHT7NlFcdecSelVzB4jO0hrzIuliM8MpACauDD67AlZf6npxwxPnAIyZQ1dJ+jlwQRhyd+yYpBga1TFClPekHm4nHJJt3um8pTzqbpTbxY0w10RRsSEoVP44ezJW7ANCIbmqDT0Mw0j60qJsNhojlZqt2iePaWfHv6/d8bVnPN0ijl1z83asx0S7OyFWOeFKqCy0Dmcpy93Ds5EQjuU/i03TjnlecHqgzIEYJGvoBK8Yy2/uln2BZ34zbprZYjeKGSfu6Mh39OWxvyr+g/zJ6vgO2nAuMB06NrTd8+YMLMyNoYWBG5nRGQJ7ZO8WygZ5DZSDfhNRwjpG0ulvEjX8+WG1pIQe+dHjgVp9WuZBs8Y8tPrh4llKs2IDQnRz9ZCmdC5xZkQAsEYcZmBIGvC0PWCTR1vl3C0xMWIuJyy4OhSKV13SXbV9jJ537xXqD0bVvQJ2l0NZ2h9M14he4MhkmaD7MtlUDwDuiL00R3qycIKn6zbn7C5JeiJVdPttPvjNUva9+j8/RYc6cB4TPk7WZ4E4BPpiuiv/Yuc/Or2ZzGxwZ1HER0PFZBysbl3eDwvoDEjHCZ+ws8b6jZkSzz0FN0pK4wBwNmf8tV+zQW5Ier+XTunRC58D2wIB2AmbBEvtD4LAhgz7Ntj2jkS78w+DXEFCd/h28Ht+Lhkj6akS9FyXrVyOy6qkyq1qAaIbf2UhxtnI67Z0pC/GMBcq9e13XOxGFbNhOGzIqK3NygKX29Txt3ZJXjn3eIuzzrZIiq4lvTHkYbqYuZ3ctEpINgShjneb6D7HwbLZiQMxjNfO1o=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0JZT0pIOGZkYkxoeFBBSVlMQ3lKdmFCS08vWVN5TnZFTmZEQXhFYUxHcEd5?=
 =?utf-8?B?aTJtZ1Y5TXJjZWkwOVhiY3lmbDFidmplbXpVMWwrRGVjWGcwRWhCUFVrZ3FB?=
 =?utf-8?B?SkdSOEhId1EzWVF1R1N0WnczVzNMQWlCelFLRTdPMkpVM3NYRmFKZ2t1dE1x?=
 =?utf-8?B?dExva2JDV0J0NWZjVkpVZFNPNHFBQVdOZHhPRXI5bXE5UVJoRkRmeDdYUG9H?=
 =?utf-8?B?Y1lMTEJDT1duMURtd0ZYb2xraWNlenJWRTV3UnBBM1lpSEcvMjBZOE5uNHkr?=
 =?utf-8?B?UEJYcVAweitiSC9yTk1aVTEybmpkdnU1N2JvZXVUNVJaTTZKeURiWmZlM3lZ?=
 =?utf-8?B?dCtxMy96ajAwUjBBb2NJMVlHUUNJb3R2VGhqeTFPSDFrZm5jcVd0RTBQdFlv?=
 =?utf-8?B?T0dTaW1GTnVUcWJzRFFySnhpZDZmQjUxYVNVSjJoWTFLaG0zczRoQnA1Q2Qr?=
 =?utf-8?B?MWpseFBJOTI0ZDNpM0NFbnBBVTBQMzExc0dXekkzemxGYmk2Mi9XOW1Rd1FJ?=
 =?utf-8?B?VTJ0NWg5dVA5RkIxK1JJTW5KazBoVFczRjdmR0NjUWY5YTByUzZrbE1LVEwz?=
 =?utf-8?B?OFhnTFprT0tCQVFMUU41SkI2QmhUR0RYVXZjaEJFdFF4UW1DVHpmczZIc213?=
 =?utf-8?B?TlRVVUdpVXZnNUNia0FmSHlpRi9yRWNRYkZkSlpsZzlFRkE3SVhIZEEwdjJ6?=
 =?utf-8?B?eTByVTFRRDZFcVdNNGNNNzVyb01SNHRkbFBsdEEwakF3MWE5ejJ6U1FrSklx?=
 =?utf-8?B?RVRqQTBVWVpVY3lxRVg0R3BmRnBVMGF3bDdvZkxpeVozNUJBcHkreFErc21B?=
 =?utf-8?B?MGkzSnArZlBqcGZtajFPZEdGRWJWQ3RIQVBuNFRHekIrK3lzcFNYZldIY284?=
 =?utf-8?B?a2ZTaWNMdVZjekMyT2Jia0J1YU1xZ0g3RkgxM1NWdExNMWNqV3hDa01xRFdK?=
 =?utf-8?B?TnlFdzhPbkNSL25Qa2UrUEdIcTdzMCtJT1ErZG1zcEt2N1FDQitWcm9McTcz?=
 =?utf-8?B?Qml4czFvY0ZpS2drdFMyWithN3Jtb0FYbWNnVVpzeS9aUUtRYnJwWmFjdzVG?=
 =?utf-8?B?Z1RYYk9xMjNyYXJ6M3lQNjlRU1NDd1RwcVJnVEVXdlRUTW1MUkRmUWZSUkRt?=
 =?utf-8?B?V2xST2drdDllUlNGWnJBUDNCUXdwYXFxelNsaStPbkxKTkVKaDYxS0RJVnpq?=
 =?utf-8?B?RDJ3VWRvemk5MGVIZmNFb1JObWdtajFkSS8wTDkzVERPemx6K21nNGJIdTFX?=
 =?utf-8?B?Q1BlMlNMSmNta3VvcUVNTFJBTEVvZXNLdS90ZWFzZWlidTBCbGp5cUNJcXVm?=
 =?utf-8?B?UVpDNTdONXhOSzRxMk95SFp0YzlWenNzNW1LQkJwSE4zQVdhL0x6b0J6ejlX?=
 =?utf-8?B?ZVo1cXFONGU5Tm4yRnVwVkwxc1JmdFFJd3orRDFKaXJ6MmwxWk8rNVpaMkFj?=
 =?utf-8?B?ZExNVGdhTlJqYUw0Nnp0b1dJVTF0bDZiMnZBa2M4TXZQbldHZ2licm91S0lw?=
 =?utf-8?B?dllweGxJd01IR2dWcHdsTXhiM3ZiemU3dXBVcFdMbkJaaHhLYVliMGtXUlBY?=
 =?utf-8?B?bWxNOE1aeDhzbW0zMnVnejFIZ2JwNnZLWGhORlFJTUJCOVBTQ3BJeExJayty?=
 =?utf-8?B?VWxwcnJESmtVZVY4c0thWHZVYVdSc2JYc1J6U2FXYnVHV1gyekp1MkJ4Y0Rv?=
 =?utf-8?Q?JysRYOyPMW/GvXv/IqH8?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c4338c-d834-4167-b889-08dcc42fa2cb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2024 11:26:45.6147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR20MB4623

On Fri, Aug 23, 2024 at 05:44:17PM GMT, Linus Walleij wrote:
> On Fri, Aug 2, 2024 at 2:34 AM Inochi Amaoto <inochiama@outlook.com> wrote:
> 
> > Add basic pinctrl driver for Sophgo CV1800 series SoCs.
> > This patch series aims to replace the previous patch from Jisheng [1].
> > Since the pinctrl of cv1800 has nested mux and its pin definination
> > is discrete, it is not suitable to use "pinctrl-single" to cover the
> > pinctrl device.
> >
> > This patch require another patch [2] that provides standard attribute
> > "input-schmitt-microvolt"
> >
> > Note: As current documentation is not enough to guess the pin
> > configuration of Huashan Pi, only the pinctrl node is added.
> >
> > [1] https://lore.kernel.org/linux-riscv/20231113005702.2467-1-jszhang@kernel.org/
> > [2] https://lore.kernel.org/all/IA1PR20MB495346246245074234D337A6BBAC2@IA1PR20MB4953.namprd20.prod.outlook.com/
> >
> > Changed from v3:
> > 1. binding: drop unnecessary type
> > 2. binding: use right ref for pin node.
> > 3. binding: remove mixed spaces and tabs.
> 
> This v4 looks good to me and has necessary ACKs.
> 
> It contains device tree patches which I am icky to merge but
> I can merge the rest and give you an immutable branch in the
> pinctrl tree that the ARM SoC maintainers can pull in to
> merge the device trees, does this work for you?
> 
> Yours,
> Linus Walleij

Hi, Linus

It is OK for me, Thanks for taking it.

Regard,
Inochi

