Return-Path: <linux-gpio+bounces-13708-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA6B9EB3FA
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 15:52:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1A582860B0
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 14:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C91D1BD9C7;
	Tue, 10 Dec 2024 14:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="juzjmOEr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-CY1-obe.outbound.protection.office365.us (mail-cy1usg02on0063.outbound.protection.office365.us [23.103.209.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18C21BD4E5
	for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2024 14:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.209.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733842247; cv=fail; b=sHQSREtOo21I2w11r9Hvfwcj8sDRAgEafvb/Q5mZ5d/ocvtOzPiv59/QRwijK4gUtNf0RVljXGncMtn7o+730RDUISpeYTr/3Jl6xIqr/Bh150FBcn5LSsQzgZZ146stQKGg7hgEO8zOT95/nv/Dw5Cg/NxaTDSDwTtQwfOwGIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733842247; c=relaxed/simple;
	bh=3rERJtFZv3jtIHc5JkneAXFwVimEPyS0XipNuErf0yg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bkx8Kk275W6KKqYpKKs61ls/yYaNkvWovH7tOAUsmK086+n2Unq9VtDDjsRPCMzeqs2UYK/Roep1rqZwtnThgX8BYqWRWlA+JH/OBN8JVCWd0xeVO4mhp9k+rH1LyaTHF1srnmGnl05Xmkwj5tYTsR3L8I/LDvDc/FMt+6kGkbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=juzjmOEr; arc=fail smtp.client-ip=23.103.209.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=t5eC88/eQYEMIZxr0eMk0/1FRBcIoI4th5YixbsAaI6q07GMS2/Ums5fqX0mIn/1euHtvKn5eNZKijzJM98mOH4k6KUVg7Moft2qXvWnlnf7/3KPAxTJoDDq4nQitgTo/Bu8W4IBotQmsoKDBIZyT4adGi56zcuccWLHC5gN+iv/iIIrck/F8BIYijZhpHCsCbjMhxT+2tO5Y125e9+3Ocfyl2xFoRqWunc51Ywa4UDiAsLgtfsuJKOVxL36AP4B198gmLhCcfm+L9ZE6F6thBRxfYm0eFJ8xLAO1q3zzfC9DtgeH9UmLXopYSQp/5qMK8E6gFxazmTZBu+07qVxUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rERJtFZv3jtIHc5JkneAXFwVimEPyS0XipNuErf0yg=;
 b=ELlGFpvtJDqREkXusFc0ZC+/sNoB0QpvyVcszrT3XWadeJKGCZ99kS0dr+tX8yW9mr6/gBIybjkChaKWaTTqp4em6AUILY9EK5Z+UGQ+cZrDZZ3naZpPyhTC005InrVRJWRdo0GeSyEQUXYkVvqfwNUJjxvDjPP/eI/x1K4c2WeMeHP0e7IN/j/3D2mdkuaDNaOVL437EAFwDSMOV07Xkg6cm/WoIdibF5Cm3lWFVafAxYe25sXERAdK5794mcOzn5/gnSRc1dtoBagC5uemIdO4W50C2V1uOkRTIUBXBrBm5Jp4vcg8Fx9R97zO2wIrZbrKK9dKH9cjW626IXzU1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rERJtFZv3jtIHc5JkneAXFwVimEPyS0XipNuErf0yg=;
 b=juzjmOErQt+l5Nce7lFJ8+JLcMmvF1e2sNnPQpwhqPmYui9GID+4Am/N5qBBoOKdPKUZ8FbpvjhCmAEdzH0jAcOJsGFVEYZNsOiwQ7Rn93CUzdDwlz0DsuZKGy/Y9kvpxbITKPFAaSVqD3bIPGCeEVNXWlxHM6JlnwGEKGHuuJB/AZC7XwuA+0NQ6QH+ue/X6/SJlxD0foke4wXNPvvfbygPCmTFcWE5tqZn9b07NWGS7B4Yhfv1F2ozMaEatEKQRIvgsSsstRmQB9zK05SvF5neYDl1ntftVzKIzZs7DPBvoPKdnYVl/4+WdZdagXXnc/RrVij+hZc5PMuTlenJYQ==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1049.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:175::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Tue, 10 Dec
 2024 14:15:42 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.8182.026; Tue, 10 Dec 2024
 14:15:42 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Subject: RE: [PATCH libgpiod] bindings: python: provide fileno() for Chip and
 LineRequest
