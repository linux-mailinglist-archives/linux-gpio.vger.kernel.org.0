Return-Path: <linux-gpio+bounces-3379-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7511856FB2
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Feb 2024 23:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73567B21920
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Feb 2024 22:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DC91419A4;
	Thu, 15 Feb 2024 22:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HyDbZN/X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17091419AA
	for <linux-gpio@vger.kernel.org>; Thu, 15 Feb 2024 22:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034428; cv=none; b=qTctiGKALTCtLUZ6aTILqjGA6gIMuC2mpUd7zXqkwtek9h1I8y5J6cUjLEtXf4ApYQndInG+BWlGnKymeApfF4+bFMknVO2XpXfKkfRe2HWQjpQ2B2bQm9zZ04EDzTHJK9o1DnBLoPvEiHVNrLCcyV8zdAVH0+VCOQK5H7IkbEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034428; c=relaxed/simple;
	bh=m0ottLDJAZHNYRCNzmWiH7yuWIWrCPNNHSBS/QgSsrU=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f1TNe1QHHM4ZQt3gI/Sb1DgkFfPKwVSgZyzJCqQEtSe0dRqC7BMVdoLDXmejUrwjOCSlInFTZRvilhK26d83EWwjC8YbSP/W74RvNp0KBh2usok/4+SA757eeXc3sh9p1aojL2j6Er/+3aSh2ES38zqF4SvIGcgsvrmP99ThVUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HyDbZN/X; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d09cf00214so2052131fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Feb 2024 14:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708034425; x=1708639225; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDDVrcRz/Ycf8cdbcrLManVLDT9HHxZVyCSEzgV1aZM=;
        b=HyDbZN/Xw4oA6Sx7qtsjudlHesEnNSdi20hEmcRel0UhNt9L0Ae+0WUwXc0Wdf0Wbu
         PkRASewXAfF4nr1PwwTlL7KCLL4kCQgN+drlmL/GKEG1OmbZ3qZoEBrejWsdKQOecbCU
         wg0btfy/R7uIhLvsgrcTQJ/2ynkqLAOwKxvic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708034425; x=1708639225;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDDVrcRz/Ycf8cdbcrLManVLDT9HHxZVyCSEzgV1aZM=;
        b=gY/YXUa8mV09IRnogj9jL/UDeUCA0SUuZnCZrPMwhRBtg0hIkdiz93HwcDYRDn98+V
         jjaSE0Fzuoh9BroulDKjg2FyPVqykK6GXA5ysOFR7tWA0LlDyPXKWn0WO3590tptAb/R
         45rHVJFQP4tB0s6O601hyztFNtKw2Akcown2jq6yRTc8KfvaouZcD9yeehzPSJ2cCWHG
         XWi3lhe6Xistk7qPzF6Axh6qwMi8TTokSWmGeksE4HzU5LOPBUkkuCVvc0GCYZ3aKJMI
         TTxU+wQhh6f+2pqCsT2r0bOgWaOJrTZbnUT8kne6xIFc5uA9qRO+ivxHGn9nCbwtUUY1
         sicQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcvJr+lVKGQ7JzriJX5wWLjzsewdehBkk6liigoctqxx/jq7OMOg7v7ee9mJr8aFYv+5H+bhYtPLe0OqAvcv8HMJ+d+isBzbw6bQ==
X-Gm-Message-State: AOJu0Yw3p6Q8aKjWjw009hP/OrwWN+L1OW/l99zTWpWaok3wWmyS13K1
	AlfxNia2Cqv+PxmPPN7q+ftWxlKFlvtEpJSvtvW4mb3Wbte7dgkQbuDpKLoNN+FiwKICjkTmmro
	ikxam8GXmucYIG5tPzw7T1zyV7b8cs24GeT3h
X-Google-Smtp-Source: AGHT+IHZsX1oCvcJlSf5XfTcHW/43KxOJRGh8S4YaM6TXMZR2b4sKxAd9QenLzmlOUm+lpukKlbDAdnYnvVvVUmkqm4=
X-Received: by 2002:a2e:a98f:0:b0:2d0:c490:affe with SMTP id
 x15-20020a2ea98f000000b002d0c490affemr2710448ljq.19.1708034424733; Thu, 15
 Feb 2024 14:00:24 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Feb 2024 14:00:24 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240215140638.GA4162082-robh@kernel.org>
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-2-swboyd@chromium.org>
 <20240215140638.GA4162082-robh@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 15 Feb 2024 14:00:24 -0800
Message-ID: <CAE-0n51R307Tg7p9=GNFfUB2tE0o5JWBNpU=rX_HUe9ydSXW7A@mail.gmail.com>
Subject: Re: [PATCH 01/22] dt-bindings: gpio: Add binding for ChromeOS EC GPIO controller
To: Rob Herring <robh@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Rob Herring (2024-02-15 06:06:38)
> On Fri, Feb 09, 2024 at 11:09:12PM -0800, Stephen Boyd wrote:
> > +
> > +description:
> > +  Google's ChromeOS EC has a gpio controller inside the Embedded Controller
> > +  (EC) and controlled via a host-command interface. The node for this
> > +  device should be under a cros-ec node like google,cros-ec-spi.
>
> Why do we need a child node here?
>

When in Rome... but I get your point. I will work on moving #gpio-cells
and gpio-controller into the cros-ec binding and populating some child
device from the mfd driver.

