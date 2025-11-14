Return-Path: <linux-gpio+bounces-28488-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0C7C5CF65
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 12:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 12B76356B7C
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 11:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D720A313E02;
	Fri, 14 Nov 2025 11:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="cGPaCWCP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010016.outbound.protection.outlook.com [52.101.69.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DBC2BE63A;
	Fri, 14 Nov 2025 11:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763121426; cv=fail; b=TWqm6mKMQOD4UiD+XQ6Mpwzp+lyKw1bHIcs+Ai80lPCoj9/sIP32O699edwoODEgxvO+k8gIqCJB5g/yDmWWw6xaybUFHus/XQjwquTd0GzlVyc3F3e0UA2ITT/keWwlGI1CuqCz592tGbMot4npVogYh3NgklhDcol4LZfIklM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763121426; c=relaxed/simple;
	bh=KssRRsJXbjhDBmsy0KG4hni26ivpQOH/2unsWjfgQlc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JFiqAJZS2bLipCCNs7gKwVxqyJhC+6gjIUAQRKDMbxe4UpKu4eDQzuKIkYHOrMniupQDXVVfTJN25VZXlovlCIXqHW4JEqfLWbNYn3rDKpcLvC8ltYUc5spbVbtk4xcwYYMEfw0jyepEYJnfuaphva3CayxpMU6cZ8G/9ePmSn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=cGPaCWCP; arc=fail smtp.client-ip=52.101.69.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJLbUH7OpNxQMT9YpEngmZSLJ5L/zhgmXYuZL5inGzOdOJDdF1auyHMC6hqlnOrq8aVZLNZ7mWCji/vGURIjmTuzCcnKK2dzMtmM9v84wb4e/zkNsMTE8j+QMmUNCvYHZ1jH/9YBkbMVbObOUluoc3z2tBFRWTyNA5NbRZLXxjHMQf2MrBk0uY8GtTjBBE07HawxlDLrJWTXz65N6cM8YAdOzLGuNxw9n0x/MFFQbK5fZHQK/oWkRxxucw/ICUE+mCXe0VtBPKYM6Bp553vlhxTIhpRLcycEteRZNz9RxGHKk/JxzZss8Js4NRDHsYZ6odeL9lD9dQlOeDv0fBR3NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KssRRsJXbjhDBmsy0KG4hni26ivpQOH/2unsWjfgQlc=;
 b=dOA5ElQ0Cm8nFbgcqWgqAqXuqC9U1W81DMWPgNtQXwQL9goG8XNv4UPCkCNks3SURSxuxurko1gG7DJ3uNtyaFZbFQDk0J6mDWpn+o+1M/x8RtWe4CQDI5Q2KBNKCP/VNC9BaNeu1vKsjc5J05NAZq+8kRJ57Y0O49AxdzCgxoJjS2cA3+Ir9xEnWXnV/7QVJlcB561SqHNKzenWbjs7KHJSB3fB9zAGYFK7WC4I2EswwHB7SQ757DpD/wXEGYbwX4VUp6ZQCRueJ+kPe8wliyEBrhOr89x4mGp20lnjpMEURpAUExXEr0MN9rM1Jq/hgi28/rpVT6DtQwaTnN/vow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KssRRsJXbjhDBmsy0KG4hni26ivpQOH/2unsWjfgQlc=;
 b=cGPaCWCPSiFfgXlMlH75YPj7ns8xvZ6vTwHjB1Txs+M1VThkhHK6eZJBaE6y+447Jr1oa1YqqLcwXorXvtjkY4pf6n/hOOe2IDIEUP59QIDyBF7H9dpFfCJO9HREEtbyuc3KsgjKV13CEGRVF8Ga8cOxLRZFxKUlWCBbDIZbjx2XGtOS6PBxlZ71aGERXKNYkYlYuf0MBWLQrN8GOtq8M1pQIegctIUexrgqalvvz+c7Ds0FzlQbHWa+M7g6Sb+gtjF8fxwM2q9h3hWQgvvH8TiglhBromPtNO/f4UUsvTbyMHf6Ex8iGWuYZsrkDXE2u1gWwR7xWOf4YFrOQaV0uQ==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by GV2PR10MB9613.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:305::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 11:57:00 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%3]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 11:57:00 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "brgl@bgdev.pl" <brgl@bgdev.pl>
