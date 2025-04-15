Return-Path: <linux-gpio+bounces-18832-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E14DA896D7
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 10:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88EE417F126
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 08:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D7D274FF3;
	Tue, 15 Apr 2025 08:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ua5uIq85"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003941DE8B0
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 08:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744706101; cv=none; b=pKKCd7d2aBVl03QahOb5lecNbzOdaatBjK0IRq0SjRvNBH6/M2PqyizSEqA3zpTd/4AafncMFOIMKUjFIsNlbXoP1ztqCCNleLzXve7VIKKY9p5bY8IgiNqPva0zx0W3ruBn1W1pGPPox3GVy3anDQy2btO5Iiq1lOCek1YYVZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744706101; c=relaxed/simple;
	bh=pMm89t95o7OKrNVjsydMNLYP38f7HmPCCO08YZkEjWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r1u3+9hJWDQoMvGTz1hJIF1zgj+XoE3TOZniO/Xx7++Pwufe8E8DavigTemchNsuHB2xqCziw/xJo6bJnnd6w8ilVcvtBn80BZNmunjesGsV9gHLdmhO1u1CMQyv/wChyDhnONWfYxRC9fuiXg58h7xXWV7547dV2t7tkBS34ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ua5uIq85; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30c461a45f8so46456011fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 01:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744706097; x=1745310897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMm89t95o7OKrNVjsydMNLYP38f7HmPCCO08YZkEjWA=;
        b=ua5uIq85C2AdK/AUBujwKDHq4bvs+sAeel5zshKpU0AjAKP622wi93GMDMsnTBRgHG
         OIj6CojC8Ld1FftCkGC+ZBQ3o0Ff8Xe5tQ/6rLwkXR9ZXw3K+677KWpqD07SHm2rMsv3
         z87pcItbzyDvnVl+pbWusY1cmhOW/OmRsgKtXran0qApi4jymcO8crPjyan6fn0JPsWf
         0tL0XFqtZduFkdNsBSxLsXh+G3anb6X1LViv9gpvLT61JLvzeWTeJeiDTcREBWMKyvv1
         CRkW9VS3gWVHviRe0DOeTLD+NMxuYzdWw6ooid3RZehoJjbZAPcGJCQPEOXQ5xpcuVT+
         k2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744706097; x=1745310897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMm89t95o7OKrNVjsydMNLYP38f7HmPCCO08YZkEjWA=;
        b=suRgseuI75CX+x6rapaqCpGRidFM2OPBCZjuXytdo7uIVkLgwl5r+Zp9Q8xjJcI41a
         zEnrQ1DEjMmNdPPSbPCMxhno6rfv1POWNoMabLVScS7MLu06i2tbFXGgW/HexRTp9Cfi
         QSRJqo2jYrj6surQ1/pd3aFxGCAHVYSpVubB6Hqr9uipTVmSMIG7Y6Pz+QNO9jGL6uBA
         zJIfwFhmf9TDDU9hf125ECD3G7qIfARxYLceKQCK3iTRb0MaLy2y7bwYp3K43WqRprzU
         1845xJXEEtkAdieZVDC+IsnOYjpgP8E4/EkcAwA12D59dlw6VPyylbmy7Gk2hBluf6HA
         FHjg==
X-Forwarded-Encrypted: i=1; AJvYcCXFadC/N2BDPxyau6UTUUTvcaihkvXGj5QQxeojB+EWA0jx7/pRMlBEOtR2vJ5N5xiiknkiIvEqDQSX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqzyfrzh1II5NPMZknJ2OcH7K5BqIhAi6mzrvuQQGuXrYNx9sC
	xaOWVXGx1corN/H/lx6qUVJFwhItPENmLT8qNY/rHXXLYxqeCqjWj/S2pUkuFJJ8BXP4vCfkN3B
	GdMgFknnbGTxnHlJw2jBdQ3JDkd1xcJFqtMFUpw==
X-Gm-Gg: ASbGncsZqtGB7qlY+uvYzrbzRBgkYh8e9D1MEnGnUK4fzr4kk+RWN14PHMzFxnqjmhQ
	fr7hW/TC+t5o8pdovnP0S0Rpks0k9ZlGma01cdSpKQOVQEgqoKSbav2IFKWurXPtrQDBSuZEJr1
	9O2DnEcRrBw69yBvK1zD6SYw==
X-Google-Smtp-Source: AGHT+IF4gUiycvwx5xihfrwfi5caUZrBVPZ9i4AgpgkHBlnlRrfQCIE5fGWeGhYLe8jkRfewjlLY4sZ2tgruT1T8EY8=
X-Received: by 2002:a2e:bc22:0:b0:30a:4484:3ee1 with SMTP id
 38308e7fff4ca-31049a20e75mr43738081fa.23.1744706096919; Tue, 15 Apr 2025
 01:34:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-i2c-mux-v1-1-7330a0f4df1a@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-i2c-mux-v1-1-7330a0f4df1a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:34:45 +0200
X-Gm-Features: ATxdqUGEx-uTaMP16LDfzXWDKy3BdmMOqJmGzQUi1FnyT_MvycLeo1V79XiWUh8
Message-ID: <CACRpkda+JJKjwE_zqbyCNt_Ndn8y079mF6PW1AEGwtJ4WnCQ0w@mail.gmail.com>
Subject: Re: [PATCH] i2c: mux: ltc4306: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michael Hennerich <michael.hennerich@analog.com>, Peter Rosin <peda@axentia.se>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:17=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
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

