Return-Path: <linux-gpio+bounces-15859-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D794AA327EA
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 15:01:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B23C1889410
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 13:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E54820FAB7;
	Wed, 12 Feb 2025 13:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b="DJp7d/I4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-0063e101.pphosted.com (mx08-0063e101.pphosted.com [185.183.31.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9BE20F079;
	Wed, 12 Feb 2025 13:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.155
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739368720; cv=fail; b=s++OFYaC7CIpqnkRGTX5vmONYVD44SbKfGTDujARpQUNoOzssKieOacn5bJbJ4S5A1lbd9/dOIjOExz1fzXs+F2fS3C9k5CsCF50Vc0TGlf5Z+n2nOSc2C8nrgp1Ykf3hQol2mqwvclAePw9ygAYBltQeiqmy8mR7l02DpHIktY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739368720; c=relaxed/simple;
	bh=cQTNR7jmBFzePdNlSe5674gXUWw9AA2ZExtNSfPpdVE=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Hqe7HX+/90ImXYumOlJtGAfskeM3l4qaP52agXfiHBxnUgoifOnwFPEAa3rih7ELz0+sySXvNpGJm2nx0fd1oi0hBNUdsuvRj414ZtvQa2HnDuNaKxZ6uVuBkwTxS7nwZtevUddJ7pyfpspvp8hgwxsbuOFN4jREO/xN1wV5v84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com; spf=pass smtp.mailfrom=blaize.com; dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b=DJp7d/I4; arc=fail smtp.client-ip=185.183.31.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blaize.com
Received: from pps.filterd (m0247494.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CDLggp017194;
	Wed, 12 Feb 2025 13:47:00 GMT
Received: from ma0pr01cu012.outbound.protection.outlook.com (mail-southindiaazlp17011030.outbound.protection.outlook.com [40.93.131.30])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 44r9at0dfq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 13:46:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgbeORWlE5+v38orfFWyXSFFlhYIzCjA45o6ZJZyjbga/fR30vGy5RsuErqALM2gboN1qsHWdAC6EYh/qSMAyOaIdB5qs+vC0D+gtBC4YQf2PTgjGk0DVgNroM3kHOqm12TRW9XaewnSa7V2NvHMNWx82fy+sbOS6uomyyz3PNZ7SgACjKg0BI4qsdx6cS2zGrTpQl3f6eIsQid+9Rk53CnpC6Cs/jcOgv+I8OnPnQipcsESE8RnJ+j8EnfRnMmi56FaYhMhmloNmdpKawr+WnxmGNiHz1+aeKXR5dlvu2BaVFOiUzNOKJuIa8DOk9VbIifkkS63kT0b8BfFLMSEQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQTNR7jmBFzePdNlSe5674gXUWw9AA2ZExtNSfPpdVE=;
 b=vvSeQ3UR2En1M0WSJWPvib+JztOaSDJYlBHb7pHAUwvme9rIhfe+T7h3YNvGpubM3lN+TYTHpwOQDYSN4zeETPu1ICPNR24IuUefXfRQpDHVKh7NrHkdwAz/cuOFL7AK8qrmkREjrorTAwqK4sC1GbEVtUm1olEUVYJqQ5sfkAisdSasQi+Q4A5lI3SSIWPxE9+HPF4L54weyGrps2tRMyov6QNjLRSRrR1Cc3LGnB/MSF7ECUJm41u4g78J5rlWyi6U4ELousyl3TTwTXzReuiIkNEs52Puqr17drkK1RjkChQgs2Pj2j+kCtQUxqLNUxQGydlqqLcgg5wUJfIZvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQTNR7jmBFzePdNlSe5674gXUWw9AA2ZExtNSfPpdVE=;
 b=DJp7d/I4qz6NqncDkc5JbOHNtp1NCo3k0LiiN7DiXpLm4dWax12p32MppuKyxtXqwTbu29ib4EPyNSASX3oHkZ9OTTq0iO+8GJ08nJBJIRU5yHB8hSPlKylldryi2SLJAvNfetaelabECO/ffLq8VC9ETAoS3pRvQpukRV/rjWk=
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12a::5)
 by MA0PR01MB10196.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:127::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Wed, 12 Feb
 2025 13:46:50 +0000
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655]) by MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655%4]) with mapi id 15.20.8445.011; Wed, 12 Feb 2025
 13:46:50 +0000
