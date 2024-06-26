Return-Path: <linux-gpio+bounces-7729-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 887D6918093
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 14:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 088E8B2289C
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 12:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE725180A98;
	Wed, 26 Jun 2024 12:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e98xr7uQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21984180A7C
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 12:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719403704; cv=none; b=HeZySWbkXXOpMukRyhnsvb1I02V+CemNW9nBxDziDNcEU0ZT3c9ZGjdzx9UxWl3RMK+Z2DQ5rVlbmPLBLAow+LGlA50Wp6dZ6yL5dzvf6B909Uy7UcbfZpbRbNXyM7Y5d7w17CRG/oSSSEXfT2EDeYZeNg7+ALLO6WKkKUqD2kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719403704; c=relaxed/simple;
	bh=sNM0t5btmwmRWxg9oFqKPaxYC2URMv4IMNPh+tlcPuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ft+ne/O4DVeuEVjylWA+ugrlS1FzpWiN5JDyt7ytgf4GbfvzVzjlCuYzDa8DoiVbcW1x3PK4jHzbXMTcdkhXUbJMmAFTIr0Y18HjWw5UBt/2ZXW1P4vodhdLraMD+yv4nFnSAs3TsCn3WDJ7c7H/OIOsPZpdUOPcTklTrPkcISQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e98xr7uQ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cd8897c73so5508498e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 05:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719403701; x=1720008501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNM0t5btmwmRWxg9oFqKPaxYC2URMv4IMNPh+tlcPuk=;
        b=e98xr7uQZhOm7vUbGkUM3VWkQXRrvP3U8JgJM0vCds8yORRFubKAWjRpApatMNCM4P
         VaY+Iqf3eyQ8YyKAlg5bxkWxy68yy8Mnf3y25+CWV+zl0HvTXUVG1Agw0Z9v60XljERS
         6taRBd8kyLgsKue02uRnp6QwMi0Gjxs/ssOGNe5lq708UqBWgNEdF4VGS3Z06WS3QFIp
         xch8ZVTGEzLkeVvgGBhEQgjP3M57uA39v6iO8hzTgupujL+B30alc3kZkSp4Hy+hMkko
         4gCBCEaPeC/s821mVP/GpwyUF7cz2mgV0qdEMxMpm6AkeYpQ74nUZ1NRBsO5iRJQc7H8
         tGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719403701; x=1720008501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNM0t5btmwmRWxg9oFqKPaxYC2URMv4IMNPh+tlcPuk=;
        b=TCLTH3MnRRFvuIej9wbW+AzMnPoo+Jyq0UWfiMo+C12ttI2D+oF0bqHwTZj+oGM5ms
         39p7GCEuAHfJHAjQJAQtSDCLNn/0zuhwpEKJUT1ue1VpnW2eT6/GnU+urZmPDJmehvb+
         7s483vHo11iuSGN8xSse6vE3AUmIG+cqw9m1AV3mWfbURIdUOMTocYn0D9CUREQRA73f
         m2Rm5rrH9YzqBwiUlwloDRsC2c7YDk5kxkx/BshYya1pPsrLowMvICv8ePALJJ4BTWB0
         +oc2YKqRj32fB2qmdvUfEf8gEPs3GzqAZmKfpsyzMUau2h8Zbo9nxzqyHZtX74S6boul
         cY7g==
X-Forwarded-Encrypted: i=1; AJvYcCUZFVgjoG7l2p398KbQVxFsx0JpiSxHi5EwCtYZlGtb0LS0g/fRFrKmVHNwDRZuSInZnD1TEx+kCuCcqpo8G3b0ZOrdU6IFxSnwxA==
X-Gm-Message-State: AOJu0Ywe58c/gt+4JouHOPjH43SGZKsA0ZFyl8Z0rWbMLkMavCBX4Pjv
	fm41SUnKeKFgbsbQ4eiIHckiWAzA8gQMVTp9D/tr7p4/IoqZnpSoW6nuAiR9QkWAjRqe4j5bFvZ
	5K2TMjHV2pmAc5UfW2OvKY2xA9jKtzT7byIJQpA==
X-Google-Smtp-Source: AGHT+IE7XMxIQJJ1aCimYjEWSyFZvjRjaUXV7rV4COqu6M3ZQ2Zfzl0Y1tYmHaO9gdJvOLgTXmM+4eAs2D6EvjQdW6U=
X-Received: by 2002:a05:6512:2004:b0:52c:dbc2:ea1 with SMTP id
 2adb3069b0e04-52ce18324b7mr5665556e87.6.1719403701264; Wed, 26 Jun 2024
 05:08:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625043525.279711-1-manikandan.m@microchip.com>
In-Reply-To: <20240625043525.279711-1-manikandan.m@microchip.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 14:08:10 +0200
Message-ID: <CACRpkdbWJN1DKckGqqhTX=nJ=0QE6-7pobZw377iKM1DDrMGUQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Convert Atmel PIO3 Pinctrl and GPIO bindings to yaml
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, arnd@arndb.de, durai.manickamkr@microchip.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Manikandan,

thanks for working on AT91!

On Tue, Jun 25, 2024 at 6:35=E2=80=AFAM Manikandan Muralidharan
<manikandan.m@microchip.com> wrote:

> This patch series cleans-up the compatible property of PIO3 Pinctrl
> and GPIO bank nodes in DT and includes the text to yaml conversion of
> Atmel PIO3 Pinctrl and GPIO bindings.

The patches:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I assume it will be merged through the SoC tree.

Yours,
Linus Walleij

