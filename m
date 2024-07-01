Return-Path: <linux-gpio+bounces-7861-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE95D91E6BB
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 19:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0817CB215DC
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 17:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81FD16D4E4;
	Mon,  1 Jul 2024 17:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWufiPya"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204162C6A3;
	Mon,  1 Jul 2024 17:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719855311; cv=none; b=J7O+uC/gq0yDW++1IZjCRMPPYGM8y7z4AjARVFW8sZT77RoqtAikzeZ07mF+7knCYf2OdOOe8ip4aq25O4JMpJ+j4ZOyXLs/Q58NnJU8oF96MH+TffPwMWuNNM5iqGhPWqjIyJlp61dDqcKCFN+AM+qez8E0OtMvmJjR8gsFzx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719855311; c=relaxed/simple;
	bh=eMUK88Zxgj9+wIAa/RNuw5n5b2uHuTug1Nf7Cn4jkuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZx11RUwdiGTTPn3j7rmKmE2ju2uM1GMPS/wLVjTGDkNk7hc8CXsrM3PeHX40dhWyiwOYm9S8bL+LV5kHa5r5y8vKvu1sGF/oc3Ja2UX6sjjsSehSXXd24zB7fcyR0dqlXbGWMLVzV5B1/jr2NcPBJ1zcHb4uEOQqD1xKMN6nK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWufiPya; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f6a837e9a3so12966795ad.1;
        Mon, 01 Jul 2024 10:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719855309; x=1720460109; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RQx4TbyfLwOkNp0Df3+N76RXmylTlUXtbSxzOj9UZLY=;
        b=UWufiPyaT87w202dv/0IGxRfhYs5DZ/dETN8opZMboM8HsuOmOdQLRkGqXP2kPfnSg
         834+4fcsq80+6s0oyYSdmvRxlTOH+tuc+TSPeb1TGy5rtZyUI76n060RZZTsH3q7pWX4
         sKly9QGcWyZda3OYhxNCKMU74fjAO4mbnoQRBqnFig7bSut3H+x++hc/slxp+T/sAHq5
         nPCPzi+1TQ6PVS9OlSlJ1N8jsiCwH5cBUYuM+M8QO2x/xwo5OwCyGjdrd04ArasJa5OF
         t1Z4BIaKm3XP2xDUAeqO8/famcWGNlBHOcg3seIpjen4BPOsMETRKfQOKldkKAIQpqZx
         Qziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719855309; x=1720460109;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RQx4TbyfLwOkNp0Df3+N76RXmylTlUXtbSxzOj9UZLY=;
        b=sJpwm0u8Ko2e4cQ9BCtz3CVxMJPr2RetPXV0TDQ3ANfC8QOkAZ+CXXpYLBGKTenlV9
         nOE5UHmFHwI8YuMEud1dqPffiCH0MNsfiIR4cF9tCNwCbePg8QnIa3YA0ZHN8cPjMEvJ
         QX3XaznVcbz2FuKxtKplWHEfbxCEi7w0fHb+pkdo/ubgROvCBmwT/6Jslr8tR2JwEtue
         sUa46SFKsvb//IKsG2vOFB4aFtGeQzF49OZNd/BEtoVYudmJx3EEkcFaWDHXkOO4Js9F
         EBdCqN+5oyYzNsT5xi9zH+whUR7ZeQXiWxaQnzJODGxensiPpocBKroaeQ6n+JSbEBq4
         lhvg==
X-Forwarded-Encrypted: i=1; AJvYcCU04zXb6zXdarMWRgaVuh9asHL/QG/LFfMVPIKJ6NE7tPe+0FriFusAe85hPtTZfUYLWQATgLRSMG61Gj7SJI6rMtKBAnbddRaQyl/kjK/A8GSeGppRbB4GATDL3bLtHfg3Cu0Vkkw52Q==
X-Gm-Message-State: AOJu0YzbvJw5iI6Y/Q+kBWsWGO/SQJdVOzYjE+v1i2lBiu8xn637SGhD
	vE5lKOrSmZ7Gge6zy1EG1TUxhbHcpztiXttrya3bTn4WaVH0OZxc
