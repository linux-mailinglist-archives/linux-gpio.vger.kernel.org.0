Return-Path: <linux-gpio+bounces-13184-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C9A9D5456
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2024 21:54:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6BFF283B65
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2024 20:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A946D1C8773;
	Thu, 21 Nov 2024 20:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="wSI0r+HW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-BN3-obe.outbound.protection.office365.us (mail-bn3usg02on0070.outbound.protection.office365.us [23.103.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F7D132122
	for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2024 20:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.208.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732222475; cv=fail; b=TO6ws+Y9bLfZnSiKcFq+8E8xSNELCEaX2Gu1nFrIehgGLOwsmwmNLTzTri2LpqkUYbGls40kMvsgQdyuV4c4TOR9ql0uO7kT0+mU5lTBiPOwTqm7LM9myvXsnKZAL9lfPhjueD6X+UU0/fkZK7ZZE/WdBIFJWCRp8KtX2JrnVb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732222475; c=relaxed/simple;
	bh=GwzWzxFBYjC73JYgoKZMn/lbyW95bmIHbAeYXJsiCBw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GDgpt0QNatV/iYPbO1/+WF2hafZxYv0suEq2Td/XyMH2rvF8oqf9trLjsEVSZHHzviMfY031yBRpmN5txLd4NX43x0ZNx5+xOiDq12884uP8ZC78tpyudKVjtMpzQ92ZqgdD5CUxJI9LYMqxYmmMWTCd6CopQrzR3pKhVK5pgfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=wSI0r+HW; arc=fail smtp.client-ip=23.103.208.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=pFxLvh5ESM4OolG+sL8SLVqSmxM0jJuV14eKP6HhKfAUqhNr13aGl98EQgkhbl8HYjZKp0ywn84IeJPqRbAc42x0EnVmpwfsrDtrBwD/Jv4KOT0VDNulvfVY3TcPRLlNmMSwZ8YMoH/sBP3Q1frPXAmhRKBCA1ZFY5qS440qqzGFvIII8ytQ/6BIWIyY575rD/fP+uKdntzR77nfF9jAFC2R223VefECcTYS08f1vkONkmr8mkrt/KQw4247IyxymhmhXg//XJ9kVfGRONL9Ho+JaBhlCzBJ5e3UUjNRlSIcBm19TNkWdkOWWJ7vWB/S9tsUusQnbgIDiVhu9qb+rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwzWzxFBYjC73JYgoKZMn/lbyW95bmIHbAeYXJsiCBw=;
 b=0ghGw06GHQ+vbGk0pdljuAm4SeGPZKJjWEC7cQCLlTqz4C1HxZY32otpXXDzTgX4GPqL5nHQc495YSmzplTUSrA6STOQnQbZFHt6AXoN4Gm3vYDfDsCDl1sx6vNaJfhUfjJ4VtNVwuvcX3O+YeL2+FXa60sVE64xej+3sG77V4+UqnRlpFDyQ0hfRqkZvOE4HkLwfRxR1Pr4Ccs/NAh+biNhgJBo6raqQnJkuKadChFY42cyFtpC7aSU8CFAln6G641XRbcsLNUEPUGdM0eid9fA6zzQpU0zHO0De5hM1IjwMLtNXykaGFPWRZUyHOVPUVC2vFzwlXmf8UiLyUSnfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwzWzxFBYjC73JYgoKZMn/lbyW95bmIHbAeYXJsiCBw=;
 b=wSI0r+HW15ZQH+Cyn7+o/wKlFrDwqiADT1fL6rtfk+clXM9TWrgCCBMURo1KrC3EcGJdF+6LmXYPtrD/chIqAZLFi2UEjbcfF6KOjEwWXmy235lbT9FPRVayckI1yT1wGWtaOIs454znqPFe5tgeOya7iJ51tiTAXq8N0IILCMbP6E1aEV0R8+R1O/4CIZgCWP8IXra/4hHNaE53VaxDPUaBtABBFDjLblqSlSNiabvPJDTaCv9d1pwZyLQSKPlEOJ8xgpf5b/IcoXXM4aj/i/+elJHo6C0+eYXxkEV4z4OJaZuE6Cs68p13vapN49rfm3NVzlxQV3aTPHvVU9ZbkQ==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1744.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:174::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.25; Thu, 21 Nov
 2024 19:20:23 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.8158.021; Thu, 21 Nov 2024
 19:20:22 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Phil Howard <phil@gadgetoid.com>,
	Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH 0/3] bindings: python: drop dependency on distutils
