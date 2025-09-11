Return-Path: <linux-gpio+bounces-25927-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC08B52637
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 03:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AACC466F69
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 01:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A74222581;
	Thu, 11 Sep 2025 01:58:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023103.outbound.protection.outlook.com [52.101.127.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8DB2264B7;
	Thu, 11 Sep 2025 01:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757555928; cv=fail; b=DsIIG3ZkSVW7Qe24as7Htjev+zjKi8DlsLaomZGyo7uF/DcHw1zawVivyGX7Gm7wzvhVlj571oE5VsYtK/Vg8Vy7huUhBN1FYyLXHwrioBoYx+ccVjVMEfzBwiaijjFGVYhnXc4AIxa+fafUGtIZNzBT+LysR9FR72du3dF/bOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757555928; c=relaxed/simple;
	bh=TsjhQCmVgzjGp/SUTs1hVbwdL8/L3zMrn9ipClHFdOc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=spA4FgL8Y39y+ACs3Q1YH4LIsPkMaP/9MTq3ySyBKn5qNstcE/oP5ce6KI0a0s/91qx3gMgRT1GE/dkhf0zCHFXdX+R2JRqdLzVPZmF8l4UdEPO9OCqbtz4wUbY4pnmH6tOhC27srAR3X2+oeEd228Ers0hE4nxpLhR09utI2rY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VvOzBiD5uLrY5XTGxaAtRw2T6VtTHbjXHBj+Z0QDGCL3qF3XHa1K9+KGObeC+t/j0Nl/sR8p0HW1z9inv9c5NO68DY9TeUU37PkFK57b0ctBXd88lwDVz2wlXIINrNxvbUbxBlNDEDDaUH+pTZSQX2F8Wdm5sfLzc9OP/ClB/g9vw06Ybd2VHIOYypK6J2+g2BSaNX9OoyLtKW9/NkdQWq7MKTeH7uu1lBeUBLtGIYjVx45mlI5q/ekixloWA7JMmd88QqVZvdnFeWI+07F1WMFelxGLOpHYHaK+F5C2ep6kGrwS1b1BNtaZLfUHWNhZsiJ7Ekf/gRo0DldIsCp8TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsjhQCmVgzjGp/SUTs1hVbwdL8/L3zMrn9ipClHFdOc=;
 b=PkPeght5R1ErTt0K2lbRTJ18BG2lWWfp2HwdR4W1vvYrwmTDVEAQD37IkcMWLCND4ZwpCH/S3BQrCFpLO8/pu6AujXgwBNWtsoDaJhRJ7cq7XUxuNgkDtssZ5+Wt2ugIAcyySh51qbkBGXm9uyS+FFetkxDwnjUxqOgQTZ3v+j7qJ8jy3/cdhg1btRW6MWvGbfmAR4ta2dFzc/V5UtivSi46kHcE4KJBLRRtyuBs/0RA80n5WhQqpewelrMqF4+1Vf0aPMFGHaC+yFnzOr1AIYHJ8ecRq9ERD7yL3Enyjwhkb32lCQTN7nDUjB6OdEr3XVd7vGRnf/PB29M9Qu6u7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by SEYPR06MB5279.apcprd06.prod.outlook.com (2603:1096:101:82::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 01:58:41 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 01:58:40 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggMi8zXSBkdC1iaW5kaW5nczogcGluY3RybDogQWRk?=
 =?utf-8?Q?_cix,sky1-pinctrl?=
Thread-Topic: [PATCH 2/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
Thread-Index: AQHcFvw6Jst8WcIA+kKHV/WtkB0Of7R4ZNEAgBHcnvCAAsqSgIAAQ0Ug
Date: Thu, 11 Sep 2025 01:58:40 +0000
Message-ID:
 <PUZPR06MB588739911F77623C32AEACCAEF09A@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20250827024222.588082-1-gary.yang@cixtech.com>
 <20250827024222.588082-3-gary.yang@cixtech.com>
 <CACRpkdaX2VPAb+vihZ5BEAsGy+jNUdQ8q+3c3Q78uWmqZYeu=g@mail.gmail.com>
 <PUZPR06MB58879640C5849ABA55EF0C34EF0FA@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <CACRpkdZzqRo9LRkF8=BSDANweWd0ccWtu5_nznDUn_FS6Fb0BQ@mail.gmail.com>
In-Reply-To:
 <CACRpkdZzqRo9LRkF8=BSDANweWd0ccWtu5_nznDUn_FS6Fb0BQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|SEYPR06MB5279:EE_
x-ms-office365-filtering-correlation-id: 08d4ae66-3670-4c49-b46f-08ddf0d6bb0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NEN2cTRPNHY5VDFORGRHV1VvYWdBSEU4RnQybjZoT1Z3SDVLZzhzZll1VFg0?=
 =?utf-8?B?cmxRZDNsb1N5MTZjaE92Q0grWTg1a2NQZ0MrTzMyQXVoaHRUMHo2VmY1TWYv?=
 =?utf-8?B?aHRMY3dNNXY1Rk5BaEFvMlRFSE1FTTU1U0ZyMTFCNHpLTGdrcEl4Q1Z4d0hC?=
 =?utf-8?B?Q3ZMbm1BbmN3Qjh2b0FrcFIxeXdiQlhwSGFQZ1RFekRvYVA5YnhsazVJcUJJ?=
 =?utf-8?B?TWtTcE81dS9GeCs0WHN4Q0IrNnZlY0tWc0NFZ0ROQjFXM29pOTgrT2IvY2tP?=
 =?utf-8?B?K2NLR051amxZYmdBZHZaM2FxM0RmL0VIL0tzTXIySkJ1ZUt3Mk4zTkQ3NGZX?=
 =?utf-8?B?TFVLS1pKT2pORXhuc1R0QStvanUzNnVtUVJ0QnMrREU2ZGo3QUcvYzloMkJL?=
 =?utf-8?B?SXpSZVQ1Z2pDaE9CbnR3MHBCcm90K0tSbkFaVG1HN24zTUthN0kweExVQnc3?=
 =?utf-8?B?cjhjb09MRU5tb0hIZzdrK2VEZkNBZkxKTDg2ZmN0OTVBTlZRazN3eHVJWHA3?=
 =?utf-8?B?RDh4MWlEZzRZWlZMajlHVjhEdlhUdzFVZG83Q0lVZFF4dm0vT3UweFdTYUNp?=
 =?utf-8?B?WEFhaU9pMUtZczR4MEt1VkRmTm9aT3N3bjBKM0F2Q2NVeGE4OGk0Tzd0MUY5?=
 =?utf-8?B?QUNla0Z1WlRpRUtuRlZQRVIzQ3g4ZXQrb2RVZnV2UklZRDlId3hOVXB2SWdC?=
 =?utf-8?B?TmtYTHQvSHJwR1pLOUF4T3VqcmpOWktHL1BGR2MxZUFDTXBhQVgweUlpbXJK?=
 =?utf-8?B?bERQVFRyTUMxUGhPWkRMYjZ5MUVLSXRJOE9wYmZNRExSUjl6SVNRR2lHWlNu?=
 =?utf-8?B?MkcxakxSa3F4K2haYUt2WHRnVEFyT3ZmUS9ha21iSlBHUzk4eVhnWXVSY0hi?=
 =?utf-8?B?TVN5cXBRMDdSNjZkclJlT3J1ZkVNUzZRVkU1eWFWM0FLaE5QREU0ME5BWDZh?=
 =?utf-8?B?MEVmZEVYUDl4blpRY1hma0dNVUJneCtTbDFRS2krRlJwTm9NeWtoK29IWDVH?=
 =?utf-8?B?MVM1dzVjOFlvSlRPNloyUDdwOHZpcEk0OUl3UEg3S3dZcE1xanZQdU5pby9U?=
 =?utf-8?B?Z1F2aWhUU3EzVDE2OEY4ZFdCaHo1ODhLSnd0L3ZiWEFtV01acXlVNVNEelox?=
 =?utf-8?B?T2kzYk5OTnZrMTU1ZmIwU3pqbHZEWjR1dGYrNGVjVmgrWUY2aWxFZmE2Ym5h?=
 =?utf-8?B?SHJGR3Z4SWVJNEIzdnY2dHlWZWxWUEYwTHVobjRaa2E0blgzelRaVklZc0Nh?=
 =?utf-8?B?a3ljbmxPWVVqenVpRWtKTnV0YUdFdThEeDRROEs1V1VQcXBPZyt1Z2lwSXRn?=
 =?utf-8?B?S3hmSHlzM1FMMzlHMUg4aCtvYStocnBCT1I0YnQvRDVibSs1SE8zdmpVajdP?=
 =?utf-8?B?dWk3Szd0MldHN1hkWEk4dFBSSHd1b2ltSVMwaVduZkU2ZXcyL2lkQi8wd3BG?=
 =?utf-8?B?TkhDWVQ1VG1LL3Zmb0ZQYU9SbWhQVGovVWVuU0dmWTMyU0JwUStmSS8xRlpH?=
 =?utf-8?B?c2g3d3FWN25jK2txK0daOHdvdHM4L0lpRWxFTklOaVlFZFBpbzVEdTFUVmhm?=
 =?utf-8?B?R2RXc3o5UWo4L29VRjU3Mk1ESFArQWJlWEVJL0k1RkpJRGVSWFpMbmQwWkRS?=
 =?utf-8?B?a2FENkhNL3JYelptTTB2cWtnbFR4MEVHcHg3QU0zQWFrTGZhOEJzZXBhbHg2?=
 =?utf-8?B?ZVVnUlI0eHJiSlpIaHJnS3F1VEhjY1h6SGpELytYdUd1V25HUExCa1ZLY1pa?=
 =?utf-8?B?VkFoYnNhMUU5alBZTEN0RnB5dXR2L2lUS2l0VFlmai9ydDlzTEp2Sjk3ZHd4?=
 =?utf-8?B?Z1NmYnkxSkQxWkwxdW84SEZ3QWdMK2YyRGFreitiM1lZUTRvYkxLK2NEUXVj?=
 =?utf-8?B?S0tuNVpnWFdBTkhTZEVmVGtmYVpWZ0U0UEsvNkpDSXIyRnNaMWh3K2UzMWk0?=
 =?utf-8?B?d1BMaGtLaDJQSE1odXpCNFBZNXZqSlArQi9YL09MSWp5cFIxbEpsT04rc2k2?=
 =?utf-8?Q?HzXRIXti0p2/ypgaeucY9SIFNjoFXg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QzA0MEhYOTgyNGk3Zmg0K0J5ZUlJL0VTT3EwREVCcTlMWWJ0elJ0UFpYQ0JQ?=
 =?utf-8?B?WFVDeE5ITjU0S3hPZTFMRzRDVFpoQWduV2YyQnZ2dVB3UGhrOXFUejlCWEYz?=
 =?utf-8?B?a1QrMXA1cmNxTzRjYk4xZVpkcHFIOWY1clV5UFlzK0dmT1lDZ21haE9wVXBR?=
 =?utf-8?B?V3RsbnQxUUR5cnRhMFhBNVVteisyL0E0ZEZFL3l0Qkh6czhaRFJvMDBQV3p6?=
 =?utf-8?B?YWJlVGhUMWRjYXFUMythWlRCUDNNdU95cTJBZ3BvK2xRZ3JCbUNQOUZEbTNy?=
 =?utf-8?B?TjNXYnU2S3NnMS9zT2FSQWQzMjVQTXJhQ0FPZG8ydS9VSVhXM1RWT0IzUlhR?=
 =?utf-8?B?NzFxKzlqaElEWklkRVc0WGtSbTZqK0lkdkFsVlNrWmVmNEVpUW9PU3A1eWFT?=
 =?utf-8?B?L1NTUkNsc0FnTWZmSWZUamJtYzljV2pMNEJObEpYdGRDSWtlRW13VzlzMzcy?=
 =?utf-8?B?enBiTG1NRXBDMldCSGdUOThaNW40RWdZSE5XcWtWQVhZUlcydTRyMFVZK3BP?=
 =?utf-8?B?Y3BMNjVydW5Ka1dON2UwcTRLQ1pnZm5tM3V1VFVaUk9sQkx4dU1kM0NCb2tw?=
 =?utf-8?B?K3RzZXZvMGd2b2t5ZnQ5UDR2ODcrMHpoTWFoZEgwYjk1UENHM2NYNVNSV2RC?=
 =?utf-8?B?c0toWFU5VktwTnBwRkhRYmNIQVJLZmFYcndteEU3UUg1QkorSk1MUG9qclJJ?=
 =?utf-8?B?TjBwL1krUER3eEVhV2k4Tm5VcWM3VGNUVXY4a1JScnlZaEdhbE5QT09DRi9R?=
 =?utf-8?B?TnNKVTByQUF3aXBsS1dkYkpDelBxSEFEeXU4eXM4aEtEQ2tJV0g2ZlgrR2xE?=
 =?utf-8?B?S0xSVXdabXY0aWJYRCtmRHpSdmVlWDh6SE9kOHFKWG81a0xPakExM2N4ZGNG?=
 =?utf-8?B?djc2MVZieUpYaERwaGN1SXJLY1ZXT2I2RXR0TElKME9jK0RXNys4RGo5dzhO?=
 =?utf-8?B?dE4vSFFCYVdrTjhYUUFvRzlTWWhJUEk0VUVjOEViOEp5WFlBY21ZZWZmemdy?=
 =?utf-8?B?Y2wvZ1NtTmtNWmQzQ3MwRk96TGIrVzRmcFhXdWtlK2c1SWU4SnlnUi9XYkZJ?=
 =?utf-8?B?bmhjUkg1aTVPRHRoV3hvVFBkdGRnMko4dE0xazlBUFpHQkFwRStSNWxlVyto?=
 =?utf-8?B?ZlBsQzA0cGN3OXZHT3ZLaVpDMkpsdm5pc3ZGbVI4YVJiUlI4c0FtRnZ1Yncy?=
 =?utf-8?B?MWhoK3NsdTZhME5OR1dTU3h1L29yektPT29rYTd6Q0VhVTBYNW5ObFJRTE9R?=
 =?utf-8?B?cEU4dXpCOUE4WnRBUUNHVXNKUTIxdHZLNGZwVWV0NThhNUFMQ1V3T3FQVWlC?=
 =?utf-8?B?bnBtT2t6SE5HYTJQM2QrK01DTWFWcXZaMDA4eTFsak8zNTAvMnBQWFoxejZx?=
 =?utf-8?B?ZFVhNmpKc3hSMU9QT0oyeU1KSmtORjJSN2pid3hmb1pJQVJzSERyNWV2RndW?=
 =?utf-8?B?NU9wUFVNNEowVkpPSzZMM0NOU3NnQ1ZQVnMvWDJTMCs5bis0aytRMU03Wk45?=
 =?utf-8?B?WjZOd0JkSkFWOXdOQWJSWHltMlZKMkxIOUt5LzJtR010NklBTG9zRWJtelda?=
 =?utf-8?B?TWVQZmxYU2RKTmVRaW5FVTZucmhlZERGMk9KeWdnU2J6bnE4NzdBeUxFbTB6?=
 =?utf-8?B?VnFST3lyUTlnK3dwdnBvK3IxZmlTTEJMWUJMTHlrYjVmUHhoSVVSYkJLYWtJ?=
 =?utf-8?B?N29pampKaVNNazViVWwybTRJYnZIVkZNbjM4NWtGZmZEWTNrZ1FaM1BqM05F?=
 =?utf-8?B?ZWJNZWtERzlQRklRK09EMjlOcUhlUC9NcSt3dFhEWmlKL2J6WFZMbUxCeGg0?=
 =?utf-8?B?VTU1UG1lWGlDMFptRWNzOEdoTkxKc0lFK3NvaVg5dHMyVmtZMUFGVmlsNm9n?=
 =?utf-8?B?RkE4V0JWV2F3YXVvRFErUWNYbU5HdzNmOEF3LzRING13VnhSekM2OU5Zemhy?=
 =?utf-8?B?VWJ4bm5JTTA2VXI1Lys3WUdXL1ZXNnlqVjVUVXptendpbWh0emRPOCtjU3hS?=
 =?utf-8?B?bFhkM1FOR21SbEVTdGU0ZDAveHI2a3YxSmVKMllFOWpjV2pUYlN6QUlMSnZl?=
 =?utf-8?B?NkhPU01oVURDbG1LeTNXVHJyMDhTMEFrSCszb3dlMDlGZDBGakU1cHpjQlRP?=
 =?utf-8?Q?ItJ+7kV681Bb41cV7yirgkDUJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d4ae66-3670-4c49-b46f-08ddf0d6bb0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 01:58:40.7806
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YS+dQFMmwAi6jSiDdDwZp2lIzilLLs3+DwbnM9izrQ+OnFdSdV/cwZqfVy0JulnqzRdj1P52MtlZJQQM2Y2UVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5279

SGkgTGludXMsDQoNCj4gT24gVHVlLCBTZXAgOSwgMjAyNSBhdCA1OjMw4oCvQU0gR2FyeSBZYW5n
IDxnYXJ5LnlhbmdAY2l4dGVjaC5jb20+IHdyb3RlOg0KPiANCj4gPiBGaXJzdCBzaGFyZSBhIGdv
b2QgbmV3cyB3aXRoIHlvdS4gSXQncyB0aGF0IFdlIGhhdmUgdmVyaWZpZWQgdGhlIG5ldyBzY2hl
bWUNCj4gcGFzcyBvbiBSYWRheCBPNiBib2FyZC4NCj4gDQo+IFRoYXQncyBncmVhdCENCj4gDQo+
ID4gV2UganVzdCBoYXZlIGEgcXVlc3Rpb24gYmVmb3JlIHN1Ym1pdCBuZXcgcGF0Y2hzLiBBcyB5
b3Uga25vdywgdGhlcmUgYXJlDQo+IHNvbWUgbWFjcm9zIGRlZmluZXMgaW4gZHRzL2R0c2kgZmls
ZS4NCj4gPg0KPiA+IFdoZXJlIHNob3VsZCB0aGVzZSBkZWZpbmVzIGxvY2F0ZT8gV2UgZm91bmQg
dGhlc2UgZGVmaW5lcyBsb2NhdGUgaW4NCj4gPiBpbmNsdWRlL2R0LWJpbmRpbmdzL3BpbmN0cmwv
DQo+ID4NCj4gPiBtdDc2MjMtcGluZnVuYy5oIG9uIE1UNzYyMyBwbGF0Zm9ybS4gV2UgZG9uJ3Qg
ZmluZA0KPiBhcmNoL2FybTY0L2Jvb3QvZHRzLyovKiAtcGlubXV4LXByb3BzLmR0c2kuDQo+ID4N
Cj4gPiBXaGF0J3MgeW91ciBzdWdnZXN0aW9uPyBQbGVhc2Uga2luZGx5IHJlbWluZCBtZSBpZiBJ
IG1pc3VuZGVyc3RhbmQgYW5kDQo+IG1pc3MgYW55dGhpbmcuDQo+IA0KPiBZZXMgdGhlc2UgYXJl
IG9sZCBoYWJpdHMgZnJvbSBNZWRpYXRlayBwbGF0Zm9ybXMgd2hpY2ggYXJlIGJhZC4NCj4gDQo+
IFNpbmNlIHRoZXkgYXJlIG5vdCBiaW5kaW5ncywganVzdCBjb252ZW5pZW5jZSBkZWZpbmVzLCBJ
IHdvdWxkIHN1Z2dlc3QgeW91DQo+IG1vdmUgdGhlIHN0dWZmIGZyb20gaW5jbHVkZS9kdC1iaW5k
aW5ncy9waW5jdHJsL3BhZHMtc2t5MS5oDQo+IA0KPiBJbnRvDQo+IGFyY2gvYXJtNjQvYm9vdC9k
dHMvY2l4L3BhZHMtc2t5MVsuaHwuZHRzaV0NCj4gDQo+IEkgYW0gbm90IGF3YXJlIHRoYXQgdXNp
bmcgLmggb3IgLmR0c2kgaGFzIGFueSBzZW1hbnRpYyBkaWZmZXJlbmNlLCBtYXliZSB0aGUNCj4g
RFQgZXhwZXJ0cyBjYW4gdGVsbC4gTWF5YmUgdXNlIHBhZHMtc2t5MS5oIHRvIGJlIG9uIHRoZSBz
YWZlIHNpZGUuDQo+IA0KDQpZZXMsIEkgdW5kZXJzdGFuZCB5b3VyIHRoaW5raW5nIG5vdy4gd2Ug
YWxzbyBmaW5kIHNvbWUgZXhhbXBsZXMgdW5kZXIgYXJjaC9hcm02NC9ib290L2R0cy8qLyouaC4N
Cg0KZm9yIGV4YW1wbGU6IGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1waW5m
dW5jLmggYW5kIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4NTE2LXBpbmZ1bmMuaA0K
DQpXZSB3aWxsIHRha2UgdGhlbSBhcyBleGFtcGxlLCBhbmQgY3JlYXRlIGFyY2gvYXJtNjQvYm9v
dC9kdHMvY2l4L3NreTEtcGluZnVuYy5oLiBBbGwgcmlnaHQ/DQoNClRoYW5rcyBmb3IgeW91ciBz
dWdnZXN0aW9uLg0KDQpJZiBtaXNzIGFueSBpbmZvcm1hdGlvbiwgcGxlYXNlIGtpbmRseSByZW1p
bmQgbWUuDQoNCj4gWW91cnMsDQo+IExpbnVzIFdhbGxlaWoNCg0KQmVzdCB3aXNoZXMNCkdhcnkN
Cg0K

