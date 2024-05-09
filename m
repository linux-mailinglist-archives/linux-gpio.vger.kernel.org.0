Return-Path: <linux-gpio+bounces-6274-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1828C0F2D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 14:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2722B2236D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 12:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A303114B94C;
	Thu,  9 May 2024 12:07:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A6514AD1B
	for <linux-gpio@vger.kernel.org>; Thu,  9 May 2024 12:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715256427; cv=none; b=PG7bQ65UFagMFqmFID+gsq1lSiBAOrMTB+LOyI7AWuc6wzEKdVi/nOo11zx65y6iXsOFS+4fPDAX5DWVsXX7GcaCdC1LBomh9UGbXDepp2qkvlSv3ZK4C+IzhapOrxaP9JK/NEu4wmmRl4p9d0QB4VOUDhtQd812i2mVRXS11bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715256427; c=relaxed/simple;
	bh=kpbzqpy6Rhe5iTf0LFJ+eXVAVyIAjSiwFfmOtEu0JAM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMQnfv8sTTf0RuEAJNARytwOAhwi9T8SeqwsQQdcjdRwV8quinQRQmkkBdOfnDnlwsPVPlprt+Dilrgc1BImk5eTIF2xjZtra5gtGSyOLR9UKLWVnla4BlB+Kw/Sf0FEACQxBY0gP1EAAQN6QE7EEdte7qz7MHxaMGca2CnMQuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id a526c7aa-0dfc-11ef-b972-005056bdfda7;
	Thu, 09 May 2024 15:07:02 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 9 May 2024 15:07:02 +0300
To: Stephen Boyd <swboyd@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
Message-ID: <Zjy8Zj_naFQ2Ri0M@surfacebook.localdomain>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-13-johan+linaro@kernel.org>
 <CAE-0n52KTZ8G2VuvrDgJ9kAE61YULXY4u6nPP3CYWpg1CBjbXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n52KTZ8G2VuvrDgJ9kAE61YULXY4u6nPP3CYWpg1CBjbXA@mail.gmail.com>

Wed, May 08, 2024 at 10:37:50PM +0000, Stephen Boyd kirjoitti:
> Quoting Johan Hovold (2024-05-06 08:08:29)

...

> > +               BUILD_BUG_ON((ARRAY_SIZE(pldo_ranges) != 1) ||
> 
> This should be an && not || right?

> > +                               (ARRAY_SIZE(nldo_ranges) != 1));

In any case BUILD_BUG_ON() is not encouraged for such cases, it would be much
better to have a static_assert() near to one of those arrays.

-- 
With Best Regards,
Andy Shevchenko