From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        James Cowgill <james.cowgill@blaize.com>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        Neil Jones
	<neil.jones@blaize.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz
 Golaszewski <brgl@bgdev.pl>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        Nikolaos Pasaloukos
	<nikolaos.pasaloukos@blaize.com>
Subject: [PATCH 0/5] Add support for VeriSilicon APB GPIO driver
Thread-Topic: [PATCH 0/5] Add support for VeriSilicon APB GPIO driver
Thread-Index: AQHbfVSRkQ8A7TA1wUihvIEJQh3rCA==
Date: Wed, 12 Feb 2025 13:46:50 +0000
Message-ID:
 <20250212-kernel-upstreaming-add_gpio_support-v1-0-080e724a21f3@blaize.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB10184:EE_|MA0PR01MB10196:EE_
x-ms-office365-filtering-correlation-id: dae94c31-9ffd-40a5-c3f8-08dd4b6bb3bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NC9mVFcwaUJycU4vMldzRGMybWJiaU1lZ2I2dzVKQ2NKeVRodDFjemJJaVg2?=
 =?utf-8?B?MXFiNkI0aUljYjFqVk9CaGttVUFOSW1WT2dNNUNrMkFSVjl5QzMvU0dSbzYv?=
 =?utf-8?B?K1hKS1laSEFSMkVaYm1ERUFTcDRDaVpLNmV5dS9EL2EyaGNlZUpXd0VCbzNz?=
 =?utf-8?B?NW04d1d3TWkyK3hISFVWVWNvV0lJM0hPWXdEZ3luNXgvLzArSE9mdlRWY01w?=
 =?utf-8?B?THFvWUgwUnNNdWhuT1Y5cXJPUXRXZE5xcmpneERkV0p5VDhKa3l1czJwamVO?=
 =?utf-8?B?NWYyQXFZRk9mUE5JRERwU3JEN2kzMTVjSDkwMUpZMFB6YmtNT2ttWE1ic0Ra?=
 =?utf-8?B?Tm9SWWM3aC95R1F6dGV0c1U4amUxRVlYc09qdVo2bnpacis3NHJtSXhvaTd3?=
 =?utf-8?B?RFByZnJhQ2laekE1SGxvRnYxWnRpZjNTb0pEclFZQzJzQTAxNGpXbG1JUERW?=
 =?utf-8?B?YnJsQXJQVk1Na0htemkwWjN3RHU1QkhGbDlBYldDcnZ4WVBzTlkvWW1oaDAw?=
 =?utf-8?B?ckp6YnlIbXFySi9MTVFtbjloNjYvNFFSLzN5Z1phU2JpUWJVdUJmRnI2R1Rt?=
 =?utf-8?B?VTRCeDVEUlE5aExoay9Sd0o4VGFLMVQ3anBtcUZ6OXZNM2NWY3gweTZEMEM3?=
 =?utf-8?B?Zmk5bVNveWdrc3ZFTFZSSHgvV0JLYlBjWTZZWHlpTWFlY2E4SkxVOXd2TlBD?=
 =?utf-8?B?aExKenJsZWFxUzZzMGVSK2lnWGpsVDZnVnJUeG5wV3U3cU9Db3VSNXcvNlZU?=
 =?utf-8?B?MURaNFljV0Jwc1drNFQzSzJjQVZzQkZ2SDhhc2lSamRyTjgrV29hZ0d6ZHQ0?=
 =?utf-8?B?WlB3bExXU2cvNHpiZFI5QTUyWVl3RmVzeVROM2M1TXVqaloza3FVMThJRGdx?=
 =?utf-8?B?dEZxSS9MTjFQQU9JYS94Q0NBYnozN0d5QU5NT2EweFBuK01Yd01CRmFJMjlY?=
 =?utf-8?B?aHMrN3BJMm94eFc0OTFNa2kxUjJ3ekRVbEY0RnRuL2ZXWDVEYVluUitwNXVX?=
 =?utf-8?B?RHFGR0hlYjl2TTk5Wjl1TEFySTcwRHduWHpCc0FUcTJwdGRjTnkzSGFCc3ZL?=
 =?utf-8?B?WXZURkowRDNndFdHRFlRcnlrL3NuYUxIM3JuT3IzVTdBbFhGN0E1cUZoakNl?=
 =?utf-8?B?NW1hZU05SWtLTTlidlMxYkpVZFhrVVAzVDR0eWsvdVNZY0pSU2o3ZzN6K2tq?=
 =?utf-8?B?Sk1GaGxGdW0rVzhNb1NzVC8xUTVwdHFZSktuVWhtUVB5czZWR0hKdk5HRTBt?=
 =?utf-8?B?UGtGWkQrTyttTGZHRXdCWHgwRGNIV2dPQ0Y5L3FvTVV0SEx6SDFoMlY5SUlh?=
 =?utf-8?B?OW4yTnFDYjgycEpjMVFHOUpOaEtjRytqR016ejhyZTltamN4TndCaXl6QURL?=
 =?utf-8?B?MjZ5NEZLOHZtb1RHTFBNZndrTW0rbHZFZUFJdmE5ZSsvakE1cUxNU2c0MHJy?=
 =?utf-8?B?SUlnck9IVlFNK2RDVUFiWmhERXlDT05CNUQ3a0FWYzdrNzhuaXJGZEozTVRs?=
 =?utf-8?B?Qm81R1A4MXJZOHVUbjZPVmtmSTFUeUg2ZXpOczJrOUFTaVNtOXU3Smk2ZnpX?=
 =?utf-8?B?aTlVRkM5SXJreGVLMXY1V29ra1V4dGZCQ09OSEpGRm0xVHN3Zm9WSFZGSGJw?=
 =?utf-8?B?TFlFa2Rob1M2Z2RjU1FSOEZKK3F0VXppRERaL09IZVJyaC9OT2tsT2oxWFN1?=
 =?utf-8?B?ZlU2TzZvejJ2YVNuQmFmVGZ1dUtJVHhGNlA1blk2V2h0ejdxdHRicTB3cy9m?=
 =?utf-8?B?ZnVCQk9qeCs1YitiNk5RSWswcjBWcWlhNStTdVhnZE1JZzJWbnNpNjBTRDRQ?=
 =?utf-8?B?MXNjLzhYU3BPOE56SndNcDgzVkQrU2N4ZGJRUTFRVDVta0pUUnJtUEtsNzY0?=
 =?utf-8?B?VEkydzhGUnNhV3hNNzY1UWlyNklZQ0RxdlpnaHVEMURCYlRPZnVXMHdxdmNI?=
 =?utf-8?B?eksxblNybkRySTdNWkZSSGRZUXppd0NNQlBmckkvMXVGamM4bXRDMVpVOWVJ?=
 =?utf-8?B?N2tmMS9LY1JRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VW9WQnhPaVVWdGxIZmYzcDVTWGtNQUZJQndKWmRjNmY3T0FrSWdlYWtOQnVm?=
 =?utf-8?B?azd4QVNobmVSYkJwQ2ROYzBOMG4zcmxXTFQxMkZnQ09UK3R1M09uZ2tGOFlH?=
 =?utf-8?B?amY3ZmZoVVFnaGJpNWtJNFd2enRwNHNnajVEUnNtNW9OYnZRMUw0MWU3c2F6?=
 =?utf-8?B?a2xUYVNnL2Z1M2ZnWVl4ZlVMSXY2eHc3TGxQaWRMWnRHSWRxRG5Vd3MvSkRF?=
 =?utf-8?B?SVBabGl2cFBWLzIweUt3NytnRm1LM2lxNFE2Qjc4WUMxc0lyYlBtdWVxV2hC?=
 =?utf-8?B?RHYxd2l4ZXNPdUVmeTEyUWswTDZpcm43TE1rUkt1Nm0yYmpPYTFHSmtZQ0ho?=
 =?utf-8?B?anI0dUJjdEFqdHcrZjBvRlQ2VVprR0RDT2FFMEhMc2E0TFhaQnplUHd5TVQx?=
 =?utf-8?B?WVFTZm5lUWVZamhmVTEyUlZ1eHYxRjJ3MW1CRUpSRXpuV1ZtMjVJOWRPQS9w?=
 =?utf-8?B?MHVzbkpjR0J5bnorZ2h5cGRtekthbGkyUUJPNmJLSktPSWhIcUM4bWI0RGpk?=
 =?utf-8?B?ZjEyYXpseVRCOVcrTVZmbGFlbEwvOWZQeFNBRVV5TnJqVU5kaDBGWW1TNW4v?=
 =?utf-8?B?OTBDeDROS05PRzFyd2hVR1dWenJHQnNlRlg2MS9ZMjdsdldtR2VqSTcvejMy?=
 =?utf-8?B?aXhUODRMZ0JMNTRDRi9ONGtWajNySG5kajBmWmpORVk5MVI5WmMveFBPeU12?=
 =?utf-8?B?WDdFb1YrZ01Da245NjFwQXV3VlVNQWpLSmZWMHhHTkVrUXBYeG1iR0c3OTlW?=
 =?utf-8?B?R0gzYmlESkdIa1M4bDFQWERmcGlQVXpabmQxVWpKZmExTkZZU0IvYyt0VEls?=
 =?utf-8?B?czBSS0FGR0tPN09oaTROWW1uSkhXa091Qi83N1ljTGhudTVyNitWeDBSRnlL?=
 =?utf-8?B?ZEtaU2dTdys3d1FoSUtJOEdVWE9qbUVVcjlmamFSSTZKenBWZm91ZmNGUnNq?=
 =?utf-8?B?bk8yd1E3OGllWDF0K21zV1FacXlrc3VpVy9SSXVEdVVVSWQ1NEtsT2hKZ2t5?=
 =?utf-8?B?RXVxOVlNamhmWW1DZWU1bVJmNG5hOWxaK3ZVMzAzQVpiV2NnaGlWTWVLS2JI?=
 =?utf-8?B?UktGc1pCMkF3blFRUHdBRTZ1WDhrOXA5N2VWZDQ3eHdjNWVuVExYT0k2aWVP?=
 =?utf-8?B?Yy80d2NSUmsrYVZVRnN3MVExTzIwWHZnZkhEVklrbittMkk3UjRqb0VTQ2Rz?=
 =?utf-8?B?b01xZy9qK2ZjZ1hOVlBRejJjaEtUSWQrRDIvSkMwTzN3aXowRGxIYm42Yk03?=
 =?utf-8?B?MXJFOEUvTjlJbURpd3VNV2pCYjlOYS9nUi83dEQwNkF3dUJjSGV6WlJHY3dX?=
 =?utf-8?B?Q1F4WGhLTUJmcEZ4eUdoY3RBVHIxa2JGdk00Ry84M25QOVpBM0cydUQxSFo3?=
 =?utf-8?B?MkZNOU40SjRKcWg3SHlNM2YyVEM1UnZ3R0VIMXdaY1NLeFlRcnZ2REtJdWRp?=
 =?utf-8?B?UVdkeFZtbnBYK3o5R2tRTHZPaGVocHdFejdWaUtIZGNVZlhWeTAwbmhvNUVX?=
 =?utf-8?B?R3NKOGZiSjRuOU0xeEd6OVQrY3Jyb3FlNGJBdXBEOExPQmJLYm5pdmpnNysv?=
 =?utf-8?B?S21XS1lESTN2emlSeDRtQmgwSjlVRjJqZVZoQ0ZrSFZ6RW9UNWtZejVKQk9u?=
 =?utf-8?B?OEpVY2llU2I3YVIvVlNuTmg5Y2tEdjR0V1k4SDRuVWpDOU1sWkpEVENFOE00?=
 =?utf-8?B?VS9SN3B0SG8reDl5OEtMMFoxMkNCRTZkNkc4cUtFSHNKTFZNa2VhbjM0VXBo?=
 =?utf-8?B?VG52TFVaenBqWmlnSk1RKzI4NGY1K3VYY0N4dkpkWUhBMDRLV2ZBdzFyWDBy?=
 =?utf-8?B?TnEwaXZGd2lScCt6Q1hCZndTMFpoVXJFc1ppcWxBL2YrbFNHMm5wa0ZTSlp0?=
 =?utf-8?B?QzFkNmpHK0o1TUg1Vmowd3BXT2c0Ukp3dW15ODVmWnNNbE5BcVc2MDNaKyta?=
 =?utf-8?B?K01Kc01PSFpqRjIzUnpxemdLWmpCVVM2dVc1ZnE3VHlkS2laZWFma0xtNXpY?=
 =?utf-8?B?WUFjb1J4VXpoYW82V2JrL2xtVHFDeUJXNVpMaEhiS3IrYXFpTUYyNVBINjY0?=
 =?utf-8?B?d1R4ejdOa2FDY1ZoZFhEaWdRb1doSnV0Uit2ZHR6a1VBd1FWbWFxWnk3WXVC?=
 =?utf-8?B?NmpreXhPUkFqSmZiNThobDBaaFR2RFlEdERtdlh4dklmTWx6K3EyNWh3WDJ6?=
 =?utf-8?B?clE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <895BE297F32A8A41BC0A8AE1A12F2FD0@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: blaize.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dae94c31-9ffd-40a5-c3f8-08dd4b6bb3bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 13:46:50.5350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0jbfSyjZg1T6T6ZjWmwJa+Jyw7oF54+PQabSpOhwBbSLCZzN8OceDX/tzjH2b+siBNeQQJdiJVxQidruGg8/NAVhQU+HKlMNYlYP9Df1Sfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB10196
