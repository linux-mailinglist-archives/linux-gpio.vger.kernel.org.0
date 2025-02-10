Return-Path: <linux-gpio+bounces-15660-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C0CA2F1BF
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 16:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9568F3A9456
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 15:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53BE323C36D;
	Mon, 10 Feb 2025 15:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="592evF3y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-CY1-obe.outbound.protection.office365.us (mail-cy1usg02on0064.outbound.protection.office365.us [23.103.209.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B082397B9
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 15:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.209.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739201261; cv=fail; b=V8NQMUTVLgRR8klnU3GQ16kNzn3N7q1SfXCEwTzWe7sCucASpXc3dUOkRq0v9QSGXRJpeXo+DBPpkuOqmopxnUj+UeMkpa/u+66QUxT8JfHx6NXUoMnCWhb5enju1xe1FOFwJ+Nhwe9BAsFyfGCUFI7HyZPIfI+sDIqhEtIIbWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739201261; c=relaxed/simple;
	bh=o7SbfLFO2WeUKZa+EUa0TbVgqUAAk8o2x9//v+imuOE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XkrJseS5AQMgXnGGXBGhRMLacOcGDYr/a52Dm/JQUwkcEXj7gc0pt4h7RYpqbMHRbO9VwyCOSpp3s5Z74RW/UCNZy2aQRSbNt1bHBRuujxpS/S5CQKoVkzM6Ixu9nwtSqLLrlfL1bbX0I3tG7tK/JsVtumqPZRnVzfyr8KHSNLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=592evF3y; arc=fail smtp.client-ip=23.103.209.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=OWxh2NBZSCh+sNBubnJwnVARFJGM+TLajzhS+fLJ/nUa5KZBPf9lt6wAIxEt1NGUul+I89FtapPg7r2ul8WIAw8HUtSIZnM5sJNAbzf94DPa3AkWl+b1t5EqgTY7tjOkIGmCkwzZRD/FtlOub405Rq653S1kcDD0o8y4/tB+VVQu1mYiPULiZ2Ls6eRrtYnU2sYR8bPFs5MdSWb1rEd63JN219oWGIlInWHKQSHrrLijCUjymnpi/dD3SGzqyaoGn0Ps74T8VmdVDL8fsSZtwKOqKXLSUxsXEzKVqEOBpBwztU1fbGtaLvLEcRjqbVaQGGkjBzT1s+wTgYan7szQ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7SbfLFO2WeUKZa+EUa0TbVgqUAAk8o2x9//v+imuOE=;
 b=nKq79zzGlDT9vEJsEaDSmtyTmCCGE4BH0iVIIIB6ADpcYmofQ/DzA8tXxmubcRrOVb0zJze5UJBwaacbiyi3i7ywRKKUbO0zQluVNcaiGkCG5tdj5Ttjbo2NZTs8HifblrUfGHkEF6ubtrpEZctBbjkrGvkgoADcJjekMZWChgUjoMaX/xOAeFOIv6QFAYx0EaHbxaLrMTypdtc9b8VHdhSbA4w5Br5ABcy9CZglnRx+3hUA6YF424eiT7q7oX9/iYL8N/vlE5ANVqFjPKGSAJkzdhmCl/3cnH+DrqSyHsaFVGzXcDbMqXBaf8emxS1RRBjwFGy5usDCAtyU7uA7Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7SbfLFO2WeUKZa+EUa0TbVgqUAAk8o2x9//v+imuOE=;
 b=592evF3yYkLDfrc9PAzy/FkD2yEw9hQhZ9j/nGfCZI4HGdvAUSq+OH4mBEwY9Dy2SK2I8/0+e+fuClhHPb2Cz25jcJ9Cb8n7bi+gqu6YUdnHNlFFHX459W3G/kBhiqjDzIVWDCYZv2sVehcaQWufPjPuW9KtNh3EtocMPNZXRv516G8eb+1yQkk8UJBT0xW/QmvUOY/xaGTwpLTgOjYx58ap4fCyIR3U6dU8X5ktMguTEaKMaY4bdCCIriXFtHtxkHxOaFnCFLuUnxq8XAla//EQHX3Ri0nxnqC0yp/v2Sk7QJ7OnE3GLL6nin/TQsdzlh2qh31WrxukEEikVwUwhg==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1081.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:175::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 14:53:41 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 14:53:41 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>, Erik Schilling
	<erik.schilling@linaro.org>, Phil Howard <phil@gadgetoid.com>, Viresh Kumar
	<viresh.kumar@linaro.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [External] - [PATCH libgpiod v3 11/16] doc: provide sphinx docs
 for the core C API and C++ bindings
