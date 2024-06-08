Return-Path: <linux-gpio+bounces-7282-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A43290125D
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2024 17:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B5131C20E33
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2024 15:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C74017B4F1;
	Sat,  8 Jun 2024 15:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8t8n9g3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C042524C4;
	Sat,  8 Jun 2024 15:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717860999; cv=none; b=cgOUdC1Jm7HkBphHxmBsd9pIx2ICJk/WCv8bD9tUpRzAGTnbJ/c4hY+r8jdFGeUsJZzFDd3xv4mpZznasMKbsX6Z3bvfZ4HLemF/1EPvxk6CixDvi6EywINBMFsB6iwuQa/6xrsLc8+yEeMDhZCHWEUy7VZtdcMZeqVDSEOJqr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717860999; c=relaxed/simple;
	bh=Lxc8FIGJH9AbsQK8+T8lqmbchM2MCKBlEd2TlFucpn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgBtnkOOBBP5500M3KbB85bkAz3iRen6IvvK90teKhWlpaCqDmnwrSHbbJFiaMbWlRt6iLtud50HfYxXTMyjGr6CoDNGHdbgjWN+xzTH/wA0a5XPkugzV9Y2xw4nvF0DQ02xmlIB6R6ZuS5xD0HFe6NuaZGGirYwCcm+tP5YlTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8t8n9g3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B181CC2BD11;
	Sat,  8 Jun 2024 15:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717860998;
	bh=Lxc8FIGJH9AbsQK8+T8lqmbchM2MCKBlEd2TlFucpn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V8t8n9g3DdnQi6HbzO99CllgnRPCHO0UOdTLP5gY5Pq+6sCOXhFY0hQt145+myUW6
	 YmU+QPW0vYuZui7LIgfsGPgdc/CwUyKUtCZQZI/i9h7UEUDfjmILlM/J6lenoCUt9a
	 vUEaES8V4EXvJjBNcUy6HBiLwl867JiPQbeUILCQv9CyzKKhoWeK2usEJwHI/Du2eV
	 op8s/I6Nf+es87msb+9JE0LoSol1gxnVh3qRXABJYKsRH8jmiSuhJ3ETRtCfrpztSC
	 eboKEQcXox59QbCdMfdF4QzTs/+DtwFozsipP4+9u3ZSUx/CNDvkKiKHGixK8DjzP3
	 HciYNAy4c2ofg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sFy7Q-0000000034R-2FCt;
	Sat, 08 Jun 2024 17:36:37 +0200
Date: Sat, 8 Jun 2024 17:36:36 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 11/14] dt-bindings: mfd: pm8008: rework binding
Message-ID: <ZmR6hPVZsYlyC5o5@hovoldconsulting.com>
References: <20240529162958.18081-1-johan+linaro@kernel.org>
 <20240529162958.18081-12-johan+linaro@kernel.org>
 <d5omeycp4l3mrzgswga2jkgxydpiayqfdjavwnfswcojawiqkt@zuol3vvkao5r>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5omeycp4l3mrzgswga2jkgxydpiayqfdjavwnfswcojawiqkt@zuol3vvkao5r>

On Wed, Jun 05, 2024 at 11:43:16AM +0300, Dmitry Baryshkov wrote:
> On Wed, May 29, 2024 at 06:29:55PM +0200, Johan Hovold wrote:
> > Rework the pm8008 binding by dropping internal details like register
> > offsets and interrupts and by adding the missing regulator and
> > temperature alarm properties.
> > 
> > Note that child nodes are still used for pinctrl and regulator
> > configuration.
> > 
> > Also note that the pinctrl state definition will be extended later and
> > could eventually also be shared with other PMICs (e.g. by breaking out
> > bits of qcom,pmic-gpio.yaml).
> 
> Obviously we want to adapt this style of bindings for the other PMICs
> too. My main concern here are PMICs which have two kinds of controlled
> pins: GPIOs and MPPs. With the existing bindings style those are
> declared as two subdevices. What would be your suggested way to support
> MPPs with the proposed kind of bindings?

As far as I understand newer PMICs do not have MPP blocks and we do not
necessarily want to convert the existing bindings.

That said, if there is ever a need to describe two separate gpio blocks
this can, for example, be done using subnodes on those PMICs.

Johan

