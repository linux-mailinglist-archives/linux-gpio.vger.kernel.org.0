Return-Path: <linux-gpio+bounces-12266-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A76B69B3ADB
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 20:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED577B21D90
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 19:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831B11E0B7F;
	Mon, 28 Oct 2024 19:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="I0yXbZdM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2066.outbound.protection.outlook.com [40.107.247.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD291E0094
	for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 19:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730145185; cv=fail; b=HwhS5p4afDuZCWof+ZWmCEzH39QSAtvNl1yNBc+PxiI13hfY6A8hUcvkOPfIervj+NLEkfIhudvx0kawIP08wzpGafE0uPaE33yDdh6MHllNN4Fp7ewlVpWXn4wuhI8coaZ87nQ6eexYXDWIgZz+RWVukNx6mQc87MSgab1f+Eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730145185; c=relaxed/simple;
	bh=jD/bf73ydRfVY0Gn9JR2iHbWTohpYJpNnr45mqRMRzk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O17CQE6jB1FAthqAVN8cgDP+Tcs5lUsqluuJJaDb7YDSrzSuTI9eW+KRatWclrUuNLrPMVGd5P5O5coYueBU4rD+XyEZyGZjaxLOp7C4L93JK9v8Wq5jZuMdHySAXtQ2Nfplkwq7HgxTszAr8yEl8GBLi6MiZemJ0/UqH1lLYuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=I0yXbZdM; arc=fail smtp.client-ip=40.107.247.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8+uxiqgXadNzZjxmlntEG1yAFH9Q1JINA+y0ADkXc8QXFD6peF140uAj6RAGUKmi0OxxF9ecnrfWVITKMZ3MSCDuSER83rFVOu8H9KjUSfyd9Tg4BrAoIXilfkBSGEUPveaRPdCmTzGdbepBoCFN2pS3pdL4hXf2fpAa2Al+plRXwFhGNASTjkPuG1XV1s/TRN0Bd2JOViQ0SUNjQymXf1FJ+a1pDxun0A8p9c0iZk10VCBPDmtEj6poZnrPeC3HDUQnY2WJ+JRKFbTo3iqRDZa0lm673LeYpviqENbOBC6tLbSk+0rHqm14UlPwUp+OH3L8fTXhgT1y9XdNwGA4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jD/bf73ydRfVY0Gn9JR2iHbWTohpYJpNnr45mqRMRzk=;
 b=ESrxlv+fRSDJcAShOGZ687NpWbT6ZO9lI4PXRatyFyZWCfcXxTuZXsLrJVg4AO30WVKZufscU5cIwHlXoDb2MrsTWXHTENPrnrd1lD9VBjmKOkioYYsedBkZO6uvJy9JtaCdD71/HOsv0No/QZdfP9u78B0/+N9dOe+65uZyJO+itZ2zqFSNWQErosAu+lv9ctdJtwEwCcpSn+PmxSirgbSiQoKwxnR47MYVUS+2KUZpFxn8rZ/YD3YNY5ueJWyouWj5LectiHF5ibExZgcLwkwnUSQ4htJaRq2yhREcRbf1FxgHz48T1/Vof6/i25fLbkQibGsWCMRCUcWo4ImnJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jD/bf73ydRfVY0Gn9JR2iHbWTohpYJpNnr45mqRMRzk=;
 b=I0yXbZdM43GfbvXxTINlLcCsQGbupbTraF5pDgFVvpIpqraMZZ75tT5mrYbwiZQmsQuLKOP+5lIT4gRxEqosFU3icL4+/iDCIx2hhDiAtHvfWYH/qD6gXJz5/31aTPGVBlq+WXbxv2g+75/KYDIEhuwTi3y/wxuqEx+7k/xkq5Jrhe0SBDrHHXAMMsqHXDkQTwMVH4wMUcNAUFjHNFNcv7fD124DCMmEaOq6Hh6lA/j6KD6Z57MFyUWMD6cnGhCxcd3g42IF1enfaWq/zq0pYNj1KadKwNu4yEBHtC1FxaKfigSXo+ZV85HrMsF7hHIpS1b5p4x/2vTgUAb39Rm6Ng==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AS5PR10MB8101.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:672::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.11; Mon, 28 Oct
 2024 19:53:00 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8114.011; Mon, 28 Oct 2024
 19:52:59 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "brgl@bgdev.pl" <brgl@bgdev.pl>
