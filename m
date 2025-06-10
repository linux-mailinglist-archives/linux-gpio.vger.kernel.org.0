Return-Path: <linux-gpio+bounces-21162-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F291AAD3445
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 13:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8514D3B89D2
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 11:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3051528DEE4;
	Tue, 10 Jun 2025 11:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="jcj1hn5C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F6128D8DC;
	Tue, 10 Jun 2025 11:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553281; cv=fail; b=ATwNA5+R82gUEqyKFghx5dl0YvFt0qZxWhKxNpXbdKrrnDM6RiqRPj0FETp8GDIJtgYLOMgOfLwAaWtGhhn+5hlvi+u34euRm4XfPuYvSzNZPV0Yeotx47FPTeIzOqPZwPYH0M77xI3s8HzXbNQXwffTIxPAuuHWAQ8/KBPtZyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553281; c=relaxed/simple;
	bh=8CMwJYjBFuNdpjsbBz0pxb2wqxpsyCAwlrYYCuScmeo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZY/rUcg5Sq7NqpikRfvcSCNLYx9wJhVaP5DVN44cnNWw/rRu8hQmZS+6D3xEjzvnvTmfEim3fxt4EwDOVD6hIr1B9eqJTVklMfuBzzmgy2pB0kTK0HSonui53I4f6KkaLSjyFyTGZmeQ/c3cvWpUUHSUkiFwRVZP7+fIxPgGvec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=jcj1hn5C; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8fM00003384;
	Tue, 10 Jun 2025 07:01:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=8CMwJ
	YjBFuNdpjsbBz0pxb2wqxpsyCAwlrYYCuScmeo=; b=jcj1hn5CrrmfGGNyuJsxF
	5bGjriOUQN7pp6LCZFirZC88KX8UA9jpVmPdy0Tm/LuvI8j/yvRSIREDMfJAsQ1q
	5k5p9xRH4A8JoJ0GO1VN7O9owNHO5gXSdBurlHtrTPVrOLcIx+KfXcsNP200Gt0c
	3InhHUPQ+b3WRYf2xOrXgCdaGvASCqODHY3MPlNTB5GR/3sn2/H4FjpE/mA3dmjv
	/XWfY19JsGo4mfA9if7F8mLlMm/QlBxaAMPkZa3hy5etPIUKyiUuT7M6DuX5PXQZ
	8Gaj+msnJY8NQZxyPclhHr39O06iFH4iSDGA5qv8wJlVWMvUqEu7daHSjERiaSUX
	w==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 476ekshpk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 07:01:16 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/p3xYiD78koZCqGoXUa6voKarnPupdAr9xmgIY3YhxJf8L4SN4DbSjDWts7pYkgZ9EL/EVDZ53inKYw3KgeaD7r9N+LkldUfLI9uxn1v2DLMEsJ/NPbMlt7bgTR5ClNpStsP5CW2sttde2US+rwpvAQ6YOQD8ifbANDOdz7kQLRe+S7l7LnYQ/gbZSta5a61oQfpABpU+qCdR2N3xIhP9Z4qB3c16NG4uMZ6sWCFK1ibDjK48jNDMQI37fkv6MbaL1o7P39g8MFUr65l8V3uz9KHDDbeQY7EOUG+f6VtE5CwXqIW71HUiPegYRYIqELEHEk7zsWZciFLnykGg5vgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CMwJYjBFuNdpjsbBz0pxb2wqxpsyCAwlrYYCuScmeo=;
 b=cn8w2WUXpEO6yefy2FaDZXYFNv7tvN1meLPilUVTQLlot3t9GY3KhboiHEYrnDzuE3NYLZ4cajADFOkxcIrf7ro/ZO16aSmKpkX6Q0ejfFOlHxTyfW9Pn3V3CFUK2KFWEp+ySENeb2Om5znDBtVVeIgoKXrN4kmBs7xpEbI1VtXRH46ao/GKBaGrHkGqE90nE+44pjDhJQaB9mq3XYlE/yrfQiKK4qFoayX6YqwsV5h7B/M1JWjDP+Fm5R7pkk4DfIdzH4HTfY+3B6h2WyinZvbYoJPS6eO1MmXhFUS5scBsLuIGmL4ubL2scDpeSp0eMNL4gRIUS46NLy59TWSxNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6512.namprd03.prod.outlook.com (2603:10b6:510:be::5)
 by SJ0PR03MB7125.namprd03.prod.outlook.com (2603:10b6:a03:4e4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 10 Jun
 2025 11:01:14 +0000
Received: from PH0PR03MB6512.namprd03.prod.outlook.com
 ([fe80::c8b5:7953:eec1:cb28]) by PH0PR03MB6512.namprd03.prod.outlook.com
 ([fe80::c8b5:7953:eec1:cb28%4]) with mapi id 15.20.8792.040; Tue, 10 Jun 2025
 11:01:14 +0000
From: "Hennerich, Michael" <Michael.Hennerich@analog.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Subject: RE: [PATCH RESEND 3/3] Input: adp5589 - use new GPIO line value
 setter callbacks
Thread-Topic: [PATCH RESEND 3/3] Input: adp5589 - use new GPIO line value
 setter callbacks
Thread-Index: AQHb2evg9k4yUEwQaEeeMyNX/V+No7P8OhRQ
Date: Tue, 10 Jun 2025 11:01:14 +0000
Message-ID:
 <PH0PR03MB6512DAE9A72BAB663100ADAF8E6AA@PH0PR03MB6512.namprd03.prod.outlook.com>
References: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
 <20250610-gpiochip-set-rv-input-v1-3-5875240b48d8@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-input-v1-3-5875240b48d8@linaro.org>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6512:EE_|SJ0PR03MB7125:EE_
x-ms-office365-filtering-correlation-id: e7960b8d-4494-4f1b-16e1-08dda80e1df6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?REtHc0tRNGd6SnVXb2dsRXBYWHNjVkdvalF6TzB3R3pwS09tVDVBU29mekd5?=
 =?utf-8?B?eTJxVkFwYUZ4clh1SGZEemJNODZuditJd20zZExUTnU2UXMwSDBCWThKQ3dW?=
 =?utf-8?B?YWc4bDc1alhCTlJLWU5xaFcvNTVzS1IybG1KdTgrYmtMWXN5TkEvVWF0a1BB?=
 =?utf-8?B?RmFCL3cxOVVGRy8zU2R2RS9qU3h4M3VDNU1rVEtSSHk2Q3hManM3cytjdVJ6?=
 =?utf-8?B?bjNlNmlTQmEycEdLdzRmajlwNmtrY3l0UEdRWmdBcVZuVFUvWUFua3poWVBs?=
 =?utf-8?B?TlR2L21pTGQySHJRMGNCUXdjcHU3RnN3dUpmMUlEK1dRbE5melZCcDFUVjRP?=
 =?utf-8?B?eEN2czg2Zm1WTlQrNjRYblZVVzFXaWZLQ3BBeVYrNHc2aFR3My9DNC83ejhp?=
 =?utf-8?B?OTZCOGV6ZkxtS3BEWDJnczJMM1BDRWxmbDAwMzZGdEJXdjdVbzlnUHluYmxj?=
 =?utf-8?B?N0pGLzB0M3lJOXp5ODdvbjNFcERiNUVXVnZiZ1QvYjIva0JncG1DaVgwOE9V?=
 =?utf-8?B?SWZJSXVvU0h0blF1eGxFMnpjZTZjWkJUeGVnQ0w5Sm9FSTZHSzJXeTNQQVht?=
 =?utf-8?B?VFVucy9KamsxOFk5cnZxYW9SMXhHWjluQlVwcVBFY096S3JKQlRBemt6cDhl?=
 =?utf-8?B?OWhZYWJ6Z2FsY1ZBLy96TS9hcFVIbDZpTi9Memx2RThBb1pNTFgxMVhuOEN3?=
 =?utf-8?B?WHJlYXFRa3lPeUw0VmVwMG9MS3cvL1RzV29LTTYxWi9PaTZFSWFnQUd0dzR6?=
 =?utf-8?B?WUpZUUJjU3gxbVFZeEdEcTZ0emo2VXd6RFNOamdOWUp3b2Z1bWMrSkVhdnRp?=
 =?utf-8?B?ejlUeGt3Y1hlbHh3cm5YZUVoNUpkU1dweHhKa2NXZjV1TjE0djRCdWRSdWQv?=
 =?utf-8?B?TmxrNG9FMXpMa3V3cnA4V0tDOEw4bSs3VCtLVElVdi80N3p5M0lkU1JyV2Q3?=
 =?utf-8?B?UmdWWjg2alB5b1NSNkp3cFk0N1RYbER4TTQvQ09iNlNOaHBsbnhOZnJWY2Vz?=
 =?utf-8?B?elUzaHljTGQwNDkydUhPMVNiRzMwQTZHV2cwQ0NkVUpRV2xwbHJESWpPTVRx?=
 =?utf-8?B?OWhxaHBvYTRJdXFUZzlwdktlbVYzcVhTcXRISkN2bkhIcGZDSnJGNXk5S1F5?=
 =?utf-8?B?UktGcGZuaEFNcExqeUtkZmpHNE9ZY0UvRzNSRE5lc1pKUFZYRlcvOG9Md2Z4?=
 =?utf-8?B?RnZDclhLR3pXbk9rVG8ySTNuOWIvWVkzV2lOV0o2eFpPL0E3RDM4QmRtL00y?=
 =?utf-8?B?VjRLZEE3UFhvcHBwT2o4N2k4QWprTUZSWlliNTc4WTBoeDJsZjF5MHFRNHRz?=
 =?utf-8?B?bTB5M09KZWdYVFIwMmpxUC9uOEJCS0s1OGdhcTVVZUwvbkREQ3JNdkxhNHNZ?=
 =?utf-8?B?eXFnaUtOOU5sSXZ2UXBzMTdreXMycjEwM0lULzlFQmNNMDJldUNqcUN4TVcz?=
 =?utf-8?B?NXZDVGZtSHRDWXRKTzR6V2ZNNHRnQlJrMDBuRU5vM05Fd1Q3UUxaTWhRdXdN?=
 =?utf-8?B?WEhVMDRnNEhiQ1VGL0xwWHptQzU4NlJNd0JPN0RFaThhUVJQMDloMnVrWlRK?=
 =?utf-8?B?VVJjSERzb0FqSW5WT3BsOXc4WWtCTFlNN3FJMHMrSVMzVU9GTWwyWFFKUlNL?=
 =?utf-8?B?SlZjdWpBeUgvTWV6T2ZncSt5cldiUUNMTXdrY05Nd3VTS0VPUDF3NWdWYXF5?=
 =?utf-8?B?M0tlYUxVemU2SGpadXQydGN6SkVldGpyZDdRb28wakpxSUc0YTBJdXUwZjRx?=
 =?utf-8?B?MEhyVjZjRmZITzFnVUZOYzlnd3hZTzVIS1ZNYVltSEhKNDJLUEtzQ2I0YzFZ?=
 =?utf-8?B?cVBHcXhqNHNqdUxoN0F0cGNvcmlZNnM3aHJDTnpKaDViMG00MkkrdTMrcG5R?=
 =?utf-8?B?ak1SQjJXT3hqOG9sb2t0eVZtaUZxbWpPY0Z5VjdkaTU4NVAvSkpUQVdsejZy?=
 =?utf-8?B?K09tWTRzK1RGUVdleWNSUGlmdjdEcW1NMGFlb3pxQ0cvK0lJRU5EMUkxT0xa?=
 =?utf-8?Q?dOS+0/9GIalwGbLbL7FcDKV1dVlbEQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6512.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y1EybUZIWXlIcTJmb0RzZitBQ1FKM2NXUG9odGwvS0lqNE5Zd2JNbWdpNEZD?=
 =?utf-8?B?cmJZb000MHFxQVU2dDdEZVVna1I4TmZWUzRyWktHN29XRlFIM2t2aEVpME05?=
 =?utf-8?B?TGVtdStwNGI1cjZXNVo4Si9nL3NiTnlZL01MekdOMFk5ekZXanN5VWZBeTVx?=
 =?utf-8?B?RmI0eTdJM2dzeUVtY0hkYkdVOXVBKzVka2Fvd05TT0FldW53Sm9KUC9iVzFM?=
 =?utf-8?B?SDlJNnV6UUZQWXVOVlZrZzRHT1lpUzdYYzBlVkpJd0JQbnpjTTFQRTc4aXA1?=
 =?utf-8?B?ZmlQWmJWTDNJeHgvQ1lsZFdwcTFST0lFZ0ZJcUo2QWwyNkE1RGZsUEo4K2Rm?=
 =?utf-8?B?WCttRVNHbExQMDJCczhBdGxqUk9CRlBBU1JYb2ZhYzV3WmE3N0x6Y2ZGM0kr?=
 =?utf-8?B?RE91bVlRK0ZQZFErb2p0akwxb3RUbEU5eWZCdEhHaThBTjEwWlVqSW1jd1Fk?=
 =?utf-8?B?WWFyaXNkakcyVU9qVEI2TG5NZ21lZ1A5V29Hc0lDZGl5N3hFVG9mWTVQQ2g5?=
 =?utf-8?B?SEtIbEx0bDBkNG9hQU1BcFpRMWVFZDlUbXR3VW9VekxKRk8zSWh3d1lleVYz?=
 =?utf-8?B?SVgvRllkYWpoVWw0S25jb1pyaTBuaERsNHd5U21CclM4eGZoWGFpUXIxczA1?=
 =?utf-8?B?VTdDa0VYSmdaNWNJcnUrVHNrcXpLYXE3aXNLQVQ0L3FmVHBxR2tUWCtPN2NQ?=
 =?utf-8?B?aFZ2MG5Pcm9vQ0dkc3Y1L1h6NGlBOWl3SWRzbnRrcjVqbm1NTVJqblhEc2hl?=
 =?utf-8?B?a1dGQllSRW0zN1Bqa0VtMzhDeEtWVjlpKzBwSG04RG83ZVRiVGpvaXdyellU?=
 =?utf-8?B?K2kwaDRwdStldjQ3NG1nUlFZZ3F4Z1pDVzBvYmpSTkVqN21sV2YyTUNKWldt?=
 =?utf-8?B?Skh2OTB4K2w0c2N1RHFWdzVIMjBSQ0Y3V29RcnpTak93WUp2YnBXVWdUNjha?=
 =?utf-8?B?RXFxWWRwWWZrU1pMNDljWStOQWlwRXRJQ2NZaHVoRWZTVzduZ3FrM1Uzc1Yr?=
 =?utf-8?B?ejgwN2RYMC9tMENHQ3MrZXFETitCVDhFUEZNYjRKbm1QT0c4RFhwYnl2ODA2?=
 =?utf-8?B?elNuK2dDdU4wNFdvQWlDYXlPb0p0b2NzbG02VHYrczd4TjJpYXVsaytTcHBP?=
 =?utf-8?B?ekR4dWU4N2dYRVFYdkNVRm93eGZURkJnKzRFR3NaUDlXSUVKMlBENEhGdXZp?=
 =?utf-8?B?Y0ZqT0VjSk4yUWtQajljazlBL2hiK0JYRGgxcTd5UDVueDlvV1NPUnViTU5R?=
 =?utf-8?B?KzZrUnlkVlhNNHd0SUxyelNRTk54MjdqZWFzSnV1c3BFYjZkcXNneDVmRTZj?=
 =?utf-8?B?c0NScGxKZ3NzZDdtbytXT3ZGTE1lRWhMWXNzNzF4amR5dmRUZFVpZGJwaXRx?=
 =?utf-8?B?dU10aHJBM0FiQWkwekFJTW5ZYWw3bUFpUW0waXVGYnFLTVVTS0V0UHA4d2ZG?=
 =?utf-8?B?L09FZEpKdTh3aThxSm8xYXZ0MVc4WHA3eEFXbzN2VTZJNGZUWkVJeXEwc1lG?=
 =?utf-8?B?QnpQb21yNlNicnpsVVMyZWc0VnJEWEQ3U04xWGpOZlhPVnAweGlyOStwajFS?=
 =?utf-8?B?UkMwZWtmbFZLUURGeFpra2Y4NldWeGF1WW1ScFBubTlReFBvb2plVGdsTDZ2?=
 =?utf-8?B?cjdIZ3djbnFvWlRlKzBtMkhLaXpDZUZheEhvTm1MTStxUzZQOVh3N0xlM1pu?=
 =?utf-8?B?QlpVTDU4NG5hbGI4eXp0VmZRakF0WlBwWmFLRGUyZHJ6RVdKVG1Yc1l1azQz?=
 =?utf-8?B?SlYyNDRGbTV0V2RYcGE5aFFZN0Zwajlkd3Bub3JPMG5CR0tEVGx4aktadVEr?=
 =?utf-8?B?bmhJTS9EcS9OSG12MDNsQWpyMDlRTnRTbmtRZG4raEhGZFFmZzNiQ2d0Nytr?=
 =?utf-8?B?TUxvODhiQStaVk83YWdVNHhjQ2tWeDZGNmttaWlXZUdnekZxcWppSTFQZElt?=
 =?utf-8?B?SnRsanNmZTNqVUZCYUhLQy9LRFhSbytzTGZjUjhmcXFJcm52eWtaVDdNWTBU?=
 =?utf-8?B?NVJiZjBXdkNYN2dWWkRRUEVPQ2VxTXJwb2RUdGluU2xKUVhMd2pxUnBuNnJw?=
 =?utf-8?B?UkY1YUxEYjNVU2lRRVZwa3BCRDRsRFNYcnRzbDl4cnJodWRNeUcyd0J0dmcz?=
 =?utf-8?B?bGlNVFdUaExRbFhQQTJnSmIvazVJWkVUclFrZUM1UmJ6ejVIMGM3cXBPVGU2?=
 =?utf-8?B?ZVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6512.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7960b8d-4494-4f1b-16e1-08dda80e1df6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 11:01:14.1574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fHUOsmI8uakWjWRf3eDOQIVVANRs3Znrb1t7SZvqTE/O1npCXrSzD9OEceF3OfOq+GeQlxHanLtj2Cf78O5knV0g7EvcTFMUpmcpcwjs/lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7125
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4NSBTYWx0ZWRfX6PnziTcXURXM
 b+SvVAyQgSfzi8E0IVYAKY/sfCJk2+60DjZOOnCFNdxroIZZ8a5wqpyYdxVEdKZEDKr32jSuOt2
 HfFNxlvX4B0xGR8G/PMZLnZ9o0UkzgaLyQZwJD4okgi+x/lgA3PYWRLb2xiw5usdafXoE+Qu4Mi
 1Xo848kzbHZJDObSJt1Rmngj2jYo00mVBfLIS2W+BBH9P+KD+skcBDj7WebFQwV5tenOmZyyMcW
 1Fnyu8JGHM4DPIVQ93odQuDiKQ1whbgtHqmwUZSLf8HyyYh8M/C3b33NyU9fHElFnhsaHvPqR3d
 b33jY0Mz2g72rRbCTrC3HBI36Ike6bAjKUK4PPfjasSveuXj8MVULaBJ8VuoaFblQYLdv4KQ4qj
 ScS+Sv0nEtc8t4/5y5tnlvd3epW45dz3x5eeFSf/9jolJo22M7DbuPn6g0s5gaLIMKe9OKS5
X-Proofpoint-ORIG-GUID: XNjTdPIr_uzi-OCQofkmlA8DHkB7vjOj
X-Authority-Analysis: v=2.4 cv=OKgn3TaB c=1 sm=1 tr=0 ts=6848107c cx=c_pps
 a=b7h9l29Yh+wFs0LxBEmA1g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gAnH3GRIAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=cdgfygPOYCZXOI56R1gA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: XNjTdPIr_uzi-OCQofkmlA8DHkB7vjOj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 priorityscore=1501 clxscore=1011 lowpriorityscore=0 spamscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100085

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gU2VudDogVHVlc2RheSwgSnVuZSAxMCwgMjAyNSAxMTo0
MCBBTQ0KPiBUbzogSGVubmVyaWNoLCBNaWNoYWVsIDxNaWNoYWVsLkhlbm5lcmljaEBhbmFsb2cu
Y29tPjsgRG1pdHJ5IFRvcm9raG92DQo+IDxkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tPjsgTGlu
dXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPjsNCj4gQmFydG9zeiBHb2xhc3pl
d3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gQ2M6IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZzsg
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGdwaW9Admdlci5rZXJuZWwu
b3JnOyBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+
DQo+IFN1YmplY3Q6IFtQQVRDSCBSRVNFTkQgMy8zXSBJbnB1dDogYWRwNTU4OSAtIHVzZSBuZXcg
R1BJTyBsaW5lIHZhbHVlIHNldHRlcg0KPiBjYWxsYmFja3MNCj4gDQo+IA0KPiBGcm9tOiBCYXJ0
b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+DQo+IA0KPiBz
dHJ1Y3QgZ3Bpb19jaGlwIG5vdyBoYXMgY2FsbGJhY2tzIGZvciBzZXR0aW5nIGxpbmUgdmFsdWVz
IHRoYXQgcmV0dXJuIGFuIGludGVnZXIsDQo+IGFsbG93aW5nIHRvIGluZGljYXRlIGZhaWx1cmVz
LiBDb252ZXJ0IHRoZSBkcml2ZXIgdG8gdXNpbmcgdGhlbS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4NCg0K
QWNrZWQtYnk6IE1pY2hhZWwgSGVubmVyaWNoIDxtaWNoYWVsLmhlbm5lcmljaEBhbmFsb2cuY29t
Pg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9pbnB1dC9rZXlib2FyZC9hZHA1NTg5LWtleXMuYyB8IDEx
ICsrKysrKy0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5wdXQva2V5Ym9hcmQvYWRwNTU4
OS1rZXlzLmMNCj4gYi9kcml2ZXJzL2lucHV0L2tleWJvYXJkL2FkcDU1ODkta2V5cy5jDQo+IGlu
ZGV4DQo+IDgxZDA4NzZlZTM1OGVmNGI1MjFmM2Y5MzZkYzJhYjEwOGJiNGNkYTMuLjk4NmE3ODlm
MWVjM2IzNTk5ZGM5NA0KPiBlMWY2Y2Q4NzFlMWRmNWUxNTM3IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2lucHV0L2tleWJvYXJkL2FkcDU1ODkta2V5cy5jDQo+ICsrKyBiL2RyaXZlcnMvaW5wdXQv
a2V5Ym9hcmQvYWRwNTU4OS1rZXlzLmMNCj4gQEAgLTQwNCw4ICs0MDQsOCBAQCBzdGF0aWMgaW50
IGFkcDU1ODlfZ3Bpb19nZXRfdmFsdWUoc3RydWN0IGdwaW9fY2hpcA0KPiAqY2hpcCwgdW5zaWdu
ZWQgb2ZmKQ0KPiAgCXJldHVybiAhISh2YWwgJiBiaXQpOw0KPiAgfQ0KPiANCj4gLXN0YXRpYyB2
b2lkIGFkcDU1ODlfZ3Bpb19zZXRfdmFsdWUoc3RydWN0IGdwaW9fY2hpcCAqY2hpcCwNCj4gLQkJ
CQkgICB1bnNpZ25lZCBvZmYsIGludCB2YWwpDQo+ICtzdGF0aWMgaW50IGFkcDU1ODlfZ3Bpb19z
ZXRfdmFsdWUoc3RydWN0IGdwaW9fY2hpcCAqY2hpcCwgdW5zaWduZWQgaW50IG9mZiwNCj4gKwkJ
CQkgIGludCB2YWwpDQo+ICB7DQo+ICAJc3RydWN0IGFkcDU1ODlfa3BhZCAqa3BhZCA9IGdwaW9j
aGlwX2dldF9kYXRhKGNoaXApOw0KPiAgCXVuc2lnbmVkIGludCBiYW5rID0ga3BhZC0+dmFyLT5i
YW5rKGtwYWQtPmdwaW9tYXBbb2ZmXSk7DQo+IEBAIC00MTgsOCArNDE4LDkgQEAgc3RhdGljIHZv
aWQgYWRwNTU4OV9ncGlvX3NldF92YWx1ZShzdHJ1Y3QgZ3Bpb19jaGlwDQo+ICpjaGlwLA0KPiAg
CWVsc2UNCj4gIAkJa3BhZC0+ZGF0X291dFtiYW5rXSAmPSB+Yml0Ow0KPiANCj4gLQlhZHA1NTg5
X3dyaXRlKGtwYWQtPmNsaWVudCwga3BhZC0+dmFyLQ0KPiA+cmVnKEFEUDU1ODlfR1BPX0RBVEFf
T1VUX0EpICsNCj4gLQkJICAgICAgYmFuaywga3BhZC0+ZGF0X291dFtiYW5rXSk7DQo+ICsJcmV0
dXJuIGFkcDU1ODlfd3JpdGUoa3BhZC0+Y2xpZW50LA0KPiArCQkJICAgICBrcGFkLT52YXItPnJl
ZyhBRFA1NTg5X0dQT19EQVRBX09VVF9BKSArDQo+IGJhbmssDQo+ICsJCQkgICAgIGtwYWQtPmRh
dF9vdXRbYmFua10pOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyBpbnQgYWRwNTU4OV9ncGlvX2RpcmVj
dGlvbl9pbnB1dChzdHJ1Y3QgZ3Bpb19jaGlwICpjaGlwLCB1bnNpZ25lZCBvZmYpDQo+IEBAIC01
MjAsNyArNTIxLDcgQEAgc3RhdGljIGludCBhZHA1NTg5X2dwaW9fYWRkKHN0cnVjdCBhZHA1NTg5
X2twYWQNCj4gKmtwYWQpDQo+ICAJa3BhZC0+Z2MuZGlyZWN0aW9uX2lucHV0ID0gYWRwNTU4OV9n
cGlvX2RpcmVjdGlvbl9pbnB1dDsNCj4gIAlrcGFkLT5nYy5kaXJlY3Rpb25fb3V0cHV0ID0gYWRw
NTU4OV9ncGlvX2RpcmVjdGlvbl9vdXRwdXQ7DQo+ICAJa3BhZC0+Z2MuZ2V0ID0gYWRwNTU4OV9n
cGlvX2dldF92YWx1ZTsNCj4gLQlrcGFkLT5nYy5zZXQgPSBhZHA1NTg5X2dwaW9fc2V0X3ZhbHVl
Ow0KPiArCWtwYWQtPmdjLnNldF9ydiA9IGFkcDU1ODlfZ3Bpb19zZXRfdmFsdWU7DQo+ICAJa3Bh
ZC0+Z2MuY2FuX3NsZWVwID0gMTsNCj4gDQo+ICAJa3BhZC0+Z2MuYmFzZSA9IGdwaW9fZGF0YS0+
Z3Bpb19zdGFydDsNCj4gDQo+IC0tDQo+IDIuNDguMQ0KDQo=

