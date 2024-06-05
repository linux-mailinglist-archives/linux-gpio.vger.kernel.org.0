Return-Path: <linux-gpio+bounces-7204-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A975B8FD638
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 21:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A3412821BC
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 19:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1696F13B2B9;
	Wed,  5 Jun 2024 19:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUTu3Zy5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6379945030;
	Wed,  5 Jun 2024 19:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717614377; cv=none; b=QbQu18V8qiua+aOhcHhX/ilCAKrhrMuxXr33h8lf6/pCYIu4tmBjZB1JpSwkio3hJGaEbj4IOy8d6ADNV6AmMkyvH8yICjLNVE7sjnNHccVXl4MzGCvdzVIwzFqoX3Md1XeinRghHzZDAaTSaASlR1OvE0u9zi5cjrN15ZQe734=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717614377; c=relaxed/simple;
	bh=qq+M2c9YegqKnpKKBqVK3MQB5Dp/Y/BO95wVLDILlOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LkyHTolEQPRoqoCmVTBuKym4wSH+iXomCtiyJwCW2uUuyY8vwgskFDWyeMhNIaC0iG39X9HY82/72cpf4vZqN6QTUCEWOpUbrfBkuTcqzzjvC43d1E3WDKsQNjpawfzdKhuGq2UI8klU10k5jE3Rm5+lo+4weFLo0tyR2eHZm0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUTu3Zy5; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57a526c6a2cso165894a12.2;
        Wed, 05 Jun 2024 12:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717614375; x=1718219175; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qq+M2c9YegqKnpKKBqVK3MQB5Dp/Y/BO95wVLDILlOU=;
        b=hUTu3Zy5LfZ9RnyTpy3s5nvS6uuvCF+tIx+bYsfJpV31BzgcOL3/kQXOuFAebIl2om
         voBfGC8M5FVFOjacoKZhBCwzLkpiAmJsEyTGEHRCYqMOYypsJhYzKvs/F4L6EFOjadyW
         c6LcrYruqRtlKzry0BdZTxeW8oC2iyfreVvCXUw+XONFhTLnE3cJ2EmzZ8GEBk6z+4Bq
         5uYSnnNMdXDaDXl0N0zmI1IG6MTRpMtXgALd8KJcT4fsjRGGZQdgafBxQm6rBcQND6kN
         mhqbo20NBMdUUSj2s5DFK45XQw4pCXF3xRk3QU1WJQ6UmtSHa1a7tV6PQIi6dnoat0zK
         Y9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717614375; x=1718219175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qq+M2c9YegqKnpKKBqVK3MQB5Dp/Y/BO95wVLDILlOU=;
        b=ByrRE66cNCSegrBi7cX9JJapxhQV/nTWDvucGxfnyZ3oR7xQ3L1WHVMHS/J1oGwLJa
         tKvdMmQqHI3WJSya4w2G0udtwnjknT+UzpJE8+o2GPL3TGuknzye6V33DkZ/TndwvstM
         kuHP3PjuG3ke6W2tXSN+/9vWYcDXTIsOlWLweNTEmt8rJPU6Uzg/dfqYvBlu8rR+1e7T
         HoXeCPKpze3qQonpwtGslFMXmgegYiRM45qB+Oek4HeBn6flGCy67yvpqxrkCWwoIFEn
         GRGhfR4SY3vLPL+XT2Z+nP0KHLCyEUulLwfpeJl4GE4YSivrdPOhXa+bLNND23EMtlcD
         nSbw==
X-Forwarded-Encrypted: i=1; AJvYcCXD5Trbok52z8HoGZMavmpNff8BslFm5kBoYw8hVSyliQOkKYq2cllt2Ncle2HOAZ+bYwIlJDMKW/DeZmo7JwUpimV8mcC9uaOFIPrwuEgvIfypexIBUbsSjbkmF4jyG+nhtX29S5yOcyBS2qd5BYabJc9k2HA/4R74suk5ADBfyIFtlV/4RerYCg9RFWBZOft57sTB2u23jGXJpW2x3lddaNJz3U1f02wsUX7qGTJNHObocjEvCDpeIiJqKVJvPg==
X-Gm-Message-State: AOJu0YwvZni4S/X+J8xsZkHEVBX51WnY6CZzgf9IET3fzS4ETCXY9ifw
	VK/ITy/2RwsJCu/1VQE73v/XjbQ+EkpG40wxiR+5IqVij1aZ4DlHpqo2aYBTIkVGl5kMfgWwjqT
	XQnlgQNdKFPdDfxQOlyDeOAeP06M=
X-Google-Smtp-Source: AGHT+IF23/xRdP7P8N5y6TuoTb7yn/vvqWaiOXqdpB/ZldVT0IhlV6YfTjVPOUivLO9r24Qx7V84qrwKXUOA6fxB//M=
X-Received: by 2002:a17:906:4816:b0:a58:e3d9:e2d6 with SMTP id
 a640c23a62f3a-a69a024cf61mr221021566b.56.1717614374459; Wed, 05 Jun 2024
 12:06:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605161851.13911-1-kabel@kernel.org>
In-Reply-To: <20240605161851.13911-1-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 Jun 2024 22:05:37 +0300
Message-ID: <CAHp75VdGQUBnbZ2G4tLYBBCD+PeiY4G6HZ6U9ammSMg72TNX7Q@mail.gmail.com>
Subject: Re: [PATCH v11 0/8] Turris Omnia MCU driver
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Dan Carpenter <dan.carpenter@linaro.org>, devicetree@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-crypto@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, Olivia Mackall <olivia@selenic.com>, 
	Rob Herring <robh+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 7:19=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org> =
wrote:
>
> Hello Andy, Hans, Ilpo, Arnd, Gregory, and others,
>
> this is v11 of the series adding Turris Omnia MCU driver.

Thank you!
There are a few small issues here and there, but overall LGTM. The
only one main question is what to do with gpiochip_get_desc(). I Cc'ed
Bart for this.

--=20
With Best Regards,
Andy Shevchenko

