Return-Path: <linux-gpio+bounces-15599-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3D7A2D4C9
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Feb 2025 09:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D299C188DA6D
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Feb 2025 08:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0491A8F82;
	Sat,  8 Feb 2025 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eAvzMH65"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A481A7046
	for <linux-gpio@vger.kernel.org>; Sat,  8 Feb 2025 08:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739002275; cv=none; b=QcZmxEEgScde6cYLaxZzVEJRV6KpmANRPxhwfkUcyFeVhERqG3cPiBYF0q3pW+xW0CoBf0WC/DcWM7iFoqN1i8qDSKCqB52ttyBDiKcTtht0qG9hw3r7WkcZvt91QLgdi9ppV/s7ICiCPRdztiH9qzCbybe2gpNYkIttfvVX2TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739002275; c=relaxed/simple;
	bh=bxm0Gq1x5fkAqjzhK6hgWVUbEn5Ef6NT3MJ8Fh7seZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a7MWk71GyhJXTKbaIMGLtyPBLFcfy+0Ssope1V8GogSjn+vqIWzVdRNOLfGsZfTSTI0nVneI24KW/qjpTB9HuBrve8Id/fNaK20gFmtuLIRyLtspjhvoN/GXvqqggNiEQnwRloZqIQWCZNgG35W9LuReW3JwVhl14xlhdwG3SIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eAvzMH65; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5450268e513so87405e87.3
        for <linux-gpio@vger.kernel.org>; Sat, 08 Feb 2025 00:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739002272; x=1739607072; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiIFqqJMdXJ23ljTdQnHZqAYZ1y/yPvmLVewrsPJ3/Q=;
        b=eAvzMH65EypK2n0SsTSD8+O21o+DJm1SXiOFTk6yDneDT3sXNzcEWZNTO7anLdA+FU
         D/p9KQqEOnAJLIPBwoyItbH5pRMlYzJQbwn2rgvcHinwcbTg9yOeOy3+sMQUBZ80bF+z
         m2DWP2ZevQllnPWjI17fnrvlpqQNwkEyB1Dy2dK/t0KrcRA7AY1KSAMS7o7QfVEOvVt/
         KIebWYxvY7ERbRAYEVEQToksI6+JW1fNrem2hLuZI16zUOTSyHdJMAUU8DAdoUARa71x
         VUo6Ul2kVORZphSTRFPxJ+zTllCvWOXJK56a6YjGOdhv8Gs5p8hRarIdMSeiYVmmMebW
         MM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739002272; x=1739607072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiIFqqJMdXJ23ljTdQnHZqAYZ1y/yPvmLVewrsPJ3/Q=;
        b=JWUAqXl3kHbrMM9fbk6SkqATonck4VqHGhcnn3un8L1FKU99FEuiX/a5AoUOoaXPgp
         qvb/q2i7CsHlm8S0hR+S4sWCsVF+v7ORyAVntfa2isGV2xJjFEr/dg5YS4u1RKioN+yv
         lue3jTBG81ryb0d8eCT33b0uVw1AHuIKaZy6jI8KNB1dc1LDVT2dEj6cHPbNnjQMfsjz
         C1d0p2VQgqMP8YWnI2224vDba8Vvwq26xHseLTMrOL+2Jz6ZTkjEH6CTWKZDKEFtJx7g
         Q3op8TI51xLibwz/cggKEKvT156jX2TiaGWqFBGkZ1IUwPYC3mkn5QN2gd82faI7qRBF
         4ceQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEO0Q5RQQXSk2JbfzPvidKfCj96FqqBU/Fo8OcXJWYwTgPxKyf92gc88b9KlFPrmhVfCKijRFxeCQU@vger.kernel.org
X-Gm-Message-State: AOJu0YxpCUbmXhof2jZnSZbzWBhwtw6yUKvCF5t/iN+DcHnPCMmi8LD8
	EEf1+YcbPSU7JjmHfcHg2YTnoEyZmItZKjQdpHizFZOXrqGdqveF5hTCMaIqcte7uV3OAXmGyMQ
	Fa9snzije/BDO2c4kT6e1vzEFoGQ5398u
X-Gm-Gg: ASbGncu7fbnhyOsA00HEXWhj21mzT4eFvYgZ6wmfT1g27qVwsNUvf1hMUxUPnkZvcHt
	uz9sJmDy5iEWS6+nJjBRx97PruwH7Qn99cCD+JwV7ciuWg9dFEuAkm20d8PWkrx7y9tcLMeA=
X-Google-Smtp-Source: AGHT+IE4hfU9dp0bqeXZ7WIU0MXocNLEpy5CFnS6vFLxZfiGCPVQJUWZz7OVPcMxYC9NahuiTEz0FM74j/j+kBak/g0=
X-Received: by 2002:a05:6512:468:b0:545:23a:d9b5 with SMTP id
 2adb3069b0e04-545023add7amr280210e87.9.1739002271595; Sat, 08 Feb 2025
 00:11:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103083520.1764441-1-a909204013@gmail.com>
 <20250106043508.x3pwt3jzh37t265f@vireshk-i7> <20250107060044.hteiw6dgycz5rr7x@vireshk-i7>
In-Reply-To: <20250107060044.hteiw6dgycz5rr7x@vireshk-i7>
From: Leng Cold <a909204013@gmail.com>
Date: Sat, 8 Feb 2025 16:10:35 +0800
X-Gm-Features: AWEUYZl2v0ZB2StNgGA7NbBp4txnrsS-dgvem0L6IQvr-ttXub1s2F9gwMWSd0E
Message-ID: <CAHqiF6B4pQZYVmsfVM8bRaS1Zt3TX5Sw0_bmLZM6WBx7t7d+Pw@mail.gmail.com>
Subject: Re: [PATCH] drivers:gpio: support multiple virtio-gpio controller instances
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: info@metux.net, vireshk@kernel.org, linux-gpio@vger.kernel.org, 
	virtualization@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping

Viresh Kumar <viresh.kumar@linaro.org> =E4=BA=8E2025=E5=B9=B41=E6=9C=887=E6=
=97=A5=E5=91=A8=E4=BA=8C 14:00=E5=86=99=E9=81=93=EF=BC=9A
>
> On 06-01-25, 10:05, Viresh Kumar wrote:


> On 03-01-25, 16:35, hlleng wrote:
> > Modify the virtio-gpio driver to support multiple virtual GPIO controll=
er
> > instances. The previous static global irq_chip structure caused conflic=
ts
> > between multiple virtio-gpio device instances as they shared the same
> > interrupt controller configuration.
>
> What is the conflict you are getting since all it has is callbacks only, =
I
> wonder why do we need to duplicate it.

Ahh, so irq chip should be shared actually..

static void gpiochip_set_irq_hooks(struct gpio_chip *gc)
{
        ...

        /* Check if the irqchip already has this hook... */
        if (irqchip->irq_enable =3D=3D gpiochip_irq_enable ||
                irqchip->irq_mask =3D=3D gpiochip_irq_mask) {
                /*
                 * ...and if so, give a gentle warning that this is bad
                 * practice.
                 */
                chip_info(gc,
                          "detected irqchip that is shared with
multiple gpiochips: please fix the driver.\n");
                return;
        }

        ...
}

For your patch:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

--
viresh

