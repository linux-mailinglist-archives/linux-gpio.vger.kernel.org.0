Return-Path: <linux-gpio+bounces-21045-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E75AEACF016
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 15:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6830E18988C7
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 13:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F89D21D018;
	Thu,  5 Jun 2025 13:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WIRrTon7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1FE20C016
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 13:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129356; cv=none; b=mXE4ZqTpUzd9tcmjept5Fvvama9ehDgs+i09Fpr7n0mKvXkUqKGjzeFC6IDKOLjKu8a2BJAkFr0mA0pW/QxJSOBOTF70mAwktPTnncXm0R55WqYiUCr5CRwvza7BwEhTaBufAy0zWNA4AHw0llui5yD+x2c/BnrAWTHcFZxdBXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129356; c=relaxed/simple;
	bh=Mwb/jLXwRXPfYZnLqb7tkfhCgR/oyf6dOSjCAMxAP6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Go6sN9PdiGzG9ddBuR0FvM7Z7YBG8L3yDojFDkDJAAuZzFMN6jKH9Fxn3hdu9WPB8NLwki1ABkLNE6IULzdI4MhUylv/48DqWNoekSmG4Pcf065Cv8ncH3WcxKw16zcgxA+kd5JByNtH3wq+rXN0TXY/urY2rvyzneZiid6xP00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WIRrTon7; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553644b8f56so310685e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 06:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749129352; x=1749734152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/jHbf1z3/GwHh0dqw8iaphItBx/HLohsmLRkiqAGrw=;
        b=WIRrTon7arVaxhwMRCSiNp644v40J+ucWEEM2kfaUPzcVNf0kUpMi0zOKYbCeBuJrl
         fhG2TXKrj/cCv+wN4qp//qSfp+E9Q/tL/PEOr+WIzdiSx6Byi5DXRMf3oXMa7h6ZlLoc
         zGI1Ukv8B/sRpE7DJ7Z/ZizLvX/2g27JTzrrmNsMEBfkzbZKyToRcAMe94d6hKUtBJqk
         FUZR4GDP4RQ1rAsy9ZlzZmLsQcDEV7QA8+dKm2sezarraj0H7l1aPTmXCoR2BJjCBFY2
         2xDYYB2uvg8vAgP7Oes+jlampo+R3p9VF/lZg//dC+n3+xxYZ6btwktWdcTaHjdj35DC
         Rcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129352; x=1749734152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/jHbf1z3/GwHh0dqw8iaphItBx/HLohsmLRkiqAGrw=;
        b=P4GjiF2nr/8sSxR+2xVK48hFmtRbh2Q5+9MkMdsKhtgE6uxeN/04XVsscNXUCoYaGg
         PFDyIg+M527ZJbZ83lngwGCaMrE9CVKyYdp9EhewUPpTKzhMlWxnkn3U5jMxcjceCxKd
         Xe9j+3xuTW0Oj+i/Dip30p0FV5qWM+xgmwqyfaVTZn75bhryOWiAYYDAIny8n9FCM445
         /N7NfA0v7LJDosB2sDKOly/xWVtjGGzQU0YEP1ttwfwzQco1v5TKrw9bA4a7nqGdYz5c
         LifvB4tcVxROEc13/rzgy/zl+iE/xbAiQ0+D5CskTz5YyQbXTUBCD5Lr9Spz886G83Kn
         4ksA==
X-Forwarded-Encrypted: i=1; AJvYcCWxwzLQXSp2MFA6nPRllQXH3lYf+s/qroe+LQJ5zImEcHXB9+xP/IuHoofgAs65i3ieF+e0qyKcW/BY@vger.kernel.org
X-Gm-Message-State: AOJu0YzYr8CPvRJcmHrVM0Y0gA2YhU/Wg0ngjehZGOHrfMBYMcNG7MWV
	sN7PLZrpB31L0ap0bWJOx9ui8YauQPRw/AIBFZeOaY5vKFNfnR65IvL7Uho72UY8rX7tA23G6I+
	/4yJcQV9NPa06gVO3V4wrsglqxieu82rJNkxpvKW/yg==
X-Gm-Gg: ASbGncvH4mLlZqNG8QVLlb9uct927Jy3pVG6iFWe7Eq4styKkbk35Grt3u3ts9LMoec
	ZQWf6EMfx/DvDLnI6CwUx4rRJRyAQxAfNfKG+LURqvATEf8mlGIEihclFxH2ppbFbFqR/uUoIKO
	PE9qATIuWKAIkAArGwTHcZ/M/hfLFfOOEW
X-Google-Smtp-Source: AGHT+IEtw+KFs74hmFMtpGQr1aKa935b0NpsGGWQpNnG5XrBRWdWQpRB3tC7HlaBnfp0RMDHb822Vw1dn34eoThSi1s=
X-Received: by 2002:a05:6512:3d9e:b0:553:2eff:8d74 with SMTP id
 2adb3069b0e04-55356c04ba8mr1984451e87.42.1749129352237; Thu, 05 Jun 2025
 06:15:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528092201.52132-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250528092201.52132-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:15:40 +0200
X-Gm-Features: AX0GCFuNPPFv5Vg_JE6Z7nHnr_dSwu-FURjQf4TaIcbuLPNkU0UKRo1LK_MzVe8
Message-ID: <CACRpkdand3H_XzUk_hSXxstPhbdfxd-hUP-nZUcEe_Qa0D5j7A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: st: Drop unused st_gpio_bank() function
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Mark Brown <broonie@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 11:22=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Static inline st_gpio_bank() function is not referenced:
>
>   pinctrl-st.c:377:19: error: unused function 'st_gpio_bank' [-Werror,-Wu=
nused-function]
>
> Fixes: 701016c0cba5 ("pinctrl: st: Add pinctrl and pinconf support.")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied for fixes!

Yours,
Linus Walleij

