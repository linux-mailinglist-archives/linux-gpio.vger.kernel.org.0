Return-Path: <linux-gpio+bounces-28739-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AADDAC6DB83
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 10:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D9EE34F5927
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 09:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103A1335BA7;
	Wed, 19 Nov 2025 09:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JifxLllR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BC83358C2
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763543612; cv=none; b=XGY8bzvuhZ9wMSn5UL3UYtMJIXwx9ZNwQuRsD1G9OAJR+1iZfzL1fBwwWM04MC1mJFX4SYtuDhAGg20U0CThSNKA55OxEXaTSvst2JGLnk9zrtQVUJUq/hYABxrNX1lBT7HJ91rOufORWpCg1rGl3pgpTnXQY8o0bd+wWuYufRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763543612; c=relaxed/simple;
	bh=qGa6obvFqIKbQVGEu+FGZTJ+R+chI3xR4ysDJDTEp1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I9C0hS7zEBnTTE7U8UWW767mfXxfqLifPWbzVTarp068RAzqdD9z8Hi3BSAhDNoe7rkjAVbR4YmxwGDLYyTpKuPQVr/yJhNM+XZPeKToRuGBTmk+n/nru+0B6B/L2rDPrKi1pPDzoCGI1Qeb9r7+Mwx4PkJRg47UZnGpQ1YqiQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JifxLllR; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5969c5af23bso93505e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 01:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763543608; x=1764148408; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0J1JKE0aezaTk7YL5x9auhCAR6Yuw+pFDajDahgAlD0=;
        b=JifxLllRExMiqRqMOfDDgMcsabW46GmVq/QpgLGXQncI/tI+yHrqD8wc7uD/I4mPN8
         V5+wvFVTK99e0XEY+e7IO8wHvG5BEh5FiDOROgalWU83FcGRSPdzlKMGufbIwqtC5MbE
         hTAhNTYXOX6q8/QZFXnlAFDTjq1XMaf24cunJYUXrcN1AaSOiUZdMWwy95/EVsethHiK
         SihnWG26qOgOq3aSFc/Ku4PelAF3jz8cs01fniId6uMyWDD0nNoUqJCkTaLiQdFR5JpK
         ZCx3X0AvDMcLpv/7+xuJobEAGJtoV2mXrYkaUMG9OnH6dWhyLybN0PNcM3FoCUgfJtMx
         6DuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763543608; x=1764148408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0J1JKE0aezaTk7YL5x9auhCAR6Yuw+pFDajDahgAlD0=;
        b=dS1n8hTUOrFpHqu51C6fh6/D6j9KBqrLz4HwanHfYV16I6BGp3uE4kHBwMM9vJAVT5
         LftYhchmcVLHTJcTDmoXZ42eKuo9yvZ/yV5edmzwGy2aLK7KMvNfaGZhnTVTS8nu35Nz
         P2N7jyBTej/JKH3xPYB16jPTId0+w86pkmqGV2W6dh5Ww/OtDKTfGYQK443V+YimmZtu
         qFG7PXXiNpRmiL6P7ydaRCc2Kx8wWgi8HpdB3UFSSj0jbx75L3ziyees2EHdxFDfs+Cj
         JEWhcC8eK/wqxINaROYVmJ5aZsTMQy8ol2Q/UvXOdIobHUKP1LNvBe1yBqYfefacBNoR
         HN4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdBBCVAWPaQV2Kv+theBGfd1ZIhI+UPbEGED+6P07qzQk7wbc4wKK8qv0K2PjC+7lhWc5MnLx+qRkb@vger.kernel.org
X-Gm-Message-State: AOJu0YyWyOAHn2vM78ZXCYhe6H6vMDKxsONQ2HnaVbHGCtvZ1KmiO1Gj
	tjnzxa4l4V/6jYtdLY7HCMm2MrLJojhQHeQ+APy8mVLoRkUuZZb1/6lbYM35co1SjBq2zHNsIge
	yPVy0Wf0VmkYagDcPPi4wNYIVduXMsK1+HNB6Xe0c6w==
X-Gm-Gg: ASbGncvmbJ1/wBVJV1VcuhTXGkmAVzN/plw4EeZqp7D3f6jivTVnW9Mu4nH5+H8P1H0
	6vOZ3BtKAM2LozC6+Mm6oh62aXxbY4LzJmWbCMlhUTVEGrjQoXy7VzhHh0RykXB6+DsDcuYsEjI
	IrLkByw3omiONtT7CwiVXK6Y5kaR9p1YtPtGMCV93eTZqyu50nKC1tum+wVHVDuR5xf107Ayy9o
	gKENdB0r3yERxVuXL7rSThD0d7VM7ezluLenH7EUKwJRVgndc8/WCUIUKL4HYeTf8RoAzrLsckr
	w2NeBA==
X-Google-Smtp-Source: AGHT+IEOI5iZEjfO9VJo0Kz3Z09YGBxN9hO26vkpOzJXesVSVACehf+X9YKlHf0uT5YA8Z7B6Zpf7wlHpLU/JSp1No0=
X-Received: by 2002:a05:6512:b87:b0:595:7df4:6930 with SMTP id
 2adb3069b0e04-5958419f6c0mr6943714e87.8.1763543608340; Wed, 19 Nov 2025
 01:13:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-lantern-sappy-bea86ff2a7f4@spud> <20251112-reappear-margarita-83b9d6c04dd6@spud>
In-Reply-To: <20251112-reappear-margarita-83b9d6c04dd6@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 10:13:16 +0100
X-Gm-Features: AWmQ_bkrfiDYfimx03_4hHPW7_c-dWF0WPsMlwXx16TGGTPqPEZMNW6kc49N4bE
Message-ID: <CACRpkdbXrq=9xWBCg3iOX1JySAu+xs+G9dDUYphEqeN2-M9tuQ@mail.gmail.com>
Subject: Re: [RFC v1 1/4] dt-bindings: pinctrl: document polarfire soc mssio
 pin controller
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	Valentina.FernandezAlanis@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Wed, Nov 12, 2025 at 3:33=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> +examples:
> +  - |
> +    pinctrl@204 {
> +      compatible =3D "microchip,mpfs-pinctrl-mssio";
> +      reg =3D <0x204 0x7c>;
> +
> +      irkd_sd_cfg: irkd-sd-cfg {
> +        sd-10ma-pins {
> +          pins =3D <0>, <1>, <2>, <3>, <4>, <5>, <8>, <9>, <10>, <11>, <=
12>, <13>;
> +          function =3D "sd";
> +          bias-pull-up;
> +          drive-strength =3D <10>;
> +        };
> +
> +        sd-8ma-pins {
> +          pins =3D <6>, <7>;
> +          function =3D "sd";
> +          bias-pull-up;
> +          drive-strength =3D <8>;
> +        };
> +      };
> +    };

This looks good to me and you sure know how to do syntax
so I don't even need to check that part.

These bindings are fine.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

