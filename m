Return-Path: <linux-gpio+bounces-16801-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A968A497FE
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 11:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E31AA16A8B7
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 10:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C757A260390;
	Fri, 28 Feb 2025 10:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kxUdpb80"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F5625F98C
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 10:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740740322; cv=none; b=C1gUnuGE0I9Az3uboxIGoP2CdLMbpycFmZJyXdEXycKbAEf0z9xvtSpVqIHWMHQFU+weo/5NERNmcdcGuHu+NCMmlh3upgsumvEIgKguOGxRY5NOKf7jAEcTL2Hlt6coT2XoyzpCX8s4sWr87jXa7CtJJNu4pH+pUcM3h1Tv9vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740740322; c=relaxed/simple;
	bh=oxqNUINeTffXc20l0BtSEeH5hWwFLIffg14u7l8+l+8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WmQupCGeBoDEpIbmVd4BFJY+Ur47pc5kEnbdAWWrVPfDbAYxWPH7L4aGhfxbMWc/BuFnkxoxgyke/iF8NZ4YXxj/y987xt1/o3l6uNbN2hnQSe2C9wV9e0WBhHNNU1xEtRRqZMaNo6Ckiv5fefNPK8bU45QjEpSF7ZxnqIFFvNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kxUdpb80; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-390dc0a7605so1068621f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 02:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740740318; x=1741345118; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oxqNUINeTffXc20l0BtSEeH5hWwFLIffg14u7l8+l+8=;
        b=kxUdpb80n7pBgWUDV0C2ir3//YEBA5Q7QctLX7E93Fnxu4OzFHRjitL+sp1CF6GbiY
         H5IoylsfqxUmvK87IcjnKuYxumTzpKlxMMpF34cWTKDvtpwA10buOOYPEgeZ00hqpsHh
         3MDUSyAecYMFzz7viZV++8JikkNACZki3w+ZsoWV6+vGfQzwzimwo75eVXxJexSDm5tb
         0mU1nIyayh9A0vYyqYv/V2Jbe08RrKeDZRoplgSr+mlzIEnM5y1lgAD9RTfTQ/TrxWCT
         4pO++SZ56UQXhw2UGcopDTPVE0MwOI4xvxHI9PCYHGX9rwzhHcGac3AECd/brXJXi43U
         ZGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740740318; x=1741345118;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oxqNUINeTffXc20l0BtSEeH5hWwFLIffg14u7l8+l+8=;
        b=rayLqziyvYswSJcfBd6Aw0/9BpiSx/CuKhwPTNpx50PWPIsmTO/2wVv0YMvhT/5HOD
         FdfSaHfV/gcA1GTQ4tz9gQGkXBYuZaAe2oxQvytoEdZZ0jBy4TIgyVyLldMTXaqQ13y8
         MxzjARk8y3yi6OkHQPrI8ZUMj63G0vzBzW9PwIaiWNWn1f0SWT5+EAixAblxc/7jnwpN
         RBZppqx7sCOF9dwFOs+VlF7SLyuaoxOREF4Sifn5WnU+UPCOtXGSV6XT2SzWRz3c0IYO
         9JL7A0bePqUgjV8GQFmgm1+P0/SsJV90oK2pmGzYHuRmzDFc8x5XG/0GfrjPOQ5b5Z0+
         ZzAw==
X-Forwarded-Encrypted: i=1; AJvYcCVz2K0CGkSANj4m4ewzXgxHVB7vbM37MYV0DDetr7tQIIXnyQ9xu5NrXTor2hjj0V219j0vvlWhAV4v@vger.kernel.org
X-Gm-Message-State: AOJu0YzDbn9Gp9Mtc6BEgqyNHH6gKbiyGxw3/mDL070ZMwTOUH0QE22F
	m4p2jGFgCR8hhM+hE4yp1aS91OpJHkXpYoo2rJsne6+LmIWDlpi1jiGWj/+Dz6c=
X-Gm-Gg: ASbGncvk+nS4NliEzIyaOOnt52KjzgpRv3bHydD8o4E1w4VacKBai6UNbx9XJeGaKlS
	0S4lI/vKn7R1LRHVTyNODVPie0D4ndttplS0cGObM5EbnAmvuuYU5xVjAGj4Q3d2jWjHKnrcUsV
	9jGLytHj2H+Ban1MlATclfDQor5yCEQkVnGeO224cxzODvovmcHFHwIljgcaAfDjcdHYc8XF/Yl
	QVFjeWeTdtMUDrFMUiDqrgL1cVrV3kzurlU7id7xYtZcwBqQXMCAEjgMnXeqppMLlpdeR88sKsY
	cuSwx0oOAJJJhDI72kp7W/MUOCmCtw==
X-Google-Smtp-Source: AGHT+IEt5YT3CBVFRKgnoMOQ/u6jH6bjwPCwN0M1DfhxLjRDEfi9tiVUCytcpBFYvfzc3Nle3t/Cuw==
X-Received: by 2002:a05:6000:1885:b0:38f:2766:7594 with SMTP id ffacd0b85a97d-390ec7cf66bmr2121670f8f.12.1740740318200;
        Fri, 28 Feb 2025 02:58:38 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4795978sm4724227f8f.3.2025.02.28.02.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 02:58:37 -0800 (PST)
Message-ID: <d06058296a194a4f2c9fcbcc5c24816ecb1f51b1.camel@linaro.org>
Subject: Re: [PATCH v2 5/6] gpio: max77759: add Maxim MAX77759 gpio driver
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>,  Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Kees Cook <kees@kernel.org>, "Gustavo A.
 R. Silva"	 <gustavoars@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will
 McVicker <willmcvicker@google.com>, 	kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, 	linux-hardening@vger.kernel.org
Date: Fri, 28 Feb 2025 10:58:36 +0000
In-Reply-To: <CACRpkdYoWuJzjqiKrSNzdXV+5N9Gp0n+pdCwSZgocwy0JHo7Vw@mail.gmail.com>
References: <20250226-max77759-mfd-v2-0-a65ebe2bc0a9@linaro.org>
	 <20250226-max77759-mfd-v2-5-a65ebe2bc0a9@linaro.org>
	 <CACRpkdYoWuJzjqiKrSNzdXV+5N9Gp0n+pdCwSZgocwy0JHo7Vw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Linus,

Thanks for you review!

On Fri, 2025-02-28 at 08:10 +0100, Linus Walleij wrote:
> Hi Andr=C3=A9,
>=20
> thanks for your patch!
>=20
> mostly looks fine, given the MFD design is accepted.
> Nitpicks below:
>=20
> On Wed, Feb 26, 2025 at 6:51=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik=
@linaro.org> wrote:
>=20
> > +static irqreturn_t max77759_gpio_irqhandler(int irq, void *data)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int handled =3D 0;
>=20
> bool handled =3D false;
>=20
> (...)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 for_each_set_bit(offset, &pending, MAX77759_N_GPIOS) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned in=
t virq;
>=20
> I usually just call this "irq", as it's not any more virtual than any oth=
er
> Linux magic number, and it can confuse people working with
> actual virtualization when we call things virtual like this.

Calling it 'irq' would shadow the first argument of this irq
handler function, which is also and usually called irq and which
I'd like to avoid shadowing.

Are you OK with 'subirq'? Or any other preference?

Cheers,
Andre'


