Return-Path: <linux-gpio+bounces-26391-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1FBB89C1D
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 15:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EA1617BC81
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 13:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239D6313554;
	Fri, 19 Sep 2025 13:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ADzy2CfK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011036.outbound.protection.outlook.com [52.101.70.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60761F7586;
	Fri, 19 Sep 2025 13:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758290370; cv=fail; b=vBjYaqhSrFRYYZNEE/0RLEPK3OfusFCDgSQB+L90pFzO0U1AJqQZfBcvGLhxEc5qAMckUwqOE1gCjYnLFbT/dmNrNHJ3xz3raJaFuVs4l8AQusx7Fo3ffHG5SobhHC3HqEAcSLK/JkEaYtoXX4+LsnpfRnXK4PNb5QFEgkkQiQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758290370; c=relaxed/simple;
	bh=OYkkY16OJOVGW0rUpL6IGFi/eNV4a9DXxpFoFuj1GvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dmvcRiHqCTXRdafZW6gqn4VBYBIC9bKo8sODKUfywbTCZxChHKVEwls+hK5fZbMFgP6ql2kFv3hIM0XuJ5B0tAgQz0TUjSKlk8y2G46cXtF/4zPJ7C/L1Uf5NH431jKNmQhb0RVapkOOpwgAHiyApuxy8lWVNEaV+IduedSY4lA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ADzy2CfK; arc=fail smtp.client-ip=52.101.70.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vA9UCd93Kw2fvyQOYv8udRwbJkOXRv3MTLgpMQ8L+Hw3bi4/9/H3tbPeAYxg0dF1cB003/OcmtZpIZ9sSN09QXklkh4WC7eCp+ZI1Lz9KIjWFLb7S3ohBgigSBcBSghzPXFfVgRyksAQRXeQpl36VSeaqd44/LpxMIFo4LksucM9Nzyb8ocyQ/bTRvdn0XglvG1lk8+PNLVS1bNK0ctSV/eNUgzMFwzpPOYgDFnm5HJlnhYOuoPn37SYyCai5czsvodD7OWkiZL1E9lXpoJJ8KIqutv2ze9DMQAf/FhOc0jM6iED1fi5ghl2c0gbPS1e4h/TxAe9xwqUf9cLFxgYtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKXiWeoyedq+XdIquDaLAuKHriEEIYBGlweFYcgyT5k=;
 b=q7YK7dyFWw9IM8YaCMRCH4LpN07VNZpV2ZTRTqLu+hxqcRAmSgcvTIi1e59Qyl8zL7gJmOE1va7rWqcDMFXHsclBuSxFzv6AgtOA3MsiNec+75N1C/TNsmhjbjUZCYVjVbtiXjKNla9QckEZ8ffsNY7g51LguVgjAH6sVOZiYO8gLKCb6V4u3Hj3qA7OsdJ74lnesleLyvqw1qKTBNCMxyv78BXIkKvq5a0MNinzPzXghs3kDeUvST0n3FNMaeig0o1ygmyEYhpykESmSjasI5g6O5Hhlv+GzE+sjrvQOB+0Wp3e0h1tAHEY9sXFOVMl/CLv3XMW72IZ8v2xyUpRIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKXiWeoyedq+XdIquDaLAuKHriEEIYBGlweFYcgyT5k=;
 b=ADzy2CfK6divR5yIy7pwb0wRNlcgWqALHwulf17BPUzAmATb95kteiDQE689wSPi/GICZpDJh2jQOnUFEjwLEfCBKJ9DedoUtbSXvX06AcMsvTEofIoiO1mWyJnvCSu6L6JXINCU+5tnFTVgnAEuAEc8xWqEI/RUQO5UToA7O1tz7siw1uIGhw+9iGwMHWPJkGuYOgTRYiTiciXAiMntyoVprJS/8mLvrdijP2t1XfiAEntBTf3DfSI669LfmyGZ1DKBhxGWFIoBPenD6E9+16CdJERyp30dr3aRqGXb3GjzFwQ+PKrvqfY8q+X1vUWgeYAWjeS92BAkQuJ9pj4W+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by VI2PR04MB11146.eurprd04.prod.outlook.com (2603:10a6:800:298::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 13:59:23 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 13:59:23 +0000
Date: Fri, 19 Sep 2025 16:59:19 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 06/11] gpio: regmap: add the .fixed_direction_output
 configuration parameter
Message-ID: <re2izaxwbjp6hcms3cps4l4tfvwaxyt56gkc7ohrftcjizwkwt@jsjjo3b6xrcs>
References: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
 <20250919132515.1895640-7-ioana.ciornei@nxp.com>
 <DCWTIV3281OX.1N3AA8K3T21LY@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCWTIV3281OX.1N3AA8K3T21LY@kernel.org>
X-ClientProxiedBy: AS4PR09CA0006.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::16) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|VI2PR04MB11146:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a2d6202-5280-4620-ad78-08ddf784bcbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|19092799006;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t8/sN6ut2xSckiuyXIQuOsX6dKvMgUL8PSYrvlFNKhaledfKHFphRMw5/gzU?=
 =?us-ascii?Q?N9jL52e57y7XaFuN7XCBpkE20pr+YiUVTUil98MrxVeTS8kVnsFZlg+Ah3CM?=
 =?us-ascii?Q?8MmMLgsZJT8tqLbO5UQbv+QsNgZlRoVZwSkx39KeQ/mSif4FXaavoaHkMjgb?=
 =?us-ascii?Q?3eSO60u3E4KoIS0NRqn9ZE9yZYZjoQSjVuJ7S2cpdF5NjZO66fViE6Lwk3bX?=
 =?us-ascii?Q?0OXlS0rp9NjUKczYAeQo/0iCJlH55lTTMcXgy9Tmy+Jjm+JyCQ/nLYUquz++?=
 =?us-ascii?Q?IJ1PdfH9JtY26B1deNx4oRlIbPdkPmPoZmuEGuLIuS0sb5JzHHvTDp15hPYt?=
 =?us-ascii?Q?NbzPl3nvFTYFXkbhTKdhwODC9VpxK39SlSHqdEk0PE7yFxC839a6CwsxHBCD?=
 =?us-ascii?Q?2ma0jvsbeES2xJdIL6UxAMsSlzZZraEr1NEYIrgFcWv9aYwcHNIgOYAjFJpe?=
 =?us-ascii?Q?QeW1OKAJNVkG6IRBkV37Gvt0JNWUCGgvBoGqz3Ob4A4t77QfXOAV5rk/t0Uq?=
 =?us-ascii?Q?/hrjOGU+66dfbCc/8TzDZw9TSqBQZSmNCkJ0EFPEwQbgis2enXHlurMr3YDl?=
 =?us-ascii?Q?XKTVmal2u1RS1CcRIh0RxUJCKeG6XOiCQ9Gte/uvBfSDPN+mUvX73wh54rCp?=
 =?us-ascii?Q?kkawjmUFKlVr+OBMthvrSshNmRfOt6JKT7sj2HRmRtCtTzBn33R2wF3gmwTb?=
 =?us-ascii?Q?6gP86yrmLsyJX5oKg4OObz0lvWxq2eKj1WQ/pnpBTwOtbJtDzkglvkESpjRV?=
 =?us-ascii?Q?tgUDhgyG1XS+BLwQciVlIIpHN8bwIsCE9Us780EJrNlobf5YKY/28WKVWIal?=
 =?us-ascii?Q?lYX5zEhoo2P73kvr6scleVmHG3KHQhM7M8pwEH+sIEIsbN8EPOgWsfjluxSj?=
 =?us-ascii?Q?ngayJDL63I88eN0XpoQl5bnx+y7JaEzB6JXWSQgI7JuwzhBM076bYz7q/vyT?=
 =?us-ascii?Q?lmLpCieI5GJpIARDNJr0F31HkAbTNGLxpNLBjsNTFedhWJTW0MXPyMKnwMJP?=
 =?us-ascii?Q?65XuxmG7pBt6tUpw6RE7IwLASZBEocT6wsb1kIj2TsdT2c85TOQKguIRpcSc?=
 =?us-ascii?Q?r4DaFGb63s7Oh5erLHC+X6vgly3hOtmwi4icsdQXi095kAzr3Vrv+RNhgCyP?=
 =?us-ascii?Q?nc5U25K9QXLleEPZKCAM6XhHUJPi/JnrGofsooyR0evYxsRoTGMZLOvvtV0M?=
 =?us-ascii?Q?IbTRGeRiwJM2SX7aHiPaVxCcUAYh6EEByEKpFHcQ9iywDOPv7I6BME2rGVMQ?=
 =?us-ascii?Q?VIfbPyAESjx7zWkH2hv6sYQwfcC/6zBgpqMHeP5nEVCQU0dXEWSFbiJF2rG0?=
 =?us-ascii?Q?CgxFnjiGAjlAqDiZkTCG2q9IyKZ2UtbAEmGnG7OMAfrS+LVYYolPhq1Hmfr7?=
 =?us-ascii?Q?xWoxfTW4zeA6TGdeqNOsgP2f8cZl389Z1v3Jmiy3d8Fw7exwQ2D9TxpDKqGl?=
 =?us-ascii?Q?bqK+WO5dQg4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rcLzeu8Z5X0/HzbJn33+QQeH6lL5FYwXoZurSX4pAP5kgoHVTd2Rf4dZqVbc?=
 =?us-ascii?Q?ArbrODMQk4W08unaZ3h5yIG8JIIzvqODpAP2CyEfDTSZ3YA1DDCQSWOVW4oa?=
 =?us-ascii?Q?aF0WSSqFgnwLytQx8Neo0ai+rd/VvtGpCw1qE+PC3QxtYlsD7c5EfkX9nSMX?=
 =?us-ascii?Q?qEK3gGfoQ6LwMsB+sB3bjUz4oRN/hAOy6pNDdIiLKm3/aNeIrAufev14gb7d?=
 =?us-ascii?Q?zQ6Db9RY4kpy/pyYb744nnzkF2MujdRNIuIk58L3Fn9fgVd9VcIm7gaE91Lu?=
 =?us-ascii?Q?nEJMP5aSLL1QhNbX2rSiSW7zma5MRfhwQR1ED+7kRYuUPRECoWKD13Czqblr?=
 =?us-ascii?Q?IUI9s74dyBq6ykPty4oNGCAivllky0Up226p/qf/1JTayrR2c53vnw16AeKj?=
 =?us-ascii?Q?2x3NxZHf2W6T2/O5iCVysfhDABvkfS7atMQj+QhjdQqHPHVNwCVdmxcQ0RqD?=
 =?us-ascii?Q?a+ZRTyaykmTjeahg4JcV4AhLAv83Po/1atff4fKoMx75MYU1bklPi6ReW2iW?=
 =?us-ascii?Q?vgluEfBiczP4WNIblmWqQ+hvZ0x+1HrS3GB5bFs8+f0Ri2iiBnWQ9TX+h0Ba?=
 =?us-ascii?Q?RuyXbpBG+59DN2ZxB79xj1gu5fmmEmF1F+alI4wTN/ZH5Ocp2+5m4zIDdUbI?=
 =?us-ascii?Q?wZltiLKCpRmB6OoRuHFhYlEz7OGl01EQPhjOylwj2FOoUUL9+/AczOCE0PyR?=
 =?us-ascii?Q?Vgix+Sk1xzvPMQICdWCKiTyD3GwDq1/5uoSq1TpMEQ0/B2FcypxCRbphaq/y?=
 =?us-ascii?Q?Haktcp/2cSZ3wOBIl/Xb1Ce9IH47oNl89OMieUA7+/0aWJN06iNPem/FGgM8?=
 =?us-ascii?Q?lnbTXFrDLxvBOmFjhEWXKj3URNaUBmqbLE1aHgZotFDY32BhUa7KH7o+g4ep?=
 =?us-ascii?Q?arlqVyLSv/yioXa6JI3ZnDeOz3YCc46tzX52jTsihIJFXXfUv2bxdBNcITOv?=
 =?us-ascii?Q?NQ6+o5uO3fsFdVotNbxk4X5vPB06KhRzfUuRVXTIdq+tSiKXyXWqETVMniVe?=
 =?us-ascii?Q?5j4HYQXKsYx/icrT0FNb+YRqzAXHElYgWAT4dtmxaTEJn/jK87GW+lKapArP?=
 =?us-ascii?Q?3XO3QNqhFTNYOO3EgFqWM5MDSBzUzHMEf5/bafC5eeqkG+gpjLvV/eOV70ck?=
 =?us-ascii?Q?qTHmliYFoWDVDD53dRGBWQ+uMeujIfcMzi/NH5YndGSYufaCaSRlkR7Xqt1u?=
 =?us-ascii?Q?cdeTxwF9NzWJvIxQPRtaUIzrCslH/vrx/+U+MkdCC5mYGTu84b3Gq9qFdJN/?=
 =?us-ascii?Q?fv3dZ1oL44ap6V50OpGd27XTmNVC18+lEha7k8jtJORvuRq4nfGkIiA3wM1K?=
 =?us-ascii?Q?0QCKKTCg4zABDUyz3Z85Bl+DQP9zR0x8lApM/8kM+YSH5T1OHqvE8HXPAlpR?=
 =?us-ascii?Q?i2CIMZhbgojRwDsGWl1sYeWzjzOm9y9zrnSzs+yaRDqDMW7sWB6AY6zQ9pBe?=
 =?us-ascii?Q?KnTkkU86XfBbBNhngCLkIBA7CzLHI6pkZbZPwAbpGJalw1WAVhGJz3jbDGLX?=
 =?us-ascii?Q?uETR9eZB8/lPvynOMWP7WUSpEnacdeJkiFRDk2wmOBx1ZuFb3mCPao952+B4?=
 =?us-ascii?Q?fORCGd6tf9bYMW0dELi97XAeLnkI10iGIqDNnkuU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2d6202-5280-4620-ad78-08ddf784bcbc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 13:59:23.2624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CV1EylExrdAcYVSnQJqkmpG1L4VLlq72ulckfvdXgLn1WlvdkiSdIFrZyXOqTAP7IBJiAK7/VA7KhEO5nP5RCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11146

