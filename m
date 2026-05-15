Return-Path: <linux-gpio+bounces-36957-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBMMH2l7B2rG5AIAu9opvQ
	(envelope-from <linux-gpio+bounces-36957-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 22:00:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 28947557343
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 22:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F050301DEE0
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 20:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE5238C401;
	Fri, 15 May 2026 20:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="d6FW8+k3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012056.outbound.protection.outlook.com [52.101.48.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CC338D3E0;
	Fri, 15 May 2026 20:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778875234; cv=fail; b=TxOK0r0ntqH0vGzkWtpLOVOKMAAvZlB40PBFEL3LLcePmf3BxhxFTZcF7FlHRnfvBJ74MqCTXRSHTCHEEhJNdTZV/ekrlFt0jHBnWRS3fC8Q7n1uGE/buPhQyH3Qz10H9paCSgSp7Tlm+AQQSty62g68FrgQSgORTJ8GSYMYIF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778875234; c=relaxed/simple;
	bh=RdjIOPEDMdlMiJ3UHhgF4eoWfRtGYvD4BL2ZS4VUnFw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=knl0NL5y4wxPwXkTVDBONPRIy2X4dYljuKRwSKsR6XnLm6TVjzMCFVCrFIhm2S2BtIkfFVrSn2AjdYnI2cTrEp1etQlfqeS1UPpSR2ofUFWXgCtW/UZQ2CwAA00FDWttgxnVVLno9aKaz+JSIv2c/UTIQjc5dpwOV6a7OY+O/ZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=d6FW8+k3; arc=fail smtp.client-ip=52.101.48.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQYusDOVWphchA7z6W3QNLHTfxHWu0WdOEai7KV7WLsLL9TrR0lpnorgKVb7r7F/tMiSopasd4Cskh5UfilnyxtXzXS94azWuvzBOyzbB3ewFo40WsHHqcW8lSkA+CKfeI1JtYuX/A0awM/VH94AScIV+QWBBrMDQTcJghac5Nfsub09f/nmbYEp/67D170ckbMpoHVeO/tiCz0bwQORpo/2fEVP8a3P4z5R3OvmMKrEXAsLlys12Z2auz5e0S+G3vS99eGKX77722/jqQDq5klY1S68gzuk9qh/0VXJ4FDydwbOAskNwMNeADcz+H4coxrsfsWyvOeMvRePUw883A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdjIOPEDMdlMiJ3UHhgF4eoWfRtGYvD4BL2ZS4VUnFw=;
 b=irOq1nZOXtRXbWx480j83HnHlFyVlrRbglU1guyaI8dxkCz3yl6/FC225miOlhWQ27nB3EPi5u3GpQYnFYSm18J2lzmdlT4xOVqNnynHz8DM3cM2wDclmgKyjqJBrOivcAXr5uqtQrjcA8Jxoa8/x/WyLqaj98L+PBRAB6tWWGEBYd/bxQ/TUf5WylrM6qdrhIa4x3VFJ/X2DJ+yi9wEPSnBWXFTPUS3glXm+Y+ZkmFEH7DsncBOE7IsC1p+FddLrpBhV+XXeiZPaJsWVlhAq2aJlnIstZrCOlbvdSdKwI3wqkT+eMzLK3hHHT8F8j2dMQb5Kui9m/KjTEwC/C7jqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdjIOPEDMdlMiJ3UHhgF4eoWfRtGYvD4BL2ZS4VUnFw=;
 b=d6FW8+k3Ev2htLVbeb8tWyoFeF4eGHPRpzhI/+JlDWQEeUAWYQZYo7nf2P2wdPIznNUAQe9lwonyINkKo+p8ieN39HwzgESYFWMDczzbL1/v4YaeIXNK6UvgmOYaAXP1UEsJ5Ti2yDUS62Sm7cFDDGHduXxcy6g63j9ph6hdEDI=
Received: from DSVPR12MB999123.namprd12.prod.outlook.com (2603:10b6:8:388::13)
 by MN0PR12MB6080.namprd12.prod.outlook.com (2603:10b6:208:3c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 20:00:25 +0000
Received: from DSVPR12MB999123.namprd12.prod.outlook.com
 ([fe80::17c8:33d6:3366:3fbf]) by DSVPR12MB999123.namprd12.prod.outlook.com
 ([fe80::17c8:33d6:3366:3fbf%3]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 20:00:25 +0000
From: "Dayananda, Vivekananda" <vivekananda.dayananda@amd.com>
To: "dumitru.ceclan@analog.com" <dumitru.ceclan@analog.com>, Tomi Valkeinen
	<tomi.valkeinen+renesas@ideasonboard.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Julien Massot
	<julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
	=?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund@ragnatech.se>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Cosmin Tanislav
	<cosmin.tanislav@analog.com>
CC: "mitrutzceclan@gmail.com" <mitrutzceclan@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	=?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>,
	"martin.hecht@avnet.eu" <martin.hecht@avnet.eu>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, Cosmin Tanislav <demonsingur@gmail.com>,
	"Dayananda, Vivekananda" <vivekananda.dayananda@amd.com>, Cory Keitz
	<ckeitz@amazon.com>
Subject: RE: [PATCH v11 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Thread-Topic: [PATCH v11 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Thread-Index: AQHc4UGLHAZ9OQXPpkeA8QZWtUoWPbYPiGPQ
Date: Fri, 15 May 2026 20:00:20 +0000
Message-ID:
 <DSVPR12MB999123956F5F35F8F9DF9DF947E8042@DSVPR12MB999123.namprd12.prod.outlook.com>
References: <20260511-gmsl2-3_serdes-v11-0-fc163073c16b@analog.com>
In-Reply-To: <20260511-gmsl2-3_serdes-v11-0-fc163073c16b@analog.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_ActionId=fe86f088-d5d6-4da3-82dc-df7c78dad93d;MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_ContentBits=0;MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_Enabled=true;MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_Method=Privileged;MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_Name=Non-Business
 v26;MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_SetDate=2026-05-15T19:56:40Z;MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DSVPR12MB999123:EE_|MN0PR12MB6080:EE_
x-ms-office365-filtering-correlation-id: c4b91ba8-ab25-4213-c4da-08deb2bc9ac4
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|1800799024|376014|56012099003|18002099003|22082099003|921020|38070700021|11063799003;
x-microsoft-antispam-message-info:
 BCQRAvVtSblmJfwmGXN6jzYteBG6Fx/o2qCqmozrHUuWqUppGnj7SMGwBIzYjq5z25N9mA/ryaB+xoVeKoZFliVV85fINQJne3VV/jjDiBEgDBptlEo9P1ICcRMYU8E5U5axOi/0CP9m3RWlwQVWiKMpMUKxGhs4IECpm1V6wAnlzJqXN7jbliiQQDdxxFGVT5BCqk8e3k4SJai/AbzXBgjPeT3/Jz93GAcFpI8W/ErEqtmrPyQiiGrNeXeY2cAa45jORDhm0TlLZtxBSutBVW+CVt5GHaJwdRFDzSwQpXW8KU89zX16qF44YI/Kc2oTRCCBZ9gEYXPYXEWdS+AUfUOOTt/gZ+JbiD+LO/DsgGjeFkuKWjOPEZZJITYHu8Del+bir/lgNANCcROxlKApQvh7ZNw2xFnTgke1rqiTfcctABOBzdNKi3iXLTIk6roER1rZnxm1kBsPe4jesOhTft8wy3vdcgzOExZJIK43m/dRDNlyaSRhJG6kFhukrDXuZECjA8S3N0BiQ0YI/DeGLGkR8/vPcFjMR4IWBjCbHmpFW9BXLHGvkyy/rwfRGfWTBtyWVFSyYTFTBTBsVdVjXIGt+EmlsPT6raHdhNAlndJpcmtFXbJlIetCsDvJdXTeSFfohJENdJ9kPxJpM2i/U/EEI4FBB1cEb3WiQlaQO/Gi77MLOoVzkuOdJLzrZxelAmArwHw8smvlmKnT9VGj8TtFBM1nJQyc71wO2KLLpYeS6BW7RtOYvpsGBsg0sWeTPPNjdElz1HT23zubtY1oWg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR12MB999123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(921020)(38070700021)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z3cvYWhOM2VsRHFjU2NiSkRrVWl1Q29uWGJqc3g0ZGpJWWt5NXJXTFp5NG1i?=
 =?utf-8?B?ZVN4SjRiUGRqSHBLMWxJTE9LQVRiaStJUGRTaDRyVWllSGcyZzIvaUdyd0Vu?=
 =?utf-8?B?RmxKM0hHRXg5dnVDMlhvcTNrak1KZVJ4TFJGZ29iS2NRazRZV09LYzJhWU9m?=
 =?utf-8?B?c3lvMFI5UzY3SnNkL2lya2p3V3hWZjlvUkJ1USs1Vk12cG1kajFNakU1ZE92?=
 =?utf-8?B?eS9XbDZLZis2ZHFSdWhUOWwvT244TkdXNFNjK1YwTkFHejhpNk93Z0ljaXV0?=
 =?utf-8?B?d2tNVktNY3JqZmdrKzJ0T0swSFJ2QzRFbWV1SjMxOG5RVTRqM2JFcDRySG1l?=
 =?utf-8?B?OTB1SHdxK2JHVnpBQmgwTmpiZWJXVjNYYTBSQzI5T0JwNzBZVnhGSmhuMlp0?=
 =?utf-8?B?NDBzSzVBUWNRek9mL0hiRHlZVm9iYktQWEJBMzNhelB3MTh0K1NXVDhRMktl?=
 =?utf-8?B?SWxlMFJNY3p3NVh2L2l4b2ROTklOeG11TVZDVEJ0N2Qrdzcwcmp1L3JKQ0JX?=
 =?utf-8?B?M2E1VUJzWlNsNDRua0RXTW82OHRNQVBkei9od1EzTEg5WWk0cUVydmlXc05L?=
 =?utf-8?B?YnhpKy9hSnRqOUZKYWlWYzlRUEt3NVgvNGFSL0J1RWZPbkgxTUpOaHpaU3FW?=
 =?utf-8?B?WmM2MnFOeFZrOU5IMlRQSzlFVVV5YkxvcHdrNWZSaVFQMk9CdFhMME0vTTZw?=
 =?utf-8?B?RzN1bGF0UC9tUFdxZEE3aHVPa05tTU04TFB1a0g3MmJyVTJmbGVIZUpOaVJI?=
 =?utf-8?B?RktoVW8zRm80aVJ0bmIybUpKTkFSTjExak5OajFseW4xUWsrSUx6T0lVRXhz?=
 =?utf-8?B?aUJPaU1xU1NkamYyMGhwcmg5UWkvZ3RBSlFiNmtyREhMdTZLV1I3aHZsaTFH?=
 =?utf-8?B?QnZ4NFdJdGlNK3dUbi9ic1B6S2VNbzZjaVBySGVIbFNQYTJmNnFjMGZsV0s1?=
 =?utf-8?B?SGp1UDdRQ1hHYTJITzhLTkpacmQzVEsyS0pvRzZTc1FtRHpJMVdGeXcxZnQ3?=
 =?utf-8?B?SHZoYVlmc3NrZzlYNDhyR2IyK2FVSzU5RWwrcCtLQU4wR0g0NVVqMnpLWjU5?=
 =?utf-8?B?bmxGQlRoWVlqUE0rSmVnU3laZGxaVGFtMXgxSTM0TnRvQ1V1ZmI3KzRqRXJ3?=
 =?utf-8?B?ZTdhTGNUWGp6eEVlQUhFTzhKQ3ZMemlTamtwczZsTWgxWmpzVXdlbzRmMWVQ?=
 =?utf-8?B?LzF5QThGaDNtcE5Ga0RFVlVHckgvSkFzWndkREJXM1ZnamE3S1YybU9QSnFU?=
 =?utf-8?B?K1dBSDFjTXErcTJpa0JCOGI3enJhOXMzcXUvdHJMRFlMQ2Zqb1N5d3l6UVZD?=
 =?utf-8?B?Q0tjcXplbWRQa25HMjRIYjRxTGRMcFZDdENQclFQSVplZlg3V2hIR2lqSmZC?=
 =?utf-8?B?aWRzRnI2eGVxbjF1RE4vb1Rpc3NtMFVSMjNWZmg3YjhIbjI1U0kweHd5QzF0?=
 =?utf-8?B?MFB3c1RTcWorR1ZWVTVDOEREeXZKTG9mQmRkNHpLdjlrMEdxcFdyWjRSQTZs?=
 =?utf-8?B?cjRYTXFsSjM1VjlFcGpsd0F6U1ZYYS9qSnovQ01hVndDaC8wek9KSmEwdXA1?=
 =?utf-8?B?OFMxZ0s3cSszcCtPWXMyZ3l2VXZHQ09IbHlIRUQxSzVQRlIyUnFLanZFS04x?=
 =?utf-8?B?MGJKRWsvTnMva2dsRm9rRERyU1k4eGFhVWZkNU5haHh0ZGhqK0RMYTliZXhR?=
 =?utf-8?B?TU00eUczKytUeEFKN1kzemRIT25SNjdrdGN3TElpeG8vRE5KdXFacENhS0Z3?=
 =?utf-8?B?ZHRTcThBRWVzMzVjK3NBZ2JaR0JvS09IZHhwM0pnajgxSHhrdmdnMS85UzNI?=
 =?utf-8?B?cmFMMWFZUnl6bmVCandSZWJQdWNLNmR2OWhOWStHMG5aVUk4akFwZm4xaTk3?=
 =?utf-8?B?aHRQdmYwdXNUZWlYTW5VUklHN2FDenJLb3grcE1Da3BCNXJWTnQxcGdQUHVK?=
 =?utf-8?B?ZG9Ybi91MFBCNUpHdDBNYnNGQXFWeXREcW8yS2RhNU1yUDExYWU3Tmk4dlpP?=
 =?utf-8?B?OEZzd3Zxa25UcFBVdEZiclJlRzd1RStoWjdSVjgxeXY3YlNNVDhHeit6bFVo?=
 =?utf-8?B?WU4yaEFIV2JFN2ZKekxUcUFYRmxiN0N5Z0l4NFdyVStMU3JqK054WDk2MkZZ?=
 =?utf-8?B?R21TTUEzVnA0eG4xdmFaSExpQUF0bHNic2RRRzJ4R2hFd2hwdklYamxza080?=
 =?utf-8?B?RDFLZGVSRnd3RlFOa2pOa082K3dBcmdwRXhVOVo2cHRCUEwwaHRlNzM2Wm1Z?=
 =?utf-8?B?VWlURlk4Q1IxMDhLVGNubGdPbE1JYWZJRWdxNUt1TE1SVjVUbG5wQWp3L005?=
 =?utf-8?Q?X5x7igd+POMEPBxNay?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DSVPR12MB999123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b91ba8-ab25-4213-c4da-08deb2bc9ac4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 20:00:25.2816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nSoQXSA/CakH4+tnJIdjnyqzAijXEF9VwZqtzdQegTDeuZgieiyGQiHoO/D8GaEI7LbNM6wpCN9551LRWIpAkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6080
X-Rspamd-Queue-Id: 28947557343
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36957-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev,ragnatech.se,avnet.eu,ideasonboard.com,amd.com,amazon.com];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivekananda.dayananda@amd.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	NEURAL_HAM(-0.00)[-0.985];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

SGkgRHVtaXRydSwNCg0KVGhhbmsgeW91IGZvciB0aGlzIHBhdGNoIHNlcmllcyBhbmQgZm9yIGZp
eGluZyB0aGUgY29udHJvbC1jaGFubmVsIHBvcnQgYnVnLg0KSSBoYXZlIHN1Y2Nlc3NmdWxseSB2
YWxpZGF0ZWQgdGhpcyBzZXJpZXMgb24gb3VyIHRlc3QgYmVuY2ggdXNpbmcgYW4gSU1YMjE5IHNl
bnNvci4gVGhlIGRyaXZlcnMgbG9hZCBjb3JyZWN0bHkgYW5kIHZpZGVvIHN0cmVhbWluZyB3b3Jr
cyBhcyBleHBlY3RlZC4NCg0KUmVnYXJkcywNClZpdmVrDQo=

