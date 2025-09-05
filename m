Return-Path: <linux-gpio+bounces-25664-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C14A3B453E0
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 11:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77CF8A464B4
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 09:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC3E298991;
	Fri,  5 Sep 2025 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="uKK4Rs04"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011049.outbound.protection.outlook.com [52.101.125.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706CD296BD0;
	Fri,  5 Sep 2025 09:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757066326; cv=fail; b=r9nmHYcOuDU/CIPj7xfukTXRlREhvuFMRwbTRi6CAGP5A3RdnbI2u5juQp+UZbcvKhvfMmGx45bH6HTsO+Kv1xCgp0o5knKQ2CQEzyHlp/Misj7rUwQHmAdSQ1wpd85BNg9j2LpAYzTdniSCBHpH8yF+A5Ir+1qW3rxncIp6cEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757066326; c=relaxed/simple;
	bh=WCkdWyVMe8/mzxp1/EXMOk8ByKQdrpAIln9av6Dg5sk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a1q7rwb3o3IJPUWRm25wRu7lQa986a/m3cpMgIM6zSkrPFftNTYVA1JVaZU5QOpqX2+aVK43V181GpCG/W1mhyL+JqRSNd6X3ETaFrwc6vgz7sISApord7BIFaq9s9G5Z4+B9+pkr36g5R/CWUIShFPVXULc3xlEMc5Ji7b0fFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=uKK4Rs04; arc=fail smtp.client-ip=52.101.125.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uNn5GZo+Fsp/Ufmvig+8D7T+abVTTHAYp3NEUF+/ZF6+xeXezlxxNWIJPo9b9qtKmBKEW3bh6q8Z/tGrOunYax0eH0XWSpe3yWa0wjs2IZpAGKZXZwHcXSnMOLxeR3EPAZhoeZxfdz5JZvGBKNT8NV1mcEMOv877SB2w9G0l+FBNAM3LretAYSsIFwW+FRqpQ3cl05fBuCKu592GcTX+hjkxltIQmkD3U7z0lV2EK9cwE20jDFf9HXEMpoW2r+IXQuHiubGam/o711Ac9o05Y7TH7/dGQNpyCZpZJlVU49PDzAUUS6kvP/eNHmba1y/MFSvVsJBOkP2R/oD6JnUP2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCkdWyVMe8/mzxp1/EXMOk8ByKQdrpAIln9av6Dg5sk=;
 b=KKiD2YXBcnOJM9J5bwRfhHVkIGsqMN/76LdGkmd++LqQpXBcbOIqLho7ZQoXaXjvAaHQvzTnFf4NlQpxnUoJMQ73bjwnAMKFu1TRp3igLC/p4+6DGFjvuKt8/ASEJp9EfVQx4vAKgRCo7HKeONBF6sMSDhAkuDbvaymfrmr1DUHcVJ8KJ43XEv8v47lco0e3FaM7U5Hi3kcEikSpEjN3vBDhoRRORVeqtAUukkcKpQV3qLWEbQrOC+CGR9oNWKYYDx0Wvr4tqBHq8zN2pVvZvG4TcF44KLt4wYlybEDYg0a4WyXDCZNru5vinFglsfYoLiIUxPDidr8D56lOECRPUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCkdWyVMe8/mzxp1/EXMOk8ByKQdrpAIln9av6Dg5sk=;
 b=uKK4Rs04wAcUCN+bi1LV0fCmpj0mWJ72pHQbaJ55U2zyVWluhkTx1Zq5ttk3GutGHrE/ft4lurkP1w25J7iBhj2EYKt9+jA1TyS7jJcWkK0/znm2f/kl9UGR5N2vDOyPIcSAuAdFCGL1EjvNg5N2xBCSeW1le848OLeJuKfoBKQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB15223.jpnprd01.prod.outlook.com (2603:1096:405:27a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 09:58:39 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 09:58:39 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Linus Walleij <linus.walleij@linaro.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] pinctrl: renesas: rzg2l: Fix OEN resume
Thread-Topic: [PATCH v2 1/2] pinctrl: renesas: rzg2l: Fix OEN resume
Thread-Index: AQHcHkkQIP3cfcdv7k2m8bI+uQIOkLSEWleA
Date: Fri, 5 Sep 2025 09:58:39 +0000
Message-ID:
 <TY3PR01MB11346E5ED379B786B111791088603A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250817143024.165471-1-biju.das.jz@bp.renesas.com>
 <20250817143024.165471-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdW3_-3qC99htcUT-R0wTmXuLhLE=Tx5yKUeG-KiD+x3zA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW3_-3qC99htcUT-R0wTmXuLhLE=Tx5yKUeG-KiD+x3zA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB15223:EE_
x-ms-office365-filtering-correlation-id: ef2f1d3f-d393-4caa-db66-08ddec62c9e4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZW9LSVQ1YlpYMldJaFhnVjNrVFVaOGFaMVRQak5oVVpJakhBOGtZbEpQZE1U?=
 =?utf-8?B?bTZIVTNjYVZmRDZiRm5FTWRVOWNNVENET1B0eXlPRXltaWpVMzVyb2Q4VXJu?=
 =?utf-8?B?UlZwV3M1dDhSbzBzZzkrUXplNWNXN24yZ1RpM25Pd1FaSGJOMTVZc1gyMWdG?=
 =?utf-8?B?WGVIR0dJdlVoSHJKdW9RYzdwOG04ZXpNL05NTkZOSkgrdmhtenVHRGRsQUlN?=
 =?utf-8?B?ZjhBanUxbE1HbGNaRk1TcXErZUJlMzRPMCt4enhBUzVYcWlyU1FiVEErZHdm?=
 =?utf-8?B?WnRDV2hqZ0dPYVp4Qld4S3hRU0ZJLzJyRUp4KzhMK0Q3UVFKdnNwdm5GNTR1?=
 =?utf-8?B?dVJ0QUVxcFNvNzNCZFlBOGJVcFg1b1Rzc05PRFh4OHZKU2ppWlFnREI3OVpy?=
 =?utf-8?B?N3lCbFplQVYrWUxqYjIzeHY4NWVhRE5reXFtS2NrZ3VSa2JiVHJPcDd2UCtv?=
 =?utf-8?B?QTdFd3lSc0dEV1lEUGNmRWl6M3FjeUc0czhCOUhLaUhHc3JydnYvRmNMSjNl?=
 =?utf-8?B?MDFLN1NqZVMvN2V5Z01RcE5aQ3RlZ2NmWkRpeGhtMHZ3TTBUUTFKVnJ2RTZo?=
 =?utf-8?B?ZytXbHl4NDlBblQyWHdiUHlKOTNaNzA4ZXdwc0R5bVpLSnpSeDBEWFFSTUYx?=
 =?utf-8?B?REFXVmJQemZWOW5VR3JlUFp5bWxRdDBDWUdoUloyRHhwOVlQcVNTKzc2N0FP?=
 =?utf-8?B?TmpFTWorL2NSd3FHNVZWL3lzQXY1VHZCdFpBVE1VVVgxaGZMaHhtbUlFbnQw?=
 =?utf-8?B?UnJXTnQwKzZ0NW5aRkoyeElUVnlNU1E5TWZBbk1uOXIzdEU1N1p6MFFSR3ZQ?=
 =?utf-8?B?TmdnVUVBSldqYkdxRVJHdUwyRFhMVHVXNHNob01zN1A2ZzkxZjlXMGJ2dis3?=
 =?utf-8?B?elo1d2g3THhCd2JkMWRSNmxyWC9vM005WmZ4ZERuN2dLdFFORXZYWkIwbEkr?=
 =?utf-8?B?a09udk9hMnJMSlptNEw0Vy9idkpUbUVTa05Vcm9NREt2OWtjSlF6NHRYOVdh?=
 =?utf-8?B?Z29JNUQ4WWhlbmVYeWI5VElBem95N1dJUEdaWTdjaEhZRklnYlNlU3NsSGE2?=
 =?utf-8?B?TzU4clhWbGxudisrZm40WXdtS0JnSzBBVi9hdDkwWUJzNWJ3K001WmpvMUdo?=
 =?utf-8?B?QWRxQmwwTUNNMUNpZXJ3a3ZCWGgxM0JuQktvZk5GUE5SYTdXVmlRc0FIRSt6?=
 =?utf-8?B?QWJVaUtpbGRPRU9KRWJZdlNiRTQwQ0o4NHRycjQ5Q216QU9WaTI4aXM5Nk5n?=
 =?utf-8?B?V3NXcWRVL3hXeHN0dFFCd0RlanZRYnZRZUN0RjZUN1F2aGNGQ3REZndoTXN0?=
 =?utf-8?B?QjQ5ellzekdaL09ROUJvRGtidTFjdEVDWGZvYS9hNFJISzE5OWkyVURpdis5?=
 =?utf-8?B?VmhneXpzcSttcjZzWmlxNFRnNHJ6bDFOb0pDZ0JCSFpGUEFUelluYmVYbU9F?=
 =?utf-8?B?MC9YNk1SL0xLRWVLQk5OMnZhZE9RblRwWnU5WVJzUkk0b2M1cnY0bmpmSExs?=
 =?utf-8?B?U3JOMmg0V2UyRm9relMwZEJjeVBPMXZnaE1Rb2phR2hYNXJud2I2ZnhwUERh?=
 =?utf-8?B?Qlp1L3dRNnltSjZzNS9pVHhjQm53dU0wNUZLY0hzQ25wTmdqelI3NTBmdi9u?=
 =?utf-8?B?RUdsK2RIK3c0djk4eGxHTUsvMnNRRWVQNTE0bDFBU2JTNk8reGRZNXBYLzJt?=
 =?utf-8?B?cHIxV2RvNytmRDE1c0tnUlFmRFdndnV1TStYcncva3YzM0FDaE54N2sxK093?=
 =?utf-8?B?VnV1WjVWWmpEZVVlWTFtNnRnR0haMXV3cHNZTlB3TjB1Zy81QVZCNkRMYVN3?=
 =?utf-8?B?U0JTNW8rNUpIR2t5MDVTOTdHeG5tN0Z4RW5JSHJpOEMreFhEL2RBaGZ1Vjgw?=
 =?utf-8?B?MzE3SSs5MHV3bURVcFY4ZVRmYkd5S3VHNTFTYUhKa0tTS1FIOUZoVDgrNFEv?=
 =?utf-8?B?RTEyQmJiVHpuZEpWNUVPVUFqMHZ4em4yTFNOcXhvMEw0MmJZc2Zwd1lXWjdB?=
 =?utf-8?B?eU1scnNxUFdBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?alZsM3pzUVMyT29YajFEaEhiNW5Xc1h3aFJpSDJPTEtNRWkwMzVvb0NPMVBY?=
 =?utf-8?B?S0Fad2ErclhBYk9VbnlQV1JmdHp6TGEvMEtmNU5hM2dXWm1QWWsweWo0WFg0?=
 =?utf-8?B?aEYrRlZFTW5HcXV5REJzRjlDd1hzZjh3dWRuWW9VWGUvaUpyWEkvalRSVGZj?=
 =?utf-8?B?ODBMR3d6b3Z0RWErQlp4Z2NwVkhSYytPbk5pekVybi90aVVURmlKQWdCdjBz?=
 =?utf-8?B?a0JUY3kxOWRHZDYrR3ljOSs5dWFGczZGL2RqYWRtL0tGcXBjQVd6aFYxeU5X?=
 =?utf-8?B?ZEIwZXBlQTJVeGFpVC94WHpweEJZTnhpK3dsL0NXWitSem8rU201N29rZEJq?=
 =?utf-8?B?OGwwMDNIdEtRa2hwcE94TnhnNmhEWEJtNW1UejNjemtIeHBTYTRpQ1BHTEtt?=
 =?utf-8?B?eUdiODNqOXIwOXpLWVBGa2FML0gxelRnazZNNVNxSlNkbnBESHFWRGoxTG9M?=
 =?utf-8?B?b2RkMWlKS2hTaGNIVmNIZkRCdnJEZUNhd3RXRkl5N25ueHpnWEZUQy9oK0hl?=
 =?utf-8?B?V2dBdlRUSVErTmxXNXR3eWdjWXg3cnhzM3JlYWEveXQ5QTBjRTRhb3BCTWl5?=
 =?utf-8?B?bnFjS2pIR0lKeUUzdlFERjB3NTZtZ0RLL29aQlJPbnFGZTd4STd5TlZzUWR2?=
 =?utf-8?B?eVROWWMzNlMvb044MXUxQ21zVE0xV1VtYWcwUWF0THE0cyszK2lNSG0vZGFm?=
 =?utf-8?B?T3RZaU9QMkdubW1EcGMrTFRhMDRBUDU3Z1l1QVhUN3VzUlg3bk96M3A1Y2V0?=
 =?utf-8?B?MDVSSGI4ZzZQV1RuVVdTVmVpdkhnS05GK2hRc252Vkt0TGVUN1E4aDE4bC9t?=
 =?utf-8?B?K0JkOEFkQWRNdzlpN3FlNmVQTFd3WFNFQ3VjeU5IUThXUzJPN094eEliQm9S?=
 =?utf-8?B?UHBOc1RxcS9qcEJlQVg1OG9Rc0VGTGJZNkw0aGRDTkVtcHlHamdLV1d4blRE?=
 =?utf-8?B?bTR5ZWpPcjR2OWovNForVGFsV2ZrWDE1ZkduVmJ4WDZMZ3ZYem9MREFVWjBo?=
 =?utf-8?B?Y0ZWR3VJU0RzUURmRUZWcXUrVSt1MWNWc3pObXE1Tnp6U3JrbHljVkYxS3Vq?=
 =?utf-8?B?aTZwUHFNLzN4TnhuZFlxK2tIMGlhOGdNMys3dDFVSTRwN1RwV2R2Uys2YTMx?=
 =?utf-8?B?bkpheEJPVlFFNzNvdFdJRGFybCtjRUhrV0d5dWhSU2VacmZlVklyWGRlVjJr?=
 =?utf-8?B?aTJVeXZuTmpaeldOb2p6YjZtYnlENnp3R0tnbDFpOXhmWkQ4cVY2cGdweVhv?=
 =?utf-8?B?RFVhaUp0R1dpZk92VkNBbHVzR2dxdnJKRjVrMytiNHIxTW9HKy8wUGJaT3Fn?=
 =?utf-8?B?bjR6WG5qRmlPK3kyaFNEYXJUZnQ2SUFERVgvSkZLZDBlUE00VVR6cWFkRnFC?=
 =?utf-8?B?dEU2SFNUcHBhbncxeWF2RGNBTjIrWDd3clppM2g5MnN0MHVIcFZ3SGF0Ym13?=
 =?utf-8?B?NjgvaDZtc0R6Yk1EN21LeEo2aEc4c1BhUEh6SjMzZ2FYY3l2OFlzRmtmUjhT?=
 =?utf-8?B?ckh0R0dibk52ek5GNjVxeEdhaWZrQnp3OXgzOXIvSHlPSUFyQmo5eTJvWnQ4?=
 =?utf-8?B?d0pPZ0d1VmZqSGFTYkRuMnd2RU1MdUh0MlJVd0N3SmZmZ3lIeDdLTlVEWWor?=
 =?utf-8?B?amlTdDlRenBYQnJxWWJhTUwzMDBWNzFIbHVRVXVlNzJFeStKR01sWHM5aWx1?=
 =?utf-8?B?MFo1N0lmTDd1ZDRDbEF0QWNrK0wyNjExNE0xS1RDbjcxd1NEd056MHY2NkJZ?=
 =?utf-8?B?c2ZwWXhiZXk4dTdtaDFvWHM2R1gzWTBNeEhnK3AvYmZNcVhIcmRFcmxsSmZ3?=
 =?utf-8?B?Q01SN2lzK2U0NDhJZGo0QTlySjFUZCtFMDJneHJUQUswN01IRWxrMVNvcTdr?=
 =?utf-8?B?dVN2a2lxbFhXTjFwSm5wLy9vdTIxVmNoMHRDbHR4U2puYlN1VWYwOUhQVEN4?=
 =?utf-8?B?dllVRWV5RWtEdzJpZDYvNE9PbzRhaVRWVm9QR2FyQlNKUi9iWEZ5MGNTMTVB?=
 =?utf-8?B?U1BaeFFkUkhjbXRvZHhGUlZpTkpZMnBtTXROaVBHdGZ5R2E3U251SDNJRnlU?=
 =?utf-8?B?WG9oSjQ0WG5qRElCNXh3WXhUZTF0WGdtWndkeEdVS1RnQ0FSZU00UkN3R1JT?=
 =?utf-8?B?UXRaRlBsM25HTTd1L1doR055MDJucnVxRjZ4akt2UnZLSm5Ka1NTcmFWbE9i?=
 =?utf-8?B?bnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2f1d3f-d393-4caa-db66-08ddec62c9e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 09:58:39.4080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PjYi/vNOV1jhDq2jFDhoM11EkKyJ0kJtaer4fhAl87QTrEEDemV+Kz3WHdXJHOwqNm/tuvu8GifyzyuGpHXXajFkT0yiQ+umA2diuCaKEkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB15223

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDUgU2VwdGVtYmVy
IDIwMjUgMTA6NDANCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzJdIHBpbmN0cmw6IHJlbmVz
YXM6IHJ6ZzJsOiBGaXggT0VOIHJlc3VtZQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFN1biwg
MTcgQXVnIDIwMjUgYXQgMTY6MzAsIEJpanUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6
DQo+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+
ID4gVGhlIHdyaXRlIHRvIFBGQ19PRU4gcmVnaXN0ZXIgaXMgY29udHJvbGxlZCBieSB0aGUgd3Jp
dGUgcHJvdGVjdA0KPiA+IHJlZ2lzdGVyIChQV1BSKS4gQ3VycmVudGx5IE9FTiByZWdpc3RlciB3
cml0ZSBpbiByZXN1bWUoKSBpcyBkb25lDQo+ID4gd2l0aG91dCBlbmFibGluZyB0aGUgd3JpdGUg
YWNjZXNzIGluIFBXUFIgbGVhZGluZyB0byBpbmNvcnJlY3Qgb3BlcmF0aW9uLg0KPiA+DQo+ID4g
Rml4ZXM6IGNkMzk4MDViZTg1YiAoInBpbmN0cmw6IHJlbmVzYXM6IHJ6ZzJsOiBVbmlmeSBPRU4g
aGFuZGxpbmcNCj4gPiBhY3Jvc3MgUlove0cyTCxWMkgsVjJOfSIpDQo+ID4gU2lnbmVkLW9mZi1i
eTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZv
ciB5b3VyIHBhdGNoIQ0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+IGkuZS4gd2lsbCBxdWV1ZSBpbiByZW5lc2FzLXBpbmN0cmwg
Zm9yIHY2LjE4Lg0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJs
LXJ6ZzJsLmMNCj4gPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6ZzJs
LmMNCj4gDQo+ID4gQEAgLTMxNzQsNyArMzE3NiwxNSBAQCBzdGF0aWMgaW50IHJ6ZzJsX3BpbmN0
cmxfcmVzdW1lX25vaXJxKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiAgICAgICAgIH0NCj4gPg0K
PiA+ICAgICAgICAgd3JpdGViKGNhY2hlLT5xc3BpLCBwY3RybC0+YmFzZSArIFFTUEkpOw0KPiA+
ICsgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnBjdHJsLT5sb2NrLCBmbGFncyk7DQo+ID4gKyAg
ICAgICBpZiAocGN0cmwtPmRhdGEtPmh3Y2ZnLT5vZW5fcHdwcl9sb2NrKSB7DQo+ID4gKyAgICAg
ICAgICAgICAgIHB3cHIgPSByZWFkYihwY3RybC0+YmFzZSArIHJlZ3MtPnB3cHIpOw0KPiA+ICsg
ICAgICAgICAgICAgICB3cml0ZWIocHdwciB8IFBXUFJfUkVHV0VfQiwgcGN0cmwtPmJhc2UgKyBy
ZWdzLT5wd3ByKTsNCj4gPiArICAgICAgIH0NCj4gPiAgICAgICAgIHdyaXRlYihjYWNoZS0+b2Vu
LCBwY3RybC0+YmFzZSArDQo+ID4gcGN0cmwtPmRhdGEtPmh3Y2ZnLT5yZWdzLm9lbik7DQo+ID4g
KyAgICAgICBpZiAocGN0cmwtPmRhdGEtPmh3Y2ZnLT5vZW5fcHdwcl9sb2NrKQ0KPiA+ICsgICAg
ICAgICAgICAgICB3cml0ZWIocHdwciAmIH5QV1BSX1JFR1dFX0IsIHBjdHJsLT5iYXNlICsgcmVn
cy0+cHdwcik7DQo+ID4gKyAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZwY3RybC0+bG9j
aywgZmxhZ3MpOw0KPiA+ICAgICAgICAgZm9yICh1OCBpID0gMDsgaSA8IDI7IGkrKykgew0KPiA+
ICAgICAgICAgICAgICAgICBpZiAocmVncy0+c2RfY2gpDQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgd3JpdGViKGNhY2hlLT5zZF9jaFtpXSwgcGN0cmwtPmJhc2UgKw0KPiA+IFNEX0NIKHJl
Z3MtPnNkX2NoLCBpKSk7DQo+IA0KPiBXb3VsZCB5b3UgbWluZCBpZiBJIG1vdmVkIHRoZSBzcGlu
Xypsb2NrKiBjYWxscyBpbnNpZGUgdGhlIGlmLXN0YXRlbWVudHMgd2hpbGUgYXBwbHlpbmc/DQoN
Ckl0IGlzIG9rIGZvciBtZS4NCg0KVGhhbmtzLA0KQmlqdQ0K

