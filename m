Return-Path: <linux-gpio+bounces-7053-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AC58D7E13
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 11:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 827081C213AB
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 09:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BDF58AA5;
	Mon,  3 Jun 2024 09:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="RlT25X1h";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="MkqWUf2P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4466A7E574;
	Mon,  3 Jun 2024 09:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717405583; cv=none; b=cnBWlemBKFsT2igFQtX5yPAyRlgrKlLVAvfnq1/T7DI7pLtrummk/JLx/WEkoU4DFrRw8XM0j5g+YGbSEg/X38QcsrMapXT5X468cCN8llriqZ7xFEXlPVxpRhfg4U2fDkVOulniIh4CXKDjIh6AmX+31NI0k7TKdJzaJTt8nCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717405583; c=relaxed/simple;
	bh=tPh6FXqgRbk0T9fW+LucBxh2D9g9iXidnjVQC35HepE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gX8/7B41Ojm6GgQ3Fd9a7t732a6YGv+FhP4a0x+l48mfhkMKnv6jFhoQwApyCqtZ9cauUYSE+FEE9Dcuh56BiV/Q73ceRjNlJlqH04tfHC9sD8Hh83Zgbu6g7jWBg4xHoMA1gxetJMuMhpdfkJUANH01Uq8TrEoRIizJbmRCbtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=RlT25X1h; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=MkqWUf2P reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1717405579; x=1748941579;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tPh6FXqgRbk0T9fW+LucBxh2D9g9iXidnjVQC35HepE=;
  b=RlT25X1hcgMBpe/eZncwMeLvcfFWX5IahubAp+eAqSW4HmVgI252NpCC
   r2m3Y2iccTGf5haqgnv6/WTyxnQ4QAg1ripIWR3WxjZzjzHmT4+27xzRy
   4F4FzksrX52QuIbX/sKOU52FOPG5e25OZ9ZleBNRYIX4PzaVZBVRa5MxE
   AElvSz6Jp6qMNeswwH+B+yNqrLzDkzz5GVtls19qSMGk+NL197rReDxmq
   CVdktaYcx1psY5+p65d+mHOFuvFGHDyU6Ep3Ch8QjEtX4MqtDT1i8TiGN
   YIPYGCdHOi6M0UmftWD/Y6W+dZpjd55wARaW3NYHGSYnQ0FTD21KZbcse
   g==;
X-CSE-ConnectionGUID: eaxFAt3gQ0+oOfNgD3D3tw==
X-CSE-MsgGUID: jXPCe+ufS5uSPNF3wgASEg==
X-IronPort-AV: E=Sophos;i="6.08,211,1712613600"; 
   d="scan'208";a="37183844"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 03 Jun 2024 11:06:11 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA211161492;
	Mon,  3 Jun 2024 11:06:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1717405567;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tPh6FXqgRbk0T9fW+LucBxh2D9g9iXidnjVQC35HepE=;
	b=MkqWUf2PAj51NVcOrglx/84MjlP0YX3cIjyX5+FxOHd8khDdNI70Q9+z99RpYNxu/Kyabe
	3jaPy0uKE1B/gSMBIEOuv7w8uItHD9m+az7Rg3cNnsUd2cdhvZ2Sm4Rgx0Tns7BvHPNCT3
	ijISrLwMf89hB7vU05YiYIn+RHK0FZj/7eVgCjkhMfOtMH5HdKvcvjyRaC0tgG8dSqHBDf
	TDohh7iyKS3EJXu/1Vm6h+z5pCO5RT+XA+0sAdDoIE7KlW33oxG3r5k3ujX6ck/4ml4CxI
	OYq82LiGp3tpmvyQCCGVjxultuNgATS67vUPagHw8GEosAVd7D49oyrW/2f+pQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 2/2] gpiolib: Show more info for interrupt only lines in debugfs
Date: Mon, 03 Jun 2024 11:06:06 +0200
Message-ID: <12451373.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ZlnREkzvS0rnMUDv@smile.fi.intel.com>
References: <20240530191418.1138003-1-andriy.shevchenko@linux.intel.com> <7750850.EvYhyI6sBW@steina-w> <ZlnREkzvS0rnMUDv@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Freitag, 31. Mai 2024, 15:30:58 CEST schrieb Andy Shevchenko:
> On Fri, May 31, 2024 at 01:19:56PM +0200, Alexander Stein wrote:
> > Am Donnerstag, 30. Mai 2024, 21:12:30 CEST schrieb Andy Shevchenko:
> > > Show more info for interrupt only lines in debugfs. It's useful
> > > to monitor the lines that have been never requested as GPIOs,
> > > but IRQs.
> >=20
> > I was trying to test this on TQMa8MPQL (i.MX8MP) using gpio-mxc.c.
>=20
> Thank you for trying!
>=20
> > But apparently this series only has an effect when gpiochip_lock_as_irq=
()
> > is called eventually. I'm wondering what needs to be done so IRQ only
> > GPIOs are listed in debugfs. Using irq_request_resources/irq_release_re=
sources
> > similar to what pinctrl-at91.c is doing?
>=20
> I haven't looked deeply into this and I don't know if it's relevant, but.=
=2E.
>=20
> The idea is that GPIO driver has an IRQ chip that announces handle_bad_ir=
q()
> as a handler and IRQ_TYPE_NONE as default type at probe stage. It also ne=
eds
> to implement ->set_irq_type() callback where actual handler is going to be
> locked.
>=20
> That's what I do not see implemented in the driver. Moreover, I do see it
> implements its own ->to_irq() callback which shouldn't be there.
>=20
> Taking all above into consideration _I think_ the drivers need a bit of
> refreshments.

I noticed this driver is using irq_chip_generic and a dedicated irq domain.
I'm not sure if this is superseded meanwhile using the integrated IRQ chip
inside that GPIO chip.
Thanks for looking into this.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



