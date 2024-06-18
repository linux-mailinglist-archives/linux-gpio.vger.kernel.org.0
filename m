Return-Path: <linux-gpio+bounces-7548-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6082D90D939
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 18:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 056931F21F34
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 16:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E3F524C4;
	Tue, 18 Jun 2024 16:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maquefel.me header.i=@maquefel.me header.b="hLs1EMY3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from forward501c.mail.yandex.net (forward501c.mail.yandex.net [178.154.239.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8976770E4;
	Tue, 18 Jun 2024 16:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718728170; cv=none; b=fqcPiy8xOX2QNaV7UkX0OpLRFS0ak8gfyK14Umb9OFhC8z/zkhezqCXocOxrAMvd7lQsKOxBtCNfA/2O+cFGqfpBIDysMLfU24/koT1jyMrhQLa52SOe+7HnKalZ755iMzElFlHVAPuvSI/JQRx2RTYp1YrZxNhmvPTrek68qtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718728170; c=relaxed/simple;
	bh=NNATBtdDMGXed2giCTW1DwB6fcduOtiFaUb75X7xHFg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R2ZmQJZTrY/aMwt2ou2Xa/7zdKeKMaTaoJ9G33XciysYCqZ4/DFHo/seBwKYEJYzF3ashVcipA+PhaWfgjefGK0o1BsY7e45hBv0j1ePjyXvwxAggedsvc+LzzTD6J5uK2YqL5JgfDZx9LnZrpX06GunJcsKUWnz70ahC75usH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maquefel.me; spf=pass smtp.mailfrom=maquefel.me; dkim=pass (1024-bit key) header.d=maquefel.me header.i=@maquefel.me header.b=hLs1EMY3; arc=none smtp.client-ip=178.154.239.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maquefel.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maquefel.me
Received: from mail-nwsmtp-smtp-production-main-45.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-45.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:2146:0:640:e7:0])
	by forward501c.mail.yandex.net (Yandex) with ESMTPS id 93E42613FE;
	Tue, 18 Jun 2024 19:29:18 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-45.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id HTLk6SYoLqM0-BYs3NsdX;
	Tue, 18 Jun 2024 19:29:18 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1718728158; bh=NNATBtdDMGXed2giCTW1DwB6fcduOtiFaUb75X7xHFg=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=hLs1EMY3K9bnMNXLJVXLcZcgwgn0K422xeCa9z+LXiA3YAiYLcIticJ54ttbQiRjP
	 o76du3OpqHVXI3rX63EESDRT2+Lfjplx38d8+f8EFu+re6dYOa2aIZMRROH+iWbIUq
	 PeDoACEdqbPk6OvOc+4RF1JhWsbKh1SpMzr5Vtfo=
Authentication-Results: mail-nwsmtp-smtp-production-main-45.sas.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <6f9b86b6b79ca0fe7f0379e0e6c6bde4c4e07652.camel@maquefel.me>
Subject: Re: [PATCH v10 04/38] pinctrl: add a Cirrus ep93xx SoC pin
 controller
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Arnd Bergmann
	 <arnd@arndb.de>
Date: Tue, 18 Jun 2024 19:29:17 +0300
In-Reply-To: <CACRpkda_uMuk4AFOdQSPTWXuibH7nE3R_qSnrecboczddQw+uA@mail.gmail.com>
References: <20240617-ep93xx-v10-0-662e640ed811@maquefel.me>
	 <20240617-ep93xx-v10-4-662e640ed811@maquefel.me>
	 <CACRpkda_uMuk4AFOdQSPTWXuibH7nE3R_qSnrecboczddQw+uA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hello Linus!

On Tue, 2024-06-18 at 12:27 +0200, Linus Walleij wrote:
> On Mon, Jun 17, 2024 at 11:38=E2=80=AFAM Nikita Shubin via B4 Relay
> <devnull+nikita.shubin.maquefel.me@kernel.org> wrote:
>=20
> > From: Nikita Shubin <nikita.shubin@maquefel.me>
> >=20
> > Add a pin control (only multiplexing) driver for ep93xx SoC so
> > we can fully convert ep93xx to device tree.
> >=20
> > This driver is capable of muxing ep9301/ep9302/ep9307/ep9312/ep9315
> > variants, this is chosen based on "compatible" in device tree.
> >=20
> > Co-developed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> Is this patch dependent on the other patches or something I can just
> apply?

Well... it won't work without DT and:

- ARM: ep93xx: add regmap aux_dev
- soc: Add SoC driver for Cirrus ep93xx

And the above will complain if

- dt-bindings: soc: Add Cirrus EP93xx

is missing.

It's harmless and won't be compiled with current platform code, but
will fail to compile if "ARM: ep93xx: add regmap aux_dev" is missing.


>=20
> Yours,
> Linus Walleij