Thread-Topic: [PATCH libgpiod] bindings: python: provide fileno() for Chip and
 LineRequest
Thread-Index: AdtLDF8OWAhF3KKnTHe7a0Gczqp1bQ==
Date: Tue, 10 Dec 2024 14:15:42 +0000
Message-ID:
 <PH1P110MB1603EC2CDF8B08F7C1FDADDA9F3DA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1049:EE_
x-ms-office365-filtering-correlation-id: 87a9ed2a-0ce2-46ff-6c24-08dd19252189
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|41320700013|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QmJjUHRQV1FPUU5tZlZFWkVwVUtrQnNRVlBONEhxc2MyVjNWMnFBaGhJeVMx?=
 =?utf-8?B?c2NsNjd6cysxTm9KeTlIRnhPRXk0eUF2QkRiV1RqaE1kZktiMGsxR25qSHE4?=
 =?utf-8?B?WHFWRWxIUTFFZWllazBhZ1hwQk1jMU51WkdJaDhNdFppWVNjUi91T295Z09N?=
 =?utf-8?B?SzdxL0tsWGoyU2JFeTRDaW5RalZTMW9zRW50TE9RbU05MVRrK0pFckpUYXl0?=
 =?utf-8?B?Y29QS2hTbmIrNGxnMzVGZlNyZ1M1UXE2by9hRmNkdDR6bEJ4Yy9NbVZZK0ps?=
 =?utf-8?B?UXo1UnRVbnFndFpKY0J2eEkzUEZWOVk5bUF2dWw1VTZuZFpaVk1DYmdzTmtq?=
 =?utf-8?B?NVd3Sk5Db2xFUHNmTHFsdTdkVEhLL3ErZ1VtQlFGNVo2WHZMNGZNU2NXM3BC?=
 =?utf-8?B?cEpOamdoTGhQMXZoVHVxN0NTZzNKWkVuTkFhMVVoeWlVemxjTE82Tzh5ZkxN?=
 =?utf-8?B?OFZxQnNIc28yRkk4OWtWSzZydnRNWmVaNXQvaEdZY3NDUCtjMStaQnc5aGJo?=
 =?utf-8?B?b2xsc2NFY0xOZnVIOHBPalZMa3ZtTS9CMVB5V1d5dEsveUdKY1hJQXI1cUMr?=
 =?utf-8?B?QUJhVHFGdnF1ZmVBMXkvQUQ1RnVKMzVLNzk4Y2Vwc0dKQXBkR1dlSkxxU3Rh?=
 =?utf-8?B?REd3ZWtodmFMQk03L25lZkZHcU5wZWNmaHNZL2RmT1lpemtYL1I4VS9hSVdV?=
 =?utf-8?B?azVscUFaS0ZlM0JjRE9SemEvM1ZkaDRoWGVSMjlwQndBbEJIU210Mjd6dUNB?=
 =?utf-8?B?MFlaSTEzcDRhS0NNTGZwdmx4TkhlVjU4d1pqTEFoa1RvV09sSUMxcXZIUDBX?=
 =?utf-8?B?WHNXOU1hTkRJaUg4MmhHelJmVWMrUENpM3VuNmdRcjB0VkJZbzRYL3RLUVRz?=
 =?utf-8?B?N1drU0JUNHZUWnZzbzRRMzVhM3JTZThlMFU4eHpCTjdxWVd0aDJFNnRSTlBy?=
 =?utf-8?B?Qm5pUzh4OU43ZjBSZUM2LzNJWW9NRUVjZlRXZUdtWElQTktZK0xPK1U2ZXU1?=
 =?utf-8?B?b0FVMzZZUUJXalQ0VFZPamg4V0lhTXhhR092c09zbldxNVg3U0VxRFlZekF6?=
 =?utf-8?B?YjJxU2h3TW1vZ0JKM1k4T0J6RmJrZ2hlL3Z3SHIrQ3pSMEpaMU9MNUZPRkpi?=
 =?utf-8?B?VHJoYVRYVXN2S2d4TnVPVFRqUE1QSWJDZFVWRDZOWlExa1R5QVFHQkRZdXhL?=
 =?utf-8?B?Skl5cVhGNlR3MTN2M3BqNUZQNDRUUVE4V3Y4OFBjTm83VlBHdW1nVjVXaHlT?=
 =?utf-8?B?M1EvK1ZUME9OT1ozblNrdHVhaVVCV3cwOGFNVUZybE9xckFEUnhrVHhIOTlL?=
 =?utf-8?B?NE9ENTA5OVRlS3dzem56SEZGNUlweGhmeGVNY0k0bExNTFRsMHVuR0k1VUFh?=
 =?utf-8?B?eXM5empTaGFjczJqcVNkQUpUUjFTbjJMUkNjMWkzSlIyWEVUUE43V3RXK0ps?=
 =?utf-8?B?Ty9JUzcrMHp5alRGTzZ4S1hJakFhVVpvdVZGWkxLakNBYVJCaFZEcEw5OVFL?=
 =?utf-8?B?WDZIUXF4enRJRnNDNzIxK3NJWUJZNzM5cDBiTVVQZlQ1QmtNNHhmcWxGYzFR?=
 =?utf-8?B?ZG1tUW04bi9nL0oxOStEN0FvUE1UV1VacldZV0Z0V1Y4Uk1sOEZuRVpIUTdU?=
 =?utf-8?B?b1NFWFVackVTL1N0YmxSczJubmRPZ01tTlYwZWJLWkRiRXh4VitKaWJhT3Nm?=
 =?utf-8?B?OWRkbmhNQlVPMExVR0hldGdtWGtXMFJkU0lHS0Vaa3lsc1VON0pzK05uQzhM?=
 =?utf-8?B?d24reU95ekltWVMvdjVheWpCQjBTZW1Xc2lxRXAyeHhxOGVVN3NJazROeHVh?=
 =?utf-8?B?SURXc1F5M3lUbXA1WDhSbVhLWHZnaC9Yei85OTY3ZWZTRnFPNFdoZG1qL0lK?=
 =?utf-8?B?RW5KSXdkWFdvRXFxa3VqTktGbm5QY3p6TlRXUzFRS0tJbGc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aEhFVlZ2MFFaa0pabGlld2lTdm9lSzhqOXBVYUM3T0NHc2hQU1M3Znk2b3BV?=
 =?utf-8?B?WFdxTzQ3VU9BTzR3UXJsZzN3R0NjTVlDV3JJOWl2VnVKK0c4TG5OT0N3OVY4?=
 =?utf-8?B?SW0yWmZjV3lNRWRSRzVOb2crQU5aRUJrWlFhTjZTaEFTdDZrbFB2MldFMDJO?=
 =?utf-8?B?MDJXc05IU0hENHFtVFVFa3VCNjZjQi9IT1ZwanNKSkU5YmpDN0ZhbHZmWWxR?=
 =?utf-8?B?RmllRHV6ZFdIYUYxeCtoUkZWV1hzOGQ1NUpxZERTbWpKdzFkOUl4a3N3VjNz?=
 =?utf-8?B?TGhXMDB6dWY2c01BZ0pqVDE2SGZVNytYQnlTS0xtK1U3MHVVZmlkbks1TStE?=
 =?utf-8?B?VUdRTEdQcU5xMDVHZHliUUlvZ0NDTmlZdmpaSElkT3BVVDQ0bjVzbEtkclIx?=
 =?utf-8?B?b0d6dlNBU0ZIK0ZkSm8wMzJKR0ZnRHN0T01mUVNQM0dhOEY3NWV5bWpuaWFu?=
 =?utf-8?B?ellNc3c5OStRRU1tTjNudVFseWVIaXN4N0djdTRoZndCV2FKV2hsMVhORHlN?=
 =?utf-8?B?SUVlMWNxdTNrenBMTEtNUC9KYmdRQ3VPeGErK0RNR0FjcWszT0piZ1NvUjBN?=
 =?utf-8?B?anBZREhXakducnM2cFBPaHZoR0VkKzNMblJpNXE3dnhvNHVwL09JVURiQlNS?=
 =?utf-8?B?cmpZMXhERXdNNkN2KzBtNE5jZWttQy9GVHl3YXE5azBPbTJWSzRZNDlNTzQy?=
 =?utf-8?B?MVllWHFwTXFMWEdZUTd0R2lIaTVZalpHNGdZbHNtSU42OTdsQXFEaWNNSWtm?=
 =?utf-8?B?bUFJVysrRzZoZ3pXOTZzcDk5bERYQ1NvQTMra2VoOXFSU0poNTdaU2x0ekFK?=
 =?utf-8?B?N0U2UHp2Rkc1ZVJjeEsxa3lNYTVvUzNjQitZeExwOUtYREtUVVJBRkhLMkRF?=
 =?utf-8?B?M3VhUTMyekQ5NXppQXduQi9nMmtiQnQvQ3R3K0h5eFFLZzM1VEIwMkFiQlRm?=
 =?utf-8?B?TmJJZC85TXRXeU1uR0NObXYva1pIQVMxdCsxVUJ0ZzY5Nk5FSHZLZmJOdEkv?=
 =?utf-8?B?bURzK255T3lrN2ZnSnM0c3FldXlMZk5UOEM0bVFOVG1MY290bTJmSzlQZDQw?=
 =?utf-8?B?dVBNWWFGNlFYa1NBQmsxODlPUzhBcEh1d1ZpU2lhc1pXNWgxS2p3L3BaRkp3?=
 =?utf-8?B?REJqN2dhSjB3Tk1tWStwWjB2UlhlR1dOdGU5RFJNUU5oUEdpaE44Z05mZG5i?=
 =?utf-8?B?MHRuaGNHTHpkd25PejJORTFPbU1uM2VGdWd1Wm5iaWplN0lBM0R0cTFaRjhk?=
 =?utf-8?B?eGs4TTUwRDdVbUtUNXlWMUtLU2xQcitOTXIwK0hyYzJJL3VIQXMyVytHa1hh?=
 =?utf-8?B?c3ZvVmJFaE5OZWx0bVhLa2hwNFczWmdmOHNxL0UrWlBkSXN5aWwrSENURHpI?=
 =?utf-8?B?czVPZUY5c1dMZFc3VEFCYnZweTlVSkZURGZRWmJObllVbFdFakgweitabmUw?=
 =?utf-8?B?TWtsbjNzdDhYSnpYVUxlR0l6eDZ3RklRTUxsUlFsVERFWkpaVzNoTE1XN0V4?=
 =?utf-8?B?cFRzeXg4T3JsU28xZEEvc1daTlRuQmxGemppZU9sc1gybWRsckdYY3FULy90?=
 =?utf-8?B?L2o2dUZaR3VSN0x1aTNtYld0b1AweU5QNmpIU1BXdU1DMmFHQ0djcndBTDlh?=
 =?utf-8?B?ZGt4VW1VMWdNVFh2cGEzNER2dWZpKzdKcGZndnFtSDVhOVhWQjNIcVVvK1o4?=
 =?utf-8?B?OGw2NW1OQ2RnZlkzbldsdHZtbWUyejc3MVA0OEpyakx4UTRuNkVZSEVYajZD?=
 =?utf-8?B?VzFIdko1NGlCRHVwT3VjN2ZKYjJ1bFlod3A3NG0zVEV5d3JYVzdsN0I1dDcy?=
 =?utf-8?B?dUR3V0dkaEN2SUpKSW1QR0VrSGR1aGtYclhHRW1jdDYyS0xtRHhYWVlxVG1K?=
 =?utf-8?B?emJhVFYzK1lxVU5KTGdLN3p5TlhsWXArdXRNMklJUU1jZGRXK09NajVmdVB6?=
 =?utf-8?B?RjhmQmRCMm9jTnBnYVMrSll4WGUxYk5IcjhPWFQ1anR3STNieWF1UXZPejly?=
 =?utf-8?Q?8qisp1ElmAy962SqN3bWTki8dPrM4k=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a9ed2a-0ce2-46ff-6c24-08dd19252189
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 14:15:42.3533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1049

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gDQo+IEZyb206IEJhcnRvc3ogR29s
YXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4NCj4gDQo+IENlcnRhaW4g
cG9sbGluZyBBUElzIGluIHRoZSBzdGFuZGFyZCBsaWJyYXJ5IC0gbW9zdCBub3RhYmx5OiB0aGUN
Cj4gc2VsZWN0KCkgZnVuY3Rpb24gYW5kIHRoZSBwb2xsIGNsYXNzIC0gYWxsb3cgdG8gcG9sbCBh
bnkgb2JqZWN0IHRoYXQgaW1wbGVtZW50cw0KPiB0aGUgZmlsZW5vKCkgbWV0aG9kIHJldHVybmlu
ZyB0aGUgdW5kZXJseWluZyBmaWxlIGRlc2NyaXB0b3IgbnVtYmVyLg0KPiANCj4gSW1wbGVtZW50
IGZpbGVubygpIGZvciBDaGlwIGFuZCBMaW5lUmVxdWVzdCB3aGljaCBhbGxvd3MgdXNlcnMgdG8g
ZG86DQo+IA0KPiAgIHJkLCBfLCBfID0gc2VsZWN0KFtjaGlwL3JlcXVlc3RdLCBbXSwgW10sIDEp
DQo+IA0KPiB3aGVyZSByZCB3aWxsIGNvbnRhaW4gdGhlIGFjdHVhbCBvYmplY3QgcGFzc2VkIHRv
IHNlbGVjdCB3aGljaCBtYWtlcyBmb3INCj4gZWFzaWVyIHJlYWRpbmcgb2YgZXZlbnRzIGFmdGVy
d2FyZHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6
LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+DQo+ICtjbGFzcyBQb2xsTGluZVJlcXVlc3RPYmplY3Qo
VGVzdENhc2UpOg0KPiArICAgIGRlZiBzZXRVcChzZWxmKSAtPiBOb25lOg0KPiArICAgICAgICBz
ZWxmLnNpbSA9IGdwaW9zaW0uQ2hpcChudW1fbGluZXM9OCkNCj4gKyAgICAgICAgc2VsZi5yZXF1
ZXN0ID0gZ3Bpb2QucmVxdWVzdF9saW5lcygNCj4gKyAgICAgICAgICAgIHNlbGYuc2ltLmRldl9w
YXRoLCB7MjoNCj4gZ3Bpb2QuTGluZVNldHRpbmdzKGVkZ2VfZGV0ZWN0aW9uPUVkZ2UuQk9USCl9
DQo+ICsgICAgICAgICkNCj4gKyAgICAgICAgc2VsZi50aHJlYWQ6IE9wdGlvbmFsW1RocmVhZF0g
PSBOb25lDQo+ICsNCj4gKyAgICBkZWYgdGVhckRvd24oc2VsZikgLT4gTm9uZToNCj4gKyAgICAg
ICAgaWYgc2VsZi50aHJlYWQ6DQo+ICsgICAgICAgICAgICBzZWxmLnRocmVhZC5qb2luKCkNCj4g
KyAgICAgICAgICAgIGRlbCBzZWxmLnRocmVhZA0KPiArICAgICAgICBzZWxmLnJlcXVlc3QucmVs
ZWFzZSgpDQo+ICsgICAgICAgIGRlbCBzZWxmLnJlcXVlc3QNCj4gKyAgICAgICAgZGVsIHNlbGYu
c2ltDQo+ICsNCj4gKyAgICBkZWYgdHJpZ2dlcl9yaXNpbmdfZWRnZShzZWxmLCBvZmZzZXQ6IGlu
dCkgLT4gTm9uZToNCj4gKyAgICAgICAgdGltZS5zbGVlcCgwLjA1KQ0KPiArICAgICAgICBzZWxm
LnNpbS5zZXRfcHVsbChvZmZzZXQsIFB1bGwuVVApDQo+ICsNCj4gKyAgICBkZWYgdGVzdF9zZWxl
Y3RfcmVxdWVzdF9vYmplY3Qoc2VsZik6DQoNCk5pdDoNCg0KZGVmIHRlc3Rfc2VsZWN0X3JlcXVl
c3Rfb2JqZWN0KHNlbGYpIC0+IE5vbmU6DQoNCj4gZGlmZiAtLWdpdCBhL2JpbmRpbmdzL3B5dGhv
bi90ZXN0cy90ZXN0c19pbmZvX2V2ZW50LnB5DQo+IGIvYmluZGluZ3MvcHl0aG9uL3Rlc3RzL3Rl
c3RzX2luZm9fZXZlbnQucHkNCj4gaW5kZXggZTcyNmE1NC4uYjM2ODhmMSAxMDA2NDQNCj4gLS0t
IGEvYmluZGluZ3MvcHl0aG9uL3Rlc3RzL3Rlc3RzX2luZm9fZXZlbnQucHkNCj4gKysrIGIvYmlu
ZGluZ3MvcHl0aG9uL3Rlc3RzL3Rlc3RzX2luZm9fZXZlbnQucHkNCj4gQEAgLTcsNiArNyw3IEBA
IGltcG9ydCB0aHJlYWRpbmcNCj4gIGltcG9ydCB0aW1lDQo+ICBmcm9tIGRhdGFjbGFzc2VzIGlt
cG9ydCBGcm96ZW5JbnN0YW5jZUVycm9yICBmcm9tIGZ1bmN0b29scyBpbXBvcnQgcGFydGlhbA0K
PiArZnJvbSBzZWxlY3QgaW1wb3J0IHNlbGVjdA0KPiAgZnJvbSB0eXBpbmcgaW1wb3J0IE9wdGlv
bmFsDQo+ICBmcm9tIHVuaXR0ZXN0IGltcG9ydCBUZXN0Q2FzZQ0KPiANCj4gQEAgLTEzMSw2ICsx
MzIsMjMgQEAgY2xhc3MgV2F0Y2hpbmdJbmZvRXZlbnRXb3JrcyhUZXN0Q2FzZSk6DQo+ICAgICAg
ICAgIHNlbGYuYXNzZXJ0R3JlYXRlcih0c19yZWwsIHRzX3JlYykNCj4gICAgICAgICAgc2VsZi5h
c3NlcnRHcmVhdGVyKHRzX3JlYywgdHNfcmVxKQ0KPiANCj4gKyAgICBkZWYgdGVzdF9zZWxlY3Rf
Y2hpcF9vYmplY3Qoc2VsZik6DQoNCk5pdDoNCg0KZGVmIHRlc3Rfc2VsZWN0X2NoaXBfb2JqZWN0
KHNlbGYpIC0+IE5vbmU6DQoNClRoZXNlIGZhaWwgYG15cHkgLS1zdHJpY3RgIG90aGVyd2lzZS4g
VGhlc2UgYXJlIG9wdGlvbmFsIGNoZWNrcyBzbyBJJ2xsIGxlYXZlIGl0IHVwIHRvIHlvdSB0byBk
ZWNpZGUgaWYgeW91IHdhbnQgdG8gaW1wbGVtZW50IHRoZW0uDQoNCk90aGVyd2lzZS0NCg0KUmV2
aWV3ZWQtYnk6IFZpbmNlbnQgRmF6aW8gPHZmYXppb0B4ZXMtaW5jLmNvbT4NCg0K

