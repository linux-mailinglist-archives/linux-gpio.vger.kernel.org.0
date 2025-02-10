Return-Path: <linux-gpio+bounces-15662-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B277A2F354
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 17:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98C6B3A6964
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 16:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB3A1F460C;
	Mon, 10 Feb 2025 16:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="bqL8YUfV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-CY1-obe.outbound.protection.office365.us (mail-cy1usg02on0064.outbound.protection.office365.us [23.103.209.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5542580E9
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 16:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.209.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204616; cv=fail; b=ee+A3ZNByTEfy7J+WTGhwO9YSaTHaZuV1si8Z9iGwLVUCQHxxfleP9WDVEWfFK/ZKG15ujy8MxTFVO7i6cWsjI/BXlIkmbezHA+hNj8/S5BQB7DisUDGL03bT+bV3jilQbTqRbezKMQdhYB+9kbm9yWp+AH8gQ8wj9rcCS7Pg+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204616; c=relaxed/simple;
	bh=KGurn+9wFtUDOhXJTsHL5XwNCWlN4/S0iSyQoovnnX0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i/bKmqAjb7Fu9PbQPyfRU0pnmTu2RJ2nAFhHtzbXmp4maKEM3OI4LhiVPVRYnpYHmcMjNxzift+bPBd7+zAQozW0q5YAxUSvPG+DMUihvO5CK2ai9jvv3P4cI8LbecWQgzbdQrlu7d4i1cWnunNjYXLRFbxlOxPuBsEwdSuGxEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=bqL8YUfV; arc=fail smtp.client-ip=23.103.209.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=Fy0uCyYxqmPLBCU+E7i771b4KqeyTW3AfC82P0tnm2Kz+0/Cb9S5XAtjLLhoryU8lwbpTBe1O0l9UouBpcVMEeYgfKerPWBRpamzciZy7XATz5hS6aQVNEr1HwhQnAj0+g77hS6GvLkRmGJTPdb441eiIGeUN7GfhnUfDsMjL1xu93RaSpt5Wxcxro48Oq4YshbXY8geqLpB1L6q7LL7QXcX47E0dNGZlIFl0nI0o+ABTnPVwwpHtJrigLdyMHcdx3ENKOtGnDPolVMKgbHByZwe1MDZxSrrRJ4uLLHK8DW0xPI4F70TZ4rJ2pZ4TNooRsS5gzxOeMwEt4vO2b6maw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGurn+9wFtUDOhXJTsHL5XwNCWlN4/S0iSyQoovnnX0=;
 b=Yh+bYyVzR/QL64epXDL+sPSk7lmWKz9thD2qWjfvvjawAhgCLENz5yuWCbQWUU2SbofOfXvls/XDhP22dcSujnfavFnv9ojFlFGXciZpQo/N67vpF69LIFaHXe/S5xG7e/VssNFc0kGcqt+lHfy2tmk/prK49H+aBREiqFQ0eXcquJwPT8XBtWef6fvPXkBPtOftYJ50N6rv972kN7FT1SfQWE4ZlHPA+xSDv2wpmgkgokZ6uMMKqKtWRx+uRaA1dZEzXbbQrV78eQ0QtrBqKCGH6uY7QMRu+fafZpa328M7Kjg5zLvBWqZ7XZSFcL1OyGTQUd/fQ958e6p0Bn6M4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGurn+9wFtUDOhXJTsHL5XwNCWlN4/S0iSyQoovnnX0=;
 b=bqL8YUfVkS0P3LFqWh+atEHBRg3c5LsZHXTY3eBJ918sHLjpEYyb/ZVCHWgk51xay4eK6OG2HUjpLq0pORV6p3hXJsOK4wREIXVGiNWvhzhDbaHt6DiZE6rYQU53gZHmkTa2+FOd2wHUGiQZCaTsEi+ClfXlTV2696PGUB2ZX2ShNbXcw5NdijY9plMvT23bD1Lrrht859Sq534ugCFc+SVkXRgL26CcoLjzCpIBJgpGJFQiquuVRQygEiLTzfOBxAEBgMVFrDdj8/DsO/dGYbFL6RoVHGn6Ek3XWED9ScGP/OOuJBjdzIJHqT+dkj/onxt3S6yfu0AHQTjYe8AKHw==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1185.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 13:48:38 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 13:48:38 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>, Erik Schilling
	<erik.schilling@linaro.org>, Phil Howard <phil@gadgetoid.com>, Viresh Kumar
	<viresh.kumar@linaro.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [External] - [PATCH libgpiod v3 16/16] doc: move README contents
 to sphinx docs
