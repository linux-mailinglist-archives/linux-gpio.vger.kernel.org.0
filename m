Return-Path: <linux-gpio+bounces-38645-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r0KdHvDpMmrf7QUAu9opvQ
	(envelope-from <linux-gpio+bounces-38645-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 20:39:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BEB69BF80
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 20:39:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=PCl2K19b;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38645-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38645-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 576DA31D39AF
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 18:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A799381B01;
	Wed, 17 Jun 2026 18:34:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010029.outbound.protection.outlook.com [52.101.85.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A0F37FF56;
	Wed, 17 Jun 2026 18:34:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781721268; cv=fail; b=V66UigS0S4ZIEGO+UcrK7LElxzSxJxlc0Ig6SrGp7Ag926R2GCZjr7SFh8L+MlF0CqLDD/xRcpNUiUWxuHVe/knffSZkXbinE46OMESF8vnFPcPenHDo/+F+4qONwvJVjeDUkjuve+9Zbapyxzhb5RVm1WaIBugC6Hc06zn40MA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781721268; c=relaxed/simple;
	bh=4csoN+DBfroo0pj0L03u4tisV7PfoXOrS5QjtPdJ6tA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O4hTNyEw2D9DRuCTjBwP0+hW2hIF4P8F8Ivc08YQ11O5XWIAKCoNsEHdi7ukmz/ZwEiRGYkq54twrHM2iZQgRjTamw2SRbGG7TCaw1C67wEENlg265k9zCFKk/pls8G6TDHOmjG/zLxIbn/u1Jgax+jt+AS9XXEDkTxt8JQSgiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PCl2K19b; arc=fail smtp.client-ip=52.101.85.29
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGOoOaScIlTZBP/e0WW8Ulc+6Leqsg7wEIc9PtqQN9k0JWf0lDehascufo0dXUSkW/xA10CFrFztLIbJX3KUu0PnEzLNv6FQ4ubQ6tLhy+3/eVNRsUOmWEzfyPCUUAnjiZIPdZOEeCmqW0JNHTH7Kjtx6XJ9UnQxCB5Fp2sCzYoOd5UnXYEEawI6/hndOLjzEVLRuwcjr7hghO2KgbvWZxP6p+eAcJIe3uKftzfPeeA/idpfTA8R27kUaPq1v/3xYscCT7T413NmoCc+UlbRWXXnxBvhPMwwDLoW8ohGNS1kAn3s4f6LduFqh97tgpICG/UWBQyj3rIm3VXCvsSAkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOJv9MKAC2Hg6Q/BVIlGFIHH/Lt05XjRfw6/pWSoEeQ=;
 b=ZBFpVnIS0XqQy7uxd9uxtDRAjZsExEzd6S5yCCQEPHdCptya/dlZPJeWinogMDaajv67RrKp/ur+ZHfpxcW16m2OmI+q1eFMqH0b70S1u0MK7TrlG1iv9sIyrd8QiAak98JSrvssyOhWU/udpRQ526JShIBwdgNVEVT2y3EZ/zAWmN4Vg8jnaQd/4zHlawTJ5v0b9tLCj0Wpp05Y+wOJNTP4iou+WuIoYhHq0sWv/AFDIiS1DvF8hUhMBlO54Yw8H8hOvzKtnIZARiEj6UYZSBstJNES45XTfmaKaJscrs9R9av7LciUIwaJKhJiI6Q+x2RzHxKzCzxUxCpjdLAAnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOJv9MKAC2Hg6Q/BVIlGFIHH/Lt05XjRfw6/pWSoEeQ=;
 b=PCl2K19bNnhPSHPNrbSgfKiJRpcaU7S94I0RxIlBnvIvsfOXq/bkq+QTwyhW0I6Bp2MVmpvo6Xp0wWr7T1XyXdRLEKRoI+D5rJi9/n58G12gldmocEnIqFoudTes8Ck2spv+xuzjG0rSZ7eoe8puFELJNds6O4nLrGPnxRj8O/Q=
Received: from BN9PR12MB5033.namprd12.prod.outlook.com (2603:10b6:408:132::14)
 by CH3PR12MB8330.namprd12.prod.outlook.com (2603:10b6:610:12c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 18:34:21 +0000
Received: from BN9PR12MB5033.namprd12.prod.outlook.com
 ([fe80::e820:1d91:3692:1637]) by BN9PR12MB5033.namprd12.prod.outlook.com
 ([fe80::e820:1d91:3692:1637%4]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 18:34:21 +0000
Message-ID: <221cd70d-70f9-4d01-8e8c-b4a5b347b8b9@amd.com>
Date: Thu, 18 Jun 2026 00:04:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpiolib: acpi: Add quirk for ASUS ROG Strix G614 series
To: Marco Scardovi <scardracs@disroot.org>,
 Mika Westerberg <westeri@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260616090824.5967-1-scardracs@disroot.org>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <20260616090824.5967-1-scardracs@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0355.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::15) To BN9PR12MB5033.namprd12.prod.outlook.com
 (2603:10b6:408:132::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5033:EE_|CH3PR12MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 715ceb46-9ed6-4aee-cc00-08decc9f0bdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xlM5LF3/B9togqHGl2iY30a833g6DBB/nLbPlEYEbWdFJXT+Z4AL0GpKUsPXG3rqWWTSezoT780yvEobLGQMfk0NF5u84e8ds/60w5pybINTdfMeXEODeXU3B08XgKkRbJzF/j0R393is0CYU1oZuI50w76z/5CFTG2pqI19BuJhRWIj0sbMkE6U0cSD28+RjRzmb0YdAVik1ISZzoevZvrLS7jT7ROpgXiqIxMlzuEomvDncduaUrGrD5pthB0V0grKlhdGda7wkOq54pgHAt4eIbOFA3vYQ+V29907xAkiJ5aM7vsUGkfBC1P+pXPjG/nNoyZ25+lSid8Lid8PzrebP1Lt/q1McAY9jZRix9WuFt+vlFz7+GMyS7UHr2gUi8o5LIZifO1sjRJ3X9WuJQdZkEQrnQVKMiyCOnWoO2xRMKIYJ8ickXIUN8gLqpIIH4q9jGq4d8fKTIZTr+NqKc8YUVWtN3+spqODhX6oYXVkIXJel63UIpdXnZc7nTBjasDTD2Kyux1/KX4w6/pVwH++NPIVjhbV7St91fHDz26X4p5PAbytZfcH9bvo7q5CZXNxolra5p+aQmbg/9xu54fbPldkvs1fgKJf3dhBYQk6JdozgO18/5ODRG8uOFicV3uqfNnYHzOae3CJcyQTeuGA2RxiJ5NlaJJKuuq5SPB4wV00r3RudKU5Qd3wJflt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5033.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWVmQjFFNFZGTjVrcTgzVFdWT3ZPczFlS2I2ZGRsMGxzenRaVmFYNzVJUHVD?=
 =?utf-8?B?RGh5SWgwUTB0MHJidEhKdFlRN2ZLWHRhSldOZncrR2tub0c5aXpMR0tqS3JM?=
 =?utf-8?B?VTZvUmNRUFlKN1Y2NnU1MHJBaTJqZC9adjhzaEU1ZzZ2V3NNQW81RXRyQUNS?=
 =?utf-8?B?bTZuVGFjczJGWXo0TVlkdHlTeDRuWkp6UXhLMGp4YWxwa05iU1MvNk1UdkNv?=
 =?utf-8?B?OEtZQzgzYXJ6R0VXUTc2MmJYY0JXWmYxRE96c0paZU02YUJoM2h1NFlLVW9Y?=
 =?utf-8?B?MEpPUWE1VVVQUmZjTitjaUUydlZCa2Z4NjlTUFQyK2hxV2xQRUZnaEdqWDQ2?=
 =?utf-8?B?MjhHWE1vSGNTbEVtK2tsSC8vWE1HaWV5Q0hkUlFUd2F1QW80bkE2NjZHQ2Vj?=
 =?utf-8?B?ZUkxYW9QTFYrUXRZVVJ1MU56VVFiOTRoUXNDdmlVcGl1VjJINDlXTEQ5amQz?=
 =?utf-8?B?cFo1Z0lIUXJ2SnJkSzJtTThSa3g1Yzg2a2EyWFlBUUVlcktKbjFtS3dSRzRm?=
 =?utf-8?B?WklFVktJWkdmZnYwVzN1UlBLMWpwRTFUS2FhRExuWWF2ZkRiRXFpdElYSWJF?=
 =?utf-8?B?aWNHbi92aERtYzlZd2lVMzdlMjJyUlhGbkF3VnU4Q2Q0S1FlbklMWUV3R3c3?=
 =?utf-8?B?UHM1TkZtUTh1YUVXWXo3eW1uQlFrLzNBdWtqOU1oOHU5S3c5ZWZ4NldjOG5q?=
 =?utf-8?B?OCtNQlpmNXVwa0pxVW83aEY5bWJWQ3VCNDZkUmo0b1g0b2N2WTdCQTVKYnpE?=
 =?utf-8?B?dGR2MTFjSjd1dDNwZ1NiL3hPMk01bVhqSHlmbi8xUzMvMlVoY0hKN3NUajlh?=
 =?utf-8?B?Z1Q3aVFzRVF1WEQrc0M3cC9VbnRQdk5hMmdNOHFRL3VNcUt1ejVmcVhZMDZJ?=
 =?utf-8?B?TisyRlViOGtWbjZ4YUptd0tZRTlVRmV1QUN0ZlpJM3JtOTl5c2lINDEvZC95?=
 =?utf-8?B?UjBDVGQyMCtTbUF4ZmkrSzY1ck5CbTIrOUZCZGRYVnd5UDZSRkhlSjdRam1E?=
 =?utf-8?B?c3l2QXUrVmdEYTM2bEFBS3ZPOHl1WURSUkkvb2pqTmZwMmN3WWhBc1FRa2Iw?=
 =?utf-8?B?Ung3dVp2dktkYmozVkNRZHgyWENOWGJobHJ2ZENIajMvWkRhazdKUUh1OTNs?=
 =?utf-8?B?djhsNFZtQjN1eVN1UytNZU5hVlJnRnlSVWpUUkpzM0ljbklrTVRMUldZUVRo?=
 =?utf-8?B?eDZVd1lOWEE3c1dMWEpMWEoxQlY5QlRPcHlqOGtlamtiMDRXOFpwckx3TDVR?=
 =?utf-8?B?WU82dFF2V28vekNsNFFjeloweFpBN0VPRTk0bURHWGV1RCt2N0ZqTkFobVB3?=
 =?utf-8?B?SUpNZUpOeWt2dXN1bitLWWhUaEpWdDhiTVVGSURsYU5lbExOZVdsQjJlRVYy?=
 =?utf-8?B?U0I4NFBBbURLcmU3KzRHbkV4MFBEQzgySGkvOVFNWHBEUE5ydnUrMzEvK21X?=
 =?utf-8?B?YXplVHQ2S3I3YTFmNFc3Vi9UVjlFNDNaYTlXOURXbmhGYjRwaHNkTVZOMThi?=
 =?utf-8?B?Mm9ZSmQ0K1hsMjlXdVVSdDJxSi9uUE16YXFHU3R6ZjRyeGhtL3V5RXdQRHdp?=
 =?utf-8?B?c053VVAyQ1pmRW1GYng0eUFHeStXcURKWitpaHptdnl1NzM2OEZiQ1hybDNM?=
 =?utf-8?B?aUVyMUtrWEZ1cm9NQldTd3AraEVPdm02VmJQOGd0ZVFyZURScFRTU2xNZjJm?=
 =?utf-8?B?SW04ZWUvOWNKYW40ZVRBREpEZnJPTGppRWlpQUkyUC9VbklIQnJ0Y3Vuekdn?=
 =?utf-8?B?N0s5TFNPem83bzNwR29VQTFkSDlCSW5HcFhDRDgyUjNERGR1ek03R25IdU5M?=
 =?utf-8?B?ZzRVUWJsSlpKVDEyM3BFSWRFemNzckdqcXhzdDlWVFhYT1FvZnZlK0U1TmdP?=
 =?utf-8?B?VzNVcUJ3WDBYLzRNTHVObnpCNmZGYmZSYVVxVzBVYm1xMHpQOVlGRXpBNTJQ?=
 =?utf-8?B?eVRncDFGdk5ES0RUUUlXL09aRGVydkw3MWcwVjAyTC9TbGNDNCtoc2Nic3Ev?=
 =?utf-8?B?anlGSTZCdmNmY2JRZWZSeGd6VmZnSEcrVUNGWkJqQnVTOTVjQXVqUFFhbjBp?=
 =?utf-8?B?N0czNmhtbFVnenZCWnFJRG5STWZtOU8rTk1WZ0ZST0J2b0c4amJLR1RVZ2h4?=
 =?utf-8?B?NFZUeCtxa09KOGVQZEwwd2JFazhIM1k4cTQwMlE2KzlyZ3JtekJ6Ri9RZFdT?=
 =?utf-8?B?aUNLZlFtdi9TUUsvaTl6a3lqSC96SnlUbFBLN0w5eXlMSUFxRmU2blE2c2Js?=
 =?utf-8?B?bGROWElSU3RKbTRuMVlQUzV3dTBFNmducVhJNnRWaUd1K3A1SE8vNVZDd0tK?=
 =?utf-8?B?V0pkRG1EVDNZdnRJeTZYT0x0WmhRZ282eEZUV1NRaDNmUER6OXAvdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 715ceb46-9ed6-4aee-cc00-08decc9f0bdd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5033.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 18:34:21.3166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r59c+cDIe1G07XCp0pOv+2S3LjOicEV7JWNGQ/XQB6fA97glJTx3elGZctByY7UNj3A5IIaAFMiTH6oEFybUQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8330
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38645-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:scardracs@disroot.org,m:westeri@kernel.org,m:andriy.shevchenko@linux.intel.com,m:linusw@kernel.org,m:brgl@kernel.org,m:mario.limonciello@amd.com,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bnatikar@amd.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bnatikar@amd.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,amd.com:dkim,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8BEB69BF80

hi,

On 6/16/2026 2:38 PM, Marco Scardovi wrote:
> The ASUS ROG Strix G16 G614 series laptops experience a long boot delay of
> approximately 36 seconds. This happens because the system firmware triggers
> a slow/hanging ActiveBoth GPIO interrupt handler at boot time.
>
> Even though commit 3bb62e3f99a5 ("gpiolib: acpi: Only trigger ActiveBoth
> interrupts on boot") restricted boot-time execution to ActiveBoth edge
> events, the problematic interrupt on these laptops is configured as
> ActiveBoth. Consequently, the handler is still executed at boot and
> the boot process stalls.
>
> Fix the delay by adding a DMI quirk to disable edge event execution at
> boot for the ASUS ROG Strix G16 G614 family.

Could you reword the commit message to explain the actual mechanism?
Something like:

On ASUS ROG Strix G16 G614 series laptops, the firmware leaves this
ActiveBoth GPIO line asserted (logic low) at boot. Per the boot-time
initial-state logic, an ActiveBoth interrupt found low is replayed
once to sync its initial state, which calls the handler synchronously
in the probe path. On these laptops that interrupt handler is slow/hanging,
so the synchronous call blocks for ~36 s and stalls boot.

It's also worth noting that commit 3bb62e3f99a5 already restricts the
boot-time replay to ActiveBoth interrupts that are asserted (low) — the pin
on ASUS ROG Strix G16 G614 series laptops meets exactly that condition,
which is why it still triggers. Disabling edge_events_on_boot via the
DMI quirk is therefore the right workaround for these laptops.

Thanks,
--
Basavaraj

>
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> ---
>   drivers/gpio/gpiolib-acpi-quirks.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
> index a0116f004975..fa0f03bd51af 100644
> --- a/drivers/gpio/gpiolib-acpi-quirks.c
> +++ b/drivers/gpio/gpiolib-acpi-quirks.c
> @@ -392,6 +392,20 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
>   			.ignore_wake = "VEN_0488:00@355",
>   		},
>   	},
> +	{
> +		/*
> +		 * ASUS ROG Strix G614 series laptops experience a long boot
> +		 * delay (approx. 36 seconds) due to a slow/hanging ActiveBoth
> +		 * GPIO interrupt handler executing at boot.
> +		 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "ROG Strix G16 G614"),
> +		},
> +		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
> +			.no_edge_events_on_boot = true,
> +		},
> +	},
>   	{} /* Terminating entry */
>   };
>   


