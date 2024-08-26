Return-Path: <linux-gpio+bounces-9172-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CF695F379
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 16:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABAC31C21668
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 14:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3AE188A09;
	Mon, 26 Aug 2024 14:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nHvuX3v3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010047.outbound.protection.outlook.com [52.101.69.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFB617B51C;
	Mon, 26 Aug 2024 14:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724681017; cv=fail; b=UbAzHpCAHNIHqJZ2DPOydHABhp391Ltidp0apVGKo2z0h3ZozFzCeaXBe7kartg2fUlz9Rk5CoUXAzjdI0zw1eCktTsPJkcu7PbFLMG3I9q3MOANsz2B4nCo2U+/iR75AlDVmVzO6M3wsg+OGiTNkQiW/diIBf9Vx4ePqKkgtbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724681017; c=relaxed/simple;
	bh=kFJznnUZ0s7gbnHyo+f2zbGJWRB235PnYuEy1wCVHro=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fOFcIk1aqhpmEQXNazvr765OCkpR+jwnat3FjBRy49CkBzGydmmDPLvKyCsh5ZkjXD/PGOTnO7Rqu89uPFCKT9WXE3hif00DldoLDoPISiyEX5RlaL9nmoOjN4xDaB2dEMh78m5EpRXrsir9nZOuG+WG29j+fUC1tgutFjXhVSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nHvuX3v3; arc=fail smtp.client-ip=52.101.69.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKE/8lYphdRlHqRq0hxTOWtV9uBikpZnZfE41mbQ70zL2amOHhEtyqdrxZ68Qr+R+AwEW7eF8B99Dx/xMvfS1/wzYWfhQWesYrBnQoxXMHGR4t4J4MyPhe2fqr0ifXufNbchd9xiXbue9f19Nmqf9RHOdn2B4qnX4z1pC+6ZOu+CjWWrgeWqWDzQIu5Z2dFooGuSuT3xCeh7OPz12BWc4NiSzkUcFw+w5Sugg3wUtMu97AkzrwD2yYARYIUQDBqj6RdrcZL1UcIp/tKDiD+j22PITgry+DM4nPwahkjOpTDMP1vmSGEbaixltOSpnZdxazRt+MavyoahX8xiL/9MAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqfzgaqJ9usN6L3ImoeFFlaUqJf5QvGd+WgllwDrGUA=;
 b=ofyqBrEWIiKwKOcVYjLr8mDCGOIs8n8H7ZmyW2GrEnYztf9RkV+sUAT9tbfW5KDwvvvIvxJPlOq3rHxljgjvPDxIaVyihw+MPw14QT2sKDG/prrvO02lHaHqKw7uA44y7cX4IevgXCUOlQzB0KPdUJWUdt9fCGtR6QEJslKk2id05RyB+sXZHIY+7HZXLqLxFwi4DjXdLmtVZE6XxTSdUTIKjEFnhQv34p6vKS0pCK8jmcofXyt6bTgkx74IisfDKYwbqugr2rbllDdY1eSY3YJuVLxxxtoMOlXqfXviS+ud/Lvro1NyVCrDM2AB8n0y2WZLE9yy5dY7rZtNwCRIEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqfzgaqJ9usN6L3ImoeFFlaUqJf5QvGd+WgllwDrGUA=;
 b=nHvuX3v3C/XiWKWn14zL/7toSwahVl1onVlylFB7G0peOTIezYzyOeF/YxTkTSso1rlHxQGex3mBCa8tvXkBqHn0OL5TXKAFlJm9ZqKW5hWpCU72xMmh1LV2gh7UC4VIIAu+S+aI/6H/rolcwUyBoxVKCu+EO8jvmQ21LFk03cNG3IRtDk66amhnZl/ibOrZTayCUE/UqugyhOLk/aLdEKeTuvBdAo0KsH0mA0xr61b2KRkC8EsBu/zxv2ODB4/Yz9r7NEgIpYxQCxxc+lelo9WJthiU4M1Fep50eGDHzQw/lO6EC5Q2cH2jdFt6H5OqJOcT0pa7v4IcFPw9nbqtGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DB8PR04MB7115.eurprd04.prod.outlook.com (2603:10a6:10:128::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 14:03:34 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 14:03:34 +0000
Message-ID: <daaec2b0-0eaa-4a54-9cf9-70ad9aee34c7@oss.nxp.com>
Date: Mon, 26 Aug 2024 17:03:32 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drivers: gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs
 support
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>
References: <20240826084214.2368673-1-andrei.stefanescu@oss.nxp.com>
 <20240826084214.2368673-3-andrei.stefanescu@oss.nxp.com>
 <CACRpkdaZbHsi1zeHr+HyUgfdCDHm1DaA1=peH8BjVSirga_sVg@mail.gmail.com>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <CACRpkdaZbHsi1zeHr+HyUgfdCDHm1DaA1=peH8BjVSirga_sVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0018.eurprd04.prod.outlook.com
 (2603:10a6:208:122::31) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DB8PR04MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b611f3e-1ffe-4ef1-0d72-08dcc5d7df99
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NURZdzROR25UcmNWOFFFMkszMFlMVCsxcXpFakp5d0R4K21jQmVYLzJkcWVN?=
 =?utf-8?B?bzBOVnZXWmFiL3ZmQkJvYnlYTjRXZjJ3QmxBdCtWSzJhdlVGUmFPbFNxUzAx?=
 =?utf-8?B?SnhxYitVM1NIZFNKUnFKNGVnaTNqMC80Y3hyK2lnTjIvbUpFZFBZZEgybWhm?=
 =?utf-8?B?bXpXK0I2Z241Q2htNXhFM3lWaGZ3eDZTcHYvVmRsKysyTG1saUJaUVBvZTUx?=
 =?utf-8?B?Q2RMdSs0MHRScmhGU3dUanhaTW5PZ3k4U3A1Zm1MaE10V3VFUVd6dW5pUEJi?=
 =?utf-8?B?MTlvKzlLNEt5eS9adGtGYU1pL0FnYzhVUE0rL3R3YzFDcUpUQ3pjcDZCOHVy?=
 =?utf-8?B?VHNmV2FtRUdNYWR6c0JJM2FpVzcyaU9lSjlXbEthZURJYjlYY0lpV0xIVm5q?=
 =?utf-8?B?UzZrUlFHeGRocHNLRVhWNkFJbk5QaVc0RHh6ajZrMU1Fd0dzVnFKVVQxTTU4?=
 =?utf-8?B?NXV2U0JMUEhBREVtODVKc0F1S0U3Q09jZG1EYnI2T2hubzVmeHYvRE5NYVZT?=
 =?utf-8?B?cVQ4MDZNWmtCMUhKeG9wL3M3MU9jcS9TbmRpZGhlQ1BuakdodmtUbXJrUnB3?=
 =?utf-8?B?V3ljL3pkcGR1VTlmNi81bDVlV2pXenI0eGl6L2JiRHdhNDVQM05UN2pFTTFC?=
 =?utf-8?B?QmZoMFNmbjZMbENxUEdGMmg4eW02N2R4cEhwbnkyaWdqczRYNUNpT2NabHNK?=
 =?utf-8?B?VGFpWDEyaXFkYzJaVnpLblhvSmxBeGZFTVNyUGExVTdPbTBWWXpodUZnazE0?=
 =?utf-8?B?bEJvYVI1ZU56aG40QkRnaUY3RTliSTFyMm5SNUt1elh0YzE1MEhqNGM4aW1o?=
 =?utf-8?B?MlFxbkltSkxmVmxNRE01ZlJqMkNnWDdpcmcxUkltdU1wYkFQNHp5cjdQUXZE?=
 =?utf-8?B?THVOTGZrbFc4QmxQUTBzcENEWk95dG9TaFJPMXhIUFh3VkVsclZuMmtZc3FS?=
 =?utf-8?B?eXZQS1hUOEJPZUpaQVRncTRSVHNRbmxONHpRSHJmRFA5aVJyNTJEMnlEOVF2?=
 =?utf-8?B?T0RyMEovU21FbGpMTElsT21ha25QeHJLaGsvYmI0eUI0WjZuQnA5Ujkxd1ZV?=
 =?utf-8?B?REEybXVwMkt1c2FiZGZqK0hqNUJIVkoyczVXcVhoL2crSEg1UHR0N3p0UUpr?=
 =?utf-8?B?WlRObnhHS2ZEOTVoT2FNalBBOWlvZ1BTc29IVjY1TTlDTi9BOFFVSExMSVJx?=
 =?utf-8?B?RittZFl6YXJKa3V0TStHOEJzeXZvWUN2KzZFNUVoNkI3ZFJkb1dGRGNFTWFn?=
 =?utf-8?B?UzJGYVN4dDFQbTNiNFloZlpkN1J6bHNrRFVPcG5JTHk1NGoxcWdJeUV2THFs?=
 =?utf-8?B?QW1LSzF5ZVVFQitpNEplWlA3RVpwWUtBWlNUTkprYUh6azhtNVpqNmx6VGxt?=
 =?utf-8?B?QjdTbzRCM0x4Z295R200alNpLzU1Uk90UXBxZnF6V3ZpTGRnNG9WMHBEdHJC?=
 =?utf-8?B?YWxuWWJqcEpaSzNBRjl5cFBXSDN0Y3QrT3FJN0ZyZEZtYW9zZG5idGlTeW5i?=
 =?utf-8?B?YXpCcU9vQXc5Q2tYQk1RYkVMMHVmYytCdW9hazk2VFRwQzQzd3MyeklxaHRX?=
 =?utf-8?B?aXZ0U2N6QzY0b2tEMmpLV2YxSSszVkhwMDhNT2t1ZUdqNDJXbjIyLzRJTnZT?=
 =?utf-8?B?dk1KY2ZDUDdKYkFiRUdUYWx0NW9OZ2RmTkdHaHZLSnBrRCtVT2dBeGhqNVNI?=
 =?utf-8?B?TVhsT0kvNktEdDRjYks0YVNLbFBhaDBScWZPVXhoejgyZ3AyeTdobGJxcWlL?=
 =?utf-8?B?REZEdnp0MFNFRk83R0F0cmNUcHRDdDg2NVJ2VHVoTThoc216bWNNT2dxQkov?=
 =?utf-8?B?UU1sSzIrVEg3RTdwd1Avdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmlOdEl3b3lON0laSzJuNXRhOEpPN1pjeWg0c3ZoU1YrQUl0YXdudUJLSmEr?=
 =?utf-8?B?L2hMN0xEaDlGeUZVdjBoUVQ1NDg3UE4xdzhkNk9qMHJTL0JZMjlwSk1ZNGVO?=
 =?utf-8?B?bFR4WmZEU2FoNUU0ZHFOQWE2Nit4WkdkbzRQOVhwZDhHSFNKYXFPRE5LNzhE?=
 =?utf-8?B?VzZkZ250czNEd1h2eUxVb0d2NFVqZm55Y05rMVZaTE95djV6cTdYR09STFpS?=
 =?utf-8?B?RzAxQTI0b0hpbVdhWXBHNHc3MTN2a01mRGJPcHRzekNTNm5Da2FDUWwyVmtS?=
 =?utf-8?B?Q2szbVU2ZitQeEZpbmZVaWNiVmIrMkdYMTJ6YzUxWG9uMGJPb1JBVmhsa3Bm?=
 =?utf-8?B?QnpQM3F4dGdkQUoxT2xqM0xuTzd2THBUVEN1d3hjSlFoWGxtUWgrdjdMbHZ2?=
 =?utf-8?B?Vnd3RlZyQmZ6bGsveUIrc3o3WFcycXR5a0VOM1V5VE5DVzE1dDczdm5qL1N3?=
 =?utf-8?B?V1VMc0pqYmZpUjAxMFJqZmUyWk5kTFc0bGJtRWNIL25qc2hNT3p2blplODFO?=
 =?utf-8?B?Y1J6Y1RORXVXTkNsL2tyZFZmczdQMWR2c0dFd081a2pXWjFXM0RJdFM3NFhs?=
 =?utf-8?B?TXhvK1drbWUrbVdsckVmYVVJMTRJZnM3a1ZIeWtnbkl5ZWs5MHJ4d3kwZmtw?=
 =?utf-8?B?VWkyVnFWaXpIdG51QXVOVklQTDNDVHI5Q09vSlRpeEJnMjlaQTA1clZXb2dF?=
 =?utf-8?B?ci9vcGdZMTlzaWRsbmpzMDdRbFRPSm5MZG9mVjRGVFZ3QWpJRjhoenpVS1Y4?=
 =?utf-8?B?c0pvc1BOTTl3eTk5ZzhZRmJ0Yk5lNVJmVHRmWUNOR2Z5LytVTHBKT2NPaXNz?=
 =?utf-8?B?ZlZxbnRvOEIyb25VTGU3U1JHTWZ3REdLVjFlSDlHai9uRXF3SFdzYU9lREl3?=
 =?utf-8?B?NWYrU3JBRTRoWHgrRlhza0dBdDlPT2toZWYyYmlGOEhqUFVaMVNxR05TQnRm?=
 =?utf-8?B?MXhCc0dEcnlFZVV4Nm9LcS8waEw2eFFXWkI0TXlDNndDMXVERWxoc2Q4MW1V?=
 =?utf-8?B?cmV2TVdJOUNiRkZ2ZUdDZ2RVenhzMVdkNTN2S0tOMjVSOURvR3JBZlAyV3JN?=
 =?utf-8?B?S3dhUXk4cVUxM25jejIyeFdETS9NZmg0VDVsUndVTWJybk0raE9KY3hFRXoz?=
 =?utf-8?B?cWxhTjkzanFPV2xhL2pLcnU5U0s0OHQvNWNZdFVrN0hwOE1OY2ZaZmZ3NE5U?=
 =?utf-8?B?eDZGcXpEd1AyU3NoNUdHai9ka1dCVHNkbi8xbUJmNUVZcjMzUzBGcWthd05y?=
 =?utf-8?B?cHgxdWkweGVNenZ5RmtWVWo4d0FaSmdDSENnNzJPRVoySDNxMkl3OVlwVk5P?=
 =?utf-8?B?OSt6dlNpZ3lVYzFjQlYyTUJVMnJRTDRYanlTKzk5UTdyWFkvOGFmMGljNWMx?=
 =?utf-8?B?VFp0T2h1OWlObXVLOEpCTCtkUHBBQ3YzTHcvNDUyL1YyNDVPTGpyNWpXUHRH?=
 =?utf-8?B?SWdObmZXb1JQaktWOHJ0cVgyaTBGRUkxUHhvQzdaL3dsd3d1ZjMrQWw5Q1VI?=
 =?utf-8?B?OVpFVW9uTmp0bmw4SzZPN1pqR3BQdllraEM1eGwwYWhiQUQ3REJhbXB0aUps?=
 =?utf-8?B?Zi9mTkJDYzlGZEVGdjhwMHBwNWFDZ2hYQU1VaHczbytFQk1PN2JLRU05b0s3?=
 =?utf-8?B?d251bnJjZzkyOTNyNDd2WWF0QVN2eFJuazB1dzVOQkRidEhnQnpRcFRLZFli?=
 =?utf-8?B?eFJOcWdmK1lvUmFsbXFOaUlKL2dkR2hYZzRnZ2VqYU9FK08yQ3QzMjFIMWZk?=
 =?utf-8?B?SEVnWm4vOTRaVk9VSjZweEJCTkhzbmZZTVZjQkRSRkQ1b1dGZ2pXV0dQU1gr?=
 =?utf-8?B?a3ZqcVNUNS9sY2ZjRUFsZm8xM2lQQWdmbnJraFFpL0V1KzA3ekMvOVd4NmR6?=
 =?utf-8?B?MGdYWlBqVmxSWHpBdXZCdXFuVnZ2ZEtnVUFxTDNmaHRZQlB4Ylc2UjQzS0xI?=
 =?utf-8?B?RTR3enN6ZUxCd21kSjRYRTliV2l4cHQ2S2liaHRSVmJuaktZS1Q0UEd3Wkdp?=
 =?utf-8?B?ZVc2Y21mZGRndWJLTnNtL1kzOFhGVlJkYzU1Zks0dXRBM2gxV2dPTU42WHNp?=
 =?utf-8?B?UTd5Q2tiNW0raGpJUTk3Q2pnZVdFa2VtYTg5WE9ZTWdDUDVWZU1vLzk2bVVs?=
 =?utf-8?B?TnFFZ0l5bTFJTENIVDdER1NJbmNkV1hPZXdyamllbkdjNmYwUHRwemhZc0FL?=
 =?utf-8?B?UHc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b611f3e-1ffe-4ef1-0d72-08dcc5d7df99
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 14:03:34.2251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PeVtV0J5KlCp6yghywBmP3tuhdGoW+c2Itp495m+CZSXFA9VN2MquoQz6yhFcGF+xC6BhlPZuTRm7dPpEYssVdga6XK+AHTw0ivy45WZMQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7115

Hi Linus,

On 26/08/2024 12:42, Linus Walleij wrote:
> Hi Andrei,
> 
> thanks for your patch!
> 
> On Mon, Aug 26, 2024 at 10:43 AM Andrei Stefanescu
> <andrei.stefanescu@oss.nxp.com> wrote:
> 

Thank you for the quick review!

> 
> As Krzysztof points out: the driver is based on something really old and
> needs an overhaul. Luckily GPIO drivers are not that big so it should be
> pretty straight-forward.
> 

Are there other changes, apart from the ones in this email and those already
suggested by Krzysztof, that I should consider for v2?

I will fix the other comments in v2.

Best regards,
Andrei


