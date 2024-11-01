Return-Path: <linux-gpio+bounces-12428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 053249B8C8B
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 09:06:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 288541C21662
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 08:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887F2156238;
	Fri,  1 Nov 2024 08:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="stjO0i5z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2085.outbound.protection.outlook.com [40.107.103.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A83E154435;
	Fri,  1 Nov 2024 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730448405; cv=fail; b=uG3muutlBli7Nqya7VeJk7oK1NbDFsFB0F8eqcn+jHQVnQTVUvTo7FTCAylCBN/a9U/61Zatqo/SuOZXvGDS7hL90zZmW5WFsJvyjj3VOLCiZsN771L5zLhtusdZAByrtqCBjCEVaPiU2/m+tLDMSal4WE3nZy33J0E0q2e4oFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730448405; c=relaxed/simple;
	bh=g6RzDbHZ/y9BVPrx560rhLL1OF10SotE1N4lDzQglJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FBubvdWwCxUxLA1Kr3q+PrfFF7lBi75+PeJxi6JRxBOy9fojbtgF63mVaCL1LNHO3vHQIKfDTDK7OF9UU0NTB76jBpAdX9+PYPt24iw8qKOejloSjb3gNsI54n37SQGCd+0lvopUkCVCKFACcM6qW3B9ohKdjv36adk+/tuzEd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=stjO0i5z; arc=fail smtp.client-ip=40.107.103.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cs+ReE2EwLuiHMJqK3UCPbBV/h6/KM3xi7GWbO4SQLY3ulEpI6UEEwNkz7H7bRDVqynrXQv+9mcfR0tTy8NkMXrwioWeZHlaCsBjmbzYjRAFixIR89jO1ZiB1wtiTjTOxkDbcLvs7ovuTfCfiIUO6WaGnRnqLqIky4H1IDWBx8jLVo4w75uFSC+KFVi3ZXlYYUw/GH7l9/h9j0b4L9+PBKL1mVhTxHRw3xpZyH2Z7IUWj6nydVgmVuPlsRJSGxJrHLEteBaFx0YwOQIeitI7kALn4hmr7QQ7//Rw7XSmjF+ZE7kIsvgwKCP9tso0JM3mwD8fYpuboCqd0H3J0PwfQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pubkBPk1uXBfYVaxzWL1vzZ/BQpe/hnw7a9BDzAE+BA=;
 b=x4Xuh7mlZ4PvTM10I4PAVdtbhXqa8017pcATkBcs+0qKdKN5czEz1we5LgD7XOsFG//xSdLB6fEX/+8MFECYVSnM7xE36CLRlkzMQmJLI+T77hOb+X1tNtwCKQFTQPlikSDzHzyilJrVbatj0SZKvg4xSpI4nxqNZ+uMLh+xlJbVLE0Fh2PsOSWE542mY7GAb4JVtMTul4aijGt0O0O5CiHY6KFzz92GDRqHJkJgKszMyU7OLj99P1xHHbX3lkMFxZwFUVFOTg7v/VI6IDacEo2YbxJiMniEQZ1acP3LWWLcbWqH89uqTMqJzJ90/7BAbFeGV+WCB69aRkjas0CP3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pubkBPk1uXBfYVaxzWL1vzZ/BQpe/hnw7a9BDzAE+BA=;
 b=stjO0i5zMReo+dNM2oeok7k1PUiVp4yyvfUKQAIkeSKT5S2pCrnACQg8sNj0ztN1LgxEpWGvCHXKf62Fg20F8IJteEEsJ6kSdfoCoVhg31EzTZVLIsshRXTUWRLZVVDWi/DwAlGfozGmPgkCsu4fS2YVfeKDldHKLfODWIyLhLrmr3Hqev6AW4/f/Q6nr4kIMhWVI4M8WAid1dj5VxKRdFhedGkTzMcyN9gOQSxmeKpWKqD01Z0XAjVF0gNRCnB3FZ/NpT0IAdSW4uWq6eo2cop3ntHA1PmMwVm0nuse/oBlNg265LScfPXFdPaeHy0WFuMdZGH5fJwF0BQF7GKWlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by PR3PR04MB7225.eurprd04.prod.outlook.com (2603:10a6:102:83::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 08:06:37 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 08:06:36 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: [PATCH v5 0/7] gpio: siul2-s32g2: add initial GPIO driver
Date: Fri,  1 Nov 2024 10:06:06 +0200
Message-ID: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0115.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::32) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|PR3PR04MB7225:EE_
X-MS-Office365-Filtering-Correlation-Id: b44413f6-7e0c-466b-26c6-08dcfa4c1b3a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|366016|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QzNTWmZxZTJaYzEvQ2JSQWdjU3BmZCs4MnNTbVVTMzVTZmI5V0paVjVSNlJr?=
 =?utf-8?B?Z0NXOXc5Vk5lZ2o3d2wrSXJJcHJFdjltQjZrTnRqSWkybCtPWXJxMXVVaUFF?=
 =?utf-8?B?U09rTmZucUpFYTRPdldOZHE2VlR6WXZiR1lNNGwraDlZV2RiL2JZS0FYblZ0?=
 =?utf-8?B?ZmE0Ly9CRGZnYldwRE9YNDg3Rng3QTA1MnJ1L3VZa1Ftd2E2SlVhNlZIRW9x?=
 =?utf-8?B?aXdqSm9iSFYrL0lpQTdWdHVxQ014Z0NObEtwOFFjRThlY0Q4WmR5YVRNdlJn?=
 =?utf-8?B?N1NZOE90U29WWWRPdG5oYVIzTzVWRVFiQVRoLzhOVTRBTnJPYTd4VUFiVWh6?=
 =?utf-8?B?d014YldaVDFBZDAxcFlVYnVOVW45bDBIZ1NVYysyQyswZTllSjlRVkt1cE9i?=
 =?utf-8?B?a0hwd3lTSXBOUFBMZ0dNYTdDV2pFNmUvYWNicVpSeDRqQmxidFRMc0Q3c2ZE?=
 =?utf-8?B?Qm4yRlZMODF2Zmc4c3UrZmFhaTVObVVtWnFYeXJONnZmUnJwQkFwUWJlM0tn?=
 =?utf-8?B?bTdvQVNzRjBycjdQS2JQRERkbUY5aG9Oa21lYUtURDJibWpOVk01SGtycXJE?=
 =?utf-8?B?eGV1YWcySUFRbmJqNzk0S29wa3A0cjM5RDlRclVZUUFiS3VEVXNsMUNyRXhm?=
 =?utf-8?B?S1p2dE43T1hoVC9JNVBDWnMyWDBrYU5NeXhpWk1nM1RMQTdCRTNCTVVPd1Ix?=
 =?utf-8?B?Q2s3dmxlbVNYME5IcmpJNEhkUlYzUU5Canh0a296U2RhOVV2Zm9FL3ZQSGI3?=
 =?utf-8?B?a2s3ZEIxdUt5VVczQkVDU3FpZ0d1RzVlQWNNYkttY3hUS0EzT01xWlNjcVNS?=
 =?utf-8?B?dW9qSTBYOGc5L3dYSDNmaXR3b1AyRXhlMDJHaXRtbHgybjhzdHBZTUdRUXNY?=
 =?utf-8?B?dzNLRFh6U1ZrYVI5bkNwSTBmQ0lWTm9IYWxlYzNMN1RaczRySm9MbFhZSUpr?=
 =?utf-8?B?M2MxelV1TmNZYlRMNmxOUzRuZVZwZFA5VU0xQ3FJeVpCaHNmVm5qS2FOY2R5?=
 =?utf-8?B?bG5zbkE1Z1pwVExkWm83NFZKL3dGWFB4Nmhzd092aGdrMlRoODdSTkZtSTdX?=
 =?utf-8?B?L2FDTE5HdmJaUCtZYXRJRUV5SjJPL05saldHMjI2QnNZbmhSMzdFUTFRb3U2?=
 =?utf-8?B?RThXTWxxMldHV0M4YUYyRUVHcVl2Sm02QWlrOHR2WXlnR2g5M2UvVzlkS3Jo?=
 =?utf-8?B?TzNlWUZxZjQ0K0Nsdm14MXl0UTZXM0ZFenBqdURRVDFyc202QlFVRTZsMVpI?=
 =?utf-8?B?TVhaekg3Y2loYldpTjJyeWxPTG1kUTZSRDltSy8zUzB6d3lWY053eWIzZHh5?=
 =?utf-8?B?Z3pDa29XS0lDVU1mQU9lbUtyMFFrcUN4SUtOMVoyZHRVY2dmd1FNb3FPM1c4?=
 =?utf-8?B?T1QyWlVDdnVtcFBrWjJwR1k2RTN3T0E5bGtoTGsraEoyelQ3MDRPcEh0aktR?=
 =?utf-8?B?WXlNOEtKaVRCVFZWelc5Wk1uR0pKK0VyYlJQZnNzZERpdFd4WnQ3MXNwMG0w?=
 =?utf-8?B?MnU1TjkrdFRheDlWbmh1Ni9iMEVWclp6a05SR1p0bmZkQklWOHg2V3kvN1Ry?=
 =?utf-8?B?VXY5VTBwR1VWODE2ekFpSlZPc3VjN2xVVWRmNmVEMEdxWTJYSnhQU1pzNzJW?=
 =?utf-8?B?WFpoSXk4UURxOERpRlU3anlMcm0rU2lCMUYxZE5IWkVJNGNWQW56aTNyc1c5?=
 =?utf-8?B?aGgvZERDU1phUVFZdzNhNUh4ZGN2bHZlK2x5bGxVTHdLR0JhUHhCbGNKM3Vp?=
 =?utf-8?B?c0JCWkN4ZFMwSnZEeExTTStUbS95Y2h5aHUxcDFmalpON1Y5MFpSdHFHSG1H?=
 =?utf-8?B?a0xsb2FtcHNnQ3Y2UFFRR1RIMktadDUrVlkwcUh1bWVYVWQ0dXNnMTJ6dmtp?=
 =?utf-8?Q?WDVT7/+fnqlHr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(366016)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekhSTFFCMTFBQjNhZWMvdnVlMzdrUXVEd29YUHhJc3BNdzh0d09URXBjays3?=
 =?utf-8?B?M0grdVdFaHBkSCtRdHNuMSs0WDAvUzdabktsaUIzMys4KzQ4Zm5JbjA2OTdV?=
 =?utf-8?B?amd3TTJxSUpCSE1jeTJybXoyYWVRQlBOLzQwTm1QZ1ZqTUM4aFB0OWxQd21Q?=
 =?utf-8?B?TFlVd0tWUHV0d2Y1YWt0K0ZIRUhPOGM4akJpOGY1Q1Z4ellkYVJQcVNpZGxm?=
 =?utf-8?B?bXhqbitHSWRuUmlNb2wzc25MZWdPQTdYdGY5R21LdFd5RGpiNmRrcEh0YTIv?=
 =?utf-8?B?ODFkWE54U1BLbm93THNJVC9XdU5tbHFvb0tZYlBZSVNsOWxtUXlOek1pUlJO?=
 =?utf-8?B?MG9lZ29odnBrbHNjSUQvQXNEdEJJV3M2WkcwSGdaM24zYUtrRE5IUnRTMHZv?=
 =?utf-8?B?NTdFbVRiOFJXZEZxMUFCUEZqbXR3WXV2YkNDSlpSa1h0QUgwWm8yd0pMaVRC?=
 =?utf-8?B?L3paenl2TG1xOTgzTXd2TURiaWpIVVR6UVN0TnowTjUyUndrMUQwMEc5YUlM?=
 =?utf-8?B?TGVkSGVScGRyaHJZZkJQVU9hR0NUeTlveDBZVzV0QUVpdjRScjV2cjJ3Nkkx?=
 =?utf-8?B?STdDaDdoSFBjMklxUWM2OThTeFU2ZEJzTzA1MTNQYml6RmM5L0ZKNm9FV1Vx?=
 =?utf-8?B?dzVxM05pTWsraGE1N2xPRWZrckpuOHZ4cnVzSUtMTXptYTFqc3FMckJXdlgr?=
 =?utf-8?B?S0J4eURaRm85Ym5kaDlhS1FCdHM0TStTLzhYbUdYWUdsU0lwVTRVZ29UeHpX?=
 =?utf-8?B?bzlVWkhqQjRndllwS2ZOTThJV0tpYkUwckZIaGhWWUhvc2xiejRoREcrcjUy?=
 =?utf-8?B?WXJEakhjaU5pMVF2S215MlNZYnd3ekY4emRYM3o4UTB4amhwUmUvUGc4WEhl?=
 =?utf-8?B?bFl2MXNmRmM5MkhMSm0wbkhlQjc2blJuRjVmZERhb1BvOWQyRUZFZnk0dU5z?=
 =?utf-8?B?Z1hucHY4RmlKWUdUMnBMY0ZaR1V0SEwydkNkRkhnai9ST2FSYkRDUmNsbFRJ?=
 =?utf-8?B?bmtwZHFDeVl2SXZEWTNnWW1YRmFNdzhkNE50K0Fmc3ZKMGVHcHdWZXlLb1dx?=
 =?utf-8?B?NG1XRTVNSXV4cllQdHJVR0hVZWpTR0dxbWV0dVM0MG5ZdHRvb3J1UVd1UXdS?=
 =?utf-8?B?UjJTcjN1d0dMMHc0dVFvOENOYUlSYkhXcDQyWlg4M0wxUjNTZG5jTFI2NGRM?=
 =?utf-8?B?cThWNnhFQTZTNGF1bHQreWk0UUhPRXFOZGIwdkhTNmxHR3dQZXpnT3NoYnRk?=
 =?utf-8?B?MHhLaWZGd3NRNWVseUJ6MmMxRld2eUxrT0JJRjN2OHBSOEQ2NzhwcFJ3ZG00?=
 =?utf-8?B?OHJiRVI5WCs4bG1EM2tVSmdlTHZVbTV3Qzl5YlpZMkRmRXd2WXJ5YVgxQ2NE?=
 =?utf-8?B?WXc0UURRRFo4Uk96VW9MRWJTR1hUTU9Fb2MzZk5MK3ZJSktLS3QyZ2x4L2dp?=
 =?utf-8?B?emMwb1RrNlVGOXlvd3B6SUpMYk9UT1Ria3E3ZjF0c0lUZExwV3pYcEVDcW4v?=
 =?utf-8?B?OUtGbWdZWkl1R3BUWHh3dHBkRmFrcHFtQ0N1TXlJV1dJa29FOXZocW1CcVZY?=
 =?utf-8?B?Tmg1YjdpK3NzdVdnS2FzVjRnS0tqTnVuUmpRRXNRVWY5Sko3ZjZOOWg0R3Jq?=
 =?utf-8?B?VTQ0c1NFNUFLODRFam50MGZzMkpOK1YxcFoxcytISzdnOU5uUXhlaVRBZjdV?=
 =?utf-8?B?REhwK29jbXFSNmZQMjNIY2RNbTBIRnp5QWZGMDRydnBJbktWaVVBQ1VXalZz?=
 =?utf-8?B?bEhJOXBtc05tcWFHZWFJRHNiRUZjY1lid0lzZ3JBNXBubEc4Rm1nQ2VtR3FW?=
 =?utf-8?B?cjhSUnFaZGdveFJ4ZG45WWhqVHNoSmw0ZkxRbnAxclB5cUxDWHZwQy95TGcw?=
 =?utf-8?B?YnVHSUEwck5Bc0J6TFJITXpEKzlvMTQ0TmVnTTAxMmNlOThhK2JnZnUwTFRQ?=
 =?utf-8?B?eWxKbGM1YUZCK0VaNmdrUEgvK05FNXBpVHIzMTZKdWx0UmIwVWdBOHBCWVNW?=
 =?utf-8?B?ODRrNDd6aTBmM3c2a2xYSkhvQm5FaUdLdHRRV3R3VUwva29iRU5hZWZOY2c1?=
 =?utf-8?B?bXJ0bDJ5ZnVCRnFXQStwb3htRmdHSTJUeWpWWkJUWk1uTitwTkRmekV0d0JS?=
 =?utf-8?B?ZkJtUGk2Q2dCR3M1OHhmRVFSZytCNkFFak12a0JXMjgyNE9XVWFOb0srM213?=
 =?utf-8?B?dHc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b44413f6-7e0c-466b-26c6-08dcfa4c1b3a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 08:06:36.7756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnBlXegRNdw0daFzYcTerPoejdknF4EtzHM6Xf8LbWUvF31yH4tABNB60izZenLPs/YyfwnqBvzlagUn1te/XvQY1A/tad2KvHb6KvCsm1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7225

