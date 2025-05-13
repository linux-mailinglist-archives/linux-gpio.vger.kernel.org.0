Return-Path: <linux-gpio+bounces-20063-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA07AB563C
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 15:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71927189CB81
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 13:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF50D28F93E;
	Tue, 13 May 2025 13:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bsjJ3Bau"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0334B28ECE8
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 13:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747143411; cv=none; b=eJbBfFwo9q3MEHZUMwrTfGJ2xbqU6Op/tGc/1WBL27xKvx5YoMN5ON6asUD+LIfbOfWzXyifldWHH6IXAVKXUTRSGeEN/qLzSrbE+rOciod1VRUyLvqY9uc9+4dgnTCR7qF9kK1A21IfSvyiNwS+kUW5IoYhXYCNu47bi/9ziy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747143411; c=relaxed/simple;
	bh=7/JV3Bh1ZMG76SNJlwEakQzpLhMGq/SyZApq5+emUOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cS6Lec5oQgmexRGcBUsRh6HGJkbwkibR7r/mShU5c114K46G8Jym7tKOPe3ryLG5Z0lGXqkQe9gZkYMFJf66uLmzlGIICyzN1JowGBQA4QF2klszVMwFbxDdbnymUFdJ3aAKSzw9+YgEjoULfsdgAJob2bDmaDad0cv08zOPowQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bsjJ3Bau; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e78fc91f2dfso4109281276.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 06:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747143409; x=1747748209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/JV3Bh1ZMG76SNJlwEakQzpLhMGq/SyZApq5+emUOc=;
        b=bsjJ3Bauhrxj66SeLds/jKKdWSZlOHCYjNoQK2rdcCsrPW2uQEpk6EGUfbnUm9Ccg2
         /qyHbjH8bZTlvc6QSQplKyx0GNjCZeITDZ15+VYSysKWPLCCH2AT6wdNLDWS3inU9VWU
         bLsgQuv5uD5kNK3rtSh//1I27/5WDsQ/rVSC81YoMt9PIBR5GJoQki6Lx///PgwJooz+
         pwicL51IebztsAnBQXUypKaCOe7CopYoAnNHpMsPBeSEVCrQj+Bb6FktymvoC9lb0O0N
         1WDNGkD+pgvltlovGQVcBHroH5cAOXSLMu7wyc7xNMT42ugeX3Of6/BBuleIj8AaATbi
         aW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747143409; x=1747748209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/JV3Bh1ZMG76SNJlwEakQzpLhMGq/SyZApq5+emUOc=;
        b=QyXxO9iavDyC0UJJy7zZstM9KYHMGfWirbp3hK3kAdAmmIyT1l6+qaWpO9csld3gsV
         lKoVIbX4Pm24Ml0d3j2SvltZ7MKHTS/uoQ9R1iLcdtFYrrhtmxc1RJA5YP18gzlKswrm
         xdgkOSxPmdUEBTVaCOSline3oES/oK2d3HUN7+jAho1H9p1KI6LQPtj6LetKXqj/s0y8
         QkeLsEXnsO11DuXD3PTc+z+F3ejhxHTjYKdEz3LekET+YLpNxX8rY32dyvhKr/+Gno0z
         uEFJCw8A64TTkBAwRalafNfz3093qsKgHVD7o6/AyfkOyqhg6IGxGXpXKRonCWk0QZnL
         vFvA==
X-Forwarded-Encrypted: i=1; AJvYcCUjorntuKFpSxFNB99NIbygKrlOLXCxT3hPeTQxnbdj8KipSEwXRJ8LC2hFn2FE7vJ/SzrZYZalhRmk@vger.kernel.org
X-Gm-Message-State: AOJu0YxjYTD6Abc5pk7o1USUTrI848fLAFgiSpe6JizN89WSANc5mzqe
	9slO0yZVHxlYRLL+yfOgG881hSi6rU2HSldofor/dfejLinpWb9rEXJJfoDU6bhmCH5DC9VHy84
	CU0yB4wSH/CJ+s16IKU+PeGwSQ9qTflKeZ9cXiQ==
X-Gm-Gg: ASbGncuMwuOy42Hgyi71FUCfzuW70zgJ3nhZQwV+A3kNan6KJp/JoocZGbDhh1nQbbc
	wg9VFxQHAG38Fys/82XBUzNu5vN78bMkIhBhtyqOv084QhBRIQQjfx59d0jbZC6cr7vEJI87vGj
	zjxPFyGWTP+CfU9G5qsYh875FpzK5R3oIA
X-Google-Smtp-Source: AGHT+IGPspzzHxed6rft90BBazRRlyKn4YRNf/+L/ffhEMrgXhwvAkFISkzPmGNOJE8q+cDfmA7yJkalBx150TF+eCU=
X-Received: by 2002:a05:6902:2193:b0:e60:a068:a14b with SMTP id
 3f1490d57ef6-e78fdb83501mr22863623276.4.1747143408924; Tue, 13 May 2025
 06:36:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com> <60ef3803-4f8b-4d9b-bef8-6cf3708af057@lunn.ch>
In-Reply-To: <60ef3803-4f8b-4d9b-bef8-6cf3708af057@lunn.ch>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:36:36 +0200
X-Gm-Features: AX0GCFtHZ-lXYmozXKJTmAfMPph60MlOaJrCz7XDyOAs3Cz7P-VVNfFyia5m6R4
Message-ID: <CACRpkdbqPLaBheEv1=ky1gUJ-qSsPRjR0J-UXEuhXf2Oix_EzQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] pinctrl: armada-37xx: a couple of small fixes
To: Andrew Lunn <andrew@lunn.ch>
Cc: Gabor Juhos <j4g8y7@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Imre Kaloz <kaloz@openwrt.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 11:33=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
> On Mon, May 12, 2025 at 04:22:36PM +0200, Gabor Juhos wrote:
> > The series contains several small patches to fix various
> > issues in the pinctrl driver for Armada 3700.
>
> I'm not sure all these should be for stable. Some are clear bugs, but
> not propagating the errors has not bothered anybody so far, a
> requirement for stable.

So we are at -rc6 so I'm not sending these as fixes to Torvalds
right now unless they are super-critical.

I will merge this for v6.16 (-rc1) and then the stable maintainers
will have to decide from the point it enters mainline.

Gabor: can you look over the tags? Once you have decided
on stable/non-stable tags I will merge the series.

Yours,
Linus Walleij

