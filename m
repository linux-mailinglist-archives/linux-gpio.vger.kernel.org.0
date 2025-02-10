Return-Path: <linux-gpio+bounces-15661-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA46A2F28D
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 17:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C12F6162341
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 16:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7906F247DC9;
	Mon, 10 Feb 2025 16:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="IBIveLaA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-CY1-obe.outbound.protection.office365.us (mail-cy1usg02on0076.outbound.protection.office365.us [23.103.209.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC306247DE9
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 16:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.209.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203652; cv=fail; b=ujtNBSbkURzKikstbvJl9SMgRrOp3M9vwrbD2+FF9HrZvfL62076U9OvpgGGANgOHb1Q02A43ALHNm/5yQHlv9DSSsIEyyHvBJjuymVySZjh7dDH/pw3vnWy4u2U5/lBCdHE8PCMSTerRf0NNbGwb6wyJWrsDh6D0GQ5LOuIhNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203652; c=relaxed/simple;
	bh=bckTnGAmPZfEnQ5/l4jqdtlFGrW29zxChYCjgv20udg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YCqAAfPLDG7P6GLMKBEZNLjQN15u9lqmycRSKRV3fNsD8jSlN6BfePRVJE5Lagps/2z4ONqHpGkp9TgqD7L6ZEYVodPF3yNMLVFEyC5yAkG144067KhG+p/9LWdJlXp45cnLVtTA7TNoaKJkp+6JQSSvN2JkOcsigOTZkPsNKQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=IBIveLaA; arc=fail smtp.client-ip=23.103.209.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=YniZCZQd04z16+N4ffJ9whRPU4CmZqlhQhWLhGJEWqRedmwLVRXB+OPTDu+A+3q6e4pCa6NqGD2WwQpzfbarWUPWuNTpl092CrIm2y7EqoIfso2nr9y3Uttk9eRoMQPjXI0PWXjgD3DVYJaZqzdnviYupTZnE3yqm487FLHa4V1w9WoURmbglvKEsML1FCy/67WyQc7uA79llS5uSu4jGuq9KZUMD81L3u5vjLYQhcVcOBagwZhV+vI9PeEwif2jZzwIYxRl/N2Y8S9IC4EI/qDraLLFN2Zxq+U3IBeaEI8rJdmau7p2XShc/x6+3nVHCn06TAM+dexOBb9OCRnZPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bckTnGAmPZfEnQ5/l4jqdtlFGrW29zxChYCjgv20udg=;
 b=fnK27eNj6TDIQDPdYUM/pmHj7FqA5aReoLGc7VXV4Zn7hv6HwwqInv/IzoTOg/UDeq5OwpOV1c2xjwsoGo+NIv2K2ljTXZLKbZcOWvuaQZTCytvS700W0ZB/YrhdjP2i3bcbQw0gZtXsQjm2wylO5p7/A3xs8wJEMAp5fIFE6ZH7pdDJQTlzIcaYOAiIxjgigAuaxeAMRE4vkt4oz/9bf731k/GAHTI8ByTantil9hTcSPkVnivwl9D1WggC8Fwbwspuv30I76rGKRNX7yLJefy1MnrrKXjCO8KPNDDkuXvHubINRKALJSQGfdbri65e1NsXHeiefBV9Dz4VIADMdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bckTnGAmPZfEnQ5/l4jqdtlFGrW29zxChYCjgv20udg=;
 b=IBIveLaAfvsjDE2VKHrxmXlsZWVJCivhEoUgy2L8Eq+nN9qPP/hHDjuUnAthjV64ghmPXMeCVlOMqA6e68C7lD8eODTkTvs5IOy+MbufZ/yNMGVcncdQxyFMqZnRnbjB8Bjlsn0qmbdf5+XWaL1fZrJmN/2CT6iTMpyoEo8U4UX0/2bNVcVW6PHNszZ39NwdyEWPb0HZp0OJ5wEb4aDEa8XCh4MaNSMiTWBewiQUf5qBToZ3s9zDwYADaE0OvQVK0YKeg54FCmXGqPuroRuM+r8qHY/qF8t2gVtZG/vDgchq9xxDxUl+8GtDSWJD7kLLH2KuKJPpa0nJVvNwdG0KYQ==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1554.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:188::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 16:07:20 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 16:07:20 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>, Erik Schilling
	<erik.schilling@linaro.org>, Phil Howard <phil@gadgetoid.com>, Viresh Kumar
	<viresh.kumar@linaro.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH libgpiod v3 12/16] doc: add documentation for python
 bindings