CC: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH libgpiod v5 4/4] dbus: add the D-Bus daemon, command-line
 client and tests
Thread-Topic: [PATCH libgpiod v5 4/4] dbus: add the D-Bus daemon, command-line
 client and tests
Thread-Index: AQHa7JDPFNYqQ01NbE201CZYmrX5dbKcm4GAgABmOgCAAAY/gIAAAnCAgAACbQA=
Date: Mon, 28 Oct 2024 19:52:59 +0000
Message-ID: <d008be37d21beaf8e3b6c220e67ae2a742277fb0.camel@siemens.com>
References: <20240812-dbus-v5-0-ead288509217@linaro.org>
	 <20240812-dbus-v5-4-ead288509217@linaro.org>
	 <93c9d617df7cc3f6814a56d07d90aa3f98e352f6.camel@siemens.com>
	 <CACMJSetD8JeP+5AV9tcGXPVQQaUO=e3bG6ZNVd82kdREOqXUJw@mail.gmail.com>
	 <0efb4b35cdcc28298609a72eb8f856f8887334e7.camel@siemens.com>
	 <CAMRc=MeXqXVdQ6fHK6z7btafU7=k5mbJF9uKx1z=HXmTu3_9PQ@mail.gmail.com>
In-Reply-To:
 <CAMRc=MeXqXVdQ6fHK6z7btafU7=k5mbJF9uKx1z=HXmTu3_9PQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AS5PR10MB8101:EE_