CC: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"warthog618@gmail.com" <warthog618@gmail.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>
Subject: Re: [PATCH v5 6/8] gpio: cdev: put emitting the line state events on
 a workqueue
Thread-Topic: [PATCH v5 6/8] gpio: cdev: put emitting the line state events on
 a workqueue
Thread-Index: AQHcVOIjrD2ZGSCFAUCVfpPcNu/uy7Tx1YWAgAAL/QCAABLPgIAAHXqA
Date: Fri, 14 Nov 2025 11:57:00 +0000
Message-ID: <77968553c766aaa0240c4c9b81852fb262bc1942.camel@siemens.com>
References:
 <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
		 <20241018-gpio-notify-in-kernel-events-v5-6-c79135e58a1c@linaro.org>
		 <5d605f7fc99456804911403102a4fe999a14cc85.camel@siemens.com>
		 <CAMRc=McswuxryKqh7-zSc+oKTubu-bKoV40mUMh1tUbTofHA5A@mail.gmail.com>
	 <20d48bba465d3e03d2dd5e57c4d2d15765356b7e.camel@siemens.com>
	 <CAMRc=McTRNeyYXoy75VOsk5YNb5udBbin2TbCmX8DzQXhGUAVQ@mail.gmail.com>
In-Reply-To:
 <CAMRc=McTRNeyYXoy75VOsk5YNb5udBbin2TbCmX8DzQXhGUAVQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|GV2PR10MB9613:EE_
