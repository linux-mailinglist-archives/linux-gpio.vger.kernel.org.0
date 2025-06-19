Return-Path: <linux-gpio+bounces-21863-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0F1AE017F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 11:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0DEB188C986
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 09:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EEAD21C9E3;
	Thu, 19 Jun 2025 09:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="NNdidGsj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7FA1494A3;
	Thu, 19 Jun 2025 09:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750324208; cv=none; b=bZl7ig3WT+ApRU/NaaVrRt0hGsMU5ALNaOFWvegt2ZsHVeyX76MHiWyZTlcu1SyRpE7TgUmpHD/4dcvSpKuXAVP5gtWkBoe5Ck2+xPCjhD/zpFpg69muIxfOCQYJGU4hdYVBIAt4AgpOM4RXcmsxyABIUE+rgbrFznn8Z4w1sx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750324208; c=relaxed/simple;
	bh=roh28ZHZlzmyIxiIaWM61lfqv9feWcpiDK1S0QOohw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CYccd1UaRJ0fuiz0PAu8s6TuoF1i/l0I0T+aoNP68EvfSPtObPnTX+kgGsA3Q6eGTkFjFohWSd7GqcCkaWxGdayqtPgvk67NS5Cmn8Nrqi/QzF4ZCUclv8AMmiOYz1JkyNpUCUOpBnCF8/a9v+2eqZq9bJdOwgvY1p2s3UEbX9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=NNdidGsj; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=roh28ZHZlzmyIxiIaWM61lfqv9feWcpiDK1S0QOohw0=; b=NNdidGsjFAloDLykgzJ+rXflzt
	hHoxaZBRaIkmbi8B95jk6fpWNR+yl0/uAzdXOHZYbbyRV/zTzdgTDv3GIWeoYDIyvAiTj3iQpHXNN
	eKbxKsk/rD7qZvXpcJtLJT4CYQJje7c+bVGv3/P1H1i5udyq2S05tU7EUWviqmrdZU+517j0fNg70
	0phjPvUGZHy9ehi2Eph0/7tkIE7B7ep2Jz2xODTiEak1RHcdB61Eevyv/Petq0hnE2tOtfRp8U8rg
	LM2keIuyMlU4ONGcDTWCDRwDYj9JV9VTpwJ174txSoWCDjPHUGf8p5GyHo/+WfFWXndCjAnDqm6bz
	oYZcHTxA==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSB1J-00078r-Q2; Thu, 19 Jun 2025 10:53:17 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject:
 Re: [PATCH v2 05/12] gpio: pmic-eic-sprd: drop unneeded .set() callback
Date: Thu, 19 Jun 2025 10:53:17 +0200
Message-ID: <2628868.NgBsaNRSFp@phil>
In-Reply-To:
 <CAMRc=MdkDF_HjRvCvUdKueRgNYDxe=aeGeWAw9bBgnAZ=kxZAA@mail.gmail.com>
References:
 <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
 <20250619-gpiochip-set-rv-gpio-v2-5-74abf689fbd8@linaro.org>
 <CAMRc=MdkDF_HjRvCvUdKueRgNYDxe=aeGeWAw9bBgnAZ=kxZAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 19. Juni 2025, 10:36:06 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Bartosz Golaszewski:
> On Thu, Jun 19, 2025 at 10:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The lines on this chip are input-only. GPIO core can handle the missing
> > .set() callback so there's no need to implement a dummy here. Drop it.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>=20
> Baolin Wang <baolin.wang@linux.alibaba.com>

I think re-adding that trailer broke - missing the Acked/Reviewed part.



