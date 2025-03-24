Return-Path: <linux-gpio+bounces-17893-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0DCA6D51D
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 08:33:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 416821892519
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 07:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6772512C6;
	Mon, 24 Mar 2025 07:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Z5Tgyrdr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013040.outbound.protection.outlook.com [52.101.72.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6102134D4;
	Mon, 24 Mar 2025 07:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742801594; cv=fail; b=YwwoDWb//7s5PGVRKjpmQ9EM/thGVW38MsxmYuPN+/LfStw/qqKNCwYwQGHxSLuwbmke3587rbO2C84dL0McctoJjBM1UKJkUrvzVg+NQF55p1Ts6QbcFP3hvbmFITGS2Q6xEreYWLW0VG/ixOi3FXCpW7v8FEqbNrGxEEo4eTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742801594; c=relaxed/simple;
	bh=E6JEO+tVJaf8/2PeRBoTa85lyDLem2RfDhRG3YQGs1Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QRpC6S/V+z0S0Aw75HxWDnpEFE9qA/+UUR5VvESh+fLOAQfwWexv8o1RyM+eIf0gz23mUGAMz/S04EWbR8+IojJojmmWc7DqNp2wr/pJXe7SKVQlbIbrW4otMPFXMggzVImEOqXnwUt4RdP6tH4g+6wX72FMOdAqfyEJxvLEjEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Z5Tgyrdr; arc=fail smtp.client-ip=52.101.72.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p29B6XMmxEzR2vJMAr1wvqvcYCjkraGUg/wovoGbDbvKE88OnNory85L7l/GbiQ8jgUpnEfLHado8FnogCxW9BirpSbOxEtXWWU+43SraScanTodMUaFuNd7/uz2IywGpSvU8lhNCwe1fmb+Qkpa56t7Yvq20UskLppAewa92l/WS3040c5FDZ4Mja7Q/javorLaU2Ff1Zx1I9/xkDyzdUILAIt5mOQotIWr5VRtCa2MCSCpr1OdAjBESzppi4GmqcN6trUUKQoYV/1R4t8Kxid81uGBgTtW4RQz60xDL/0szB6qXwD1qZlyMggXAhd25xoKhr6VXd2L0bMLwJ/1nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6JEO+tVJaf8/2PeRBoTa85lyDLem2RfDhRG3YQGs1Q=;
 b=ZSl5J2qKkoQ+3fLMf7z9QQjSL1PXfDK1a6Ijm180PdGIfA+Ft6/oiYmbK72OVivHVmRYalNy5SEufZK4YLvy3/RG30r/3yH7BtmEdBuqYYLa4AroqNc45CAZMugzlNU4CMjo+tXb1rGF5vLgPcjIrZPYbRIXvNxUqCIQb5SHoP161dncgm/Uo5ftx+3VCt8mBtloJzNUdus8HgaUQOGRfy7Zqqs+hm2V7Ctv1+Ldhojq9Yc942/Deuvs/2q3ExsaIwriS3UvnjxY618ZvzCMzTmVeegV1GgWoi7jY5Ez7Efim0/CRPcB2224/STf202oJTHgxMDA2giWVX9ERZGamg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6JEO+tVJaf8/2PeRBoTa85lyDLem2RfDhRG3YQGs1Q=;
 b=Z5Tgyrdr1CCu05ie0Ry8nT8RsUJbxNd4cdQ19B1NP3dY5mIQWm+JhF9jC6MYxlY1OP+66qrL/jjURjdRFb1aUZyVUzIIM2lyzMAOUkPeGjPlKGgOrat5mTTs7MO63LBEUH7eRxK6gbhP+E7h3g3V+8gWBOQF13dJ4DsjdYDLjU13xdU91WUmICVpdLFJTeAKkQjXTGq3pd2vEF+db6Sn7AWyb3cFx5WMjBKN2KDdGqk/OB76F5zBa7Mre5oKVvdD4diCL5yuocj3GYHxxrXo4yIPxpWRa+PexBDM+YfIZeNuAxzj0z1INAlZ1uDs18y/f1PxWMhnGuiSZXvpYjtSTA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VE1PR04MB7229.eurprd04.prod.outlook.com (2603:10a6:800:1a3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 07:33:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 07:33:06 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Steev Klimaszewski <steev@kali.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: RE: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
Thread-Topic: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
Thread-Index: AQHbnGRhRMwe0OLhtkis9ybXJA3l0bOBpEqAgAA//SA=
Date: Mon, 24 Mar 2025 07:33:06 +0000
Message-ID:
 <PAXPR04MB8459D61091A8BF9ABD94DA7E88A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com>
 <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
 <CAKXuJqht5ZiFyt2uWXwPSEdszYQWKHm22+mAQCPQXn8b7AbL-w@mail.gmail.com>
In-Reply-To:
 <CAKXuJqht5ZiFyt2uWXwPSEdszYQWKHm22+mAQCPQXn8b7AbL-w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|VE1PR04MB7229:EE_
x-ms-office365-filtering-correlation-id: ddec88c7-1475-4f01-b848-08dd6aa61ec0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SXpKN1hQbU5xVGE1QVdBOUUrbm5XenB4MmpmTWxVTVl5M0Z1QXAzaU5QYUJp?=
 =?utf-8?B?OU9tNUovV1g3YnFRclFpZ0JRZTQrT1RzQWd5R3V6RVpaVHBsWHlsR3hYVi95?=
 =?utf-8?B?RUlCaEFBN291cU1uOEJrL2ZHS2pIc1FtbzFqUXFqN0NFT1c3Rk96UTVQTnFO?=
 =?utf-8?B?b3FRWnFEUndPbER5SXVML3ZwUFZtR2pFTkdpcUFpOVppTHd0UnUwcFJRaVVV?=
 =?utf-8?B?WnNwT0FUV2pMelhTZ05ld1dzdFNralcrYktlK1NUUCt0aWZ3dUg2cldaMmF4?=
 =?utf-8?B?d2s0VnA4dHoxNDNoM1BNRWE1OUNnNk9MS2xuZHUwS3dzdUNvWjJtYVR3WWpl?=
 =?utf-8?B?V0ZOdTBNMEtGanBPTmE5b0U0YTVhRXI2NjVEemtxdE9WS0NGenZxc2c3NXp2?=
 =?utf-8?B?b2IxdTdzcVA4MEhJa08zMmVwWjNTZkp2M202R3lPZWtDeHBPRHhhcDhtY01N?=
 =?utf-8?B?Yjl5SjRvdFE2b010WnFnYWtBY1g1NUViYTZleW5YOWdKSElrQzdxemNrNTZ4?=
 =?utf-8?B?L05vNkI4QzdMUklvZUVlWWVIWWRpcEFBV3FuYUZVd1JRTC9SSk5HSko1UXU5?=
 =?utf-8?B?YndGUklqQys4WVpjWEk0ZDB1b1Q3VGxOaUttSDNqRlN6VjQzeU5OcHVVNFVl?=
 =?utf-8?B?RDVGb2MrVloydlJDTHRVZGlaNTVVZUxKcWxTOW1UNVdkNEYvejRLNHMwR05s?=
 =?utf-8?B?cFJNL1Q3M2pFM0JjaFEwRDQxY2pkMU5IYmExRXFNNWNjdi9UUlZvNDFHSTlv?=
 =?utf-8?B?aXhUYTVDbzR5UUh0dVNqbVZQdkJmTGg3dy9saHNrc3QyM3lNNW9TNTY5NkY2?=
 =?utf-8?B?K1FpeDhMRkdSai9zdEMyUkg5TmJraWt3andKT3F1RXFmYXZHd1ZuSUVJZjdK?=
 =?utf-8?B?MkFlbkxKMjRvZW5aclBvVTF4K3JjdkU5ZTN4cmhZQUFoTmY0Q1ZJUGlGK2c4?=
 =?utf-8?B?Nm1OYWJGSWZnblRVRWhsSTNCNTVWMzM4ak5hRG1sZ05KS2lMd0hHTVFZM2JS?=
 =?utf-8?B?QUJaRThFK3RWTFo3UkFNRHdEWFNvT0trNnZmazVNb1krSlo5c3JLaCtreXk4?=
 =?utf-8?B?aVVKQlo4dDR0QVQ3MVFQNCtXN2J3K2VaWC9YOEhSN2t4d1BRRzdHN2tOWDNE?=
 =?utf-8?B?ZGpXTk9QL0FsOE5ZbFc4ekI2S0UxRTBIMkE4VUtteS83RGJ5L05PcCt0V1Vo?=
 =?utf-8?B?d2VIQzlpaU5rR0Q1c0Q1cXB2MmdnMUJNUVJxWk1Tdlo5L1F1a3lrZ1JEdVl6?=
 =?utf-8?B?R3poUktJd2JMbU56NHdNcmxDR2FLeUsvY1A1N3E3djMrS0FybU1jT2dUMU1v?=
 =?utf-8?B?dkNVUFNSQVNsMmdDc3V0eDhXT3BTSEtkTlBhUytrczNZUERZUWRNcXl3ekZl?=
 =?utf-8?B?OWI0c2p2WllUelM1VitBdFlUYTE4TXVEeTJJa25JbWozckdYdWhTay9qSGRT?=
 =?utf-8?B?TXhIcjgySVJCMW5XYzlzWmZSR2J6R3c5VlFCNUdpWis0OTRxMmtGb09pV1VS?=
 =?utf-8?B?MDFGNE9zNGkvaUFheGtZa3Z3cTFHL0d1QzgyV0d4SjFrbEMzWmk0THJHWkZ2?=
 =?utf-8?B?VVAwTXZxWU9BYmZLRENreGxFOTVTdGZQVGNOalhFQ1A4ZkJySWFmRTlldmsv?=
 =?utf-8?B?UVJpZzVDTmFmZEoybXNZM3VxYTRsYi9CU1FqVVJwTEJDVnlOY2FlTE1yMXlp?=
 =?utf-8?B?OFZBc0haOWRJdGphODQzOXJwZDZiMm1TTXVjU3ArTEpnU2IrUkdCYjZkbVhM?=
 =?utf-8?B?Sm9DSkVxWFZpVWJ5SjBQREJYVDIwOFZTQk5BemZPSHRmTURIWnVEQXcxbWZX?=
 =?utf-8?B?NHhKbC9TSjlmYUN5UTlGOXdpQ25wUCtmWVk2cUJVMHIzTnF6NjI1d3RZVnMw?=
 =?utf-8?B?dFRGa1VGNzkyekVZd3VhUzFBdlR1WmdQcTNzVGQ3Z05SSVk5Qm9KYTBwS1k3?=
 =?utf-8?Q?ITVQS39i7b0Z+Yd8C26HcOdVb8O05u+L?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?elZ1MHlVeGM2aXhFNGdwNDdvWnliWnRlNE0yVHhpOTh2SGVZQmhXNUVxME5G?=
 =?utf-8?B?ZjRoMDZndEJLZDBDK3lXaTFVNTZsVHdaQ1FIeWxoaVZ4VTNvY2Zxc1JsaUZY?=
 =?utf-8?B?c1JCcmFZYjI1NExVRTRuTEZkWkQwU2I4U1ZIcS9TUlkyOTlZekFtTEkrcGgw?=
 =?utf-8?B?a252cTVpejZ2dHRCOW1BSTdQVjVBR3Y2MS94WndmTGNCaVpId1NxTHFUVHB4?=
 =?utf-8?B?WUJ5OVNOaEZRZS9DbFdFSkJsZ1YwTGFQMXhXTU1uc3I2MHVwZ3FSQmVEWkxz?=
 =?utf-8?B?dTlQeXVKVVRwRGZDNGliUnByQ2h5L2pFU1M5RkNoL2tBdXdncWFBZ0UxVDdn?=
 =?utf-8?B?aHU0QUFWM3VWWEZyd3hjekhyeUpOWk01aFFKMmkzd1JvTTNDM2VwMWNTWHFT?=
 =?utf-8?B?K21LNi9tV09HVFVuSmxtVTc4UXpLS2g5VkJ1SDBnWnNIM1ZSY2lNS1BMMTZL?=
 =?utf-8?B?N3dzcTJibzFDdjhKQWtCSHRUUWNtUGFCZnJVMjlpcTBBdTIzQVEzM3NhNFc2?=
 =?utf-8?B?em01aTB1a3piUXROakN2UERxZG53eGd6TnlvN3E3UGxpcmJZalBJbnh4SHlv?=
 =?utf-8?B?RjFqNG5GTGhkaDlaV1FwMVJ3KzNwbzgvdXRJeGVjcGtoZjc3UnNVSkZyTUdr?=
 =?utf-8?B?YzRhYzFkVmtMOG9jTDFldi94QUt0VGFtbGpSQmpXb210MzJyekRjMm9pcGtT?=
 =?utf-8?B?ZDVXVWhuK0NrRk4rY0p5N0VxNk0yNjg0M2Z3UjR0citOOUxSU2JvdTBia0Nm?=
 =?utf-8?B?UWNMV0FIOVJ2K05aTFV2MTlvdW5IdUZpK2IxNGxmUFJ5VjFoZWs2SHRTVWxW?=
 =?utf-8?B?MGFuN1R4TkZJOEJFemIrazk0Yk1rdWRyaWthTjZ5QTFVS2I5SW5zV2hHV2pT?=
 =?utf-8?B?OWRtTk1ZVTZkU21rZUsvTGdqZkFFcHRZVVlkcnNmdDBlMnJUMTRBK0I5QmdG?=
 =?utf-8?B?SzBMbVk3WldBOXdqdHM0VG52VnZ6S1NZWDJoSXJZSFR4aFI3b0tpSmNHczNj?=
 =?utf-8?B?YWdSMkJUeGRJR1dERUtvRmJ3TmJDbmZOZmhudm0vd3BoWW9CNWk1U2w1QmNR?=
 =?utf-8?B?aGIwc2FVZTVmMW8xSDU3bE9FT1FHM3VKN0ppMGNFM0FQUXN6NHFHVkhhdFpH?=
 =?utf-8?B?b3h2Ujd3MUpseWhERkM3dWEvYUtFakQrejVaUjU4N096LzU2SVlqOU83dXBF?=
 =?utf-8?B?U3pGVHBYQkVSM2krcTE5Q0FUeUdzbTFXVmExckFCQUhZSVBSeTBnWEkxeWNw?=
 =?utf-8?B?Y1NHOFlwQ2lWVFg1cEZPT1ZtTWtFQ0kzQjkrVEpyeEIvdTRzT2IyTjJON2FV?=
 =?utf-8?B?ZFdQVGlEeVY3ZUtRU3RpSVJJOEtoVm5NOXY4MnpQbnFIbnYxb2tyZHkrK1g2?=
 =?utf-8?B?OUZlWksyT0xRdmJuakg0VDdvdjRiRzk3SFdRTDlTZ0N0Ykd2eWp1VU8xV1hl?=
 =?utf-8?B?WHY4V1NsZFgreDJtRzluQ1NncDRvYWd2bW4yVG90WmthdXlHWkxUMGJNck5y?=
 =?utf-8?B?aStmZGZzdlkraS8ydGxqS2RUWTI2emRwQnQyWWJBTms0b3FjeCtTOWxpYTNL?=
 =?utf-8?B?a1MzNmJ0VlkwYk9nbUdCNzVDcWEwTHN3WER1S0xBU09nVktvcDQ0c1RTL0pv?=
 =?utf-8?B?WURuMDFvOExIVVlSMEZaYzAvTGhYbkJQQ2hkckhaeVBqY2haS05WMWtoRGx1?=
 =?utf-8?B?dDhwdTZPUGVmUXhrYUxBcWpWMnNxVzBVdTRQNEg2SlIycUQ1T0gvYUREdWZ2?=
 =?utf-8?B?b1BNb3QvcUp0bDFaZzVHalB0eVVjUWlNOHRzeVhIQ0Q3bE9LT09JYUZwNXBs?=
 =?utf-8?B?cDRhVS9VdzQ2VlVuSGRBdG9aNWQwajFuZ0VJN3AvcUl2cnlkQis1c0MrN2JZ?=
 =?utf-8?B?UjJpTnVtTE9CTG5BMGJkQ1J3V0FReU1qT3h3YUxqV1Y3NytyYnZCRm5rQitM?=
 =?utf-8?B?dnF2ZWl0ZE9VVHVKNjJDa0V6NElRNFRUdGxWcUNLLzk2U2RrYjk4bjFrMHpp?=
 =?utf-8?B?L1Ztbkx1ZFpHU1NQMUdveTVveGR2VzZwa1ppZm8zUDdyNGhQRWdVdVBDbGJR?=
 =?utf-8?B?bG5aUllna0pqWFdaTC85dlZ4WFdtS1VsQkd1a0svaHRCQ2pGWVd5SytNaE85?=
 =?utf-8?Q?zPDM=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddec88c7-1475-4f01-b848-08dd6aa61ec0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 07:33:06.9373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zUZdWPuXZEUOlgSqEoAriYIhcY888rMFn+IAevqsqOqkodBBzNObeP9fSnfqe7U57ccTqhpkgB0LzfMDULXx1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7229

SGkgU3RlZXYsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzNdIEFTb0M6IGNvZGVjOiB3Y2Q5
Mzh4OiBDb252ZXJ0IHRvIEdQSU8NCj4gZGVzY3JpcHRvcnMNCj4gDQo+IEhpIFBlbmcgRmFuLA0K
PiANCj4gT24gU3VuLCBNYXIgMjMsIDIwMjUgYXQgOToyOOKAr1BNIFBlbmcgRmFuIChPU1MpDQo+
IDxwZW5nLmZhbkBvc3MubnhwLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBQZW5nIEZhbiA8
cGVuZy5mYW5AbnhwLmNvbT4NCj4gPg0KPiA+IG9mX2dwaW8uaCBpcyBkZXByZWNhdGVkLCB1cGRh
dGUgdGhlIGRyaXZlciB0byB1c2UgR1BJTyBkZXNjcmlwdG9ycy4NCj4gPiAgLSBVc2UgZGV2X2dw
aW9kX2dldCB0byBnZXQgR1BJTyBkZXNjcmlwdG9yLg0KPiA+ICAtIFVzZSBncGlvZF9zZXRfdmFs
dWUgdG8gY29uZmlndXJlIG91dHB1dCB2YWx1ZS4NCj4gPg0KPiA+IFdpdGggbGVnYWN5IG9mX2dw
aW8gQVBJLCB0aGUgZHJpdmVyIHNldCBncGlvIHZhbHVlIDAgdG8gYXNzZXJ0IHJlc2V0LA0KPiA+
IGFuZCAxIHRvIGRlYXNzZXJ0IHJlc2V0LiBBbmQgdGhlIHJlc2V0LWdwaW9zIHVzZSBHUElPX0FD
VElWRV9MT1cNCj4gZmxhZw0KPiA+IGluIERUUywgc28gc2V0IEdQSU9EX0FTSVMgd2hlbiBnZXQg
R1BJTyBkZXNjcmlwdG9ycywgYW5kIHNldCB2YWx1ZSAxDQo+ID4gbWVhbnMgb3V0cHV0IGxvdywg
c2V0IHZhbHVlIDAgbWVhbnMgb3V0cHV0IGhpZ2ggd2l0aCBncGlvZCBBUEkuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAg
c291bmQvc29jL2NvZGVjcy93Y2Q5Mzh4LmMgfCAxMyArKysrKystLS0tLS0tDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvc291bmQvc29jL2NvZGVjcy93Y2Q5Mzh4LmMNCj4gYi9zb3VuZC9zb2MvY29kZWNz
L3djZDkzOHguYw0KPiA+IGluZGV4DQo+ID4NCj4gMWFlNDk4YzMyMzkxMmVkNzk5ZGNjMDMzZTc3
Nzc5MzZkOTBjOTI4NC4uYzcwZGEyOTQwNmYzNjg4Mw0KPiBlNDkyNmVjYTQwYWINCj4gPiA1YmE1
ZGYwMmMzODMgMTAwNjQ0DQo+ID4gLS0tIGEvc291bmQvc29jL2NvZGVjcy93Y2Q5Mzh4LmMNCj4g
PiArKysgYi9zb3VuZC9zb2MvY29kZWNzL3djZDkzOHguYw0KPiA+IEBAIC0xMSw3ICsxMSw2IEBA
DQo+ID4gICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51
eC9jb21wb25lbnQuaD4NCj4gPiAgI2luY2x1ZGUgPHNvdW5kL3Rsdi5oPg0KPiA+IC0jaW5jbHVk
ZSA8bGludXgvb2ZfZ3Bpby5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvb2YuaD4NCj4gPiAgI2lu
Y2x1ZGUgPHNvdW5kL2phY2suaD4NCj4gPiAgI2luY2x1ZGUgPHNvdW5kL3BjbS5oPg0KPiA+IEBA
IC0xNzEsNyArMTcwLDcgQEAgc3RydWN0IHdjZDkzOHhfcHJpdiB7DQo+ID4gICAgICAgICBpbnQg
Zmx5YmFja19jdXJfZGV0X2Rpc2FibGU7DQo+ID4gICAgICAgICBpbnQgZWFyX3J4X3BhdGg7DQo+
ID4gICAgICAgICBpbnQgdmFyaWFudDsNCj4gPiAtICAgICAgIGludCByZXNldF9ncGlvOw0KPiA+
ICsgICAgICAgc3RydWN0IGdwaW9fZGVzYyAqcmVzZXRfZ3BpbzsNCj4gPiAgICAgICAgIHN0cnVj
dCBncGlvX2Rlc2MgKnVzX2V1cm9fZ3BpbzsNCj4gPiAgICAgICAgIHUzMiBtaWNiMV9tdjsNCj4g
PiAgICAgICAgIHUzMiBtaWNiMl9tdjsNCj4gPiBAQCAtMzI1MSw5ICszMjUwLDkgQEAgc3RhdGlj
IGludA0KPiB3Y2Q5Mzh4X3BvcHVsYXRlX2R0X2RhdGEoc3RydWN0IHdjZDkzOHhfcHJpdiAqd2Nk
OTM4eCwgc3RydWN0DQo+IGRldmljZQ0KPiA+ICAgICAgICAgc3RydWN0IHdjZF9tYmhjX2NvbmZp
ZyAqY2ZnID0gJndjZDkzOHgtPm1iaGNfY2ZnOw0KPiA+ICAgICAgICAgaW50IHJldDsNCj4gPg0K
PiA+IC0gICAgICAgd2NkOTM4eC0+cmVzZXRfZ3BpbyA9IG9mX2dldF9uYW1lZF9ncGlvKGRldi0+
b2Zfbm9kZSwNCj4gInJlc2V0LWdwaW9zIiwgMCk7DQo+ID4gLSAgICAgICBpZiAod2NkOTM4eC0+
cmVzZXRfZ3BpbyA8IDApDQo+ID4gLSAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2Jl
KGRldiwgd2NkOTM4eC0+cmVzZXRfZ3BpbywNCj4gPiArICAgICAgIHdjZDkzOHgtPnJlc2V0X2dw
aW8gPSBkZXZtX2dwaW9kX2dldChkZXYsICJyZXNldCIsDQo+IEdQSU9EX0FTSVMpOw0KPiA+ICsg
ICAgICAgaWYgKElTX0VSUih3Y2Q5Mzh4LT5yZXNldF9ncGlvKSkNCj4gPiArICAgICAgICAgICAg
ICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LA0KPiA+ICsgUFRSX0VSUih3Y2Q5Mzh4LT5yZXNl
dF9ncGlvKSwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIkZhaWxl
ZCB0byBnZXQgcmVzZXQgZ3Bpb1xuIik7DQo+ID4NCj4gPiAgICAgICAgIHdjZDkzOHgtPnVzX2V1
cm9fZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKGRldiwNCj4gPiAidXMtZXVybyIsIEBA
IC0zMjk3LDEwICszMjk2LDEwIEBAIHN0YXRpYyBpbnQNCj4gPiB3Y2Q5Mzh4X3BvcHVsYXRlX2R0
X2RhdGEoc3RydWN0IHdjZDkzOHhfcHJpdiAqd2NkOTM4eCwgc3RydWN0DQo+IGRldmljZQ0KPiA+
DQo+ID4gIHN0YXRpYyBpbnQgd2NkOTM4eF9yZXNldChzdHJ1Y3Qgd2NkOTM4eF9wcml2ICp3Y2Q5
Mzh4KSAgew0KPiA+IC0gICAgICAgZ3Bpb19kaXJlY3Rpb25fb3V0cHV0KHdjZDkzOHgtPnJlc2V0
X2dwaW8sIDApOw0KPiA+ICsgICAgICAgZ3Bpb2Rfc2V0X3ZhbHVlKHdjZDkzOHgtPnJlc2V0X2dw
aW8sIDEpOw0KPiA+ICAgICAgICAgLyogMjB1cyBzbGVlcCByZXF1aXJlZCBhZnRlciBwdWxsaW5n
IHRoZSByZXNldCBncGlvIHRvIExPVyAqLw0KPiA+ICAgICAgICAgdXNsZWVwX3JhbmdlKDIwLCAz
MCk7DQo+ID4gLSAgICAgICBncGlvX3NldF92YWx1ZSh3Y2Q5Mzh4LT5yZXNldF9ncGlvLCAxKTsN
Cj4gPiArICAgICAgIGdwaW9kX3NldF92YWx1ZSh3Y2Q5Mzh4LT5yZXNldF9ncGlvLCAwKTsNCj4g
PiAgICAgICAgIC8qIDIwdXMgc2xlZXAgcmVxdWlyZWQgYWZ0ZXIgcHVsbGluZyB0aGUgcmVzZXQg
Z3BpbyB0byBISUdIICovDQo+ID4gICAgICAgICB1c2xlZXBfcmFuZ2UoMjAsIDMwKTsNCj4gPg0K
PiA+DQo+ID4gLS0NCj4gPiAyLjM3LjENCj4gPg0KPiA+DQo+IA0KPiBXaXRoIHRoaXMgcGF0Y2hz
ZXQgYXBwbGllZCwgdGhlIHdjZDkzOHggY29kZWMgdXNlZCBpbiB0aGUgVGhpbmtwYWQNCj4gWDEz
cyBzdG9wcyB3b3JraW5nOg0KPiANCj4gd2NkOTM4eF9jb2RlYyBhdWRpby1jb2RlYzogc291bmR3
aXJlIGRldmljZSBpbml0IHRpbWVvdXQNCj4gd2NkOTM4eF9jb2RlYyBhdWRpby1jb2RlYzogQVNv
QzogZXJyb3IgYXQNCj4gc25kX3NvY19jb21wb25lbnRfcHJvYmUgb24NCj4gYXVkaW8tY29kZWM6
IC0xMTANCj4gc25kLXNjODI4MHhwIHNvdW5kOiBBU29DOiBmYWlsZWQgdG8gaW5zdGFudGlhdGUg
Y2FyZCAtMTEwIHNuZC0NCj4gc2M4MjgweHAgc291bmQ6IHByb2JlIHdpdGggZHJpdmVyIHNuZC1z
YzgyODB4cCBmYWlsZWQgd2l0aCBlcnJvciAtMTEwDQoNClRoYW5rcyBmb3IgaGVscCB0ZXN0aW5n
LiBCdXQgcGVyIGN1cnJlbnQgaW4tdHJlZSBEVFMsIHRoZSByZXNldCBpcyB1c2luZw0KR1BJT19B
Q1RJVkVfTE9XLCBzbyBpdCBzaG91bGQgd29yay4NCg0KSSBhbSBub3Qgc3VyZSB3aGV0aGVyIHlv
dSBhcmUgdXNpbmcgZmlybXdhcmUgcHVibGlzaGVkIERUUywNCmlmIHllcywgY291bGQgeW91IHBs
ZWFzZSBoZWxwIGNoZWNrIHRoZSBjb2RlYyBub2RlIHRvIGR1bXANCnRoZSByZXNldC1ncGlvcyBw
cm9wZXJ0eSB1bmRlciAvc3lzL2Zpcm13YXJlL2RldmljZXRyZWUveHggPw0KDQpUaGFua3MsDQpQ
ZW5nLg0KDQo+IA0KPiAtLSBzdGVldg0K

