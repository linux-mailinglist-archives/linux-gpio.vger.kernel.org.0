Return-Path: <linux-gpio+bounces-26173-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8731B57D0B
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 15:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86BDF1AA2123
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 13:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29719315D2E;
	Mon, 15 Sep 2025 13:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lKTYBij2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C2931282E
	for <linux-gpio@vger.kernel.org>; Mon, 15 Sep 2025 13:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757942866; cv=none; b=sSZoRtGO/48mo67k1zVU953BX2WCJIoHderHWFX6x0t+E2Cmtgtn5MWvVLW4rx/dSZ7a2yQxrNDovg4TvFEiTqepNV24GG8uMjYWb8bI7tRBphxbp8lYLF4gQ4HAS0NBrZ2oMx08YQiZRLndKUHH5+uHLPjs+uE3LjO52FtE/Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757942866; c=relaxed/simple;
	bh=1WwEFBivcQFPvdJ+vG/cDspUtw0KZYVXb0gEbIG01PM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HS0VpFLdrf0capbMl/BjLhtREAmtvwkWMSwfEP1mhImeChQcY50GYs3qe6LbMhIrlH9IXBPg1iyhX4ODRngN6Xn9MkZ9o/Mr4KQxSQtnxKFTV6mIK30iqImUm0zPFQ27kDdXRYOvExyImU/T8oNjnfkYWC2UsYjMuZW+7ns+8fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lKTYBij2; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-352671bef7fso25564771fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Sep 2025 06:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757942863; x=1758547663; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WwEFBivcQFPvdJ+vG/cDspUtw0KZYVXb0gEbIG01PM=;
        b=lKTYBij2O3pMpi2AcDXY+M40VeX45EF2CLelfgvchyufncj09bmPYm+614+btVpY3B
         y9TwHbcrGq5hIHWBtc90nB5gvMHxQKx66U0nm4bdbTSUWOKaHInkfLEfFZr3oub4kGoz
         VMmdorBtTzbuVMlIB8HNtrldIJFS7Y9XVZ/dRPB/N1u5SnVTToxDCdnPx8Jz0urkDell
         bgBbsICKedonDw4rtV20JWEpvBAMiph45oENUjAU9EW2CytvsdJDmURPR933Gj6+Dxzx
         hiNKe1+KnViMJypLfNO5bXypgJoFHetxMbl0UPwf4U9LJ86b1p4ca3TwQdtpBYJUU5qp
         jrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757942863; x=1758547663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WwEFBivcQFPvdJ+vG/cDspUtw0KZYVXb0gEbIG01PM=;
        b=pm6mQm4jaIgtVVCDnMRgx1w1Gj0gOphEN3TxtLKwPezi94ZS3gUE4+TNVxEg4IHaIa
         eaRlXICqroOOxTia4xcpenRBXR2nEqL71NuhuSwgxot2cU+pMIUB8qXEFwDON5cWCFIs
         2UZv4TmWLyUkeTu5fk/BaCprQwgB07bFTVIqq8IId5rCtUMMbRxTmdISOSD7lyCeTO3E
         hmSQ08xZZo2OOCDWyGAt1tvejqhcNu6qnKi0XscoPHGddsPG46td+B+K8x0QsDI+YYbi
         XZaUmLsMZJY9x2Euz2bghwx/1OV/2qvaiGkm1RkeqWXwyAZnAbiiWlnq4hShIKiZ0rq9
         zdSg==
X-Forwarded-Encrypted: i=1; AJvYcCWNW1680fZKmbALwVoQCUQrcwu/6UQGu2LXerQjHqgNFtymXt67TFcyQvrJz1QS83AGiS7W7rr/sx7a@vger.kernel.org
X-Gm-Message-State: AOJu0YwCLdXX4BAK3KFAZJ/aTn6vucOdZ62ydVTPJv3JWxlHMDzovw8r
	DTwg5S9vTE/Qjlml1fjsJkJqJBAMIomcztTyghlvbuIYqc97f17HqQ6mpicpGMPD7KHNrSxWgIc
	oZXsQ28Fvn73R+2zREnZXLYEoBR3cXq2TsJU9qQMBDQ==
X-Gm-Gg: ASbGncs3lKCOw0Synjl7liLnD+YcMlWwTj/O/9o1AMxTMSkCncPHODPeYtO0sMy/jtY
	U+LwVjoLV4um/zn22FZPnfXDSs/wHQgM2CiHnuFm1sZDgvaQxCPk5GYVeugxajNGt0qaKhXWYwU
	MwMo3Ql66kTJiYNQVEpTd8kGQr/lfL8HEOqpjUmgSLppz3SD4lz3SI6RMV0LBc6ACQ8YaWcm+on
	tG64/jIdZUttc8qjrfEHMToeKkJ
X-Google-Smtp-Source: AGHT+IFgfjmqMYnXOIaWipd/39zNflboRpCuHneAYznmUhdiyLjY2HbEympVHUYJ5CPB0u2c+tTL66iGf/QFYqj40GI=
X-Received: by 2002:a05:651c:40c1:b0:337:f40b:ceff with SMTP id
 38308e7fff4ca-34e2b95873cmr28261471fa.0.1757942863077; Mon, 15 Sep 2025
 06:27:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915091007.28438-1-brgl@bgdev.pl>
In-Reply-To: <20250915091007.28438-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 15 Sep 2025 15:27:31 +0200
X-Gm-Features: Ac12FXyYyzxwYwBXKfmLtOHF2Eq5B6VfMoLEYuKJNeHENi3UziVmtNkXhN3IsyU
Message-ID: <CACRpkdaBDoED+maFVbiENcOruCCtmRe=wDfkRtthuqqrQoY-FQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: nomadik: fix the debugfs helper stub
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 11:10=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Commit ddeb66d2cb10 ("gpio: nomadik: don't print out global GPIO numbers
> in debugfs callbacks") failed to also update the stub of the debugfs
> helper for !CONFIG_DEBUG_FS. Fix the resulting build failure.
>
> Fixes: ddeb66d2cb10 ("gpio: nomadik: don't print out global GPIO numbers =
in debugfs callbacks")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202509132232.12viPUPB-lkp@i=
ntel.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

