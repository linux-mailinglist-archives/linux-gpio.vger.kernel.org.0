Return-Path: <linux-gpio+bounces-25225-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03250B3CF2B
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Aug 2025 21:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B211A3AB0DB
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Aug 2025 19:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E00A2DF3FD;
	Sat, 30 Aug 2025 19:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sKyQ16DW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2807A2DF3DA
	for <linux-gpio@vger.kernel.org>; Sat, 30 Aug 2025 19:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756583493; cv=none; b=WOv6m3xl4W6lYt32CV1bu+bYcfHtFbSPtNRI4nUBsFlXkQWXu8w/ZQ13LFpWeIyzfS8R5wKzhHXWziEalVurZprN/NWYJRw3SAauRQWWqpMRtrXgfb0cvKTWp/mYB2nJwX/Gz4rtXvbQla5vdLbRrOZcXZX44fDcsq5offJkMik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756583493; c=relaxed/simple;
	bh=zv5YaPzqC3Q4Eg1Pl/dZPS9JfeNag02J+mjC/0Xdx+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uqyDPx8YppH5BjF/bGyo4o7g3wDKqVbBlTBgntv3obHvZpl6+kljFdKfneQa+NUOEs8Z7xJYPYZq/GzHDNvzL/tJzUz2TPINA2iCq8AgcghnQlxNYePlPOoOxhlNPjPrxVbHXHvLRApfRzwRvn+860rtgo4DOpt/xyMCV2LDTJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sKyQ16DW; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f469ad067so3243041e87.0
        for <linux-gpio@vger.kernel.org>; Sat, 30 Aug 2025 12:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756583490; x=1757188290; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zv5YaPzqC3Q4Eg1Pl/dZPS9JfeNag02J+mjC/0Xdx+8=;
        b=sKyQ16DWB/y/48kZvGMZW2Gj44Z7EnX9PqvUA+oImf0AXAcZbv5zbQQVDDFkdM4FAU
         rXWVisKElwY6yv6rRe23FDgxfKn0NkvA+BZOQg15LdT4H0XsxpNg2+kIFBu/TVkXAJ1P
         1+YlHWUGDxSdyzGZUQuXWRIdDxKiDD7BQW8zla6CUvG62/pr2YhPLI/EMtVDgZOQ85BJ
         idIIClCdh1Q7cbO4MtADc1h3DCghNpqnvY6Pz6mCI5DkF/82de15vcD/WUfvWQ84nwvS
         ytM8KzLxwIfv1qBF+dfH0BLn/4iRNsd22Z8cJLGWErrP62RmYxBSOA5LPFGr+ATWoTEk
         wrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756583490; x=1757188290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zv5YaPzqC3Q4Eg1Pl/dZPS9JfeNag02J+mjC/0Xdx+8=;
        b=rnfojElArUGwgbMeFXDG9WvxMm868Krtfz2xORe6Eb5DS6Niu06zW3qk9PmtH4PSyv
         GMKE2Ee/F2GsmUKJEp21qnO5M37XRIbuZhymSM10iLqyIvsXEFoIHWwuOZFVWxDRtYj6
         UzkwUJfRqI25+HlKD+AN50WHix8flKXwtHgGkR/itxNfoW6PSBYSvkUEUfpnhgkwXpOp
         3RNSkgFV/k7eC+giHIef1KoEVGCK4WhwInOFYn5jEHrDLMtTN78bgohI1GTP0kgtCGNe
         RLdWUAAAVDfhjZ9LQenxvsKot9wkMW4UxK5AKOPNDFMku22bDfriIVLYN1OTm/5CxHJy
         pYMw==
X-Gm-Message-State: AOJu0Yxg3YvZP9tn1oZ8s6Ni8tLCj5zCP0amCyMEcQTj+NK5YsgOJgZe
	rBacOMxwioOGABozlmatd+PKt4bqkOaoPM60Tc0TwATU10jf7NRJVNts/1Ywb+RxcenXVC8dJgn
	HqPepDrBhY2HknK4RwcZ1qCYztG2pveLHNRthodcf6w==
X-Gm-Gg: ASbGncscY2ck+asgNbwPMS0gx4rQ2fPrJiimtD7Xm1W8wt34X7UZ7MphfhUgtc+hEGd
	CGZiRycDypupS+E9P8sKiOPdNgJ0CpqbFJklqRNs8yIosYKDJj0thsRgZJRChUEC17OUXtycWcL
	eVPNki3GS/09mPF6cJANGmio8P4hqIO2k9nbL4kUOm5hmZJxln+Z5oqV7/qgDsdiuLuevvfaEcH
	y2FsceyAGEkG37IrebPYfxwGRt72Ln7BCSZnAjziHbr/4ipGw==
X-Google-Smtp-Source: AGHT+IHQUwwu34vgeZphW9VRaLBgPvPzIFcJJeErIWV2xc9g4g/MPBPhfaGbLPPRq/dIAxP0j9S4AWNKXDRSvv6YX2g=
X-Received: by 2002:a05:6512:6812:b0:55f:563e:f16f with SMTP id
 2adb3069b0e04-55f709b52a5mr577475e87.21.1756583490203; Sat, 30 Aug 2025
 12:51:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250827175842.3697418-1-lkml@antheas.dev>
In-Reply-To: <20250827175842.3697418-1-lkml@antheas.dev>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 30 Aug 2025 21:51:19 +0200
X-Gm-Features: Ac12FXy0Nl4CmsqKiiwHV9VDpEUWs4Srsi2V0nq4DWPNXB6KMNEBW8bxC3QMlqg
Message-ID: <CAMRc=MdQY4mmfAPA2SorkjCdjpx7DSwF5rRUvnRPb9G1o5aaLw@mail.gmail.com>
Subject: Re: [PATCH v1] gpiolib: acpi: Ignore touchpad wakeup on GPD G1619-05
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mika Westerberg <westeri@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Mario Limonciello <mario.limonciello@amd.com>, 
	Antheas Kapenekakis <lkml@antheas.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 8:00=E2=80=AFPM Antheas Kapenekakis <lkml@antheas.d=
ev> wrote:
>
> Same issue as G1619-04 in commit 805c74eac8cb ("gpiolib: acpi: Ignore
> touchpad wakeup on GPD G1619-04"), Strix Point lineup uses 05.
>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---

Andy, should I take it directly through the GPIO tree?

Bart

