Return-Path: <linux-gpio+bounces-23092-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74190B00509
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 16:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18AB64E57B5
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 14:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AEA6273D95;
	Thu, 10 Jul 2025 14:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QuzqywoR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012071.outbound.protection.outlook.com [52.101.66.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E761D272E47;
	Thu, 10 Jul 2025 14:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752157334; cv=fail; b=UeiGRBOk85OQ5HyWtnNtZ2uLXY8An7bQepuhbeFl0CM4pvmdnG1WjiK8qXjKTZgr7lGRqlzIrpk7QOQ3iLcYALE2grkKYqkHO+7QbMwiUEuVA5wNXYB67UrSFJxthazzfsHVhphL3UcoH46p6t9AivW9DWuJu/2Dm0wvU6hPDXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752157334; c=relaxed/simple;
	bh=fVx+KW34U79gx+uXXoob9hJ/YluT+k/Jqo0fvCHOevY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X7TB2uMkKYIDOozJbT/Z2y8243NnTnwX1+JyUNbXevbqr6MxcSmTM46eJlj7yBDmxDdsAoyX16i1RSwPlnPxkTPaPlzbEkcH2BZ9YHneJked8ni9Z/OAswyrbAyNECtACcpQC5qhbekjaLBQh4FJ0YUCyC9aFCNFA30yBUvdJdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QuzqywoR; arc=fail smtp.client-ip=52.101.66.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abYbXpzg4xNEYYvOzCLe2IgirgYJjQGtf9seAyq1IR4sxxi12d4CpQ858CZb0fzFlcbeKj9RYvGxwDbJ9KJNzoHNBe5wCcTNngfq6nU64ASk5MXz45/NygFPFNm7HHr4hX/hyFiiUYiOzZRSND3xZWKdpWUItfZ1S9wmoacePaIsKcJeulpWDInjNcfwLbmVloRBnxk7dcuwKt6Uu+851XNQVxzNYsqEntbIEvWSIVxWmObixedt4WmSOhmeE/qBV1eLZHpFAmYmLeUdkZJHdlMOgqy8R0cA0j/5vyqW15Q8eQgyizxrkxeM4yLc/Cs/4FsTMVLGnnr7eh2jnQ2yVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQAX/9cT4cVkcqDy02shW0EcKIj6XpfJ2GNuvNsz/FU=;
 b=YOfD/EUA4onedgRUgoBXcEJ7aMP4DcAnYEqnq7JGof7ZZtKRd/p/mgJBMZii831LM2BvhOSahw0el2VezXSYgE8y5omTcmngMJa1HMBS//jhNWnJ8zNV+zmA4LnE/Z29BYrtbnL2CtZa/ehGJlbbdHqt+dNBIpzkCdufkxr7KgC+B/bGNUovEUiUMSKsCdvZi8+RcseSOQyK8ICvFouKJQDPaAhmWeimL1DbS+X/uZ+qbEkshoCUDFg6ShiBSew4c0jB0vgE7eDEBBl19rvPcEJXoNDppq0i2Qwy7nIC9t+10f8ze+fr/RtEji0sANlHOuRPOJ66QrZiS61lAYQ8JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQAX/9cT4cVkcqDy02shW0EcKIj6XpfJ2GNuvNsz/FU=;
 b=QuzqywoRnmflKJVOS2lTGZ7qYrezkUGsgN2R+AdeUDIJoByZFc2Si2Wg2IiKbOy91ju708Iy8BPLjFcbLYTv/HUUZQkXAu32rKIwPgu7KSubq8r3WDB2O6djcW7Pcw3MpS69o+UhJ0PlyTmnGLM+o421WVCxe/9hQLE1X9i3iyWyndiGkH5Cw/ixEEPMaCcDHMvn5x/BMK8Gsde2f2H1tW/HWVRuALN+WL72U9qHIvn44pGED2euhrnBNXLG3g2qn2wWE++DdxcwXVbXHsEaDeGLbZK480WlptaDsBQeYfe3OuVgWz1uWfx9AmmKQzLJXvJy0Yp9tUfqK6ioMJqY3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by FRWPR04MB11282.eurprd04.prod.outlook.com (2603:10a6:d10:19e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 10 Jul
 2025 14:22:07 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 14:22:07 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chester62515@gmail.com,
	mbrugger@suse.com,
	Ghennadi.Procopciuc@nxp.com,
	larisa.grigore@nxp.com,
	lee@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	aisheng.dong@nxp.com,
	ping.bai@nxp.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	srini@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	s32@nxp.com,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	vincent.guittot@linaro.org,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v7 03/12] arm64: dts: s32g: change pinctrl node into the new mfd node
Date: Thu, 10 Jul 2025 17:20:26 +0300
Message-ID: <20250710142038.1986052-4-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::16) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|FRWPR04MB11282:EE_
X-MS-Office365-Filtering-Correlation-Id: fb7182a9-a9da-48ab-ae9c-08ddbfbd267d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHZRc3JKbFgvK3pOc1ljWE5NdXpISlRyNTJqd0owelF5czkxU1VuQnVTMVBP?=
 =?utf-8?B?NXhaL2RXeFN5aEdlRzJjVUFRUnprTDJCMkZyS0hBeVEvRmhXOFlXZE82T2h5?=
 =?utf-8?B?SWxZaFE4ZzZoVjBWMXhpRmxpSUMyWnc1TTFMTGlFWklQYzVsdG1ySER6bFlO?=
 =?utf-8?B?VkEvdWhzQzhsWU93dVozQUhoYmVYSHhPU1ZpclVSTlZzSk9oNjNYWldWSFRG?=
 =?utf-8?B?c2xKeHMrQ25hZExTaXdFNEpMak5tQWZFV0p6UmRyOGJDQ3hhcEhXWjMzRUUw?=
 =?utf-8?B?T3BCYU1xOUszTU4vNHdQd1YrS1JiMktuMWtoQ1JUUXUrU0Voa3NBZlIrazNZ?=
 =?utf-8?B?dkVYOTZPcUVrU1JPQUZnaUEwU2NNdExYc2RxWGRxWU0vVGQ2RlNFM3k5bFo1?=
 =?utf-8?B?V0kvV2V4RkVNRjNHSGV2Sm1vRnpsaTZmeEUrQlhrbTRWZTV1SmMvTmwvd2R5?=
 =?utf-8?B?Ly9sSFM5NmFybW9RQlBqQTErZW5hQ283TFRzZUprTFVSajJSNTNNaG1BSWMx?=
 =?utf-8?B?aFZkeTJ1d29Nc0J2d01ZWWY3aFJiUG9yUkkzbC8zTDJaQXZEd1dHdEJSeG91?=
 =?utf-8?B?RTMxUUE3WERMOUMrS3RxY0xPTUNKa0JVaC93ZElIaEhxNkM5VUxBS2Zhbndn?=
 =?utf-8?B?Q0tSZU5mNkhkWnRJQk1Jd0h2ZW8rbWNsRU45Snk2L0dEQjNDd2ovcVE1TEJI?=
 =?utf-8?B?b2I0RGtPbDZoVEM3bjUreEJybWVDWGZPSXVvUUlQZmRLRHV2MzRoVjNTMk1n?=
 =?utf-8?B?VnNNQ3ZqMEJsYThqU3YrejN6OHVoT3BScCtUbzBoMzVNZFNONnRFWUlrOU5u?=
 =?utf-8?B?YXoyaHpzU3F0cGcraSt2Y24wNEFTL3UrWXZLUy9JME50QWhZZmRCUkQ3V0RY?=
 =?utf-8?B?NGpkN1Z2N1V3Wk1mRXcvUEVHZkUyOUtsN1lkNUhVRHZpaGZlbVQyR2F1Ykc4?=
 =?utf-8?B?cU5uakl0QTlhc0I2WE41a1o2MGtab1hkNGI5dmpaWjlQWnozT0R2ejEwbE9j?=
 =?utf-8?B?RjFkTlovVk5UcWVyaFVRWGk3SzZyODhROVE5STVPVWJ0aGMzWnhqNktYOExO?=
 =?utf-8?B?T0xBYjJsTDg2am1uMEMydTN6UlcwbC9DYVJoc2xZbWVBWTMyelRudGUzZE5q?=
 =?utf-8?B?QVhDN1dBOURUN0VxdmtWM1ByY01KY2lZVmdCYTBCRlBiek1VdTlxQUhiYzJ5?=
 =?utf-8?B?YWxBckpxRHI4RkVSazBSQTZKZW9PdTdwRXZ1OWhYTzNkYzZXK01nL1owWWFj?=
 =?utf-8?B?dE8zQ010V3EvV0VwUXVSeW9qZTJobUdBdHh4SmNTN1NoYWpITG1wM3ZQcFJi?=
 =?utf-8?B?eWU1bzdKNGN2dVRobVBackFPemJWRzZtUmVKWGRCQzNTSDFJRFpNelBCUHhs?=
 =?utf-8?B?Zm5Wa0M1ejFIY3YvVk9TOFd2Sm9VQzRadERKNk1Uc3JYNkg0eFlxOE9DN2hu?=
 =?utf-8?B?ek55WG0rbFhNR1hLWkg2RndFSWt1NnBxSkpxS01tQ0twWjJrVFVDRGRCeTBr?=
 =?utf-8?B?MlNHQWF2UWE4dkRKMFZjK1RaQ1BnQzNRWWlGeW80RU9rU2tkWjF3VE1vSzJP?=
 =?utf-8?B?MVdtREFyaUJhVVdPOE1oWVJZcm03bHhJWjdNcjNCSUZpQVdoeFZ1SFByNlpp?=
 =?utf-8?B?ZXp4emVTVFB3RzFpRU82RG1mSENBSjFYYnN2SUdObDhWOUhDNmRZeDhrbXIy?=
 =?utf-8?B?TDUxSjZaRXlSa0N4Q1Zvekl2NWZWRGlUblZxUGkvYXJQazI5TzVvckdWUVZP?=
 =?utf-8?B?OG9KN3pzK0dEM0g4ZmlrNzRvUWhFZHg3cEhTeDRNaVZxblpqUDQxUGtvaENS?=
 =?utf-8?B?Y1hLY1U1NEtBSkUrRXBjQkRNNTB3OVh6a3RMRTVNUEhubzg4RmdIQmZRRzZC?=
 =?utf-8?B?L0tZZlBxaS9DOUR5RUtZb2JKR3JHeWkzQjhCV2tPQ3k4WkJud1o4WTl5a3ZR?=
 =?utf-8?B?OXh4U2taOTNOZzRpK2xNN0YzSzRqZ2FQWlhlb250SmY1TzRGamNpWUZhS002?=
 =?utf-8?B?MWpsak8veldrTDJWbHY0MXFhcTJ3WmJLOTFSQlZZMVY0bzIyK1ROL3ZnU2ls?=
 =?utf-8?Q?9S3ywA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVk2M2ZJVVVHU1ZDRFBoY0NmbXdDOUJWQWl5SDAyYjdnam5aL2Zqd1EvNXh6?=
 =?utf-8?B?SFY4bTQyTTdnQUpoZkJuRUtVaVVOWm1EMi90eHgvdFdOQTQ0QUFUaVRhZHBx?=
 =?utf-8?B?VGlTdFducVk2U09qTlJoU2dzWGlJWmlQMWtzY042OTV0R216WGdnSTlSdkFZ?=
 =?utf-8?B?dE8zcVRjMlQ4TVhMM3BiU3RTS2VMZklVNFNqVVRyOWdTdHpHV1pMZnlKYnhM?=
 =?utf-8?B?bGNVSzdsR2ttenAvRmZHNzNWaHI4d0l0RmErZjNPVHo0ZTMxKzIvZS9NQnEr?=
 =?utf-8?B?ZzBIZVFkOVJ5K1pCMzZ5dzMxaFROSitud3JjSUdKTGtSMWZEM0YxZlpudjRr?=
 =?utf-8?B?aWM2MHF3bkxFcy9ub2k2em9aSGJrd1c4OENsWDBMbGZCdzdSWDdJTjkxWmVT?=
 =?utf-8?B?R3ljdDVTai9oWDlPclJWWW5jNHhvUHFxU3JNb0FqS3lRekx4WHZiQmdPcXUz?=
 =?utf-8?B?blRxQ3Q3anNLSkFkMURJNDg3cDJETHRmelpMc2w0QnJRZHFML1FSRGszN1J0?=
 =?utf-8?B?VDhlcHVjZUIxaUVhd1VsUHdndnR3WUNETWFuRGkxcmR2V0d1VkZjQXVMUnd2?=
 =?utf-8?B?UHB2ZmFGMXBnWmthNjdreTRRaVptRFZyM1NCZ1g2UjV0aHRsSnNLci8yaGlY?=
 =?utf-8?B?YnZabjhMaHo1RTcxY0RFM2laV0g3MmRDRC9DWE81VmFjdmlGL1BTWVordjNi?=
 =?utf-8?B?Yk1Tckc1Ry9qL2k5TVl1aVlUdCtDNTBPclFwUzRKRmQ0YW9LU2h1VkVXOWF5?=
 =?utf-8?B?L1QxTk9reDg3SlRPNGhjbHBvc1MreU45Y3pVc2JZWEtuTWZRY0tQUzRScjIw?=
 =?utf-8?B?bGJyVThTOFQ4QXVMa0NlV01BZ3RQMUVXSHdNaTlvdHFGbmxWS05TZjRqVjQz?=
 =?utf-8?B?alh5ZXcxbVNLcE1qWjQ2NlNWeWZ5aitjdG5ZL0FYbWx3QTRuZjV2NHFhTll4?=
 =?utf-8?B?NUN4TnNkUVNFdFU5VndZcE91K0lSRithM0ZqZ1pjRFp4Q0t6akZMSFNHZWZp?=
 =?utf-8?B?Mldra011RTIzRGRpbk5uRUV5djFVbkNHajRJRDdCcUNGZ0YvWkdDU1IxVGZM?=
 =?utf-8?B?eGdtWitBR0wwTW82VldnMDMxMWQyM3Y3NDFDQlAvdzNTelVUcEJ2V2hrU2JW?=
 =?utf-8?B?dWhxS3RNNGc0akFYQ1IyYjFsL3djZlorT096V3dWTDRzRS9rWldZS2FzS2w0?=
 =?utf-8?B?SDBNMitRTWJWNmNPYk5iR0ZocFRRQjBZODJSZ3M0eWlzdTZWc1JRcGgrOStT?=
 =?utf-8?B?MUtnd3J1Nk5TcE9IZ2l2d3VsdU1hN3pERGtaQVVXOTAzckI2WVhGdG8xcUVL?=
 =?utf-8?B?WGQvTXNqRHYwWkJaSmgrVm5aUDlvTmQxK2o4TGJFVFdJMWZUL2RsK0lPMFM1?=
 =?utf-8?B?MHNXbFV3amkrdTY5d3RSU1ZMRzdwTHZmRTFxcEhJbUNUN3FmTUhjbEt6QWV1?=
 =?utf-8?B?MXRBa3BjUE1xcC9zdmkwMGovTVMyY2FXbHJFdjVLSDM1Z1pSQ2h6bmlaYTZN?=
 =?utf-8?B?NWZEZ3lSbWY5MzFnNUh4bWh6d1ltTTNxQTEyREZqNzVwK2JtdHBTQXFaRnFI?=
 =?utf-8?B?U0lFb2wrMGpJbFlhU2JIamFaNXFPLzhNUm01ZTJmQ3FaTTllMmtIenNxTWNJ?=
 =?utf-8?B?amFZSDJySEdXK2haZisvV1Vma1praWZzY2tLZkxtbmtUWndvUHo2ODlHVE9B?=
 =?utf-8?B?NnM1QlBQVHRhRWd6d3FFYzRyRGJFL3l0RjBUbkVmYS85N2dkQ3FuVDhLYksr?=
 =?utf-8?B?cmpWYjFCTzZyUEhYQ3lyQWR1eG5JWDhmZlJ1SEE0eXRJcThIQXQwQkRkS3BI?=
 =?utf-8?B?VGMwbStwUTdxUEROTG9oSUlLOTJhZWVYUS9rcEtGY3V1THFmeXNzOFFYcFVq?=
 =?utf-8?B?MWU4eC9zaWNTb21yOEhuVEZmTlJKcVl3ejk2c2JsbTR4RDM3aUJlMHdZVEcx?=
 =?utf-8?B?Zmc1Y1Q3RzVMZ3pXdEcrOUJPclVtYnFSb21KUlZZVnM3WFV6SWxuVFFvVG9R?=
 =?utf-8?B?ZSsxajJvQTVtRWlCZUNnc1hJYlkvQ1ZaZ05RWndyWUwyNHhtdkJsYTVINUsy?=
 =?utf-8?B?aHdGOEZic0U0dnRabnZLUWI2ZWhBOG90M3dnMFpvaWljcC9CcDdNNWZKbk8z?=
 =?utf-8?B?ZVZKd1QrdnFncldnejdUd1p4eVVCV1Vxem9oNlBqVnFQdzRYTFhZRldCdFJF?=
 =?utf-8?B?YkE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb7182a9-a9da-48ab-ae9c-08ddbfbd267d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 14:22:07.4332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iichbzne7SMTRd9AFpVj5covB3HWsNdJbpk5mbAi9UhjHIh43uNXVCOlPwXMw6V1P6OH79xAfQcaNfXlGPd9VIsxgtly9H32eH758HojDoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11282

