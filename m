Return-Path: <linux-gpio+bounces-19700-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F67AACD54
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 20:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21D38466B65
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 18:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0E8286438;
	Tue,  6 May 2025 18:34:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from WA1P291CU003.outbound.protection.outlook.com (mail-polandcentralazon11021134.outbound.protection.outlook.com [40.107.154.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE3428640C;
	Tue,  6 May 2025 18:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.154.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746556444; cv=fail; b=MajcJEyV4MmWPXwFAzR82cUrCMWaCLW9mMW+q+atlH8x+SWZe7/tdfidfIyMCa8uzmkt0j/rri70MR02mbpu0A+NVyo9CyvfUmwAE4otAXrO0YWRGeQ8GVZJ4fwhHiM0Belp5KAnX+kNEq2BWqtcdagVkiDFC1bfwMB7fcMu0us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746556444; c=relaxed/simple;
	bh=BmmtVY2Xt6lk6FQlMlbttpiWVWaqzqQeiUanoEWgNro=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JStn/6AE3WKVZbnXR5Yc2NEsHKY6lQd4f66xkWNkEi0LduI25Kmg6mlFq1Y9nnI8y9cD9aehsRDp28Sv69NUrq3KXdr+rU4TeelfA37GxlduPGKs9qsvZgS7swUezxTPDowUREdhw8jqoYL+qj79bhHjBzYPjlk6OMQwcOj0xZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=videtronic.com; spf=pass smtp.mailfrom=videtronic.com; arc=fail smtp.client-ip=40.107.154.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=videtronic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=videtronic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Knndpe4RV+yEYgpcXDw/Uzs3R6QoUscp7fWBJr3+aezL3ICkJ3zyLJNL0bxlkFnT1YBHKqX3Nuwv0n87SI8L7Dau5QBp65EsXqdyy7hwJRcC2+xqB7utQDXoYzVm/LPzDFjYWo6OT26qaWM+b87yMobaxWtGu+dnfDWFfCND1lMJX5DvYcHwR/MJPNLu8nGYc+Iucz4bnhOmh/wAa+CRdAWoPJAhnpCH0JyHZzzb0FQ4Uhf3Yx5WWKE3iBMdE0IPwRyexH4K6CW+wqdFDgA0NM/frf+aTSIIOieT0f+aTq3rgz9E4i2yPmxAaHbbG5Tl58sx9MW3ShOaHuBd5afs1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAv4CSxjHaXccTwHjb//9oyuxW8YW5Xr4ZxMtpmb/kA=;
 b=VHtGmOVkn/DlJQAd4+9xfa9f4c+/ZglilijQJklgGRwUHCVkDpZk+odyDdOD6EJV2FBgNI4GmeQDQsPQmptmrbrCfxWIi38xiIaZzDI43pV7sdHUTWN8N6v3utXHgcVvlYApDuhYVnoLIEwQJhMJaVaDNQ3odvDsPBcrJcOABPvKmIhjMrjL3WxFYnLCpIWo8ql/u4Tktq/WcUAlhHQsmnVChz8dRTK1PV9OeMAD/NpQukA73UNkLoeIkGK6vo8FyB6DtyWm7B/OxJLat6UsWd26cJJoL0HPCZXS/FgaTC4mOjJGryPdDIHD0lSd4uNI1UryB7hTTGr2G9t3UPfq+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=videtronic.com; dmarc=pass action=none
 header.from=videtronic.com; dkim=pass header.d=videtronic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=videtronic.com;
Received: from WA2P291MB0309.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:24::14)
 by WA1P291MB0278.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:14::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Tue, 6 May
 2025 18:33:56 +0000
Received: from WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 ([fe80::5b7e:db51:5934:a36f]) by WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 ([fe80::5b7e:db51:5934:a36f%3]) with mapi id 15.20.8678.028; Tue, 6 May 2025
 18:33:55 +0000
Message-ID: <b214bf8d-33d0-4da8-bf16-cc62bd1fbd55@videtronic.com>
Date: Tue, 6 May 2025 20:33:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/16] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund@ragnatech.se>, Julien Massot
 <julien.massot@collabora.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Taniya Das <quic_tdas@quicinc.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Eric Biggers <ebiggers@google.com>,
 Javier Carrasco <javier.carrasco@wolfvision.net>,
 Ross Burton <ross.burton@arm.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Zhi Mao <zhi.mao@mediatek.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Ihor Matushchak <ihor.matushchak@foobox.net>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-13-demonsingur@gmail.com>