This patch series adds support for basic GPIO
operations(set, get, direction_output/input, set_config).

There are two SIUL2 hardware modules: SIUL2_0 and SIUL2_1.
However, this driver exports both as a single GPIO driver.
This is because the interrupt registers are located only
in SIUL2_1, even for GPIOs that are part of SIUL2_0.

There are two gaps in the GPIO ranges:
- 102-111(inclusive) are invalid
- 123-143(inclusive) are invalid

These will be excluded via the `gpio-reserved-ranges`
property.

Writing and reading GPIO values is done via the PGPDO/PGPDI
registers(Parallel GPIO Pad Data Output/Input) which are
16 bit registers, each bit corresponding to a GPIO.

Note that the PGPDO order is similar to a big-endian grouping
of two registers:
PGPDO1, PGPDO0, PGPDO3, PGPDO2, PGPDO5, PGPDO4, gap, PGPDO6.

I have other patches for this driver:
- interrupt support
- power management callbacks

which I plan to upstream after this series gets merged
in order to simplify the review process.

v5 -> v4
- fixed di_div error
- fixed dt-bindings error
- added Co-developed-by tags
- added new MFD driver nxp-siul2.c
- made the old pinctrl driver an MFD cell
- added the GPIO driver in the existing SIUL2 pinctrl one
- Switch from "devm_pinctrl_register" to
  "devm_pinctrl_register_and_init"

