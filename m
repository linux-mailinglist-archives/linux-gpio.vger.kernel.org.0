Return-Path: <linux-gpio+bounces-19474-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B179AA1BE7
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 22:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD9ED1BA4DE1
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 20:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC05725F963;
	Tue, 29 Apr 2025 20:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMHP+HVN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF6D247299;
	Tue, 29 Apr 2025 20:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745957829; cv=none; b=mDrabITQk5Cd1mMG8T1MMDynZvWI2Hl09VDMnva6Sebu91sMEhzmdFpLWwKmacvZEpQofnTYKWoecphC021ZsqNLuMblYI3SHtpvPoX7byrm6lEi+tij4z3edRK2idPyffQdljMiDZXltRxNpy7Zo4xk4ckSI0+I2ocr291inyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745957829; c=relaxed/simple;
	bh=6DWRXDALV0I4nuC8h/CIkcOoGX8VxJnH78KniDKRbXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kb71DhQnhEmliInYb5fPLZCnueYc1LbUt7xHHGKhwDz8liQ5bSijBDDvtkSFmGp4dgQUwficD4yUVoyJ8/EaCUuW4ujyEQVv32xyFK5xkGAI92PC78W78XinVsUBi8lIREtiaYDN/OPhyCyeXXf4Xs4a42ee1qT+0iVo0kFNFVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMHP+HVN; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac25d2b2354so978837366b.1;
        Tue, 29 Apr 2025 13:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745957826; x=1746562626; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQRVatuVGssaljJ3vn1XVB7mibjnfMqkqmo6NMljCtY=;
        b=IMHP+HVNl3nVFRKWz9+Eo0kSUAudwD16mN5lYEDre2NU41shCrtkR73rJsM9hA+s4N
         u0hjDYeSAcTE0cyGbNrPcEqd2rkbJB8ky3QYCm+JLGYuy/9lHat3SuEV2W9E1HPb9AnL
         RKiUiP9kren+/YpYaybFTTSxyZ352BqbpsIvC6jMMntn4ZZOY8EnbA23LpfaEsKg9k1H
         ys1EHtyJ27Fg5hkiuwY8b+uHOHdq9ORsUjMfzrbX6IkaGArs+/phlI4t9SMYUlz+4+6b
         gPIP/TOWSyoYaVohQxK2KJlmjN4/pls/vVNv/WJx9kDkcr9muEPhl1ztSDnC2yQZ4mMY
         t7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745957826; x=1746562626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQRVatuVGssaljJ3vn1XVB7mibjnfMqkqmo6NMljCtY=;
        b=XdI//PrtMMtwHNu70sYSKc2MpDuF3jsyN133FviHkbNl91r2raszfnqwcPz/m/gO6h
         6i3cvWWq6ERtVwajg4t/6ElVyWBkfgPCrd4sX1fFe9NM2vw5pP2DIbvIV5dkzQbRburB
         tDoNTZ1RGvmzz2Kq6TIxQwU12OYw9DjD2wuIm+HKsLt/FCua1G1112Rp/cPwv2IiILpw
         RVBkA2FG1v+lUHVU8TlQBBOIlVAQ/hIP9NJavS2WY7v8zJSrPWvT6H5sf8wUwM60ySb/
         /G3vCAyUdyapJrLYOgsUyGWCzgJJVUMDNgUOYw0sdTGVYLTiqleGi2KwMiPmjLwAllxu
         AMqw==
X-Forwarded-Encrypted: i=1; AJvYcCU//u/apKVSpD3gU0T84JZqQuVt4IZ+9d3fDI/4OTR8nRwUZLBV1Oo2a1JN5EFzGnyHZL5h7/3Kk0HmqxnvAjdc@vger.kernel.org, AJvYcCWcrVeaH4JhvfhaFuXsdZpKB4OdP/KN0UgP9Ux1vTzvoscTKom+MRUbC/oN59T9ybG5owQeaa58udlGWKdf@vger.kernel.org, AJvYcCXuoqLMhS8UDkOW2XSPSEr6ntQpd3FVJoR+f3FJUu5orglnXLwSDqKLz8kwBEUhdPHsvBwSA0mhFANW@vger.kernel.org
X-Gm-Message-State: AOJu0YzWR2iujT93ABoeKhbSzu/yXdXnwz6xqZNqlUvaOJK3XDtBCY/Q
	djylVuFzVF2fT0W2+CpnF2mXXGkpAe2JCfBzBeFKFyLcDNxLtkKmGtBsW0fichcwIDDiFLzCeHK
	fnA95WNmqMnQf6l/rDjRYJvCZaPs=
X-Gm-Gg: ASbGncuIXsq9xjQ7AdGUCmB7qn71fREb2yG7q911DV76f9iB7OcMlhoXkwX/WaezNX1
	/HS2j8OC9VVHbesedHDSQfSzk2KlAWZyQQ9GnUeQIm76uZQalGjsTCy9Xf8KJqP32wsH5D7XJ9b
	21xC8CTovT62WVf52d/o607w==
X-Google-Smtp-Source: AGHT+IFyurlfvu16SmPM/yw/ilbCRD/q3MCYHhD5Mop7BCqBbkkR+ZwU+3v5Ak8z+QVin8zET+u+tTLjJGtLEGNaJEI=
X-Received: by 2002:a17:907:9628:b0:abf:6f87:c720 with SMTP id
 a640c23a62f3a-acedc62902cmr75910866b.29.1745957826131; Tue, 29 Apr 2025
 13:17:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
 <20250429-aaeon-up-board-pinctrl-support-v4-8-b3fffc11417d@bootlin.com>
In-Reply-To: <20250429-aaeon-up-board-pinctrl-support-v4-8-b3fffc11417d@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Apr 2025 23:16:30 +0300
X-Gm-Features: ATxdqUE5acEB1xrMK5E7nyagKS4Tz7U_FxTUq5xl43Dr7iKXNYtpLlJTCatOTkk
Message-ID: <CAHp75VcgQcMjFe5NOpdU9Lm_rHBWWMzPFX5197uDofFrk-yn5w@mail.gmail.com>
Subject: Re: [PATCH v4 08/12] gpio: aggregator: export symbols of the GPIO
 forwarder library
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
> Export all symbols and create header file for the GPIO forwarder library.

It will be used in the next changes.

...

> +int gpio_fwd_direction_output(struct gpio_chip *chip,
> +                             unsigned int offset, int value)

Is there room for offset in the previous line? (Looking at other
changes, seems to me so)
But probably you want to keep a logical split, so the current approach
is fine to me in this sense.

...

> +int gpio_fwd_set_multiple_locked(struct gpio_chip *chip,
> +                                unsigned long *mask, unsigned long *bits=
)

Ditto, and okay to have this logical split.

...

> +int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
> +                       unsigned long config)

But this seems to be on one line, no?

...

> +struct gpiochip_fwd *
> +devm_gpio_fwd_alloc(struct device *dev, unsigned int ngpios)

Now one line?

...

> +#ifndef __LINUX_GPIO_FORWARDER_H
> +#define __LINUX_GPIO_FORWARDER_H

...

> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/mutex.h>
> +#include <linux/spinlock_types.h>
> +#include <linux/types.h>

Too many not used inclusions, please add them only when they are needed.
Actually it seems none of them is used, But there are absent forward
declarations:

struct device;
struct gpio_chip;

> +#endif


--=20
With Best Regards,
Andy Shevchenko

