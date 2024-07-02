Return-Path: <linux-gpio+bounces-7872-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19903923B8E
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2024 12:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EF441C21E5D
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2024 10:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9893A158A38;
	Tue,  2 Jul 2024 10:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="q53vk/0U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2052.outbound.protection.outlook.com [40.107.104.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8E1156F5D
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jul 2024 10:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719916547; cv=fail; b=AcRF/SkhrEyMBKsKfnZubKSbv3WSTaziOJDY3EFEK9WJfAhnYwYjaEO+IjTAidOsWuOv6ZOSYxqjQFmNWxKQ1kO8rl1ukRhuyUxHCx9fGRLzzGajzK9eEx7L6jrRslrLKl34AxXVf0sTt03mqpa0AnFgpY3Gff1uNh/znDv8Tjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719916547; c=relaxed/simple;
	bh=9hn5lCCwJEWLEaKF+YkKHM112o+0t7YTAPm4fFXzLQk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WaefTXTDJBewlT4/QQdDCQNjmqmPWB1rjWitvnszYktBHDF+I+3UIDHi7iZatY8ZLft/+M0vrwwMs6iWIhP3XouZ+acEVsDUnd37C2o2w2lnstUk1em9C0SjEH69sWkM2zjvbOt0w4eqgCPY/56JO/VRnkw8KwIqOEPaknlpwd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=q53vk/0U; arc=fail smtp.client-ip=40.107.104.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHVSgjcLZE/hBZRCLBMSLaKFngbqcE0DXIOVWP8n+CrWWbPSR19m6tYvsAUSr6aNM0AG4U35kGVz/hkXQmUMQoUlIlaJ4DE4lYWgRncjUp5OprRXsoVmg40vtYGfREhLCXTZZTFd5UqFSVRXikr8OqqE0S/KfiPDBtmVscpr5xThQGaPE2BN1bTqS244Q3TddswgjQWGRIkxnoDnjKfQX1mO+70OH+pDp2iLFec+BEBC0J4Ee01tzAJlvrfBdgbplrPJEdPTVDW408kp7z4ykeX8k1FxgCg6ikFIecz3+u4CM13Jck09gGzMQ3aw4ywld+vSUYUhBys2tH2zZLa3kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hn5lCCwJEWLEaKF+YkKHM112o+0t7YTAPm4fFXzLQk=;
 b=ZGvy33usrCAXL7Zc1NPOWodyxV+e7RQF7jeu/ugju9Qn9xylVa7b0uqQaYX69rHP3rvv5Pvoamux/+kfTKedjK9ax+/lSB93/CvJfXCPqV56ISxtSwDGWSIUuKASYWZsbDDWFi6DvsDXxyFqHpn8vh9R5P+wurph6RCxunFK/wbBos/+nuS9H7crYJbWmwoMdEgrczomNJMpbacm9x2Nz9u7MgngwoayIb3wDi05R3oS40KIuLKiRYVgrwhxKAU5Z7vBIwxvog4SOBvRy6kDEB5vJcPKZSKnxrYf8mWdsGA1xbpZHMwvrcuXDuVF3PDyt9pj+KR30SjJYM7/R4gziA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hn5lCCwJEWLEaKF+YkKHM112o+0t7YTAPm4fFXzLQk=;
 b=q53vk/0URvuuneuilqjDl4V4y3HuHAPSwhbBAgRYC89oOzcWvnxhC2eksx1alCQKSuRhw+zdbTXGKEdFIMabWFYlVdirWMzV0b/sK8ZRKhQX1Sm5HckMGj173ZJCOV0WRbwj8JCnDfksXllxHkhEbrhxDB8oNBga3LHpO7i89sXrZRXHNr2aq5dTbzRekf8XXC6wwIp9gMEogrqEoPx7Tss+wcd1pM6CdnR0ImsCNSbP1FclDWE70WctW+ypifxmyOdDcDoTt8QrQom0ivHiy82WgsmqdYmeiGm6eVe6XyWXMHQU3dk3fY/+MTxmQLmPrgzquC/qSYr+fPWhobEYOg==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by VI0PR10MB8427.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:21a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.34; Tue, 2 Jul
 2024 10:35:40 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%3]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 10:35:40 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "thiago@kde.org" <thiago@kde.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>