Content-Language: en-US
From: Jakub Kostiw <jakub.kostiw@videtronic.com>
In-Reply-To: <20250309084814.3114794-13-demonsingur@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::26) To WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:24::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA2P291MB0309:EE_|WA1P291MB0278:EE_
X-MS-Office365-Filtering-Correlation-Id: b5f74079-f67a-45f6-1f97-08dd8ccc8ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blZkWUtlcndiUVRRU0xuSC9nUy9JUHRaSDBPRENzWFFTL0srUStCRGJLSXp1?=
 =?utf-8?B?dmF3QVN4ZlF4b0Qvek5UQlpwWi9IZVMzb0lHYy9kQkJ3QUoxTGJlWGxjQWFv?=
 =?utf-8?B?NUJsNDZudEYrcWdxUlA0R0pTRDJtekMwOTJBRWlvcndFZDd3aUJ4bFBWVVRJ?=
 =?utf-8?B?c0prYzlodGhaejdXSkFuMTFJQzd0b0NJZzdhMDhTMndKYTJvS1U2WVBleG1w?=
 =?utf-8?B?S0JxNS9CRE8ycWd0dWNjY2IvanRHVXNpaXhKcmw4cWxleTFBZ3dKMDRhSStp?=
 =?utf-8?B?d0ZaWDRmYmdveGNaYzRwOW1Rd21PRGR2dTllb1FhWGpRWURRSENZVy96NmUr?=
 =?utf-8?B?eDB4WFI3MHFkbVVFWHQ3Qy9yK3pqL3J6N1R2VC8xd2pLU2lQb3FQQ0ltLzll?=
 =?utf-8?B?Z3VUVmRjMmhzZ0tsbk9oM21tNExnbVVublhYcDZjSWFLVkpyQnFJOVdqYVVh?=
 =?utf-8?B?T1ZJNCt6WktYYmcvajRHcHNOcWlFWC9ncENNNW51YXZ2NGI3cytlM1FGTUZW?=
 =?utf-8?B?SWZnTy9KT0RCUDVYMkNlMG9UZmFjY3ovRytVQ3p1Tnk4UTNwcXJvNi80ZXpE?=
 =?utf-8?B?R1BIZGM4RDJOUUp0RzJpanJsd2hkNVNoSnMzTWxPbDA4ZisxTjhlSFFBUUtR?=
 =?utf-8?B?S1hUUmZTOHpsN1ViNjFkcGtIS0QzTW8yQjlGc25vZHh4R0Vxbkd5YlVGc1Rk?=
 =?utf-8?B?ZytYQWpXOGxSZElKZHJxQXY0aUhhcVprRyt3UENab3lDMVRpRTdCN3Zid1J5?=
 =?utf-8?B?em8xcWJZZXRRK1dDSlhwdGRuZFZTNEhRNkxTVGpNRSt4M1dvaHFXQzRoWCtL?=
 =?utf-8?B?eGxzRG12RGdKRDRhOGgzUW9zdWhmeStUT1FsaklsS3R2S05ld0Vnd25OSkZt?=
 =?utf-8?B?aUYxRU1UOEVTOXViWDk0Z3JHcTJ3a0ZtVXl4K2dlb2k4T2NCQ0twd09QOG9V?=
 =?utf-8?B?c3lvMmVJVVJuMENvM0Z0aWF1RHJIWURNbnllWWNZU2V3QWtMUGhJT1c3ZUY3?=
 =?utf-8?B?amduUllORHkveTZHZUNGSGZOQ1g2WUIvV2FmaXVqeENITTNMVmdCOE85ZjBS?=
 =?utf-8?B?OTZnUnFCbFBua2UxRFRmdUhEQXFOTHZtUjVEZndtTStMNzMzbnRlVE14c3lY?=
 =?utf-8?B?bTRwOEdOcUFVdmdnTTdxUjZjQ3B0bERmOHloTnZPMEMxSXRHQXE1TWVnT0ly?=
 =?utf-8?B?d01aSGc3bnViSjRVRjBka0h1dUpFdE95TE1PWGxoRmF2bFJhMTB4QzVZWWdZ?=
 =?utf-8?B?RXVCT1BVL1FIeHczcDdQbzBJTDROTW94RmVad3dxQXg1ZUx5ckdYelRYTzdl?=
 =?utf-8?B?WXVqUEg5bEUySDU5Z1JSTHFpcTAwMGtWcUM0S2tnZWE4ZHJXYkNwYTh4c0lE?=
 =?utf-8?B?VTRyY3o2K29Pem5sdjNMV1ppUHJmUTVsc3lTTWR2OWoyN1hwMFhZaVNEVEU3?=
 =?utf-8?B?RU0xeHUwUlRnczZCcE5nWlB6YUFDQ012RmFOM3c2em9hbXg5bHRrQjI0cHlW?=
 =?utf-8?B?TVpQM09uSXVRRjdIdUQzcVNoaWFoZ2FHcDdYQmtTN3RLaG02MFJtQU9ISVR1?=
 =?utf-8?B?UWVyNzNQcFlhS0RtNGZSQnZKRVNLanE1QU5IT3dubEVpZzZuU0FZUW5iN2pH?=
 =?utf-8?B?VzFsTWZPcVMzaDFNS3ptTXU1S1I5WmFOQTZLTkZHbVJsU0hjRkZqUjM3L3Rx?=
 =?utf-8?B?dVBkNVZ2UDI1MnFYQkhmY1Z0OTlFcXRDanNWcm0zOFJOUzN4U3hQQ1g3em8w?=
 =?utf-8?B?elZtZFVlV1BFSVl1blY3ZHhEZFlFSlZ5Z3B3VU8raDVCVmdySU51RURsc2xT?=
 =?utf-8?B?VmRJMUI3NFQvaGNoeXhucVFoeW51eTlTWUVQMHBDTjNNSytOajBwTy9xRUE3?=
 =?utf-8?B?bGYwMGdETHNVblBxYXEzU2RmVERnTlNTK0F0Yk13Mm40U0dJWXQwMUdzZlFC?=
 =?utf-8?Q?MYJS7+XOX34=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:WA2P291MB0309.POLP291.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHljVzBxUmJ3eXczNG1VR3JLRGRIaWlJR05CWDczME14Q2NodjE4cXYyM2la?=
 =?utf-8?B?ZUdtS0YwMVpEM1poY0llYjYxNnBvTlNhMDZnM0xYeVp5R204d3NtSk5SaThr?=
 =?utf-8?B?VDFyM0hIWWtteFFDd0Y2UEFQeTkwTGlkWHpMWjlaV0hvOXdPaXlqdENJcFVL?=
 =?utf-8?B?OE5UcmgzYjVNTW1xdFJLMWhvQUdwT3pLWkpnMmNtOHY4UHVNcVVyQ2xhSDNP?=
 =?utf-8?B?c2lIdUhjQUdMMXJsR01vd3hLVXMzNW5oTExRdEZHdEM0US9vdk9wZ3hCU1Jo?=
 =?utf-8?B?L0QwT0NBUU1adUZmSU9hQUdHOEt3VXZSZjNiNjVxSUtxeEFmQTJtVm42ZkdX?=
 =?utf-8?B?c3UzaGtYR2x4dThmaWQ5cFNUSUVwRWdPN2J5YjBCNU1VS0lzaVRaSG9XMmtz?=
 =?utf-8?B?U3ZKVFV4OHNia1RhdUNiU0lvblRmYUVYbEZyM0UreUJ0QkRSd0xDb0VxTVUr?=
 =?utf-8?B?bzZEUkVyVkk5YWs0WXd1U1g1K2FGWnZTdFNzbVl6RTlDeTFoSXQ2MkJqd1Ba?=
 =?utf-8?B?SEFadW52SlFsVXRucnFZcjkwaG5PL2liY0tYL0UvUEdPTXVRbWpGTkdGZms3?=
 =?utf-8?B?Y0RadzI0TGtvRVZBbVZyak5GVlpsZXdSdG4rL3ZYZVlkdkhwR3hEMFcxd0k0?=
 =?utf-8?B?ZFNTTnhHY1JiL091Qzk4eVllcjBYNkdZZW9HYUNtN1lRNnM5UDVsWk5LLy9Y?=
 =?utf-8?B?Q0IrVS96bVJkQUVvWGo4aG95SlM3anM0aytWZnFlbUJvYzZRM0prU0ljUXlr?=
 =?utf-8?B?endsZ2daNktGMjZMbWUxRWJ3c25zWU9Ebm9oRnpKaTdhV2tZOVYyZDM3bWVK?=
 =?utf-8?B?NElWbWszZUlwbzJJY3Q1R1BISk82NDFGY3BnUCt1MTR6VWVKd0E0ZHExbjRG?=
 =?utf-8?B?Yndlc2Y1Rzh1a2hCR21QbU1ycW5FL3g3TVpuZ0tGYnJKWk0zWmhmT0JWNmJq?=
 =?utf-8?B?TlFUakxsYnVmbVpRR2g2UlQ1S3p0cmtNRGR1Y1FsTUwyWWVJMkgxRjgxcGd3?=
 =?utf-8?B?OGJuNTY0ZDVpTDEySUVZTVlnT0dOZG1lVVgzM1pndDRjSE40QzVKZEEzMXdq?=
 =?utf-8?B?N3BONzJaZFlIQ3A0NWpiZjlLcjdEMnp1UjJVc2ozcW95NFc2anBLZGVuWGFt?=
 =?utf-8?B?c29LNmdsUGg4aWtFOHZ0Wno0N1k3UW9YbCtHNWM3Ykg3U1BlU2lMeFNibENY?=
 =?utf-8?B?bnUvTHRaYkQ1cS9nUmRVdEhhTHNvVE82UlQrbkk2MVYzdWQwMVFRbGRRSmkx?=
 =?utf-8?B?dVRKaTBNaGlBOUJHZktreU55cjNPMU9GUGxFYWlGVFNqVXNQR0tnZUc0dFEv?=
 =?utf-8?B?Wmw0aEExb0JKMjluZERxNVZucEhGa2ZDbW41anA0N1BLVlVYaUxhRXlPMyt5?=
 =?utf-8?B?SjhtTDY3d2NuNTJBZ3ZyWGgrTFl2bnBRNWZKdEIrWkhsMTB5Vityd3V1L21i?=
 =?utf-8?B?WE1OeDNSQy8xeUNHcGUyeWI4Qmw2ZzBBSmtnU0M2bFg2WHFkTVRvcXZKV0xN?=
 =?utf-8?B?ZSsvVCtnWnNpV216NjlONGFzc0pKallpU0VEeDRCUEpXS0NaOUx5QkhpQW15?=
 =?utf-8?B?ZHQrNzMxZzFTZFRPNXBKR1JxMFJIUDU2bDNpMHlYdjUycWIyV0JjZXZuSnlH?=
 =?utf-8?B?cnZ4a3ZRRnZIVHNKWlB6VDI2MWVNQTBWWm5ubDNqc2dWdmd4Q1FyZy9FM2hy?=
 =?utf-8?B?TzJQK3BwTWhLbjNBeThESVBmRmU1RlIwd1lSNk11L3k2RTcwcDZIMW11TzE5?=
 =?utf-8?B?eHpNbFgrdnc1MDZnSTh2bUlKS1BNT0JEaytTSWFxbDFWTUdBdjNabnprOWY2?=
 =?utf-8?B?Zys4bXdNaHoxOERUbDZMM2FRalJlRkdDYU9OTWpycVVFMC9ncDRyYTNuVzRw?=
 =?utf-8?B?UWdJaHhXQWZCRDhVNkVoZHo1V1hFV3k1cEYrWk1uUGdVTEE4Qm4rb2t0dW5K?=
 =?utf-8?B?UW5WMW54eG5xVlBFdnBTbFkyK2YrcDYzeXpSU3p6RFRIMWIzSWUza3pnSzZu?=
 =?utf-8?B?UHo2MFIrSDBwK2dxUTlGU0FVVEdQbHdFVkhTS21NMFpab21ETkovT0xMOHlj?=
 =?utf-8?B?YUhINi9qQXhCU0lEa0VQMUE2Y1BNRy9Jek5tbnpodTBmYk1iZWRRd0pIQS9U?=
 =?utf-8?B?MGtoWUVxaTgvRTZMTitwV2RheWN6Rm5kaGNzcWFPTm82NWNsUjlkNmlENTYx?=
 =?utf-8?B?QUE9PQ==?=
