Return-Path: <linux-gpio+bounces-19255-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75531A9A71F
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 10:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE41D922CDB
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 08:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6297121C9EF;
	Thu, 24 Apr 2025 08:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UoWjm6t/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5509921C167
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 08:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484764; cv=none; b=VfNjj1Uq95f3vrzt34STvupXnxGQJWcEWRhIUyuKE75FzW3xmDqCHgwyw6OqR2l6Lg8rGzZUtXFRaH/7HHDVnPzx08dtGzp6+V4bVwyh39ar6nXvioZEvRzkwFZEyAJHSHu5VWOzoVuNALhRRq3rnktqcMc0CkExMHdmuJty9g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484764; c=relaxed/simple;
	bh=Pi6I9/2PW0WKwJeejN5o1HPNrvvIUYugrgLnZZJ7Pu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rg3zi55ehmTKUaRioFYUWCEDMKNyvu8qd5zui1jzEdfXy9RCUp2O6VkusjmdM80mnSUF/8xOjhnyQ+uQckhSxLIycpWtDL01MeN2kjFsXAo4gr55mn2kiy4x379MnDShA1icbbaMLZZjuChgr190moE3QTu3Q3eGzUh3MnZAee0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UoWjm6t/; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30c091b54aaso7224341fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 01:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484760; x=1746089560; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pi6I9/2PW0WKwJeejN5o1HPNrvvIUYugrgLnZZJ7Pu4=;
        b=UoWjm6t/7GFcSlKFXXVAASTECkjbjSWxVKDre+llaetfJy3w0ECIm235ucR3XvunVe
         hqm2Qr+Jm15HA0RcwhY/ZwqfOwWxo+SantdGnm2Mz0LnDdeH08hksMWfzo3M0PangW6u
         7fHSVCajeZXO/ZnFKyoz1eM8xQkhlYhXywe47Nf7ApBcpRtnBx0X8udLf9NiGBU1x7oR
         GvKNdCoKNcGTB4cbsoQz6gweTl4gJc3e9NhRj/Xkn5FRuK9jaOcn/F8roItWBX+cs0iz
         D6ECAnlVPtSN4lMjF7DuLAm7bi6eyJ/CwhFSskHne87mo40vlYMB/W7vlSCiAF7qle42
         xv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484760; x=1746089560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pi6I9/2PW0WKwJeejN5o1HPNrvvIUYugrgLnZZJ7Pu4=;
        b=YIeL/3VJuFl64VNNZ4GhC310DVg9dA1WpbsSGCnkXaJuAyLa1u+DHqtBvRRWAQzmMQ
         n55obNaBMuO5Xa33SLMWqH8FuWsKqRb/eU6MnPzTREl5a6tN3tD7hvVv38TMo0AagyzX
         m6rAiMJKkoco3STz0Wl1I52vvS9muqG/mPqgpAUETTywXPlN1DiWVYu9X/dY3gOl6Kmr
         bQ1sy0sQfV4U6V686MQlBuj2uPeNXGSpa5dC7JVcbKpsDyYcmoidOXrNz3C2Lc9q3yT5
         sFLuDgERPnbTamRm+yTSsbAPSpuSWr7kpvSxZkt9miMinv4prCd6MkAMEg2n3rcUSGh0
         6sFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0CmWqtiQ5ViVReI0Blm8zmAFrPAmyv7Ro9y7F5bDkzX9bWo7SVZHfUB1zhPae9yhwIMZsF2L0Hkek@vger.kernel.org
X-Gm-Message-State: AOJu0YzXKuOH3KqG8F3hd//cJhtDLcJQK80gF7X9829AqP4AQCoolIbb
	qZMY6+xxGBMXae/FiRqOdEdwkS2vNb3VAW7g9EChftGhy50nOi+/Y3JVOf58hyUG+8pMz+2E2aD
	FMLtLQuWfVfZ9B+pTuVfstSxlFiKhwpT6yNWNfA==
X-Gm-Gg: ASbGncuIqb8xBl5JZpNkv1TvC25Rh9Vg8LjFmzH8Qb+LT5ug4IRIZ1AJu1M+kFn+rQ4
	x8PHx0RinCiLnLjIctzK/IDx+kESZnvb2+sMEXWb6quAQEujANw0i4QQzFmY4IuJ6fcDz86Z1qx
	SYKEVmQpR3VliQ55BiO7h2bOM8XmsP1cgS
X-Google-Smtp-Source: AGHT+IHAB9LWhYEooDYo0NS7+cNeVroUrJMiu/TtDGjCg2QMPYKVyjyzVDKPg2dN18XgA6c11bYigJex/WlKFNej81k=
X-Received: by 2002:a05:651c:241:b0:30b:d022:2fd4 with SMTP id
 38308e7fff4ca-3179febbfeamr7382591fa.30.1745484760431; Thu, 24 Apr 2025
 01:52:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-video-v1-1-200ea4d24a29@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-video-v1-1-200ea4d24a29@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Apr 2025 10:52:29 +0200
X-Gm-Features: ATxdqUGMaYSVPrnrhvuCdxBcM9tsozWah8p2gB0BcCstcebhaxaVqziqhHfQoJY
Message-ID: <CACRpkdY0d_a8qzN2bJD+yzZ0P_twwPM21yV771YoABuVQzXAUg@mail.gmail.com>
Subject: Re: [PATCH] fbdev: via: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>, Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 9:43=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

