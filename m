Return-Path: <linux-gpio+bounces-18523-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC63A817B0
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 23:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8925465B03
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 21:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01BE2550B3;
	Tue,  8 Apr 2025 21:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DYo7txUI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50699254B09;
	Tue,  8 Apr 2025 21:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744148291; cv=none; b=lMCLst2COOGEQvWaRgkDLu9/a1x7wjlqGJKN6XBzQTKIQ4HzH3pyGp6D7nvLqi8tDHqNPLTcJCmWK7Zi7zXz20LRv9UUjnR/yLKHkfpgDrnM/B0cCLwPwi+hO5x4LBX9KYWMsT/cWJfz0AqFl0ADddFfef2wmlkaX++yb/HOVLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744148291; c=relaxed/simple;
	bh=x1IQnem5+1V3vvJSgA6Xjam0vT8Hi4iOlcZBMq1s+ho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FVGQ8Bf59L6LXaH7W3drieYAABwG7XlnRBImVF+8b6AOnqC9XbQ6rskycCIx+SM+hzC/SbftZT4nD2kKsrKvMYLfE6F6ernLb1lU4GZKVhBEd9jdbkcmaC5PK9CZhSeKxScpJI7y/6T+5KfuRCH8yUz2lsNwd/gBucNh+1Zreg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=DYo7txUI; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-226185948ffso63344235ad.0;
        Tue, 08 Apr 2025 14:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1744148289; x=1744753089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1IQnem5+1V3vvJSgA6Xjam0vT8Hi4iOlcZBMq1s+ho=;
        b=DYo7txUIsr4FOTbgXdltQOBzAm1lVaM/WbA6lXrOhsOOa3NdapWk+59uINsgqbhR3Y
         kj9nB18pSymOetRaj7aeohfIkLqdzEvgI3eZk2sNAp9E5LPWOrd8zvyTot33JZeacmDw
         YKlGLzlHtDlras3+Gt8yhPqhCYRuRrTf4Mm8ueAiEtxzssmpdTpsOCuoykrKPF9gAcPR
         tNZdWFrfxxsHj07a36QNRHvuuZL7dzS7YQ4QogT0md82JAEm/fuvC/1ES95yNm+yqT4C
         4mmHhR3crNYztb1yWY8X9LYmTj1NBtuz5gCZOENsf9GQ+Q+k8w0TtyAYJcKpdpurbJi7
         Bybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744148289; x=1744753089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1IQnem5+1V3vvJSgA6Xjam0vT8Hi4iOlcZBMq1s+ho=;
        b=rpBJaxlB2FtcUXkh8utyronAwV+KHzlBBXhuQc/yRyr0S9SpVUczS2utvIdpwyTf6C
         pbMTd6dXaxQLDDiX0PCSDfgbEWfysb1XpnsDtMsjw4x59vDwCNTviPlmDEElQDPmia2U
         eOk/wuGQj3q0Dr+ZVZKgb0Fzg7jLZEN+8LTRwtfau8P5iPBMsCaFTSBjNLj/8jxq9T7e
         vgSldPSOeAJbfhZLUc4rKPOoSwydjrkPkaBJ4yFTwK5G1KeyySGroFLYYQ38Tf6FRhpg
         s0yDvzc5Q3/XxamiKU3gMJdia68zEM9DVozpTvh3eOVLBCVKrKeq2Wl/fLFUfUPs4bc1
         WlZA==
X-Forwarded-Encrypted: i=1; AJvYcCViIcGXqBSUEO5V1BOftJySqijTwqFbJLs8pCZaaTbGXmsvlQ2wizLH+6tWcgeRgLUVhUFF9TwMTGOJQr7A@vger.kernel.org, AJvYcCWgnWPfmiNGkv0oyZ4WLM5QcuLIXbXlWEWoTwCyeuWaI7iF6h8LYlNeUR23Fic6VJOAFYOCm4hVxEiF@vger.kernel.org
X-Gm-Message-State: AOJu0YySBxlEUiXozjjrcbhW+OFcVQc1CBeTXf6odv3Tg0+M6zflf1uj
	PDvBln5qM437ToZYwAmbbqxkNV2AyT2E70teOzjBgWgC1NLMQlACZlWmOcp2VQrCngrmET4YSaK
	XPzqYFhseykF+u1wTvP7R7e3LMWc=
X-Gm-Gg: ASbGncvp2ocTEtpBeTHg/wY8uAH60bOE//u+/wmmiZJSJNBODQiddpB+kzKNhW0TZ0t
	WR1LgwERPmoX4f+1DMVZFYHFk9wXDcIl8EiBtYNLWgDqq46GALGzLknjAMjdCi3TYxTwILkoaS+
	/dBrYsHeIT6tsGkhRm+lch2ifPh1zgPrMZjFOKYPCrVUdlhP5Jb5Q=
X-Google-Smtp-Source: AGHT+IH5QfmQXLyEs8yLl4lnNgBrQz+0B2EeQlnngabquZiUIdHCYM/yaoQjm3bCiH0/CtFIBdc6DASRUSj6QcJIqNc=
X-Received: by 2002:a17:902:e94c:b0:223:f408:c3cf with SMTP id
 d9443c01a7336-22ac29a7d9bmr12335945ad.21.1744148289467; Tue, 08 Apr 2025
 14:38:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-5-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-5-c9d521d7c8c7@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 8 Apr 2025 23:37:58 +0200
X-Gm-Features: ATxdqUGtVxx8aXdM5QJbHejwtOyKwVkD40TpZrZvEEbdFgeGmw_KA4eTPuMlZqQ
Message-ID: <CAFBinCCk5MKNomc+nGMEOiwnU7NbfRf5dsVbKtEjxSoyOU_Oag@mail.gmail.com>
Subject: Re: [PATCH 05/10] pinctrl: meson: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
	Patrick Rudolph <patrick.rudolph@9elements.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 9:17=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