v4 -> v3
- removed useless parentheses
- added S32G3 fallback compatible
- fixed comment alignment
- fixed dt-bindings license
- fixed modpost: "__udivdi3"
- moved MAINTAINERS entry to have the new GPIO driver
  together with other files related to S32G

v3 -> v2
- fix dt-bindings schema id
- add maxItems to gpio-ranges
- removed gpio label from dt-bindings example
- added changelog for the MAINTAINERS commit and
  added separate entry for the SIUL2 GPIO driver
- added guard(raw_spinlock_irqsave) in
  'siul2_gpio_set_direction'
- updated the description for
  'devm_platform_get_and_ioremap_resource_byname'

v2 -> v1
dt-bindings:
- changed filename to match compatible
- fixed commit messages
- removed dt-bindings unnecessary properties descriptions
- added minItems for the interrupts property
driver:
- added depends on ARCH_S32 || COMPILE_TEST to Kconfig
- added select REGMAP_MMIO to Kconfig
- remove unnecessary include
- add of_node_put after `siul2_get_gpio_pinspec`
- removed inline from function definitions
- removed match data and moved the previous platdata
  definition to the top of the file to be visible
- replace bitmap_set/clear with __clear_bit/set_bit
  and devm_bitmap_zalloc with devm_kzalloc
