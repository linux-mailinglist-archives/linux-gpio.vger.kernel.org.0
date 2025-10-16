Return-Path: <linux-gpio+bounces-27205-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CC5BE3B26
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 15:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFFE81A65B67
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 13:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE79338F2A;
	Thu, 16 Oct 2025 13:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="G4kXHzq5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A156433769C;
	Thu, 16 Oct 2025 13:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760621159; cv=fail; b=e/lVFantfiiwmH449Dy45D/khkxY42HluWKTMW1tbVGlC7SHWSVp7znc+PCQgFM5G8nzN36eGMV9ILJ+joW3w+dDbcCtYHdBdfM/hW9ahSA5OksJcaZgQr4XAnxT4tdlXRR/IjNelVWj+w7szzg6hDoixnb9y9RfOZbNbzxHFI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760621159; c=relaxed/simple;
	bh=AVFmybKuY5vZQJI6xxRors5csWefcPfaiwpwdA/4rCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oMDPJ3llH0P39vRxc1pf6RC/OcK+Q/d8T3T2obnbGbEFv87S4b3Bs7NG1EsBqvVTIE2Wc1arZhpaF1ACp8rEefLr1b/QMOR+uexAsal2ZbOsyssDsus7FNppM53vNImrEvyhqqQqCUP2yilqSzOVSEA3xpqDHYIsekfciuoqOno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=G4kXHzq5; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSPkLB9urMNVvzk6E2mRx4QuF9pdCN8ZCNdp/4f+GsTOz9Csp8aErvj8qkXALiL5hUEMDQQJSkkEfBMcRDD3sR/QeFCK9JYWbqhJJlxAX11ukcyodkAJanaG6vHwfTwc63sm8Rq4BXPJIBu/vVbnrHdfmIZJP7hqA8/w7vImgfe/YXlGAYN5Y18msYvLDMf4k/fPzP8mFoY89Ps+dAecaV8G274GoRySV08NjljL+0N+NR/fujNgRARTNlRkCalQGJTiUvBxLaq36WyrC6ynwy4yLcZVbf03SOBOMLr2rbN6kJSdCDI3Ij/CfxZvXim2POwliuUpVlEz//O1IcwETg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgE1+jNNhf7OZC0IJ719mT+QprB4jK+7alASm8YpVLA=;
 b=Gzvy8wdqNLnoopt89Z3MwqmitB/JiFxcRlVjYiYNaaFHXufNU03iBGhaHdDmc5sO9ulTK8sjV/D7zusmoGqxGNyf//cKfrCODkOHbbReNzjz1vIiek99+9OTuS+XIXBDzLd/lDPegj3KcxE8zFLfU73+vaUMztQHLxY2D6LAxvLFljkWQ6UPzAHa4nv/rBuTS6cUPCibJfJb10yPW1NVWSK08eIoTVGn2EiyWkhI5S8WdWZkyNhW/Fv7gNjqmrQRf2EtaVPcw7uFNGTM9kOBGyYYZN1UWo1VIhOfORNKeC/lg2trYoW5jU+LqNz5R7Utu0jbjP9JSk8V9PYX/cooEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgE1+jNNhf7OZC0IJ719mT+QprB4jK+7alASm8YpVLA=;
 b=G4kXHzq5DNQStZv3VOZ/9i1dSbyDInLLVt9+ENrB912fBSExQ54VbtK4E4AUF6tnU9ixwWGC58U32GIEKLFeqkVfOkryrk/t7P5K8WIvS/BkpXCeV6IE+qSPcSrBw2aZv+XNvS1bAdjAoWligEsLlfnXw3hMsSQwvleezKy4oI813xkF7hxYwj9KxBSpSTnpy5FfLKUtn5P5ciQ4snJZF24wJ9e3U104GOnCkBpDfQAkSJX6CTiaE5cBIT4U5OphpOikW+4LYMhoF3wvX+DG4QUrDhNmPSsoiwl8JKLZUV1rZ/ElRA98kpjyawt8oAqKzPmygxD+turPvyWrPPV8nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DBBPR04MB7977.eurprd04.prod.outlook.com (2603:10a6:10:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 13:25:54 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 13:25:54 +0000
Date: Thu, 16 Oct 2025 16:25:50 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: (subset) [PATCH v6 0/9] drivers: gpio: and the QIXIS FPGA GPIO
 controller
Message-ID: <o3oknl2onntkl2dgzpzsjm6xeunqxrq3j5afo5zb5gdy6xyo2r@4ctlictxhdlv>
References: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
 <176060910602.64650.7023197009719546944.b4-ty@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176060910602.64650.7023197009719546944.b4-ty@linaro.org>
X-ClientProxiedBy: AS4PR09CA0029.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::18) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DBBPR04MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: c0bdd976-ca6e-4915-2b48-08de0cb78831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q53vF8MrUTCvydLGpElxK4eU8M4On94nKP8/Nue1HtlsKuGmQRJnwegEpO+y?=
 =?us-ascii?Q?4cCZ+3fUgRoHj7uRr552kqh1ZnYKNxPVjTBtLJBmJu8boJ/rwhmas0gd7v/d?=
 =?us-ascii?Q?OF35FuzGVdkg6hcjXcLi/YfU7lw9yic8wxM5JPNctFzQbzzzIXFF3gggJ++V?=
 =?us-ascii?Q?pWC7NjjsG10wh8YTcPf281XBqlhDkVPpVACqW1Tqj/KdL3nZgmCvVS8hoWOb?=
 =?us-ascii?Q?WH3MXzJ87LszCaQUn6smTUJoOauebjrzRX7IKm+tMAfntsP+ifIP1u4vwX9G?=
 =?us-ascii?Q?ZzdoVbzob3sbd9A9fa9nSpK/GG4i2b6Qh0OTcfxC4SSf1O2LXZDFub9qEHPu?=
 =?us-ascii?Q?eK+Z3n7PU+6EowxSdW/p/LopI+S4ytfh7E5sTZQywhw2V/EhlI9pBp+tEJOC?=
 =?us-ascii?Q?Bhbc+vOq+nuPCeFPVDGa5OJAWOSZY5HR510XmlI7/WIsuGT3bCCIahLS0eeN?=
 =?us-ascii?Q?9feto7PI1HNoVj9tij/J4sGYXuypUbvSPim5YwZR1srnCOP8nzL5gvd+np9n?=
 =?us-ascii?Q?N+3ITj2JgBDIOu0Au0Q+uTJq0xq4OXN1Qcwk7ZT2IQ00/y5bCtaFPgm1RFDh?=
 =?us-ascii?Q?tvm9rjcNFM/2I9rzYrwuQ1SQ7wKGoOdmxBXUj6mibrw4nZ8F1ztrt/CpT2Kv?=
 =?us-ascii?Q?2wJjcKGjP0tj6xKkYuJNqwEFcSpmV8NjN3lfzCrMDnkuUXvBPUwIkpagVJ8P?=
 =?us-ascii?Q?6zCjy9km+bSo8JY92PBO1a2sw9aEf0t3KK7/meGYpdkQ0YP62G3PP/gDSqPi?=
 =?us-ascii?Q?WCS/4no1cUqCAOZeLvxksqfAlRbJoLyAw0fcLCoc45jTfzQToVrjG5y/vv/D?=
 =?us-ascii?Q?xb4dL2j1XkV76EqLqvCuNoply/04xZtamD6omfDsC4bXY6kXBSFX5HkKnnB/?=
 =?us-ascii?Q?fWqD25PKqu2Fb7zyQ/6+rhDYe6ct05IxOC40sCeFwdNsYF+IezoDPfT+Xu2R?=
 =?us-ascii?Q?GVLbeSb8rygXRwwOxHrXEdfnaeng2BHLEcHxrE3gmW/EMEL4NzhgaN4w66S0?=
 =?us-ascii?Q?+cgvlsge1wgSTHtcUkQRR47S8VkYrPyEfb12wZve/3M0x5rb4+gpKovOvIaH?=
 =?us-ascii?Q?/AJp7x6Eh2oKQw4Aez7X5yV3FeVPWIeM6sKu+aimGHaTp6gqPQcrvzmNdOig?=
 =?us-ascii?Q?6mfjQfG5P2KWAH4KxAyJfhKZNIg/NIL7aWufDrMGlzYCRIDG3D0iPMp/WO8A?=
 =?us-ascii?Q?vljJl/0WFmL2OWcriv1LluL+AgPDO3Yz/4T8ZnEhcCgLAvIacjCJrBllSH12?=
 =?us-ascii?Q?bKvMycmDjxNqOYUJqF6RaQlcOfUOFGg7t+u2R1JI4lwqiGFgY0bp21YJFUua?=
 =?us-ascii?Q?7tc1wnnnL5/iDyDBS5k5gylNSobGyHWQt+LSIBXSZyjKrVbRA7kiPxKLUyYc?=
 =?us-ascii?Q?xurFVLHoSEP5hR2/nMjTGoZoMaut0/7zwT2amiJphtZ+LzaAUp4zwBsDbxIc?=
 =?us-ascii?Q?Mf6XI2+ZniWbeHpZODPSW2PT2pfmCdeh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SiGtH5nzOoVqOIiutSGOMbwU69Kg9zfb3b/UOpOBtqwYIQIPjSOhyMZU7T2E?=
 =?us-ascii?Q?D4QYt4r9ovrn7om0o3gGNH2k8TrfPauvQPrZYgogLC7UdapBU0KPyfV8wJKz?=
 =?us-ascii?Q?bwUjnBR1unpxONwzL5x9dWPgxDjEiD8779KYJmwG4VYDED30PUGaGA5TWM89?=
 =?us-ascii?Q?NQH26sPDvHXJr+9E003VrRkUK0C1wc9OPbtyd2ZJE9N4z24YTc8/0qhBD3gJ?=
 =?us-ascii?Q?SYMf+taKezR2zFA2eRTlg26ayz+/Sje5JsFmPPxx1IzwzJhBJHUyX+8sYgRO?=
 =?us-ascii?Q?deiQdDMIEW7pc6Gb1xxcCODFfsAFhjd3BElhTs/5tH9+qMHk/btepCjd8ixc?=
 =?us-ascii?Q?SJVnMmiRBXmEQ4sODWv2VPoKUCMUykYd2yASGOjFr9mxu6H7qTuPj5y+xUnZ?=
 =?us-ascii?Q?AYbwR0iR/zDH2zOem39Dg9CZyGCcPqOprBIuNZc2tQ4s0biDn+SWd+7ieEY/?=
 =?us-ascii?Q?N0bW5TUepZBfARZzhDaH6joh2a5aAu8QtHlMO7Ohxp7VRlX/fssL6JskdCzS?=
 =?us-ascii?Q?urRcJ9Bcu7ZMHDuLirxPygz9l+WwTHtfgfUCHpEx25sYuIpcNw95ekPpRWds?=
 =?us-ascii?Q?GXHOIuqvFOxH33AL/RTXAyynJxpTzpUX71dfjkcGAGBvVZ/wkiPnpH2afRjW?=
 =?us-ascii?Q?pNkqO6ejD/sW0U/5pkhl5uhstCfg5irkVTgeKNL5uqzHoQR9iSDDA475VdjI?=
 =?us-ascii?Q?ZewYa9zQlGq+ZU8hC0ALOtSQLM61B2dA4O/4qQUTuYossl8mQ/IxvRGCUQ4O?=
 =?us-ascii?Q?BW2iXKIkFeHsQ4lu+NnD4wmba9kL0uWN3gAp3UPoXT6VkukQWwc6KV1WUi26?=
 =?us-ascii?Q?ituzsVRmDS1qQDW416AlbXTVYZGvMO38iJDfloSA4r/3wO3EOeEasL9PJkgW?=
 =?us-ascii?Q?29Wm5Bi36gB4m1wulFefAQXCuazm5YypjShqUt1j5dSUMGgJ8+ddNgNJbJlb?=
 =?us-ascii?Q?XLy1JV+DXHkaK9vT0FRx3JafL3PzrTFeQR2luiFY3nTymr7i6OCLW+OinaD+?=
 =?us-ascii?Q?RkSozQ+NaCdY6NVMa4r/6Ms2qiYyeiCGMsOw3nF+RSuj5tCe1KoISRitgKfU?=
 =?us-ascii?Q?qqqWmbrQJvsVwTQd5KLGRTxdPaOIwPFq0d/71MQycnYJYFSV7O8hVEM6HLna?=
 =?us-ascii?Q?/U6NxIHPgmECFd8b7sYHq5uvPCRzzijRLuHon4lnUS7l/WJMpNx3avbhT60G?=
 =?us-ascii?Q?oYb3hXISthl0OCHkr9cPvQn2N0REtoBe/b3JIHtIMpgZd/VDaUDn6lQIVIAw?=
 =?us-ascii?Q?4BBWNXyIMLXrlsiqqQhK53fICj+FPooDEshy19l4yuO12YclJvkmePLRRi9v?=
 =?us-ascii?Q?YTEPabM9/ETttTY/pC6w5703P4wTuDgtbsODlAtw1SVw+w+RSoIfa6aCFWIr?=
 =?us-ascii?Q?lv9jyJj25lWjrbnUPuP4Z8x8OnwGcRD5M6qS/TEIdwK5Xm4UDO9SziTaS2CP?=
 =?us-ascii?Q?mhiqwQfW50Eq0uri9s3WItiit7yFhSBpo2LQgpcXFmt1mHWhnp72UItPvN7U?=
 =?us-ascii?Q?dYPp+kEVKzsBIzx89KfWM4QC/23OZ5ZBdgrBxId3vsZgx62RHX0rEVHYTn7u?=
 =?us-ascii?Q?hgMw8SrSmvY7D/SGAQOAXgLpG6u6dzFwdv4FwAx6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0bdd976-ca6e-4915-2b48-08de0cb78831
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 13:25:54.4474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qRABxr6FPhLqJI6BLjbGPVv0NEhDg+kvJO5XV5jPO6g7ml5FHaGFOCI15nNyt5PsA/jgblzVH9SEzF40U1UlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7977