X-Proofpoint-ORIG-GUID: 72XPkNyKpFcPO0X_ikVgaSfM4a2-q1_R
X-Proofpoint-GUID: 72XPkNyKpFcPO0X_ikVgaSfM4a2-q1_R
X-Authority-Analysis: v=2.4 cv=YatH5xRf c=1 sm=1 tr=0 ts=67aca654 cx=c_pps a=YuR9wxGk6pucJSra5CpfIw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=4MthsM0t3ikA:10
 a=-5LYVjoNHPMA:10 a=SrsycIMJAAAA:8 a=d08asnFF-j38aQ-J310A:9 a=QEXdDO2ut3YA:10 a=zapPnUM7SFj2ezx6rUw-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Reason: orgsafe

VGhpcyBwYXRjaHNldCBhZGRzIGEgR1BJTyBkcml2ZXIgZm9yIHRoZSBWZXJpU2lsaWNvbiBBUEIg
djAuMg0KaGFyZHdhcmUuIFRoaXMgY29udHJvbGxlciBpcyB1c2VkIGluIHRoZSBCbGFpemUgQkxa
UDE2MDANClNvQyBmb3IgaXRzIEdQSU8gaW50ZXJmYWNlLiBJdCBpcyBlc3NlbnRpYWwgZm9yIHVw
c3RyZWFtDQpzdXBwb3J0IG9mIHRoZSBTb0Mgc2luY2UgaXQgaXMgdXNlZCB0byBwcm92aWRlIHNp
Z25hbHMgZm9yIHRoZQ0KRXRoZXJuZXQsIFNEIGFuZCBtYW55IG90aGVyIGludGVyZmFjZXMuDQoN
Ckl0IGFsc28gYWRkcyBWZXJpU2lsaWNvbiBhcyBhIHZlbmRvciBwcmVmaXgsIGRldmljZXRyZWUN
CmJpbmRpbmdzIGZvciB0aGUgY29udHJvbGxlciBhbmQgdGhlIGRyaXZlciBpdHNlbGYuDQoNCkFk
ZHMgdGhlIEdQSU8gaW50ZXJmYWNlIHRvIHRoZSBCbGFpemUgQkxaUDE2MDAgU29DIGRldmljZXRy
ZWUNCmFuZCBpbmNsdWRlcyBpdCBpbiB0aGUgQVJNIGdlbmVyaWMga2VybmVsIGRlZmNvbmZpZy4N
Cg0KVGhlIGhhcmR3YXJlIGl0c2VsZiBjb25zaXN0cyBvZiAzMiBJL08gcGlucy4gSXQgaGFzDQpw
cm9ncmFtbWFibGUgaW50ZXJydXB0IGdlbmVyYXRpb24gY2FwYWJpbGl0eSBvbiB0aGUgcGlucy4N
ClRoZSBpbnRlcnJ1cHRzIGNhbiBiZSBlZGdlIG9yIGxldmVsIHRyaWdnZXJlZCBhbmQgaXQNCmlu
Y2x1ZGVzIGEgZGUtYm91bmNlIGNpcmN1aXQuDQoNClNpZ25lZC1vZmYtYnk6IE5pa29sYW9zIFBh
c2Fsb3Vrb3MgPG5pa29sYW9zLnBhc2Fsb3Vrb3NAYmxhaXplLmNvbT4NCi0tLQ0KTmlrb2xhb3Mg
UGFzYWxvdWtvcyAoNSk6DQogICAgICBkdC1iaW5kaW5nczogQWRkIFZlcmlTaWxpY29uIHZlbmRv
ciBwcmVmaXgNCiAgICAgIGR0LWJpbmRpbmdzOiBEb2N1bWVudCBWZXJpU2lsaWNvbiBBUEIgR1BJ
TyBkcml2ZXINCiAgICAgIGdwaW86IHZzaWFwYjogQWRkIFZlcmlTaWxpY29uIEFQQiBzdXBwb3J0
DQogICAgICBhcm02NDogZHRzOiBibGFpemUtYmx6cDE2MDA6IEFkZCBWZXJpU2lsaWNvbiBHUElP
IHN1cHBvcnQNCiAgICAgIGFybTY0OiBkZWZjb25maWc6IEFkZCBWZXJpU2lsaWNvbiBHUElPIGRy
aXZlcg0KDQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby92c2ksYXBiLWdwaW8ueWFtbCAg
ICAgfCAgODMgKysrKysrDQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVz
LnlhbWwgICAgICAgfCAgIDIgKw0KIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDEwICsNCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2JsYWl6ZS9ibGFp
emUtYmx6cDE2MDAtY2IyLmR0cyB8ICAzNiArKysNCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2JsYWl6
ZS9ibGFpemUtYmx6cDE2MDAuZHRzaSAgICB8ICAxMiArDQogYXJjaC9hcm02NC9jb25maWdzL2Rl
ZmNvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KIGRyaXZlcnMvZ3Bpby9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA5ICsNCiBkcml2ZXJzL2dwaW8v
TWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArDQogZHJpdmVycy9n
cGlvL2dwaW8tdnNpYXBiLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAyODQgKysrKysrKysr
KysrKysrKysrKysrDQogOSBmaWxlcyBjaGFuZ2VkLCA0MzggaW5zZXJ0aW9ucygrKQ0KLS0tDQpi
YXNlLWNvbW1pdDogNmQ1MDM5ZWI5N2E1OGJlMDgxN2VlMGY1OTU2ZWM0ZDIyMDQ3ZjQyYQ0KY2hh
bmdlLWlkOiAyMDI1MDExNy1rZXJuZWwtdXBzdHJlYW1pbmctYWRkX2dwaW9fc3VwcG9ydC1iNGNl
MDVlZmY3YTUNCg0KQmVzdCByZWdhcmRzLA0KLS0gDQpOaWtvbGFvcyBQYXNhbG91a29zIDxuaWtv
bGFvcy5wYXNhbG91a29zQGJsYWl6ZS5jb20+DQoNCg==

