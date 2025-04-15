Return-Path: <linux-gpio+bounces-18829-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC44CA896CD
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 10:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C49917E78F
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 08:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8AD827A118;
	Tue, 15 Apr 2025 08:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eD8rVFwk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A5413D539
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 08:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705940; cv=none; b=rsl4cBz4/FpAOaNBFrLrzapcU5jwwYKc94VR72UMEN/ewX1kUUcMLpWWTd7tofGgK9nCVkGB8Eo3chJ937qH3+mVOQA4xio0QEl6KXgUrdMlf2xcO9p58Vl+9a1r0H6rJPh0MY6I36cQcTe2v7P0DqszDjO+pdpgQvfluFMLEJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705940; c=relaxed/simple;
	bh=EEtamelvEL5oMF5dTsmr5bTfdDwuT/yXwBSnoDyJAdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edc6fGBMCOVxagCojqWKOBcNCP547aOw6yAOf6o0ioRLInCH/SlRzjopdVQyeUReADvUm1Uq1QQbJlZL2AQv21lBDbHz1uuK4P5LKe0LAhIPNBMbhsjnfnr/k7Q2C0pOjVs508HS7xvzyyzm6DpxfEmfa6TnFJemoybPXUAB4Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eD8rVFwk; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso23068781fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 01:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705937; x=1745310737; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEtamelvEL5oMF5dTsmr5bTfdDwuT/yXwBSnoDyJAdQ=;
        b=eD8rVFwkIXGmI25mJFx/SrWwz9Ddu21oSCHJcKaOEm0LsDxzLnVZB3eYiEc2CEWFdh
         jQbcz90VXTm1tKSRUd5in43hkIyjcOR2U1HI4Rl+F4ebNUCXhxj7trNe79qZ267G+zgK
         7mZ3FUrPf0w8cK4azUYZef0YjM1bDAlI3XMu7TpTD4j4nK5O0OlV1CkLyR/aGBlti4Fx
         //1RvB3Jl1gKtDCP05wVuSR9sy0dLSRKK/tvDw1xHv61sI3/dq+BsGw/MQpHbS+ekkoN
         DBSf0f4wlLmdicH6ec5NbIGLYB3u+viKHyc+n5OF0/aV+2qblRDLrHdL4m/Ey8ZkLV+3
         Wkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705937; x=1745310737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEtamelvEL5oMF5dTsmr5bTfdDwuT/yXwBSnoDyJAdQ=;
        b=Q93kUQP7rlNWsUWHK3QNRF30iCFFNPKe2Q+E0LuNT2xffMlSuUQUMX9sbohbH5P+gl
         su/y8B/WK9QQM9YP8AffkNvkuYmI+e+XXZbQu9eJGOjICzPJKaXnr39h0q0P6JVgBd69
         aAglQ7tg9qfeYMLXuBtOeVrgYplXjkw4R3Kn7cqB0jX+iJgGGYHWOHfTYhF/IBSgrnS4
         jHSh5fPpVcdR9ejl88ZQHF44Xf49gpqGooogRL9yvH0aF0egPtmOxoek8gTRJXJ3+Gut
         MRmXHs52W5tIxGhZfxbGJA/bZNFBWCfUFhHLv2MqmeRAn/cCAh7IM2+oYT/ICaH5KZ+1
         1IhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFDZr66MSjU15MsFCkSd4fYXmLKbcU49k8sI56aQ+xOJDCJlR8KTldIzfqb7vRMw3mfgyh8InjdIZg@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl7mZd4/D71+t98ogijoA6nBR7EGNF/RAf9me/WzkkWvUsowVI
	gdIpww9RNLAnUCi5tomTfAs1sxIGuqFuVNKvHYv25NX0Hoxb8zD9GyZtG3B4YKqKSayL14T63hO
	z5N6HRZ70YX1PDblSVd9sf8jNEUge9r8qSrJO3Q==
X-Gm-Gg: ASbGncsDZJBTck3mdO9IMbnm4wWvVbBUha7/IFBy5ZhtdvosoGY/50Kbeso4C4Lyyzn
	uQQ4JOUtZJDaWjQsRgILuBovKihi4bfBAh3h2ZgjFv1H5BuIZJ4Y55EOTmsWD2l09iQnFjihR+K
	s+slMfmG1h8IxUcbEXlIOhHi4G0wFk1ma5
X-Google-Smtp-Source: AGHT+IFqHgt85FAtKpysh1GWDt1MaHgR9+EQKoY32RVv1qV7EcZCQfTfkiR5qV5ET1fUQSQ/nZPTWz01QIwFY80tssg=
X-Received: by 2002:a05:651c:2228:b0:30b:aabf:fc4 with SMTP id
 38308e7fff4ca-31049a2302fmr45655041fa.21.1744705936671; Tue, 15 Apr 2025
 01:32:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-m68k-v1-1-7fdc9132b6e8@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-m68k-v1-1-7fdc9132b6e8@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:32:05 +0200
X-Gm-Features: ATxdqUENeFi82570dVSVXEp-45cJFXwjP5cf6PqktWQkh-wVvXZ5PyE19YzMtfA
Message-ID: <CACRpkdZRdyFJaKLnBVHUWor_MhJ-HBoEP=NMYm1are6em4v81A@mail.gmail.com>
Subject: Re: [PATCH] m68k: coldfire: gpio: use new line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:20=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
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