On Fri, Sep 19, 2025 at 03:41:00PM +0200, Michael Walle wrote:
> Hi,
> 
> > @@ -129,6 +130,13 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
> >  	unsigned int base, val, reg, mask;
> >  	int invert, ret;
> >  
> > +	if (gpio->fixed_direction_output) {
> > +		if (test_bit(offset, gpio->fixed_direction_output))
> > +			return GPIO_LINE_DIRECTION_OUT;
> > +		else
> > +			return GPIO_LINE_DIRECTION_IN;
> > +	}
> > +
> >  	if (gpio->reg_dat_base && !gpio->reg_set_base)
> >  		return GPIO_LINE_DIRECTION_IN;
> >  	if (gpio->reg_set_base && !gpio->reg_dat_base)
> > @@ -277,6 +285,17 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
> >  			return ERR_PTR(ret);
> 
> Not related to your patch, but this line above is wrong. That should
> be "goto err_free_gpio". Would you mind adding a patch for it? I
> could do it myself, but it will probably conflict with this series.
> I'm fine either way (if you do it, don't forget the Fixes: tag).

If this would be the only change, I would not do a v5. If there are more
things to change, of course.

> 
> >  	}
> >  
> > +	if (config->fixed_direction_output) {
> > +		gpio->fixed_direction_output = bitmap_alloc(chip->ngpio,
> > +							    GFP_KERNEL);
> > +		if (!gpio->fixed_direction_output) {
> > +			ret = -ENOMEM;
> > +			goto err_free_gpio;
> > +		}
> > +		bitmap_copy(gpio->fixed_direction_output,
> > +			    config->fixed_direction_output, chip->ngpio);
> > +	}
> > +
> >  	/* if not set, assume there is only one register */
> >  	gpio->ngpio_per_reg = config->ngpio_per_reg;
> >  	if (!gpio->ngpio_per_reg)
> > @@ -293,7 +312,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
> >  
> >  	ret = gpiochip_add_data(chip, gpio);
> >  	if (ret < 0)
> > -		goto err_free_gpio;
> > +		goto err_free_bitmap;
> 
> There's also an err_free_gpio jump below, that should also be
> replaced with err_free_bitmap.

I am a bit confused. With this patch applied there is only one 'goto
err_free_gpio' in gpio-regmap.c and that's the one added by me above.

What am I missing?

Ioana

