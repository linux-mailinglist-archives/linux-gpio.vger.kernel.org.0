Return-Path: <linux-gpio+bounces-6268-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 003898C0CF3
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 10:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94FB91F2244F
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 08:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA1B14A4DB;
	Thu,  9 May 2024 08:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqR3R/7e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8102714A0B8;
	Thu,  9 May 2024 08:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715245074; cv=none; b=iM4wUIfn/9SrjXuQdVHCjaBgu9Bk+cZ5JzoU4v6ZbOyWInc1npH2ikEPpZ9SW+oAe++iHE9MXC2PIXeRIL24kvYrOO2sY98IXz86qqMCd9RjCseMO+dA2xW315IHGwBb5w/JnUMRNb4RGwYmKABMUm2qDf+gIJC/yL1dbQa5JEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715245074; c=relaxed/simple;
	bh=ERBm4CPFRavg/qmw/LpsN4foKtvtDY+mu84TopSSqb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWaceZQcYR1zqnbZ6GwT13n63OL+VfBcvUAece2edybDP3VApZQeCeCgkQ3Zh9JNZyMyyq5IpLrY35UA6W0i0C1mvfF9iV6Xp03FDJT4dtkkzyMC01jW+u0Cb2qTKXMlHQXmMoyJVoLJAtrYzEEl9b3Ne8ufAc4ivLHAlVoQky0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqR3R/7e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03848C116B1;
	Thu,  9 May 2024 08:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715245074;
	bh=ERBm4CPFRavg/qmw/LpsN4foKtvtDY+mu84TopSSqb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SqR3R/7ekBvH3+juAkmyN3yZdrt+dfsdBGohZapBilU5zsq2ZhSItHTsCUgG9a1Nk
	 Tossf2tdkzJBkqOeOMCHlBHcXnU2MeQZchV/kKI4rRUMFabTeVoQZLZh1tBXpqYw3F
	 R5iThVGGicpxUTSI6V3n85DgErHjrDgl0dLZZWUDewB/On4tDoOE8gNhubEoGzbP3f
	 f4QwdGi5c5OI2c+zk5v+7QOPNLryQ6zFFuA6xQn36BKGkBMzgTlVwT+t9nI9xbgh5w
	 r3KSERbNOtv9jX5pbcXRdT6xnaV/aPLDAlz3ol2DTUsi8augHNwCMeb+bI8dv1avQv
	 ZIw003VLPVdCA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s4zbC-000000000Zt-1IT1;
	Thu, 09 May 2024 10:57:58 +0200
Date: Thu, 9 May 2024 10:57:58 +0200
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
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
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
Message-ID: <ZjyQFrqHT2HBOWY6@hovoldconsulting.com>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-13-johan+linaro@kernel.org>
 <Zjkq_nWyvc6bUtiu@surfacebook.localdomain>
 <ZjpMeVk_HiixZUEu@hovoldconsulting.com>
 <CAHp75VdUFMvkj-r76H7GFZdpcoh_nb8v6CBj4wBHztNhiaWULQ@mail.gmail.com>
 <8d2ea17c-f91e-4e14-a239-e5e999f6ac50@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d2ea17c-f91e-4e14-a239-e5e999f6ac50@linaro.org>

On Tue, May 07, 2024 at 08:14:43PM +0200, Krzysztof Kozlowski wrote:
> On 07/05/2024 19:22, Andy Shevchenko wrote:
> > On Tue, May 7, 2024 at 6:44 PM Johan Hovold <johan@kernel.org> wrote:
> >> On Mon, May 06, 2024 at 10:09:50PM +0300, Andy Shevchenko wrote:
> >>> Mon, May 06, 2024 at 05:08:29PM +0200, Johan Hovold kirjoitti:

> >>>> +MODULE_ALIAS("platform:qcom-pm8008-regulator");
> >>>
> >>> Use ID table instead.
> >>
> >> No, the driver is not using an id-table for matching so the alias is
> >> needed for module auto-loading.
> > 
> > Then create one. Added Krzysztof for that. (He is working on dropping
> > MODULE_ALIAS() in cases like this one)
> 
> Yeah, please use ID table, since this is a driver (unless I missed
> something). Module alias does not scale, leads to stale and duplicated
> entries, so should not be used as substitute of ID table. Alias is
> suitable for different cases.

There's no scalability issue here. If the driver uses driver name
matching then there will always be exactly one alias needed.

That said, we may use a platform device id table instead of matching on
parent compatible if subdrivers are going to be reused by multiple
devices. I'll consider that.

Johan