- switched to gpiochip_generic_request/free/config
- fixed dev_err format for size_t reported by
  kernel test robot
- add platform_get_and_ioremap_resource_byname wrapper

Andrei Stefanescu (7):
  dt-bindings: mfd: add support for the NXP SIUL2 module
  mfd: nxp-siul2: add support for NXP SIUL2
  arm64: dts: s32g: make pinctrl part of mfd node
  pinctrl: s32: convert the driver into an mfd cell
  pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
  pinctrl: s32cc: add driver for GPIO functionality
  MAINTAINERS: add MAINTAINER for NXP SIUL2 MFD driver

 .../devicetree/bindings/mfd/nxp,siul2.yaml    | 191 +++++++
 MAINTAINERS                                   |   2 +
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  26 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  26 +-
 drivers/mfd/Kconfig                           |  12 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/nxp-siul2.c                       | 411 +++++++++++++++
 drivers/pinctrl/nxp/pinctrl-s32.h             |   1 +
 drivers/pinctrl/nxp/pinctrl-s32cc.c           | 498 ++++++++++++++----
 drivers/pinctrl/nxp/pinctrl-s32g2.c           |  23 +-
 include/linux/mfd/nxp-siul2.h                 |  55 ++
 11 files changed, 1086 insertions(+), 160 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,siul2.yaml
 create mode 100644 drivers/mfd/nxp-siul2.c
 create mode 100644 include/linux/mfd/nxp-siul2.h

-- 
2.45.2


