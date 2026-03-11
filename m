Return-Path: <linux-gpio+bounces-33192-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJ4CImrNsWmQFQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33192-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 21:15:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF300269D12
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 21:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 479D530D3D40
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83AA738D006;
	Wed, 11 Mar 2026 20:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWe/prAY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D664B38D011
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 20:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773260124; cv=pass; b=cn+oLT9Sj0l6SdValdaqJNvIFXR+hI+VP6r6Tz1ncUaYUv/jhjkq/e7RHauo0wtKxbBWyj+uRS8RZw672ZLvx41tuDpJMZAhnbIkZY13CjU0irlxPyx2/yoYAkVe3QkPLrG9DYvGI7onLqMFQ8MGsdRKIioZu+nBU41WXEC8bW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773260124; c=relaxed/simple;
	bh=qCUYBGAUOheU0nTCcMZyCl5y4dtCdasyHwmyMVbOBCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A6VCVD+SBKp3w3B0MYHeKuk3qzQYC/pP403690IkRO/h61XQCXQ245F+PXtx+BnmxIg1l3X2jHDqT14CuoeTiNRnSZXz9R0HYmfMjbCgVoDBPIQzJUJ9TvYbFisbbGQKqIG2H3zbjbLKDhMTSIW4mouS1yPFB1XsuPujFThYE9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWe/prAY; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8f97c626aaso34932166b.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 13:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773260121; cv=none;
        d=google.com; s=arc-20240605;
        b=ZYgijfomfF1WbYnw1nnU8thT0xhGjE4/V1ovSfcTbQYFF7E/sqZOMkx30TKeqCxuh3
         aU9Dvz+mdmY2HLVhTikzCNgfCi5Z0Y0gZxo68BB6BDNkUcW7IXV6TTYDIYFl7UpGx/J1
         xQkzz+b9DV34xzkbWJOOQGyKvwHBSLIyG2B/p4sM+qTpn7l1akt//OBMlkeBxlpp+d4Z
         O5WlIUBHUHUHudvt3TLrFusLMggIDCcj828quPQXGn04KQa4ZNTyJwbpBuEzcAC13zpd
         6jEdRcdL6eEEZZL3bjjhgz7tTLzxSydwg+w3vN7MroveOQbRsA569N0HAj6MYDSRh+HS
         cNHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i6F+UW8vpaPOSbe+aow4A6qQsDdfkrJCugB1bxi2H3M=;
        fh=e1WMgAB1qGTAc+1lRN5S5cBuGe/TzMTqbinrbIiVuTE=;
        b=iCBtleTquFx3KmTATqlc7JbPRCTS20TtljCU2HkLc9d3fwIpw5lK+UfpIQ9DqMY0qH
         nAWmbzC5SlwfDgxICDIVJ+/afXjrd2TsLGrSfwiCE95FKF7egbzjZ+bQdeB7UeiqOIWd
         0YJwaU6e0+lu1TnaeAQ7sjKkwvSMGFJ8WEeYOZ9B/rjohK60KZwL5bWP1Jyrj/BD8MzR
         bq283Ht5d1nLHEZ0CwmKI/rxMZbeNzH5STC4x5wTM62ftr5p44AK/ixhrz6Zg9YeWGs8
         Xwq+gIYPpPkVVWKdmbeRwWj5CZzb9Oexsl6xCzeeGF7C5ZhYvUro5Sm3Ly9adbmbybkm
         tAbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773260121; x=1773864921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6F+UW8vpaPOSbe+aow4A6qQsDdfkrJCugB1bxi2H3M=;
        b=nWe/prAYzvBDiutVXiO6S+1K2vIf87NlcJjxfML+QuWQ2JitCchpJ0EET506sfrXvv
         yTqYq99l9QF3PfHVikdeebx8GwUPquPD9q449ZlwFS+Gmq4WtrvtfFwT3NRZxQL5R5Vd
         LmxYUDee4Gq/dzzYlZixAwza8lw7PWwWTa0XW8fQ13XWdwmB4OjH3rBvrsIz0DPh8/Vt
         opkVQQY1LGDxOUs5vestd7+UHQ24SjLdOTWKX1ix7I+rEA+8wEqUpk2vVsZ4FZCgoY7R
         k1FrYcNQAn/VR0SG2J+xoY64k5Hkt2owRDbGWJ29GCC34FAy65MIdVnhQhXTBbMWjhCg
         QFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773260121; x=1773864921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i6F+UW8vpaPOSbe+aow4A6qQsDdfkrJCugB1bxi2H3M=;
        b=vJQpH4hXAjzmE3DUsfrJQyXMlG8kbl4fNc1LmojQyGL5c0W8Q9QvDgMXA9w78twPw0
         U6FPt57w72c1BuItzcIoCJyPx9Ta4E0M87yrifOhw7AFuEg5iht5S+Ern0GGP+Yuy2V/
         yww7L8XSSwNW6ozqu3GARbkonq0yTHfWtHJ//S614XHaHVub9H9lgbqaArW9v12jjCKu
         K32w0YL5WV1dYr0nAXS8VnH+bHRYudjpgV7NJEYsADd+OAX9wfNsh6Alo0n6uaHJ/rK+
         /kh9UwkVOZLWrN+PQ4B4f68tibbwCjciy3daUpF2Z/7jyt1UR9fnPTpIRfYrv4DtB7mH
         d2uA==