Thread-Topic: [External] - [PATCH libgpiod v3 11/16] doc: provide sphinx docs
 for the core C API and C++ bindings
Thread-Index: AQHbeJHLhbYMY5EsCkKEo5hYcBQn7rNApQjw
Date: Mon, 10 Feb 2025 14:53:41 +0000
Message-ID:
 <PH1P110MB1603B27EBC05880518E1E4CD9FF2A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
 <20250206-improve-docs-v3-11-2065191fff6f@linaro.org>
In-Reply-To: <20250206-improve-docs-v3-11-2065191fff6f@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1081:EE_
x-ms-office365-filtering-correlation-id: d1e17b36-1c35-45eb-a5c9-08dd49e2b5bc
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZVl6bGdWMnpyaU5hQmZSQ2o3OEw5Nlp1ZTB6V0s3WU5neFF5UVdTM0tRTFlt?=
 =?utf-8?B?VHVwMWNvbk90TTc5aTBwNEQxdWVXUDdzdktHTHZ4K295Nm9wc0hHNHU2RTVM?=
 =?utf-8?B?RXZyTkEwcnpvOWhBOENrSFh4QzEraUdQWllFMnR4eDZoNXV0VnZWdklGNUNy?=
 =?utf-8?B?QWdpZDd1SGJMejY5U1RVWjByV2g0RTZqYll3dzRHb3E4Mm9wYVVhQmdUbFE3?=
 =?utf-8?B?bGlhU0I4eTZpcWpORWJpVWx6djJqRlB1MTdwVHhobUZOVU4rdTBEUjcySmFD?=
 =?utf-8?B?Z1NqdFltczdtTEFxMnB4NlF5V0xlbENReXNMZ3ZVL2pDVXJNQklNc1MxVHBu?=
 =?utf-8?B?MGtqc2wxb011L1RuVStKZk5CUEo1Vmo2eHovRmdwQm9oRjdHRjJJUllVajJQ?=
 =?utf-8?B?TEU2QVl5elBtbjhveVBQRW94blh1dXV4QVBFVXFOU05YQVBvYzdLc0pXNHh1?=
 =?utf-8?B?TjZyajFSazZDaGZrR3d5V3NqMTBaa2IwV2NzcWJoeGo1L2JtZXd0NjFiT0Iz?=
 =?utf-8?B?aGVzUDkrTFFKVGoxKzNldlcwSVRVMDBaaU54VWUzSTFWY3A3bnIxVVJ2dEVM?=
 =?utf-8?B?SzJKaHJNcTdlZXcvTi95ZGFmTWpsT1BVNEoyekFPajFrWmszTURoMUthcEdv?=
 =?utf-8?B?ZGQ5Q1dkVkNzL05rR1R6U2NtOFV3UmhCUzB4b09EN2c3SXNjZElNdEYrdnZI?=
 =?utf-8?B?dFpjOGRhclQzU09jdHlzZ1A0dzk4NFJUT0FXeWF5cDVyalJEZGF1YlVaWTYx?=
 =?utf-8?B?T1k1ektRNkRMNWRsTHNkOXREeTlMckNnWTBla0kyV2E5cGpaZG90K0RucENn?=
 =?utf-8?B?ZjBEVkV6TFltb2IwT0JuUVlHdlN5cGtjNnE2WVpVZWt0RGhQRVpWS3NDWE1j?=
 =?utf-8?B?UU03SE8xNUR0MUNMOENneEFOdkNUaGx6aTFsK3hUTk51MWdJZHN5ekVkUWlx?=
 =?utf-8?B?MTZWNnloaDcxRzJEcDJYdlBCODBaQitkZm1idUNtSW52cG1sNDBya3dVSUll?=
 =?utf-8?B?ZmpCN3VhL094KzhBSjBhVWhRZThrZTlLZWpLZWt6a1RLRVo1MkpVMHM2WFVQ?=
 =?utf-8?B?enlDbnR6QWRnOUZyZ2pPUlBHRU5uenN1b3lXZVdGTTY0b2Jzbit3TDFPS2g2?=
 =?utf-8?B?UFlNb29TbVFvN0xNOVM2QnRjZzAxREozV1RoRUVpRFZVNkNvSkhLYm9ocnly?=
 =?utf-8?B?cmZSMEkzWnZMa0szQjNwVWJ3bk5rdEZSUXRaZUZYQW1PRlA3aHMzSDIzdWpV?=
 =?utf-8?B?S2JPd2lqdTdwRzhUNmNhVTBuaFZLVVp1WWlZOURtQ2pSZXJYTDBQdjA5aFpy?=
 =?utf-8?B?cjhSeHNWUGV0c1pISGE3NTlKUU1oMXovbmpreHo0YlNqcGg0UURKVHR2RWNh?=
 =?utf-8?B?S0FabVhrR3Z3Z2k5Ti9jQ21vL1lEby9vRERKV1VTcHcvUXNtTXFndnpDZXhS?=
 =?utf-8?B?MGtBWkhhSzlzeTRDcENJSWcrQVExZnhZSUpwcGNya3B1TDkzMXFGRWVxdE5Y?=
 =?utf-8?B?c3l0QitPakZ0eU1pU21WV2IydXlJTDJ6TjNmMGlpZ0plZGNLWktQeVNVWG9i?=
 =?utf-8?B?L0JhUEhqcjc0N0hqOXkwVUowR3M0dlErd3gzWlJZK0pkVEhoMmhXZmp0eERi?=
 =?utf-8?B?MFZRQnhTa0JRN2lNcFFiNDRpajlFK1I3M0RybFptMDhXWjdMOGM1SFRTWUdz?=
 =?utf-8?B?VzVYV2JaSjkvZGFRUW9FTGtjZWhxQ3puUUc0elJBakh4SmlhQzIwZ3ZSL25I?=
 =?utf-8?B?ajEvbkFtVEIzSkpUNE5YZHJ5eERVcmo4SHdWVFN3eDVvakpYSEVCTlkrR3Ur?=
 =?utf-8?B?Wm5jaHg3Vys0TEYzNHdFYU5tQ3FaQ0dnZTZ4YUFjSHJrVGcydjFYUDU4Mklh?=
 =?utf-8?B?cVM0cnRiZFE1VCtuYjd5cmRubFQxZlkxUmJrSTFRenpWaUdEZ21VL1lpVmMz?=
 =?utf-8?Q?lEa+5YJFax8fuvH4wNMELLbT/4TI3HFV?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?czJpWGcrQTNZdDBpL2lqYU4ycG83c0orempvdzg3NXNvek5WOHBrNklRWElD?=
 =?utf-8?B?aks5MlpTU0lMakJuMGNYT0FEWGhWV2pmS2xkVUx4cGoyRmZsOTdhd0swY2d3?=
 =?utf-8?B?MisrU21NM2FleFVSMngrS3VidVhPQXZQMUFlL1pyTWJlY21XTkVOVnRoSjhz?=
 =?utf-8?B?S2Zzaks0R2JkZjRpNVA1cjJ6SFAvU3FFK3lwdmxaUW1GRDZuU2ZkNGRmK0oz?=
 =?utf-8?B?MVZwWW5MdEswcGZod3NveWtTTXBQa3pJNGd6a09TOXNSWmtDUzViTjRMcUlk?=
 =?utf-8?B?Lzk5V1lwQWo5SVFsNHRaR2JVNG9BVmdUWkh6VHpBRUEzWEZwc0NSK0R0OGFq?=
 =?utf-8?B?d2JDTmRYa3IvMDBRdTREeWtzVUVubm96MnRCZk4vSDFZaDNJTGRTbFNBaHVM?=
 =?utf-8?B?T0o2bVJSc29TRGtiNGZoYU11Mk1tcy9ybUFFZXdDTVd6VC9lRGNvdlFNZk9x?=
 =?utf-8?B?Q2tOaTRrZWdORlRCaytZNFF2U1UrQ0tWV1FZbHJhTkdNcTRoTTlrM25CTmUy?=
 =?utf-8?B?WVhDNWVmNHpENktnTGlQQXN5NVpjQXl3bTlWSW1PTUhJWjZXWWJNaldCZWNu?=
 =?utf-8?B?bmszZDF2MVBvellIdUtqeEJQUEFEWnpXeGdRNUQ2Rm5oTEJxblloMmRHb1Jp?=
 =?utf-8?B?bHRQNnBHZnI1Z0NEVTJGdklKSFN2MTBEUlhJRnlRKzdWQjBBUlZJWWhMNEtp?=
 =?utf-8?B?MldjUDJUbE9jRkVBcUhqbXMwb05Ga3c4R2xra1F5VDh1UUZMZFRZQkE1ZVdE?=
 =?utf-8?B?a2dSRm92MHVlSEsreUM1SHlySkI4MEdtVWlwL3ZpSWV1WVVaZWt5d2RrdkdR?=
 =?utf-8?B?SWF0Q0c5ajRaTnNmdmFJU013KzZVZENaQzlNL2xEZXNDMy9mblJPeC9wMVNx?=
 =?utf-8?B?Tk01T2tIVU94UzQ2TnYwTXRQdjFidmJSWk90WXU3OVlJd3ljMmZTRmExS1J5?=
 =?utf-8?B?VXUwd2FMV3pXckwvdnBEbjhCbGovRFIvNjdYVkZJY3gwYjJmNWFydnZMSzdr?=
 =?utf-8?B?Z3JVY21aMXVYb3BvNm15WXo3WGMySUM1ZDZrRjQ0K09YWHJiS1N0cGVLbHlh?=
 =?utf-8?B?NnJwSGFHbmxXUUF1dHZhZkxkVnYzRkdqY0c1dkVOa1dsdjBSMXcrOEp2Wk9U?=
 =?utf-8?B?R3ZSdEZ5L2IzVDl5KzFvOTJiN2JBTlUxT3RhTWJWZ3JiZFNuSmhvK0NNMG4z?=
 =?utf-8?B?elI0Ukd0SnFWQ0ZHVzI1Qy9WMk5DcDZRakkzQ3p3TC9kZWNGTkVjMXJKcTVm?=
 =?utf-8?B?QU0vQzZmWW5heTYzS3pCeWlWR2JPZmFkWDNhQnVYcGNYSFZjSitlWkg2QXVl?=
 =?utf-8?B?NmxFS3RYeUE3bzZVcjMxeXdNejY1OUZXK2srRHBWRnhsSm5PWlJlbGQyMURm?=
 =?utf-8?B?UmFNMFZNd0o1eTN3ZXAybmVSTVU2M3RSSGNIRG9xZlp4VnpNYkZtK2g1Qmdj?=
 =?utf-8?B?aW1ESFFlYSt6bW5pb3hNMU9weGIvV0k2cTBWelNnTjUvZFJZbkdhVW5Xa0NZ?=
 =?utf-8?B?QmthcEpJcUZGbFQ2RjU3Q1NEYWRtaXMvdjlPQjdhVnJTTnFyU2NrUU5mL0d3?=
 =?utf-8?B?Z3d4UFRONThjVXZPc0pnbk03dW9YRWRPdGxmcnY0c0lxeENxT2F2TFlVbTIr?=
 =?utf-8?B?ZWhOUUpZcGNEZVB2NXZkajZTYlQvZnFhNnRZNjNWYjZudnY2T3BNWWhwNXBD?=
 =?utf-8?B?MmY0SVpLYUVQa2s1SVFtZDhTY2VQWHRUY2xMQkt2TzVkdlhkZGhKd2Uxc0dS?=
 =?utf-8?B?NlVYQ3NVejEweGVlTThPUEVmcC9ZdXZNS3ZsWkhEMWFRVlZDbWpxUlVnOXFF?=
 =?utf-8?B?dHM0bG91d2hTbW5iSmpYMW9WQVhsMUI1VXdUZktFM0RqcFpwK0FWVnBkUlRI?=
 =?utf-8?B?Ti9aQlkzaDA2cXJxM0dVQVFJRzdmQnhNNzlkNm9udHRyK0JLK0w0KzBvakhi?=
 =?utf-8?B?L0g2QklOZnRPV1pKblNmajUzaDBlSm5KMCtQdU9kblZKVnluT2ZjcTVCdk9M?=
 =?utf-8?Q?PuVTCtNWDGHtgGS6RVlFkH4J1mjwog=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e17b36-1c35-45eb-a5c9-08dd49e2b5bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 14:53:41.6748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1081

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDYsIDIwMjUg
NjoyMiBBTQ0KPiBUbzogVmluY2VudCBGYXppbyA8dmZhemlvQHhlcy1pbmMuY29tPjsgS2VudCBH
aWJzb24NCj4gPHdhcnRob2c2MThAZ21haWwuY29tPjsgTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPjsgRXJpaw0KPiBTY2hpbGxpbmcgPGVyaWsuc2NoaWxsaW5nQGxpbmFy
by5vcmc+OyBQaGlsIEhvd2FyZCA8cGhpbEBnYWRnZXRvaWQuY29tPjsNCj4gVmlyZXNoIEt1bWFy
IDx2aXJlc2gua3VtYXJAbGluYXJvLm9yZz4NCj4gQ2M6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJh
cnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz47IGxpbnV4LQ0KPiBncGlvQHZnZXIua2VybmVs
Lm9yZw0KPiBTdWJqZWN0OiBbRXh0ZXJuYWxdIC0gW1BBVENIIGxpYmdwaW9kIHYzIDExLzE2XSBk
b2M6IHByb3ZpZGUgc3BoaW54IGRvY3MgZm9yDQo+IHRoZSBjb3JlIEMgQVBJIGFuZCBDKysgYmlu
ZGluZ3MNCj4gDQo+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdz
a2lAbGluYXJvLm9yZz4NCj4gDQo+IEN1cnJlbnQgc3BoaW54LyBjb250ZW50cyBhcmUgbW9zdGx5
IFdpUC4gTGV0J3MgYmVhdCB0aGVtIGludG8gc2hhcGUgZm9yDQo+IHB1Ymxpc2hpbmcgb24gUmVh
ZFRoZURvY3MuDQo+IA0KPiBJbnRlZ3JhdGUgdGhlIEFQSSBkb2N1bWVudGF0aW9uIGdlbmVyYXRl
ZCB3aXRoIGRveHlnZW4gZm9yIHRoZSBjb3JlIEMgQVBJDQo+IGFuZCBDKysgYmluZGluZ3MgaW50
byBzcGhpbnggdXNpbmcgYnJlYXRoZS4NCj4gDQo+IFVwZGF0ZSBjb25maWd1cmUuYWMgdG8gY2hl
Y2sgZm9yIHNwaGlueC1idWlsZCBpbiBhZGRpdGlvbiB0byBkb3h5Z2VuIGFuZA0KPiBtYWtlIHRo
ZSBtYWluIE1ha2VmaWxlIHRyaWdnZXIgYSBzcGhpbnggYnVpbGQgb24gYG1ha2UgZG9jYCAoYWx0
aG91Z2ggdGhlDQo+IGRvY3MgY2FuIGFsc28gYmUgZ2VuZXJhdGVkIHdpdGhvdXQgc3RhcnRpbmcg
dGhlIGJ1aWxkIHN5c3RlbSBieQ0KPiBydW5uaW5nOiBgc3BoaW54LWJ1aWxkIC4vZG9jLyBkb2Mv
c3BoaW54LW91dHB1dGApLg0KDQpTaG91bGQgcHJvYmFibHkgYmUgImRvY3MiPyBzcGhpbngtYnVp
bGQgLi9kb2NzLyBkb2NzL3NwaGlueC1vdXRwdXQNCg0KDQo=