X-Google-Smtp-Source: AGHT+IFAVJ5SdjIF+PfjyJWd/aIl/4j+3YMMSQNnLMcOITt1gru8XX6BPfPPlJiePPoEy6aZ+bgKCA==
X-Received: by 2002:a17:903:1104:b0:1fa:1dd8:947a with SMTP id d9443c01a7336-1fadbce7b67mr32326255ad.46.1719855309050;
        Mon, 01 Jul 2024 10:35:09 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7783:69e6:8487:f6ab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10d20c1sm67522405ad.30.2024.07.01.10.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 10:35:08 -0700 (PDT)
Date: Mon, 1 Jul 2024 10:35:06 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Martin Schiller <ms@dev.tdt.de>, Hauke Mehrtens <hauke@hauke-m.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: of: fix lookup quirk for MIPS Lantiq
Message-ID: <ZoLoyjBa6xY85YBv@google.com>
References: <Zn8CZ47e3LFncrDP@google.com>
 <CAMRc=McMn6k7QMXLHphNS03BtO=i9xKBwxa71MeVXhtNSFdiXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McMn6k7QMXLHphNS03BtO=i9xKBwxa71MeVXhtNSFdiXA@mail.gmail.com>

On Mon, Jul 01, 2024 at 10:51:00AM +0200, Bartosz Golaszewski wrote:
> On Fri, Jun 28, 2024 at 8:35 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > As it turns out, there is a large number of out-of-tree DTSes (in
> > OpenWrt project) that used to specify incorrect (active high) polarity
> > for the Lantiq reset GPIO, so to keep compatibility while they are
> > being updated a quirk for force the polarity low is needed. Luckily
> > these old DTSes used nonstandard name for the property ("gpio-reset" vs
> > "reset-gpios") so the quirk will not hurt if there are any new devices
> > that need inverted polarity as they can specify the right polarity in
> > their DTS when using the standard "reset-gpios" property.
> >
> > Additionally the condition to enable the translation from standard to
> > non-standard reset GPIO property name was inverted and the replacement
> > name for the property was not correct. Fix this as well.
> >
> > Fixes: fbbbcd177a27 ("gpiolib: of: add quirk for locating reset lines with legacy bindings")
> > Fixes: 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod API")
> > Reported-by: Martin Schiller <ms@dev.tdt.de>
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/gpio/gpiolib-of.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> > index 59c7f8a2431a..d21085830632 100644
> > --- a/drivers/gpio/gpiolib-of.c
> > +++ b/drivers/gpio/gpiolib-of.c
> > @@ -203,6 +203,16 @@ static void of_gpio_try_fixup_polarity(const struct device_node *np,
> >                  */
> >                 { "qi,lb60",            "rb-gpios",     true },
> >  #endif
> > +#if IS_ENABLED(CONFIG_PCI_LANTIQ)
> > +               /*
> > +                * According to the PCI specification, the RST# pin is an
> > +                * active-low signal. However, most of the device trees that
> > +                * have been widely used for a long time incorrectly describe
> > +                * reset GPIO as active-high, and were also using wrong name
> > +                * for the property.
> > +                */
> > +               { "lantiq,pci-xway",    "gpio-reset",   false },
> > +#endif
> >  #if IS_ENABLED(CONFIG_TOUCHSCREEN_TSC2005)
> >                 /*
> >                  * DTS for Nokia N900 incorrectly specified "active high"
> > @@ -512,9 +522,9 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
> >                 { "reset",      "reset-n-io",   "marvell,nfc-uart" },
> >                 { "reset",      "reset-n-io",   "mrvl,nfc-uart" },
> >  #endif
> > -#if !IS_ENABLED(CONFIG_PCI_LANTIQ)
> > +#if IS_ENABLED(CONFIG_PCI_LANTIQ)
> >                 /* MIPS Lantiq PCI */
> > -               { "reset",      "gpios-reset",  "lantiq,pci-xway" },
> > +               { "reset",      "gpio-reset",   "lantiq,pci-xway" },
> >  #endif
> >
> >                 /*
> > --
> > 2.45.2.803.g4e1b14247a-goog
> >
> >
> > --
> > Dmitry
> 
> Can you rebase it on top of v6.10-rc6? It doesn't apply to my fixes branch.

Ah, yes, I had another quirk to TSC2005 in my tree that gave the
conflict.

Thanks.

-- 
Dmitry