X-Forwarded-Encrypted: i=1; AJvYcCU9Qr7WSnI6tozaDmwPQYHEb4F9apH8kZ5IHb6blUuKfad1rwPCVupuOlscD8rTM9agfVRzOdukiMcX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd2giZY3f4ljEgwOgDcUpQIXGol/x7Xqb3oiH5r+kHcHApECGg
	lLA7v/2Qc5sq6FPs1kRFTcfs9ETsGsUiyXWjHh8YZWDzg/VocInRDiwyV05rFQlvf74BwVAhOAh
	EV8s/28VQg6uiZAdCesbeG2rkY0tOATQ=
X-Gm-Gg: ATEYQzyFbB/gyTv3YFQbbp6RY/9J1X5u6V3EB3NH+dcImUOtScZDcYlNTHqDxkY1Ojv
	nTMyjLU0pck/jApD1r+TmZRD+qaopWAhVKNe74BBscz684bbAhgrXI7jzMo/GChwgbT8FBJMp6o
	RsqXxV6+ETM/q3ci/le0b1/k05N2kEVNKj8PJwusw2H43odEfzfQ1hzQnsbcNkxGRUTKjmi6j3T
	h8I4T+lChkhYZEa0mAsGE2nLcSe3QfFnWomeQx+UYuS27JTyga2EaXtgyDUI5eg4bizjddS/VNx
	aBQRczOOqCnDIhqEPxyAUUSYYmEQRLxBQj0Bvhu4uqX4070tlfhjwceWzbwvDPfsn3XGiJ5/s07
	TQcxL5ZXklj40nfQI8w==
X-Received: by 2002:a17:907:fd17:b0:b94:1df4:3525 with SMTP id
 a640c23a62f3a-b972e20f6c9mr213172366b.1.1773260120699; Wed, 11 Mar 2026
 13:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-3-b51f97b1abd8@linaro.org> <921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com>
In-Reply-To: <921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 11 Mar 2026 22:14:43 +0200
X-Gm-Features: AaiRm50gZlAiM-5_F_zUlx0D2HjCtugUtf3WuAOsTMIp9Wv8sMtNxrZngwvWk-o
Message-ID: <CAHp75VevThmDMm6VoVB9P0YbUGGGsmgnzr2gn9=1xtJZt-kuQw@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] gpiolib: implement low-level, shared GPIO support
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33192-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[bgdev.pl,kernel.org,gmail.com,linux-foundation.org,linaro.org,google.com,linuxfoundation.org,arm.com,perex.cz,suse.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DF300269D12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 8:38=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
> On 12/11/2025 13:55, Bartosz Golaszewski wrote:

...

> On Tegra234, the main gpio controller has a total of 164 GPIOs (see
> the tegra234_main_ports in drivers/gpio/gpio-tegra186.c). The GPIOs
> are assigned a index by the kernel from 0-163, but these GPIOs are
> not contiguous with respect to the device-tree specifier.

If I may ask...

Why? Is it sparse because there are pads that can't be used as GPIOs?

> For example, in device-tree, if I have a shared-gpio with the
> following specifier ...
>
>   gpios =3D <&gpio TEGRA234_MAIN_GPIO(AF, 1) GPIO_ACTIVE_LOW>;
>
> The macro TEGRA234_MAIN_GPIO(AF, 1) evaluates to (23 * 8) + 1 =3D 185.

To me it sounds like a bad design of the driver for this SoC/platform.

> This is greater than 164 and this is causing the above crash because
> 'entry->offset' in gpio_device_setup_shared() is greater than
> 'gdev->ngpio' and this causes us to access invalid memory.
>
> This is what I have been able to determine so far and wanted to get
> your inputs.


--=20
With Best Regards,
Andy Shevchenko

