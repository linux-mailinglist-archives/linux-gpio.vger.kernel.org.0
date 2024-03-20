Return-Path: <linux-gpio+bounces-4467-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29916880F8E
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Mar 2024 11:22:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D162F2833EE
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Mar 2024 10:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B693CF65;
	Wed, 20 Mar 2024 10:22:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa2.ltts.com (unknown [14.140.155.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BDE3C471;
	Wed, 20 Mar 2024 10:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.140.155.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710930170; cv=none; b=ojXk1KocRlcA04vEXXNGGmV9qNJKjrjc5Hx2WoZi9ONd4RYWQaRla+7D4nAXX+R7mfuVO2Y+AZ56yC9rBA4VDONAu9qeWipTzcpoP9+Tg2gnB8bofGsK7K4k2GSwQr7OaFAo/zbVVGMLNxUPFMhA/w870XXNHIvk2QK/HoB0ZLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710930170; c=relaxed/simple;
	bh=Ho+4VyVSRRXDeXcNiFO/PfTQfJZaLrzl+25m9imkymY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IrSbqDhDRUCgiXAW6XDnb6GxqlX8OnkJJ5XJXNUmRjB4OFFu3ciaw5ZiS4kEJgFFTRmWEyqg9JscsAMyGhJa9vEuMILTST9yfo5iljqX3I3xxrxhkleBY8awAxD6br2TNv2/eOrbUKfkKYo7D1gLRE9nWJHj46+9JVzDHXjnocE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ltts.com; spf=pass smtp.mailfrom=ltts.com; arc=none smtp.client-ip=14.140.155.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ltts.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ltts.com
IronPort-SDR: p4GGiX6mksnr9sfUSQzMzyObBqJqHn5W8vEq7ogckftZWGWQH9OKvP1HQJIEPqGK58yz9CfDZW
 v5GjaBAS46Bg==
Received: from unknown (HELO localhost.localdomain) ([192.168.34.55])
  by esa2.ltts.com with ESMTP; 20 Mar 2024 15:52:43 +0530
From: Bhargav Raviprakash <bhargav.r@ltts.com>
To: dan.carpenter@linaro.org
Cc: arnd@arndb.de,
	bhargav.r@ltts.com,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	eblanc@baylibre.com,
	gregkh@linuxfoundation.org,
	jpanis@baylibre.com,
	kristo@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	lee@kernel.org,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	m.nirmaladevi@ltts.com,
	nm@ti.com,
	robh+dt@kernel.org,
	vigneshr@ti.com
Subject: Re: [PATCH v3 03/11] mfd: tps6594: add regmap config in match data
Date: Wed, 20 Mar 2024 15:52:29 +0530
Message-Id: <20240320102229.464673-1-bhargav.r@ltts.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <bb5de326-899c-4c32-b9af-f1698316e5f8@moroto.mountain>
References: <bb5de326-899c-4c32-b9af-f1698316e5f8@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 14 Mar 2024 16:30:39 +0300, Dan Carpenter wrote:
> On Fri, Mar 08, 2024 at 04:04:47PM +0530, Bhargav Raviprakash wrote:
> > +static const struct tps6594_match_data match_data[] = {
> > +	[TPS6594] = {TPS6594, &tps6594_i2c_regmap_config},
> > +	[TPS6593] = {TPS6593, &tps6594_i2c_regmap_config},
> > +	[LP8764] = {LP8764, &tps6594_i2c_regmap_config},
> > +};
> > +
> >  static const struct of_device_id tps6594_i2c_of_match_table[] = {
> > -	{ .compatible = "ti,tps6594-q1", .data = (void *)TPS6594, },
> > -	{ .compatible = "ti,tps6593-q1", .data = (void *)TPS6593, },
> > -	{ .compatible = "ti,lp8764-q1",  .data = (void *)LP8764,  },
> > +	{ .compatible = "ti,tps6594-q1", .data = (void *)&match_data[TPS6594], },
> > +	{ .compatible = "ti,tps6593-q1", .data = (void *)&match_data[TPS6593], },
> > +	{ .compatible = "ti,lp8764-q1",  .data = (void *)&match_data[LP8764], },
> 
> The casts are no longer required.  Same for tps6594_spi_of_match_table.
> 
> regards,
> dan carpenter

Will remove the casts in the next version. Thanks!

Regards,
Bhargav