This commit will switch to the new mfd node for representing the SIUL2
hardware. The old pinctrl binding for SIUL2 will be deprecated in a
later commit since it doesn't correctly represent the hardware.

SIUL2 is now represented as an mfd device. Move the pinctrl related
properties inside the new "nxp-siul2" node. The latter one is now used
to represent the mfd device.

This change came as a result of upstream review in the following series:
https://lore.kernel.org/linux-gpio/a924bbb6-96ec-40be-9d82-a76b2ab73afd@oss.nxp.com/
https://lore.kernel.org/all/20240926143122.1385658-3-andrei.stefanescu@oss.nxp.com/

The SIUL2 module has multiple capabilities. It has support for reading
SoC information, pinctrl and GPIO. All of this functionality is part of
the same register space. The initial pinctrl driver treated the pinctrl
functionality as separate from the GPIO one. However, they do rely on
common registers and a long, detailed and specific register range list
would be required for pinctrl&GPIO (carving out the necessary memory
for each function). Moreover, in some cases this wouldn't be enough. For
example reading a GPIO's direction would require a read of the MSCR
register corresponding to that pin. This would not be possible in the
GPIO driver because all of the MSCR registers are referenced by the
pinctrl driver.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 48 +++++++++++++++++-------
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 48 +++++++++++++++++-------
 2 files changed, 68 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index ea1456d361a3..78b0d21ff295 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -114,20 +114,18 @@ soc@0 {
 		#size-cells = <1>;
 		ranges = <0 0 0 0x80000000>;
 
-		pinctrl: pinctrl@4009c240 {
-			compatible = "nxp,s32g2-siul2-pinctrl";
-				/* MSCR0-MSCR101 registers on siul2_0 */
-			reg = <0x4009c240 0x198>,
-				/* MSCR112-MSCR122 registers on siul2_1 */
-			      <0x44010400 0x2c>,
-				/* MSCR144-MSCR190 registers on siul2_1 */
-			      <0x44010480 0xbc>,
-				/* IMCR0-IMCR83 registers on siul2_0 */
-			      <0x4009ca40 0x150>,
-				/* IMCR119-IMCR397 registers on siul2_1 */
-			      <0x44010c1c 0x45c>,
-				/* IMCR430-IMCR495 registers on siul2_1 */
-			      <0x440110f8 0x108>;
+		pinctrl: pinctrl@4009c000 {
+			compatible = "nxp,s32g2-siul2";
+			reg = <0x4009c000 0x179c>,
+			      <0x44010000 0x17b0>;
+			reg-names = "siul20", "siul21";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 102>, <&pinctrl 112 112 79>;
+			gpio-reserved-ranges = <102 10>, <123 21>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
 			jtag_pins: jtag-pins {
 				jtag-grp0 {
@@ -315,6 +313,28 @@ usdhc0-200mhz-grp4 {
 						 <0x20c2>;
 				};
 			};
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				soc_major: soc-major@0 {
+					reg = <0 4>;
+				};
+
+				soc_minor: soc-minor@1 {
+					reg = <1 4>;
+				};
+
+				pcie_dev_id: pcie-dev-id@2 {
+					reg = <2 4>;
+				};
+
+				serdes_presence: serdes-presence@100 {
+					reg = <100 4>;
+				};
+			};
 		};
 
 		edma0: dma-controller@40144000 {
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 991dbfbfa203..769f8210d73d 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -171,20 +171,18 @@ soc@0 {
 		#size-cells = <1>;
 		ranges = <0 0 0 0x80000000>;
 
-		pinctrl: pinctrl@4009c240 {
-			compatible = "nxp,s32g2-siul2-pinctrl";
-				/* MSCR0-MSCR101 registers on siul2_0 */
-			reg = <0x4009c240 0x198>,
-				/* MSCR112-MSCR122 registers on siul2_1 */
-			      <0x44010400 0x2c>,
-				/* MSCR144-MSCR190 registers on siul2_1 */
-			      <0x44010480 0xbc>,
-				/* IMCR0-IMCR83 registers on siul2_0 */
-			      <0x4009ca40 0x150>,
-				/* IMCR119-IMCR397 registers on siul2_1 */
-			      <0x44010c1c 0x45c>,
-				/* IMCR430-IMCR495 registers on siul2_1 */
-			      <0x440110f8 0x108>;
+		pinctrl: pinctrl@4009c000 {
+			compatible = "nxp,s32g3-siul2", "nxp,s32g2-siul2";
+			reg = <0x4009c000 0x179c>,
+			      <0x44010000 0x17b0>;
+			reg-names = "siul20", "siul21";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 102>, <&pinctrl 112 112 79>;
+			gpio-reserved-ranges = <102 10>, <123 21>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
 			jtag_pins: jtag-pins {
 				jtag-grp0 {
@@ -372,6 +370,28 @@ usdhc0-200mhz-grp4 {
 						 <0x20c2>;
 				};
 			};
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				soc_major: soc-major@0 {
+					reg = <0 4>;
+				};
+
+				soc_minor: soc-minor@1 {
+					reg = <1 4>;
+				};
+
+				pcie_dev_id: pcie-dev-id@2 {
+					reg = <2 4>;
+				};
+
+				serdes_presence: serdes-presence@100 {
+					reg = <100 4>;
+				};
+			};
 		};
 
 		edma0: dma-controller@40144000 {
-- 
2.45.2


