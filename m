Return-Path: <linux-gpio+bounces-17614-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D83A60F66
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 11:55:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 842A81785CE
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 10:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0771FCFEE;
	Fri, 14 Mar 2025 10:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sdch8sUn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3891FA272
	for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 10:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741949707; cv=none; b=bMcEXtAVS22zoz1KNjU+zwzIZW8MV+gVt/CDLv6EpMd1SEu/7yVbwExEqOJwMDt1FHfD17+pWC1mq8D2Fs1aaCOgAenXDu52PotTf5uAzeATnzVAEZ3k67aKmoDfseqCiWD/FE6FcoD4sQcCRJYGSJwuSCmGx6dFW0nT55bfQXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741949707; c=relaxed/simple;
	bh=XIpCWEJtNCIGCcSRjvUMMAFsp4KmagBzuNVM5BTwhsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PeVF3KHvm+M7JybCUQFstd+0KqWSYWDgiRsUg7tctSeCnbQIySf/fXUm//ladb0wlYehbsQ4ruyncTM1BuUAa4v+I68DqIbe0eAZeFJK2waOG7pNDEtBcsecaZyhp5j+YwYy92gyOc6oq3RtG6tpEt9AgstsCHjysN3kV1FWUr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sdch8sUn; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30c0517142bso17765571fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 03:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741949704; x=1742554504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIpCWEJtNCIGCcSRjvUMMAFsp4KmagBzuNVM5BTwhsU=;
        b=sdch8sUn0m3ZUuXHazJ6G51yTLicPv0gbfRoH2b8IJ5OA7B8t9p1D8Q9arfe9he/YQ
         MtEPe44ujMdJJ/BplAywwFwbKUfTfZvPuIsTZZj5vVdPstVdvYY3Yd13O3pPvsIMAUg0
         nSaHm856SOFBygvWdGSlk+AaKAccYk5QClHUBl/jlr/HEGtsWTo3CSsyE53VO0Ft4I14
         WRbOlgeXZDoK0vySL2q4s9cBdeTs/rIVilH+cc5U9aTv3VzQuHOcIPN9bA9tTEGFvUFl
         2IGULBHWU57F7AthPy5p/rd4vhZeYUdBTU6jp5bTfPMQ7LrLZ/VuCSHoIybQkY7orcu2
         PtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741949704; x=1742554504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIpCWEJtNCIGCcSRjvUMMAFsp4KmagBzuNVM5BTwhsU=;
        b=SQFzpjkWeUaojgs4mQ6kkUqeeQrIhD3sxK3dgvF52jTczCu/jtfEhzfiQ6FZFzElpB
         KVci1EUk4B0sHw1z4rkf6wqzSoFTOP+rWKiWoRgL/KX6ZJkA7LQdWJ3cWf1pGrCy7NTI
         hC7m0tF5iWbhb8SBQLHYXv8+4RNvcQX68XStLd6QnSzVAbgSKUKs6VcO1Plj2SSJsKp4
         RA13GP44s05p1cKE/S3mMGjGlQ43sEXc0dr5jFtDGYX/7z7dWhTM6vqXuokjFyOZWwyw
         vFXOJFzN+rjGQepSdAcjB4KbeenfJrac8ByuEjKwyDWKoUzf0mfFR1+l0barozBJOn6Y
         1eyA==
X-Gm-Message-State: AOJu0YyKMj5WNW4ROi4p2yKM/U6tnK8wshey1tJtAZlKm1uCwRySngOK
	tp8PtlrlK/aPHHqIEP/R+dzhCVD8wCgWcrMqvWNypSUJ996JZoBI+JtCQDf30DevvHjDQX/667o
	TaKxafYK3hlpWtEeVD7DumnxnnSl3Xwxsf4R9IQ==
X-Gm-Gg: ASbGncvYMIZ607MhobofF5HFlBwN6t9rfsxcFCbrc4jP/cmtnS5elaAZpf/a7rGyahk
	Zxeg+WZS9mJLZLSshVJSnOaSkI4kp7kLsjdGswAsS9iZSElHakk289MiPWB92OyRImDUNm1Zyj+
	wAdo9BgxROZykOdwKGW9HVLA4=
X-Google-Smtp-Source: AGHT+IHKqO2wuQsD20shcKJtT1g24wSPoOvFTAbujcg70cpsAoOwYHT2ffsYZ6WR4VBvcwwrqMsnJJ4lBJxDq0iv4ro=
X-Received: by 2002:a05:6512:280d:b0:549:7d6e:fe84 with SMTP id
 2adb3069b0e04-549c3c977c1mr524438e87.53.1741949703593; Fri, 14 Mar 2025
 03:55:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313-dev-adp5589-fw-v1-0-20e80d4bd4ea@analog.com> <20250313-dev-adp5589-fw-v1-11-20e80d4bd4ea@analog.com>
In-Reply-To: <20250313-dev-adp5589-fw-v1-11-20e80d4bd4ea@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:54:52 +0100
X-Gm-Features: AQ5f1JrPxPh4c4bYA0cvnXpc2tJw16dQM_pzuKi8siw5LSsCNQbWwLPz0jdlU_0
Message-ID: <CACRpkdahKt0gCfL_pyAMZW9rReJ+X8dyRk25hdvq6gf_QpBPzw@mail.gmail.com>
Subject: Re: [PATCH 11/18] gpio: adp5585: support gpi events
To: nuno.sa@analog.com
Cc: linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 3:19=E2=80=AFPM Nuno S=C3=A1 via B4 Relay
<devnull+nuno.sa.analog.com@kernel.org> wrote:

> From: Nuno S=C3=A1 <nuno.sa@analog.com>
>
> Add support for adding GPIs to the event FIFO. This is done by adding
> irq_chip support. Like this, one can use the input gpio_keys driver as a
> "frontend" device and input handler.
>
> As part of this change, we now implement .init_valid_mask() as we can't
> blindly consume all available pins as GPIOs (example: some pins can be
> used for forming a keymap matrix).
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