X-OriginatorOrg: videtronic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f74079-f67a-45f6-1f97-08dd8ccc8ea9
X-MS-Exchange-CrossTenant-AuthSource: WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 18:33:55.3041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 42908bfd-23a4-4a6c-951d-1ef4d8e0c612
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZUhDPPrwaC9lwKkV210XZIAWKp/l2uYf7RUuNPCH0awqoiINlDesg+98j4IPjcx7aG9XR6eplq2j0myMzUXEMPFcxu7keH9Eufpl8h8Grw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0278

Hi Cosmin

Awesome work. The initiative to establish a common framework for GMSL 
devices is a great idea.

I believe that we have found few bugs:

> +#define MAX9296A_BACKTOP22(x)			(0x31d * (x) * 0x3)

The first multiplication is wrong and should be replaced with addition:

+#define MAX9296A_BACKTOP22(x)			(0x31d + (x) * 0x3)

The same goes for MAX96724 equivalent macro:

> +#define MAX96724_BACKTOP22(x)			(0x415 * (x) * 0x3)

In MAX96714 driver there is an issue with setting up lane-polarities.

> +static const struct max9296a_chip_info max96714_info = {
> +	.max_register = 0x5011,
> +	.set_pipe_stream_id = max96714_set_pipe_stream_id,
> +	.set_pipe_enable = max96714_set_pipe_enable,
> +	.set_pipe_tunnel_enable = max96714_set_pipe_tunnel_enable,
> +	.phys_configs = {
> +		.num_configs = ARRAY_SIZE(max96714_phys_configs),
> +		.configs = max96714_phys_configs,
> +	},
> +	.polarity_on_physical_lanes = true,
> +	.supports_phy_log = true,
> +	.adjust_rlms = true,
> +	.num_pipes = 1,
> +	.pipe_hw_ids = { 1 },
> +	.num_phys = 1,
> +	.phy_hw_ids = { 1 },
> +	.num_links = 1,
> +};

In order to make thing work we had to set

> +	.polarity_on_physical_lanes = true,

To false. So this field is either improperly set for MAX96714, or handling of this case is wrong:

> +		if (priv->info->polarity_on_physical_lanes)
> +			map = phy->mipi.data_lanes[i];
> +		else
> +			map = i;

Upon mentioned changes we have successfully tested two GMSL2 
combinations on Raspberry 5 platform:

1. MAX96724 + MAX96717 (only 2 MIPI-CSI2 lanes with single camera due to 
hardware limitations)

2. MAX96714 + MAX96717

We have also been wondering about these registers:

> +#define MAX9296A_DPLL_0(x)			(0x1c00 + ((x) == 0 ? 1 : 2) * 0x100)
> +#define MAX96724_DPLL_0(x)			(0x1c00 + (x) * 0x100)

There are writes to these addresses but we could not find any reference to these in either MAX96714 or MAX96724 datasheets.

Are You willing to add support for mapping MIPI-CSI2 lanes? This is a very convenient feature which comes in handy during HW design.


