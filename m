Return-Path: <linux-gpio+bounces-19717-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB3DAAD5F0
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 08:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E76A77A207D
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 06:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51787205E3E;
	Wed,  7 May 2025 06:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHmW9loA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A511D63C0;
	Wed,  7 May 2025 06:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599015; cv=none; b=lWQ/4zeXqgY/0S8g0APhlp6iRSpv6pt4jjkVn+8zIUbvfegEzvU5qsP+GNx1uZr5TFfJSa/eH5J5vBBUsbRbKoFdbAbwNoXt9E8FrTesQ3suEY+ZhwUe+3rB/3/ufWtgZOoY9JBDbgDGU/ypXjGOQX9/FXGfMMZB1zIstgfNAMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599015; c=relaxed/simple;
	bh=cIkyL809DpNZFCoH/QArUP8VFEysAc72R2o6zAotn8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uuZJ+T0d2MNEWeBqPHJXX4IDI9w00FEGIVZolCEiMXb2Ck/zvPQnN4lbWR3pxU6K+mPJZFbNU3IuVR+2ei4oqjD8HBJLwbr16hdXZnytYldhUUo1BJixqmXw/JLio4cegzV3j7Xg2zwwKpt2ny4/OsZJziDu721Cyw7LBCSgHZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHmW9loA; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad1d1f57a01so419767166b.2;
        Tue, 06 May 2025 23:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746599012; x=1747203812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIkyL809DpNZFCoH/QArUP8VFEysAc72R2o6zAotn8s=;
        b=IHmW9loAirkl3kuj2uM15X3GAeB3qNvFNLOqeqtrydtkjj1s0jCsAeSLdUA/XO1Ezy
         vZASGze3rUIYVt4JNs5u0neLRHoBVk5EwgdAETcy2oAn/zlTGG0HdKKeTacWWsisNe8n
         Z+M4ajG6vqiKSp/YRcVSBllFRhS6opNY6zUbAMCyy277PnJcp4AK2xJNwJvqgKpGCnfO
         FC5pS4Xte1w0Gn+9Ak/Nc9ahBl3No9YmE6HVwhiQ1yL01zSRSRYsEsuwLpzMjpl9PmMg
         A0783YV2aHGaIsgEnoMeAcEzXGRD7XyMlwhEO6o7NrweKEHzFV1x89jgrX+L4AQateN2
         mKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746599012; x=1747203812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cIkyL809DpNZFCoH/QArUP8VFEysAc72R2o6zAotn8s=;
        b=O3a+3I9Opr7+NG03zVoAzSB1J73oF4ipNg7ERTH8aVhRYavwppnz9P/NWyQhp06Od7
         4hBzaE3Wt1UP+Ivv4i1JxLcZpOZMom1cXWPn8GPB2m97Zm2yopqHfUMFPFE28xBNJiQv
         skr8cvXiVKXQr2QKD2Jpe0cWZ5m8nkkD+l7mkoWS4k+5aVehCtSXFjc24/BNLEMxSiyl
         5X40Uxy7A95Gdme4eP3nIwip/TBrG6DLZ3GBOfS61H0aKMSh/DZMJvfNH4bPXjmqrf50
         ZP+lLbtSvJJ7zIwUbwb3C0nGOcy9yO4ne0SaAdIKDD6VGa0GOLIRap4Nn6gfuxdFwvLr
         DoSg==
X-Forwarded-Encrypted: i=1; AJvYcCUm6G+B7ZhLK3AEGPa4jeWETo2VUCsDJLsskOkOui4+cRSQWfcoZYBkULYJFkWj6diH7m3d0X+OKuIk8toC@vger.kernel.org, AJvYcCVtWJixfuBxMo1AGfjpNJQqOU/uO9vQ/bf0m+alqlyumn8TcbVroc7HgjQAZj6edrSDfNvjny4aqcQlIrKYugnd@vger.kernel.org, AJvYcCXuLOrzfBOPhhSgzvuvFBsFGcmSQUXp2MVC0/QVLbiCjhFlkBYCNghWwlv4in6Sg9De80xQblZ8CmXN@vger.kernel.org
X-Gm-Message-State: AOJu0YxIenmZBFe5vlQQbkNO4O07oKelZA52SP3W34vQSFNitt2CYxoa
	3XrfuHw2pwp6fVirglGlop+VzPrx9HL12B1v+gj9uRPXKZYPxPlMqX/IGPzzaUvK3wdTlvjek7b
	2AhpNFa3rYn+ugGmP2E+1iZXv7UE=
X-Gm-Gg: ASbGncs6BYuY9/sG2uhGBvvdCZ0QhJKL5yHR4l/CGmyUrrQ9rtlzleyXdalORDthmkk
	yxKfdPJV6LeSVzdEEP5yDN9hzqVtzcTm5lVpCVV3Op0pJB7qG+TEnRAKOcR8vBQdkGkLDHv9vrf
	Bd2kzQ+GHjO8xAfKDFhpIkbg==
X-Google-Smtp-Source: AGHT+IEOGnsBXsP4uvUcozOu4S5D2FFOy6vv8NUZdedB2gn4SM7bNNUaJ9f60KXPkDRjbmTcR5X12bulyU1oZ8EfsTI=
X-Received: by 2002:a17:907:9d04:b0:ace:d68c:2f88 with SMTP id
 a640c23a62f3a-ad1e8bc8da8mr203523866b.20.1746599011480; Tue, 06 May 2025
 23:23:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-5-3906529757d2@bootlin.com>
In-Reply-To: <20250506-aaeon-up-board-pinctrl-support-v5-5-3906529757d2@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 7 May 2025 09:22:55 +0300
X-Gm-Features: ATxdqUEB0Md25wpJdoWOv7e1-MgQeQTcFgtpoWyKkdk3fObqVYQHhhernqFlHnM
Message-ID: <CAHp75Vdk5Tqykqpg_G3FZpjKjz3yBjz9dNdTu_0R4KRtLMN7=Q@mail.gmail.com>
Subject: Re: [PATCH v5 05/12] gpio: aggregator: refactor the code to add GPIO
 desc in the forwarder
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 6:21=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> Create a dedicated function to add a GPIO desc in the forwarder. Instead =
of
> passing an array of GPIO descs, now the GPIO descs are passed on by one t=
o
> the forwarder.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

