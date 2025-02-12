Return-Path: <linux-gpio+bounces-15854-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F73A327D3
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 14:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 065C23A1C3A
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 13:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A134320E6F9;
	Wed, 12 Feb 2025 13:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b="O4ogmfpO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-0063e101.pphosted.com (mx07-0063e101.pphosted.com [205.220.184.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE9320E315;
	Wed, 12 Feb 2025 13:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739368717; cv=fail; b=texajQTOhw/42osqON72d3f5BLeA4LtMcydO8fZ9AS7xxmMUtH98+dLKeb67EZaKiL3T3IKKCM7SjszH0fif9LvxOYjrNOoUMF8H//1/nxIW5+cyVlB0kK3IUBTgYF48pW5JZuVnA0SLZu0hLxNVVQnZTh45jSrTyFghDPeaDqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739368717; c=relaxed/simple;
	bh=Uv19H9/wX6yWjYKq84izvh1gs9SQwtHcfq8fZtklbeo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CzlnL40xUlfnOxiC8V6GzIDc+WEXHKYGlO7EF/lk+gx64Qvtu4oCGIGAKjXfKWHEUjML7W+6taZ9HzJXhgv0EDVZgs00va+nYcUQqBabOcjBzpFwRliNX4eZAZXgKxno/ZSe9IjDtCpu52sQAjMVFUS66OkFMTDBI+3OzqA8wgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com; spf=pass smtp.mailfrom=blaize.com; dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b=O4ogmfpO; arc=fail smtp.client-ip=205.220.184.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blaize.com
Received: from pps.filterd (m0247495.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CDiGhk001511;
	Wed, 12 Feb 2025 13:47:04 GMT
Received: from ma0pr01cu009.outbound.protection.outlook.com (mail-southindiaazlp17010005.outbound.protection.outlook.com [40.93.131.5])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 44qwtd8sy4-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 13:47:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZMCIGkV8RxJgRT/wNw3s5lucWqPPglda0DabdLHJxfEuy5bPYWEvBIp+NrBF+60eV1imvruxSd1N6WpT7erlLt3NjZpqRdfxWmOTwYc4+uq4wD4fXvyBmIA5BvQfVlnnqnf55ZElL5wILqsQhkWV+VGjgQ3lkgw9DZQL5Rsh9LNNbwsnJQhXMqaR+6A4g8i37vDUL9Ork6WLtLZp4rk9HzTZDnxeS5EK69Aj+qnOqH1/Cs/sJlqdowCBDgZeWG1zwkczLlqpKomxGoJ8lq0ay5JSYNDU3WqG2j9R1TXQZMeIK/iuuRyYNQ/pqpo+V4uzl9fahsft4n7w0GORWYUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uv19H9/wX6yWjYKq84izvh1gs9SQwtHcfq8fZtklbeo=;
 b=se2pMJy06ctHKbtkaz3mc3NyOdECHb+5+WhssnK62vF10opDcKRQKj74AbgsF/ebOpiq6VoYPV+zaNvRWrIqQfxzxK19DvXUVFXjgAjkozkAXRnYUSEd/id6g5ZF5PMRETqbzmR/M9MFFyl3ABvrTTsmZLgr6idxKhSoUru28N5ZakoLiFe4Z+rRBFhUieH4og3/x3BP7utcCJv0JWBLD72FcvhJMpa86p9enVYIbc/Po++VxgLO9imQiK+hvfpglABSb4ADKZyw3aZjwL69pkLHA+EkRWPWd6uS4Awsu7KNtCmg0zM1YmVKuHuMlwKmnm5YEZiGiMctqevDdZTmbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uv19H9/wX6yWjYKq84izvh1gs9SQwtHcfq8fZtklbeo=;
 b=O4ogmfpOrLVPxyAvYx2wQgjjQoV+tvHVxZFArOIHOHAujGoXIaq3sTEami+wPLfQaShz7zvXEB/MmV3biUUrqxe7a4UhUtFROZiY85hSC1i0fZA/Nx2So9GfymsXC/YbUgM9mv+G68PByE5swZI9QvBfDQ8JolNIvQn+yyue0RI=
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12a::5)
 by MA0PR01MB10196.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:127::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Wed, 12 Feb
 2025 13:46:54 +0000
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655]) by MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655%4]) with mapi id 15.20.8445.011; Wed, 12 Feb 2025
 13:46:54 +0000
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
Subject: [PATCH 5/5] arm64: defconfig: Add VeriSilicon GPIO driver
Thread-Topic: [PATCH 5/5] arm64: defconfig: Add VeriSilicon GPIO driver
Thread-Index: AQHbfVSTBZ+UiniMSEe9hyswM7siXg==
Date: Wed, 12 Feb 2025 13:46:54 +0000
Message-ID:
 <20250212-kernel-upstreaming-add_gpio_support-v1-5-080e724a21f3@blaize.com>
