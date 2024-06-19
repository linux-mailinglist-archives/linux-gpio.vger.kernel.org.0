Return-Path: <linux-gpio+bounces-7566-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C527C90F6DC
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jun 2024 21:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73FFA285757
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jun 2024 19:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254AE1586CF;
	Wed, 19 Jun 2024 19:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8ty+Ly0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441E915749C
	for <linux-gpio@vger.kernel.org>; Wed, 19 Jun 2024 19:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718824698; cv=none; b=L5QOXqRuwK1KUQvXwf8yzh0wJP7B0OmyWrOrccdReQ1PEM6GoRkuwtWY5EazO8dy7HL0IzTAi3D5h/0oKXRq/ZDGpYWJ35VjLctNBluGhXSqVTIPazM0WRKszhbPJzIfT9k0xC03u8hPjmwKszdHbwE/uEUuTOFWcQgdnNxy+wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718824698; c=relaxed/simple;
	bh=V6ov9fAAfeDIzzql/NHpQf+c6iNaAOn/mNJ6JyifQtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CxJdgVmJOm4OCnryBEulGS1yqD2UrP+7BSbO/srbPGayBUjo3qfICkmbIoRqOvT9igHS/AVKLzscej2ZAfKCfQRpIz6YFw6A1YwUnuJ5VitjIbVg6NOjG5YQd6qNCwNLfkY2sPFwISKyFkgFLmTb13JjNJpWh1GgYDeV4gFRj24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8ty+Ly0; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52bc335e49aso122185e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jun 2024 12:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718824695; x=1719429495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6ov9fAAfeDIzzql/NHpQf+c6iNaAOn/mNJ6JyifQtQ=;
        b=T8ty+Ly0ZCkZFsxYh+9qrYAyyTR4ljGxOh672AxsqsvVMboPCTgidgorC4RcRjhqYI
         J1taucmajx6TkwciCkg2Yf2pY7ppfEO0ymDXHHtGO4sSfG6UwAdhDcNi9YQ4BRGKO998
         Nh1sB7gaxKhEOF2Pn9k1RJbV/48oqjb2Fybg9tBD9Y4zBvnpJ6e9TAT1Ya+7393xiAh7
         LX1vJueanG+VEpDcLVBr+XMNvAW/+X9kAs1EqsHyttANxJN8oGYaFIJmpRNXy3ujbQF+
         Cz87TiyWYbrb1qCX9jdOO5RjL6yVC8RJ/Q3+5bJj69nlgUahY06YQzN09hyfo/KfDD2f
         SwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718824695; x=1719429495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6ov9fAAfeDIzzql/NHpQf+c6iNaAOn/mNJ6JyifQtQ=;
        b=g420lQGb3uOci3g/TJiNj95xcYikKvr20uNMbk6Tlu0XvOidnczXWUf/S6nuidaNb6
         xNTS1ou9/6Qg458TAbQX6rg1kSkLYPfhcPHgssZFWXqi5hrpj0Gi8DAJroYzVvaFD8Q5
         wdLMtzAC0yBh35XDE4s4Uf94AMTM7e7/0kFAR0LUgMMk3uULD8r1jAYa5Ox2ERCEc4vi
         JLEz4P5HTZET3xC6wo+n8vz36d8BBITOLriCX28d5bulMTIj3F3JsIKhjX+tD5WyI77n
         24/0qnp4qJphobzF8K1Q5i8tLnsyWA4quo13Kg5AO11lxPaE3JaWhViH1BTLSmxq9Zuy
         6s2A==
X-Forwarded-Encrypted: i=1; AJvYcCW8l4y0qeQeX4oIrY7PJzJ0znRjr+pNTdURcgd2XMEpZXGcxM6sEjUAOWlrvLVcO5is6VFTMky8Rg5Gx7X6do2Oyft+6dd9zgx3vw==
X-Gm-Message-State: AOJu0YxJdeVDSLr38FLty0Lg1shI3NJxV7zff7clZ8Zw2DTvpEIktsi/
	pNiOb+Y/7Ud8yEdl3v3j1FHkzkAEOEkOwYc9vxMM8aSEwsNK0/90saUWKEjjzLrKVAAeWs21076
	nflqXXZIETh7sRd3w+AI7HK+qKes=
X-Google-Smtp-Source: AGHT+IFnfwbc/VU9w2YSBFb5PQYnFlMSGaKbWMpv4ugEOg/lXaizpGaPQtIEfujU5/uRVS9+KxHgc8a4ihdQ6gC03JU=
X-Received: by 2002:a05:6512:2e7:b0:51b:214c:5239 with SMTP id
 2adb3069b0e04-52ccaaa238bmr2008019e87.62.1718824695116; Wed, 19 Jun 2024
 12:18:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFNQBQzOZhOns6EfO9XJP3f=e0h8E=PBVxFxaC3QZsbBqiRh0A@mail.gmail.com>
In-Reply-To: <CAFNQBQzOZhOns6EfO9XJP3f=e0h8E=PBVxFxaC3QZsbBqiRh0A@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Jun 2024 21:17:39 +0200
Message-ID: <CAHp75VfGW8by7UW04x7ciqQnVPGL_nOKHrEn7vhb+WC40pWm3w@mail.gmail.com>
Subject: Re: Wrong GPIO mapping for Alder Lake U?
To: Andri Yngvason <andri@yngvason.is>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 2:31=E2=80=AFPM Andri Yngvason <andri@yngvason.is> =
wrote:
>
> Hi,
>
> I'm trying to use GPIO on an Alder Lake U processor with a ACPI device
> id INTC1055.
>
> Commit 0e793a4e283487378e9a5b7db37bc1781bc72fd7 added this device id
> to drivers/pinctrl/intel/pinctrl-tigerlake.c and states that Alder
> Lake P uses the same PCH. However, I am having a very hard time
> matching pin names from the schematics that I was given with names in
> the source file or with names from the dataheet for P-PCH 500.
>
> Based on Intel's web page [1], I have been able to ascertain that
> Alder Lake U has P-PCH 600, for which the pin names in the datasheet
> do indeed match what I see on my schematics.
>
> Is it correct to conclude that this is simply wrong as is?

TL:DR; Do you have any issues in practice with any of the GPIOs on
this board? If not, then there are no problems with the code :-)

The Linux ideology of device drivers is to avoid code duplication.
Since we have the same IP, we reuse the driver, however in the
original one the pin names were used for different PCH. So, if the
issue is only with the naming, you need to find a mapping between
schematics and the standard form of GPP_X_nn (where 'X' is a group
name, and 'nn' is the relative number of the pin) that is used in all
of those chips. You may follow the comments in the code which starts
the groups of pins followed by the pin names and numbers. As long as
you know the basic (or "normalized") form of the pin you may easily
associate it with Linux pin number via the source of the driver.

> [1]: https://edc.intel.com/content/www/us/en/design/ipla/software-develop=
ment-platforms/client/platforms/alder-lake-desktop/12th-generation-intel-co=
re-processors-datasheet-volume-1-of-2/



--=20
With Best Regards,
Andy Shevchenko