CC: "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
	"warthog618@gmail.com" <warthog618@gmail.com>, "phil@gadgetoid.com"
	<phil@gadgetoid.com>, "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>,
	"erik.schilling@linaro.org" <erik.schilling@linaro.org>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"dbus@lists.freedesktop.org" <dbus@lists.freedesktop.org>,
	"bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RESEND libgpiod v2 10/18] dbus: add the API definitions
Thread-Topic: [PATCH RESEND libgpiod v2 10/18] dbus: add the API definitions
Thread-Index: AQHazEtUhMYwPPPQTU6r0xp/LAvubrHggmKAgAJ8yACAACaRAIAAAlyAgAAWe4A=
Date: Tue, 2 Jul 2024 10:35:40 +0000
Message-ID: <398ba49ba14f78b2a582f52b60b4ca6a616ae4c0.camel@siemens.com>
References: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
	 <1917470.LkxdtWsSYb@tjmaciei-mobl5>
	 <93346bfc3647d24f1512e79088b26f804fbc228b.camel@siemens.com>
	 <1867994.25eIC5XRat@tjmaciei-mobl5>
	 <CAMRc=McaFTy+csg+1McRjMNDkYond74VSrJsQ3mETp7dJoNtnQ@mail.gmail.com>
In-Reply-To:
 <CAMRc=McaFTy+csg+1McRjMNDkYond74VSrJsQ3mETp7dJoNtnQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|VI0PR10MB8427:EE_
