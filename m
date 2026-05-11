Return-Path: <linux-gpio+bounces-36624-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B2vFY5DAmrVpgEAu9opvQ
	(envelope-from <linux-gpio+bounces-36624-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 23:01:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 493A8516110
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 23:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C8EC3034A92
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 21:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74E338E121;
	Mon, 11 May 2026 21:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="LixXtEwR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-CY1-obe.outbound.protection.office365.us (mail-cy1usg02on0067.outbound.protection.office365.us [23.103.209.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CD2254B18
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 21:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.209.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778533245; cv=fail; b=Az1bKYDutY4er1G5nCxoouI2me04hYaGstbauGIMAtfHcJLi4hKZ0aiBnP5QQ0xJAhr6LORpJHdt3IwaxUkKDU8czIpy4+lshSrEFeX7u3492v90WqP9G80R7ylodpxQfSu+FFW9XbH1E61/yrL25XGPJPX4HFS4u4srp11ghoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778533245; c=relaxed/simple;
	bh=OqqexfATeAsdqNFALZg+4sx23sPyIboS9ZlIU8wE1bQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AwRriDN0rjOT0TVUbuSG+oUW/PTnN1ZCMP2sI3S7EURovc+r/2j5DxPc+ATOoQpbkLcFKlN+IPUYzLlX5vqSYck2Ntc5nFtsbPCS5lWOFD+tg2E8DSLkIY710ZTcGDjORcYCUMgmqp8MfE9TFfR/8fWWgjZuBkWd3kgdAPKM3Rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=LixXtEwR; arc=fail smtp.client-ip=23.103.209.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=x6G2dKrg3qGNikBtpcfUG0V2pJbQOSwRiLJSoog65273nIH6n0t4/m/0vdkAJGUJb0tc3uuLdqAX1xjn5Y5fAHcWlchFCPT85ZIbjnGOtsccEw7QygcqkHXC2vqbQ0AISsL4Po/B3Tjasa6VnRnh1GsLIGbM0QxnUFcfMipRNa6NSK8nNnrcAi2IYEA+mOrjVjqMFS7QQBamMoNcdiDLGEe7Lz3UdBAexJPncD5dvf5g6pRJ10gTUvKIWtodXb005iWsgo6SlsDF33QD/T3fY/oV3WyhomvgkrunshTzPaapTHrDKH4vmdbjtFi7SWmvtroKDCX78wONtE9M4fZidA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqqexfATeAsdqNFALZg+4sx23sPyIboS9ZlIU8wE1bQ=;
 b=y6s4cKrVBF+xzMmK/RVQzAxl9ldjgUgEA/JM+OkTWLXKUmDdwV/cI5QY+9f4Wrx6yDc0k8Tzn7cK/oX2rXaGPbShekSmKx994u1+jB/JkNBhIzVrn+u6NXMPyuf1SsklX+yk6xDnfY2TAqcQ8JdtQv4zsde2HhowbqwJBqOKhc0SGwyg48LSp40DoWnHhIPoLLClE5ttXtKvZLftECZM9uqCP1ZAfl5WH2ysJ+VOLiabSFuDGKKGOBQEnhTM83fiXdm6Wwk81vfYs3z44WGINGDfdQyIqOMGFOKcXVdXMgmH8IFIkE0wLxV9YheuwGUL+CpqbPUAreJqxtvB5EFS2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqqexfATeAsdqNFALZg+4sx23sPyIboS9ZlIU8wE1bQ=;
 b=LixXtEwR94njo7NnsocnxlaWeNv8ZRt0PxVSln1UQSdun4NXCxEBbIJDgvxLBqjNix4ed4X/f0Dan5HF+8fVw4w3+4JwIjzLSFlhHD8IvcC23e2/FIJi9QkpBnRt/HFy/agfWRzpCSPxreKCMv4opXMC/A+HyIN936DqDtswktr/RfkpYHWpH3zAztb4I9D916kzTVTkjDu/hCyNBqX5Ajx0bl60pA5JR2AD1AMz5EmaWmUc1mZQKReMIovMoed/i+MVEKDPwXMdEA6k9JPIvEHbR9RtCjcRFSiozd2xiap99GPDK9+JwSedIaoFl39NNsPXQmz8KURvK2XwMgMzFA==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN0P110MB1015.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Mon, 11 May
 2026 12:29:34 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%5]) with mapi id 15.20.9891.019; Mon, 11 May 2026
 12:29:34 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH libgpiod] bindings: python: don't decref objects on
 PyList_SetItem() failure
