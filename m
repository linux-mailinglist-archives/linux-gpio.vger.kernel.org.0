Return-Path: <linux-gpio+bounces-18059-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 046DEA73014
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 12:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7D841778B7
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 11:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF172153D8;
	Thu, 27 Mar 2025 11:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b="F1pRlGgp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-0063e101.pphosted.com (mx07-0063e101.pphosted.com [205.220.184.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED102139B2;
	Thu, 27 Mar 2025 11:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743075523; cv=fail; b=I9P7obQoKFrIJfWTj2a3Eee6aTiffEN1e+P4idjAjWIgGSGTSkPZpARItiJ4JMsUQcM7TG84WIkvuWeDAH6vCgaVJ0lHSuAxvPA9ZmZm6+5qVa2YaF+tI+iyrUzVy+LdiceFHzWVwe/dYH+mU573Mo3iayCnXeiCweCU3QOMt6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743075523; c=relaxed/simple;
	bh=vnA1UymLOMeibDYYF5JoYhc1CMTgPHJDZ7mE1VBCPXw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Uug5BuRXYS3lpf9JQX5Gnybbkoz7ZrKY4i2ohEFsE755lgA08z28VINdV2NKVuwh7eIS7a5jthNku/7UPs8R6M7eyDb4Bv85U1erlNMf7pK9rvXBUlILJbosG6kNGrWSOUshsTQObW9eI4cWq4L+KKfCBo0WNXfQ1i647eScHsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com; spf=pass smtp.mailfrom=blaize.com; dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b=F1pRlGgp; arc=fail smtp.client-ip=205.220.184.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blaize.com
Received: from pps.filterd (m0247495.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RB3Ix7019756;
	Thu, 27 Mar 2025 11:27:26 GMT
Received: from pnypr01cu001.outbound.protection.outlook.com (mail-centralindiaazlp17010007.outbound.protection.outlook.com [40.93.132.7])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 45hkb2thc2-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 11:27:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nzb95QX62xHjJ1ZTMDFTreVkWNSojbmivktjiuUaZhPym4cfPKN4KV4Q9IzKRNh/owM12izURB+AJWg7QK5mIPJ3WRBOMaELbOBTfHBJ9LroEUuUSYe0zhREYuMZfhyOLWvhsc5YfINoAY9Mv9EGRhOEuzMt7QELhJ/2KwPl862jVQ8qo/x2WJZ3N9gvsVVNYGgf+o1Yw0Gv+RYrtD70S47qNuT8FYiKvmMXsMsntj2eAfvzF48g23o1Qded3b9SFn5yKOOhbN2ipVld7JoZKjHj6w5lnwZP942Rn4rFhP1tn9kCB9cKAJnICfiCsvaaM5pZqfCz1CSZv7UFLrIokA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnA1UymLOMeibDYYF5JoYhc1CMTgPHJDZ7mE1VBCPXw=;
 b=vEPMadRvrx3Fl4GLB447m9mJ9Zz0snTDxgEmCO9veHQLvzBKWEliyDunU+c5OsnQB5RiNB5WkRT43I/BHLRkZuq1RC6oYftBPCGZgjprLiqw3WZqGyCEFQndPR+fsibMgylWrkYiZXdQix2bS8k1Qw8hGFeX3lO/NfGye45vgqFEXqP5jhaGHKxkqy/OK8qnz7UjlfXc9TZWidYgzbiba/hEcMPAH7PTpe20cUSMQD892am8NX5D+bjda97WejOZuvmS4TUEccPZselA1bevIesypPOR9//0AcXav2uXBp4DpSspBnVpMnP3dClFwMi3ifZ2QYMvhn9/10C/zULKQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnA1UymLOMeibDYYF5JoYhc1CMTgPHJDZ7mE1VBCPXw=;
 b=F1pRlGgpKe/2wqt0C7vhxHr9ceMKdvtBqeftqtGRupuiecDu194AMJibvt4VuUqLVrkB1155570NX9OMDaQ31B8rX33NBb/GuWfUBroUmPItC2/smrPH7/GVjGoJGwQFbt4nqoenvvTNW/4QcWP16mu11ou+wPJqYY1enCldeA0=
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12a::5)
 by MAZPR01MB8910.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 11:27:05 +0000
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655]) by MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655%4]) with mapi id 15.20.8583.026; Thu, 27 Mar 2025
 11:27:05 +0000
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
Subject: [PATCH v2 3/3] arm64: dts: blaize-blzp1600: Enable GPIO support
Thread-Topic: [PATCH v2 3/3] arm64: dts: blaize-blzp1600: Enable GPIO support
Thread-Index: AQHbnwsr8t06J68oF0WylvpAtNCDMg==
Date: Thu, 27 Mar 2025 11:27:05 +0000
Message-ID:
 <20250327-kernel-upstreaming-add_gpio_support-v2-3-bbe51f8d66da@blaize.com>
