Return-Path: <linux-gpio+bounces-6236-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4738BFB97
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 13:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE0B9280FFF
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 11:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B11B823DD;
	Wed,  8 May 2024 11:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAYSy4Zx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3646226AFF;
	Wed,  8 May 2024 11:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715166458; cv=none; b=Ttu/REyI7HpF9uJlMtu/tpVk+iFM0WWNHf3p3b5a42Q3orzB2m1xaeRVrnFaRKG7sUe6bNZ/QuQdvCnA0bJdrq9OxVCtG/iN1MIXtTbqrpuePMTH4hwJqftluqbWGWkN/Eezq/4koJ/bMrWNGj9DS2IiYtCF/XYwBrqK7mi7iLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715166458; c=relaxed/simple;
	bh=V7GBnBDkMXB1vDOsItRAYKimjv5+T9+PIhMfKKHaH2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwKm+Mz90CR56MOFerJuo47im9YLbS9Lt6MY99/zFgi4s6llEVb32zy2OFsvVqBTLxivJEeKfnHE+tQWEBOrkYit6QrLNZRghJIJcdx9TGAPGTZTzLzXQcTIX4k0ty7IpjxQAe+meIK3XNDl4bF8wt7i2lGbqDs++41Vrfm7Nd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAYSy4Zx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64790C3277B;
	Wed,  8 May 2024 11:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715166457;
	bh=V7GBnBDkMXB1vDOsItRAYKimjv5+T9+PIhMfKKHaH2w=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=lAYSy4Zxsn6uP/+yZKic3Wfy9yyDBv+3uRAog4Z4Nb5H4z390AkxIv09TmHqQOenx
	 A/nH1z1Zr3SWErMlgDzlPSZrkLYBC2kWWnKMZ1db5ydlx2ZZmR2pIfWc8Gdb6U5mfy
	 zCVc0XXjiSfUQk+KFJCdlxeT3B3nYeT0Z1HCyQ592EHQiMzRNPKUFqy/KTyQjRpDLP
	 ldsQw3MhCatdeZHUCMOJV7CLawVEDvlOiKc7HT7SApau0qhap3mZFailiLUo9bPr/u
	 O963FmZ7Bow3D5/KLzsdkfAiySVLW8tIsygp6iAWaeJLaPcrjU8b2hqtTVhYta3I6G
	 yl4MT1cg+1rMw==
Date: Wed, 8 May 2024 13:07:22 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v9 2/9] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <20240508110652.myapaorbdbgfwquo@kandell>
References: <20240508103118.23345-1-kabel@kernel.org>
 <20240508103118.23345-3-kabel@kernel.org>
 <Zjta1vXG0Yak3vz-@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zjta1vXG0Yak3vz-@smile.fi.intel.com>

On Wed, May 08, 2024 at 01:58:30PM +0300, Andy Shevchenko wrote:
> On Wed, May 08, 2024 at 12:31:11PM +0200, Marek Behún wrote:
> > Add the basic skeleton for a new platform driver for the microcontroller
> > found on the Turris Omnia board.
> 
> Some cosmetics in case you need a new version.
> Possibly can be done as follow up(s).
> 
> ...
> 
> > +Date:		July 2024
> > +KernelVersion:	6.10
> 
> TBH, I'm not sure you manage to squeeze this rather big driver to v6.10.
> 
> ...
> 
> > +static const struct attribute_group *omnia_mcu_groups[] = {
> > +	&omnia_mcu_base_group,
> > +	NULL
> > +};
> 
> __ATTRIBUTE_GROUPS()

I think we already discussed this one. __ATTRIBUTE_GROUPS defines only
one group, and I am adding to the array in subsequent patches.

> 
> ...
> 
> Perhaps also
> 
> 	struct i2c_client *client = mcu->client;
> 
> > +	struct device *dev = &mcu->client->dev;
> 
> 	struct device *dev = &client->dev;
> 
> > +	bool suggest_fw_upgrade = false;
> > +	u16 status;
> > +	int err;
> > +
> > +	/* status word holds MCU type, which we need below */
> > +	err = omnia_cmd_read_u16(mcu->client, OMNIA_CMD_GET_STATUS_WORD,
> > +				 &status);
> 
> 	err = omnia_cmd_read_u16(client, OMNIA_CMD_GET_STATUS_WORD, &status);
> 
> and so on...
> 
> 
> > +	if (err)
> > +		return err;
> 
> ...
> 
> > +	/*
> > +	 * check whether MCU firmware supports the OMNIA_CMD_GET_FEATURES
> 
> Check
> 
> > +	 * command
> 
> command.
> 
> > +	 */
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
> 