x-ms-office365-filtering-correlation-id: c9fc852a-ee24-4f54-91f0-08dcf78a2043
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TjQ4SC95N205U1paOVhwWHN4WDhoZ2JvdE9oOFFUaGZPYi9MOVVpRExRekEr?=
 =?utf-8?B?VCtvK2JnbkRvcisxRG94dlNneVduY011MWpJMURWMFVUR0RTV3NZL3F6amN3?=
 =?utf-8?B?MFhwMXFmVW1TcE1iTjFQdnlORCticmllSUpmTFVudk93ckkwYTgwTlkyNmRa?=
 =?utf-8?B?V1pNZ3c0cEt2V3lCa3ZMeVhVdHNab3dTTldoWE1XOFVyR1dTY1dOWERFVlV6?=
 =?utf-8?B?TEdtcjZBcDFURlBxcVh1aUM3N0Jza2tOUnIzREVwZzJ3M1I4TGIzYW1yeER1?=
 =?utf-8?B?a29XdlU3Yjc4UkZEOERoVEw5QWh2YjdLWjEvYWxWeUc4TE5OUE5zRFZVT0N5?=
 =?utf-8?B?WWkrTnVVb29aSGk0SFZzODdNWnhJVklsejB2ZEpvdVU2N2lxZ29kZm5IeGlZ?=
 =?utf-8?B?NUhlK0xydXpKd3FqTkNrb0ZPOVNUTGhEM1kxYmFnZHllWmt6SDA2RU8zUk9w?=
 =?utf-8?B?MjBucXdwZUwzRC9hc2tZMklpK2ZUdkNhMTBNcmFNM0Y1WHYwMGFPa2lQWUpG?=
 =?utf-8?B?Y1JxMFVBOTFtblhLNzNJSmtSWkNQUENjZStsNUpDNGJXZFlDK2M3bHAwNmRR?=
 =?utf-8?B?VUJHWTJmVkdwaklKMm5FQ3NSWUVzTXBJMitjb0k4QmlzaXZkWkNOc2dORVE1?=
 =?utf-8?B?NThZQ3pxYWVBMUVNeW5iYkJjZHd5ZmkvaE5kajNRM1BhMnBhck41dHBLbkN0?=
 =?utf-8?B?RnhrcndQb1d3aXp1UFpodWFDV00xQjhmbkllSHpQaWV0bzZxdXFxc1FZbjI0?=
 =?utf-8?B?cnl3bWQzSWFZWVkzbFRsRkY5WlhBb0R3ZmU5UUhrMStWUXI3ZlN2WkxrbXB5?=
 =?utf-8?B?QnJhQVR2SkN6T0pqVnl3OEpUTWtPQlZQeFVEMng5UWRrbk1WNGo2MEhXMEZl?=
 =?utf-8?B?dDhQZ2N2SU9NaFdRcy9pM3JMUWU2d2VmKzlXdi9EdS9hQks3WTUveHptYW9w?=
 =?utf-8?B?dEh0ZU9jdk1aSEVEdFozTWdoWTNEbWZWcldXM2pDYmhXc0VRN1diM0p0NXg4?=
 =?utf-8?B?Z0ljbmN1TE9jaEJhVkthWFdEdjZEeDFSRHV3aDhCb3JkUkEzVlpnaVNST2Y4?=
 =?utf-8?B?ZWJFcEhZNzRnaVAwQVZmTkNHRXp3S0NPNzVVYmRTa1RDTG9VWFFKcHZNQ2ZR?=
 =?utf-8?B?cGYxOEJrVkw5My9rK01KYVR2T2RFNlc3MGZudmNHam9rTC9McmpQSWFyeTVN?=
 =?utf-8?B?eGxWUWthb1lrQ0lyU2twZHBxVHF0dFoxOGFUSVdma213b0hoRnRmaE02dVM5?=
 =?utf-8?B?Q2hTZzFnZkFSUWpvaXZESkl3R05KRE0xSG9hRmk3QzRHcE1jZHY0cEd0MEt5?=
 =?utf-8?B?UmFqcU1pcVlSVnY0NEZaOWhJMzRsb2h3TW9wZi9hSXNwK2NRN1UyZm1QcXpU?=
 =?utf-8?B?Q2FHR2RTT21yaE5KV1lsaUtiSjF1ckdZZ2hnVGhEa1FjWjdSR2dqSHJmeHc0?=
 =?utf-8?B?TVdSWisza3plSERwcSsrc2IzQit3c2I1Rld2MlVwM21PQzczc1FWai83WHo1?=
 =?utf-8?B?Z0xTVWhGY2o3MXNWcVlyeG1YYm1lODVNT3ZXdDZvVUVsRzZuYm9FeW1paElq?=
 =?utf-8?B?NWtxMzhrbDhMYTM2bUJJdi9lYnZVVU5SSVdIK3ZYbkRJb1ZiQUppWTVSVy84?=
 =?utf-8?B?YnJwU2R2cE0wMlVTajdkUmxmRmpmeUdHTFVpSE1ncDJsZVhOdUhaQkZycGM0?=
 =?utf-8?B?MkZ5cEVkU1k3RE5jZ3dXSERNK1BPUkZQQ2ZmR3hFTGhMaHBudmxoUFRnZ0t1?=
 =?utf-8?Q?mujXaqnvY1Xqq2wYFDCTih08+qqKbYHXqmXDnYo?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NTNWR3puUW1GVlgzMnpPb3l0d2h6OUxEWmkrY2p5NktsREY3RW9SLzZqc3FR?=
 =?utf-8?B?MlpPUWxKOEdSYzNWZTBQYTZtWHhwNjRZWDRaL3JMTnM0ZkpYTmoyTkxnNzBx?=
 =?utf-8?B?cW5PNDA0QVNMUUFqSmppWElicldvYlp0Z2U2eGp1cG1yTHJnRWgrQUJ0T2dY?=
 =?utf-8?B?cGJmcFVnY1orMlFybXdDaFQrWWVYY1JPU0VpTnRucGd3dm5uanRFbUVMNVBw?=
 =?utf-8?B?MHhqS1F1ZzFaemhKWDJoL0tYY0VpSXd2VVhPalk2akVXSU5mMExjak12WURM?=
 =?utf-8?B?ZmZCcGZkL0ZTMDJVQm83bXF3TzVxU1VZNEFERlNyR3Q5MEo4bXJBMlN1SFpB?=
 =?utf-8?B?cXFWNHN4K0RrYzF0SnN6Y2N3b2NjS1V5MWlSWHlaMG1vejRqQlA1eWg4WEx3?=
 =?utf-8?B?QVJIdVBtcTF3cjBsRUxoYnRzSFVVOVN6MlVsMmNkM3JiTDlLWVp2a3ZMWUdE?=
 =?utf-8?B?Q2YrY1cyVE1QdVd0TWRJMEJnM0U1eVhaMVZyYWxmMlQrTEF5Mm1JM0NTSW1U?=
 =?utf-8?B?UnFYOGQvWUJzWUJ2WmU0NjlxNFBYRFY5UnJOdHpVV1Jjd01VVkdiVFVwLzU5?=
 =?utf-8?B?RWNtcFdoTTR0YlVlNEFEWTQwZ0xRLzN0TVM4R1BRS2hmdFp4Q0xLYkFnQVE3?=
 =?utf-8?B?Tm5JQWFHWmp2WFhQSXNsZ2MwTEZiNDNXNXphMEl2cTgxenF4T1g2alRaU0tm?=
 =?utf-8?B?L0FlVFRXVW54WDBvNFFEamllbTV5endNMmhhbkdVOFpwc043TjhRa0pUeEJD?=
 =?utf-8?B?Qzd5RGRGV1lYS3BrZjJLQnJUaTlpOUhHK3R1SGJKdHBuRi94NWQ4UWdOZHdJ?=
 =?utf-8?B?d1NSb0FGS3hKdjZneEJaN2Q3aHhCL0FkMGZ6UjR3OE1aNy9ldzI1VW0wZ0VE?=
 =?utf-8?B?YXhjT3pjNnNRQmd0b3hJL3hqSnJ1MElORzM3NDQ4djRXMHdvTG11aE5JZGpp?=
 =?utf-8?B?a3hFZzhCV0ltSGYxNkF4elJQa3g1aE1qWDRHdkRCdXJRRmUrZit4RHpiaGlm?=
 =?utf-8?B?UE1tQk9wYlEzMVpnc0hHbHphNlhWOEZFNkJLNFJQV3FUNDl2Vk43WFhnNlU4?=
 =?utf-8?B?NXd5KyszVCt5Q1hIR0U0MyszaklXekRsdng1MHZvNVhyKzhqM1Npa1BuSmZF?=
 =?utf-8?B?S2htZlI5Z3hIbExvYlBoVmF3cVQ1aHNKOTFXRzhCelF2UVFLV0xYS2o1TFZ1?=
 =?utf-8?B?QlN5RFNsY3hvT3VVbGE4UkZwdVEzU0o3VzM2eDIyak11cWdGZ1dhM0t1M0cz?=
 =?utf-8?B?cWdvbVZSanZqTjUydlhPZzErelJxT0Q0RU5OU2ZncmJDcTlVaFMvYml1VGFC?=
 =?utf-8?B?VHNEb0tUaWlTZHc0S2hPbTdkZDNBeStmL0ltUHBzaVlaNlo1OERHTnJhQTRT?=
 =?utf-8?B?Q3RWWUlrWEtFK21xUFp1SFk3Y2hWY3BtUGFYK3BKSHExdnZuZk5TSGgzdXZi?=
 =?utf-8?B?VGNjalprSVhoQ0tYa1VGc1BxUzJKL1FFcnE5ckZjdkJOYStieUFlWHVlSWRH?=
 =?utf-8?B?K2c5TzFuUXQvMWs1RHB1YVpoZnlONThVTUVLeWNEYjQydVpURkJ2ekJ4S0dw?=
 =?utf-8?B?bS83a0VtNVIzN0JBalAzNmR3NWRqSkRhbDFRVVBGY05RRytBSHFSeFJKd1lU?=
 =?utf-8?B?RjVIbHlhNWRKTXVzbzdVSUkrVlNKakdEUjRMeTZBYURsNDRIanRnQVMwa1FU?=
 =?utf-8?B?d1lkQjBuZDg0cGVCUnNoN3JKbS9taHRsWXJwRkthdzJEaWxlU2RubVlRS3Vo?=
 =?utf-8?B?aFlZMDEzZ0ZQbDVuQitheEk3SHVJVW5Zc1JiNk5yY1VlWG9nbUU3WTlXTEV1?=
 =?utf-8?B?QlBmVnhmZkpMOHpPSGM1RXVSUHcvcGZCVWRlSXBUUnV3aEM2bTRsbU5DZ0Nu?=
 =?utf-8?B?aThCcGcwTDFlTlhRMGhxS2ZDMFdyVkk4aWJlVEhNb2VVdy84bHB5NGRKWW4x?=
 =?utf-8?B?Qml5dkxxbUNNVWg0ZTJpNERnNTBpS1JhcXQ5MlZNM2cyMWxHbnRqMkJvMmZZ?=
 =?utf-8?B?Y0o4aTJqRWpydk51eXFzZjhOaTJDTkpabjZSVHJkcVlhRnI3MXFRNHBURUFI?=
 =?utf-8?B?N1pieTE3dWNTYSs0eWEyZDNHR1M0c3U0a2JSN2JqclFnQVZmOHNKOHp2bWVo?=
 =?utf-8?B?RnRidHM0TEg4bzZQU2tWeUxkazlMK0JIdUo5NFRaMGJCN3pkZndoNWVpYmQ2?=
 =?utf-8?Q?9/jzzhnB5+nt6P7lpphMqF8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AEFD44E64391594F90F58E5C34D3E049@EURPRD10.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c9fc852a-ee24-4f54-91f0-08dcf78a2043
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 19:52:59.8362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S3GtCRy83VoPAhqIePUPI1X3ncpPDxCBSPbwYd6qQYmZFvY5sjmecH8LSV8yK10KoL17hXt+7qGp9a5bLR4uJ44w7F0KzIotsMFjirGHZjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR10MB8101

