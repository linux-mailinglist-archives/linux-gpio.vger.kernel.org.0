Return-Path: <linux-gpio+bounces-18770-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0425A87B4E
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 11:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 728A13B2D76
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 09:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43BC262D27;
	Mon, 14 Apr 2025 09:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BWt7J/s9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CC325DAE8
	for <linux-gpio@vger.kernel.org>; Mon, 14 Apr 2025 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744621300; cv=none; b=G/EmawMYe69C+CHcGWm/0CnpW8BRLMR2o/Y4PbVzee6+0U41BTCM0UwqdiUXTSR8TKib2F4tEXXkfI+NW7Sd+JttvL0TTEv+rwUxzuHj74dhrod5pVXG4DBdw5P1Fn0dgy3TjWg9JdZ0hUY0QKxYCws+1j3UxzPLJXWz2wRhEGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744621300; c=relaxed/simple;
	bh=NL2TGpDIJnKJLRnd23h9LgHRVuBV+Ktt+8xcaN6KIFI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uApdhSWhvc84ssH6e13HBcnhBb7SMtUsiGbArTpxltGvgCeXV/sY3oPZq2DANhCxDI+ZUmb2ZdVe82SyyPnw2xeqgAx2Mgq/5Y13hJelrnp+AVa9mrOB6tXLlqwR6QkJUFOHtIrHb0rfQcXCYe3B10Ic1hvudve33l0eae1V/x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BWt7J/s9; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so684044266b.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Apr 2025 02:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744621296; x=1745226096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FPOEfxN91t6VGg4utPDevtYddqW0HAL5VO9JP2cPRZo=;
        b=BWt7J/s9YV/VAOEc7OQF2YUju7YbYeIpodRYNsYtyweNtzkQWUaNq6rFFh0nNbpv9L
         idr0VZ9J78Nl8S34s9+ZJtl7DFyE3vNr8SEZ87JdZy4hImG1WlnI2RjpSfkHs6BmWW2B
         87Wm1xcJ2Wz+zjLBnPYAhMQ+C6P8/+PlGIpysxb2v5mGH4VIPIOGSSMxh5Ag8LA3jLk3
         RVdaghf11CqCg6skFuM+3LaigbGU9f7Uiy6T6rqIYeiUrI8xlj9mi6m5xyUYNUKRVlfr
         UqRV6QgDzRXAt5ulhv68I7aDg41Sh4eoJiGIOijRHIEaJ5W2tAstR4nYmEFNvUqCY9Dl
         iBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744621296; x=1745226096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPOEfxN91t6VGg4utPDevtYddqW0HAL5VO9JP2cPRZo=;
        b=uyDDRatVpaDLFUfX8w4I/Hz5hGIS+rqRePx09LUqJIB2Q6iw5I0dsr55qwH/izMZuN
         RhWnN5jYfhG6JwWZEb3N3PfbYUQbpiUX7pnyitOjcbpdT0sdRX0dUKSwOIrt4/bItuOR
         DAsV5UZe/jXPriFSkX8e6i/yWWjbz4QgCvQGYyGbsW0nGoKPe54R23tk/zEkh0rWmDfW
         FwbI+39r/oXYMKQTHTdcP6WUCZGY4dQvZMrdJYpxhv+0UcssgXMM6SK4S+wyh97ROIre
         f/yS2NtrBNvrTcFVsy3Bf2FoydygteVkFEEJaV75gV/nsG5dpxA9SBMqM6WmhhClsm8D
         y+mw==
X-Forwarded-Encrypted: i=1; AJvYcCXwV6mUt9I3+WQp+2S9XpAygCih2pzjVtmIrCDydKwq7+ZcnjGuK28aq90qCpChH93KUokPuEgKxeua@vger.kernel.org
X-Gm-Message-State: AOJu0YxpFrg0605ldprAG82DXQ6xFF+y10NtI8evgJBaYvLFcg4dpLuB
	bb7XIgRezr6N/FxOeXt4cIM514DidpfKEa3cEXCHrJ6PuYAeWwz6WdOdHGt33CM=
X-Gm-Gg: ASbGncueXW3gEbhpW6aqXrEoYEOekd2K5/2jUoH5m97gZqeu77nBHsfc5RHrRT9Q4O4
	jX1WlqG/uscuip8SGIdKYRXXkL+mdBnwgP84shPCS8VNi3QjJqt/MS2ef/iuZNz8yuphPf9hxJi
	JDbQyiZ2KwPXExzz8gQVNAYkin74MeWEp55yhaj6NYWJzhFK5xXO7v49sQr9W1GIFu2zZiFwDBD
	cXyp1kZSZ8g2aWrXZ8Eb0Y09gE44lIa/iGv+V+H1IZ7k+us31LwF7JySMl6J6KONKhoWkgbmR6I
	fX61ukY01okk34eCh3DP+u2RTD7/O6jYXgs4ji8E0eE3Gjx6aLAj9530SZz5sj1A1V7WWbdRaBa
	YEalefg==
X-Google-Smtp-Source: AGHT+IFmbGr9kZB05oV1EN/0KfR241wQsclfRn1B+/FEvNm78/Bf5RFw5+zsFio1fzhhJ8sSkqIJlQ==
X-Received: by 2002:a17:906:730e:b0:ac4:4d2:3867 with SMTP id a640c23a62f3a-acad3499ff8mr901526366b.23.1744621296460;
        Mon, 14 Apr 2025 02:01:36 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce7fdcsm883504566b.176.2025.04.14.02.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 02:01:36 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 14 Apr 2025 11:02:58 +0200
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v8 00/13] Add support for RaspberryPi RP1 PCI device
 using a DT overlay
Message-ID: <Z_zPQpyjZXzVxroB@apocalypse>
References: <cover.1742418429.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1742418429.git.andrea.porta@suse.com>

Hi,

On 22:52 Wed 19 Mar     , Andrea della Porta wrote:
> RP1 is an MFD chipset that acts as a south-bridge PCIe endpoint sporting
> a pletora of subdevices (i.e.  Ethernet, USB host controller, I2C, PWM,
> etc.) whose registers are all reachable starting from an offset from the
> BAR address.  The main point here is that while the RP1 as an endpoint
> itself is discoverable via usual PCI enumeraiton, the devices it contains
> are not discoverable and must be declared e.g. via the devicetree.
> 
...

since there has been no feedback for a while, a gentle reminder about this
patchset. 
Several patches have at least one Reviewed-by tag, with the exception of:

- PATCH 5, 8: those are, respectively, the driver for RP1 clock and misc core
  which have no major rework since the inception.

- PATCH 9, 10: those are new patches, where the most relevant change is a
  rearrangement of the dts include hierarchy to be flexible enough to support
  both the dtb overlay approach and the monolithic dtb.

- PATCH 13: just enables OF_OVERLAY config option. Some metric data have been
  added to help evaluating the impact.

Many thanks,

Andrea

