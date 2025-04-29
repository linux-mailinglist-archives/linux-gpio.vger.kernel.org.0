Return-Path: <linux-gpio+bounces-19476-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F732AA1C22
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 22:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D48DF4682D1
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 20:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86DDC25FA07;
	Tue, 29 Apr 2025 20:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuYHob+K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFAF20C488;
	Tue, 29 Apr 2025 20:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745958417; cv=none; b=pP36a+k5MlCb9+T/R/uVhjQVDmSw8HkN9YoKImlYzBm4haGygSSETIkWXyRSZxa0U/nlEa10Tu9A/A/JAcBoOOEM5ZHngHuY8N1bJQ1l9nGJlFfiifgcts8DXBcM5O+pEdAOpANXFuJwyv6Io5fy4Tr5/xzEkfbmi7f28hqWz7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745958417; c=relaxed/simple;
	bh=WvNp+q30qH/TwR5L/3It0qHStX+Dafymtm4ihkBq+4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oyORnGMiEqi2ED9x3WS01Uw+yUXHGhd9A9y4SK12sJxBUfcl/em2K1uLtlcKwCHSchRbLawtr2J83QvWrWtS+uX5F0TJKiJYgvsrXlJjnh8lxSyWjlVD0krTfq+9nLCPxTYGhOMD1BgoBAYti5Q6tg4PRqXYPy76moCDB1CakNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WuYHob+K; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so812004766b.1;
        Tue, 29 Apr 2025 13:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745958414; x=1746563214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMkoLXfz5Tip2qVDsIevfbTubEDmwlUws4KIBMQoIIk=;
        b=WuYHob+K45f6V1uwl2iTrrevFnhrJcelepdFMpmpI3L3zNIJDApOyELRjIacEMbj7+
         Vr1YiLMNDMWYtCyHnIQyEVM0FV/m2NWHGlw2gumF9r0hWXaIWXvxGkCj7BhSndEyKpUa
         EaEI/g6FIQYx8HUpO0jNFCGMxWI2IQTM4Q3Yk4z2h1dOUhVy2vuG63+e9PTVNJIJB3iQ
         DNr7Fdeo67Mmz1P5GKEUsnEibI7RtnRde3LqXTzMNpWOk0DpKwrdcmeD4+nwHyHaOmy3
         o8LhAHVAJ6zJU4idXf0YVvMURXc6hXYDfjEDnnp6LoUkvmvO1aBveenF2wGWoysDEzJM
         GR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745958414; x=1746563214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMkoLXfz5Tip2qVDsIevfbTubEDmwlUws4KIBMQoIIk=;
        b=B6fLEsHOc684+NSHAhHBKMg5EFK2cChp/A6ijG7hCEtJlrf2Ob16Y6vC+0qjxdLyg7
         B3YyJLdlfXbz2pJMMq6ofGvfI3NKUqlPEGWw9v4w4N8Q9km4bWB3V99GNLKxru44szEx
         l/QnngQRFoRUoocCKyL02S33lwA9VRdc/CFd/xLAwtxu0b+iatnzzeJShjLXj9hyUbdi
         NVIv1OrdAVPrrmMWe1+xcp/3z9k/sSq+ciPwDoBOu+b6roenEOe0IBR6wK9UOtNfrCIK
         5Jxq4zEl/8GPmKnaW3bZbsw/nrqpJndcOzRo3Ii1xuFqCnqD2/EWyAGvXXnZzfpCrnCE
         qn/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOesJcm2fg39rxYEdZM2vcy7yu/d/up2WvwyGnkiu0pXThK7szFT8jI8yJ4reiJaV28PZLETZDu9E3@vger.kernel.org, AJvYcCUsxcBR3hdXdTx4eTkNZUt0AwiWPPG+sYllPxdhgLuRHTgdBqBqv3aRrRV6GEInScN8aMrco5Ve5qEoaNQV@vger.kernel.org, AJvYcCXTlc3cIzxV7Gxmm8xe57GYzsJUx082Whv+GK5P1R77917YQQBUI2v4Uzra5nq0sWG0/8g0PNxlFb1cHE60azXw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw68CbPmeHxh8xaR/ZHstFO+6TOBh3SEm0gh9vt+2uFQnXmrVgR
	6htmeQFaWCEdVbD30Y1CAZFEHuMxbBeiwuaPZPkA7EtuElc26G1SlE6BoKzWfGK1PNC1lqOGprr
	oQD9JWsn2ipHpejV78/Ec4LokBWc=
X-Gm-Gg: ASbGncu02lgyN+yHRyZE7nYVrqipU5ndMVgVijG+MCxU0R/JLZPegOVWoUjfx/MueXv
	v6sStlPiUNrCfzzSXVPijo3EyqVA2+yBU4QWrJQ97Ifs2kx41r+V6InWNo2+y6GNZORwtrCeRwL
	SaZta63rmgV/ylhWG+FpwbtESlkVHY2tQ5
X-Google-Smtp-Source: AGHT+IGCLciv49hineUmLqUpn0bDBJCKcHxkih5OsTLdLEiflEYD+MdKBCxoWvq6EORfSyz+HOqhjVNz8s8lZm21fCE=
X-Received: by 2002:a17:907:783:b0:ac6:d142:2c64 with SMTP id
 a640c23a62f3a-acedc5d2141mr75025166b.18.1745958413904; Tue, 29 Apr 2025
 13:26:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
 <20250429-aaeon-up-board-pinctrl-support-v4-11-b3fffc11417d@bootlin.com>
In-Reply-To: <20250429-aaeon-up-board-pinctrl-support-v4-11-b3fffc11417d@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Apr 2025 23:26:17 +0300
X-Gm-Features: ATxdqUHyv7huClSLphXiWRapCyRRVAgrX59nVDOUgF6PeytZkE8BENaDVbuxnDc
Message-ID: <CAHp75VdHNgwLuuwZJZXiN97dXdw2cVZN7+VngjrdyFPv+CZPgg@mail.gmail.com>
Subject: Re: [PATCH v4 11/12] lib/string_choices: Add str_input_output() helper
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 5:08=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> Add str_input_output() helper to return 'input' or 'output' string litera=
l.
> Also add the inversed variant str_output_input().

...

> +static inline const char *str_input_output(bool v)
> +{
> +       return v ? "input" : "output";
> +}
> +#define str_output_input       str_input_output(!(v))

Missing argument in the definition of a new macro.

With that being addressed,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

