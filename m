Return-Path: <linux-gpio+bounces-15112-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7D4A23707
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 23:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E31D316217D
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 22:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95AF11B4156;
	Thu, 30 Jan 2025 22:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PvFIgK1x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442A81A83FF
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 22:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738274421; cv=none; b=MQLoFFnvhDcH7tfQP9Ju4bNRjQN0EdwCFhcxriTkvjxc1iqBS2yj9eDGlYVZMsDgmh/QMVx9Cng5/wYlO1RyoGC1EyrPumlhklagjPdb8RzqRRfP7mJak6k7lQs+Pd4I3o/+jvSV6TkYmaNb9gmI1Il2i0ooOh6zJ93IDOtQm2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738274421; c=relaxed/simple;
	bh=PDx3eLdL8mc/JOoBrABGg5DGnjthUQVP0JFp6Oc59bg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bUNFRLVnqWPkjvryaZiIf0F41uUm48pboxnLY8YtexvfoodqKTb8N5wx4SaJpW/hpM91PZcfFFaCVwWcGzYudK3M9lchteOe5tNCB2nMmK4Eu6vFglBGMhL6MMfJvr/Db+nGnGpkH58JRU99dDcDRajtcdruKZjjFZoKlVJzGtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PvFIgK1x; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab2e308a99bso239050466b.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 14:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738274417; x=1738879217; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PDx3eLdL8mc/JOoBrABGg5DGnjthUQVP0JFp6Oc59bg=;
        b=PvFIgK1xHW+kT4UJMHQxDGW7aXS9Pign1RGNjPYamfdQ10VHUeQv6nHgMgoPE8keNg
         SZVm6F+0v0X/IDbdm4dwOHKbB9QJElU5S39uA9/1bvKpP2BT4+aiYKrFWJ/r8DEoNi3E
         KxMywusGHL+9DQRo6pGTLBV7VNAjKOuo2CsFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274417; x=1738879217;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDx3eLdL8mc/JOoBrABGg5DGnjthUQVP0JFp6Oc59bg=;
        b=HtcDXOzvS5fQgAacKT7glaXaZ+QkpaHI9kPXIOfM5eB6Xp7aCtKsaXYvIGJGnaSnMw
         A9pabU3rkhZD1fuDn7OWSmsrLd65vvBO0T7SiHv9OwzyxMg0Fz1Nt5dadwh/ZrxdShh5
         2vUilYdDqb1nFBwiJ/xVPACojv1+97ZMB2QjmOskXOWhc5QU2fQAT37QtPqUIQP1l66W
         4DBwbdRUPoAIeqQjtvTvSy7ODg59/W38HB4c/8G7L3bAwDk7TuLYeRGcWIlX5cS0vBDa
         902yDlUkltT+UygkfMwmUfSz05DfiSch2N2CR7jvPqVqNllieXmT3cP8fYJy2oiPtMYB
         i/aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs+lN8eGmsgGD/lz8fvpLr5RllRRl6rVx/+KYRgijiV9+arosv9w7yAedesopf+us3Z/aGWzblOw50@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5IDUO5/+EVCqlry6DkM7En+pQDt0OOsv7F3c5Hk5DlacU8Wzu
	tKmv6o2PyzunIqGUuKjGvoa/TYHSQN7mlqcremDCarpfyX7LpjSa8mN0LZyGupv9DWH+g/tAI/z
	nRGmM87UAUtKzKiSFCYrylHZzf9TpQr5IFKULsCtfR1vWmoc6hphO
X-Gm-Gg: ASbGncsRjJdlmEqxyTtPb4uGt02h1bINrC8BGy1dY+109UcCfymTbOHB2tNnZ0ve+UE
	++zb8gI6DYQBY1JX9w92GEn2VLXG2nGhAMx+nQ1rPGQDdyjPmjH/vKLq27mbwuhF53k/TIO2Egw
	==
X-Google-Smtp-Source: AGHT+IGSUW54140T4OuYOk2vgP7BeRdGJ5tiGx1SbF9XB6jyHUjJCkopnlbK8Gw3x8EQtEHebiMmI74eFk2oo+MWuR4=
X-Received: by 2002:a17:907:7294:b0:aab:a02c:764e with SMTP id
 a640c23a62f3a-ab6f7491be4mr101639366b.14.1738274417545; Thu, 30 Jan 2025
 14:00:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130-kona-gpio-fixes-v1-0-dd61e0c0a9e7@gmail.com>
 <20250130-kona-gpio-fixes-v1-1-dd61e0c0a9e7@gmail.com> <b7662246-813e-4e5f-b41a-574751110833@broadcom.com>
In-Reply-To: <b7662246-813e-4e5f-b41a-574751110833@broadcom.com>
From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 30 Jan 2025 14:00:05 -0800
X-Gm-Features: AWEUYZnxlB5TZe4w54AbCDYAyROrmW4GAY2NUB5c51Pu98RBWSk1lQdDFvKPT_o
Message-ID: <CAGt4E5spr9gdroYnvOqCR=YG8spNfOomTrUqPAynnQYP8a-jXQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: bcm-kona: Fix GPIO lock/unlock for banks above
 bank 0
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Artur Weber <aweber.kernel@gmail.com>, Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Scott Branden <sbranden@broadcom.com>, Markus Mayer <markus.mayer@linaro.org>, 
	Tim Kryger <tim.kryger@linaro.org>, Matt Porter <matt.porter@linaro.org>, 
	Christian Daudt <csd@broadcom.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Jan 2025 at 13:33, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 1/30/25 09:10, Artur Weber wrote:
> > The GPIO lock/unlock functions clear/write a bit to the relevant
> > register for each bank. However, due to an oversight the bit that
> > was being written was based on the total GPIO number, not the index
> > of the GPIO within the relevant bank, causing it to fail for any
> > GPIO above 32 (thus any GPIO for banks above bank 0).
> >
> > Fix lock/unlock for these banks by using the correct bit.
> >
> > Fixes: bdb93c03c550 ("gpio: bcm281xx: Centralize register locking")
> > Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Wow. That recipient list brings back memories.

Also:

Reviewed-by: Markus Mayer <mmayer@broadcom.com>

