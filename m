Return-Path: <linux-gpio+bounces-11174-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18802999FB6
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 11:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 486741C24001
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 09:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7248F20C46F;
	Fri, 11 Oct 2024 09:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UjlKepA4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B88A20C471
	for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 09:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728637442; cv=none; b=FIcrBAykjczdwiw9gIQZ6PgynXNN2hmGLQ3GmmoOy7CZvZCcD0X8EpNLqCsnpAOt6XJer+pR7kQBQEJnePYPkDfvTEnah2Be1ptiJ/mnZjqzfPtZiyTph8HOHXDU2fGu0ogwaO5k4uMFLaldutpIktZiipdelQ6ItVaWn2kr+HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728637442; c=relaxed/simple;
	bh=8d4yjmVwCnaXxPXrZ2Bik8WHksaHIVN+6JB2kOkIujY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f0kRlsVpqb3onCHEudRk43YN7/JRb8LV3BkrFZwXvtedFBXx4fjT4Sf9ymjuW3BbPxJa5Oy9nEfgt9LoyK+t7eu/foDnRWlDlnGfa2CMoy+Z4GFzkvheTJj/1/gG2zN+ENBuCl3kjP80ivGN4/hxl8SyW1iYLWzeJICi0lBuDoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UjlKepA4; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2facaa16826so16354831fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 02:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728637439; x=1729242239; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8d4yjmVwCnaXxPXrZ2Bik8WHksaHIVN+6JB2kOkIujY=;
        b=UjlKepA4hAD++SNdy4LOvTtOw5ntAamFNtOgJrl7dvwC8IUPOa7K/0XYwrqZLD31ru
         4FHGjztNtOMH2pb/w3YjJ3ikFns0urYSNzSahMYApTk0E7HQVGG/Maz1ccLZTYOAdZEJ
         wRxypVtkF30WHz4P7W9FdDRG2/gGZN/8j5TXxip8iAYo+SnIxf8xguNAJJ/S6El28LrX
         SuUv5Bwt9sIvdScFo4EIhNU4Qvhfgxk9/9PSe8irDOFwlPNV+MEpIaAk9aq+xIJYKaRm
         eEhF16Un5/CcK3UIixNmVn33BhtnM9CBj4/CpzdUPA9hiIwdFHpTC/pTG3GiIK2C+BQg
         qIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728637439; x=1729242239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8d4yjmVwCnaXxPXrZ2Bik8WHksaHIVN+6JB2kOkIujY=;
        b=TgpZNcrNZve5V9SiKmuiSXaCYPMLqA7fPg6Da+WCWG2mQxT1zo7rwNfkZ73DQqJPMJ
         Llh7JwwKr6qoyQqMGnri1RiMvYz+fTyymOSsfimxBRqme5Un/tQO5UZAkWFW99dGQ5eg
         Bj0N9uQhOT6bEJ08SY9+muP0ANToerne2O02ng7ANEUlVhLkvVIcAbTAcTeTm8MQuX+s
         ILRXLOH9ruVLKOWA4VvpbgLm9Qkz8wM9qvubQp0+Qizu/XB77pCWQ+zXzrPhsGailjoZ
         MQpWrgezCOjhlFJjd3sYWMM5OozKTaiClp7LJFb/n2xZfN+MuajUnFI1EvRLR0bkjafQ
         a+Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWMmAj3Wxib0yjv25W5uG03qUM4/jeZxN4S8zP9jxyzOudMUJInfgcJhCHW+tXsF8wd3Gq7cdah1cG8@vger.kernel.org
X-Gm-Message-State: AOJu0YwTC/jZ7EY8IdqBcXP8rT+xex6kyLUOgJsbXWFq5q4utS4WFrU0
	4vrtR1lB3la2hnqBH9WpN+Otjc8OvKNxatvyMo8ODMgSTK6aYT7Wn52QmiAerLwp5oDRp7VZu4f
	72GIeeP8qp0JWzEhNHmIK6vAUbaLF5pupVQazVA==
X-Google-Smtp-Source: AGHT+IE5OeNgFUzqHYTpHS7727BD0udgza39pHKdVWlcHOHz9ZIbGL1mxOhjbFQg5l0MRwkHUObjvdE6hjbd88hX09I=
X-Received: by 2002:a2e:f1a:0:b0:2fb:3a92:d1a7 with SMTP id
 38308e7fff4ca-2fb3a92d591mr3422661fa.33.1728637438600; Fri, 11 Oct 2024
 02:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728300189.git.andrea.porta@suse.com> <199a4994312b120c73c95fa368954ad5a2a8aee6.1728300190.git.andrea.porta@suse.com>
In-Reply-To: <199a4994312b120c73c95fa368954ad5a2a8aee6.1728300190.git.andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 11:03:47 +0200
Message-ID: <CACRpkdb1muovPmKoUw=Q5sNXj3bsCt84LcKVDSLY09_5_1rXZQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] pinctrl: rp1: Implement RaspberryPi RP1 gpio support
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 2:39=E2=80=AFPM Andrea della Porta <andrea.porta@sus=
e.com> wrote:

> The RP1 is an MFD supporting a gpio controller and /pinmux/pinctrl.
> Add minimum support for the gpio only portion. The driver is in
> pinctrl folder since upcoming patches will add the pinmux/pinctrl
> support where the gpio part can be seen as an addition.
>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

This is a nice driver and I find no issues with it, what causes
an issue is gpiochip_set_names() as pointed out by Bartosz.
If you can live without the names you can remove that part for
now and we can merge the driver, then you can add the names
later when we sorted out how to share that function.

Yours,
Linus Walleij