References:
 <20250212-kernel-upstreaming-add_gpio_support-v1-0-080e724a21f3@blaize.com>
In-Reply-To:
 <20250212-kernel-upstreaming-add_gpio_support-v1-0-080e724a21f3@blaize.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB10184:EE_|MA0PR01MB10196:EE_
x-ms-office365-filtering-correlation-id: ba6e3e38-262f-4748-c629-08dd4b6bb646
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cDYzVk05eGp6bm9ZQ21yNS83SW1UN1dlaFF2RGY3OStsb1ZZbEtEemx0SHlS?=
 =?utf-8?B?eHZBaWxkeUlJOHV3RkZGTUlQcWFFWGVpYWo2Qm1BZXgxbnNxdEw4azRBcmNY?=
 =?utf-8?B?RzBITDNNOHQ3dUNIajhQR0wzMk52SFZlcytpVUh4WFM5V1RmQ0Fhc3FicHBL?=
 =?utf-8?B?dE02UENFanMxWkhSV0ZLNlVBdVpGY1JWT1NTeTNyTFpkN0locDk1NzU2eXVp?=
 =?utf-8?B?QStMTkxhMnlTZ3hwemlrR0p2REhCYVVZeUhPaEpBVTl5NUVqSE9JU0gzWGd3?=
 =?utf-8?B?UlBabnRmbm1DelVVMEpTcTluQ1g3Q216WXBYU3gzcnF3VmxyYVJwTk90NDhj?=
 =?utf-8?B?dUhBZTRNVTVXaGk1UzYyT2xwU1NzQXJQYS9TZmlYLzNqWDBiMmNrY09vTEJj?=
 =?utf-8?B?SEgwR0k4bnBXSERvSHdNNHo4STVJQVN1b3pvZWpyQVRUMnF1a0NtNms0RmRr?=
 =?utf-8?B?azl5Tm5ZcWtSOThuaXRORExlT3lpRVRmSXBEaUlNdmNaaXFocUZ6eG9QL1dh?=
 =?utf-8?B?Mlc1N3pSTkR0OGdDYmhzUk1LRWRaTi9kbk42Y3YyV3NjNzJTUEVOSUVZblpk?=
 =?utf-8?B?SmNOclFFTkNhZTIwN05QT09TeUk1c2lxZURnVW40cWs4MzdPUDF1TUNRSkJ3?=
 =?utf-8?B?eUZ0SEpnWGFOaE5YZy95TFdGc2gxVmM2S08wQVlXQVRPaHQ3M2NSem1wVFZq?=
 =?utf-8?B?L0tKTElLSEJ3LzZCUXhycXFPaFVodlA5MUhuVyszR0lYRngyZ1VUalZ6YU4w?=
 =?utf-8?B?VGlXMFo1WEMxU1FURzdFaWE4L0Z5Y0R2eTZ0dFV1alB6MzJMcFU3K3ZqR1lm?=
 =?utf-8?B?RHV4aWR0SlFpWW5uZkpIL2xvdzg0RmFmc3Q5SEx0VHZoemd0SDFNMzlYbjFs?=
 =?utf-8?B?d1N2N3lzMXlMS3QrN1FXU0krS2IxTk9PUnNEOTZxMTlUY1U3SUthMnpiNTNq?=
 =?utf-8?B?cHFIV2RsUUE5VWQycEZlNHE2dHljbHpxdFVIcHkvT1JSUlZJdlBNSlliRkpE?=
 =?utf-8?B?YktFVGROQ2hmVG5HME9EZG0zL3gxZ3RWaXVFM2dSc09rYTVzQ3JiaW4zZlhM?=
 =?utf-8?B?djRCcDJGY2VKbHpOMVJKNzNmNzJzNXoxR1BvQVpaN1FDSlFLeTE4OHAvMWI5?=
 =?utf-8?B?ai91RHlvMUh1THJaREJGcUNUaXJSTURZN3NIZlB2cnZTTWpkZlZGZ1FMYUQz?=
 =?utf-8?B?MTBLMGVFZ2UxL1hkU0YzRDNnOW91TFkrVVJNc2h1aWEwbVQwZ3h0Vnc1V2Ro?=
 =?utf-8?B?dzlUZnpWUFlVaDUycVBhRE10eEdrbGx1alhsblhoYWFzcm45WXdORVV3d1dQ?=
 =?utf-8?B?TG5ydXM4SDhvUHFqeERrdmExRTc0RjBvcUUzSEtQdTRyb1JzTkN3OWJMYjBr?=
 =?utf-8?B?ZHZtSEpQeXlwTWo4VlVjVEt0QnJrMkhleWJ3V1loc0x0RTFCTFUwV3h2WkpB?=
 =?utf-8?B?bS9oRExVVGxUb09hL25SOHZHN1hGT2l6bzJUN2RueEltaE1Oc2RmVzBtM2VD?=
 =?utf-8?B?bGVQN2t5K2hkaytld2tnYThnVWhudTRKZExtOVZpeUF0RlZCQ2FHb1hDMFRv?=
 =?utf-8?B?WjN1Q0ZEVldQRGtXSTdvODJGUkRvSDBlOTdodDJ3RmFPaVpGcllHZjZtd29Z?=
 =?utf-8?B?WGhpcGRub2tZR0o3QytJeW50QndaWXhydzhtZEUrdnpDcmQ3cG1vUzdnamMz?=
 =?utf-8?B?cDFwRWthN0M1alVuRmZRQ1FYTXhtczdJMUMvMHl2SmVYaS9OVFdLd2FLK1Z0?=
 =?utf-8?B?N2tBTjV6RjB6SFFCMDFMVjZSL21RNUxmZXo5a2xpcldGdkk1cFQyaG94amdv?=
 =?utf-8?B?bU42bEVnb3hjM3Y4aGxmcHZWZGxBNklCdjJGLzZtOFNtK2tqcU5LRTNjUGlZ?=
 =?utf-8?B?Mzc3V2V5MmZtaEFRMkVHQ2JYUG42ZEVPUlNEdWFZbHhUTE1seXU3VEZUNWdE?=
 =?utf-8?B?Z2dSU1l2b2dRbW5nakRzY1V5VG4zMXRPd2Z6MkZ4REloTE8zSlM4UVlxMjZO?=
 =?utf-8?B?TlNucVR0b1F3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ung0bVJYN0F1Vy8zOE5MVkRsWkF1b1dqWlgzeFNMNzg4endvOGdrUE96NFVm?=
 =?utf-8?B?TTFtcFdEU2x0c2g3alc1ZXdzZGFFY05QTXgyb1R1bnd1Zkd1NEE1bkhSa0Y5?=
 =?utf-8?B?aEJBb2UwM3NtV3N3ZmU3LzVNZDk0RTFVS1hmRGhmUVI3Ny91cEd6dE0zUmlS?=
 =?utf-8?B?bU1kUjh5M0xwa2hTOUNKUWlVQ3MxSDhMZExhWkxKU3VWNVFiZE5Td3cwQzEx?=
 =?utf-8?B?ck9mc2g4T21BMUVyS20xazFtOXlKSWJ2N1JDL0g1SU1TNjF1Z01aT2pkSnVQ?=
 =?utf-8?B?R0FSMjJzNjZYQVpHQU1ZZHUzRnc1eG81eEtWcHNUUG9tODM3QXdrVmdEVTZu?=
 =?utf-8?B?dXQ4QUphK0ZvMkkzUHZBdVlhZ3AwNnVqbyttU2FSNmpyS2JaYmxycytTaTNR?=
 =?utf-8?B?T2t2STVMYVVCeHJHdUhqcHNrdXc4RlNwVFB3cjVrdEdkOE10WWtLSGVPNkd1?=
 =?utf-8?B?Q2RpNGw5N01UZ1M1blh2TjhXckdKajd6WlQ2QzlCRnRsS3ZxVjVEa0ZNTm4r?=
 =?utf-8?B?dEI3Yzk1V2dXekV0Szh4QmFZbmpoZUlqb1FvTnpDZGxBb0ZYVXBHbDVEUVJN?=
 =?utf-8?B?RTBBelo1UW1lWEM4VWJXazFKbzREVjhvNk5CQjBkT1AyajRFU2VEdXE5R0pO?=
 =?utf-8?B?elZaekNJYWc2Zi8xbGZEZ3ZwOCtCOXp5bHVUS2hpa3NGQmQzalBQK3RzYVlW?=
 =?utf-8?B?YS9FMGJjVEVpRzA5ODdDQWpNTFFzVDFQR29KbEduZVRBQis5aGYyMmNtV2Q1?=
 =?utf-8?B?WU92WTk2REtzR0VPT1JPVjJBT1FPaGZZS1ByT0R2Yk85ejgvMlI3anRQb1hy?=
 =?utf-8?B?dExYTytVakwrZTA2OU5uOW5RT3ArdnVIV3pudXR1czUrTDRnU1R6ZkFMcHUr?=
 =?utf-8?B?N0Q4NjJPaUlwLzliU1ZhUDJhYTdBOUtHTXVWL2E0Ym5MdXgzenArWG8yZmFX?=
 =?utf-8?B?VE0zSHFoa2Y2TjhoVVlEb0dXUGczLzNOWk1jUG1iN2oyWDlMalRuMm1nK01a?=
 =?utf-8?B?TlRYUnQ5Ny9udVdyek9GQ3VzQkRTdUVnVUhkRTduR29HVGNWS0ZYWmFxa3ZX?=
 =?utf-8?B?Nm1wdHMzL0VBTVQwMWt4MmYvQmFDYmJIaGl3dFg5d2lTTGd3QWRHVDRoV0FZ?=
 =?utf-8?B?MHI0M2V5c2QzNHd3YWFBSS9NejlhdEJ6SlVhS005R0hCWHBtL1R6cXUweURM?=
 =?utf-8?B?YldmblhEMUtGeGhUcXpaUW1NcTFCdXk4ZnArbGV4VGtSSDZsVlBvR1NGaE5o?=
 =?utf-8?B?ZFhLdnluZWNUcnBWd0E2bDZtZjdlamtCd1Fuc1cvc0U3b3FzdE83Y2Q4dWVP?=
 =?utf-8?B?RU80UGxFQU1LL1BTTnEzdEZleWc5UlZYSDNNQmpDUGJVSmFxcjFZb1F0cjJt?=
 =?utf-8?B?RmxITkQxOW5xcDNLOVdJNm5DUEZTN1N6TStBRHl4UW9KYlFwaGJJK1MrTXdj?=
 =?utf-8?B?Qm16ekFlK3pjZE1sYmtFUjF6OFg2TkE4cGdxZ25kVDZmcFhUMTNaNk5qRjJl?=
 =?utf-8?B?UE82bERsT21EQ1FaaG41cGx5aU5NeTBZOUFqOTdZbDN4K1gxbHVPd3V5ZFNW?=
 =?utf-8?B?TmVGZTZYUXJSUjZra1hxeU0zcmxIRTE1SzF5S2didFdUTS9nV3ZZZGkrUUto?=
 =?utf-8?B?K3g5ZXpPWG5uMmY3NEgwaVljN2hQWUNVNDFEMTAvNnFTeUlUVFFVMG1zeGVL?=
 =?utf-8?B?NFRCMnlLN25YOWg5LzE4SCtrUzZrZTVHNVZML1RUOW1XQVhzb29MSy96SWxw?=
 =?utf-8?B?cXI4VHRKRU1jdytTdFJ3NkU2SWRBbDFsbzVtclRyREI1eTFqVzFCcmZ6VnE4?=
 =?utf-8?B?ZEkwOHVvZmY0TkdBVUNMcGRzcUR3STJ4andxaEJpNjR2SUw3cTVPQU9kWkJS?=
 =?utf-8?B?Qld4R1NJRGNTUjhILzFPcE5DQytYbVpxUFUyQUlKY3ZMU1JCY1hGY3F1dHpn?=
 =?utf-8?B?Unh4bjlOSmREaUF3ODR1QWE2ZWRLcG8wMDJvcGFDZ2J1NDUrNGhmVTM0Vlkz?=
 =?utf-8?B?V0Vscmo3QXlJRm9pWGJvSEFsbG1RQjNMcnpWYkxNZlF6VWw0ckdHeE9RZ2ZF?=
 =?utf-8?B?clcrZE9kVFQ4TEZyVDBWUDFGV05nSHlETmJ5NDM3Sy92aGRWN0dlNktNOFlN?=
 =?utf-8?B?aTZGaVE2TnkvakN3T0ZFcmdaVDhIUjVxWTYrTFhXMTE4QVNuT1VTQzh4NzRt?=
 =?utf-8?B?Ync9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C3CF35BC7D5EF48991156D3FEE5E7CD@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6e3e38-262f-4748-c629-08dd4b6bb646
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 13:46:54.7832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TGvTFshrBO+UYITFAwV3S4OpQU1H/iVqz69dpMlJADGKem7ay2VlXTRoR8HIJNa7t6J087vCc2pXKEe0tHyXYVjImNs4NPjuPm8bhA4WjZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB10196
X-Authority-Analysis: v=2.4 cv=ALxkcdDx c=1 sm=1 tr=0 ts=67aca658 cx=c_pps a=z1DpLKiO5LaG0b/iPMc9+w==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=4MthsM0t3ikA:10
 a=-5LYVjoNHPMA:10 a=SrsycIMJAAAA:8 a=Ts3c6zwUluyeuPI89lAA:9 a=QEXdDO2ut3YA:10 a=zapPnUM7SFj2ezx6rUw-:22