Thread-Topic: [PATCH libgpiod v3 12/16] doc: add documentation for python
 bindings
Thread-Index: Adt70ZLpt2Ic4wwzR32dRy2yvMULnQ==
Date: Mon, 10 Feb 2025 16:07:20 +0000
Message-ID:
 <PH1P110MB16032E877B062E8AD195DAC39FF2A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1554:EE_
x-ms-office365-filtering-correlation-id: 29e565c8-69b1-4a8e-1d9c-08dd49ecff63
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|41320700013|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q25kSlZ4UUF6Lyt0OWlwVmxEcDNMVzg2M3RmZWJBR1Z2VS9tYkVkRkdKNW9X?=
 =?utf-8?B?M2Q5ZGFoVlp1NjVPZWZWd3E5c2hncTViYUVmLzd2WjhLN2R5cFoxVEV4d1FI?=
 =?utf-8?B?MXVMQzlZbDM3WkNvcVNvQjZpV0VVbkwxQlVXVFlSNmxteWg2UzN0MGVSTWl0?=
 =?utf-8?B?bDlYZkdocDBKWkNGdCtQeUdZMytXaHlOYnlSd1Fhd1Z4emdEYjJRMlpyQURX?=
 =?utf-8?B?YlpnRW5ta1N4NmJwRUVFVDQzajI5UVppTmF5bTNSTjBmYXBva1BHbGE0M0Zw?=
 =?utf-8?B?Smp5QkZyUUMrV0lSZ1pCeVIrUmlLWWIrb2lhWWtCMDVjTFhJcTNJL0dPUXRz?=
 =?utf-8?B?K0FOK3RsaGNNMThUNUc4THV2cXhWaE5TVmU5NC9YcUVBbVFla3poWUREUG4x?=
 =?utf-8?B?Z1F2OEhEMWRxZDl3Z1FIeTVpeTFTYUd1STduQ2RqUzFiQTBzVXA0dEVmWmdY?=
 =?utf-8?B?NnRVekE5NGI2eldHazMxa1VSRXV2Z2lXTEtZcW5MTDFTUEx5bDBQTEhWc3VP?=
 =?utf-8?B?WE9lNWxXRVoydHpCOWx2M1Y3am91aEFYMVMxYTFTU0oxMHBnaElZR3dnNDls?=
 =?utf-8?B?MnkzdGZFOG9iVTBlSHRRalpIcU1PSmdmVEpvN0dtZGkrMm5XcUZjZ0JhbVNu?=
 =?utf-8?B?RnZnOTJVQnNsWSt3cFVZckdDT0ZvT29lZXhydjRaQ0lHWkRwdzcxT2FEdm1m?=
 =?utf-8?B?N1duMVNkZ01RUzlFa29oZFhkS3I2L3ZvNGFzNzRCRCtYM04yT0xyK2ZEc0VG?=
 =?utf-8?B?d3kxWGdvNThyUFVLT3JHRDZIRzZsV3loWEcwMDUzTFlJL1JGdlR1YlFsZE5L?=
 =?utf-8?B?MEdGaVRndjNGZTRnOEpzWkl6Q1o5OGlvdDNFYnRBSldjNFVvTUlsdXN3S0pL?=
 =?utf-8?B?aUEyUmVDdFdwVUdvSnd3bUlmeG81TURqSGVqYnUvcWhDcUpSazJyUVVsL1d3?=
 =?utf-8?B?MmZVTXc4SlFpRXhPa05oc2l0aTI2cmVpMk9XdjcxVUJQdTZ3My84clVxS3RV?=
 =?utf-8?B?YmwzOXBvSzJ1eXl2Qk5LR3ZoS1RaV0MvdEhJY3VuM3ZvUE5La01malFuMnQx?=
 =?utf-8?B?UU8xZ2lndGxTV3pzcmtLSFpjZnF3UlBFcW5xRFBjSk53d290V3RPM2FmNDhF?=
 =?utf-8?B?dWhJUGpLd3RzWnhISndGbzZHU25Mbnk3MjdNZ3hBdGVEVTdqTGEwRUgyT2RN?=
 =?utf-8?B?UjVURDFZTXdJZDJPMGdwT2lMaVR3dGpycVcwUmg2RUVQQ0drNDNXRGEyWFl5?=
 =?utf-8?B?U3g1c3VqczJyK01JY0xNNC9XT3F6S1FiRmVVMUhTOXhsSXU4UDBqTWNyeFdW?=
 =?utf-8?B?b2loc09sYlVBSExBbHNIN2xuVWQwbU4rclpQTzA2cnliaGgyRFpLOHBPTzdy?=
 =?utf-8?B?dE5odzlNVUlsSGlPQnZsUzFoYkVHUmY2eVQxQ1ZWY0xrbDhJK2RyMndXcW1l?=
 =?utf-8?B?YzNYOFNnZW1hZmd0eHJjalllbWg3Q2wranpmQkNTQUE2b1huK2Y0L0tncDBt?=
 =?utf-8?B?YVlRWjQ3OFFZVVJnV1FKOW0yRjdiM0lRWWpyN2NTVjdMUTNxaUhtSlFuNkpP?=
 =?utf-8?B?dEZ5WTlxVWJBUmhLV25KRmVhNElqSS9KNTQwY25XWmNGd1Fqa2RnSEdaQjc4?=
 =?utf-8?B?QWF4cXlRZThkTzh5cVlVM2xUbG0zR3pCQlBTTmxsdTRzVU1jQ2ZHVWRpaks5?=
 =?utf-8?B?WVZmL2x6TEJjbzhLdHU1eGxGSll5TjlOc3o4eVZjdVRLUXRscE9qUzhGZ3Fj?=
 =?utf-8?B?aXlPd1A2cHVTdW9USEFUV1g4VFVxTjRPYW5MaHg0cld4a0w1RXIyZnhRcUZR?=
 =?utf-8?B?U1JQSzErN2RSYXQvQzN3UnQvTXdheDRUbW03QVM1Ymd3bitlNTRqTGlVempn?=
 =?utf-8?Q?bKs7PximlsijY?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M1hUTGhiT1E4MnhlbEhuQi9xS0hldE1hd1R4TmE5cTVEOURXMEpXcVFweVlt?=
 =?utf-8?B?YkovelJML2FZNGpXNDhvYzBnWVR6MDhQc2dOcmFKTWlKOFpUK3gyVEZHUlpn?=
 =?utf-8?B?by9EdDE0ZjNScmZhMG9pbm9oSVl5NzlsY0xoTG9JR0R1a3NzQUtDeW5IZEd6?=
 =?utf-8?B?UEdOQWFTRUNYN3lTSFVmYllYSjk1SFUrMjF0a0wwSkkzSUc1YzZhNXZZeDEz?=
 =?utf-8?B?S3RjM2ZSM3JFYkZUT2d2NkxIMXFRT1JLcGptY1A3U3hZdHZKamFvS1VJZ3NH?=
 =?utf-8?B?NDJEMmFsLzdFNTRoRDZxc1FkK1lrQlNQeTIrM0o2eDVtM282eGdPaW94UXNI?=
 =?utf-8?B?aVZpcDB2OEJnV3BWR1FKQzJkRWdZV0xxL2dWMWRLU1VIMTJFbUpxanBBU3RJ?=
 =?utf-8?B?OEU2T1NxekdGeHhtWml1eklmYlI0QzNUTEdvRHpsdm5iYWR1VUQ0UlpRanZN?=
 =?utf-8?B?V0tQQTFyNGFudFlnV3RSUDV1bnVFbVd3bXAvRlVjaTlhUU1iN3hSYitYMlJk?=
 =?utf-8?B?WGpMNVhLRXNBZTdhY1VPYUJiOXA3di9EcWRqb2pmVGR0QUkvYVo2c0YxbHAy?=
 =?utf-8?B?OGlORG1Ec004eUZ2eGpVRVNDNUxtSk1BQkJlU3R0QjRZUTJmY1RPazRqTm8r?=
 =?utf-8?B?SXhsMGZVRTQ4ZWU2Q29kM08xYUFIdUFhMWFVYVYzd0hrSllwREJDajhzUlE2?=
 =?utf-8?B?NlpyTFBYVFA0R3pZemJWcnVtVCtxelVodGhJOEZqSURRSTNqc3A4dXdWMHdU?=
 =?utf-8?B?YTlEV2ZHWG5xekhEWVZDNE9uemxHWlk1djlBMDNkY2o4eXV3b1RMbGU0RmlU?=
 =?utf-8?B?SlhOTVFzSE4wbE14UWIrKy9NajBsbTlWbEpLWHFaaE5OQUd5YzZuOFAvVWdW?=
 =?utf-8?B?ZlhHSXVodEhSUm5jYWRKaDVGeHFHNU5sd3dHUlBRZVNMRllkbXVSQ2Z1K2R3?=
 =?utf-8?B?OEZtc2FSSFhqb092WGw3VGdnMEZHL2ZSN3RJbllJNWRTMS9uZmJpamZ6RHhV?=
 =?utf-8?B?WWR5NUlrSDBTelNZS1FJc0ZjNEJCajAyQ2UrK3FaNnZIRU0wdXYrY0JsT2dk?=
 =?utf-8?B?dlRwaHlZZ25CVUpXbHVtOXF0aFM1M1ZsN1pmeTRNN0FKS2pTSUUycVJoTGdY?=
 =?utf-8?B?cis0dHJCSTdlVlBRbVFvNDU2NEQ3emQ3T2pQYU9pUFFTN0VHMmUrV0MxaGxk?=
 =?utf-8?B?UUt1dERlekQrTDRRSlRjbmNVdjcxUU9aU0owakFOd25NZXduYW9xcHB3Yi83?=
 =?utf-8?B?eWlOdkEveU5jRklITFlIeFN4QXl1VHpQbDRWSTZqYk9ZQVJvekd6cjhuQUp0?=
 =?utf-8?B?c0xVaVZpbWRQZktoYkxBS3lqWHZsMFFCS3c5bWZPUTdkWktZT0lYKzM5ZmZI?=
 =?utf-8?B?SVpoUklBbTArQ29jQ1ZnV2VrTFdMMllXOHJWdWd3Wll1N1JXYXpTMmZ3TFdX?=
 =?utf-8?B?dWUvcnl6ejJhekVjdGdUTmFsdkw4U0t4ZGR0T0twZnNTNmRvaURvaFBreTQw?=
 =?utf-8?B?cml1NTZjd3QrQmhMcGVoVnlTclFjanJvTTAwN1F3bm5zSE5pejlham1OS1VG?=
 =?utf-8?B?Z0pqK3lFOGVVTENINmVod0UxcXpwdEJhcjV2U1pNOHVuczBsQTRTZDQrR05E?=
 =?utf-8?B?dXFPNDhXR1d5MXd4U3NNYWRybVlVU1J4OVY1c20wY2xlWUd0TUpXbzhUUXJX?=
 =?utf-8?B?QjhLTzJpYmE0dDFyRVpEN09RbFZWdUJMSFpxNkx1cE9HaFBIMXMvcmJyc2dB?=
 =?utf-8?B?Z2RoZHRha1NFdFhPRjNjNDg2MUx0aWs4ankwbit3ZGRnbkdaTXNqd0tTR3VG?=
 =?utf-8?B?S3M3Tk1JQnlNYWdsKzRvSmpxYWlKSW1BR3NFeW5UT2dqZ05lVGdKSWJTZDQ1?=
 =?utf-8?B?Yk9uZnVUV1NhY3lGRS9XR3I1d3pvK08wd01SRkpWbDZybHpQWXVYZGhXbHly?=
 =?utf-8?B?a056bFZ1TSt3WGxPRktsbUtjZkVBcWNKWFNYdFo4UlUzY29oZm9mSEtERE1m?=
 =?utf-8?Q?mr890G84QQunuZKAyUK0yn++f4bkho=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e565c8-69b1-4a8e-1d9c-08dd49ecff63
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 16:07:20.2150
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1554

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDYsIDIwMjUg
NjoyMiBBTQ0KPiBUbzogVmluY2VudCBGYXppbyA8dmZhemlvQHhlcy1pbmMuY29tPjsgS2VudCBH
aWJzb24NCj4gPHdhcnRob2c2MThAZ21haWwuY29tPjsgTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPjsgRXJpaw0KPiBTY2hpbGxpbmcgPGVyaWsuc2NoaWxsaW5nQGxpbmFy
by5vcmc+OyBQaGlsIEhvd2FyZCA8cGhpbEBnYWRnZXRvaWQuY29tPjsNCj4gVmlyZXNoIEt1bWFy
IDx2aXJlc2gua3VtYXJAbGluYXJvLm9yZz4NCj4gQ2M6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJh
cnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz47IGxpbnV4LQ0KPiBncGlvQHZnZXIua2VybmVs
Lm9yZw0KPiBTdWJqZWN0OiBbRXh0ZXJuYWxdIC0gW1BBVENIIGxpYmdwaW9kIHYzIDEyLzE2XSBk
b2M6IGFkZCBkb2N1bWVudGF0aW9uIGZvcg0KPiBweXRob24gYmluZGluZ3MNCj4gDQo+IEZyb206
IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4NCj4g
DQo+IEludGVncmF0ZSBweXRob24gZG9jcyB3aXRoIHNwaGlueCB1c2luZyBhdXRvZG9jIGFuZCB0
aGUgaW1wb3J0IG1vY2sgZmVhdHVyZQ0KPiB3aGljaCBhbGxvd3MgdXMgdG8gYXZvaWQgaGF2aW5n
IHRvIGJ1aWxkIHRoZSBDIGV4dGVuc2lvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3og
R29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4NCj4gLS0tDQo+IEBA
IC01MCw0ICs1NCwxNiBAQCBleGNlcHQgSW1wb3J0RXJyb3I6DQo+IA0KPiAgaHRtbF90aGVtZSA9
ICJzcGhpbnhfcnRkX3RoZW1lIiBpZiBzcGhpbnhfcnRkX3RoZW1lIGVsc2UgImRlZmF1bHQiDQo+
IA0KPiArDQo+ICtkZWYgYXV0b2RvY19za2lwX2luaXQoYXBwLCB3aGF0LCBuYW1lLCBvYmosIHdv
dWxkX3NraXAsIG9wdGlvbnMpOg0KPiArICAgIGlmIG5hbWUgPT0gIl9faW5pdF9fIjoNCj4gKyAg
ICAgICAgcmV0dXJuIEZhbHNlDQo+ICsNCj4gKyAgICByZXR1cm4gd291bGRfc2tpcA0KPiArDQo+
ICsNCj4gK2RlZiBzZXR1cChhcHApOg0KPiArICAgIGFwcC5jb25uZWN0KCJhdXRvZG9jLXNraXAt
bWVtYmVyIiwgYXV0b2RvY19za2lwX2luaXQpDQo+ICsNCj4gKw0KDQpJIHRoaW5rIHlvdSdyZSBh
ZGRpbmcgdGhpcyBiZWNhdXNlIG9mIG15IGNvbW1lbnQgYWJvdXQgTGluZVJlcXVlc3Q/DQpodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvUEgxUDExME1CMTYwM0M0OUNDMEEzQjJFOUNBM0M5MTk1
OUYwMkFAUEgxUDExME1CMTYwMy5OQU1QMTEwLlBST0QuT1VUTE9PSy5DT00vDQoNCldlIGNvdWxk
IG9wdGlvbmFsbHkgcmVtb3ZlIHRoaXMgYW5kIGFkZCBgOmNsYXNzLWRvYy1mcm9tOiBib3RoYCB0
byBkb2NzL3B5dGhvbl9saW5lX3JlcXVlc3QucnN0DQoNCmh0dHBzOi8vd3d3LnNwaGlueC1kb2Mu
b3JnL2VuL21hc3Rlci91c2FnZS9leHRlbnNpb25zL2F1dG9kb2MuaHRtbCNkaXJlY3RpdmUtb3B0
aW9uLWF1dG9jbGFzcy1jbGFzcy1kb2MtZnJvbQ0KDQpUaGlzIHdvdWxkIGRyb3AgYF9faW5pdF9f
YCBmcm9tIGV2ZXJ5dGhpbmcsIHdoaWNoIHNob3VsZCBiZSBvayBzaW5jZSB0aGV5IGxhcmdlbHkg
bGFjayBkb2NzdHJpbmdzIGFuZCBkdXBsaWNhdGUgdGhlIGNsYXNzIGRvY3VtZW50YXRpb24gYWJv
dXQgY29uc3RydWN0b3IgYXJndW1lbnRzLg0KDQpJbiB0aGUgY2FzZSB3aGVyZSBpdCdzIGFkZGVk
LCBpdCB3aWxsIG1lcmdlIHRoZSBkb2NzdHJpbmcgZnJvbSBfX2luaXRfXyB0byB0aGUgY2xhc3Mg
ZG9jc3RyaW5nLg0KDQpJdCBtYXkgZHJpdmUgdXBkYXRpbmcgdGhlIGRvY3N0cmluZyBmb3IgTGlu
ZVJlcXVlc3QuX19pbml0X18gc2luY2UgaXQncyBmaW5lIHRvIGNhbGwgbWV0aG9kcyBvbiB0aGUg
b2JqZWN0IChhbmQgdGh1cyB1c2UpIHdoZW4gaXQncyB0aGUgcmV0dXJuIHZhbHVlIG9mIGEgZnVu
Y3Rpb24gY2FsbCwgYnV0IG90aGVyd2lzZSBub3QgT0sgdG8gY29uc3RydWN0IHRoZSBvYmplY3Qu
DQo=