References:
 <20250327-kernel-upstreaming-add_gpio_support-v2-0-bbe51f8d66da@blaize.com>
In-Reply-To:
 <20250327-kernel-upstreaming-add_gpio_support-v2-0-bbe51f8d66da@blaize.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB10184:EE_|MAZPR01MB8910:EE_
x-ms-office365-filtering-correlation-id: 1f420926-929a-4e97-b130-08dd6d224dd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?MWI0T1o4dXdYU3FlYXVEWWJKOUIwMzdvLy9CTFZ4b21mMURnVzFwQ0RJa0hG?=
 =?utf-8?B?WTV0OTVhTU82MnhZNkxrUUMySnlHS2o2SkJxNXBZSlZYdit5ZGsyaGlIb0Fr?=
 =?utf-8?B?eXhsTi9VR2Zud1J4WXU5WFphY3g5TDV3MHdTVzB2UiswbHJCMzd5TGVrRFo4?=
 =?utf-8?B?dkE0NGRZd21ORkFwbXJpUUphSUttRjBmRUM5dFl1Z3U0MGh2OGxtV3RMc2Vt?=
 =?utf-8?B?WjVSVUV1aWlZeE40dGRWWjlMOTNtVy9DYjFMeGhiRjl2cVJ6ODdYVzVxS3Qz?=
 =?utf-8?B?OFQrRmdJcCttV3I2S1FEZ01jV0R6SU00SytVcWZYbGpaMk1FMlJQa0sxak15?=
 =?utf-8?B?d0FkWWgxNE9zb2FaWWRUOThxTmFUUWNhdTgrWHY4RmM5eTgyQzd6eTVjelY5?=
 =?utf-8?B?a29JZkoxaW01bDRJVmtPTEtwQUIyN3VWUVcrMUVnalV5QkhiSjNOTFozUGVz?=
 =?utf-8?B?UktrbU8zb3JNbytEMURDU3V0S2ZyOW9TR1FHZW1XQWJhVzE2UGdKdzJUZnpL?=
 =?utf-8?B?Z3B6ZkZyUVV0R25HVlhOZFpaZHIwcmlUZWhmeVcrcVduTm44d3FFVW1td0FM?=
 =?utf-8?B?cGJHUitKeGVWVHB3cVFxQ3FPREIyMmpVNlQwbmR4ZmdNWHlxN3FLMmVvd1F4?=
 =?utf-8?B?TUlRd21OaTdySFNzR1lhSm85Y3lVdVdKd2FKOENpNXRqcm91OElMeko5Q0lQ?=
 =?utf-8?B?Z3BwSHdnZVFVUi9IeWp6WUp2YWw3QisvMW1YbW13WmhLMkdaemFtcFUwWHJ4?=
 =?utf-8?B?U3lCcUhTeVZIK2ZFMEF6cnZCYVF5RFpKQ29jWk41amdNNUFOdXB2T1JMWUFt?=
 =?utf-8?B?VFdvbE0rZjFneTRlMDAxbkFlajhRcGFPWTYvSURDRWZLMThpMHdjZzJiQ05r?=
 =?utf-8?B?S29qczFFTGE2NjNDNk8zQTJRNk02YmYzQlliYlZHZXowVHd2QTFhMFpxdTBR?=
 =?utf-8?B?d0VudlpOR29FU01KOXBuR3l0bDRoNUFSY1d6Vm5MMm41c25SeTI3ejZNa0U0?=
 =?utf-8?B?bDBmaWdiK0ROMW9LTVlIZm0zRjUzMnVURi9HWTBqeU43SVpkdFpFeFB3WW9U?=
 =?utf-8?B?RW95TFpXUmpjTnJYa0FDTGtuOTROeWFrUG5iMm1Pa2Vuc3VJVUszeDErZFRX?=
 =?utf-8?B?a2oxMldXdENiQlpoM01RNE42Y0MrdHpyR3ZrSkprbkdqbFFCdTVNUFltdDl2?=
 =?utf-8?B?Rmp1ZmJpZjJNZ3JOWjkzMDhnblBxYXNOL0wycmQrWGJHUXBaYUc0ZE03bU1p?=
 =?utf-8?B?OTRtV1ppdUZSVTBpK2JqN3N1QkpWT2FGMnpqaklSVkVkdi91cHVNWGVyVlZh?=
 =?utf-8?B?S0c3WXpxM3dWZlFNdktNY3VKTGRiL2pjLzdmWkhaNGwwckgrMnREeSszYUpZ?=
 =?utf-8?B?eFQrTktuaExSVktBQVNZVDZDRS9lY2RTaG43U3U3QjdYcE94TXkzS1l0QnJO?=
 =?utf-8?B?YUVlQkdnbFRuc2IyTFB2R1pNTzNtVFRsV3VjTkgrdDNPWHdtWEc4MUNWNXRF?=
 =?utf-8?B?VmljVFYvaGI2c1Z0Nmxqbmx5djFJWnMyb2h6citZS2hoekZnYTZYb21nTTJa?=
 =?utf-8?B?WXg4amFQd2REbDhFaDAyRDNYMUVWOEtlWXVieEQ1V3ZqdnU5UkNFRDdjaUxQ?=
 =?utf-8?B?WEpxSWpzNkJ1V0dYRlhjeFFGVXQ5amtXT3M5ZSszMTE0M1R6a0JMTDVaZ25k?=
 =?utf-8?B?ZGpCSHVwQWZlQnlOUEJlUXVEQnlNY2tiNERvN2RzYTFwVFg1T2VtTmhJb0xu?=
 =?utf-8?B?UW5jeFZDT2tHOCtQcFdXbjdySXphM0pqY0ZkUkQ3QUl5c3NZVFhpRVM5V0Uw?=
 =?utf-8?B?czlWR0RCMFE1bUFnQ2JrbE5iMERSbm56OGdzam5vbHIxZ2VnVzBSRlBpUDJU?=
 =?utf-8?B?MjFjQVFrL3hPa2xoTFJ3WElIbW4xeDVGYVJMcUIrdGdIUHcxeFZ0S1p1TGgx?=
 =?utf-8?B?NmxLL2hmeUpwYlVsc2w3b09icmx4ZURzTnNPTEZldzlHNUtNeW1qTHViNjNw?=
 =?utf-8?B?cW5wcVRsZlNRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?KzM2bS9RVHFOaWZjZm9kUmMzaXlWamVDT3BVY292WnIxK24yejR4a3JmYXcx?=
 =?utf-8?B?VUlxcm13aVBtVUhEYndXdjVpL2xWaXNoeU56SG5USjB4REU3OEJUWkFpRTdk?=
 =?utf-8?B?ZHBDL252WlgrazNicWEvbloxaXBCd3pkRVNJb3ovaFZHcnh5SXN1V0NmUmlN?=
 =?utf-8?B?WWcxYncvNUx0V21pbzZyT0hzVS93L0FPQzJHMmpEZHl5Q0ZWdjJ4WEk3dFVh?=
 =?utf-8?B?VFBteXEyc0psNUQzZjV2RUFjNVBHdWNkdFUrVllRUFNhdFdHOHNvd2dldi9S?=
 =?utf-8?B?ejFENjUvL29NeFRTWHdJMzl0S3VxOUpEK1ZSUjNZVnE0V2VPemhKZmxSSndM?=
 =?utf-8?B?ckRybng4cW8wMWlzdG1TeXZUd3VRZTE3RUd2dVRIbmxzQ0tuQXlnU1RnaVpq?=
 =?utf-8?B?T05oWnF0YnFNbFMrTkFoS1lNOFNBU3VsUjIxKzhzckxQYld2VmV2NzNEZFNm?=
 =?utf-8?B?YlZwQVp2Q0N5aXd5WGlCTHVCdnlDQXBpTFpLZTlWbVRlMVdWU3NwQU5vRWJq?=
 =?utf-8?B?Smk4Q0NIWjhIN0dWMkE5LzErcE1ONjBIWHpLZktGNHpIaFZ3SGx2cStOdlFs?=
 =?utf-8?B?U1ZDeDBsL0JjQXZrMmxFWlJzSXZCa1dmQzZwZUtqRzk5YmhUQXJCNFBENUJ1?=
 =?utf-8?B?SEVENjQxMnVOaXNvM1M1MHpxdDFabVNOUXZjdVo1eHl2UkpKWURDdCs4MUxr?=
 =?utf-8?B?L1JLQ1R6Q05QbFRxbngrTFpUQ1MyVWw0MFNVdVBaSWliTk9NdEYyRFBTY3BW?=
 =?utf-8?B?Y2QydWtXdHJObHpUTkZuQUF3eGx4V2pxWEcyMmtTM2JLV29WWlN3Z2lkM1pV?=
 =?utf-8?B?ZEVQNjhCQUdTTnI5YjdSWkZjYUtNcmF4T1dnd2p1Ym5PLzFHaVYrQzhGUFNZ?=
 =?utf-8?B?dXRPZTU3SmZVTjV6a3RxT1hPTmQvWnFmamNucDV1TFV6VXVJMVpUUkFjWkJl?=
 =?utf-8?B?MVYrWlNBVFoxVmN0WVkrM0xNQlg0dWlpb2xjOEVKb0ladU9iQVBTcHpTamsz?=
 =?utf-8?B?Y2tjaFdpdUdFUFU5VEdReEVVc2RSQ3F1Q3VLZVVXem5wQnpOUTFSVUhrZ09k?=
 =?utf-8?B?YlBGUHdsTGx3dk1KWXpFV2JEU0NFN3ZuNnREKzBGQnFUbEJzWkRZSjgwUVhX?=
 =?utf-8?B?MWRldVJFdG1qb1kvSVJvZW1IaythbDZDOEU5TkZnSEhtNjJETkxQd1QzZlVP?=
 =?utf-8?B?VitQcSszY3pzUEdjMHlZUXRJY21OVUtDUXMzbkY2Tllaa0VURlE5OHR5UzZR?=
 =?utf-8?B?MHdrWUxNZHRtdXVqdjQvREkvR1lGT3Z5dHRPMThNVC9YOUs4cTlSZ1lxVms4?=
 =?utf-8?B?T1NTTFNMSlRlekRtTnVwWUMrMDBBWjJ0dW1ISTBVVld4SWROcUxNZjJJYmda?=
 =?utf-8?B?ajZHWW9vRDFhbGtFeUFtWVBnMjYxSHlmcFkyMG93S2ZWcTcxYXBJemZtUDBj?=
 =?utf-8?B?VGV2M2w0Si9PK2lrR1BaV0VpUHNuMU5nbDVrbGRBK3F3WlBxWHhrWThqaCt4?=
 =?utf-8?B?elVzcC9HTXJGQW1vdzI0VkJ1Mkh2MWdiN2VEckJxZjJCbjVKSytLZmVIOERk?=
 =?utf-8?B?a0JDWEE2cG1qQncrVXZwVkJmYkh0alJLVjNkSUx3SmpUeFJuMHNGRy9oTnha?=
 =?utf-8?B?VjFUOFJaK2NCNEZxNUlkTklSQ0hIRmpCZmt1QU01MEFqQmZ3aUNxSTF6T3Rr?=
 =?utf-8?B?WkVwcDZYSXN3YkF1d1gxZlhPQUpIcW1JS2tCMTlkVTdCRlJDY0t2ZlFSMlJI?=
 =?utf-8?B?anU2YmVVOHdndXd4TmgvU1hnMTAyelRaeURzVUlvb3VLUlFwV1Bnc1gxZkUy?=
 =?utf-8?B?RDBoZUVXR2w3Myt3dVJwbTluMCs1ZmJ5U0hkejQ2clZYMGM1Tm5lUzlBcUQ1?=
 =?utf-8?B?UmFwWHBYaWorcHFKOEpVMitRb0tUNythUGc1ZXZGNUhNRTFLT1ZEaHVyY0pk?=
 =?utf-8?B?T2tkVExpb2t0NDJSQ3VzdXh4WFJ2R1RYVkhBemxYTGFDM0JUMWVkdTE3alZ3?=
 =?utf-8?B?a3RFYmVRMkZQY3lCOG9lMTJOdkdzaEJOeUh3VVdFWFBTdEZzMU9RSERhNUtU?=
 =?utf-8?B?ejR4UW9ianlzMnZoL0FtRFdxUzRKOStpOFNqdk5RdFlTTzZzN1lPZzF1WmpG?=
 =?utf-8?B?VEtuSHc4aDVhVTBQVFpBcjJhMStQekxWMWJuWllYOEVLdkhBSjVia1laditv?=
 =?utf-8?B?WUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4A589C210C59841B96809F08BA6D060@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f420926-929a-4e97-b130-08dd6d224dd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 11:27:05.7835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kDtKasEEZzQcLUKg9J0d/TaX8H8ZN+XWMgJuJ0MCCGOtBrf39sQqG4TyNzZyi6JxhjNY/NWWWT54oGRUYVK3RNARF0F97GxEN9eGVYmMv10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB8910