X-Proofpoint-GUID: 6Dm3mCwq-m7EFRX-hLp1lvSswxFUX6WA
X-Proofpoint-ORIG-GUID: 6Dm3mCwq-m7EFRX-hLp1lvSswxFUX6WA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Reason: orgsafe

QWRkIHN1cHBvcnQgZm9yIFZlcmlTaWxpY29uIEdQSU8gY29udHJvbGxlci4NCg0KU2lnbmVkLW9m
Zi1ieTogTmlrb2xhb3MgUGFzYWxvdWtvcyA8bmlrb2xhb3MucGFzYWxvdWtvc0BibGFpemUuY29t
Pg0KLS0tDQogYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZyB8IDEgKw0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQ0KDQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9jb25maWdzL2Rl
ZmNvbmZpZyBiL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcNCmluZGV4IDI0NmExMzQxMmJm
MDUyMjFlNGUzMDZmZjA4NTdkZGUxM2YwZmQxNTUuLjI2ZDdiOTlhMjc2ZjczN2I1N2YzMTdmN2Q3
Y2ExMjI4ZDExODNhMDIgMTAwNjQ0DQotLS0gYS9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmln
DQorKysgYi9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnDQpAQCAtNjYwLDYgKzY2MCw3IEBA
IENPTkZJR19HUElPX1JDQVI9eQ0KIENPTkZJR19HUElPX1NZU0NPTj15DQogQ09ORklHX0dQSU9f
VU5JUEhJRVI9eQ0KIENPTkZJR19HUElPX1ZJU0NPTlRJPXkNCitDT05GSUdfR1BJT19WU0lBUEI9
eQ0KIENPTkZJR19HUElPX1dDRDkzNFg9bQ0KIENPTkZJR19HUElPX1ZGNjEwPXkNCiBDT05GSUdf
R1BJT19YR0VORT15DQoNCi0tIA0KMi40My4wDQoNCg==