T24gTW9uLCAyMDI0LTEwLTI4IGF0IDIwOjQ0ICswMTAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdy
b3RlOg0KPiA+IEkgdGhpbmsgSSd2ZSBmb3VuZCBzb21ldGhpbmcgZWxzZSwgYnV0IEkgZGlkbid0
IGhhdmUgdGltZSB0byBsb29rIGludG8gaXQgZGVlcGVyOg0KPiA+IA0KPiA+ICQgZ3Bpb2NsaSBp
bmZvIFBPTEFfUlM0ODVfMg0KPiA+IGdwaW9jaGlwMMKgwqAgMjrCoCAiUE9MQV9SUzQ4NV8yIsKg
wqDCoMKgwqDCoMKgwqDCoCBbdXNlZCxjb25zdW1lcj0iZ3Bpby1tYW5hZ2VyIixtYW5hZ2VkPSJy
ZXF1ZXN0MTQiLG91dHB1dCxwdXNoLXB1bGxdDQo+ID4gJCBncGlvY2xpIHJlY29uZmlndXJlIC0t
aW5wdXQgLS1ib3RoLWVkZ2VzIHJlcXVlc3QxNA0KPiA+IGdwaW9jbGkgcmVjb25maWd1cmU6IEZh
aWxlZCB0byByZWNvbmZpZ3VyZSBsaW5lczogR0RCdXMuRXJyb3I6aW8uZ3Bpb2QxLlJlY29uZmln
dXJlRmFpbGVkOiBmYWlsZWQgdG8gcmVjb25maWd1cmUgbGluZXM6IE5vIHN1Y2ggZGV2aWNlIG9y
IGFkZHJlc3MNCj4gPiAkIGdwaW9jbGkgcmVjb25maWd1cmUgLS1pbnB1dCByZXF1ZXN0MTQNCj4g
PiAkIGdwaW9jbGkgcmVjb25maWd1cmUgLS1pbnB1dCAtLWJvdGgtZWRnZXMgcmVxdWVzdDE0DQo+
ID4gZ3Bpb2NsaSByZWNvbmZpZ3VyZTogRmFpbGVkIHRvIHJlY29uZmlndXJlIGxpbmVzOiBHREJ1
cy5FcnJvcjppby5ncGlvZDEuUmVjb25maWd1cmVGYWlsZWQ6IGZhaWxlZCB0byByZWNvbmZpZ3Vy
ZSBsaW5lczogTm8gc3VjaCBkZXZpY2Ugb3IgYWRkcmVzcw0KPiA+IA0KPiA+IGpvdXJuYWw6DQo+
ID4gZ3Bpby1tYW5hZ2VyWzMwNDNdOiBmYWlsZWQgdG8gcmVjb25maWd1cmUgR1BJTyBsaW5lcyBv
biByZXF1ZXN0ICcvaW8vZ3Bpb2QxL3JlcXVlc3RzL3JlcXVlc3QxNCc6IGZhaWxlZCB0byByZWNv
bmZpZ3VyZSBsaW5lczogTm8gc3VjaCBkZXZpY2Ugb3IgYWRkcmVzcw0KPiA+IA0KPiA+ICQgZ3Bp
b2NsaSBpbmZvIFBPTEFfUlM0ODVfMg0KPiA+IGdwaW9jaGlwMMKgwqAgMjrCoCAiUE9MQV9SUzQ4
NV8yIsKgwqDCoMKgwqDCoMKgwqDCoCBbdXNlZCxjb25zdW1lcj0iZ3Bpby1tYW5hZ2VyIixtYW5h
Z2VkPSJyZXF1ZXN0MTQiLGlucHV0XQ0KPiA+IA0KPiA+IEZvciBtZSBpdCBoYXBwZW5zIHdpdGgg
YWxsIEdQSU9zIEkndmUgdHJpZWQsIEkgY2FuIHJlY29uZmlndXJlIG91dHB1dCB0byBpbnB1dCwN
Cj4gPiBidXQgbm90IHNldCBlZGdlLWRldGVjdGlvbiwgbmVpdGhlciBzaW11bHRhbmVvdXNseSwg
bm9yIGFmdGVyIG91dHB1dC0+aW5wdXQgY29uZmlndXJhdGlvbi4NCj4gPiBIb3dldmVyIEkgZG9u
J3QgaGF2ZSBhbnkgcHJvYmxlbXMgdG8gY29uZmlndXJlIGVkZ2UtZGV0ZWN0aW9uIGlmIEkgZG8g
ImdwaW9jbGkgcmVxdWVzdCIuDQo+ID4gDQo+ID4gSnVzdCBmb3IgdGhlIGNhc2UgaXQgcmluZ3Mg
YW55IGJlbGxzLCBvdGhlcndpc2UgSSdsbCBsb29rIGludG8gaXQgaW4gdGhlIGNvbWluZyBkYXlz
Li4uDQo+ID4gDQo+IA0KPiBEb2VzIHlvdXIgZHJpdmVyIHN1cHBvcnQgZWRnZSBkZXRlY3Rpb24/
IERvZXMgaXQgd29yayB3aXRoIHRoZQ0KPiBmaXJzdC10aW1lIHJlcXVlc3Q/IERvZXMgaXQgd29y
ayB3aXRoIGdwaW9tb24gd2l0aG91dCBnb2luZyB0aHJvdWdoDQo+IHRoZSBtYW5hZ2VyPw0KDQpJ
bmRlZWQhIFlvdSBhcmUgcmlnaHQgYWdhaW4hIEl0J3MgdGhlIGRyaXZlciBub3Qgc3VwcG9ydGlu
ZyBlZGdlIGRldGVjdGlvbiENCg0KSSd2ZSBqdXN0IHBlcmZvcm1lZCB0aGUgc2FtZSBvcGVyYXRp
b24gd2l0aCBhIHByb3BlciBjaGlwOg0KJCBncGlvY2xpIHJlY29uZmlndXJlIC0taW5wdXQgLS1i
b3RoLWVkZ2VzIHJlcXVlc3Q0DQokIGVjaG8gJD8NCjANCg0KVGhhbmtzIGZvciB5b3UgcGF0aWVu
Y2UgYW5kIHF1aWNrIHN1cHBvcnQgQmFydG9zeiENCg0KUFMuIE1heWJlIGl0J3MgYW4gaWRlYSBm
b3IgZGlmZmVyZW50IGVycm9yIGNvZGUgaW4gdGhpcyBjYXNlLi4uDQoNCi0tIA0KQWxleGFuZGVy
IFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cuc2llbWVucy5jb20NCg==

