Return-Path: <linux-gpio+bounces-19396-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A491A9EEAF
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 13:15:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59A06189E807
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 11:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A02262FE3;
	Mon, 28 Apr 2025 11:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aOUSlBSt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2042.outbound.protection.outlook.com [40.107.103.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFF2262FFD;
	Mon, 28 Apr 2025 11:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745838907; cv=fail; b=gxgYntfqMr0EGB+AShEU82cPx5rN4b+TT3LvhEmEP2gNamwijX8y8vHSPUW3AGk0qs46UqSyhJDZSBGo5I9QMG816N6GUOwZyYX1u3u+p+sKf1bge3/+7+7yJ7BXvzSTCExxdguamYeRGZ6CECo5NIY9MQw5Co839A3QApSjB/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745838907; c=relaxed/simple;
	bh=LWHKYdTmlQ1NLfvrfH935mPAifCASFGYzhBTaTfWAx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fRtKJoKKxcxnvr+D0c0wPzdh+cyn5WXV9Qic+/r4gQzzYfX9xb6svX72BSsfS3xj7WDoNRlbHHjuqzn4Q7gsfPYOVE68/0V1Ou4tAN98xNfZ7hHqAjt51lYVX5dobhHHo+LFQYmejcS0z/s2N9gdLX9EU3MzLcyNRzjohL12ka4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aOUSlBSt; arc=fail smtp.client-ip=40.107.103.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHK+uEYgTwxO6eRsm/VsaYJ59mogFHY7q3Jt7P/tZj/94aZmhaJZmZUKWQye770Cw0L6Jp5qWY4JylbAjH16Rpo1Vuku40G+G01JeA0y6cor+OWl0rNLYlGDEoI6YTOiel/kl+L8+GCiywDZQ5qCzbLtbW3Bv8zjbm4HoOQoqpI9VQuQMRaDvM2beTZGhWdn4TdtR0MW+8UMsLqvu2lP2HuVqTIAllKGnAZW5HUSlZlQAbuDWDgHwlWpj3bmwkzTnqVWlnRbex6/haM6eFnsuQ7/RixBJYI5Ix/7Om7tcxfmg9vyvFISKLPEvDo1VweLBdz9WyRe2COdJ97TnQ3hiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hxmcrbJm+engMSOEL/VU8L2b1u80pntXcFh8fynBRs=;
 b=oaf8XBRgnjHUuTmnfApkB6SWqpi4z49+M3IGdNMBAYc7Y6LTUfFmhZfGAPNdXA0zfnPrQ0ZGK1vksPmXHAp3ir1npl1mSRTXCkp1RLs4xCabnRGEbCmp41qpfo7WJNOCLLnzLkTN8bbq8vm3nuq5SdMY032sr692z/fwWDxRrwr4UWQ2GANWXGQaizVtGXFFPFvrhU4T/I9Rv/yK63yGBax72jWXrlzPkmrnGYRVV8t4JRlXqqucrcDDZCqrR5/0QtpMdFMbot7lvlpz2w41TKLX3ydTadYmTCIwlkZCnYdCNYpP4aYm66BnFlwmAPrE7BcIasSl7nzVz2FAdVQZQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hxmcrbJm+engMSOEL/VU8L2b1u80pntXcFh8fynBRs=;
 b=aOUSlBStoOghKXiJIL6dixi7lnQDO3SBJFqyWltdQlZcQz4Lhq70kM94VnSA1KZU0+gUFMGGeRbs9Mbol23p3Dx4zVOC6zo0+slQaUe6DnEOcv51MLLayvNINHbjSF9JWCB9qwo6d3EbPPItM49zdu9UrwP3WS6BipOtuNxujtRrG2Ag5sCk2WbSjlcZIY9Cjd3A/IMugKYSg9E7FPpKvvIEuNof/+9W8u6xsVclk4ZGAmD6uKZfyWuPKGULpPWde9nKi4Xe+bYja+4/lgM+lrdLjRUg5OvR+gK25Zrtck2NDmM2Ctcc6nQ75dF/QZu0LMf6BOuE1Y7VuPrgYTbC+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB7683.eurprd04.prod.outlook.com (2603:10a6:20b:2d7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Mon, 28 Apr
 2025 11:15:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 11:15:01 +0000
Date: Mon, 28 Apr 2025 20:23:53 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Yinbo Zhu <zhuyinbo@loongson.cn>, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 00/12] gpio: convert more GPIO chips to using new value
 setters - part 2 for v6.16
Message-ID: <20250428122353.GA28789@nxa18884-linux>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR02CA0077.apcprd02.prod.outlook.com
 (2603:1096:4:90::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: 53c38837-67af-4f36-0c64-08dd8645eb13
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pRUy21kRc+4x1VYQv1bOFOGDDOXkek7GCbq97BPxpAk8ChwQq9fkQuUbcBho?=
 =?us-ascii?Q?c7LWC081kdrdlo8cunfojRN5fv83wytrXm9wuwMoK3rOAcMdFUQN7XWijoXG?=
 =?us-ascii?Q?+yCBaFsoK0+QBRaOYOCFz7F24xSDj9JfPrqfOz3CCZgymwKx0AuQnA+KB7mw?=
 =?us-ascii?Q?v6/lEziFzvK3NjCTEIK9WFNSXINeVFa2SZ88/bvEVTcnMC+5BaGREWpua2IA?=
 =?us-ascii?Q?Hq1rvIOFZ35s7A62ilXz49g2io43w2yzdNL7kLcM9slYYl1qHW5XL1kF+Xpv?=
 =?us-ascii?Q?F813mrq50QeOaUPvXMF7LJ47Wm0dJct6y2Pv85MXAZ3vxIrhmj3CRonUtbZ9?=
 =?us-ascii?Q?Jgpm5S2/b6mPbD3t5UDT6K3WhUiKjsSn2wDVKyWQ0vVDRdpdUgLEzAVbemsg?=
 =?us-ascii?Q?9V9Ps5Azs8PADLaEKKnS4Hc5hGQvxVRGeFQE9C4C0rXbuDnFJeQdU+uJP84H?=
 =?us-ascii?Q?9NlOoNGa7r02VQzyXIPY8k9WWIMqZyHsd6XtC81a54l09/vQ1kzPlIVy+Mup?=
 =?us-ascii?Q?UWXzRBZD98FajRVZ92qqqJLsL14QoWf3l5ywzX0RmQZPVhMVRHUILC9ejhwp?=
 =?us-ascii?Q?/FZ79dspRwBPq+99Qa4O2YD6DmPAVZjt97lYpKA6kuwfdqN437PPqWZL7D1r?=
 =?us-ascii?Q?bVrCDe1p5sMI4Z7dSQ3RaQl651M4yog9HZ4RnS8kaWoXFpEF9rTr+7lECGMH?=
 =?us-ascii?Q?D8ni0TTWIF28eYlZO16/TB9BKHeWSFV/yzpteOhKzT0LAqx4aCcQp0Ul2qtw?=
 =?us-ascii?Q?8g7nG94pimj3bcmUL7tGSoedJgL4wu5Nuzo05lhpDCLz+eWRpRu1lDTPWkok?=
 =?us-ascii?Q?e6Lgli1jocHtfwelHBR27XmbkmHBXqKlgZzdqg9epKGUIZDNVK+GdsjnWNpc?=
 =?us-ascii?Q?11a+raR3a8hsZ+DiAXYGYGpF9R/RO3iSwFJ73jseCwlb1nTC/83Nrh4J2vKA?=
 =?us-ascii?Q?S+oHVVt2dK0y76ot+QzD8ulpFuYfUd2zGHLR25/BkXJ3pfuDajDOhJhTyXrs?=
 =?us-ascii?Q?hOjdHZ4f4ZmVihJZQhGqf27G/dJe1+PwkdGmvKDZyfDpv2lh5unMBXo5BAiv?=
 =?us-ascii?Q?/JBpYl7GaKvLbcYgfesXrGVLhtTEBxf9udaB2LtJ9V3kAQUJLy8lAhjN+/v8?=
 =?us-ascii?Q?qn116eZG3bOMUDzrv4nPw5F+7fIt+Nt1lJot78APPClR61QBgFyVzC1a/tK5?=
 =?us-ascii?Q?npn4LRtWdxzf7mJjKjzq8TY53CB0k9GoOyEaxTL7StEmy6X1o97O+O2KyC4N?=
 =?us-ascii?Q?ZJMbar+tPLO+n2Ngpi+w+px5mEbSePbe1k662ozGM8HHEJC+5jLTCwhy+fYp?=
 =?us-ascii?Q?bXNDzrfTpglu5xuto+y0NNmcQHaUfuXKfWktyixu7v11ZWTxYNa5wZD9Zyxy?=
 =?us-ascii?Q?3/7hl7o3X5JaCKCnT64EHRVFOgRktUD8M1NiznK3d/dHWGjv5aE8RN6D9RQd?=
 =?us-ascii?Q?rlnGlJYoBfXIXUMBzAHZGbifisH70RhR7k/z93AZ0kCJWHm6/EAm9g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rHSRZ+7QBj8GMIGIcVY82QrW2Vh/WTo09RgpO5SfqZ3WouAV5WS1+90gux/+?=
 =?us-ascii?Q?6rEwzXdXuWAcxOzkan4ctHV9yx3uJEkpVbYERAhkFFR0vNZ3sgsPV2PVLVwy?=
 =?us-ascii?Q?RtOzTGmeqwQLqHO3wZoFinDxiaCU/zYdRpPVVF89cPVnZw3Auoj/mfqq7n5e?=
 =?us-ascii?Q?Ox7IVxDf2aGaXyYXvan5RPMuUtFCLGlEko22CDFQ6zZksFkqqetWVwlvJUyC?=
 =?us-ascii?Q?8Wmf/T6Wan1x7j+bbLR05x8+7I2/kOMLEuipChwFWJV8NWxz7HMIXGAGOPbp?=
 =?us-ascii?Q?IvS6g6mpWdcnLW9Bg8gbiFGLihRu104MhMBNGhszLLjBEPTWQ53Zias+Tw3b?=
 =?us-ascii?Q?t+KyeSyw/MwmFB3u9XuiYT6ZNaMQJgmNcNvNagYKwxKHs8Hz6ggeYGlGRzTs?=
 =?us-ascii?Q?N6h+pYLpiFrd6UJEH36HQQVIzPd/OKZSM3Lk4ijdH6i3o/XpclbEwEKo4q/8?=
 =?us-ascii?Q?CzKhy9RkLyBzfvedRmvH6nYuvM3Daz5NyBik0flkcWG/kPFHmQQsCfAtibis?=
 =?us-ascii?Q?ghTfQazoJvfcR6dt7clBuI0K2cpGqEZfRkO+UpxdNHQxwx6lP8EyAHoQggDd?=
 =?us-ascii?Q?IhGHxnbL1iQZ6MpAsjXMlDUnUNZMGObHXtNJgh3bWwoxI/2kw9PGoLXDcK8v?=
 =?us-ascii?Q?MlnCUZhcWYZ6JrYEgZFD4mROeuyuCBn5fua8QJ/A3ZN6oDi/shns7h8xtvHd?=
 =?us-ascii?Q?opqIbPM2sCQAepJ5pR+G5UD9NkI8+zHh+CAUA4MnZFOVYoYKdq+K6jStpHik?=
 =?us-ascii?Q?aNmE5BbQyXvLSzmPz7YnQsx0tM6Ypvnh9OzKH6mjuZLHfCHzsqZwQVW3pTgl?=
 =?us-ascii?Q?dS9/Zp7ZbtUAMvoCj4FWw+QIn7e5vp8zrE2YIQvPAnwHNJBScZlAcpUAKnmj?=
 =?us-ascii?Q?yoKuYtA1lrKByLbfqjLFfholllYFXKogu6bwBtCca/BVUK8cOnMoht6TUiRp?=
 =?us-ascii?Q?Gc9pxGfONNNqtz1SbzGQlb7DsjyR2D6lUVqoWrCcyYrCQ7cB7XF6GDVbUUMA?=
 =?us-ascii?Q?FM+Qbz1VAAHsI2QnV18DKZdbmnNhzij3db11eBKB5uZm+T9ny6oGLDnSnJhP?=
 =?us-ascii?Q?o4VOHaM090mGtp3dOozOXZ3Fo1nynKuPpaN/uJ2Ha4bdGtUn6vSdF3KQIHhI?=
 =?us-ascii?Q?9C6ZKKwQAT61aqMC5cnauzFI90Z/oi79QtTkxMwKkaWsVC7F+e3h534BtS0q?=
 =?us-ascii?Q?mT87NaTJx7Ix9ATh3+ht1Gh+8exKW3av6YVgVH7wGq3ELQwx/xoq/sKdH81L?=
 =?us-ascii?Q?NkKDTCFPiP+xdmdVoOl5YIGGvXby1iNlY8C21knrm2SqqToVndoo5L8+zuug?=
 =?us-ascii?Q?Vpria7qc5jzjjmw+TYoiWAQ633vPQ42yviTZAElzq92z8dkHwF6Sehx4R5ac?=
 =?us-ascii?Q?Lx6Pci0X/Ht62h4EnyZQ1duEYCwQsGczqRi7+fMlQDypw8eAkOQEjPVB/1Fj?=
 =?us-ascii?Q?Z/L9WauvUPxp8bqXT1cAh1P+nWw7GZzM7tzp1SQXT8CACo6vxWNz/WbqfZNJ?=
 =?us-ascii?Q?D09eftGPHIwHAe82JyFx4vZo4+MsAso2DhoWTCvipnWsuJOYhktC3+/y4lcy?=
 =?us-ascii?Q?c/ghFPPxxUfV+mrcOrCtCeVw56O7DPnNbA+8eFcr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c38837-67af-4f36-0c64-08dd8645eb13
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 11:15:01.4658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZFG/MFyCW9RbwGEG0QVkhgiEv8ApO2IQU2+JhR4UXcobNgqUz7XywAWkefJdeKeyPatE0GPmQCvjopP9L7AvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7683

On Wed, Apr 23, 2025 at 09:15:02AM +0200, Bartosz Golaszewski wrote:
>struct gpio_chip now has callbacks for setting line values that return
>an integer, allowing to indicate failures. We're in the process of
>converting all GPIO drivers to using the new API. This series converts
>another round of GPIO controllers.
>
>Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>---
>Bartosz Golaszewski (12):
>      gpio: imx-scu: don't check the GPIO range
>      gpio: imx-scu: use lock guards
>      gpio: imx-scu: destroy the mutex in detach path
>      gpio: imx-scu: use new line value setter callbacks

For patch 1-4,

Reviewed-by: Peng Fan <peng.fan@nxp.com>

Thanks,
Peng

