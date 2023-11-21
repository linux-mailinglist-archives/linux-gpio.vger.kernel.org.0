Return-Path: <linux-gpio+bounces-320-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DCA7F303C
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 15:05:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AE0CB21388
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 14:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A7554F92;
	Tue, 21 Nov 2023 14:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZJmT9gOA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E30A10F4
	for <linux-gpio@vger.kernel.org>; Tue, 21 Nov 2023 06:05:03 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3b2e72fe47fso3798385b6e.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Nov 2023 06:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700575502; x=1701180302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hM1fGgjWbLUVYfJox7KKq4VGQz3DwKBZwpsGUdNTzx4=;
        b=ZJmT9gOAxxPE/MEHCVdzxFJEvb59A7xTakUTIlpTTfTLu972/DMpsQ72O9tEIFzuJ4
         bvPnZGMYwgHNeOzs5QsqcWvR7l/8/bIu2dzUa4Jmuu6Ts8HuWXnlhRIB/PAL3ckLyD1L
         i12MaW5vEE2fLZtb90TGar0x7DHlsF4p9gQR/Isu5wm9s6uaWzTMSVQny7E67oUE3ldT
         ON36gghGcfL9NrNn9Ej7Qcbu00SV+cTnN30fjSJ9laueJchnl60LTzrHjASZmaaC+1x/
         KXwD+tkfTo3BoSyoBvd3H+7enrRq1dFjNI91EPlW4pRJoL+T9DQuWKb5fvdZ9hrcyyWj
         aNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700575502; x=1701180302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hM1fGgjWbLUVYfJox7KKq4VGQz3DwKBZwpsGUdNTzx4=;
        b=l5QWxMUrE3oFRC5Ov1+9+b/qKGHv0QZrkC1T6grYQg811tLCv/Z0CLZshuKrowJ/5R
         r4yFckyiQi7ZguBZLNGWDOhNvYYPkKuuE0nyq5ZCxdHnLyz+o6gIUaf4DuKzlVo5YPso
         ZdTSGvyA0zVHpQx+iismHevzn0HpOhYQfoAs2V2d12J2cFTF+Q5cBoLB21u8Q0TdYe20
         jGTP9Ur17hNjD/sggBvaMDkV1LGLalYsBYMnxS3aIu9Ncy6CuxBRHGB9Q4raLxYpjL81
         RtyKj53Y02ekLpDAGDBhoIlRWNj6pSt43+TQ0f50yi7QsudVxsudnw7vSsGEJDbYfe6e
         Lozg==
X-Gm-Message-State: AOJu0Yw2Ho9UlEYiIMLmW+r4VEtYdH4Ce+OLhpSXec460FFoUdXu0Ejq
	StC6fT2YKu99h8qhwB871gjSxOV18cpvHMrtC0dbIIxdoOg2ujPk
X-Google-Smtp-Source: AGHT+IF0KtB/P2ULvmfkD07gzAw16mFCrNL4aoZgR4W+FUa4Z0zR0E4Z36oiL9/mOPwWcuBBV1huJI+qGIk6ejmhCIk=
X-Received: by 2002:a05:6359:a17:b0:16d:bc1f:7b1f with SMTP id
 el23-20020a0563590a1700b0016dbc1f7b1fmr7102612rwb.18.1700575502399; Tue, 21
 Nov 2023 06:05:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231121-b4-libgpiod-sys-0-1-1-v1-1-87d53dec6252@linaro.org>
In-Reply-To: <20231121-b4-libgpiod-sys-0-1-1-v1-1-87d53dec6252@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Nov 2023 15:04:51 +0100
Message-ID: <CAMRc=McwQDy_yXpWzMtcF4_A-MaCisdHs9HJF_eJFVz5NKRSYA@mail.gmail.com>
Subject: Re: [PATCH libgpiod] bindings: rust: libgpiod-sys: new release
To: Erik Schilling <erik.schilling@linaro.org>
Cc: Linux-GPIO <linux-gpio@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 9:43=E2=80=AFAM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> During 86860fb ("bindings: rust: libgpiod: release 0.2.2"), I forgot that
> we also need a libgpiod-sys release in order to expose the new feature
> flag to raise the minimum libgpiod version.
>
> Changelog:
>
> 7552e5d (bindings: rust: expose v2.1 features as flag, 2023-11-06)
> bc91656 (bindings: rust: add wrapper.h to EXTRA_DIST, 2023-11-03)
> 2e6ee87 (bindings: rust: mention the libgpiod crate from libgpiod-sys, 20=
23-07-03)
> d04639d (bindings: rust: bump MSRV to 1.60, 2023-06-16)
> ebfed6c (bindings: rust: document build without install, 2023-06-12)
> bce8623 (bindings: rust: exclude Makefile.am from package, 2023-06-12)
> caabf53 (bindings: rust: add missing license and copyright boilerplate, 2=
023-06-13)
>
> Most changes only touch the build scripts or modify packaging details.
> Bumping the MSRV and introducing a new feature does not require a major
> bump.
>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---

Applied, thanks!

Bart