x-ms-office365-filtering-correlation-id: 07374228-bfdf-46a1-3015-08de2374eb74
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RmI2REFqYWlja1Rjd0paOWMvN3NydzliWGRkamljL3lzWjlCYWgwNGhwcHgy?=
 =?utf-8?B?ZTJwN3BkRk1TZ250R3ArdEN0RlZtdTRGTWI1Y0p4WjR4bUxnUzdDSXBjRVUw?=
 =?utf-8?B?ZUVTZ0hvQWExRkhpQkY5QjhrcHRBTnUzYWlaeUJzWlRncTVHNi83cnNaejlU?=
 =?utf-8?B?SkVjQVRzeXZObGhwaEhxbkxhZDVkWW00NlRmSFpJVUtOZjhISGFkS3FWK3My?=
 =?utf-8?B?OVBhK2FtcDQ1SjhnWkpEajY1bmN0cjc0YzZva3EzdlRTdWo5cFBXUTR6eVpK?=
 =?utf-8?B?bHNkNFAvN2dYd2tuS25lQkpicm5JZEN0QWE4WW5IRWs5Mmp6L21HMVZFdngr?=
 =?utf-8?B?djRCL21SZmVCUFBnT2ErTHVxcjJKNzByMXJRcTcrbEVFR1NBL0hBNWF0VGlR?=
 =?utf-8?B?TmhGWVNFWmlqNFYyN202TC82UFVQQmJVMW1HeEZxVERLZUxPcDlmeWVjT0Mx?=
 =?utf-8?B?OFY4V0E1VElTamRieGpESjArZ25MTTIybDR6WDBwYmpzY1g4VjYzTFVXNkth?=
 =?utf-8?B?ZWpIUURUUHAwaUpIb1pERlhoN2NnOWk3R0VheG9DQUhyKzRVWW04M2wzM3Rk?=
 =?utf-8?B?VGYvWFNRVmRVbTNubE0wYnczZ0Y1NVhzL1RoQ0NUelNYKzdPcDc2Nkc0ejdS?=
 =?utf-8?B?QjNsYmplV0VlOHBsME5BRmcxd1QzVE81d1V2djNyNVhTQ1hUODQycU94MGw1?=
 =?utf-8?B?WGE3U3RDODd4YTdkZW9OYTBvZFRqK2cwN0FKb2J2L2hGWklqandIU0s2M3RH?=
 =?utf-8?B?Z01YZTRtMkNSZHAzb1BIZmhPVVdnbUdQbXFpVE1FdnRBd3E1eHYxK2xmbFlM?=
 =?utf-8?B?OXErMk92NEVEeFlReFRkbDlreHRFNWxQT3dYRktBU0NhMzBqVTRMd1gzWnJO?=
 =?utf-8?B?TDU1T01NMG5abUh4QmE5cXhkcktxcDYxSXFQZlVHSitNelFrOVpOalJ3Tmtn?=
 =?utf-8?B?RFhhZkFnRzhzT3ltOXlQckVLVkU3MUMrajdRMVpwMnY4bDZsd0w5MlhYbWdY?=
 =?utf-8?B?T3pqdG9kb0FBakE3dUllVnRGc1dGOVFQYkZlaStGN05kZS91cVlmcWlXT01u?=
 =?utf-8?B?Q09qWVV4MGM2Yi9KVlduQys0ZHBtYXcvVGZUQy9UWC9kdDVTV2VSS0JUWVRS?=
 =?utf-8?B?bVNRdEgvdFBsbEk3ckR6YWxqeHlwczYrOElVYWpBN25PTjI0M096Y1lia0Rw?=
 =?utf-8?B?UGF6NDVKMlYrZDlzaWZKQmVwMnV4Q2lYeVZMakxlNTVSODJPN1VBRGxKbDhx?=
 =?utf-8?B?RnJscnN1QnVkQXRWSlFrbUNJM0NSUzhOVjhJTWQyKzI1SVJuS1JGYUt0S04z?=
 =?utf-8?B?dnBQRENhZms3QzJ6aldkR3h4NHJITlFIckJIT2lZNmtvSXFMNW5BVlRTQ052?=
 =?utf-8?B?Qzl2cHRrMytZc29raWZ4RElVd2lNVkJWNk55cVpmRHVXblVQNHFtN0NZN3pj?=
 =?utf-8?B?dHZya3AzOVMzVGZzVHhqUzhxTDRPRW04OWZLZUszT2lUQkZCTDNCK25SOTcr?=
 =?utf-8?B?ZjBhNGtZMy9OM1VuTWg4SXQ0cm0wZGpqVWdvbDBlaFk3OWNyUk5UZFRoTHVo?=
 =?utf-8?B?cEV3WlN0K2RLV1MwckxCQUNYWk1vejNCdUx3K0NpUTFhOXBOYkNab2pEVGZQ?=
 =?utf-8?B?KzlwaTIyTnJaSzdxVDA3TVpYU1ZNMUdLN0NUVk5OWmhQdnRmdmQrRXc2Ym9C?=
 =?utf-8?B?NDlKc21PNVpzVjFQbmNuaXM3ZXY0L2Rob2d1UzFlbzBBWjJtNHJrSmV0UFNJ?=
 =?utf-8?B?OVhQOVh4RmpmNjNJMzJ2cmthaS9FMWN0bnJPcjdhU2FLS0dvdzJzSFpmYkRS?=
 =?utf-8?B?TisraGQ1WWZldlpUWWJVRTZHWmRadWxGaGJiSDI1dFFlR1RNU0hmQTdocjVN?=
 =?utf-8?B?eGZjOVBPUDRwSFR6WGNZZ3kwUDBlaUh1dGNjdmhzVVF6RGFibGpvV1UxZWli?=
 =?utf-8?B?Z3krWjVMZmZGOTBwSnhoUW1MSUwvTEYxNHpmS013c0Q0dlgzOWNxMEtPWTVC?=
 =?utf-8?B?V3E0Z1kzcXNBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ulk4VE50YU8zVytiZTlPZDc0dTEyUmZlOEpHMitldWlKenNBMHF2czdZeDg3?=
 =?utf-8?B?WXI1cXAySTJBYzE4M1NHRHVIYTNwTlgyVUp4QzJjSzNUVUc5d01yeWNDWmg3?=
 =?utf-8?B?a0NTNmZWOXhRNm9ocExCNWJQMEZrdXU5MkNXWkRGdjJ5ZVNQWkFOWUJuZkQ1?=
 =?utf-8?B?YXBDbHVLNXV4RjNLUzNzeTM0VVlkUGs4YWowNlhnZ0NsUXVYV1p5dmxmOTgy?=
 =?utf-8?B?dnBPSUFvUTgvb0VXMjc0QlhjTWxQa1BQdldFNys5OTdQYndvOTl4YWxTZm9T?=
 =?utf-8?B?b0tPT0lhSXlOOXFRV0MzUW9vUVRNcmNpbE11MHVCQWVxbEZEbnpJNG9Cd1hi?=
 =?utf-8?B?a0dkUnJEVktZWFNPWVlNL0IvRS8rc1lhRkR4V1dOdXU0UjA1Nk1pbDN5MXJI?=
 =?utf-8?B?blNMZVlRcjR5Z2ZPZ1IxOEY4TDNTNDcvUXZMNTFmaStrNk1wNllkT2x3Yjll?=
 =?utf-8?B?M1RLUDI2Sm4vRWRkc1VsbkpvVGRzdUxJUkE1Qm5jQ0hmQW85WnliNWdHVmVk?=
 =?utf-8?B?U1lQYW8yU29CSlhzN0hzNkJMZTZDVjBCUE5vQlVBSC9wMnVDVWtkdGNMM2NN?=
 =?utf-8?B?Um02S0lUWnVwcVNTWnZVZHIyb0JaZ2EwSkY3TGlGenlzTWZNUXlwdFRhRkgr?=
 =?utf-8?B?VVNGQk9WTmVCQ0FVVEQrU0hOSG9nK0VQeC93OThVeEtaZ2N2Q3dYOE01cXdt?=
 =?utf-8?B?S1BvekhlWDRxSEZ4bU9kOXhJVjhSbldEZ0JnTXlTMUFRRGw5SU1obEYzQXZl?=
 =?utf-8?B?UkFnYmIrakRYWHgvQThPR0pXM0g2c0NscG43cFNQZGVaQWRuYlIySFV6Y0V4?=
 =?utf-8?B?WG1LTXNuYnVGYXlyN2Zmd1dQR0wyc25IRlQzVmlIanVmdEpmUkhod3lKNS9E?=
 =?utf-8?B?OEgwSytBMUJVaDUwTTJZMU5vZGFXdlRrU1kyZDcrYWtvUmMwVTZLemZ2M1B0?=
 =?utf-8?B?SWxiR05OdGdncFNBRmZURXJydXdkZjZ1emt5K09qQTZraWVpYUt0NU90d3ZV?=
 =?utf-8?B?aVRPc2F1RmpWZUE4MUlhZmtaUHN6VWpUM0F2eXBtY0ZyUFJZb1lHaGU2NWcr?=
 =?utf-8?B?eERvbitEdUowb0VPVmFVOVpOdkhPelQ4ZW9LL3oweDVHWHNYSUpxWitQWkxW?=
 =?utf-8?B?S3pWV1Y2VXE1Y1pZL1ROclBuZk5IWFNaeWcranczT3ZZeXB0WnE0alBBMDhq?=
 =?utf-8?B?NEZaR0oxcjZsVkpaTXVGUDhPM1NZNVZ5RS9zVGVvb211bXU5TEFRUTJnZTN5?=
 =?utf-8?B?ZmpZcElSVXJRVE9rUXRMZER6RUNIUTR4KzFTR2pSdmRoNzVtR3NsSFpnZWpr?=
 =?utf-8?B?eE94emw4NVhNNVh3bjB4RHNBNk1kV1ROUHpvUGFMS0NnR2M1aFlLTlNpTEJu?=
 =?utf-8?B?UTdBTm10RFBsWnpRcVZaVmg0RFZSRnpnUWlYT0pLNFgxTGY0aHd6NXNuUnNa?=
 =?utf-8?B?enFBUFJrem5DZHVHTVhaY0xMWFFmbkN6YnE2S2VRQ1MwT2p0dDB0dW5jaXJV?=
 =?utf-8?B?YXBGdGpVd1c0ZmM4OEIreXEwalk5QnZ2MGxIQzZhbHlyd0VZUTBPSmZlRkR2?=
 =?utf-8?B?UDZER1EvMHZkTXRTK0tKemxwdmZ1cjdSRjhDb2JEeUplMm90MFgzeWNJdFlz?=
 =?utf-8?B?aEhwaStBM0xaTitJamhVRTRvcnE1S2p3V1FUTFd2ajQveTJ6MDdINUdJdVBw?=
 =?utf-8?B?ckROTi9DTXhleXlzcmlWeXByRVpPR1hOZUVhL3B1bTRmNXc4SnE3eG5NTm5Y?=
 =?utf-8?B?NXdVMW5NcHRhVi9NTkZPVmdobVVPS1lnTEM5QWpkdFR3Njd1MzUxbGo4Mjgv?=
 =?utf-8?B?WE1OY3lUZXJoNWlreFQzWkkwY0FubVJMcjZGMUhMdlNsaDZWbXBVTlNPQkt2?=
 =?utf-8?B?ZUp4MFl0VStVcFNucjJ5dHNSeXlFaDZTN0tabHRzR0o4UUlZYjVmd3VjR1Nm?=
 =?utf-8?B?dzA1dXZVM0x4MzFmQzMvSGk4R1drNlJYaUNRUW1aakd4SDJlM0lUK2RiOTlL?=
 =?utf-8?B?YlVDbkNhc01YV29RTlJMTkFrR2x5cXREMFh1WExGcVpPeENuR20rSk5TS0xo?=
 =?utf-8?B?RTVzekc1RHpkQWx2NXZ6TVlKTGxWL0Z6QXJNUVduS1diajE4bStpVFFyL3k5?=
 =?utf-8?B?akF1bEkwTkhVVXc1c0VGcEJwWHFCeHF2VTQ3QXRxVFlNTUlmdDRVOUdpWjli?=
 =?utf-8?Q?f/NOZYzaodRtSQUfVe18oJA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F67B8E8A0AA9F4CA46676A2290636F5@EURPRD10.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 07374228-bfdf-46a1-3015-08de2374eb74
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 11:57:00.6048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WpiZHPXJnaTnMGgNfxAGahm3z2mOYd3WDCP2bfWFObUVWtmzJNuWm7gzTdomDr98fHfF4SkP5Jzx8Dcj7lNqvHzUUj4FNYMSM92cTHr1ccA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB9613

