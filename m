Return-Path: <linux-gpio+bounces-19256-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2201AA9A723
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 10:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8E223A5206
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 08:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A774221FF5D;
	Thu, 24 Apr 2025 08:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VHlUNkLj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8531206F23
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 08:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484798; cv=none; b=YWjhSGMwm3UJjxWjDku+kwsbkg7I8Q4Yt0pBrKp6RQ9+gZhfUDhqyrv2JFA5bz4vbKrXSpVDazth9PytFS1M5hvbRgtkNwdGsk6hH5qETfjifveryZEO/i9KjezUD0iFL5YTYRKexedogJOKN8hj5xE8SKZ8mkGGZU3C94bwOgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484798; c=relaxed/simple;
	bh=h56jXaRg0lp1qzwbK+Upo+lq//JNs74dFUZKk7h9pdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qkmbLnbckUDDXqr5t9CVw3+x9AGa2RjjBHnk4f3pv6jpI1hPBxuHoJbwa+C7Urbx+YXr5dcra9dbn3jZU/85CBpADyozSf22ZVZUtwYV0as9/TdVgiV60VExwaCUPivaXaW4bjt5T+8I/ljz+OJQF+AEJivndoprZrs/Ftv+FAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VHlUNkLj; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54b0d638e86so822518e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 01:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484793; x=1746089593; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h56jXaRg0lp1qzwbK+Upo+lq//JNs74dFUZKk7h9pdQ=;
        b=VHlUNkLjIzYXGo5Hrmnu12dreEkd2QefbMZwb36B32d2nRiy4fEOhN6WCe5aN6ewJP
         gFjgSC2OdPdjT67LsMeizuTk6QpVsseL8QtPCjd4hqJFP5CM7jA2+L0e39eIhNAMOGt8
         fHtYnbzQi5MZQDlGEDQEhCQKvvfPxho15OhX1g9k9oV3ELQyE1a5DVwR/Bwd1MN8GezZ
         JEo0stAig8Sn7OnojB4xNNj2Z21xKsjj6b2/9OEsU/KZDssP2TtQEbhcM8WDNK7kS4IO
         Iye6lSq/H1BPxFaDOIwV0ye3//q6mbqzrJ9fDaHn5fg5sptsttVZYT4YrfmaFKOwATZQ
         puXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484793; x=1746089593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h56jXaRg0lp1qzwbK+Upo+lq//JNs74dFUZKk7h9pdQ=;
        b=wXQ5VDytte32UvXtbftNiKEjGpfE3N0c/st/9MhH4IBW48Rn3bkc8HNSuADsMb2fVD
         WWr3CYO0ERxU1a6e2vuTg8vduUUSFPT/Kd0TmgEbWcpkqiv2nk8OYKUM+2czIGEI7O0p
         5TOXjausi3GGxjLWG9nzneRmStL/QJW5wjUUFkTR0K2fhNcZyv+uw8UoRQQlwcIMrEA7
         RvUnMB8z91ySmIm9z42jDG85j2+sbwFUAvztAGEr5rgdTENTTud0qNR+zp4O4Zmkj06B
         O+VQR6wslMLxcJaz09EhMdFVbOXNiJbfyK2/a6NEsNNPVyQgUpA8UlISGp7muSNC2vHr
         tMWg==
X-Forwarded-Encrypted: i=1; AJvYcCXdfYyeoTm+0lLihgvsVh5q1jJvQPeYm0ySgiUgm7Z/+C9o8cfPv2Dgiadmk1ROvehxccGGHyldXkW7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/CHsxfikgB+SbfIS3W5s9x/tslGaK9jld5yZLwZEP/Bfr7A+e
	D/GA5zCecgFsYE76Rg6zjT5eWNbNtdm4jNbmb8Hiln8FkQkKXssybIFdKPYk11whwyr90B+xUeO
	CmHIVS+SXQkL8avRoH4OE7Oo18gu+BWEQKiRJvw==
X-Gm-Gg: ASbGnctxV/Qq1BnN+i3r8NHiG708+bLotz8riq6FF88N4RbzJ82B9/wHq2TJHnviqxo
	wMUOW4JPY9xUT9o23iczz9ouk1NBOwEpAK73ajvGsTHKNH7Na2jmjixFjkGBGxfCdj8DpA4SZhO
	ulZBLTFNH2m1SpKuG6ni+1Hw==
X-Google-Smtp-Source: AGHT+IHgkO9f8zTL30SNdRQ+BRVHRS6jtRSRScOybGqEhwmwfSQ4uSfTrGXFEJi9QQxgHCp3XvKQsl4yaO5QsXTeojQ=
X-Received: by 2002:a2e:a906:0:b0:30b:f2d6:8aab with SMTP id
 38308e7fff4ca-3179febb3d6mr7298421fa.32.1745484792686; Thu, 24 Apr 2025
 01:53:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409211243.20105-1-kabel@kernel.org>
In-Reply-To: <20250409211243.20105-1-kabel@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Apr 2025 10:53:01 +0200
X-Gm-Features: ATxdqUFlpK3NKryA434lMtbxZVmggFLJMy1QdvghVFUGS0ueoPApOyfPx3gU2wM
Message-ID: <CACRpkdYpPmuLnJLYk9fxkF_xnD09DYrE-J1hrY=x61CFUEu4Sw@mail.gmail.com>
Subject: Re: [PATCH v2] platform: cznic: use new GPIO line value setter callbacks
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 11:12=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

