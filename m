Return-Path: <linux-gpio+bounces-19470-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4451DAA1B88
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 21:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 399CB5A57B7
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 19:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F5425F7B3;
	Tue, 29 Apr 2025 19:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbASlLEr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745BD25E804;
	Tue, 29 Apr 2025 19:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745956205; cv=none; b=MsexXXlJw6fWpec9Cp23VVKvCGOIiE0KP4+SI/Yy/5heQcuaiGUtKVUYGBoJRsVv9LZDiNfjsJ+oin/4FCQ7vAoLTuffo+fDuKpnW8yZ25ACAECc8tc9FuO1IvI7DLc8FKlZaIOeD3VV/OQPjWsSohELjzjlFgtBt3Mvhi6teyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745956205; c=relaxed/simple;
	bh=rxQV+B09cZpKnArsylLSchYzK1z1cTKsP3tBIcuV+hI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S1ypZskdEVxLvcE3fI2P09na36IjOFxyQxtchejSLOU121l0thrgfzlR3N8qVi+2OJV5ZW0BbJalmWmZr1CZqh6mxkfgjoy6Wjv3/V+0cVMkaYCl2ciI6uMBvzP4uFlJlwXoe74xXxXLz+VheaFVpX1C8bQ6hFJIyfRgPhwvKfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbASlLEr; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso10017231a12.0;
        Tue, 29 Apr 2025 12:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745956202; x=1746561002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vD1YAn8CAvm0h+/6JzAGzl8A57FhZyZFee4OCIIGKBA=;
        b=AbASlLErF+Ug7Pp8Nlz5uZmFhvJwI8m5v0tuTJE502Do92ie4GoMv/FQIhal+D4YjE
         01x/gjjrNpERM0/fCduGdrte4KHamhaY0KsJnQk5Fxl6rOInsArd2i4KPcwz0M9Ye1Sj
         /aFyah4unnQZTAKBY0b9S1cFrz6iizYFzo9jHC0x+xTJgNEYooTu+vqM5Rh3ep2DO1ue
         M9OnNy4Z6Sx7wPOV4wt42n0NAotHWRrl5T/BVZ805rkhpNbVO1Cf86x5HFDxh/6ximAj
         88M7dvT4XFJcSGG/LqFXN38s4Q4jEA0UHoGR7d1psRbMwx3Fo/E5Ntb4Oi5kCCUoslsd
         2+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745956202; x=1746561002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vD1YAn8CAvm0h+/6JzAGzl8A57FhZyZFee4OCIIGKBA=;
        b=Ri44AvMGC09KtYfvcgV+MOyiP+eGXSqR0L9efgDSOMn+cf+93v39uT65j8SUjx74oM
         917du0NYVBHJyfMfIG8ctWsyZpI/5LrzOpvxjqcjAtYCguzAQKrzXeQQNQ/105349AQg
         MXyLJlFaz+mVCG38GWa/sCyrhGfOWdVNzy0qnWBTNQxjn0ynluRYzfpzoRn2ow20lY/X
         QbEe+zYV4ViWX8iQ2TF1Jxod6VHk69/W3OinnZB0x4vBK8vM/ITiLiEEXhvipwgd/mfq
         hV9okxo/GQXOmuK/8cOiPyitbBSIlH8o87903Dz5X13pQGF5DSUXBo9h5LQ+irrCoqw6
         CecQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+ZoKfgV2+OW5IEWTV9KcoGAg2cUIVyPF9l9Gqen66U9X1tJRiC/RbL0t+cTfkD2DTzc8bdmBEe3OQ@vger.kernel.org, AJvYcCVPIeIaSVfOQiapdzopQhHHGQJ94lQ1p5M8LoKeN5LyXbhfYajkSgYZGXkPsN0ZVgCiK6NGkUgSoIWnWGgNuI/D@vger.kernel.org, AJvYcCXjlmXNPOg8eBdyfLqsvKnxTWprjNT3CP7bxCWW9R2Ip8PjELbXBIeml7gqfKhY3ec+fSUGpH0VL5Vha99X@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx3bVizX1g9p5fG3ayb9XiiZAID6J3FqTDPWeD+epH2xUJ3yDt
	r6ZYsUQrHzOlpafJgeqD/Fghm99advReQCh/JUImlxQl6dAEHv+9qFoGOYZ8eCLba8oXmMpFDR+
	7QgxGX8HlRWeowrJQCqhq6ZUdaC8=
X-Gm-Gg: ASbGnctYqjPIdBfy6NhJswP/SM0ZmyDDP7TMt1OkprLjcrt6TQlb+u50xI5XcXyXqnW
	BSCfgcqaetHXxk4YmSF0iqyYO9Tivjk3IQOZHVPD8YOtCWkqAXlUNtwNKBaXUOdi8eYcqQKS587
	0X2/fgnKkZ/Qt3gBixy7rSyw==
X-Google-Smtp-Source: AGHT+IEUzFIo3b0L4aXqgoV444s05OuZpnNTBUTUqCoyUFdKydQUdpip0ILc9B6HJvuemsUHctOi8vEgkoRpMDf4RAQ=
X-Received: by 2002:a17:906:4fca:b0:aca:d54d:a1f8 with SMTP id
 a640c23a62f3a-acedc6229cemr61982366b.31.1745956201478; Tue, 29 Apr 2025
 12:50:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
 <20250429-aaeon-up-board-pinctrl-support-v4-2-b3fffc11417d@bootlin.com>
In-Reply-To: <20250429-aaeon-up-board-pinctrl-support-v4-2-b3fffc11417d@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Apr 2025 22:49:25 +0300
X-Gm-Features: ATxdqUHSfG0vNdIwi2jFrwaCEV7cRWEDDe8ST1XH67uD4-tJhqxBIKpIR6Y0sMI
Message-ID: <CAHp75VcRYE6meHB9+MhcH242eXbA0jzYXhL-+WidvvLXiLX=MQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/12] pinctrl: remove extern specifier for functions
 in machine.h
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
> Extern is the default specifier for a function, no need to define it.

Suggested-by ?

...

> +int pinctrl_register_mappings(const struct pinctrl_map *map,
> +                             unsigned int num_maps);

Now it can be on one line.

...

With the above being addressed,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