SGkgQmFydG9zeiwNCg0KT24gRnJpLCAyMDI1LTExLTE0IGF0IDAyOjExIC0wODAwLCBCYXJ0b3N6
IEdvbGFzemV3c2tpIHdyb3RlOg0KPiA+ID4gPiA+IEluIG9yZGVyIHRvIGFsbG93IGxpbmUgc3Rh
dGUgbm90aWZpY2F0aW9ucyB0byBiZSBlbWl0dGVkIGZyb20gYXRvbWljDQo+ID4gPiA+ID4gY29u
dGV4dCAoZm9yIGluc3RhbmNlOiBmcm9tIGdwaW9kX2RpcmVjdGlvbl9pbnB1dC9vdXRwdXQoKSks
IHdlIG11c3QNCj4gPiA+ID4gPiBzdG9wIGNhbGxpbmcgYW55IHNsZWVwaW5nIGZ1bmN0aW9ucyBp
biBsaW5laW5mb19jaGFuZ2VkX25vdGlmeSgpLiBUbw0KPiA+ID4gPiA+IHRoYXQgZW5kIGxldCdz
IHVzZSB0aGUgbmV3IHdvcmtxdWV1ZS4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBMZXQncyBhdG9t
aWNhbGx5IGFsbG9jYXRlIHNtYWxsIHN0cnVjdHVyZXMgY29udGFpbmluZyB0aGUgcmVxdWlyZWQg
ZGF0YQ0KPiA+ID4gPiA+IGFuZCBmaWxsIGl0IHdpdGggaW5mb3JtYXRpb24gaW1tZWRpYXRlbHkg
dXBvbiBiZWluZyBub3RpZmllZCBhYm91dCB0aGUNCj4gPiA+ID4gPiBjaGFuZ2UgZXhjZXB0IGZv
ciB0aGUgcGluY3RybCBzdGF0ZSB3aGljaCB3aWxsIGJlIHJldHJpZXZlZCBsYXRlciBmcm9tDQo+
ID4gPiA+ID4gcHJvY2VzcyBjb250ZXh0LiBXZSBjYW4gcHJldHR5IHJlbGlhYmx5IGRvIHRoaXMg
YXMgcGluIGZ1bmN0aW9ucyBhcmUNCj4gPiA+ID4gPiB0eXBpY2FsbHkgc2V0IG9uY2UgcGVyIGJv
b3QuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gTGV0J3MgbWFrZSBzdXJlIHRvIGJ1bXAgdGhlIHJl
ZmVyZW5jZSBjb3VudCBvZiBHUElPIGRldmljZSBhbmQgdGhlIEdQSU8NCj4gPiA+ID4gPiBjaGFy
YWN0ZXIgZGV2aWNlIGZpbGUgZGVzY3JpcHRvciB0byBrZWVwIGJvdGggYWxpdmUgdW50aWwgdGhl
IGV2ZW50IHdhcw0KPiA+ID4gPiA+IHF1ZXVlZC4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFy
by5vcmc+DQo+ID4gPiA+IA0KPiA+ID4gPiBzdGFydGluZyBmcm9tIHRoaXMgcGF0Y2ggdXAgdG8g
dGhlIGN1cnJlbnQgbGludXgtbmV4dCAodjYuMTgtcmNYKQ0KPiA+ID4gPiBJIHNlZSB0aGUgZm9s
bG93aW5nIHJlZmNudCB3YXJuaW5ncyArIEtBU0FOIFVBRiByZXBvcnRzIG9uIGVpdGhlciByZWJv
b3QNCj4gPiA+ID4gKHdoZW4gZ3Bpby1tYW5hZ2VyIGlzIGJlaW5nIHN0b3BwZWQpIG9yDQo+ID4g
PiA+IGBzeXN0ZW1jdGwga2lsbCAtLXNpZ25hbD1TSUdLSUxMIGdwaW8tbWFuYWdlcmAgKGlmIHNv
bWUgR1BJT3MgYXJlIGJlaW5nDQo+ID4gPiA+IHJlcXVlc3RlZCBmcm9tIChvd25lZCBieSkgZ3Bp
by1tYW5hZ2VyIHByaW9yIHRvIGtpbGwpOg0KPiA+IA0KPiA+IFtdDQo+ID4gDQo+ID4gPiBUaGFu
a3MgZm9yIHRoZSBidWcgcmVwb3J0LiBJIGNvbmZpcm0gaXQncyByZXByb2R1Y2libGUgb24gbXkg
c2lkZSB0b28uDQo+ID4gPiBJdCBuZXZlciBvY2N1cnJlZCB0byBtZSB0byB0cnkgYW5kIFNJR0tJ
TEwgZ3Bpby1tYW5hZ2VyLiBPbiBub3JtYWwNCj4gPiA+IGV4aXQsIG5vdGhpbmcgYmFkIGhhcHBl
bnMuIExldCBtZSBsb29rIGludG8gaXQuDQo+ID4gDQo+ID4gSW4gbXkgY2FzZSBpdCBoYXBwZW5z
IGFsc28gb24gZXZlcnkgcmVib290L3NodXRkb3duLCBob3dldmVyIGlmIEkNCj4gPiBgc3lzdGVt
Y3RsIHN0b3AgZ3Bpby1tYW5hZ2VyYCwgSSBkb24ndCBzZWUgdGhlIGlzc3VlLi4uIG5vdCBzdXJl
IHlldCwNCj4gPiB3aGF0IGlzIHRoZSBkaWZmZXJlbmNlLi4uIGFuZCBJJ20gbm90IHRlbGxpbmcg
U0lHS0lMTCBpcyBob3cgb25lDQo+ID4gc2hvdWxkIHN0b3AgZ3Bpby1tYW5hZ2VyLCBidXQgSSdt
IGhhcHB5IFNJR0tJTEwgbm93IGFsbG93cyB5b3UgdG8NCj4gPiByZXByb2R1Y2UgdGhlIGlzc3Vl
IGluIHRoZSBrZXJuZWwgY29kZSENCj4gPiANCj4gDQo+IFdoZW4gdGhlIHByb2Nlc3MgaXMga2ls
bGVkLCBpdCBzZWVtcyB0aGUgY2hhcmFjdGVyIGRldmljZSdzIGZpbGUgc3RydWN0IGlzIG5vDQo+
IGxvbmdlciB2YWxpZCBldmVuIHRob3VnaCBjaHJkZXZfcmVsZWFzZSgpIHdhcyBub3QgeWV0IGNh
bGxlZCAtIGl0J3MgY2FsbGVkDQo+IGFmdGVyIHdlIHRyeSB0byBzZW5kIG91dCB0aGlzIG5vdGlm
aWNhdGlvbi4gSSB0aGluayBpdCdzIGJlc3QgdG8ganVzdCBjaGVjaw0KPiBpZiB0aGUgZmlsZSBp
cyBhY3RpdmUgYW5kIG5vdCBkbyBhbnl0aGluZyBpZiBpdCBpc24ndC4NCj4gDQo+IENhbiB5b3Ug
dGVzdCB0aGUgZm9sbG93aW5nIGNoYW5nZSBiZWZvcmUgSSBzdWJtaXQgYSBmb3JtYWwgcGF0Y2g/
DQoNCnRoYW5rIHlvdSBmb3IgdGhlIHF1aWNrIGZpeCENCkkndmUgdGVzdGVkIHRoZSBiZWxvdyBw
YXRjaCAob24gdG9wIG9mIHY2LjE4LXJjNCB3aXRoIHF1aXRlIHNvbWUgZGVidWcgb3B0aW9ucw0K
YW5kIGV2ZW4gS0FTQU4pIGFuZCBJIGRvbid0IGdldCBhbnkgaXNzdWVzLCBuZWl0aGVyIGtpbGxp
bmcgZ3Bpby1tYW5hZ2VyLA0Kbm9yIGR1cmluZyByZWJvb3QuDQoNCkZlZWwgZnJlZSB0byBhZGQg
bXkNClRlc3RlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5Ac2ll
bWVucy5jb20+DQoNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9ncGlvbGliLWNkZXYuYyBi
L2RyaXZlcnMvZ3Bpby9ncGlvbGliLWNkZXYuYw0KPiBpbmRleCBlNmEyODlmYTBmOGYuLjBmMTEw
M2E2NzliNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncGlvL2dwaW9saWItY2Rldi5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3Bpby9ncGlvbGliLWNkZXYuYw0KPiBAQCAtMjU0OCwxMCArMjU0OCwxNyBA
QCBzdGF0aWMgaW50IGxpbmVpbmZvX2NoYW5nZWRfbm90aWZ5KHN0cnVjdA0KPiBub3RpZmllcl9i
bG9jayAqbmIsDQo+IMKgCQljb250YWluZXJfb2YobmIsIHN0cnVjdCBncGlvX2NoYXJkZXZfZGF0
YSwgbGluZWluZm9fY2hhbmdlZF9uYik7DQo+IMKgCXN0cnVjdCBsaW5laW5mb19jaGFuZ2VkX2N0
eCAqY3R4Ow0KPiDCoAlzdHJ1Y3QgZ3Bpb19kZXNjICpkZXNjID0gZGF0YTsNCj4gKwlzdHJ1Y3Qg
ZmlsZSAqZnA7DQo+IA0KPiDCoAlpZiAoIXRlc3RfYml0KGdwaW9fY2hpcF9od2dwaW8oZGVzYyks
IGNkZXYtPndhdGNoZWRfbGluZXMpKQ0KPiDCoAkJcmV0dXJuIE5PVElGWV9ET05FOw0KPiANCj4g
KwkvKiBLZWVwIHRoZSBmaWxlIGRlc2NyaXB0b3IgYWxpdmUgZm9yIHRoZSBkdXJhdGlvbiBvZiB0
aGUgbm90aWZpY2F0aW9uLiAqLw0KPiArCWZwID0gZ2V0X2ZpbGVfYWN0aXZlKCZjZGV2LT5mcCk7
DQo+ICsJaWYgKCFmcCkNCj4gKwkJLyogQ2hhcmRldiBmaWxlIGRlc2NyaXB0b3Igd2FzIGFscmVh
ZHkgcmVsZWFzZWQuICovDQo+ICsJCXJldHVybiBOT1RJRllfRE9ORTsNCj4gKw0KPiDCoAkvKg0K
PiDCoAkgKiBJZiB0aGlzIGlzIGNhbGxlZCBmcm9tIGF0b21pYyBjb250ZXh0IChmb3IgaW5zdGFu
Y2U6IHdpdGggYSBzcGlubG9jaw0KPiDCoAkgKiB0YWtlbiBieSB0aGUgYXRvbWljIG5vdGlmaWVy
IGNoYWluKSwgYW55IHNsZWVwaW5nIGNhbGxzIG11c3QgYmUgZG9uZQ0KPiBAQCAtMjU3NSw4ICsy
NTgyLDYgQEAgc3RhdGljIGludCBsaW5laW5mb19jaGFuZ2VkX25vdGlmeShzdHJ1Y3QNCj4gbm90
aWZpZXJfYmxvY2sgKm5iLA0KPiDCoAkvKiBLZWVwIHRoZSBHUElPIGRldmljZSBhbGl2ZSB1bnRp
bCB3ZSBlbWl0IHRoZSBldmVudC4gKi8NCj4gwqAJY3R4LT5nZGV2ID0gZ3Bpb19kZXZpY2VfZ2V0
KGRlc2MtPmdkZXYpOw0KPiDCoAljdHgtPmNkZXYgPSBjZGV2Ow0KPiAtCS8qIEtlZXAgdGhlIGZp
bGUgZGVzY3JpcHRvciBhbGl2ZSB0b28uICovDQo+IC0JZ2V0X2ZpbGUoY3R4LT5jZGV2LT5mcCk7
DQo+IA0KPiDCoAlJTklUX1dPUksoJmN0eC0+d29yaywgbGluZWluZm9fY2hhbmdlZF9mdW5jKTsN
Cj4gwqAJcXVldWVfd29yayhjdHgtPmdkZXYtPmxpbmVfc3RhdGVfd3EsICZjdHgtPndvcmspOw0K
DQotLSANCkFsZXhhbmRlciBTdmVyZGxpbg0KU2llbWVucyBBRw0Kd3d3LnNpZW1lbnMuY29tDQo=

