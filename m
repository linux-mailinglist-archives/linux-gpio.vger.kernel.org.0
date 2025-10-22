Return-Path: <linux-gpio+bounces-27452-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2091CBFC390
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 15:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 111C562449C
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 13:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC592346E77;
	Wed, 22 Oct 2025 13:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CDVnjz5j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C82347FC9
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 13:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761140049; cv=none; b=nbD8ds7Bwt4NykCaykQiED2LSjWNL7aGqUch99/sGbxnxkWrrFWtrzEdGkoczydYYSI6ydKX10Xu5NUkkCGcchCOA28CxaNWYQoTh8wM+Zoxu8Y2Vilmlw+fGEMXfwFORAhchN+2oB/88dmMGOomEIo3MWnJ3edC/BCrkgjjA7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761140049; c=relaxed/simple;
	bh=gWtnyZCMZ79lGvtHTyeCn/sxtckldijN3FKie7XpzK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OKgbLI1w79ss/+0/gBTEimd8kcgL1GHORDFDdEOz2Hihd7ZPGmnNtugFcCSfl2xK52PrupbCZ5f6wrB442t7sAemgPs56ih9wKxICfQpNy0lLJ7Yvz+QtKliHS75Oq18MI2pAfK4m9QlCETPoTf4F1XO1kPDEd5rFhOzBHvI1/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CDVnjz5j; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b5c18993b73so1096977666b.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 06:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761140046; x=1761744846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnDab3MvBR9d06ZmEVci9R2LEo8WZZltTef4oKgMrxE=;
        b=CDVnjz5jqOsaNOGf/xUBqTdky530gFLOTueh497tFpB3jkwYJP28o/3s45BjwsT3qr
         lxtZZfaUu9NuRQXrZQus0kZ+fVkvLKEZlTTPAjnn8L1AK83eyuMn7Wafr0Zx2aPo2m7B
         fOksJ515XZEh3M9ikP0Zi6ABQa5qKlirVffuN9zigqowVSbr8nMHixoqdkvTuY6pM1iV
         fQGnCgY4EBxF4s+0B7aI6fKEQq3+tw0kG1+xMoUyanJoZ+Fu6ARAN4wIWfTxh39VwOFr
         Wx5ZbOHMR6GU5w6ATE1Pq8Wi+CVOQETUwWCPGLKBJ6FEJg3fmGgB3Tv6eWF5BzUXgSL9
         dcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140046; x=1761744846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnDab3MvBR9d06ZmEVci9R2LEo8WZZltTef4oKgMrxE=;
        b=VyhklUFqKxLzCdt0jwkkdYbeKVP9IYOVqQ9JlEgqmY51bKl1nMNmNSS8mcjcTtSBXL
         +baAuH/tlbhJaSNTMqIhSy/z7PO2qD25+AUz8JSE1UPNjCcmAxqKy4dzs0RtuVtQjEYU
         F386BBpbq8SeR2rLFB7Kt2vlrctlgkEv3rfBWe/T3ZaaMRWfpIIKOMQ5qDvquv0PS0gN
         2s+Kd6WDNkI3BFQdzsd2Q42N8gzVq4oH6krULw8BW0+vwWekBYL2MmWNuBRiVgcltaK+
         rxbkWQsXxjSMQntP9vR83zFdgiSAk65iP3DUHw24xViIVMfhTLNMSsznfp52XRFgOi/4
         pnzA==
X-Forwarded-Encrypted: i=1; AJvYcCU67jqow2rR3ZPvdLtpR6SG0+SBvuYH7acZxii62NCIRyKtto2wUXiRdmXhUAy8lYgV7xXA+Ht733ZH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg7apLlTpDLiNiwqzo562OnM0X+7PFClW/gHlmMobNzyubgU2N
	nHLc9n64uMqFS09Dbdd+28tqNQduzJPmA0ZQohGFeKMakYq+lRB4TyUXKKaaEESnquNwpKR+Th9
	eADf5n6SQuGAPZfqn1td4+JxGETlCaY8=
X-Gm-Gg: ASbGncvLLu8QE1k8LPqksJbrp8BNM3IQFAgjWHUgiz1NI6hCYUuoY5bVTGsBbrACO29
	QCgHjMUQcReJFAJPJQwLesZ8oRgoddHwgvM/cuLrnRYySP0dVsgFcSiTBpNbBfOc8VMw7tscwUP
	yvgwb+eBVxrQDTHkmzf4Nz/2LMYEclGSS6jV0Ov4q0TIqpGvRzBjNbRaMo0qHOXB/tTuEsTk7E6
	LRSV1kxYg8qsZL61OgI12aj3TtrIICVfulyT0bfpNgnSzWTZXNmrqMKdGIj5J1cKSfBaVeZ
X-Google-Smtp-Source: AGHT+IF+bGnEQc856DkdZpIAOaRV7nKVJQZfv8gn2VCNIJnjHmyCsahfWQqIidtzCF/ZoRQsNWSOtm7llM7J7h8TBP8=
X-Received: by 2002:a17:906:7314:b0:b45:420c:81c0 with SMTP id
 a640c23a62f3a-b6474b36a46mr2340985466b.36.1761140045360; Wed, 22 Oct 2025
 06:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org> <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 22 Oct 2025 16:33:29 +0300
X-Gm-Features: AS18NWD8eeQXjXIPK4eXDVlSVPojwJxWfrcwXD-jC0yt5VNiNWjvrq9EAmjuWt4
Message-ID: <CAHp75Vewc2OoD7=eoFtrkPrGRuB9ZGT2vu4Z_wdHZUDZ8igUtw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] string: provide strends()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 4:11=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> Implement a function for checking if a string ends with a different
> string and add its kunit test cases.

...

> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -562,4 +562,6 @@ static inline bool strstarts(const char *str, const c=
har *prefix)
>         return strncmp(str, prefix, strlen(prefix)) =3D=3D 0;
>  }
>
> +bool strends(const char *str, const char *suffix);

Why not static inline as strstarts()?

--=20
With Best Regards,
Andy Shevchenko

