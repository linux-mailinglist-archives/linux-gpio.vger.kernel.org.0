Return-Path: <linux-gpio+bounces-24880-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3A3B33841
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 09:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D149D1897D35
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 07:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29062820CB;
	Mon, 25 Aug 2025 07:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1aoj1Rs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F016414F70;
	Mon, 25 Aug 2025 07:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756108369; cv=fail; b=I2HKfhR5PQOiNY3Or1ZnZLwdDaMjwNsS1YP6zqIsTUtFHvWZpkYM7/yxcNyFBuxM033T3Tydl06M69RtC56jEG8/dS2QYUr/Etnpoz7OtiY0FTxtlESD5gB18w4xyJM9IzBqtxFalndyb3eORl8YRzw/GY3BySe2kOGYyQsuI0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756108369; c=relaxed/simple;
	bh=L+AAktqXHMLgMFhneO1JZlYHi5cqj06LjAaSbQ5q3eM=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t3Krh/xYgBWIBbEoR17uwq//nvQjxKG0R535zhj8NpIBpvub+kr3ZL05dPteoLA6KsRcMV076jqN0lkZBqMnrC47weW5VgKQl9jqE4kntZnRjqNY5RqlvA8i3ljRlR/2PmHZwEQmP6RI243LbtrVmWTDWoGK5muiGtgenVv5hRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1aoj1Rs; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756108368; x=1787644368;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=L+AAktqXHMLgMFhneO1JZlYHi5cqj06LjAaSbQ5q3eM=;
  b=b1aoj1RsiamAE/oczRTlDEqQ3Il6d4/8AtxWOO/+0t94zRE6bLsGLgM+
   Y8wDOSI/6+Qkg5ZIGCW3q1VWkUm25Psz4NzFNvzCtsZxa9TkSCtboOhFl
   QbuujC/GbSQLsSsnBjaCR64qnjgjYLvgb0j+c+NaWsOY0stlUOhHUcPXj
   OglOYVuYD1sN6/fsqyYAwp4fmJWG1auZDwm2OJZj3WBJLC2RM3US6xqfx
   aTjDOVIcc7y1O1QwsdEzMGpGG+vrcpuIPH+2tMEnMuILf8KF3dmIucacR
   Q1q11zpMEO9JSB67TD+9HPXfKFPGCpiDrpnWoTvBsDbnCswgzpkuX4ozo
   Q==;
