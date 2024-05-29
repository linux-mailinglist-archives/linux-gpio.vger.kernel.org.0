Return-Path: <linux-gpio+bounces-6867-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E91A48D3BFE
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 18:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A5881F22C71
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 16:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F2A1836D8;
	Wed, 29 May 2024 16:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BqeHSE29"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9533C139588;
	Wed, 29 May 2024 16:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716999142; cv=none; b=F3zLpoBgi+LhxKoAp2/Rk76oDdf9YWLrZIUiggHiNL5dPhu1KA2jJcLpvhij76QmNJCd7XNmJDXez6xBD4RYQG2kP31M7P0kDuEOgORE9a+9R3u5afOnFbVJxH7QC/DgXVorr+T+9VKhWNM3wKOJIDDJvBBrOIcUZKkekkSUUyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716999142; c=relaxed/simple;
	bh=lgaCkdJMIInSxiz7vBoUGg06CC1AH2OE5Ds7z+4uj20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jz1pi9e+1DmyZ/wO2cgFQzhQsXwRfB0luPi8Lxcl57TYfH/mdWtoNXPudJS4l64Qd7uZrRS4S5p5BtIMSGw3y+2xXAnMlyuCmIrAU2uYg7yyxR9DxaztnE5PG7ccbXHROndhrIwFfZKIM2Rr84ocrkq3uhPXX85JeLtdgWoj9ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BqeHSE29; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 058ACC113CC;
	Wed, 29 May 2024 16:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716999142;
	bh=lgaCkdJMIInSxiz7vBoUGg06CC1AH2OE5Ds7z+4uj20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BqeHSE29QPnQMignrE5w2XGYGsXvCmiSMZwHZIs81kkHHSlo1Ut5Fy8KB3hn6ZCe6
	 M0p+2lFy18KGXOVT2vtwAqwlhT/SQ/DvuXXA6SfQOHN1G6Q8m8q8lgXQ4NcnpsQGrr
	 pluMllHL4ndKJPTBSzXoowFPmHwgOi2LhF+mo9ljwaF3DQhdntqBflrqx3ngZYnadL
	 vjYrwYBlaKXrSERTo3SQe24YTHr/DJnBGMJo7iuBvXoAC4IUqH6Qd1sElZTIpG6VI5
	 YcnQ9wZSiDnVkamjVgHyvaZ2IkVhOzdP6x5B2z40kdQ6gyq18+Qyg9+qYyaNLFeTJa
	 QVTFEjNVfCTYw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sCLuX-000000004RK-1VGX;
	Wed, 29 May 2024 18:12:21 +0200
Date: Wed, 29 May 2024 18:12:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 09/13] pinctrl: qcom: spmi-gpio: drop broken pm8008
 support
Message-ID: <ZldT5ZqUkTc0klt8@hovoldconsulting.com>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-10-johan+linaro@kernel.org>
 <CACRpkdakSEGLsx+GwGe1PwTaOT3sBc2a=P0vvdUA3Q3xxHjGsw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdakSEGLsx+GwGe1PwTaOT3sBc2a=P0vvdUA3Q3xxHjGsw@mail.gmail.com>

On Mon, May 27, 2024 at 03:35:41PM +0200, Linus Walleij wrote:
> On Mon, May 6, 2024 at 5:10 PM Johan Hovold <johan+linaro@kernel.org> wrote:
> 
> > The SPMI GPIO driver assumes that the parent device is an SPMI device
> > and accesses random data when backcasting the parent struct device
> > pointer for non-SPMI devices.
> >
> > Fortunately this does not seem to cause any issues currently when the
> > parent device is an I2C client like the PM8008, but this could change if
> > the structures are reorganised (e.g. using structure randomisation).
> >
> > Notably the interrupt implementation is also broken for non-SPMI devices.
> >
> > Also note that the two GPIO pins on PM8008 are used for interrupts and
> > reset so their practical use should be limited.
> >
> > Drop the broken GPIO support for PM8008 for now.
> >
> > Fixes: ea119e5a482a ("pinctrl: qcom-pmic-gpio: Add support for pm8008")
> > Cc: stable@vger.kernel.org      # 5.13
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Is this something I can just apply, maybe with the DT binding drop
> patch right (8/13) after it?

Yes, I guess so, unless it's easier to let everything go through MFD
(except possibly the regulator driver).

I'll be posting a v2 in a bit and include these two there too. You can
either pick them there or ack them as you prefer.

> IIUC it does not need to go into fixes because there are no regressions,
> right?

As I mentioned in the commit message, the driver is backcasting a
pointer to an incorrect type, which could lead to all sorts of trouble
even if it does not seem to be the case currently (I did not check 5.13
for example).

Since it has always been broken, I'd rather err on the safe side and
just drop it also from the stable trees.

Johan