x-ms-office365-filtering-correlation-id: d96b4b81-f9ee-44c9-a1ae-08dc9a82b7f2
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dHd2dDJhMDQ4YUxoS052U1hZTmRobzhYZnhlMHByanZkSlVVSWNrVTUxRkEw?=
 =?utf-8?B?QzNwRE5SWG83SExab1pjSXFqTEY0eU9Bb0p3MktGYjVtQkdDZzhGcnFUSnRr?=
 =?utf-8?B?RElKVTljMFZZbUMxT3V4SUs3Q3cwVTFWLzJsYlpIZkRHMnM1bjduME8zaExV?=
 =?utf-8?B?R1FTYWpacWpvMlBROXJqOWVxdVR4eGtmRGlCTWZNNTVJSUsrandrWS9FZVN5?=
 =?utf-8?B?bDJTTEFUbWpSbUxnOU8raFlNaDlvR1J4VSsxalVhVE8weTRQS0lPckxkKzFa?=
 =?utf-8?B?eGFNVFNHZWQxNDB6ci9YaFpBOXFiL0cxVXpmVlFlTUJaaEM4M2JtRXByN1Yy?=
 =?utf-8?B?V1FTRjFaSUYwbFdQNkRrcWdEdGxNMENsYjlxN3RVdHdocFNZRGF2WWdDcTdQ?=
 =?utf-8?B?RzVXa3dSQldxZ2lEVitTN0RNUHlaUDB4WXZLV3ZCdWoxUFlDeVdqN3pwaGRQ?=
 =?utf-8?B?cWlpZVBmZ1M2ZHZtZ1dJVnAwdWlOV2lQM2lYaHlLS1l3QkJhRHkyNkRvZk9P?=
 =?utf-8?B?VFJ5RXZVc25LV1ZoVmFrSm5iVmVZN0JTTjd5bkVEaDNCMzRtR1VlQUdnZkRn?=
 =?utf-8?B?bldkcG52MVJTbVYxTnNiSm1BSFJuOVFHamc2SmtZWEVxOW5vbElHMVRQb3F2?=
 =?utf-8?B?SW10Yjk5NzlPS1FLSmQ1Y040VHlQWXdudFk0V3lSZjRqYTJkeng5QjB3S21l?=
 =?utf-8?B?eTB1M2o4VmU2UTV5emZLME1SM3FlRVMxQ2VLb1RYMGRMNGVWbjBPS01GcmpG?=
 =?utf-8?B?M2dISlBGN1A4N1ZmQ2ZCM3NYYzJYOHRlUGNWTHNzM2ZEajZURm9KTUZXZFRM?=
 =?utf-8?B?Y0tUVTF2WkxoVndSQ0VPU3RScFlVN2xTK2YxM2s3TjVtNFQ5SWZIMmFHNUFI?=
 =?utf-8?B?STA1UlRLWGpkQWxRazRLLzIvWVlId0UrSTRwTGNkc085dGZWNWtzZzgzc29l?=
 =?utf-8?B?RmIySTl4V2FiQTBmWklaWSttMVd6OExtTWowZVVJZC9VVVlYTnAvcHZCbVVQ?=
 =?utf-8?B?ZDRVQUltM1ZVaXkzdXhpQUYza1JBZGR0a2pvZkxERlNBTklORDBJTFk0ODZa?=
 =?utf-8?B?eUhHVUIrb25DRUUxNjBtdmVJK1krUkNVQ1JxUmdIUHF4Q05zdTFORFhydEhQ?=
 =?utf-8?B?WHRjSFlFUlBWZmZLVndEemtOZUVLR2ExZ043dGNtcVdOK3VwNVdzVWNzS29T?=
 =?utf-8?B?MFM5dUlaVjJ3OWpWb1B6NUdyN1lTWlI3NnA4SHJ3TWliOExDcytnTjBFTkR3?=
 =?utf-8?B?aW16cjVwZ09iQnFaN1pRbWJzTHdPSTV6aVVQTWtQUlVaWU9QNWM1L3BYV2tk?=
 =?utf-8?B?UElMR0E0VG9wcXhFRitROHBTeDhwQVVrMFNXZkJDRENvRGh0SXhrVEV5TjQ0?=
 =?utf-8?B?U0JSRnV3Uy9GWVlqMVVnYy94dHhXNWJGaVJtMC9qTm4xUUVCQzVBRjc1b2l4?=
 =?utf-8?B?aVkvUC8yRFJMSndzN3BIYVJ4VUk3bTRuY2xFUnN1Q1FJbDdBcXJsclEvaGw0?=
 =?utf-8?B?ZjdSK3BvVVZuVHNxMmFlZUdFVjF1RER1a2FpYXZzdm5waTlnY08wWk9jL29o?=
 =?utf-8?B?UHNRR1hTUzVKNXFyMGNnZlB6dzVUYjlSNVhiMWcyMEYvaGc5M3Z3U0dSVFZO?=
 =?utf-8?B?Z0liMzRqUVFvUUVzcFZrNTRoNy9pSkFiSFF0bnlyVDRwVG13eWpwQzVsV3JN?=
 =?utf-8?B?R0RUUnpIMlYrZGlQak5SRGI2VCtNOVhJc2ZFazZkODJOc3lVNDRNMUFYeUox?=
 =?utf-8?B?Q0V0NVBWTy9seUFkazQxbzZGVExSc2pqT2hhM01yblBlTnZ4amFZdDJORUlH?=
 =?utf-8?Q?mrT7AOo4xvmV8aQEsSu1VDR/2r7+H0IE7tix0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YmpYOHZhNTlzbE1hOEJnWFQrUXBNemRjUC9NSjA2TExIY0JrU2pTb0h6TVQr?=
 =?utf-8?B?dEtlUkdzR1N6MGdINlVjRDVQMWhPdy80dTRLUE9KT0pDcml2YldubmwxdFl6?=
 =?utf-8?B?UzUxVGRaRWVaeXVNZGcwdkpOajhYWlEwVUMyR2hUTzJOT2haNDg0ZE5jRUtF?=
 =?utf-8?B?akhsSTZkWG5VOUIxbDNINkpVT1RyL0pQM296cnNWRDNXL0VUVEJXYnhzVEFs?=
 =?utf-8?B?ejE5SFRMd2RjdStRb09nRjdySm1ZeGhTclJzUmFTbVY5UVI5UXJFMTZTU0Zv?=
 =?utf-8?B?VTNjSkpoNGpoUGM1dDAwRkUzUnJnNDZPSFdURDRqRFF4c1pGblVaSm0wUFl3?=
 =?utf-8?B?NzdpQ1JvQVc3aVVGZzE5cUE2MUpWWElQbGNFdnlVWGpaNUhYdVRXdndMOUFT?=
 =?utf-8?B?TVNDcHY1VVpsb3Q5WVdxcXRNcEMyUTNhN3RySVlFUGcvU1hYRXIrYm9hdWh4?=
 =?utf-8?B?SXFPQjVXZnF0SzBJZnNDUnd3bXk3MDVGWWxwSkFRYW9EZlk2T3prZEE0QTR6?=
 =?utf-8?B?Qmp5ak0rU2d1WmdPS0Irekc2SjRWWk9wRG8zR2lIN0QvaXBLdkU2Ni9mQUlF?=
 =?utf-8?B?dkJIU1hkMmJXYTZrNXErMjZwbVdMTElIdDJ2NmlxNEJTMnhVV2xZSC85STUx?=
 =?utf-8?B?d0ZWRTFBK3NIZHE0V3NnREJaMjF1UXlDOFRSTm9BRTFQajZMNzNoeUhZOXNH?=
 =?utf-8?B?bzh6MjZEbUo3UjNIUG5ydVdxOTc2ZDRnSGV6SzcvNnBwaHI5a21wcDNPRzR6?=
 =?utf-8?B?a3JnQUw1Nzk2WVhjSTNUcmpMbk9EV0RPYVZBUnFxUSsyK094N1dwVzUxNGl1?=
 =?utf-8?B?eGswOWpQdkQzaGRiLzBJY2FTbGZabCsraUFIUXRlbFV4N1ZhL2VNRWVzMDda?=
 =?utf-8?B?Z2g1ZkxCTklTL1RjbEtkM3NKa21CQ1B1dStVZlVGZkY2ZU9PaFYvZlIwMENz?=
 =?utf-8?B?bTVNbkRqTVAxNGk2RUhaRUp0ajlQc0hqTXpWNVNPQktYNE00bjhCTzkwcmRV?=
 =?utf-8?B?c1BCbmlzT3FFcHdFT0h4a0RBWnBoWjVSVWVhdFA4bG8xNk5SQUNha3VTOHhv?=
 =?utf-8?B?SjRZenJBRVpsV3VDRzNUWVpPSVJkeERudytubjRJZFRrWlk3MUl6Q3VQQ1FN?=
 =?utf-8?B?WkJtNS9YQ2xzWldYcGxsSkFOaDVleTB4U05YMEY5UU4vNGVUV0p1RkVFQkhU?=
 =?utf-8?B?VjdpNXo3YlFWaWZEL2JFajVyaE1qQ3BESnluMVRiMVUwU0N6bE5iS2dTNUFV?=
 =?utf-8?B?dURBTk92amxZaUxEdjZiSDNVcTVPL0NoSlNZL3ZLcnBZbFZEMnh1OUtGcDNJ?=
 =?utf-8?B?YzZ3aHhLRVFFZlYwL1BCZm91S1hXQURZa0FYWk80Mjg0SjhRaTM3RlFVZUgv?=
 =?utf-8?B?a0pTK2pGSGROSlNBaTNmNmc1V2VsY2FrQkpUdnNSSkZuZjM3YWhEL3h6L0pP?=
 =?utf-8?B?RjJxeFpkT1hzc20vaXVDMFo1aTJUY2Zmd09JdmVEelVvSnVxbTJjai9zOGlz?=
 =?utf-8?B?V0pwR2J4T2Fxa1VTL3pyYy9xV29ua1A4cTBnTC9xRXBWRHZlTmtXWVdJRHVK?=
 =?utf-8?B?MjNGY05OLzNreXBWbmwvT0twalV3ZWNDZTUrTkh6YVhlb05MQWJOeWZIbWRi?=
 =?utf-8?B?NDhOYU91SkhLSkFoK3Nxa2RuL2gybVF5NEdXaGFVZ3VNYTd1S3dYaUJhclNM?=
 =?utf-8?B?WjZzTG0ycDJKVzJWaHoxSUJrblRuNXNua05HWmVpRjBib1h6UTJQNU02Qmts?=
 =?utf-8?B?NW4xcEtyUzFOOXEyRFhGQnl0ejBLckNRTjVORnoxZHRPbTR3eW5nL3E5TDBO?=
 =?utf-8?B?Z0VlQVBRWDFkSGhIbFhEY2cwcUE5a09UZWFMcHdtaVpNc1VqMVJWMEs5VFBX?=
 =?utf-8?B?MFo1YisrazhCNUhOK3V3OVdiNUZUY1RrcVBiSDNGbllJNk1GNkpHaThmamhi?=
 =?utf-8?B?RTV1MG9IWFBVdFFwb0VKRDdtUy9JRDBRSUJES3dNakNmaW90Ti8yemlWVHEz?=
 =?utf-8?B?RUhuM0k3Qi94RXBCTmRwaUNXS1Y5ZEUyVEw2UjEzUGxYR0I1NjRuRTB2MStV?=
 =?utf-8?B?RC8vM1Q4aTdIcHNiNHdGMGZNbkdmekNTbGJreW9RSk5sUkZwRWIyaDFqVzlN?=
 =?utf-8?B?eWVteUd3MFNsRTRPWFJaUlRDRW5WSGdrSk9seHk2bVJRNzhEcGdKS0lobWdw?=
 =?utf-8?Q?3wbyBOutbCzUeK0sqTX50OI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBDAC44254842E438943F313519F22C4@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d96b4b81-f9ee-44c9-a1ae-08dc9a82b7f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 10:35:40.1864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tvD8BNTbOvlj1pXVinOwo7xAVj09TGlyKYDqGBUftU8PZlRzTuTsyAvKKogxmWAN6rKYmHQHlb2L0RZjho8BXr2wJhhtxrCxPtydGju5hUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8427