X-CSE-ConnectionGUID: 2E0GWO4sQgm/fAEMk2HvEg==
X-CSE-MsgGUID: WHS+Isp/QYCZdqqQ7oMl6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="61956836"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61956836"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 00:52:47 -0700
X-CSE-ConnectionGUID: PAgMBiTxTEWACRr7a2GDbg==
X-CSE-MsgGUID: t6Dqxyf0QUmBw1JbNPUpsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168729789"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 00:52:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 00:52:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 00:52:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.52)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 00:52:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WS/7Dp4E45X53EBle5examQnQT3yaVL+sIjTO4Tj7SajztY+ecwgD6m5+Bo7ZgJARCU4a+9TkffAdRXer7Az89xbDv3s5Jmkx/t9LrEehSiA/y/vwfVX5t7Vrkeo+lZUNboD5UrGLO+j2FdVK14xZZsUAB0GL7yDlDgswuOIA4BOBnDd8ZltvBo2cGvCHHvw2Fc/IEclVl6DKohIWSRcLMXlGM3iKx5hUmBTUoNAOApFa8R2S0EtdN93d64UsN1EPRwjxpRBcvOgGgMJATM8Nlav1q+inH09maEL8rNLkANp+UM7YB+g2iL9Kwu4EbdhVhZm2NsBYy7rWmJLYqPPcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+AAktqXHMLgMFhneO1JZlYHi5cqj06LjAaSbQ5q3eM=;
 b=Aoa05IamdLGpvC7iAUdPxCPE/KL8zHhKXrsK4erRHfoRAxDjzS/6+BG+99Vb/4G0QOOD8gZVdY586ftNvvGNfoyOMjrJ0ssUnLjju9OfE/SAakzi6eVzyPwOdlw0rf2p0zm6Q/g5abAtd94b/bKqJGLp8C+PHTBS7j1w88qVOh5mE9jBmOKEXHPiNDtkpZV1WacILGVXHj03BdBfsv/VXfOUiMwCKpzCQeB/kREdaJOhauMJoxVLKFBUu6E4G6YeX/WTA9jvQUcyjwTLf1erwc/K7+Oa5Xj8q5m9rL1xgLjPZbrsyhg08DXUJce3hb+KRuAO6OuTNRVmg5QGbtNY2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6275.namprd11.prod.outlook.com (2603:10b6:a03:456::14)
 by CH0PR11MB5250.namprd11.prod.outlook.com (2603:10b6:610:e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.18; Mon, 25 Aug
 2025 07:52:44 +0000
Received: from SJ1PR11MB6275.namprd11.prod.outlook.com
 ([fe80::ca54:f21d:695:9e42]) by SJ1PR11MB6275.namprd11.prod.outlook.com
 ([fe80::ca54:f21d:695:9e42%4]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 07:52:44 +0000
From: "Tham, Mun Yew" <mun.yew.tham@intel.com>
To: "adrianhoyin.ng@altera.com" <adrianhoyin.ng@altera.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, "brgl@bgdev.pl"
	<brgl@bgdev.pl>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH] MAINTAINERS: Change Altera-PIO driver maintainer
Thread-Topic: [PATCH] MAINTAINERS: Change Altera-PIO driver maintainer
Thread-Index: AQHcFZCAPd9C1hjaP06YRTaiwV+nnrRy/jIQ
Date: Mon, 25 Aug 2025 07:52:44 +0000
Message-ID: <SJ1PR11MB62756F8787F6EA4E22516216C23EA@SJ1PR11MB6275.namprd11.prod.outlook.com>
References: <20250825071637.40441-1-adrianhoyin.ng@altera.com>
In-Reply-To: <20250825071637.40441-1-adrianhoyin.ng@altera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6275:EE_|CH0PR11MB5250:EE_
x-ms-office365-filtering-correlation-id: be1df6b2-7005-4378-d033-08dde3ac600d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?l7s4uLGf5bXvbS+piHna93yKsOWMzGlEhU73OsJ6tBAapA+BRabNwVMlj3ma?=
 =?us-ascii?Q?H2gf+DSeL9/WpKGv2jHj49zwt2AJXwTkeOj3niqQ4FVTnFGmuWiVHGVdIJch?=
 =?us-ascii?Q?2CEdu4z8NZKfPz06ViJ6lxt4PVoZ09RycNvILKzFgQkcwx8rJ+d0GwRyE2tJ?=
 =?us-ascii?Q?4EmFi6DkBLRsn6gTSEnt5s1ia8dJHCS7Bi94E08NbgjTTj/1otQgzvnmw+u8?=
 =?us-ascii?Q?H6ZHGM1BHD13Bi7L6AvTZEffiCYtnoGcO/+K9SS2p8FJjCZLIqeB6psyhyr8?=
 =?us-ascii?Q?C7iSehzOPa2ETBq23rmoJ8oj3sUh3NiWwDhFqus50UyJOPv4I+IBLKQvtkX3?=
 =?us-ascii?Q?cvEA7xZvHBOrWT15/Ob0YgYNUE/dtUn2TsbKCGEbluC8BuUHcnFqLeTS6k83?=
 =?us-ascii?Q?QnOVeS6WVb/eUxxAdJ2A8U6L0OjZmn/2theu5/42K9S8KoRkJ2bn5zI/KUEu?=
 =?us-ascii?Q?LjYBwEqzCOxZlfAPrjMR0PUBWXssrZJe76bm/ajpPxuQ0PFL1hLEXUJIt6rp?=
 =?us-ascii?Q?8p5fXQ3YVaIqoTddWFGOK01ByXz6FBAqGwH+9U0vhfxnhjch8j2c+JEOmUlQ?=
 =?us-ascii?Q?ytFeAasx47jgcX9i76bq3xlYZsi6TdSuMj3Q1iMLqdtk8D+O8Nu/Zxc6ufWb?=
 =?us-ascii?Q?8oA7h8nv8Fu4OoN2mWmVKS67FdDVatnizie2NOFtj1+832NRWwJwZSPoPwZO?=
 =?us-ascii?Q?YjoAmzEskc6EG0PEF9V2tS4ySgCXb7uEOzAOMAi7LC2s8EgvCvazluHzQ36d?=
 =?us-ascii?Q?jDDjh9AFZ+1/v9mQUfqAnj4NWf8AjG5jgi2N9LuoF5TKk1l5N/EtW1CZB05e?=
 =?us-ascii?Q?BSSjD5No/cpyYVAZclHJl9PD4UYRCCKU3mWCkvY8IPQRAnnYhEdlljT7xuU6?=
 =?us-ascii?Q?u7SeTnw8P8P6tnu+ilAzerQpuLh4z2TqdnsexBiV8XYy3ims4D5b3enSosd+?=
 =?us-ascii?Q?7NzbBYM0j8L8jfopmJxkEtvugR9cTmrRvExolK5URRm6CK3umV+1X04+hfUt?=
 =?us-ascii?Q?aim3MhfoGBeZXuEVViPZSWdbWZcGVGS8sD9NTorfGr5WxyCjYP67+JsgKW/I?=
 =?us-ascii?Q?8u2demKlqJ/TXIqXOEEWP19i1AhT1DiwVet6UHzcqBDxhLQpf59oazSNlvaL?=
 =?us-ascii?Q?xAub0H3pTFU1A78E/Wz+gsq7NNea9QKpmi9cbQkorO6R5K2fR7zNcWzlY67f?=
 =?us-ascii?Q?jXhttWNY8GJbCWcx/JtaY7tuzOUPnspWwzm4wRMNbJmKg7I2/Me4UI2QoA/L?=
 =?us-ascii?Q?vIJIgidbjaTuG3uQ6QaVrLox7uia8/bWbngdzkRdepyX82EjdcRqIPgAKrfn?=
 =?us-ascii?Q?69XHGSm8cmlHzOWVydkCZTfpI6XgKOwJ6Zoll0kbKBS9xrNCeIlwG7zcd1ph?=
 =?us-ascii?Q?jFeOjZAVduu5ZLmAZInH3wJJkNlBaFiL82E8tllycvgHKC2Gp6Q9wjzPDe2L?=
 =?us-ascii?Q?ZOeMGHgWTXUYsuEqbb0oWywdi2OJUFlqKgWYdCSMHMoZABjvv7b7Gw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6275.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wCj/5KHFWAUXKRm13jTDi3orKUY7WKYNltQDxJoqJehDtjeOX6T9t7WLeXYi?=
 =?us-ascii?Q?jw5iBWslPW9iA0gl7kuUlPghPNApuQdm+arCBAkvw6bGNxhHaIrDPhFM6UEV?=
 =?us-ascii?Q?PbMEvTiYkpMwlsoqqnYzxCN3d4Um3nbViRgnnw1dusXmMK02zSfsz9IgFD3i?=
 =?us-ascii?Q?gEZfYkR5RrdPw8mqQmxm6kf3Smz7RbDUbQEZDx7c0rpsZhZRfwiTj0kg7Am0?=
 =?us-ascii?Q?ir/rF8oH6ev0ihuyHleuevo+5m89+/GrJyNJ1ihhKrcS92XZVGJBpKDsNpD0?=
 =?us-ascii?Q?EtJmDiZ+KylUOHR8MCXj0YJ3W6x+UWB2A1MFFTmIPjQK0ZcQ/c+W3+Gxh46n?=
 =?us-ascii?Q?JW5s2Oa+++gfrc150MTaLpPZg3XWvyjBnqFaCZh34Y7EMa/mDTxtGnJPWccB?=
 =?us-ascii?Q?zibR+hCmg0TmZZ7NRUHwLG4flCqUfNt/FRp07gOvoMiDyT44EWvk73HdTtLI?=
 =?us-ascii?Q?moEij18Nold6evRlMwpBs1E/JIIEvtqLQA8oLq5t3eGwYoNZG6vRlE5HQ8aJ?=
 =?us-ascii?Q?yV0ETRXoaOILPO0PKcq9mtLd7WsUormubMBbOV4se+L0/pSyRY1gccAPrxqF?=
 =?us-ascii?Q?3xeEPEdhWurX5y0vOr/fClbU0EVTXf5dWTUuLTxiHBHRhXRz5fF0fj/oV+HB?=
 =?us-ascii?Q?457i1o/ob98uKEpBoOUBAlLzvR1q0OBmXBD6Zy6G5W7a1rB6Gw1xfkdacVGK?=
 =?us-ascii?Q?0Gr2793HVZwJ8ck0kOzAnq8kxmpkMWu0alBXY4+cVTFlKEwVeNX4i7BMxxNk?=
 =?us-ascii?Q?hjsMhh0mmmdCG62wsZTj2lXAgfKuri5GioNnVgV7js3a73gxGjF9925kww6a?=
 =?us-ascii?Q?/kdhFi+q8YwyrxVVf9cLGLuSgmKNldLV21g7KtpV3vSNqNsK7xxbLm7ZI15U?=
 =?us-ascii?Q?stbaUh2u/oJ7Z6mHHbj697NS4jVyrimQU/4UbvrPoVF8DVSs83Xcbeyy6Cps?=
 =?us-ascii?Q?GM/j4lbRED0Uxe8n1vgDhWEf5IJnv2hjrooAIXMMUe9SnBGYfkGX/cZjdOzA?=
 =?us-ascii?Q?0QHlkQgLKIi23gRNTyh0LpHSHzUcHC1IuvAtTDmiUuwl4Jrso2vZ1FFt/XeU?=
 =?us-ascii?Q?zDDpYYTK2Ng/0wm9w81RfmIG+YSj1MLp7wKdyBlJfG37lzO+rkpvW6l04KmD?=
 =?us-ascii?Q?alNXUvaqWY2GFpjxK9LzFgDRbpovhF4VeADbPiJaDLBzEGL6ERh+3sFz+JCT?=
 =?us-ascii?Q?5r06UdUjG9fbJ46zMCyWjfGNnxx0PDIr4V0HOtijxMtHbh3tOz9QIdfFB4Oj?=
 =?us-ascii?Q?PWGSh1PTQrn3jUN4LTIbvZSfxeRxRjd0Syh59kFEDkkWGAEPr6NoKLwg1SP0?=
 =?us-ascii?Q?SLDjtB8tS+m9HWyYshkJzStky+0HHedMd24UED3aQwNP1e5HErZE09N99VDz?=
 =?us-ascii?Q?OYAYtKRRsQfNP7B/70Qx1GNZIpuZpEJaYw5tsMI1AlUTZcyWP4hTIW9utToE?=
 =?us-ascii?Q?eauR5FOGLOF3vb14o95m/QJnOAK+2jxv5HNWdPpZbtdBs5RN4eyD3DxNVpuv?=
 =?us-ascii?Q?jYo7xX3t3U4AbTOpxiPfsOJu+FOclI2AAKqYwdQMSVR6M0+Pss7GYs4BNV/x?=
 =?us-ascii?Q?5r0y09i5sBBPNDdHoORmcSQM1IgabOuvC6GOeESw9h7niV1FmrBD4Do8ON1z?=
 =?us-ascii?Q?07ns13Y+W5b8KoRZYa6poMN/+2D7LbKnH16hESWRWTLC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6275.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be1df6b2-7005-4378-d033-08dde3ac600d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 07:52:44.1731
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UoCvT0/nk3G1hOUfFz6CwQRVFrkpgnKUsUV/mFgwvHw32usa6Geam0iv3kLUTkUrcg4feTagwiLjHtsvnrxBxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5250
X-OriginatorOrg: intel.com



> Subject: [PATCH] MAINTAINERS: Change Altera-PIO driver maintainer
>=20
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>=20
> Update Altera-PIO Driver maintainer from <mun.yew.tham@intel.com> to
> <adrianhoyin.ng@altera.com> as Mun Yew is no longer with Altera.

Acked-by: Mun Yew Tham <mun.yew.tham@intel.com>=20


