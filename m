Return-Path: <linux-gpio+bounces-15783-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1189A319A5
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 00:43:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14EDC1639A8
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 23:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10C726158D;
	Tue, 11 Feb 2025 23:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="QqWT20Qg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-BN3-obe.outbound.protection.office365.us (mail-bn3usg02on0061.outbound.protection.office365.us [23.103.208.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC3A27291F
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 23:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.208.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739317387; cv=fail; b=sfWXPySIqmYFCDTnObMxJzGyuy5JmX0CEPN9bxhg3R7E8u+gXUQTgjobQEpwEvo2ROk8238W4+TdIbP5r/vxFpoZqWTF5iSDM4HJwH/Na0vanGjxsPeGQpM8gkzFO1AKKbW05Az6LWq1ZL1BlZb9IYQYfotL1PriOyZqMaF3lXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739317387; c=relaxed/simple;
	bh=q1Zk6NobVwGiUBFtXj69fbcACywpbWuFF0wOo630hlA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gx/XdU59wKFtxPCwgOkcAjpRif68JmzIULiePcIFFgEzn36Uy9VdEhYCJIOOG+yaIzV96mcUUrzbSnju0YOdwQQd6PNui6azvfYUQkbz1kouVwna4N0YAd8ZU0rB/TfF3xewvlx+iT9/CvfJFvglUOpAFyZRz1ROhCMigksb+Rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=QqWT20Qg; arc=fail smtp.client-ip=23.103.208.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=GHTkFpGZWdKx1+zfnhJHyzrfJJbJ79MYV/GKZ33619Oix4UVKo8D+XoQ70wlul/pf9Vd80SkQL7xIIvDLliTVMnZVNbQtCkhm4UIiitzEzlBtV8iXi975fJrQ5PYGShRLW2d0WnYUgfw8sZFI6E1dAzfV6XxeckMRBoEwz+y6VZV+BH3SkIx2yb/Pir56+xWEi6nZExZC0nvkYkI9AstQCKBe4BYcZ1mIJNbgfZylNjkHdezPELGksQiC1yPR4zAix4buF9XdDjIMXrtBd+hP5Qk27TxqJWx6MNEegPXnb708xAMOVaNX5sl4t3RlOcqiAp/+S7569vHJMTgrlSwYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1Zk6NobVwGiUBFtXj69fbcACywpbWuFF0wOo630hlA=;
 b=MPy5Unfu3oz5xt4+BcolvvOscKrJAFHSddkYEvMmqa/g02+T0KD1Q4CMUmz80Ss9OXbqA6ruQmG6woVpOsmpjaj9hS4d4pxlR1g1d0o/SeMs3XD5AsOtXq+IAx/YYu/G1yeppG2HpEtiGaaGiHrflx3BuGXaK/LQp2YxXQaijVYe/izzaldO//8dMAfW6radAHWN/M3lL9/3FyBNgieeL0+Hnm2+52nYEks/WmJH2EfVflLa+mTo8EoBMQiELoE8K4fsk6fS98ChITdkiMIHP5Xms8MBZ85I9gb2WJZlWlJzdPj3LqMyC1Y0G3ILdgcpQFq7HKSheYI1AdK0Qg+n3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1Zk6NobVwGiUBFtXj69fbcACywpbWuFF0wOo630hlA=;
 b=QqWT20QgkPk41wtU9xbIrkMUNpqPUDBGJPE1jVTl/PBg9c+63DY1/RhPOAIeBK6aPMxJuAQFT7xW/p45Co2MyPQPyt1Mvs/O3Fh1Hwl5gH+L6E19vYzUbyiEG/nN1wD3nK41/B/QX0dTC0kxfiVcyn6/Ry83wq0xmFFqBCgsYmnmg3wf/tH8lvh3Dh4C8OJoMTIDXKCikt6Mmdqma7N0TP918+cWw7Df8UWqsON73lSh99tc4I5IO0dPq4sAqf61ojnMH1iJErhlNqjATWPN108KN0nckKSsSVoJyofI9UeZK3t7OYaldTlVpMvxa5UxF9C9rzad+f0OkiiP6tbWlQ==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1682.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:188::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 21:09:44 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 21:09:44 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>, Erik Schilling
	<erik.schilling@linaro.org>, Phil Howard <phil@gadgetoid.com>, Viresh Kumar
	<viresh.kumar@linaro.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH libgpiod v4 00/17] doc: improvements for ReadTheDocs