Thread-Topic: [External] - [PATCH libgpiod v3 16/16] doc: move README contents
 to sphinx docs
Thread-Index: AQHbeJHOIgNeMIamak2Xg4KfZAxSRbNAkmhg
Date: Mon, 10 Feb 2025 13:48:38 +0000
Message-ID:
 <PH1P110MB16030B941AA3BAB6DBB008AF9FF2A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
 <20250206-improve-docs-v3-16-2065191fff6f@linaro.org>
In-Reply-To: <20250206-improve-docs-v3-16-2065191fff6f@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1185:EE_
x-ms-office365-filtering-correlation-id: 931d72cb-2b3d-4d2e-761f-08dd49d99f13
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|41320700013|1800799024|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cUZxNGpNZ3JlTWhKTVhldzhmaXR5SGRLTXNGZDZHb1NuOVVJWEhxUDB5all1?=
 =?utf-8?B?bmpneVVVUHI4dkdHZ2U4cVFPTDFMMUFNVngzZERLTUZpVVRreW1HRWdEekFZ?=
 =?utf-8?B?cFdxaHZzMXA2TDl2bWlyQ2FpSnhwVytFaXhJbDZhcFQ0eVFLS0FSWTRVM0x4?=
 =?utf-8?B?Q0UydTJ1eG8xWlk1TGE2ZGdEc2FBUmVlUms1amJnVEVISFN1YUkyWnV4VlNB?=
 =?utf-8?B?NXVFajNvWXdDU0pGMWZJN25PNGlQQ2I5NytjMlYzQmZhcWgxWFlDT2VsV3ll?=
 =?utf-8?B?MnNBaHhaMGhISm5ZckM4ZUx5Z2ZDL1I1ZlVCVE1ONGZPWWdTZHY1TWpMY3Uy?=
 =?utf-8?B?WnhhQTVobStkQTA4aWRLbjdSVVZWOUtLZDE0NkJzWmpOTVFTTFdpRTlLam85?=
 =?utf-8?B?K3BBNlJnRzBWRklOYThvNy9OVVBWZmRNNG9KS2xZVWIzTm5SQ3cyd1Q0OGRo?=
 =?utf-8?B?Zm0vZnJhSUZBc0NuTWYxRE1WT3pBWDladjc2VmFNY0xnaWtuQkMwZlVIbDgz?=
 =?utf-8?B?OEUvNTRtckpsdUkwWmsvUlNnZlVCa2dqQ3U4NTBaUDRRRmNLakF1VXFud0g2?=
 =?utf-8?B?Mk9JWjQwK1dtQ08vOTNmZ2FYeDVNS2VhMTBycU1NTzBwd0lhaGl0KzFvU2FZ?=
 =?utf-8?B?YWQ2b3hLMWJRNkM1SWI1QUQxRDBYVWcxY1ViU3B5clkwY0cybU5NTVoyNVh1?=
 =?utf-8?B?NS9JZm5Mdi9ZZzh0eGtHQnFkRkdSdHFtT0crVjZpVGpvUlcrM3pQTXdWSFZN?=
 =?utf-8?B?SjFpVDVYWDNvVWlUMDZWS0VDVDhUamI4TTAwSXFqQWlhMkgxdko1b0dVMm44?=
 =?utf-8?B?MCtVN1NiWG1zRmxHd0pnZTEvdytPemJBQlRJUklEOUc0SUFqOWVnVXJJWGFx?=
 =?utf-8?B?Z2FXbG92Z0haZUFnWWlxa3dXb1J5K2FVbC9zY1EwcGdQZ0xEL1E5eTRxelJR?=
 =?utf-8?B?WHZOMkRGRGxFQksvWjZJcXRMVDFQSzNQVGQrNHYrbjkrTVBzMFAvUkQraTd2?=
 =?utf-8?B?c3N3TlZ6ZlZjdEtFazVmSk51a0Y1UXQwZ205ZXJNZW0wWlJiVFQrQi9SeWZE?=
 =?utf-8?B?OFRFRFpmY0U5eFNmSG0xM29xMjRjaDNGTjQyWlBSUk9YdmlTaW4yZmxiTWhZ?=
 =?utf-8?B?bVdhNGFZVmVMT05VSVhHR25PdWpwK0R2U1R1bTQxYVZqMW5NS21jWmxKbVM5?=
 =?utf-8?B?a2d3VCtSaFQ4eHZkR29EWExlR1p4WW1zTlF0S0Y4Z2dtOFlvUXFhYzhWSkhh?=
 =?utf-8?B?L3Qvbi9mUnVIRi8vSldIQlNJMEpSVXdYZXg0di9YVFlkSEN2a2d1TEk1alJZ?=
 =?utf-8?B?R256c1IyaXRSRzd2bFBPS1plOEtVSXYyWStlRnZib0dJUVpram9MS1pDV1FU?=
 =?utf-8?B?SkxJam9MWVRnaStiZnJrdHY4Vm1TenJ5MFBYSUhUYWVFSnNndnRJbytqV3F6?=
 =?utf-8?B?cGN4TjZjWEpxUmdOM1pXNnFpL1YxV0VDcXZVcEZPdy9oMm5CYkxRcXd0d1dC?=
 =?utf-8?B?MTNramxGaXZZbzFBNDI4TzhjTUZFTGFKUnJVUExWMC96ZkxKVmlXV05BTUh5?=
 =?utf-8?B?cFljM1FQbkFPdkNWdGdxY3ZpdEJiem4ycFBnKzZTbXM0ME5CQ1J0UFNQTXFJ?=
 =?utf-8?B?K2xnREdtOVE1QkJJb211eXNzS05RSmQ2RFBDMTN0cVNINmpPVFUrS1F6WTQx?=
 =?utf-8?B?blk1bWRTRGkxYWxyU1VlaExubzZVVStoZ1RMRU1hTEQ0d21RNUpweWF0SEFw?=
 =?utf-8?B?bC9nSVBGSVV0SEo2b3N5Yzl3S25iNmd5THZyRzZRdlhzNk5RazlKYU5rSXV0?=
 =?utf-8?B?OWFJRjRGMDFMakpONDE3MDdoR21pZVNLM3hocCtIalBNMXY0UTNVTHVzWE0y?=
 =?utf-8?Q?O4FATNcCSh6fR?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dnlVZitVbVlTNE1CTkxwZWlnU09pVkF0SU04Ykd5QUdvM1JjeWMxWjB6OEw4?=
 =?utf-8?B?OTBMOWFrRXVRRm8rWE1SbFpjcjNSL2o0VEZBR0pxSFcrWnhuR1RVancrWVI2?=
 =?utf-8?B?RmNhZjZwN0RDeXB2dmZaeXpheUVBd2VKVUhwTGdkTkw3WkE0V1gzWHpaZUhZ?=
 =?utf-8?B?RzJ1WlhHZ1J4dUVEWlVDcVBTQnEzSDcyVVEwRXpLM3VyWXUyRXhEQnpNVW4x?=
 =?utf-8?B?bUtNSXBlQ3Zsdzh5Mjh5VEMvL1VjOFZQY3ZUNzF6c2pNMldHbW53RFdrY3Zm?=
 =?utf-8?B?TnBIbzFZODBUVHNJUFA3eTI0QlJJdEowK050T1hFZDZtbXJJZzQxSDM5MjBt?=
 =?utf-8?B?aTdONVdPNFkrcWJSa2tyN0ZkMFR6TWVRVDdOYUp6OWdnVzdkbmFLQjRRcDJj?=
 =?utf-8?B?cFI3czZnZW5CQWhPUGRyZjBiWWxNenA3SEpaVlhIRHRnVTlQejREakZTVnZv?=
 =?utf-8?B?NmhiLzYwOFRKTjJ5cWdhT0R2UnQvT1FITmNyb3B3Vm9HNHJyY0JpT2FmVVk1?=
 =?utf-8?B?Qnh4TGkxY1hvNGp4MW53U04zN1JRbzVYdzJVMmRGL1VzRlNjVkorK0Y0ellO?=
 =?utf-8?B?eDhqeURaNExmTFBiZEVBQ2l1MDVlc0dXUGJrM3p4SzE5Y2lZTDNlVWRLVlNq?=
 =?utf-8?B?Wnh3SVR1S29TUnNEYVVPRWE1WkpjeFExKzR3NUx2dmRadDUwcWJ6UExjeDJM?=
 =?utf-8?B?dUpIaFJxbXdwS3psejQzRGVjeUdyV3liKzJscGx4QTA5M0V0WHBzM1EweTlX?=
 =?utf-8?B?NkZWU3FkaCtHYmhYUEhZdjB5bFFncVpqa3c4ZS8rS2ovcy9MR0NEWWs5eTRB?=
 =?utf-8?B?Tnh3RGZ4ME1JdWdHdkM2M3gyVVZ3eSszVTJ0bEEyYThtMXlGVlBoTTdLVjJh?=
 =?utf-8?B?ZGl3RnRZZ3RwL3cxdXJyaHJxZUkrdDBXR01XMVh5L0xaM0ZHaE04RzROLzlr?=
 =?utf-8?B?THlIWHlwZ0E3WWRicTBBY0Z0WTVlNXlNWEZRUGFBaXdDN2FjQ0lsbHU3Y3pP?=
 =?utf-8?B?OFVFSCtXNDA3SThubFlOMkg1b0wxQzJkTWx0WUM0TFRhTTlweFpvTEN0Unlv?=
 =?utf-8?B?U0NsTDAxWjI5MlA1SXV3T0FoSDhqcVZ3WTkzajF4bk5oN0dGbGZNVG1YVDA0?=
 =?utf-8?B?MElXckhrV0h0d0pqM1dVeGR3RHRLV3hOWDVTT0lVTE8yT2l0MEtRR0cySFYz?=
 =?utf-8?B?YUZ0cm0wckhpZFhlV2djS3N3ZS91a0lxTXNYTTFkZ1pnVzBmeUVlNkdOTlk0?=
 =?utf-8?B?blp4TE9HTi9oaFk5NUR6czZnWGp2RURkWjRnZWxpZ3Rib3cvWG5xZzQ3cjZU?=
 =?utf-8?B?cnI4T2JYdkFpd1dYalRYTzVNMmtMM0ppOUNKcm5TRndjeTJJK1Z2QzdvZmRY?=
 =?utf-8?B?QkRROWlHM3RoZWxCZ3I2Z2hIUXIvU1Z0MjJtSGNpY1k1TnI4dWVXN0RhMk9L?=
 =?utf-8?B?Z2MrY2UxcHBVRy9TVEthdVVSNmZHa00wZSs0WERJeEdJM0hMdnhxdWJwL2FH?=
 =?utf-8?B?RCtHZHRyMVhGY2ZXUWNMa1NNT1AyM1RWZHo2ZFd4RXU0QUxaeUtmTHI0bGhW?=
 =?utf-8?B?N2tYUTdQTmxDUVJHMlhZUDFGYnB0c3FnR0J2cTNZSk90c1Y5UkdTbC9lQW5v?=
 =?utf-8?B?WDhIMjZ4WTF1US9NWDNqcnFZMENlTEpXbzVnY2YyUFowSGNSQTBnOXRPZTN0?=
 =?utf-8?B?Zy93NzYwV2pNYnNKRTFBWXdsaGN0UjFlbHh6cWFGdDdjUXhxS0dyS21OMTdM?=
 =?utf-8?B?Z3BXcnB3RXFxOThLTnFteFZ4MmIxZDZQME9WbC8va1pqa3MwaEo3UStrT0FU?=
 =?utf-8?B?dVN2T3dWelVmRHIvZFZQTnhpM0VDbjRndEdabzczQlBVRjJ6b0wvejlmTFJm?=
 =?utf-8?B?SGMzM0RNcHRHWXMzMUx2TjZtV3ZFZm90YkdWdUoxUjBGZG1MRkFWN3Fic0lH?=
 =?utf-8?B?WFpuVDhrWFdDbGZJK29SVUIra2tURHV1aGpMYTd1R3pCOVhEVjhNRW44U2Rj?=
 =?utf-8?Q?ab9jz9wCfdiqlh8FYmIwYLsY17+fuc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 931d72cb-2b3d-4d2e-761f-08dd49d99f13
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 13:48:38.1957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1185

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDYsIDIwMjUg
NjoyMiBBTQ0KPiBUbzogVmluY2VudCBGYXppbyA8dmZhemlvQHhlcy1pbmMuY29tPjsgS2VudCBH
aWJzb24NCj4gPHdhcnRob2c2MThAZ21haWwuY29tPjsgTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPjsgRXJpaw0KPiBTY2hpbGxpbmcgPGVyaWsuc2NoaWxsaW5nQGxpbmFy
by5vcmc+OyBQaGlsIEhvd2FyZCA8cGhpbEBnYWRnZXRvaWQuY29tPjsNCj4gVmlyZXNoIEt1bWFy
IDx2aXJlc2gua3VtYXJAbGluYXJvLm9yZz4NCj4gQ2M6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJh
cnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz47IGxpbnV4LQ0KPiBncGlvQHZnZXIua2VybmVs
Lm9yZw0KPiBTdWJqZWN0OiBbRXh0ZXJuYWxdIC0gW1BBVENIIGxpYmdwaW9kIHYzIDE2LzE2XSBk
b2M6IG1vdmUgUkVBRE1FIGNvbnRlbnRzDQo+IHRvIHNwaGlueCBkb2NzDQo+IA0KPiBGcm9tOiBC
YXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+DQo+IA0K
PiBXZSBub3cgaGF2ZSBjb21wcmVoZW5zaXZlIGRvY3VtZW50YXRpb24gYXZhaWxhYmxlIG9ubGlu
ZSBvbg0KPiByZWFkdGhlZG9jcy4NCj4gTGV0J3Mgbm90IGR1cGxpY2F0ZSBkb2NzIGluIFJFQURN
RSAtIG1vdmUgYWxsIGluZm9ybWF0aW9uIGludG8gdGhlDQo+IHNwaGlueCBmaWxlcy4NCj4gDQo+
IFdoaWxlIGF0IGl0OiBtYWtlIHRoZSByZW1haW5pbmcgUkVBRE1FIHVzZSBtYXJrZG93bi4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdz
a2lAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICBSRUFETUUgICAgICAgICAgICAgICAgfCAzODQgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIFJFQURN
RS5tZCAgICAgICAgICAgICB8ICAxMSArKw0KPiAgZG9jcy9iaW5kaW5ncy5yc3QgICAgIHwgIDI1
ICsrKy0NCj4gIGRvY3MvYnVpbGRpbmcucnN0ICAgICB8ICA3NCArKysrKysrKysrDQo+ICBkb2Nz
L2NvbnRyaWJ1dGluZy5yc3QgfCAgNDUgKysrKysrDQo+ICBkb2NzL2NwcF9hcGkucnN0ICAgICAg
fCAgIDMgKw0KPiAgZG9jcy9kYnVzLnJzdCAgICAgICAgIHwgIDE5ICsrLQ0KPiAgZG9jcy9nbGli
X2FwaS5yc3QgICAgIHwgICAzICsNCj4gIGRvY3MvZ3Bpb190b29scy5yc3QgICB8IDIxNiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ICBkb2NzL2dwaW9jbGlfdG9wLnJzdCAgfCAgODEg
KysrKysrKysrKysNCj4gIGRvY3MvaW5kZXgucnN0ICAgICAgICB8ICAyMyArKy0NCj4gIGRvY3Mv
cHl0aG9uX2FwaS5yc3QgICB8ICAgOCArKw0KPiAgZG9jcy90ZXN0aW5nLnJzdCAgICAgIHwgIDQ2
ICsrKysrKw0KPiAgMTMgZmlsZXMgY2hhbmdlZCwgNTQ0IGluc2VydGlvbnMoKyksIDM5NCBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kb2NzL2JpbmRpbmdzLnJzdCBiL2RvY3MvYmlu
ZGluZ3MucnN0DQo+IGluZGV4IDczZjEyNjIuLjdmMGY2YjcgMTAwNjQ0DQo+IC0tLSBhL2RvY3Mv
YmluZGluZ3MucnN0DQo+ICsrKyBiL2RvY3MvYmluZGluZ3MucnN0DQo+IEBAIC0xMCw4ICsxMCwx
MiBAQA0KPiAgSGlnaC1sZXZlbCBsYW5ndWFnZSBiaW5kaW5ncyB0byBsaWJncGlvZA0KPiAgPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiANCj4gLVRoZSBiaW5kaW5n
cyBwcm92aWRlIGEgbW9yZSBzdHJhaWdodGZvcndhcmQgaW50ZXJmYWNlIHRvIHRoZSBiYXNlLCBs
b3ctbGV2ZWwNCj4gLUMgbGlicmFyeS4NCj4gK0JpbmRpbmdzIHByb3ZpZGUgYSBtb3JlIHN0cmFp
Z2h0Zm9yd2FyZCBpbnRlcmZhY2UgdG8gdGhlIGNvcmUsIGxvdy1sZXZlbA0KPiArQyBsaWJyYXJ5
LiBPYmplY3Qtb3JpZW50ZWQgYmluZGluZ3MgZm9yIEMrKywgR0xpYiwgcHl0aG9uMyBhbmQgUnVz
dCBhcmUNCj4gK3Byb3ZpZGVkIGFzIHBhcnQgb2YgdGhlIHByb2plY3QuIFRoZXkgY2FuIGJlIGVu
YWJsZWQgYnkgcGFzc2luZw0KPiArYGAtLWVuYWJsZS1iaW5kaW5ncy1jeHhgYCwgYGAtLWVuYWJs
ZS1iaW5kaW5ncy1nbGliYGAsDQo+ICtgYC0tZW5hYmxlLWJpbmRpbmdzLXB5dGhvbmBgIGFuZCBg
YC0tZW5hYmxlLWJpbmRpbmdzLXJ1c3RgYCBhcmd1bWVudHMgdG8NCj4gK2NvbmZpZ3VyZSByZXNw
ZWN0aXZlbHkuDQo+IA0KPiAgLi4gdG9jdHJlZTo6DQo+ICAgICA6bWF4ZGVwdGg6IDENCj4gQEAg
LTIwLDMgKzI0LDIwIEBAIEMgbGlicmFyeS4NCj4gICAgIGNwcF9hcGkNCj4gICAgIHB5dGhvbl9h
cGkNCj4gICAgIGdsaWJfYXBpDQo+ICsNCj4gKy4uIHdhcm5pbmc6Og0KPiArICAgVGhlcmUncyBj
dXJyZW50bHkgbm8gZ29vZCB3YXkgb2YgaW50ZWdyYXRpbmcgcnVzdCBkb2N1bWVudGF0aW9uIHdp
dGgNCj4gc3BoaW54Lg0KPiArICAgUnVzdCBiaW5kaW5ncyBzaG91bGQgYmUgZG9jdW1lbnRlZCBv
biBodHRwczovL2RvY3MucnMvIGJ1dCBkdWUgdG8gYSB5ZXQNCj4gKyAgIHVuc29sdmVkIGJ1aWxk
IHByb2JsZW0sIHRoaXMgaXMgY3VycmVudGx5IG5vdCB0aGUgY2FzZS4gUGxlYXNlIHJlZmVyIHRv
IHRoZQ0KPiArICAgaW4tc291cmNlIGNvbW1lbnRzIGZvciBub3cuDQo+ICsNCj4gKy4uIG5vdGU6
Og0KPiArICAgUnVzdCBiaW5kaW5ncyBhcmUgYXZhaWxhYmxlIG9uIGh0dHBzOi8vY3JhdGVzLmlv
LyBhcyB0aGUgYGBsaWJncGlvZGBgDQo+ICsgICBwYWNrYWdlLg0KPiArDQo+ICsuLiBub3RlOjoN
Cj4gKyAgIFdoZW4gYnVpbGRpbmcgdGhlIFJ1c3QgYmluZGluZ3MgYWxvbmcgdGhlIEMgbGlicmFy
eSB1c2luZyBtYWtlLCB0aGV5IHdpbGwNCj4gKyAgIGJlIGF1dG9tYXRpY2FsbHkgY29uZmlndXJl
ZCB0byBidWlsZCBhZ2FpbnN0IHRoZSBidWlsZCByZXN1bHRzIG9mIHRoZQ0KPiArICAgQyBsaWJy
YXJ5LiBCdWlsZGluZyBydXN0IGJpbmRpbmdzIHJlcXVpcmVzIGNhcmdvIHRvIGJlIGF2YWlsYWJs
ZSBvbiB0aGUNCj4gKyAgIHN5c3RlbS4NCj4gKw0KDQpNaW5vciwgYnV0IEkgZ2V0IHdoaXRlc3Bh
Y2Ugd2FybmluZ3Mgd2hlbiBhcHBseWluZw0KDQpBcHBseWluZzogZG9jOiBtb3ZlIFJFQURNRSBj
b250ZW50cyB0byBzcGhpbnggZG9jcw0KLmdpdC9yZWJhc2UtYXBwbHkvcGF0Y2g6NDU3OiB0cmFp
bGluZyB3aGl0ZXNwYWNlLg0KDQouZ2l0L3JlYmFzZS1hcHBseS9wYXRjaDo0NjM6IG5ldyBibGFu
ayBsaW5lIGF0IEVPRi4NCisNCndhcm5pbmc6IDIgbGluZXMgYWRkIHdoaXRlc3BhY2UgZXJyb3Jz
Lg0KDQouLiBub3RlOjoNCiAgICBSdXN0IGJpbmRpbmdzIGFyZSBhdmFpbGFibGUgb24gaHR0cHM6
Ly9jcmF0ZXMuaW8vIGFzIHRoZSBgYGxpYmdwaW9kYGANCiAgICBwYWNrYWdlLg0KLQ0KKw0KIC4u
IG5vdGU6Og0KICAgIFdoZW4gYnVpbGRpbmcgdGhlIFJ1c3QgYmluZGluZ3MgYWxvbmcgdGhlIEMg
bGlicmFyeSB1c2luZyBtYWtlLCB0aGV5IHdpbGwNCiAgICBiZSBhdXRvbWF0aWNhbGx5IGNvbmZp
Z3VyZWQgdG8gYnVpbGQgYWdhaW5zdCB0aGUgYnVpbGQgcmVzdWx0cyBvZiB0aGUNCiAgICBDIGxp
YnJhcnkuIEJ1aWxkaW5nIHJ1c3QgYmluZGluZ3MgcmVxdWlyZXMgY2FyZ28gdG8gYmUgYXZhaWxh
YmxlIG9uIHRoZQ0KICAgIHN5c3RlbS4NCi0NCg0K