On Thu, Oct 16, 2025 at 12:05:13PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> 
> On Tue, 14 Oct 2025 18:53:49 +0300, Ioana Ciornei wrote:
> > This patch set adds support for the GPIO controllers on the QIXIS FPGAs
> > found on some Layerscape boards such as LX2160ARDB and LS1046AQDS. At
> > the same time it describes the SFP+ cages found on these boards, which
> > are the users of those GPIO lines.
> > 
> > Before actually adding the GPIO driver, patches #2 and #3 add and
> > describe a new compatible string - fsl,lx2160ardb-fpga - which would be
> > used for the QIXIS FPGA found on the LX2160ARDB board. As opposed to the
> > other compatible strings found in fsl,fpga-qixis-i2c.yaml, the
> > fsl,lx2160ardb-fpga imposes a unit address for its child devices. This
> > will be used in the next patches when the gpio controller node will
> > define its unit address as the address of its underlying register offset
> > inside the FPGA. This requirement is described in the yaml file and it
> > only affects the newly added compatible.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/9] dt-bindings: gpio: add QIXIS FPGA based GPIO controller
>       https://git.kernel.org/brgl/linux/c/d5896130a8781de5ac8970dbb7083ce4cd6fe57a
> [4/9] gpio: regmap: add the .fixed_direction_output configuration parameter
>       https://git.kernel.org/brgl/linux/c/ae495810cffe29c3c30a757bd48b0bb035fc3098
> [5/9] gpio: add QIXIS FPGA GPIO controller
>       https://git.kernel.org/brgl/linux/c/e88500247dc3267787abc837848b001c1237f692
> 

Thanks!

How are the two remaining dt-binding patches going to be handled?

The driver changes for the new fsl,lx2160ardb-fpga compatible were
merged but not the associated dt-bindings changes in patch 2/9. And for
patch 3/9 there are no associated driver changes.

Ioana