Thread-Topic: [PATCH 0/3] bindings: python: drop dependency on distutils
Thread-Index: Ads8SGzvrR6YARNxRWOucB5OQBY0lQ==
Date: Thu, 21 Nov 2024 19:20:22 +0000
Message-ID:
 <PH1P110MB16030FE997A2C909C6B7421F9F22A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1744:EE_
x-ms-office365-filtering-correlation-id: 33dda935-cec8-4d58-196d-08dd0a618bbf
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|41320700013|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WVJwUXNOSnZtRHp3UmxHZFYybzl4dEc3alhsN2R6S09ZbFY4d3ZFa2NHUE8r?=
 =?utf-8?B?MjQ5UzMvaGpHVXdXMWt5TzE0OVFiSjBRRDJmWmRIRGk5UENTTk1seE5kd2VB?=
 =?utf-8?B?MnZYYU9BVzNxY0lCOWxVN1BjUWR2T09TamJwM3lSY3NPRW56bnFUMkZmZWpE?=
 =?utf-8?B?ODMzalh6T0RTTnFsZ3c1WEZpNTdOUlN1a1NRdk5pa2VoUStXOCtJTEhKM2FT?=
 =?utf-8?B?bCtQWnMzNXVFejNZMlNiMDd3M1pPK05FNzRMSTZaSzV2OHp6Yk9ncFQyZEd3?=
 =?utf-8?B?MncxdDM0RG5oQit3dzU5cEFLRVpwZDRHZmlOemNGOGtDcHRQS0MybGR1VWNB?=
 =?utf-8?B?WlRVVTg3THUxZ0JZTkRraXluV0N1NXF3NzExTU41bmNVVWFyWmYxUVhFdnVS?=
 =?utf-8?B?OGVqRW5PNDFjUFFlZkExaTdTOTAwYTVJTE92dGIzOGQvV3MxU2VnakhIMm1i?=
 =?utf-8?B?Qk5wc3JaeWZvVlpvb3ozdFRqNnNraDJDQ2N3d0QxU3ROZTdMbFBlS080ZTJn?=
 =?utf-8?B?WU5aa2pRUnZqa0RqUm42NTVhbTdBY0pXVnA0Tmg2UFJCS3Rya2VldExjUVhu?=
 =?utf-8?B?Z0kvV0ZsVHpLMm9BbEY1QU85TnpNZnRwR3B2V08vRFhLY2o3Sk5CRDRUZ285?=
 =?utf-8?B?QTZqWEhQQVRpZDZ4VURHTkdBalJsdVh0WDk1d0RoQjhuR2t0SVZqaThHSlNx?=
 =?utf-8?B?MkFSdklwdjlIVWpRdUFlUWFqOW1ZVUEraERvYU42UkFLaFl5a3Z0TTV0SmM1?=
 =?utf-8?B?NTdMQlpIMlJreEtydzQ1bzBqckRGV2R0N0UrZXl1SEUvR1ZMSFVPNnZibW9y?=
 =?utf-8?B?SzNTQW9ITGhLRzBlU29oWDZxWEV0YXVQajlzWVQrbnl4bEFlY0pqbkJBbFpU?=
 =?utf-8?B?Z3RaMmpkY3FRYUtuSzlyeXRLQytaeWdsT0J1eUx0SEhPdUFzNVp3ZS96R2Rk?=
 =?utf-8?B?dmFSZ1p1Nm1zeTVER3lXTWJYbkZ2bXRUR2ptd2pSMWt3aUFQNmdDUzlXMjZK?=
 =?utf-8?B?ejJ2K0UzYS9vTllQc0UxUVNkVVlkVWN2LzFsZjRqa0IrZWl5RXFqS0FPZXdu?=
 =?utf-8?B?NDF3K2UxaExpSFdCb1IyVG5iSzJGSkdvQWdpSUh0ckRjOWpuSGhrRG16YTBl?=
 =?utf-8?B?aE9GZHRqY0p0QVJvUEJzcUUzeTZ0eURTeGVIaWV0ZXdMYVJCekJEaVAyNDhj?=
 =?utf-8?B?SUdERWtmaUgveFJBNGliS1EyR0N3U05XSjhQTnVJbFhXR2FaQzMrVFlmWmdm?=
 =?utf-8?B?d0loSXdxMzBINlU4WFp1L2hDenk1cW91U2Y0MVZLUHRuQlB2YnBTeWJ1MmNI?=
 =?utf-8?B?M3dDN3JpVmZ3QTIvZCtlRmZpMmNmZ3NDQkFRWlZkckpidGV5ZlBTenVQMTky?=
 =?utf-8?B?WEVLdDBrVGdUSHQ3bzlBbWIxclNOMWt3a2N6QlpTaDVwMHdCenphd21XcXJE?=
 =?utf-8?B?RzNjMzdGT3RRVmtQUnJPZmlHMHk2bVJRTExySU1idW1wSCszQXFQYjVEcjhw?=
 =?utf-8?B?QVh1TlN0aGFMZjMrZ1VaaXRlNlAyZTVRdzdkOFErRzZpUGVJa3E5blBYK0pU?=
 =?utf-8?B?VFFNQjNSWDFkakVHR09weGtKNXY0NzQyUjV0VG1UVlhaemZTZ3luRi9CeGJj?=
 =?utf-8?B?aXVkOUgyYzUwWG1YOTNXQ1NBVkpjQmhueU82cEwrYVRSS2Y0cjRrbmp4QmtY?=
 =?utf-8?B?ZExTbkR3eHlzMmFJRkUvTVRBR0d4QzBIZHdTVkloNDk1L1hjRzFaZ05lamov?=
 =?utf-8?B?ZHhzdlVzdTV5NlR6SURzdGM4NjNUTkFUMll0L0dLOFVpOWJSTE5UMEdHQ0FU?=
 =?utf-8?Q?rmOTWdkYsp4o7gYdiWkEJY88z2a6OTan+CebI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q24xSVI1SzZtbWduY2N6UmJMU0JWMFdrOGMvOW1XWkM0OEtwV0dVbVhRbU9w?=
 =?utf-8?B?T3RueVM1akIrb2V0S2FsQUwxa0I1Z2RTanN0Qmx4QWJybFFWNXh1RzlpUzBr?=
 =?utf-8?B?RWE3NWo1UmYvUGpYaHZRdGdKRkp2L2JCd0w5bDFlNmlhWGtnamJoYjNnRzRJ?=
 =?utf-8?B?d2xhREk1U2JPYnNwSTBBSkt2em41c1JpN3BMbm9udnVjck5BRkRGYzBxV1FN?=
 =?utf-8?B?ME9hMTJsZmNPcEcxM2xUREE1ZUtZckRyK1g5UVNFdUQ2U1JEaytlRkZFMVFa?=
 =?utf-8?B?dGpMbmIzYS9LMlNkbkNoOGFpNXlGei9jNFBHUDVrZFhoamtnbjJwT05YTXNi?=
 =?utf-8?B?Q1FFVGMyRm01N29EMFFseCt0SFd4OHNRb0laYzhhTXpxOVVpSXFoVjFwR0pl?=
 =?utf-8?B?bDdia0VQM2xMT0VEem9YWFRSN3ZMOTJHZ2U3b01qQk9rQ294MENtNWVid3dT?=
 =?utf-8?B?ai9BbGpwaEVScWtUcG1oU0RsS0lwTHdyTndlVVRmRjV5MEVxYW1CZzUzR3dP?=
 =?utf-8?B?czA0bTNIczFMeTJkYU40VDBhQW1GTDdLMWRWdU5uSWRCRmJxcjJEcEZpODA5?=
 =?utf-8?B?SGFuRnZLbGduVTdrREVDY0ttc0lESDNJT2JCZmdXbHJTUmxYZnR1M3g0bWtH?=
 =?utf-8?B?UThvSVVKMU5EQzJMK2tLaFljSkpLZFk1ZXZ3cWFlSEFJL0R1N0ZBYkhlMEhD?=
 =?utf-8?B?ZlFoeEluQVRwNmsyNGFvSEtmWnMzblN6QTJDeExlSUtFYzlYcGUxSGx5d0dq?=
 =?utf-8?B?b3BpMVhzb2FDUm1CL290Y3FDMG9EazBSUmVXQ3dmSW40NTZVWkp6Si9MRTdO?=
 =?utf-8?B?M2NzdXdXSVdHNUVXc0VtTWV6eWZMbVRkK2lLMTVwWmR1VjF6MDdwZTIwa1VE?=
 =?utf-8?B?QjQ0UjRickR4V0dnK0JCNDhBRE8xT3R1QnFZdjc4SHZBV3RoVEo1T09vMzhk?=
 =?utf-8?B?L3JLVjFNSHVRN01SN0VEK1YwWWx0YUFlZW5YVEdockdDSUV5YlFYVGh4UzRI?=
 =?utf-8?B?ODRYVHBVazA5bEo1WWFFdUc4ZDNkUTgxZDVKZnNmSWN0WmtjM25VU1B5RTlB?=
 =?utf-8?B?TlZkWmRyL2RhTkI4b0tlenoxbVpEOTlQMlQ1cnlYaC83WmlKa3R3YjQwL1BN?=
 =?utf-8?B?YjNBSStYbGYzcUhHazNiMTJlRzErYWJPQ1E0cnNJcE52NVJISXZhaTF3eFFz?=
 =?utf-8?B?VnJEdVRjODVCaEo5S0E1OHRtaEgyblMxZzhZWTVJemFtT0pUOUxJQTFKdDVK?=
 =?utf-8?B?UzBxTEhZWGNoSEJnNVdpVm9HSE1YN3lrb3dUUHpuTE9ycEJyaytmQVJIWi9I?=
 =?utf-8?B?bEFaWDRzNHBiUi9yOVV6NlJIMFE4RnBCc2V0a1Q5cVNxcDljZEtPYk9UdmMy?=
 =?utf-8?B?akhVRkFXMzhPU0ZTVG5RQWJNYWVsMHBuV0hIeDZXSWRHdGV1emJFZVB0eVBo?=
 =?utf-8?B?eXJWcVJlaFd3cFpkVFhQbGVWaDdxbVBEZUo4OHVHV2FINnhwbXRQclA2TmNS?=
 =?utf-8?B?VFkwZFZvL0oxdEhuZU9Kb1JjdmZ1bHgzNmJQUmlROWxNWWpTS2p1dHZ1WTc2?=
 =?utf-8?B?SkE5WGF2OGJpNW04bjJ1ZjM3MHJIYThhS2RLNFdXTXd4dmpPVTNlSmR3anpV?=
 =?utf-8?B?eVdJYmR1aHhkWk94c2U5UkxPcncvdnZCc3NtWkIxVTR5MFJQYWZ3UWV6WDUx?=
 =?utf-8?B?alA3Z3hFQzV2R2VsYUN1WjJRTDFpQjIzT2pkWkptVTFKakFURUxxQ2Y3L0Z5?=
 =?utf-8?B?cERaaEc4SWFLRll1TDhWb3ppNEtaM0ZKMEJycFhqM2FkT2xuQ2d3UG5yTE5r?=
 =?utf-8?B?OVBlLzdnRG12UWs5QjNWZHlTTStWZWtJK3U0LzE0bktTWk1NZk1RVU1BNUdy?=
 =?utf-8?B?S0k5WlpkL2JFOEJ0ckd6Sk0yN1RPc1FOZDVlbnRPZ2tzMFk1UGVHaE4xd1Za?=
 =?utf-8?B?RmZONmhvb2xkVXNDY3E5TlBlNW1iYk1hRUtBb3BEOVFWL212YjBRckdOU2pM?=
 =?utf-8?Q?cSRvGlwaYxYJmVTDd4GDDFxM8bafqk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 33dda935-cec8-4d58-196d-08dd0a618bbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 19:20:22.9075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1744

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAyMCwgMjAy
NCA3OjE4IEFNDQo+IFRvOiBWaW5jZW50IEZhemlvIDx2ZmF6aW9AeGVzLWluYy5jb20+OyBQaGls
IEhvd2FyZCA8cGhpbEBnYWRnZXRvaWQuY29tPjsNCj4gS2VudCBHaWJzb24gPHdhcnRob2c2MThA
Z21haWwuY29tPjsgTGludXMgV2FsbGVpag0KPiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0K
PiBDYzogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3Jn
PjsgbGludXgtDQo+IGdwaW9Admdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFtFeHRlcm5hbF0g
LSBbUEFUQ0ggMC8zXSBiaW5kaW5nczogcHl0aG9uOiBkcm9wIGRlcGVuZGVuY3kgb24NCj4gZGlz
dHV0aWxzDQo+IA0KPiBQeXRob24gdGVzdHMgZGVwZW5kIG9uIHRoZSBkaXN0dXRpbHMgcGFja2Fn
ZSB3aGljaCBub3Qgb25seSBpcyBhbiBleHRlcm5hbA0KPiBkZXBlbmRlbmN5IGJ1dCBpcyBhbHNv
IGRlcHJlY2F0ZWQuIFRoaXMgc2VyaWVzIHJlcGxhY2VzIGl0IHdpdGggdmVyc2lvbg0KPiBwYXJz
aW5nIGltcGxlbWVudGVkIGluIHRoZSBDIGV4dGVuc2lvbi4NCg0KUnVubmluZyB0aGUgdGVzdHMg
d2lsbCBubyBsb25nZXIgcmVxdWlyZSBhIHRoaXJkIHBhcnR5IGxpYnJhcnkuDQoNCkhvd2V2ZXIs
IGJ1aWxkaW5nIHRoZSB0ZXN0cyB0byBydW4gdGhlbSBzdGlsbCByZXF1aXJlcyBzZXR1cHRvb2xz
IHdoaWNoIGlzIG5vdCBpbiB0aGUgc3RkbGliLg0KDQpXaGlsZSBpdCdzIG5vdCBkZXByZWNhdGVk
IGFuZCBzaG91bGQgYmUgY29tbW9uIG9uIGRpc3RyaWJ1dGlvbnMsIEkgaGF2ZSBzb21lIHNsaWdo
dCBjb25jZXJucyB3ZSBtYXkgYmUga2lja2luZyBhIGNhbiBidXQgbm9uZSBzbyBiaWcgdGhhdCBz
aG91bGQgaG9sZCB0aGlzIHVwLg0KDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29s
YXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4NCg0KDQpSZXZpZXdlZC1C
eTogVmluY2VudCBGYXppbyA8dmZhemlvQHhlcy1pbmMuY29tPg0KDQo=

