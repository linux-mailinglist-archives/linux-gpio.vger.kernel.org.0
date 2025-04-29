Return-Path: <linux-gpio+bounces-19444-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD708AA05D0
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 10:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BF5646099C
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 08:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C6525F7AB;
	Tue, 29 Apr 2025 08:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kgfkFngT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6417A1DF754
	for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2025 08:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915497; cv=none; b=Qh5IGe0/GYc/SzG4exllc0nVegGoGZdJeXDKZQj7Thcm+dsuPAoLBw0BzFANH0c93p0ZGxDOW3wK5Ze2y5TDH9YSO6K1HTgT8yQxE0t9f+1Z8iDsxW2teD1xwCUtStRBBRCDlHeYi+u2j7rLZ/TaZo9LJM0wyCd5jpmc9sQ6vaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915497; c=relaxed/simple;
	bh=gF3fPF6CllcQs9x0YHwVW91aBk4339QyjWLq4v3kcvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C71E9tuvQmbr+RP2kOvUyBiCR/K4NcspPL62L2r7uahUDrWGZENtWjN+Vo7hEIF3vyTMX8nqE2888T7pDH8M5M18aFEWJ10aeLKPzQ/zUl8h+o50OygiQfwakgJmcXauiX12hsggbVnwPG1sEtRrlHnbQDFKlnKqMSOjnT2B0PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kgfkFngT; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54d98aa5981so7308996e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2025 01:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745915493; x=1746520293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gF3fPF6CllcQs9x0YHwVW91aBk4339QyjWLq4v3kcvo=;
        b=kgfkFngT99U37cDcTimcj0eBfZU1V/wgcNATyGtPXehLnEVmGSUE0LU3wq+5ZjH7hG
         EnzsgEizMSscxt7wEpR6A/FDTu9ru6KCnm2WawOoobl/AfOKVmj/Zixx4SOiIAQaGXF1
         1UNZHLkqTg0oyrUf7ezNnbx0rGSVAlRVfUMAszfezTwjOKhPfzdmuT5XJ0sHSRvt+P3A
         YsUEZ2TdJAHzA797v7glxk+EbHylXUKTBGxWN5cA6RCFA8gOniDGir32XzLTQwQiuBy/
         nbYWlni9+vITWDvbo48cIl6itlAHj3TXtZfuKUps43G3m8fPz4cV46DWM+1FD2MGAMQd
         qyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915493; x=1746520293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gF3fPF6CllcQs9x0YHwVW91aBk4339QyjWLq4v3kcvo=;
        b=rr4UQzqOHLdv/YOtijNiVw5DzafOEIHkPLUtdFn6mfnNBvrUE7ceaDQyhvZCPUTPtv
         +sGXJo7eT3n81Ii3Tt8A+G4TTyugtUch95dqGHtCkRlkzjceE44axzud4XsvPtn60yij
         o6euK7vLRDnFU+E31B+fCOpJoBIFZGhLwJG7wJPa/sqc3++bSAQSO31Ya3GVNWh+hbyk
         Miw2NooIRQcqBbTpYNf43QhrVnHL2APAdSZwweOWzrFic3JGGpGW/toTpxqQ2ixFqe5x
         +oZFORuzw2NTr8q1FgCMf4EFiKCm5Bqlf0bHrUk1RLW1md2ReMeXHszffPiPMoGyKBaP
         voMg==
X-Forwarded-Encrypted: i=1; AJvYcCWOxHkRpA4xZ4GXTdfvSDa2jZQmzxnR2DO+tNO/T4I8yWsLptiFolcU9IrP2RNrKq5LEHqEStozqUSE@vger.kernel.org
X-Gm-Message-State: AOJu0YyXqElKlbpfGhnMVUF1lAyF4h57KmujNFoF2TWgpny5q2T20xrt
	xGa86kEeZOAH6qDO/s+HPmMa/wwdr7ZkmDgaPCEn3d/8EvA23m87FeNW77KagSb77CawERPZC3q
	rBmvoupsMwP+rGfpbz9dYpQgQWY4XxyKNcqdMXg==
X-Gm-Gg: ASbGncv7oRhNGR9pHr5+TDDMfw4lHb+Tvk+j4wUU+NjoYh3zbplwQRxeRdqNxdVQUil
	cvb3iATw7O/hArj1Qyp1vAzHIFWysWC/mopF2xMOtJmhLsB4psCNks6to6UsHRKrXFZGECHQ6Ct
	EtnJZ0gvv38mN18pw2NdTQSw==
X-Google-Smtp-Source: AGHT+IEQGZYoiDX6agThY6MEttiXW/phwPHOzvMp4EUn15NcMCCtvMBuCxgvpSJ2KIlE88xdOI9ul/LqAjmdMjo0Oj0=
X-Received: by 2002:a05:651c:b08:b0:30d:e104:b67c with SMTP id
 38308e7fff4ca-31d36ad1ac0mr6506481fa.39.1745915493462; Tue, 29 Apr 2025
 01:31:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:31:22 +0200
X-Gm-Features: ATxdqUEwnjlawzkertE2U747LwGdYLhBGRSu2FbSCTDtMI-ddocvoVo9dn0tQa0
Message-ID: <CACRpkdYbf4zSrkzrGLn9+Sn0Wh5LvZxW3omCdMP4w1VdFf-iZg@mail.gmail.com>
Subject: Re: [PATCH 00/12] pinctrl: convert GPIO chips to using new value
 setters - part 2 for v6.16
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Paul Cercueil <paul@crapouillou.net>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 10:35=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> the another round of pinctrl GPIO controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patches applied!

Yours,
Linus Walleij

