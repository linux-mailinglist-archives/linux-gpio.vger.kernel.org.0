Return-Path: <linux-gpio+bounces-19811-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 296C2AB0959
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 06:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D98B9E5E11
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 04:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F369264639;
	Fri,  9 May 2025 04:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IWwIhGQo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2044.outbound.protection.outlook.com [40.107.249.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4093D26461D;
	Fri,  9 May 2025 04:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746766040; cv=fail; b=DZaCawnyp51bgzD3Mr3LqEYSn+twvyE3ICDvmDf5VZ8Svtp+6KZVDCGLNq+/XG+s+9rDSeSNXUPUUtaCAPjMvk09QmkgCDNaMLh6zTiYPEsoF8v7OrOQnNg0ipc4zOI0irJg+ZOmMDqDWm+FjlBL3FwaVZ9X2/0knbETKvAH/80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746766040; c=relaxed/simple;
	bh=B7DKR8PT9x+XuHYQVjXd6Oo6jI8CRaTgxeWDZYNGYkY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Yj69qxKr6o3gKoPsQNBqZTlShf2D2q6aggjpYMOp8jaV99D5XNQ7ypn7W90yMLLjvFHzCAKSWjwNPzckmYw6sUedq9iwao263vsAw+KsslrEdtaRRF72PNEqvba0kx/n7toySDc0PL7SgDwdrvidgmbx8nYdOhbop4F2r9aZHjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IWwIhGQo; arc=fail smtp.client-ip=40.107.249.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uduUeNKHmsaewsLx75DizQUBSR7oMV9aJNxbIFY842FEnISxFd8d4aWazfhAxalejIRFBwCRKUUBNzJFxLpndeM8cHVDcQINUBxTxDztytHUiI5/sZkFjRddP8KP16re++b9bIwfLsCAFqjtEN4TVoDb9LsJtfjDHQ5gouJRvjoAXwvKJgGjZOwLbJ9UQlZrFr4lbUJ2LxR6PwbH0FO+1DqHXnvlTbQ2CQmpjKYA7zHYfzHL6wfIihJguOJJ7xEgckmDWsR3v/KAycwZoFW//rtzgLunb1yR25T9hhYznJaikk75L2rwAnJewH/asNJ/tksK2jvB0tgweEms2nCH8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QB5SI/pQkLAzQB7bn5/uxcb06qJhknkRL6GHx+86AbY=;
 b=voKa/mO8UMfuECBB83jSsceLkxTj66Id56atHTUPA1Vu5VeCsou8sxFpIbdhtCMOf9caA7il/m6KASkCXWbCSbx8YyaflVsZrjlcoaIIWrw+J3M9J/DwRb9RAhEG0nJ6DWr77oj9dr8E+K9TvjavcGn5hnsPgv+pde8HdK3Zfi+3ZJXvGtgosxzrYIt7N1ZpyPFEVffPHLXppF4yTqrX5unS/1dOBIRmpxutzWx478WxST183DE43Hwl+ra0zdSBzizxN+89Caw1vS+qfpbQPKmvp36ujjYHMwcD9D4mqPuz7okKlLRlmkR2tKs9qRPwCIcWcCptC4x+PtVOZd7FrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QB5SI/pQkLAzQB7bn5/uxcb06qJhknkRL6GHx+86AbY=;
 b=IWwIhGQovonO0miXtWNfmpIoFWlHhehZXljTuQdmLHEXbcQzbistJM2qKx+fRLQkTGt/hDyBMKwHxw7yDq24rD77oJFAxaOLfbuvJRr1FLy/P9rGeMyu8ok1YP2RiIN8Fkb21aeUUK0v7V3HK0G5FW55PHIjfhs9RbJCHLchJildc9GN8z5Im4fE7rd3jT899FgjzFUpQKgQ4J8kVHKGCXUnVEOfVkgOpn6JIsnEN7cg2+3xBqEEK2nOiXWsoXdgX8C8hkTUuD1jx0oycWoffs2DrAX7S5RnbNRutfjxFGlg6WPeR2o7fAdL+YGYNZ3tt2xvQz1c8Su2vb+SLfnJRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8736.eurprd04.prod.outlook.com (2603:10a6:102:20c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 04:47:15 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 04:47:15 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 09 May 2025 12:45:34 +0800
Subject: [PATCH RFC 3/9] gpio: lpc18xx: Make irq_chip immutable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-gpio-v1-3-639377c98288@nxp.com>
References: <20250509-gpio-v1-0-639377c98288@nxp.com>
In-Reply-To: <20250509-gpio-v1-0-639377c98288@nxp.com>
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Keerthy <j-keerthy@ti.com>, Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746765944; l=2380;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Qz241mmKXCwKGOl5Ksj3hwc0ajIp1wg0T0UUbiHF2G8=;
 b=/sGu+t2jBMw40Hk0hIoEvAC3uraOpUSl/uAuVH6rdqEp1F6QchTJOv9cAskhW2mj3mwaJdKqG
 i40llae4LFfBbtXlP6GIZe5GkeoA2UqHPnK0Pl7dzySwr6Asjz4ORUB
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cc04183-980b-4428-375d-08dd8eb4922d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDY4RXRaYVlJc3F6bmJrTTdsdXpHaWlVY1AvZHp6SnB0S2l1ZmlOVlMyRm1T?=
 =?utf-8?B?RVRvZWxROU80amRWSGJFUStRVjljbjdJUmIwMTJxV0xDazRKSjNQaG1xdWpS?=
 =?utf-8?B?TTVPUjZOcWlIeGpGSWhLZ1VldklwRzVZVGVUR1hWS0xiOGJQN01WRjR1WHp1?=
 =?utf-8?B?SldaVVFRRW9mdDh5dkRDcjRnN2JGRGVjcWxlakZYeDNVZUZpSGRsaEwrZndI?=
 =?utf-8?B?RlU5dUtIenprL3lYUVM2N01CTGlzQmtmbmhGbFdBeEFHTGRzZUVxSlhEUkhT?=
 =?utf-8?B?M3daN0VjRSs2SjZLQ3FnKzM1MU5LaDMvdUZmMGt4a2gyMlNxaVk3bEtJb3gz?=
 =?utf-8?B?QnBlb04zQ0YreFowQ1k2ZG1VYXBFemU0c1hQNDgvUEUvK0svMEJBZTFONEFW?=
 =?utf-8?B?ZmNxc2RYL2JyRXFWMzZ3TmJXbUdPWkpIN0NlTjBWSGdyUlhqVDl4VkljeVgy?=
 =?utf-8?B?NkFUeitCYVdZZEd2aXBUZkFJZUEzNEx3Q2ZXbVNxbXhzTDg5Nkl0czFqU0hG?=
 =?utf-8?B?RDl3SVlSTnh4a0x6dHMyVUFXaVhLZ1hreFZ0S3BOeHphd2VrRnh2eHd6cVdX?=
 =?utf-8?B?b3FqVEl0Yldyd09MT29ONDByVkhyczkwdzdZalBxU28xUXhaeHRoZDVmcHAy?=
 =?utf-8?B?M05mSjdqcWdPTW8yRTQrMjhOemdYR3J1WUtHUFpqM1JKUEpCM3pqRWpsL2Fw?=
 =?utf-8?B?clN2TWMwN1J4RGFSRXhHd2VrYWRvWGliRFJsN3JVRCtrUVdpRzlHTUVmZlFx?=
 =?utf-8?B?S09OWTZIT3Q2dFdySHlFQlRoNklWQkUvbHJnV05TZ3lZd2Z2aldWTmUwMFJK?=
 =?utf-8?B?dlkvUnR4VFZWUGN3b2ttdFZ5dE5QQzJDYmNqLytKN0x0WUM5akRoei8vRjUx?=
 =?utf-8?B?a2VWa2N6czJKL1F5Nm1hSWhjRGhtczNvUVV5a1I5bUNpT2dONFNiQ25GRmhn?=
 =?utf-8?B?UHdOeEZOT3ZHZFl1NzlITEtGbGEwSWxybFRoZS9yRm5lZVhETWo3dkIyRTIw?=
 =?utf-8?B?NS96aFNKVWVNNnFpR3djQXJIeFJHTUdSVDNnVDh0ZWE0aFNzbFJNNnF5SWd0?=
 =?utf-8?B?MGRwMjh1S2hXbGFqZEo2OXhFQ0RlZXRWQzNSYThVSDdHY2lyek1HMVRTNk1D?=
 =?utf-8?B?RGpQNWFEY1pnbUFyVWNwMjJqdkxvYlcwSnA1WFBsbFpIZ0xrUUhmbGRGQ1cz?=
 =?utf-8?B?c1Y4TWdWL3ZiOGp2WW9PVnpUU3k4Z3Y1YjUxdTRDUllWRkNXTmJkenpYSDVG?=
 =?utf-8?B?YlBPQXBIbHlDWlBuMkZiR0FrbktubUU0K2M0UGl5RncyZmdVc1FFZHRibUYz?=
 =?utf-8?B?d3IrdC8xakZGQytQTU9BeFBHZkpZenAxcGE1OC83MkhyQStQMStEZDVUdTht?=
 =?utf-8?B?SFc0Z0RyRTdWdGxsTXpQazhmS0RtNkhrUDdIOVpPSTN6VTU2dSt3ZHk4STBp?=
 =?utf-8?B?Qkc3eUZmRS9WVTBOa3dOQmRLTnhFRHNpbFFTR1pEWXhvc1d1TE1kVGMvbW1z?=
 =?utf-8?B?R2hmc2thSis0ekNHYldKb1IrODQ2YXVvcGZVRVpyR0xFODhzV3JrRzBjVUhq?=
 =?utf-8?B?KzBCTEpDYTVPSWVJcGFsZGRBaWtvUHhldGJvYm4wcHQxSnhKeEJBaStkcDl4?=
 =?utf-8?B?OWY3QnQ3MVBzMmNDeXg2OWF2Z0NWT2Rvd3dld3llbW1WRUJuNk8zcGQ4UC9u?=
 =?utf-8?B?TmcyQTYwcTlWTUViclFmSVMxSGY2Yk5NM3VscUVpak9iNFJDR0pTWTYxQlhO?=
 =?utf-8?B?bDBaUlc5SDNkM3VDeE42ZnFScUtibm9Uc3UrRUs5andHMmZnSzlmQXdhVzJY?=
 =?utf-8?B?eDFST2RZOHk0T0RFcW8wRXlKVVhGZkFPaUdiRENwWXdKeDYyMzBxUjV6Sith?=
 =?utf-8?B?VnNqSmhMTWJHZ0VtVXBrUkJIZVorYk54WCt4dUhIVzlQeStZUjFFd0lSTEQz?=
 =?utf-8?B?L1Z0R1poMzRLcVJIVGJOUk1ndHhDZFhyWmJzVm54K1N1b0tNcGw2ZkVqd2FM?=
 =?utf-8?B?MlFWMGhaemg2cjhCUHozYldhdlkyd1NyY1hraGYvSVRPWXY2TTlPUUpiZHJC?=
 =?utf-8?Q?WWV8Og?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qi9PVTJLZWhsYkFPOWxScit5dElpQkQycmgvYnVCWFZBb28xN3ZHWVQ5Mkg2?=
 =?utf-8?B?ekVTZEpGQU5wUGc3dmpvbUNHWG1zWGdsUDJCZTU0TUpHZUVESHdVWEZZVVJw?=
 =?utf-8?B?Tnc5bTJxcGJtWmx0MUtwMnIwbUtjenkzVWxXdEV6amowb0M2ZVBXZ3JmRmc0?=
 =?utf-8?B?cVRZTlVqOFVQWWdPcVJyYTdqanV3YytscWZHRVcwT2ZVQm1tbzRpL3B5Sk5Y?=
 =?utf-8?B?ajRoTUNRUTlBUWJMajBiZG1SSCtJL3lxVDlVT2kxbk8vWHJmZng5SVhzSG9p?=
 =?utf-8?B?Z2JIbitBNmI0Tk0yNEJ1cmRQSDBsU2d3WDFYMWVRWHE4M2FyN0UvTkV5b0wr?=
 =?utf-8?B?WTVVdUpXd0FMYXZpcXd5ZS96WmdMR1RHWExnbE1FVXU0bFhGa3l0VkRGSjJT?=
 =?utf-8?B?N3NMUjdhQkZ5MFdwYndreFRlcXpCZnRJbENUNEljZElZM1I2UkltRlhpRllx?=
 =?utf-8?B?N3psMTBnQjJMcGVwSVBxKzlPMXUrWUpLYTlvTGdZb2ZVcTVxemlxNHgrNVIw?=
 =?utf-8?B?b0k0OXIvcm0zT3ZzYlpGSjJ1Z3ZVMUlGVisrSXpqcUNZRlJOMlFsUjV5bmtJ?=
 =?utf-8?B?aDkyWFZucmJMY2oxMXo0aXdqeWxmQUdMcHFKdVRpRmxVSE1ZYlhUOFlRMmMw?=
 =?utf-8?B?UDJhQ2dBdGVOUHR0d2gvZkdHM2JaSXp1VmJPN3pVUnRDc2Q3cUJKZTFRL1o0?=
 =?utf-8?B?N1NCbGpUaDcza1NScHdTR3RPL3FJV0VaeVVPMnhyMjYydHJOWXl5eU5Pdk00?=
 =?utf-8?B?WjdWWFdRRVJpd1Jra1dlc1NWc2Yvd0VYK21VanZCREF4ZlNpZXg3bzFnT2I2?=
 =?utf-8?B?UUpQN1NvaHJ0aG12RnVXeWxSUldhRUhpSXRSUzhLQ0pvL2J6MHZaSGZpSHl0?=
 =?utf-8?B?RTlLRlF5dmlCbkdWOG9DYnhJUzJ5N3orY3YyRjRhalErUHVjV0svQUNRYVFS?=
 =?utf-8?B?UVRwMElNOEJsQnNpK0NVNzMzMzlmNmNvME9iUmZpYld2K01PeHprUnU5a1NY?=
 =?utf-8?B?Skl0aEhDK0VIZS9YRXRTTElCYzZYT2Q1blNoTjVxbFF3QnNNeFhJd0FGSkVt?=
 =?utf-8?B?aEVMV2Y0RzQza2lWU0Ira0kzU1M0MnZEb1I1dHUyM3AxeTh6a1J4SSswU1ZR?=
 =?utf-8?B?b3RSZnJuV0FjSlUrOUE2VDJtanBVZGFSSkt2dUdSejJMbCtUdXcwWk5FMjVz?=
 =?utf-8?B?a0kvMDZOK1FiSHoyeFo5bnNvTmpQMzVNWHdXUGZtTnZ1b1Y3V3JXLzBDQkRY?=
 =?utf-8?B?TDJlbGlCaVByN1FFallqbnRNTUVVcWNQT0RDZGFrcGhybW5ha1ZKM050ZFA3?=
 =?utf-8?B?YWgzenlmMWpQeW9sbUovQnVaeDE3RU1yblNGMTQzeEpSOUM1RUorbEVtUVNZ?=
 =?utf-8?B?eGFaZEJuR3YrVWVqZ1JHVHdJSUFyeTk2aFduc3hPV3JTNC80cVB4WWE5NVp4?=
 =?utf-8?B?TnNrVlNkT1ptdDJHcS8xMkUvaWtLSysyUURDQ0RJZkpKN3ovRkIyd1V5RFdM?=
 =?utf-8?B?L2oydHMrbFFsa3BJbE02cVdPTzMzZGtrSFFOVjFaUzh2ZHZWejRyaFJFVnVy?=
 =?utf-8?B?WVhoMXp4TTJTQzZTaEYwc2MyMGRhT3UvR0IwNTVmbmtmYTZmRDVpbDUwTCtC?=
 =?utf-8?B?R01objY5cFZWbnBhaEFYY1AzMXJrLzN0ZXpCZ1gzRW9kcWdEazAxVjlZUXdD?=
 =?utf-8?B?enRLZUUzSXNGZHl2Nk1IeUpFVDJWVk5JZEVkdk1VV00xTlZwaTVNZ1hrN3lH?=
 =?utf-8?B?WjIzSmY2ZFpyaVYrcmpRaE5kVTJHOEQ0VlBNRGJOdmU0Q0ZaWmJ2WjdJZjVS?=
 =?utf-8?B?dnpkd2JrNy9mR1lDa1RTTWYyOTlIcUV4bTZseU9TcTBsMUI1NkhiblFCMUR2?=
 =?utf-8?B?dElhaVpZVDRib0tIQjNRZUdYOC9oakpDYWI5cDBQd0RoNGhXSVp0VmloY3Fu?=
 =?utf-8?B?SFlZSXlnNCs4THhnamQ5NHh4ZFJOaEo3cWNFRXdPMy82VWFJTXZ1d2UwTWtP?=
 =?utf-8?B?MDRXWUpDMGZPSUdXeUtWaFM3UGN6T2RZaFpOSm1EamR6OGk0SG4rMGZUR1Nz?=
 =?utf-8?B?OEtldm8xUDJvRVFiOWRnd0ZvU0RlTXdRMTFHYzNvdzZpOFYyQ2F4M09vOGtC?=
 =?utf-8?Q?f6148VFLVzBU5zUiOJoVrAmOx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc04183-980b-4428-375d-08dd8eb4922d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 04:47:15.5456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtjAAz6fuHfZxpt+uW8k1naOpJqbY+uv4E6HifmU1JvEvJ8Uk6i70P4IvkkMGptyp99Qdw0tZgylA/JNhTt7lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8736

From: Peng Fan <peng.fan@nxp.com>

Kernel warns about mutable irq_chips:
"not an immutable chip, please consider fixing!"

Constify lpc18xx_gpio_pin_ic, flag the irq_chip as IRQCHIP_IMMUTABLE,
add the new helper functions, and call the appropriate gpiolib functions.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-lpc18xx.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-lpc18xx.c b/drivers/gpio/gpio-lpc18xx.c
index ae6182cce7234166fe94ab0c8d5e07c11bb71101..a2e316d9350b736e8bb89c17845d70cc74481d1b 100644
--- a/drivers/gpio/gpio-lpc18xx.c
+++ b/drivers/gpio/gpio-lpc18xx.c
@@ -42,6 +42,7 @@ struct lpc18xx_gpio_pin_ic {
 	void __iomem *base;
 	struct irq_domain *domain;
 	struct raw_spinlock lock;
+	struct gpio_chip *gpio;
 };
 
 struct lpc18xx_gpio_chip {
@@ -74,6 +75,7 @@ static void lpc18xx_gpio_pin_ic_mask(struct irq_data *d)
 {
 	struct lpc18xx_gpio_pin_ic *ic = d->chip_data;
 	u32 type = irqd_get_trigger_type(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
 	raw_spin_lock(&ic->lock);
 
@@ -88,12 +90,17 @@ static void lpc18xx_gpio_pin_ic_mask(struct irq_data *d)
 	raw_spin_unlock(&ic->lock);
 
 	irq_chip_mask_parent(d);
+
+	gpiochip_disable_irq(ic->gpio, hwirq);
 }
 
 static void lpc18xx_gpio_pin_ic_unmask(struct irq_data *d)
 {
 	struct lpc18xx_gpio_pin_ic *ic = d->chip_data;
 	u32 type = irqd_get_trigger_type(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+
+	gpiochip_enable_irq(ic->gpio, hwirq);
 
 	raw_spin_lock(&ic->lock);
 
@@ -149,13 +156,14 @@ static int lpc18xx_gpio_pin_ic_set_type(struct irq_data *d, unsigned int type)
 	return 0;
 }
 
-static struct irq_chip lpc18xx_gpio_pin_ic = {
+static const struct irq_chip lpc18xx_gpio_pin_ic = {
 	.name		= "LPC18xx GPIO pin",
 	.irq_mask	= lpc18xx_gpio_pin_ic_mask,
 	.irq_unmask	= lpc18xx_gpio_pin_ic_unmask,
 	.irq_eoi	= lpc18xx_gpio_pin_ic_eoi,
 	.irq_set_type	= lpc18xx_gpio_pin_ic_set_type,
-	.flags		= IRQCHIP_SET_TYPE_MASKED,
+	.flags		= IRQCHIP_IMMUTABLE | IRQCHIP_SET_TYPE_MASKED,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int lpc18xx_gpio_pin_ic_domain_alloc(struct irq_domain *domain,
@@ -249,6 +257,7 @@ static int lpc18xx_gpio_pin_ic_probe(struct lpc18xx_gpio_chip *gc)
 		goto free_iomap;
 	}
 
+	ic->gpio = &gc->gpio;
 	gc->pin_ic = ic;
 
 	return 0;

-- 
2.37.1


