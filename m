Return-Path: <linux-gpio+bounces-8385-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD8793D070
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jul 2024 11:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D954BB20D05
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jul 2024 09:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AFBC142904;
	Fri, 26 Jul 2024 09:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZZElpYj7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2046.outbound.protection.outlook.com [40.107.103.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF851A286;
	Fri, 26 Jul 2024 09:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721986372; cv=fail; b=DulPTrL7oOBas62L2UA7s70Q28E7F8dIoUUek0oItoJsH0W0u2wxL3JSfwKBzzjVR9yIG7MeuvFcal0RPDhjPvp8FdEgWZIAJmwQi9WI72QKUGNW3WQaruZsP6whnKLStxElIzl5IEJwrs385q2tJnxHrSVLXBl1ppC86+SSHCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721986372; c=relaxed/simple;
	bh=q9glvYFI0sz6MAZNYbX2QQajDkOGtFbn7jXlOU2MQt8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bCww1orymeDSRA2DcG7qdWMB9FmWt7rzaQETuXj/8HuHlDNRLNNWg34pQZtwFREP7AUbl7zSIp9tKbn8cMdWFBBhd2JZalgVF8NaScaKsXVIy3iFWL1lrfM4fFZo9G1OLASvVfUz1Eae1Krh0lKNloG1pyVsVSWwPKy9FSNYkVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZZElpYj7; arc=fail smtp.client-ip=40.107.103.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oC/KwUHetWMIxxxsVECOanH23GyooGnomVWAzlCApWzGn4sZMIncMqBylq6jy7zzbx86E8q3RvNSPRWPwDhtbf1dX8+uuHtDLeA/N66PxvOzKk3bpjxc9TqwVDUNsHP/nH/ZWzKXNjmMqRDyjYpUw6UcLxwGde02Z9AGTwAHv50khjynqe7byOPJg1dfagLKF+S2gaPszu22BT/ALA0pBSzNNfpGRUaYdf0IDS1TJxyA2G2ZZ9z06iXBKGRfunxLyzjEm4yyMT3dL5+yDJtbbR7oA+wgRe2Rr+ujCaLbmILXGp7GWNRNGRPv57UaAJOV8AksHGCkFn5D3Hpozgy6tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9glvYFI0sz6MAZNYbX2QQajDkOGtFbn7jXlOU2MQt8=;
 b=QI657Zh/frr+0GxfaqXXnsxjaxJeNhpXObnZ/O2m4NayO9JV+wajjfGKKNZj/9Y+StN/OGzXMsohUnDFA7sC5oKxhUUx01MkRONHCYF8H8e1jVM0WM1y06G7IDJxmRgT7Xje3vaAzaqH3WTmhMK/9rasdlNopKpI6ZWZi22Mqh3jMB78d+IkC6pkl29XRo5w+fWaAxV0I54DWQmz2vh95+5F4OpI68tbNuoSFz/N9KYFkdvhKZSHe7ex583q2pgXWSenub5JxlHBXayzB3aRa5F2T1N+2QzG9sPJbpbPtNPHpBEJ6XXBCv6kkiAgqbC8b3PBGgBtZSBE1vjZdodRxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9glvYFI0sz6MAZNYbX2QQajDkOGtFbn7jXlOU2MQt8=;
 b=ZZElpYj7BAj+6X+0Z1CGODstXWrIQpkuCc5T5an3oFXlhV2u4y7tgvZ3ZztwuFgMQo4bmAV9uUS09WM5qzx8vRcuWFoCg7yrQ3stkPWn9sFbdKyiLPhncC12hJjEIOIPIky7pvLbKALbz0e4ndMbLDD2pjBolM52A0YhHXQLGmR6LeOpuC/s35t4z7Cr5y9H6fmtxJ2cCbYhnE8qvqW/B/sqlxU+cDhzYGO/bmBIaxzOIUGfaGDM8X12fA+mE57WblDCo72d2Tlhy5wJ0ReKaRK3c6Yq3Ceam3b9jtLdm0xFT3UfgyXlWEVspCd3rscPcrEINCfRTE9VYsM0v8owqQ==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by PA4PR04MB7869.eurprd04.prod.outlook.com (2603:10a6:102:c4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 09:32:45 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 09:32:42 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Frank Li <frank.li@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>, 'Shawn
 Guo' <shawnguo@kernel.org>, Fabio Estevam <festevam@denx.de>
CC: Conor Dooley <conor@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "'devicetree@vger.kernel.org'"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	Aisheng Dong <aisheng.dong@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>
Subject: RE: Question about gpio-hog
Thread-Topic: Question about gpio-hog
Thread-Index: AdrYxB2okPCeSPTPT0i7IfzJHAmx+QAXVymAAADjPgAACcSRgAF2WyRw
Date: Fri, 26 Jul 2024 09:32:42 +0000
Message-ID:
 <DU0PR04MB94960F9D18119F47BEA3E3C390B42@DU0PR04MB9496.eurprd04.prod.outlook.com>
References:
 <DU0PR04MB949657D9575090C71714D2A090AC2@DU0PR04MB9496.eurprd04.prod.outlook.com>
 <20240718-smudge-splashy-6e8addc80c02@spud>
 <b61742b9-0767-4e28-8b26-dfeb240726c7@kernel.org>
 <ZplynwYjPiLmUjDn@lizhi-Precision-Tower-5810>
In-Reply-To: <ZplynwYjPiLmUjDn@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|PA4PR04MB7869:EE_
x-ms-office365-filtering-correlation-id: 4ed87bbd-a6cc-4069-c493-08dcad55e660
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TzhuaFhkVGJTQkgweldLTkJjU09qSWVMQUFqcXZXbCt5N2VySHRUb3BJYVQz?=
 =?utf-8?B?S1pKYmErQ0REck14SWYyNEdibU9pZEdONVNBdmd6c3BJc3RyZlBNVWQ1Lzg3?=
 =?utf-8?B?c1Y3UWtKZEdkeFFPa2RTaTVJYldsT0NOSVMzMzZVUVJvblNibnp6OWd4bVE5?=
 =?utf-8?B?VVdadm5pNW5SZ0tCa2lCL09GR2JHYTBsdkN5VXAwZ1R1dVZWbGsyVTJMbU1Z?=
 =?utf-8?B?dTc1QnFxZEQvVVJjV2ZoTlM2My9abzduTjAwVmgzNjhITDhMZFZBekFvUnB6?=
 =?utf-8?B?bzRQdzFwMkxXVVVLYjF3QTlOdE1zKzdwRUZqaGtBMFZRTmJ5WWRIa2JpamZS?=
 =?utf-8?B?Zi9CRmt2Vkk4THpDZUk1VnYzMG9paThWcjIrS0tIaE43S2FaVTNBWDdlZStL?=
 =?utf-8?B?UkszNE1NcVpsRVkrZ3FMU1VweGpkTnJTRnJ1cm5jaStzTGNjcm5kR1RQUU5F?=
 =?utf-8?B?cDQ3dkF0WVJTNWRoOE5LQ0Z3SUFXb2hIRUpMdTZtOWZYRkpQQklLNDY2eVdv?=
 =?utf-8?B?S0U4WEl4eTBpTEdRSTFOVytZbC9MU05VZHdadU1aNVRIc3R6ZkZMNVhMK0ht?=
 =?utf-8?B?OTA3TnJXazFQTnBtcVVYVEdZa2hjM1hieSt2UHZBdVRVdU5iNXFmdFZPRWFa?=
 =?utf-8?B?U2lTQmpRbzlKbEJ5SjVRcFpick9jM25TVXkrMUo5QmNjd3NQRjhXbXh6SzJW?=
 =?utf-8?B?SFVKQUFreGhZUk9aVlVHNmJrSW9ZOWNkK3RDWGxYVGF0TzByRmdTUDNSYlBV?=
 =?utf-8?B?blhDQjVtSUlwQzdrMTdFY1U2STBnNEk3OXlUVkZKTHlJbVNlRGxBZ2dOUmhY?=
 =?utf-8?B?N3FGNHA1Y2lPVDJtWEtvSFNWU2pVRzJnc0t3Zy9lQXpQWVNnWUZ3N3p0Ulg2?=
 =?utf-8?B?SllpS3BnNlJEZmp6UVhIcENkaklERDkxQTQ0YkJGbGRqeXdsNWwwcTFka3I5?=
 =?utf-8?B?aXVEa1ZHSzM3dEVpdXpidmlGcjVpSTJPaFJBZURyR1pJMVhNUFdFeUFsTHVx?=
 =?utf-8?B?eW9YSmw1dzY0T2xMbW9qSkYwTGphU1NwUEJmS0JTM3g5YW85RUVzOGhkTGpE?=
 =?utf-8?B?aVpEN25yc29Hb2tKUmxMQ0dzSFpmQytTQmxTWE1jTVd5a29nZVB0TkpnTFc0?=
 =?utf-8?B?OTZKQWgrQi9SYzNKMG1NaTVWaWh6V2FrcHozYW4xVnRubWpTTnN5TGpwRHM5?=
 =?utf-8?B?d2R1eEFlYlN6MG1ZMkdtL3ZwQ3ZZbGdTWG5naEpCdzVkaE94RHhzcmRiLzVO?=
 =?utf-8?B?QTVDaCtCY0E0eEJTaWpUTi9sbXVJZHNuYnlkVmUyTE1KSEFJdGZiM2J1SnpS?=
 =?utf-8?B?ak9RNHBTbHFaRytvR2JWNU9wWmNKU252RVVyU1VpOU1CMTNjMDlSa0xJQW83?=
 =?utf-8?B?aHJ4OTZpSkk2cDVEbE9Tcis1R3NYUmpFcmVKQVdBM1lBOWNRcGIrNklhY0k3?=
 =?utf-8?B?eS9ON1cycVUrK29vekdqZ09ySFpiL0tIU3RRcmFJOEozUnRwVFZudnQvREVJ?=
 =?utf-8?B?alpJbXNGZDRrV1FHS2dDSWMxc2M4dDdaTk4rK0k5R0JibXkxeCtsb0o3RndM?=
 =?utf-8?B?d3F1Q3gySFM4RHVNckprZGpYd0lGTWlMY0trNm5lV3hXWU9NYjdueU9RUG96?=
 =?utf-8?B?RitROWRmYjRhOWVySEgxL3FxYUZWeGlNWnJaWFlPMUlvanI3bFhjbitteGhz?=
 =?utf-8?B?Mmxzby9hOFZBUTN0ZzJ5T0cvR3FGL3dYT2dMWEhiWHpPNTlkVWVoeVlZTktw?=
 =?utf-8?B?ZXZJc0EyTFNwN05nTE5rQmNtSVA5d1htcFhaRkRVM3VXaGxiaDk4bFNGTjdB?=
 =?utf-8?B?SXdxd0FxeW9Za2pWekRxcTRxUlEvV2VCT0hxYXZacUF3YUNrOGoxQnRoUCt3?=
 =?utf-8?B?QzBUTGJUQ3pJZWFTekRFSzNsYm9mMWpVUXcrQVVsVUJpRUE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d0l0eGNFMjN1RUwxK2dCYy8yeGszZUJDTTMyWFhESzJGYkpJRnAzNnI4bkJP?=
 =?utf-8?B?TDM5REFPYnZ1ZE1UdHlNQ2hKZEdZeFZ2MDhwR3lsUkI5bjlWV2RoYlBxTUEw?=
 =?utf-8?B?R0N2TWxiUit0NHVkVVFZRzNYQVpxbHA0WWgzL3R4a1krS3U3Njh5b3hCaHpu?=
 =?utf-8?B?UlVMLzBDc3pKWGFDdTZFT2NGLzRzdG41dTVZM2cvWEtQTENJSDVXQWpIRnh2?=
 =?utf-8?B?WDFyWkdmd1MvQnRFU0NGQmJxelI0cEtVYXNwdDJJS3BnbkU2bXYyaWhxZDAw?=
 =?utf-8?B?SE9vSldMU2lndEJiRE1tTlY5UWVPZi9uN0hrY0NVOEJvL2NHcWQ3QlVkMytQ?=
 =?utf-8?B?bFZROG1ISGVaSXRwaDRBSXBuTk1NcEpTQnlzZUdaYUY0RjFiRDZNQUs4eDNo?=
 =?utf-8?B?RkpEb2JyRzNDRTdrRU5XejJLS0tqQTRqL0dVbS9pckpQTFF3Mk8yOHcvSE5M?=
 =?utf-8?B?V0JZWEtGVUo5U1BaRXd5dDg2Z291NE5MVlU5QnhQQkg4VURLR2kvL1ZVOVhz?=
 =?utf-8?B?Y3NjUmtkdEVvL0pJU0dkYVorZW1ISjFqYlM0RTJJTHd2S1cwTGwyMnFjaUpI?=
 =?utf-8?B?T1d3K1JBNjJqNEV1UUZYU2Q0WkNza0N1b3lZSGNKS3dIcnhha2hCQzV3Q0N2?=
 =?utf-8?B?bGtNS3lDL2pySTJ3Z2FsdkExWVVKdm9Pa0x4RTZsWlMyUG1qeEQ2bHNBU2Z3?=
 =?utf-8?B?aG1RMVlKcHBSMUp5bFJFY00zbXlUTCsxNVZyN2QwSkE0dW53TUZERXUrQTcv?=
 =?utf-8?B?SDBuUWdTVW5DdVUwYVY3emkwK3FETnVPdG0zd2h0Ri81V0hlT1RlSjNsN0NK?=
 =?utf-8?B?dE54OTB0L2lWTmFlOTFSOXZvNGx6dDV2bnlOSk50M1pHLy81ZGZ4QUdOVmNF?=
 =?utf-8?B?L25Zb29tUUFZMjFKeHhEN2ZQZUYrNHVwcC9YTVpVZEh4Y09lV0N6RjVWUnR2?=
 =?utf-8?B?STNoNmg5T21BemtYaUdnSUZ1Qnl2RHpBbDlTenFDZUM2ZTJiSngwTHdFMVp6?=
 =?utf-8?B?UnZPMHIyN0NPTkNrZjZCaEo1ZlBvYXhvTlZYWk5zSkF3T1h0VCtOQW9sMEUx?=
 =?utf-8?B?NTlzcDErWUo0MHArNW1RSUVEN3A4YXdaQjVkTDVjK1hTMWJZRkRTbGN4bEVB?=
 =?utf-8?B?UEZFWWFPeXAvQXIxMTlIS2syS3FRYklFR3NqRUR6b0NiaWJCcytXUjBJOVA3?=
 =?utf-8?B?VTRPS1dSVlQ4OU9kOFRMU2tCQjhrSzVZMFh1VnJleENweTNJcTI2bDBDVVZQ?=
 =?utf-8?B?a29CNXRidDhVZ2wxSjAvd2RwNjdLaFlKcUVyNXpjSUlHOVd3RGMyeGlYcUlD?=
 =?utf-8?B?VmxVV1hCT1BydnhiYkFmMVpNNUpJQnZvRENoaGRoTHNERGFTSlh4REhkU0N1?=
 =?utf-8?B?alhkVEpybk1xQVQzQW1YM0RvSTd6NmN6b2psUmRQa3VjRjJUdjVReW5VUUFG?=
 =?utf-8?B?L3A2WXdJcTZoMVk4MXg1NDhWbzlrMjMxVVBKOElkdnZWRjdyQXNnSUdLZnUy?=
 =?utf-8?B?YXd0VjBaWUN3NXBwRHlkVUI4cURISG1yM01lcWxkVk1tSEwxbUo3cldpVXFn?=
 =?utf-8?B?RWlpSmpUSVl4TnQ3Rm9wNWdVbDVJaTJUMk10QjN2Z2xHZHBaekZFT3NhRXl5?=
 =?utf-8?B?WE9JRWZoTE5IVXNZNGQ2T0V4VG1HTSs5UWVLQ0t6UmJRb3BEOEFZZ3J4TERv?=
 =?utf-8?B?K3hIQmNOQVdjVjZ1c0c5TXpmQUpia1dYcGkyYTB2d1c0SGd6K3dSSEVHZTNQ?=
 =?utf-8?B?cUI1OE1XUzdsektiWXNyY2p4Mitja1FwTCtUeHZVMmw3VmxUcm5MQmVVM3FI?=
 =?utf-8?B?dEM3N3FiS2hqK0VHVXMvSFFJNkxYTWxESlFBN3FSSDdKSjBGaDI2V0F5bDgx?=
 =?utf-8?B?RjFiTlNjYWwyT05LVGdsZlRrRmxCaGhqWktmUm4vTW4zeW1LMlpkY2piUzdU?=
 =?utf-8?B?VWU4L0NvOXR2VlQ0TmJrb3QrMmRER1B0OTVha1dVaTN0MngxbWdTaWRQTDda?=
 =?utf-8?B?ck1XNEJmalYwVDJSWjdvWEVEY1hTaU1BUDJHelBibmRMMFBHRWJ5aWRyZmR4?=
 =?utf-8?B?Q0V2R0wwSmpPcVpnby9oU2dycVdyRWpVdHVlSGkyRTRBZERZUFFUaC9pSHo3?=
 =?utf-8?Q?d3PU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed87bbd-a6cc-4069-c493-08dcad55e660
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2024 09:32:42.8508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Avs+qJ+NHSutmpBdXbUDYk4b2b3JwIgi8Yjk66fVntIgvgSzv0+fpS9CkU62gFmQ3WYv3DLX+p6Qny8WVVja+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7869

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGcmFuayBMaSA8ZnJhbmsubGlA
bnhwLmNvbT4NCj4gU2VudDogMjAyNOW5tDfmnIgxOeaXpSAzOjUzDQo+IFRvOiBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IENjOiBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+OyBCb3VnaCBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+Ow0KPiBMaW51cyBXYWxs
ZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+OyBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPjsNCj4gbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7ICdkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZycNCj4gPGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPjsgaW14QGxpc3RzLmxpbnV4
LmRldjsgQWlzaGVuZyBEb25nDQo+IDxhaXNoZW5nLmRvbmdAbnhwLmNvbT47IFNoZW53ZWkgV2Fu
ZyA8c2hlbndlaS53YW5nQG54cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBRdWVzdGlvbiBhYm91dCBn
cGlvLWhvZw0KPiANCj4gT24gVGh1LCBKdWwgMTgsIDIwMjQgYXQgMDU6MTM6MjJQTSArMDIwMCwg
S3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gPiBPbiAxOC8wNy8yMDI0IDE2OjQ3LCBDb25v
ciBEb29sZXkgd3JvdGU6DQo+ID4gPiBPbiBUaHUsIEp1bCAxOCwgMjAyNCBhdCAwMzo0MDo0OUFN
ICswMDAwLCBCb3VnaCBDaGVuIHdyb3RlOg0KPiA+ID4+IEhpIEFsbCwNCj4gPiA+Pg0KPiA+ID4+
IEkgaGF2ZSBhIHF1ZXN0aW9uIG9mIOKAmGdwaW8taG9n4oCZLCB0aGUgcHJvcGVydHkgZ3Bpby1o
b2cgc2VlbXMgdG8gYmUgdXNlZCBpbg0KPiBHUElPIG5vZGUgcmF0aGVyIHRoYW4gaW4gdXNlcnMg
ZGV2aWNlIG5vZGUsIHNvIHdlIGNhbuKAmXQgdXNlIHRoZSBkZXZpY2UtbGluaw0KPiBmZWF0dXJl
Lg0KPiA+ID4+IChzb3JyeSBmb3IgcmVzZW5kLCBJIHVzZSB0ZXh0L3BsYWluIG1lc3NhZ2VzIHRo
aXMgdGltZSkNCj4gPiA+Pg0KPiA+ID4+IGUuZy4NCj4gPiA+Pg0KPiA+ID4+IHBjYWw2NTI0OiBn
cGlvQDIyIHsNCj4gPiA+PiDCoMKgwqDCoMKgwqDigKYNCj4gPiA+PiDjgIDjgIDjgIAvKiB1c2Ro
YzMgYW5kIFFTUEkgc2hhcmUgdGhlIHNhbWUgcGluLCBoZXJlIHNlbGVjdCBTRDMgcGlucyAqLw0K
PiA+ID4+IOOAgOOAgOOAgHVzZGhjMy1xc3BpLXNlbC1ob2cgew0KPiA+ID4+IOOAgOOAgOOAgOOA
gOOAgOOAgGdwaW8taG9nOw0KPiA+ID4+IOOAgOOAgOOAgOOAgOOAgOOAgGdwaW9zID0gPDE2IEdQ
SU9fQUNUSVZFX0hJR0g+Ow0KPiA+ID4+IOOAgOOAgOOAgOOAgOOAgOOAgG91dHB1dC1oaWdoOw0K
PiA+ID4+IOOAgOOAgOOAgH07DQo+ID4gPj4g44CA44CA44CA4oCmDQo+ID4gPj4gfTsNCj4gPiA+
Pg0KPiA+ID4+ICZ1c2RoYzMgew0KPiA+ID4+IMKgwqDCoMKgwqDigKYNCj4gPiA+PiB9DQo+ID4g
Pj4NCj4gPiA+PiBUaGUgYm9hcmQgc2hhcmUgdGhlIHBpbnMgb2YgdXNkaGMzIGFuZCBRU1BJLCBh
IE1VWCB1c2Ugb25lIEdQSU8gcGFkDQo+IGZyb20gb25lIEkyQyBHUElPIGV4cGFuZGVyIHRvIGNv
bnRyb2wgdGhlIHNlbGVjdGlvbi4NCj4gPiA+PiBTbyBiZWZvcmUgdXNkaGMzIHByb2JlLCBuZWVk
IHRvIG1ha2Ugc3VyZSB0aGUgZ3Bpby1ob2cgaXMgY29uZmlnZWQuIFdoaWNoDQo+IG1lYW5zIHVz
ZGhjMyBuZWVkIHRvIGRlcGVuZCBvbiB1c2RoYzMtcXNwaS1zZWwtaG9nLg0KPiA+ID4+DQo+ID4g
Pj4gVG8gYWNoaWV2ZSB0aGF0LCBJIGNhbiBhZGQgYSBmYWtlIEdQSU8gcHJvcGVydGllcyBsaWtl
IGJlbG93Og0KPiA+ID4+ICZ1c2RoYzN7DQo+ID4gPj4gwqDCoMKgwqDCoOKApg0KPiA+ID4+IMKg
wqDCoMKgwqBob2ctZ3BpbyA9IDwmcGNhbDY1MjQgMTYgR1BJT19BQ1RJVkVfSElHSD47IH0NCj4g
PiA+Pg0KPiA+ID4+IFVzZGhjIGRyaXZlciBkbyBub3QgaGFuZGxlIHRoZSBob2ctZ3BpbywganVz
dCB1c2UgdGhpcyBmYWtlIGhvZy1ncGlvIHRvIGxldA0KPiB0aGUgdXNkaGMzIGRlcGVuZHMgb24g
cGNhbDY1MjQgSU8gZXhwYW5kZXIuIE1ha2Ugc3VyZSB3aGVuIHVzZGhjIGRyaXZlcg0KPiBwcm9i
ZSwgYWxyZWFkeSBzZWxlY3QgdGhlIHVzZGhjMyBwYWRzIG9uIGJvYXJkLg0KPiA+ID4+DQo+ID4g
Pj4gQnV0IHRoaXMgd2lsbCB0cmlnZ2VyIHRoZSBEVCBjaGVjayB3YXJuaW5nIGlmIHJlbGF0ZWQg
ZGV2aWNlIGJpbmRpbmcgaGFzDQo+IOKAnOKAnGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZeKA
nSDCoG9ywqAg4oCcdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZeKAnS4NCj4gPiA+Pg0KPiA+
ID4+IENhbiB0aGlzIGJlIGFjY2VwdGFibGU/IEFueSB0aG91Z2h0cyBmb3IgdGhpcyBjYXNlPyBJ
IHRoaW5rIHRoaXMgbWlnaHQgYmUNCj4gY29tbW9uIHVzZXIgY2FzZSBmb3IgZ3Bpby1ob2cuDQo+
ID4gPg0KPiA+ID4gSSd2ZSBnb3Qgbm8gaWRlYSB3aGF0IHRoaXMgZGV2aWNlIHlvdSdyZSB0YWxr
aW5nIGFib3V0IGlzIC0gYnV0IGl0DQo+ID4gPiBzZWVtcyB0byBtZSBsaWtlIHRoZSAiaG9nLWdw
aW8iIHByb3BlcnR5IGlzIHdoYXQgeW91IHNob3VsZCBiZSBkb2luZw0KPiA+ID4gKGFsdGhvdWdo
IHByb2JhYmx5IGNhbGxlZCBzb21ldGhpbmcgbGlrZSAiZW5hYmxlLWdwaW9zIiBpbnN0ZWFkLg0K
PiA+ID4gV2hhdCB5b3Ugd291bGQgZG8gaXMgc2VuZCBhIHBhdGNoIGZvciB0aGUgZHQtYmluZGlu
ZyBmb3IgdGhpcw0KPiA+ID4gZGV2aWNlLCBhZGRpbmcgYSBwcm9wZXJ0eSwgaW4gd2hpY2ggY2Fz
ZSB0aGUgKlByb3BlcnRpZXM6IGZhbHNlIHdpbGwNCj4gPiA+IHN0b3Agd2FybmluZy4NCj4gPg0K
PiA+IElmIHRoZXJlIGlzIGRldmljZSBkZXBlbmRlbmN5IG9uIHRoZSBob2csIEkgd291bGQgc2F5
IGJ5IGRlZmluaXRpb24gb2YNCj4gPiBhIGhvZyB0aGF0J3Mgbm90IGEgaG9nLiBIb2dzIGFyZSBm
b3IgY29udHJvbGxlciB0byBpbml0aWFsaXplLCBidXQNCj4gPiBoZXJlIHlvdXIgZGV2aWNlIGRy
aXZlciBuZWVkcyBpdC4gVGhpcyBzb3VuZHMgbGlrZSBzaW1wbGUgcGluDQo+ID4gY29uZmlndXJh
dGlvbiBmb3IgZGV2aWNlLg0KPiANCj4g4pSM4pSA4pSA4pSA4pSA4pSA4pSA4pSQDQo+IOKUgiAg
ICAgIOKUgiAgICAgIOKUjOKUgOKUgOKUgOKUgOKUgOKUkFAwICDilIzilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilJANCj4g4pSCICAgICAg4pSCICAgICAg4pSCICAgICDi
lJzilIDilIDilIDilIDilrogRGV2aWNlIDEgICAg4pSCDQo+IOKUgiAgICAgIOKUgiAgICAgIOKU
giBFWFQg4pSCICAgIOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
mA0KPiDilIIgU09DICDilJzilIDilIDilIDilIDilIDilrrilIIgICAgIOKUgg0KPiDilIIgICAg
ICDilIIgICAgICDilIIgTVVYIOKUglAxICDilIzilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilJANCj4g4pSCICAgICAg4pSCICAgICAg4pSCICAgICDilJzilIDilIDilIDi
lIDilrogRGV2aWNlIDIgICAg4pSCDQo+IOKUgiAgICAgIOKUgiAgICAgIOKUgiAgICAg4pSCICAg
IOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUmA0KPiDilIIgICAg
ICDilIIgICAgICDilJTilIDilIDilrLilIDilIDilJgNCj4g4pSCICAgICAg4pSCICAgICAgICAg
4pSCDQo+IOKUgiAgICAgIOKUgiAgICAgICAgIOKUgg0KPiDilJTilIDilIDilIDilIDilIDilIDi
lJggICBHUElPIOKUgOKUmA0KPiANCj4gSSB0aGluayBhIHR5cGljYWwgY2FzZSBhcyBhYm92ZS4g
VGhlcmUgYXJlIGV4dGVybmFsIHBpbm11eCBjaGlwIHdoaWNoIGNvbnRyb2xsZXINCj4gYnkgc29t
ZSBHUElPIHBpbnMobWF5YmUgaTJ4IGdwaW8gZXhwZW5kb3IpLg0KPiANCj4gSWYgZGV2aWNlMSB3
b3JrLCAgZ3BpbyBuZWVkIHNldCB0byAwLg0KPiBJZiBkZXZpY2UyIHdvcmssICBncGlvIG5lZWQg
c2V0IHRvIDEuDQo+IA0KPiBXaGVuIGR0cyBkZXNjcmlwdCBkZXZpY2UxDQo+IA0KPiBkZXZpY2Ux
ew0KPiAJY29tcGF0aWJsZT0iYWJjIg0KPiAJcGluY3RybCA9IDxzb2MgcGluIG11eD47DQo+IH0N
Cj4gDQo+IE5lZWQgYSBwbGFjZSB0byBzZXQgR1BJTyB0byAwLiBJZiBpdCBwdXQgdG8gaG9nLCAg
aG9nIG1heSBwcm9iZSBsYXRlciB0aGFuDQo+IGRldmljZTEncyBkcml2ZXIgcHJvYmUsIHRoZW4g
ZGV2Y2llIDEgZmFpbHVyZSB0byB3b3JrLg0KPiANCj4gSG93IHRvIHRvIGhhbmRsZSB0aGlzIGNh
c2UgdG8gbWFrZSBkZXZpY2UgZGVwZW5kIG9uIGdwaW8uIGRldmljZTEgYWx3YXlzDQo+IHByb2Jl
IGFmdGVyIGNvcnJlY3QgZ3BpbyB0byAwLg0KPiANCj4gQW5kLCBpcyBpdCBwb3NzaWJsZSBsaWtl
Lg0KPiANCj4gbXV4DQo+IHsNCj4gCWNvbXBhdGlibGU9ICJncGlvLW11eCI7DQo+IAlwb3J0MXsN
Cj4gICAJCXBoYW5kbGUgZGV2aWNlMTsNCj4gCX0NCj4gDQo+IAlwb3J0MnsNCj4gCQlwaGFuZGxl
IGRldmljZTI7DQo+IAl9DQo+IH0NCj4gDQo+ICJncGlvLW11eCIgZHJpdmVyIGV4cG9ydCBhIHN5
cyBlbnRyeSwgIHdoZW4gZWNobyAwPiBzeXMsICBkZXZpY2UgMSBwcm9iZQ0KPiBkZXZpY2UgMiBy
ZW1vdmUsDQo+IA0KPiB3aGVuIGVjaG8gMT4gL3N5cywgZGV2aWNlIDIgcHJvYmUsICBkZXZpY2Ug
MSByZW1vdmUgZnJvbSBzeXN0ZW0uDQoNClRoaXMgc2VlbXMgbm90IHRoZSB0eXBpY2FsIHVzYWdl
IG9mIGdwaW8tbXV4LiBVc3VhbGx5IGdwaW8tbXV4IHdpbGwgbm90IGNvbnRhaW4gc3ViIG5vZGUs
IGluc3RlYWQsIG90aGVyIG5vZGUgd2lsbCByZWZlciB0aGlzIGdwaW8tbXV4Lg0KDQorU2hhd24g
YW5kIEZhYmlvLg0KDQpKdXN0IGxpa2UgRnJhbmsncyBkaWFncmFtIHNob3dz77yMaXQgaXMgdGhl
IHNwZWNpYWwgYm9hcmQgZGVzaWduIHdoaWNoIGludm9sdmUgdGhlIG11eCwgc28gbG9naWNhbGx5
LCBhbGwgdGhpbmdzIHJlbGF0ZWQgdG8gdGhlIG11eCBzaG91bGQgYmUgdHJhbnNwYXJlbnQgdG8g
ZGV2aWNlMS8yIGZyb20gdGhlIGRldmljZSBkcml2ZXIgc2lkZS4gU28gZ3Bpby1ob2cgc2VlbXMg
dG8gYmUgbW9yZSBzdWl0YWJsZSBoZXJlLiBCdXQgZnJvbSB0aGUgYm9hcmQgbGV2ZWwgc2lkZSwg
dGhlcmUgZGlkIGhhcyBhIGRlcGVuZGVuY3kgYmV0d2VlbiB0aGUgbXV4IGFuZCBkZXZpY2UxLzIu
IA0KVGhlIHNpdHVhdGlvbiBoZXJlIHNlZW1zIG1vcmUgbGlrZSBhIHBpbmN0cmwgbXV4IHRocm91
Z2ggZ3Bpby4NCg0KQmVzdCBSZWdhcmRzDQpIYWlibyBDaGVuDQoNCj4gDQo+IEZyYW5rDQo+IA0K
PiA+DQo+ID4gQmVzdCByZWdhcmRzLA0KPiA+IEtyenlzenRvZg0KPiA+DQo=