X-Proofpoint-GUID: LUOOzxyhwKLqtI-iPPN3E5iufAyfFJNA
X-Proofpoint-ORIG-GUID: LUOOzxyhwKLqtI-iPPN3E5iufAyfFJNA
X-Authority-Analysis: v=2.4 cv=JvjxrN4C c=1 sm=1 tr=0 ts=67e5361e cx=c_pps a=5CkbgoO2JNAQOP1ij0Zt3g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=-5LYVjoNHPMA:10 a=SrsycIMJAAAA:8 a=SrueIWi38-K_uB21zSIA:9 a=QEXdDO2ut3YA:10 a=zapPnUM7SFj2ezx6rUw-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Reason: orgsafe

QmxhaXplIEJMWlAxNjAwIHVzZXMgdGhlIGN1c3RvbSBzaWxpY29uIHByb3ZpZGVkIGZyb20NClZl
cmlTaWxpY29uIHRvIGFkZCBHUElPIHN1cHBvcnQuDQpUaGlzIGludGVyZmFjZSBpcyB1c2VkIHRv
IGNvbnRyb2wgc2lnbmFscyBvbiBtYW55IG90aGVyDQpwZXJpcGhlcmFscywgc3VjaCBhcyBFdGhl
cm5ldCwgVVNCLCBTRCBhbmQgZU1NQy4NCg0KU2lnbmVkLW9mZi1ieTogTmlrb2xhb3MgUGFzYWxv
dWtvcyA8bmlrb2xhb3MucGFzYWxvdWtvc0BibGFpemUuY29tPg0KLS0tDQogYXJjaC9hcm02NC9i
b290L2R0cy9ibGFpemUvYmxhaXplLWJsenAxNjAwLWNiMi5kdHMgfCAzNiArKysrKysrKysrKysr
KysrKysrKysrDQogYXJjaC9hcm02NC9ib290L2R0cy9ibGFpemUvYmxhaXplLWJsenAxNjAwLmR0
c2kgICAgfCAxMiArKysrKysrKw0KIDIgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQ0K
DQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9ibGFpemUvYmxhaXplLWJsenAxNjAw
LWNiMi5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2JsYWl6ZS9ibGFpemUtYmx6cDE2MDAtY2Iy
LmR0cw0KaW5kZXggN2UzY2VmMmVkMzUyMmUyMDI0ODdlNzk5YjIwMjFjZDQ1Mzk4ZTAwNi4uZmI1
NDE1ZWIzNDdhMDI4ZmM2NTA5MDAyN2E0YzRmYzg5YzgyODBmNSAxMDA2NDQNCi0tLSBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYmxhaXplL2JsYWl6ZS1ibHpwMTYwMC1jYjIuZHRzDQorKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2JsYWl6ZS9ibGFpemUtYmx6cDE2MDAtY2IyLmR0cw0KQEAgLTgxLDMg
KzgxLDM5IEBAIGdwaW9fZXhwYW5kZXJfbTI6IGdwaW9ANzUgew0KIAkJCQkgICJVQVJUMV9UT19S
U1AiOwkvKiBHUElPXzE1ICovDQogCX07DQogfTsNCisNCismZ3BpbzAgew0KKwlzdGF0dXMgPSAi
b2theSI7DQorCWdwaW8tbGluZS1uYW1lcyA9ICJQRVJTVF9OIiwJCS8qIEdQSU9fMCAqLw0KKwkJ
CSAgIkxNOTYwNjNfQUxFUlRfTiIsCS8qIEdQSU9fMSAqLw0KKwkJCSAgIklOQTMyMjFfUFYiLAkJ
LyogR1BJT18yICovDQorCQkJICAiSU5BMzIyMV9DUklUIiwJLyogR1BJT18zICovDQorCQkJICAi
SU5BMzIyMV9XQVJOIiwJLyogR1BJT180ICovDQorCQkJICAiSU5BMzIyMV9UQyIsCQkvKiBHUElP
XzUgKi8NCisJCQkgICJRU1BJMF9SU1RfTiIsCS8qIEdQSU9fNiAqLw0KKwkJCSAgIkxNOTYwNjNf
VENSSVRfTiIsCS8qIEdQSU9fNyAqLw0KKwkJCSAgIkRTSV9UQ0hfSU5UIiwJLyogR1BJT184ICov
DQorCQkJICAiRFNJX1JTVCIsCQkvKiBHUElPXzkgKi8NCisJCQkgICJEU0lfQkwiLAkJLyogR1BJ
T18xMCAqLw0KKwkJCSAgIkRTSV9JTlQiLAkJLyogR1BJT18xMSAqLw0KKwkJCSAgIkVUSF9SU1Qi
LAkJLyogR1BJT18xMiAqLw0KKwkJCSAgIkNTSTBfUlNUIiwJCS8qIEdQSU9fMTMgKi8NCisJCQkg
ICJDU0kwX1BXRE4iLAkJLyogR1BJT18xNCAqLw0KKwkJCSAgIkNTSTFfUlNUIiwJCS8qIEdQSU9f
MTUgKi8NCisJCQkgICJDU0kxX1BXRE4iLAkJLyogR1BJT18xNiAqLw0KKwkJCSAgIkNTSTJfUlNU
IiwJCS8qIEdQSU9fMTcgKi8NCisJCQkgICJDU0kyX1BXRE4iLAkJLyogR1BJT18xOCAqLw0KKwkJ
CSAgIkNTSTNfUlNUIiwJCS8qIEdQSU9fMTkgKi8NCisJCQkgICJDU0kzX1BXRE4iLAkJLyogR1BJ
T18yMCAqLw0KKwkJCSAgIkFEQUNfUlNUIiwJCS8qIEdQSU9fMjEgKi8NCisJCQkgICJTRF9TV19W
REQiLAkJLyogR1BJT18yMiAqLw0KKwkJCSAgIlNEX1BPTl9WREQiLAkJLyogR1BJT18yMyAqLw0K
KwkJCSAgIkdQSU9fRVhQX0lOVCIsCS8qIEdQSU9fMjQgKi8NCisJCQkgICJCT0FSRF9JRF8wIiwJ
CS8qIEdQSU9fMjUgKi8NCisJCQkgICJTRElPMV9TV19WREQiLAkvKiBHUElPXzI2ICovDQorCQkJ
ICAiU0RJTzFfUE9OX1ZERCIsCS8qIEdQSU9fMjcgKi8NCisJCQkgICJTRElPMl9TV19WREQiLAkv
KiBHUElPXzI4ICovDQorCQkJICAiU0RJTzJfUE9OX1ZERCIsCS8qIEdQSU9fMjkgKi8NCisJCQkg
ICJCT0FSRF9JRF8xIiwJCS8qIEdQSU9fMzAgKi8NCisJCQkgICJCT0FSRF9JRF8yIjsJCS8qIEdQ
SU9fMzEgKi8NCit9Ow0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYmxhaXplL2Js
YWl6ZS1ibHpwMTYwMC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9ibGFpemUvYmxhaXplLWJs
enAxNjAwLmR0c2kNCmluZGV4IDdkMzk5ZTZhNTMyZjViMjQzODVkZDgzN2JlOTY1YmU3NzFjN2Qy
NGMuLjVhNmM4ODJiMmY1N2Q1N2QzMDQ4NjlkZWU4NzdjOTk2Y2JhYmI3MTIgMTAwNjQ0DQotLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL2JsYWl6ZS9ibGFpemUtYmx6cDE2MDAuZHRzaQ0KKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9ibGFpemUvYmxhaXplLWJsenAxNjAwLmR0c2kNCkBAIC0xMjAs
NiArMTIwLDE4IEBAIGdpYzogaW50ZXJydXB0LWNvbnRyb2xsZXJANDEwMDAwIHsNCiAJCQkJCQkg
SVJRX1RZUEVfTEVWRUxfTE9XKT47DQogCQl9Ow0KIA0KKwkJZ3BpbzA6IGdwaW9ANGMwMDAwIHsN
CisJCQljb21wYXRpYmxlID0gImJsYWl6ZSxibHpwMTYwMC1ncGlvIjsNCisJCQlyZWcgPSA8MHg0
YzAwMDAgMHgxMDAwPjsNCisJCQlncGlvLWNvbnRyb2xsZXI7DQorCQkJI2dwaW8tY2VsbHMgPSA8
Mj47DQorCQkJbmdwaW9zID0gPDMyPjsNCisJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMyBJUlFf
VFlQRV9MRVZFTF9ISUdIPjsNCisJCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsNCisJCQkjaW50ZXJy
dXB0LWNlbGxzID0gPDI+Ow0KKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQorCQl9Ow0KKw0KIAkJ
dWFydDA6IHNlcmlhbEA0ZDAwMDAgew0KIAkJCWNvbXBhdGlibGUgPSAibnMxNjU1MGEiOw0KIAkJ
CXJlZyA9IDwweDRkMDAwMCAweDEwMDA+Ow0KDQotLSANCjIuNDMuMA0KDQo=

