Return-Path: <linux-gpio+bounces-8211-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5A59311C4
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jul 2024 11:55:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92A551F232F1
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jul 2024 09:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213BF1862AB;
	Mon, 15 Jul 2024 09:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="pMaXP8yh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11olkn2090.outbound.protection.outlook.com [40.92.19.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA92186E5A;
	Mon, 15 Jul 2024 09:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.19.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721037341; cv=fail; b=BWeDgmJ9JlSbPC4CDR4xyGJWAy4Dfu7u3+icfRJNxnInke92Y9FjvGrvwgDEzcyAtQR2aWZSYxYl56aWPRym/jdrbcrwHFy0cyfC0a3NzBP96EjqMAJV8tZE5CppfWpg4i6Pq4OZTmpZYpqwT5MSawuHYbyCQ4fdw9IZfCS+QIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721037341; c=relaxed/simple;
	bh=vjoDJ+ABpY/fdhXG0AhwS67f7qhMAMmd+uuB85YLQmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eTP3SU+dUkBSkv1nUjMgAx75XC0jNwwC10fhpPvOhPt7b6KqSLwxovFQKGSMMob0Ky4xGvte5CsedYvf0NdCo4woTKTqb/qBfoPZKeiFuXWMVrD8RYy9Z7XIy7RUEY7ZAlk6ly02MghNgLczd3uNKy/Hvm1mhOb5T3oy0ErU4nM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=pMaXP8yh; arc=fail smtp.client-ip=40.92.19.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AytiRvxucew1j3Sd2WuYsb1pEoaQhTAlQ7fymR0hR5pEzGRDqisjpxaToKcdnizznfBMB0uN5fNltxV3yD8E604xNRgD74E+mWhYqsNCT0G/Y2rUWhrCXgktanprjHhLH//DzTmsE6BF+/bjlIccuxevsd8DeTRcq1bSJD6o+ZdB/7IdSL61qOlbWLujxO5VkWJA6PXZxMGVnb5CjBgvh66zP5MFWrqBjzVj7ioCdx/4/TSpIdSJ+RRfrf6GuUtfFzGQcqY3zsWJHMGi805aLqbwAVOx9auSUIVTXb1+QlgI0QfCGLcPBe6ri4rLVg1QvStK/xUA4VMJtOYfDHk9WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXbRPM4k910M6CJJrKdZtbupcoj3xxTHZZEkQWBCpS4=;
 b=V17my1SfEXWG9anP3+RleVG9mrD0AMSdJlfQRVnaPhT/mgftFByf320+QrIJN6V5DCYvo3Rdnn5+D2P6F1OdPiIjiGK8i48GWbyP5MBShY0DiskfCsXGrzh3QF/+0gP9V0tlBPwbRGXGFwoDR1WBcxgWFl8kw+c80KaunC5WRKuRluCzv0JFKwlyYzTqBrL/hOukGD7MQPht01C83OxUWC+aHGIXAlW01DhZ1huLePXPbZRnCzZfBqiw7kRt3VimBmyqRKpS/SclBGDSpvOia3Ie0jurWf0W8Kp0oc43ttQ0D0lAGiDzf4srMHy2dQEjd6++kV0XuTcpjbj9d3cN0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXbRPM4k910M6CJJrKdZtbupcoj3xxTHZZEkQWBCpS4=;
 b=pMaXP8yheBGe7K6/xW+vlyAy9d593XUxadopwJ5VfnhxgNp2Gg/N8Vq6ytbdb1fxBNQ2fBY8wszXIw6i+6hykdL105gExqVhKXQF839mEO8cKzP9oQlMIci7snInG4uvs5jIGQA+M32eT9ShwSFmfmxsh5elv3YyYLwyM3XbJNFyDlK/cfk7HUOPWycpTbHk1CMuAQvVGRudPQFc6T3hN3WnMF1Wdcm/+dKthKOU6YRjUEK4pwunkDrs9J4YzmuFTfx0zS3MqJ+8kIUfbzG0VVVWMu39PZE3xKB0f6lyfCEgDmc1MFVEWw7R5zM7sWMufGc3Lfk1ZXY3VCPBPZ8hnQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DM4PR20MB4872.namprd20.prod.outlook.com (2603:10b6:8:a5::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.25; Mon, 15 Jul 2024 09:55:38 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 09:55:38 +0000
Date: Mon, 15 Jul 2024 17:55:28 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pincfg-node: Add "input-schmitt" property
Message-ID:
 <IA1PR20MB495302FAFD2003B831342CF4BBA12@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953BB6E71CA3216E652E8B8BBA02@IA1PR20MB4953.namprd20.prod.outlook.com>
 <e74d1c2f-576d-4d97-89d2-5bdabe00fb58@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e74d1c2f-576d-4d97-89d2-5bdabe00fb58@kernel.org>
X-TMN: [RqD3kWIYmwMfttqBZCn9wLbT/1Kh60jzmSlXLYSvqVo=]
X-ClientProxiedBy: PS2PR03CA0001.apcprd03.prod.outlook.com
 (2603:1096:300:5b::13) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <tvtslwvaf4pe3lihta3xbnjan7jn6225ottv7l2sww3lzz6ujw@mmfab3g6nifs>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DM4PR20MB4872:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c9a5490-d101-42b0-5851-08dca4b44767
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|19110799003|461199028|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	MAp7/4FOgQcRbtd3wvj8MXbwWF3uAPd32xewQBp2pqptqZHnt0yxgfq2egbAkk3xRC0TNMMHi35TUzly+II2bUr2+etRx3cQIrY2Bq9MAbBytJHL+oIRovYjr8Am/4/Vrxn29cVn5+KC7y/VPMgDP6r1KWuR+WGJy5JL6PWHHo2SifdIGE/9m0MEDBRcDWhzS1fGnUh7vNuqhmtkXIrpENKg+xYJyOU04e410kg6aY6Auc6934GRQYtwYbjea+vrakEvDvyw8Sp2f3YK4PddkI2eTV5h1dCJ5L9vzzn7TVwqswf0/X6DPKAu3YrHpG4AfuppVHLc4wuqqGjMuouWLkx0vs2QSDT0nL1UThlUy/9X7hCHmNrHBqZMPkutwojR0V+N6MxGHaxYTi17xm8Cj0515XjidmgDnp0S1jjIar+SaIJTzSrW/NXYpSKFr/ilg5GIZxbF3OR+voc2SYYGMx55JVjfERhT2X65uDUPIf5u1tm8lJqt/s2UAxKrwUi8YN/xpx0s+4aTn9rCwPuoCuSCJA93ExiowC0lBzFoP+wzwzXkmWcyT13ovUIgkd987e3Y5Ip2rhyCmyKjmA8XfeLf+Wi7TJ1iB66jOnXQ8/L/4oecG6PCIUACYRjw1umcJIf5tWGlXi7en994q7SLsRsfeDen+Eahudsbjkcm3FzC4cPmBz9i29ABU0UiQfbI
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qSSOUu5KWYpbGrnTOtdWEmSuH1ZNKD1rnGSUuzanN8WeBd+G1PoIWObOvUvv?=
 =?us-ascii?Q?H7wom2oDsfbVeUCbDg5V2IAaPWj4KnWLi+ediOUeFeLhcpsdf6lrxk8hh7I9?=
 =?us-ascii?Q?xPhXGFJFb3td3FOla/5+JTCtDaxbPp+SafyJypHs+qlxysIHFRcSzs1ZenvL?=
 =?us-ascii?Q?bIAJ3Ng62uuaMmI3DSGeAxbnJAknAM7b28s3drVdzzXhCcjfx3xycMrh7Bvt?=
 =?us-ascii?Q?bIHuGYMn+qWRDnTuLy9HQJhtmHiyb1Y4EVf0NtZ5bk3hUqaA3eGIJY62spoB?=
 =?us-ascii?Q?VAjefrNl10TQ5pR8STB5H63PdbZ0tlL+AFVrgnQ2AEZ9kuBQv8znnj/RgdBy?=
 =?us-ascii?Q?/oVMYFhlxif6zNGTYF35L9NW8lYSVNx5CnCyBrGl9et2nF1MffJ7rRLw9vkf?=
 =?us-ascii?Q?HEyJQwM2KxmB4U8Ej+jscK7vHSpO0+Lk9jA7LMD3B6p8xmlroA7wqhSniMCw?=
 =?us-ascii?Q?cWt7Yt9J+skiyWEftNjSkeDaweLI+rW7fdSIuzJ9/kV9Oe/ZGt71NOnpeiEJ?=
 =?us-ascii?Q?V5gNnwK8OlCK5Nb86xfzwyqa2b8Rcr6pn8zqfBixuEiIf2kw2a/9Cu9V8nEb?=
 =?us-ascii?Q?Cwatj4w3AMSU3SmBoFvDOg6GqVuKL5INWtEqx+AZIHvIf1JDTODlwfVLKPh+?=
 =?us-ascii?Q?4cbDeZ0peVxpNwXh7T7/8RPy8L+IwFquf8zOiaLAhC11oFX7KghFqowdcf2G?=
 =?us-ascii?Q?XLBeYHZP8cCzbwmqUPPykKnBC1VgvrJTbFMCPES/XXQv/x00CF4Y8zox5Cc1?=
 =?us-ascii?Q?8svsrvEn3YNQMJO3dkXCd4yor24aToovHQ0n8lWasDRaWc0yFDTXo9UTIYl+?=
 =?us-ascii?Q?XUSJZ0ox4zYbNAVxnAv5yXS3HxqbR4SFaaORdb3BcwGKWV9P8+RgSNSe8207?=
 =?us-ascii?Q?WIC+AToMroVv6NFHo80kMu+0iqGaDS6SUishLkgjaaX45nT1ahdC6lcZJSod?=
 =?us-ascii?Q?fZiRxUUxbs6aZRYXpNtV7fMk1rMlyu4vtbw30ePl0qTHCoVEZ4Qt2rpG7z/7?=
 =?us-ascii?Q?at5VcvptEn30XFVQ/fuQhistcdmy0JMnnbyk5qolAg5feawsh86MQjrCrtKn?=
 =?us-ascii?Q?qvveo5PwVfRnlLMY3Ls77OysyBZVe0+cHQN3IQ9aSpG83cg/E3hz6zmy46vE?=
 =?us-ascii?Q?ZnaTmsSiuLPL4ktzuV/G6KcGH5nPkt51lk+BMVN8sMhVQbnU+BgWnMoMPQ/1?=
 =?us-ascii?Q?MOY/lL3c0F3LtQfbDdHFw0AJlh6M2Ov+f7URLscmOJk5e0+w7Z03U+5uDxaJ?=
 =?us-ascii?Q?hEAd2+Xu+PNwgT+UOtes?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c9a5490-d101-42b0-5851-08dca4b44767
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 09:55:38.1175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR20MB4872

On Mon, Jul 15, 2024 at 11:21:25AM GMT, Krzysztof Kozlowski wrote:
> On 14/07/2024 13:28, Inochi Amaoto wrote:
> > On Sophgo CV18XX platform, threshold strength of schmitt trigger can
> > be configured. As this standard property is already supported by the
> > common pinconf code. Add "input-schmitt" property in pincfg-node.yaml
> > so that other platforms requiring such feature can make use of this
> > property.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> > ---
> >  Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > index d0af21a564b4..e838fcac7f2a 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > @@ -88,6 +88,10 @@ properties:
> >      description: disable input on pin (no effect on output, such as
> >        disabling an input buffer)
> > 
> > +  input-schmitt:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: threshold strength for schmitt-trigger
> 
> Strength in which units? This should have proper property name suffix.
> 
> Best regards,
> Krzysztof
> 

I think it should be mV. Using voltage may leads to decimal.

