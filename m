Return-Path: <linux-gpio+bounces-15990-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7574A35A18
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 10:21:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39B6A3AC471
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 09:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8250F22E414;
	Fri, 14 Feb 2025 09:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p1FEnFa0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C4222D4D8
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 09:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739524875; cv=none; b=pNWlHJxhO4LAKNG2j5jV5ODW1YUNvEOO2O8ZUW1z3QLC42iTopondbJwIAR++KpoF1BsFZh7D46mzls/SiaRyNFvwf1tTEZPqXSP7z+FLe5FUuC9AavdA48mG52mxuLDjFLAas6/Vuu8PiVk37ZZyKWB5LSGJWX/5nZuEelAib4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739524875; c=relaxed/simple;
	bh=nAgI/y8eJ1E8nc79XXLDgqcje8Y04QIWciPNIuCcLr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Um9sBw0ii3GXMGSOW6TKwnSuq4f85bk3vyHTyxSfVN9Ib7mvZEitW+94aEdXmDoaHO72UwbSejtW2TOQEmBV5ZvnvwYbm1HuuKCZ8X9CmDdhECJ8ego4pl0XPtsrK7f0npYm0b4KakK/AAfx69mW7RuyOV8KG/QYJKGk8qVGr5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p1FEnFa0; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5452e6f2999so10255e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 01:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739524871; x=1740129671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAgI/y8eJ1E8nc79XXLDgqcje8Y04QIWciPNIuCcLr8=;
        b=p1FEnFa09lSugOKK9Nd0m6W6AHH3ieDTsFDkP1QwHrAY+sW6fc3okIq4krLCLAsWE1
         jsth5OoOunMQ3K1Wl47X8fA4dXSQPHT0zFWbf4wYRkVXXAKknN2fsqid6JF0AYdYEenX
         5ft8Oi+9u/MD0xi8zbIhkKQdUl/J3WoE7W4O4ZRCsBokAYgsXt6TSVJb0Q3/4lpuxe8a
         hY+LuL9xrQqdF0zu1faslNIAG+Px9D7Ym/EdjEV2T8P/ht1WMtVoG6YA4rgHDU3oP/lP
         fRhfK3POOUF2rkn0TRiTozy6rfv6GSidaFq4KP5Y7ieGDN37xkr3HWGnZCBaH+09S3wK
         47kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739524871; x=1740129671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nAgI/y8eJ1E8nc79XXLDgqcje8Y04QIWciPNIuCcLr8=;
        b=quxvVau1pOshsL4gsaTuYSHtX+yha3OSR4B3IA2VfO0Sn9JC62z7GsxDQQ7UVWurNZ
         6YiVmPl2j9rlyIunDgn7gDw9XgWo6Lt0gIyeZ853aT64V5TCHDId8jDe7PuqaO8Hp+qi
         uDE5YzmRVHaPO6byKsyFn7ULmOPnglwchPkaZpe6aUTpmmDgPqi/9sO3GvFSe46hlktw
         zNLsTiRixqGHPhuegrX5Y+GOXvCquCS1khBMzDpFv6ov0rKGu1Kx1+V0H6nPA2CasgrV
         SCnIxL5CLItsWWziW+sX/8goQaQ5E+b0lK84N3sJ3nmQKu/AzIxoA+qdxV9/rJX9ogwj
         Fj5w==
X-Gm-Message-State: AOJu0Yxx3pvHOAbbQW+IhhTxeiS7SgOL+jUPvmvi6+Qe2hvSvs/8kqfK
	+jTcPoZGZTPcrYx2dp6OnY/iBy3S/YmzPnVAjV/dWLqB7UY6wDzmrbdEzfUlot+Y30EVMZFE03U
	9W2tXKpft7YKPMv4VtnYVJiYshUev5uyhZSVzlg==
X-Gm-Gg: ASbGncvlh84PNR/kxFagGZGURzrBmn3rarSQ7Ix7SakhgyPiI9hEbtsJJ71+qrY2YFT
	S2kTTpFLecAyKneQuEACCB7P8geGZ8SizslxsO5CMZVjTQGqEBUk4owaohupxF1MnGA7ixenA
X-Google-Smtp-Source: AGHT+IE90b6o1JJv5clQNldUi4eegVlq4Ca3JgGfeUcZ+3CP/urShfREcnZbwFVUloZzXxIeSNiZtb/EuXTKGiYXpXY=
X-Received: by 2002:a05:6512:110d:b0:545:191:81db with SMTP id
 2adb3069b0e04-5451ddda5d7mr2106191e87.50.1739524871552; Fri, 14 Feb 2025
 01:21:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
In-Reply-To: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 10:21:00 +0100
X-Gm-Features: AWEUYZkpajzFykICl53b_t6wma0KSzpRBNdWfZ389OoEnBSGFtcIchXCSCVghNU
Message-ID: <CACRpkdYYj6MO-xAQAJ7dnD22YRbfBZFm18Zg1T9P0sd=5kd8-w@mail.gmail.com>
Subject: Re: [PATCH 0/8] gpiolib: sanitize return values of callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 11:52=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> We've had instances of drivers returning invalid values from gpio_chip
> calbacks. In several cases these return values would be propagated to
> user-space and confuse programs that only expect 0 or negative errnos
> from ioctl()s. Let's sanitize the return values of callbacks and make
> sure we don't allow anyone see invalid ones.
>
> The first patch checks the return values of get_direction() in kernel
> where needed and is a backportable fix.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This seems reasonable.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