Thread-Topic: [PATCH libgpiod v4 00/17] doc: improvements for ReadTheDocs
Thread-Index: Adt8v0kUw0qa+0tUToeOT1dxRWULZg==
Date: Tue, 11 Feb 2025 21:09:44 +0000
Message-ID:
 <PH1P110MB160347990EE30EA7CE8F79589FFDA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1682:EE_
x-ms-office365-filtering-correlation-id: 6e9d8389-ad0c-4ade-0ae7-08dd4ae068ae
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cXFEU1B0ZmIvNkhyem02WWcwY3Qrdjd0Uko5bzRZYVNXbjgvNGNKTVAvb1VP?=
 =?utf-8?B?S0c1alhZYXdKc0VOaVZBVDBvWlZ6UkZ1SGtDZk5JVWpBTTZvc011Wm4xSGtk?=
 =?utf-8?B?bFdpejF3eUZ3dUdQRkdsWkZSRGlRaHZwMVlyRE01K1VGN0lrR0xRMWVONDJj?=
 =?utf-8?B?cjhVVG45cUVsM3lHMDRPT2RpSkRQaW1kUml2Rit2Q2VwVy8vYTMvLy9VMURp?=
 =?utf-8?B?cXh0cVJ3TU1SUXBMdHlHY3VMc0NuNGpYN3YyUjl5OXhTWXh3QnZKK0VadU1l?=
 =?utf-8?B?N1J4amc0ZlpxeElPVkZsb2ljZFFvR3lMOEh5dVBJTDFDdGhxaTIySWhPMkFa?=
 =?utf-8?B?NUFmS2E1TXY4OUw0ODdEY2U0a3BQTDdqMk5EanJ5YUxTZVBDVE1Ldk8vVVdq?=
 =?utf-8?B?RDBEQmZMODF3cmR0UjNCYi9nWmh1ejVHcjQyK09FNUc1UDRvTmVqK3FGdVdX?=
 =?utf-8?B?aTRUbHNMOStITVNOZnRuM09id1paZTlVV1VheEtoU0hOb0RGL3Rqd0d6dXg0?=
 =?utf-8?B?b3gzUU8zVDc1bS91MGxrSzYxQytuUHNaYXIyQTVXcmVjS2toWUloSkhuY2tN?=
 =?utf-8?B?cHN3eEhRZmdXaDdqd1lnU3dpekVvbnJrMEFhY2ZsL1AzK0plZmZSSGZVWUcw?=
 =?utf-8?B?blIrSnFEbWFPbzA0TWJiaTFZR2JKcVI5bkVhYlJRZy9nSnFUQ2ZKNEFYNlFH?=
 =?utf-8?B?VWc5eHFJeDRmZDRKaHg4L0VmUHY0Qnh0NDUvUEVZVk4zOEhyTHRkRkdLbCsv?=
 =?utf-8?B?MVFVTnVlR0I1TnZFVjRMcFNBSWRSTDZETVl2K1dhUXR4WjZpTDF1bjcvYi8z?=
 =?utf-8?B?UzZHQmpuT08zSG1tR0RjT2FlV090SFBxMzZoUnl6YmI2TlFCODh4bU10bXVX?=
 =?utf-8?B?ZzdVM2UrcmpITSs0K1JLTnlsdHNxb0hDQVZKSUpTNk5Rck01RUhDSVhRMHJm?=
 =?utf-8?B?Tmo4T0lPZVlPdUNkS3N5OUJKbHFRUDZTc0srK09DdGpqR0YrVDlqb2FPbXNs?=
 =?utf-8?B?UmNnQ1dROU92YkJ1cDYwaWtWN2hIejVVbUk0TzJja083dURDRDBRbEVWMDJy?=
 =?utf-8?B?OXNGZXl3NDhIV0NCZ3JKZE9ib0Q4SFhUcVA2NCtZeXNJUG5Xak56ejRwNy8v?=
 =?utf-8?B?Y1NicUFtT2I0YzBCY0VLbFc3a1ZpSnpVZGMwT1VSNmFnKzFtSXZiYzZVYXND?=
 =?utf-8?B?aFNxYjBnRmNKS1AxODJKc2s3UFhYT3Z6QmE3UUkzeDkxb2ZIVVRuUmQ5ZFBo?=
 =?utf-8?B?b3lEV2k3eS9DZ3hnNWsxaUxjNS9Rbkw4VlF4WndRbVRQMzVvbEVtSEdQbVUw?=
 =?utf-8?B?Vm9OcTZ3NjI4K2Q2K3lQcmtja0VEYndaN3ArckQxMUo3RUxEb0ZLZjBtT0g1?=
 =?utf-8?B?Y09HdURKQVZxL01qY3VKeFlHYXN6S1U0Ynk2NnF4OXpTU1RQSXp2SG5qQzVJ?=
 =?utf-8?B?MlVkeElKME1KczJIT1VzVXpDSk5tNjk3ejZJQXUvbUROWFI1Qm42bmdtZnhs?=
 =?utf-8?B?WUNoeStsaGVMdTIyL0JXTVl5OWVXK0RzamNNVzdnMWx4cWpRZm1VZ2JwVERB?=
 =?utf-8?B?WHVnMlJvYmZweTZoYlBPZTVXRWYxZ0hCczlhZ0NRVDdYODBGZmxzMVNwajRQ?=
 =?utf-8?B?enh4N3ZoWjlNMDNzbVh4d0ZOeHh3RWFlZ2c3SEgyUU1zdWNmbVpsRXc4Ylkr?=
 =?utf-8?B?NTdlcTFWSU5PRkR2UUJXSDgvcGtDS0ErdW9pTlZrSERkS1g1LzMyaDVKSWd6?=
 =?utf-8?B?c05YaTE1MVp3T0RjSGhjQU1DT1ZOQjFiaWRJS0ZJbHNiZUxPYkVLVS9jOENR?=
 =?utf-8?B?enJLWjJpOGsyY1FjcGdiUDE5ZFc5VjVSNkoyWDhGT0M2cHFWQk9FQkRtSHh0?=
 =?utf-8?B?WlV2T0M5ZitmL2wyaGxFbmkyaGhveUlXaFpJN0FsaWE2UjdoUjVsQWo5UlBZ?=
 =?utf-8?Q?/mec2jVH5S3WPYc9vXFYRiXuu2hon2bK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dFZZWFh5ZGVSbjBkbTFIVnRhUkYwbCtaQ2ZBek5nZ294L2dyV0VRN3p6dndx?=
 =?utf-8?B?eW9EZ1lqUUJPQ0JIQk1FOHdjWGd4V0pMZG0wZ2V0MFBKdmY0bHFBSmZCbG1J?=
 =?utf-8?B?M3RzMmxZbjNQbm00Szk1T3dSUSs2dDlabmUwbERCejc3WGVzREliaWVZSzc1?=
 =?utf-8?B?bUkvbllrZmNuYnhMOEx4L0FvaG9FbEFBY1ptaFdadDIxRGR2YmJMUGZJVHJS?=
 =?utf-8?B?MVpRNTdwY0JDZzMrbUdoZ2tsN3ZFclhra2EveXkzNlF1blZhaER6VUFVOWh1?=
 =?utf-8?B?eWtQb3hHN1ovQW5HbitjSzNVekdPUklteGQ4YytOajdQYm9sZ0dpNjduczRl?=
 =?utf-8?B?OUlLM0czTkxYTkF0RVVRS2NDc0JpMTR1dGFqQ0lFYzE4Rmc5cm80cEVoVDQ3?=
 =?utf-8?B?cnAwbDlFbUpKWUl2K1R4cHhGaTNYczdrSVJlbloyYnVsL0xlOGNxOGlFRzhu?=
 =?utf-8?B?SVAzaExQVVJ3WWNRUXQwYW1keVJOMit5ak5wOS9oMkplZzhmS3dBYjhzMGZm?=
 =?utf-8?B?ZXF2T2FlaDJKN1dKekx5M0xLQnVGSGdRUzJaUXJ2R2dsZlp1V2lVNW9zR2g1?=
 =?utf-8?B?NHJvdW5TVGhmRTh2TUNoNGo3c2xXaEpkVDFEWkQ2Qm5zQ3RSYmZwUnZHc3Zp?=
 =?utf-8?B?VUF5c3VkQ29JV3NmZlpiRHdMeFMrNGNMQVdLUXYxWXdLUEk3RlJZLzJqN2FM?=
 =?utf-8?B?Z0FBTHc0bUg3WVR4bGxpY1VFSkZ5U2VCWHQzWENLbERsb3RHencwY2tMZ1Z0?=
 =?utf-8?B?U1lJUHM1Nm00N0g0UmpQTzZYaUVVano5ZHFFdWdvTWp3WENDZlNSZnh4ay9w?=
 =?utf-8?B?RmhlM2VGcVhhMWVmL00wYXVFV2ZBM2NOSVBCeGM2eXliYU9hK3VZRHlyLzlE?=
 =?utf-8?B?OFZWZjlNNnpJLyt4YklheFZkUlhXK1dNRFU3VCtQTjk5UW12K3pwZDU2ai93?=
 =?utf-8?B?OERlMnoyd0E2elN4VStoVysyZ295a056TDlkTXNPczkwaTZpZFkwVjlodkRp?=
 =?utf-8?B?RmkxblRvM29WVVlqb0FUOEdleWwzVGgzdllnd3JzRFZXZ0JuQkQxR1JldVRU?=
 =?utf-8?B?TmN1cjRYNktzUlFVS3dLSmtMR2h3anJHREJRQXUxS3lYMDFZVi8zLytaN3lE?=
 =?utf-8?B?SFVFMXZiUndkYmVxaFB4TjMrSU90cldZZktyWHZDU0I2cmMxaTRIbkY3S3NK?=
 =?utf-8?B?TUlQM08zZHRHTnNVVjB6K1Z4azlWbFZPZFdsd0dsVU5GYjh5bkh6RHZQbWs5?=
 =?utf-8?B?WWxGUTBJa1BTeWtRTDQ1VnBKeVhDRUhzUHg4bVVTVFdzd2NsaEFmbks0a2c0?=
 =?utf-8?B?NVdJL0RHT0hMdnRZV1VHK2RVUDFqRGNtcGN0ZGZlc1JIZ1Jja2ZqWGxCbTZp?=
 =?utf-8?B?NHRuMkxlRlRNVkhNUVdZZUluZ01CdS9idEFZVmREcGxyYWhlalEyVldDUGI0?=
 =?utf-8?B?ems1N0h6dFY2Q1ByS1ZRNFhZQ3czNmg1YkVBcnpmY054VGtRL08raTVDaTNy?=
 =?utf-8?B?a1VYejFZZDNIdFpkZ2FxQmcwVVFZVGJyMVk0Um10d202dmNmbXZaMzJnVjk5?=
 =?utf-8?B?OW4vWE9jVjZ1UkhadURJMThOSUJ3ekwwQjhiMUdzOEtzUEQvZXY5TVJ6YW0w?=
 =?utf-8?B?RUNUMTI2dFBKTmk5M1ZYYXFvWVBJYllWa0Y0Nlp5TW9hOHA4aCtoU1g1MUN6?=
 =?utf-8?B?RmdkUDFJcGVJSHl5RTdzZy81YW1PMnZac2F0U1ZzMitpN1hxdXU2MXA5UUlS?=
 =?utf-8?B?N0hQMmRJTnc2MlMyUmdOUDNESGV3TmhrWlRDK3JBQkJKSDBodnJKOWdpWU9H?=
 =?utf-8?B?Vk1pekdybkkyYVQ4ZG14bjR2amN4WmphdktTSkQ1bk94OGdETVlzVG9XWk1w?=
 =?utf-8?B?ZkpZRTRYR3l4QXlXdzFXZEFTdFhZZ1Iyc29ZeXFyQmlUQWxCSTdzODVsR1hZ?=
 =?utf-8?B?MHBlRjZUeWZWNldZQXJrM29yL2JtUEZ4SUM3UUViZ3BBNVhydzdSbjNRbTA1?=
 =?utf-8?Q?qfjGuxKG9bpYIhPjUTAmTZ8iP4ukFc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e9d8389-ad0c-4ade-0ae7-08dd4ae068ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 21:09:44.5448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1682

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gU2VudDogVHVlc2RheSwgRmVicnVhcnkgMTEsIDIwMjUg
Njo1OSBBTQ0KPiBUbzogVmluY2VudCBGYXppbyA8dmZhemlvQHhlcy1pbmMuY29tPjsgS2VudCBH
aWJzb24NCj4gPHdhcnRob2c2MThAZ21haWwuY29tPjsgTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPjsgRXJpaw0KPiBTY2hpbGxpbmcgPGVyaWsuc2NoaWxsaW5nQGxpbmFy
by5vcmc+OyBQaGlsIEhvd2FyZCA8cGhpbEBnYWRnZXRvaWQuY29tPjsNCj4gVmlyZXNoIEt1bWFy
IDx2aXJlc2gua3VtYXJAbGluYXJvLm9yZz4NCj4gQ2M6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJh
cnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz47IGxpbnV4LQ0KPiBncGlvQHZnZXIua2VybmVs
Lm9yZw0KPiBTdWJqZWN0OiBbRXh0ZXJuYWxdIC0gW1BBVENIIGxpYmdwaW9kIHY0IDAwLzE3XSBk
b2M6IGltcHJvdmVtZW50cyBmb3INCj4gUmVhZFRoZURvY3MNCj4gDQo+IE9uZSB0aGluZyB0aGF0
IHRoaXMgcHJvamVjdCBpcyBtaXNzaW5nIGlzIG5pY2VseSBsb29raW5nLCBhY2Nlc3NpYmxlIGFu
ZA0KPiBhdXRvbWF0aWNhbGx5IHVwZGF0ZWQgZG9jdW1lbnRhdGlvbi4gSSdkIGxpa2UgdG8gZmlu
YWxseSBhZGRyZXNzIGl0IGFuZCByZXBsYWNlDQo+IG91ciBzdGF0aWMgZG94eWdlbiBwYWdlcyB3
aXRoIHNwaGlueCBkb2NzLg0KPiANCj4gSSBzcGVudCBzb21lIHRpbWUgcGxheWluZyB3aXRoIHNw
aGlueCwgZG94eWdlbiwgYnJlYXRoZSBhbmQgZXhoYWxlLiBJdCB0dXJuZWQNCj4gb3V0IHRoYXQg
ZXhoYWxlIGRvZXNuJ3Qgc3VwcG9ydCBkb3h5Z2VuIGdyb3VwcyBhbmQgSSByZWFsbHkgd2FudCB0
byBoYXZlDQo+IHRoZW0gZm9yIHRoZSBjb3JlIEMgQVBJIHRvIGF2b2lkIGhhdmluZyB0byBtYW51
YWxseSBhc3NpZ24gZWFjaCBmdW5jdGlvbiB0byBhDQo+IHNwZWNpZmljIG1vZHVsZS4gVGhhdCBt
ZWFucyB3ZSBtdXN0IHVzZSBicmVhdGhlIG9uIGl0cyBvd24gdG8gaW50ZWdyYXRlIG91cg0KPiBl
eGlzdGluZyBkb3h5Z2VuIGRvY3Mgd2l0aCAucnN0Lg0KPiANCj4gRmlyc3QgMTAgcHJlcGFyYXRv
cnkgcGF0Y2hlcyBhZGRyZXNzIGV4aXN0aW5nIGlzc3VlcyBpbiBjb2RlIGRvY3VtZW50YXRpb24u
DQo+IFBhdGNoZXMgMTEtMTUgYWRkIHNwaGlueCBkb2NzIGZvciBhbGwgcHJvamVjdCBzZWN0aW9u
cyBhbmQgbGFzdCBwYXRjaCBtb3Zlcw0KPiBtb3N0IFJFQURNRSBjb250ZW50cyBpbnRvIHNwaGlu
eCBhcyB3ZWxsLg0KPiANCj4gSSBhbGxvd2VkIG15c2VsZiB0byBwdWJsaXNoIHRoaXMgYnJhbmNo
IG9uIFJURCBmb3IgdGVzdGluZyBwdXJwb3Nlcy4NCj4gDQo+IE9uY2UgdGhpcyBpcyBtZXJnZWQs
IEknbCBiYWNrcG9ydCB0aGVzZSBjaGFuZ2VzIHRvIHRoZSB2Mi4yLnggYnJhbmNoIHNvIHRoYXQN
Cj4gdGhlIGRvY3VtZW50YXRpb24gZm9yIHRoZSBtb3N0IHJlY2VudCByZWxlYXNlIGNhbiBiZWNv
bWUgYXZhaWxhYmxlIG9ubGluZQ0KPiB0b28uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6
IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+DQoNClJldmlld2Vk
LWJ5OiBWaW5jZW50IEZhemlvIDx2ZmF6aW9AeGVzLWluYy5jb20+DQo=