Thread-Topic: [PATCH libgpiod] bindings: python: don't decref objects on
 PyList_SetItem() failure
Thread-Index: AQHc4UHTB5qwyxA8+EK/spRQUkcghQ==
Date: Mon, 11 May 2026 12:29:34 +0000
Message-ID:
 <PH1P110MB16031E995555F6E97816A2E49F38A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260511111538.60844-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260511111538.60844-1-bartosz.golaszewski@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN0P110MB1015:EE_
x-ms-office365-filtering-correlation-id: 51543a66-4dbc-4618-b2a1-08deaf58f59d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|41320700013|55112099003|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 WgG/usx1Mb1yGMSpwsDum+L+qjGMqKKJ7LvP4DiVrUGNZTVQBBeXQbLBLDXhCmiHeBfcPyNaNRMmUieR4UMJdUy+PHsAmyBUkA3XbZMip3Djli9DJheTKR0x2cxHOvSwCRWFgbx757OnC8gCtiUn+z64heZkUp88K2eOKnrXYo0faiFj5dyu1cCddmxcwUQmTo66CHplwo0N2hT9RpfID1c7rmVVXYjxf/DSyuZfBv8ugMqgzMfhUz9ZuCJVwisznuJYTvCTABYONALXiM0pquvBaGhTXb6+6z03fxzHO/CC6kf217tZ1EVT9lWABzfa/imP3xPw4L1OiAgBPfZ896xKKMXf8+SjdiGYXM0RIaLhqvM+48ByL45/m6JKJTcK6PStSBSiI1BO8QdDAqhNAx4kuBZb/bH0H+Qq22VDzAL3KBq75KgPp5anx0U36Fa1Jr6NrP33uGKW3x2QLCM0mmIrldL4rAi0bfZ6XKofoSKQ3IUtV4tS6kJk03/zc46U8LCZ2YbxZrNVdDkcgnwQNwyz52L36lOp1bWqWM4fBrKww0grBO82te5dYPQEtqOu9XXHJ6cidxLuD5W/KWLvAZe0vq7T6J65D9x2w382UygneOS6N6TeFPrq66d7k24MirbH/l8GJuvd+3BBrvx8GHWrC+5aFmCJiv9TG4S8w7XmiKfZuCTuVlyHBnOGvjhkp79JGAawFqk/K9kvh1H8ddrqLofeea/l4tJN0FPOYK7Vk+4z0mI9IVHoCVp8zqDJ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(55112099003)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2Rgcrt3R8iUlF40jY2B7nNNzz2jakWuxtwv2vqQFz+fWTdnLNSkf02Q74TsB?=
 =?us-ascii?Q?t65f8/OhYfKYdOYTKqUq1kpbN6qgAs1Owy6F+2IFeh9XZ2QWYDefOv6KRPMf?=
 =?us-ascii?Q?7rzPzBvV2fmGs893Y3G0iUUji5TfqcqOusnT8GmjeuHRL9HpaHLC/2kA0vpB?=
 =?us-ascii?Q?T6pNIRgIWmhB7qwP0eP5EQERGqHifGfxrKeOSRZkYWaSpxX6+mbygizFjLra?=
 =?us-ascii?Q?F4SKFi+3bt3F4nED0SttPx3TrTpZavAqmF7/u/UVolJcdgIus33MJ+Htmkcq?=
 =?us-ascii?Q?Dsp6Ksujv1WTPI+GhhWjs8wANCqUePPYzquohH3quN63UbHeMz7e9QvNlfPc?=
 =?us-ascii?Q?ShqKatS3W5I3MWFMqE3EL0lTDAVdwANycJrtm5cpxgwe334c1b7BBlGId6VM?=
 =?us-ascii?Q?YXSW1Y78FSf3nX9EnOulgjv+KeVO2O1NCimRrRstHyubEy3qtamyE1nXv5uS?=
 =?us-ascii?Q?Gwlsh66ghkOlFoC7xUawSbD3np5x+nVQMDT4M488jTOx6rO4DQ0jbZ+98Lxl?=
 =?us-ascii?Q?7j/oOT35Xbf+Xt8LGvWLjjOOUwhwam5acuMBlv1igFs8kwztKXigOaHsZdb9?=
 =?us-ascii?Q?aR2IEQfwk/0plcm7wOEk9LycrqvKTLntuAg2OiNC1UOvrkQzB5shoP25lW3g?=
 =?us-ascii?Q?AQPV/B/C4/YBmb8jg/UDdEMWXFMvuTZkiY3bwt49ocsV2L0attnLdMG0Q95f?=
 =?us-ascii?Q?kaf8FoJUD4fFUc/r7vRzphgordfbS2YUvo+GTlVTGUFgJy7LB11P1Dy474dr?=
 =?us-ascii?Q?kTqqCu/wlxlP5Qp6C3i0W8GEus17VvO/UxGDDjGOVzhU7T7aZP9oZ7KGvE5I?=
 =?us-ascii?Q?y+PfVxIy6quH3i5tgyqb8Z+hjBdwifTtFlGpOdg7RpMJZhPa+Fw5/wlofKSv?=
 =?us-ascii?Q?ZbBdNU6qsImorO5pSX7l8IM/xKLwiAtNTB59VeJW3GalgLc39HNfSZB6PNI+?=
 =?us-ascii?Q?lS0giE4cORLq94Mb5pwQdwzpuPNNCCRgdqVikhT6Nf6ZDqWJAX79bKobyTkM?=
 =?us-ascii?Q?Xd1SLrV8nzdMjL7g9qUW+8QqZydCIp3+bX1VnpxO4LEyET3f3YSQiP/AFS0x?=
 =?us-ascii?Q?OUqtENw2fhZnDSPDcbTyP6X/F+3X2p5afm/li1LYvLBrdvYmndVHb+lIQ6Es?=
 =?us-ascii?Q?LNOOagUNvCaW+eKgOb6LGgIaEqiksRXJtffUOMxAbqwxqd7JqTVL0Dmv42zk?=
 =?us-ascii?Q?fPFwUOoZlRLTRLZ2YecrCKqQbHIgR3e3CD7Lpjfw7emMkN6lmvLJMkVMBfe9?=
 =?us-ascii?Q?XPvbYDHApW+skJl9agea0/pvoYFM21M+MPdI3ZlZtjGJyzJAQ6OcwI8h288V?=
 =?us-ascii?Q?SHfN+0r4YBobbS0h4w89v9kAdQ1gq/4m9hXgJxm8vh1ijkb9czU5SRAXfEzw?=
 =?us-ascii?Q?MxrWFKlMAlaXgl/vJR2Lq0jJ4Q4yIh5F1UafnTOQFUY4kjC3yq+nC7rdOMty?=
 =?us-ascii?Q?KSrzfNo139lj6KTyf0w2OMmsZ2XODVaVOjcbOVXC8pmkUZfm6BIhe6A3gDBe?=
 =?us-ascii?Q?l6UIzu+mEVDYQOTJIE7Bk12iRzTBLclYXnvuH+oes9t1DYjCilYmnc8KE5g7?=
 =?us-ascii?Q?4Sq/EPYUKmFOjgrZ3GtSUyUUrx9cKUGzEE76QSt2nBzCS+5cIMrFyExc0Fgo?=
 =?us-ascii?Q?HVb9Q4N8YZb232Q+BrFqVpACmD6+kTzlwIb27ZGs52NQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 51543a66-4dbc-4618-b2a1-08deaf58f59d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 12:29:34.5041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1015
X-Rspamd-Queue-Id: 493A8516110
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[xes-inc.com,none];
	R_DKIM_ALLOW(-0.20)[xes-inc.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36624-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[xes-inc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@xes-inc.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action



> -----Original Message-----
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Sent: Monday, May 11, 2026 6:16 AM
> To: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.o=
rg>;
> Vincent Fazio <vfazio@xes-inc.com>
> Cc: linux-gpio@vger.kernel.org; Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com>
> Subject: [PATCH libgpiod] bindings: python: don't decref objects
> on PyList_SetItem() failure
>=20
> PyList_SetItem() steals the reference to the object we want to add
> regardless of whether it succeeds or fails. Don't decrease the reference
> count of the object we failed to add in error path.
>=20
> Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
> Closes: https://github.com/brgl/libgpiod/issues/187
> Signed-off-by: Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>



