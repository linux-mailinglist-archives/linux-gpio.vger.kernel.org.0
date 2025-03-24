Return-Path: <linux-gpio+bounces-17900-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9DBA6D5C2
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 09:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EB66168EE0
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 08:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3EE025C71D;
	Mon, 24 Mar 2025 08:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EHftJuRD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B4B2505C3;
	Mon, 24 Mar 2025 08:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742803435; cv=none; b=BSGhjG+Y/bS7pN+IHO0I3l19g05LZIZE8qPT3zcd9ltqID6FRe47zC3959/6L4Lf8go//6L8fl2E/2lCysOC6Ji5bIJ5EPlQ9uq50gltMabV+C6qfk5nBAtLjvKFrevHmMA63BzppgOlk1hQr52bF3luvpXU2nB6Jc16zHnirbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742803435; c=relaxed/simple;
	bh=WmLJyhwZHjGeC4aKtVK3ebUIzWrjQBf6zkELTnjir+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CW7/h5ZD9xQt2BfIgHDS5i0ElI78kLzaao+AxWj+2VcCVukraSh+A+Ipj/yRIOUEy9L7fnRxK1Hv6IcFrvb+JEVsKvr9KzEwJbsYp0hpTA9CepOdlKQvVGQHV+PPGN/mwUMEIz2xKedBnyYr9yenYSRIOEnOanYA7WwQLeKs6IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EHftJuRD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C168AC4CEDD;
	Mon, 24 Mar 2025 08:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742803434;
	bh=WmLJyhwZHjGeC4aKtVK3ebUIzWrjQBf6zkELTnjir+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EHftJuRDZDL5iPdmmX3QWlVa82j6kQjDcCPnjd7bNkub8CK45MXyi+r3HZic0hLUu
	 ch1TYQtqBAck3fgfgA/7wiJwUClm5s4WpMhxI6EbCg/PGfHh8uYeukk5zAYubzsCDK
	 ttwZ4T24YCpIU/7QUQkeRSdBtXBWlZSo+bXTXEY6X4ZcyFw5GOiq6t2j/kfx6Qaso0
	 /olgVjZvuvoB4ziEUlg3q0ZV70bFPViVcgTmJudSdgTlEocr3sd3T6pBbXOg5vgb/e
	 yRMajPL+Km0lQZwbgX9d7CAiun1DCFlfC4+huIWnRpq24cj2uYyVXPKtwnuqrqTvTh
	 FqK63R6bl7wUQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1twcmn-000000003B3-3c2l;
	Mon, 24 Mar 2025 09:03:53 +0100
Date: Mon, 24 Mar 2025 09:03:53 +0100
From: Johan Hovold <johan@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, Steev Klimaszewski <steev@kali.org>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
Message-ID: <Z-ER6elHDYtIY0ap@hovoldconsulting.com>
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com>
 <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
 <CAKXuJqht5ZiFyt2uWXwPSEdszYQWKHm22+mAQCPQXn8b7AbL-w@mail.gmail.com>
 <PAXPR04MB8459D61091A8BF9ABD94DA7E88A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <CACRpkdZXG0JC7_-Mg6Dpq08Y=Kr3M+fRWQF_bPG8c-WH8pA9Mg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZXG0JC7_-Mg6Dpq08Y=Kr3M+fRWQF_bPG8c-WH8pA9Mg@mail.gmail.com>

On Mon, Mar 24, 2025 at 08:46:07AM +0100, Linus Walleij wrote:
> On Mon, Mar 24, 2025 at 8:33 AM Peng Fan <peng.fan@nxp.com> wrote:
> 
> > > With this patchset applied, the wcd938x codec used in the Thinkpad
> > > X13s stops working:
> > >
> > > wcd938x_codec audio-codec: soundwire device init timeout
> > > wcd938x_codec audio-codec: ASoC: error at
> > > snd_soc_component_probe on
> > > audio-codec: -110
> > > snd-sc8280xp sound: ASoC: failed to instantiate card -110 snd-
> > > sc8280xp sound: probe with driver snd-sc8280xp failed with error -110
> >
> > Thanks for help testing. But per current in-tree DTS, the reset is using
> > GPIO_ACTIVE_LOW, so it should work.
> >
> > I am not sure whether you are using firmware published DTS,
> > if yes, could you please help check the codec node to dump
> > the reset-gpios property under /sys/firmware/devicetree/xx ?
> 
> I'm also a bit puzzled.
> 
> I think maybe this device has some DTB that comes from the vendor
> with the wrong polarity :/
> 
> If this is the case we need to add a quirk to gpiolib to force this
> GPIO into active low,  something like this:

I'm quite sure Steev is using the mainline devicetree with correct
polarity so that should not be the issue here.

Johan