SGkgQmFydG9zeiwgVGhpYWdvIQ0KDQpPbiBUdWUsIDIwMjQtMDctMDIgYXQgMTE6MTUgKzAyMDAs
IEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6DQo+ID4gPiA+IFdoYXQncyB0aGUgcG9pbnQgb2Yg
dGhpcyBwcm9wZXJ0eT8gSXQgbG9va3MgcmFjeSwgYXMgdGhlIHVzZXIgKHdoaWNoZXZlcg0KPiA+
ID4gPiBpdA0KPiA+ID4gPiBpcykgY2FuIHN0b3AgdXNpbmcgaXQgc29vbiBhZnRlciBhIHRydWUg
cmVhZCwgb3IgdGhlIGxpbmUgY2FuIGJlY29tZSB1c2VkDQo+ID4gPiA+IHJpZ2h0IGFmdGVyIGEg
ZmFsc2UgcmVhZD8gVGhlIGxhdHRlciBjb3VsZCBsZWFkIHRvIFRPQ1RPVSBwcm9ibGVtcy4NCg0K
QWN0dWFsbHkgSSBkb24ndCB0aGluayB0aG9zZSB1c2VycyB3aG8gYXJlIGdvaW5nIHRvIHJlcXVl
c3QgdGhlIGxpbmUgd2lsbA0KbG9vayBpbnRvICJidXN5IiBmbGFnLCB0aGV5IGp1c3QgbmVlZCB0
byByZXF1ZXN0IGRpcmVjdGx5IGFuZCBbcG9zc2libHldIGZhaWwuDQoNCkJ1dCBmb3IgZGlzcGxh
eWluZyB0aGUgc3RhdHVzIHRoZSByYWN5IGZsYWcgaXMgcGVyZmVjdGx5IGZpbmUsIGJlY2F1c2Ug
dGhlDQppbmZvcm1hdGlvbiBpcyBhbnl3YXkgb3V0ZGF0ZWQgYnkgdGhlIHRpbWUgaXQgYXBwZWFy
cyBvbiB0aGUgdGVybWluYWwuDQoNCj4gPiA+ID4gV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIGZv
cmNlIHVzZXJzIHRvIFJlcXVlc3RMaW5lIGFuZCBnZXQgYW4gZXJyb3IgaWYNCj4gPiA+ID4gdGhl
DQo+ID4gPiA+IGxpbmUgaXMgYnVzeT8gQmVjYXVzZSBpZiBpdCB3YXNuJ3QgYnVzeSwgbm93IHRo
ZSBjYWxsaW5nIGFwcGxpY2F0aW9uIGtub3dzDQo+ID4gPiA+IG5vdGhpbmcgZWxzZSBjYW4gZ3Jh
YiBpdC4NCj4gPiA+IA0KPiA+ID4gdGhpcyBhcHByb2FjaCB3b3VsZCBtYWtlIHRoZSBpbnNwZWN0
aW9uIGl0c2VsZiByYWN5LCBpc24ndCBpdD8NCj4gPiA+IEknbSB0aGlua2luZyBhYm91dCB0d28g
aW5zdGFuY2VzIG9mICJncGlvY2xpIGluZm8iIHJ1bm5pbmcgaW4gcGFyYWxsZWwsIHRoZXkNCj4g
PiA+IHdvdWxkIGRpc3BsYXkgR1BJTyBsaW5lcyByYW5kb21seSAiYnVzeSIgZXZlbiBpbiBjYXNl
IG5vbmUgb2YgdGhlbSBhY3R1YWxseQ0KPiA+ID4gaXM/DQo+ID4gDQo+ID4gQ29ycmVjdCwgYnV0
IHRoZSByYWNlIHRpbWUgd291bGQgYmUgdmVyeSBzbWFsbC4gVGhlIHN0YXR1cyBhcHBsaWNhdGlv
biBuZWVkDQo+ID4gbm90IGtlZXAgdGhlIGxpbmUgcmVxdWVzdGVkIGZvciBsb25nLCBvbmx5IGVu
b3VnaCB0byBnZXQgdGhlIGN1cnJlbnQgc3RhdGUuDQo+ID4gDQo+ID4gSW4gYW55IGNhc2UsIG15
IGFyZ3VtZW50IGlzIGZvciBldmVyeXRoaW5nICpleGNlcHQqIGZvciB0aGUgc3RhdHVzIC8gaW5m
bw0KPiA+IGFwcGxpY2F0aW9uLiBUaGF0J3MgYW4gb3V0bGllciBhcHBsaWNhdGlvbiwgb2Ygd2hp
Y2ggdGhlcmUncyBsaWtlbHkgdG8gYmUgYQ0KPiA+IHNpbmdsZSBvbmUgaW4gdGhlIHN5c3RlbS4g
SG93ZXZlciwgdGhlcmUgd2lsbCBsaWtlbHkgYmUgbXVsdGlwbGUgYXBwbGljYXRpb25zDQo+ID4g
dGhhdCBuZWVkIGxpbmVzIGZvciBhY3R1YWwgdXNlcy4gVGhlIGFyZ3VtZW50IGlzIHRoYXQgdGhl
IHByZXNlbmNlIG9mIHRoZQ0KPiA+IHByb3BlcnR5IGNhbiBsZWFkIGFwcGxpY2F0aW9uIGF1dGhv
cnMgdG8gY2hlY2sgYmVmb3JlIFJlcXVlc3RMaW5lIGluIG9yZGVyIHRvDQo+ID4gcHJlc2VudCBh
IG1lc3NhZ2UgdG8gdGhlaXIgdXNlcnMsIHBvc3NpYmx5IGJlY2F1c2UgdGhlaXIgY29kZSBpcyBz
aW1wbGVyIGZvcg0KPiA+IHJlYWRpbmcgYSBwcm9wZXJ0eSB0aGFuIGRlYWxpbmcgd2l0aCBhbiBl
cnJvci4NCj4gPiANCj4gPiBUaGVyZWZvcmUsIG15IGFkdmljZSBpcyB0byBub3QgaGF2ZSB0aGUg
QVBJIHRoYXQgY2FuIGxlYWQgdG8gVE9DVE9VLCBldmVuIGlmDQo+ID4gYnkgYWNjaWRlbnQuDQo+
IA0KPiBVbmZvcnR1bmF0ZWx5IHRoZXJlJ3Mgb25lIGlzc3VlIHdpdGggdGhlIGFib3ZlOiByZXF1
ZXN0aW5nIGEgbGluZQ0KPiAoZXZlbiBhcyBpbnB1dCkgbWF5IHJlc3VsdCBpbiB0aGUga2VybmVs
IGRyaXZlciB0cmlnZ2VyaW5nIGEgcGh5c2ljYWwNCj4gY2hhbmdlIGluIGhhcmR3YXJlIHdoaWNo
IG1heSBiZSB1bmRlc2lyYWJsZS4gSW5zcGVjdGluZyB0aGUgIlVzZWQiDQo+IHByb3BlcnR5IG9u
bHkgcmVzdWx0cyBpbiBmZXRjaGluZyBhIGZsYWcgZnJvbSB0aGUga2VybmVsIGFuZCB3aWxsDQo+
IG5ldmVyIG1ha2UgdGhlIGRyaXZlciBhY3QgdXBvbiBIVy4NCg0KQW5kIHRoaXMgaXMgdmVyeSB0
cnVlLCBiYXJlbHkgYW55b25lIHdhbnRzIHRoZWlyICJpbnB1dCBwdWxsLXVwIiBvcg0KImlucHV0
IHB1bGwtZG93biIgdG8gYmVjb21lIHNpbXBseSAiaW5wdXQiIGp1c3QgYnkgb2JzZXJ2aW5nIHRo
ZSBzdGF0dXMuDQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cuc2ll
bWVucy5jb20NCg==

