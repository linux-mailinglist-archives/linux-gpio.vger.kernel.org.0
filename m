Return-Path: <linux-gpio+bounces-18815-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2E0A895BE
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 09:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD7D23AA7A1
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 07:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7296427466A;
	Tue, 15 Apr 2025 07:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OehvcAxG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716CA194C86
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 07:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703750; cv=none; b=Zad1KvFekFmLvXTadgrempR8wrGP2GYcgL3BeYeIdwh9BpOX4+MTemhuPWH1sdetzequn8O+RccJroxm5fr5Q/rm0Pl8C2Tip5ri2l0MPqqgYuoSRx7wnS48/KtbFpzvHKYGSjIM/EHCJYM5bs7xzBS6rdxDfA27Y+ndDBVN5Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703750; c=relaxed/simple;
	bh=YYqmdGWqTh2Zlj11kfwicGpoEMJ9HdJBcKGJ5TTeHcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lgVDuyZPgV8svMPCJUXri/gk+W5vFeYaZxctTCSFm+WqYSfKPTEVC8Jb2XYfSh6v+eTnAclMzENtg+pl96NLoR9o/DSc5+DZDdeJfKLIreX1ALFphY2XQbyGUiyntFc6dvmNdPXbrHRJS6bretydIIpXyswXetCGVdqAxMPYy9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OehvcAxG; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3106217268dso20908671fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 00:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744703746; x=1745308546; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYqmdGWqTh2Zlj11kfwicGpoEMJ9HdJBcKGJ5TTeHcY=;
        b=OehvcAxGfG/APACuiUEUyxhqQ6UleZ/jUX0OruoxDs7gEBe3rU+VoXsEn3BRUu5/ut
         S6mXG3yW/fw9oq8zaDGnF++ED1qilTOZg6bthZWF+94vVc4gtr+RuRsTTNZyTe1kzLFQ
         FHV3qN5PX7dzACEURE99CZAWgILEH0dkpOIPHW4xoiJy34HPvCWK8q258/RKNBhlg8ac
         jhKkLHUHsw9WQIivTdQ/e1mk/Vp4ZlA7aGHdh9n719CczqyzyxCxq48lCBNRqKwdoAFJ
         Fp5z0P+tUSSmHY1/6ozNbxbl+JL9QB8/mF2QSJLim8qdrAdTozm/uQUnKkYpoE4xCUzE
         hBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703746; x=1745308546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYqmdGWqTh2Zlj11kfwicGpoEMJ9HdJBcKGJ5TTeHcY=;
        b=OOIgHyAoqpF0gtRdKcab8x5g7uKXZAZwRF8UZNF5YyP7tqh29eanVtObOZEcpfKI04
         F03pBb2jqFqKnUobdejeiLF2ddSxMONjb8g+21WK+Ta4e6JaXtAaoune0Bui9PUSafsR
         /By6drC8k/XYMl7Fh+0LEtfpAASM6rLIriM3facI8NvjPy/FT7x9Np+j8eUtJjsUra+K
         7TcMF7RZsjjVF3wFhGnm87TaOjK69kpy2iyPHDFG7zofNNiJyZf8vHIQC8wRIhmoMLjE
         2+FNtXJCdXiKex+wbTjxiX3aSS8Zf1olMDw0ETBmMIFJvSetlZBr0W+h8KGnLgGNOQCL
         dmgA==
X-Forwarded-Encrypted: i=1; AJvYcCUBdNmCwY0o63RpNz0eizloeUJ8pxHQ7qBUJnp9xHxf4eJw3H6YxmY2XayUBVfblvArWo0keO1owlbY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2tGJ737oBrsz+0MEOH8wWJmu/tj5twXB5LbQrkT8wMi6RlrZP
	CvzuRX+ob9wX8u++TlryMsJPb+PrW098YSd4U5acJWEhmGU73DHVg17A7iAMYZkMIkOq33FthVs
	XmNjmVeKFJdr0SXc3I6e/INSBJGHyGLmm3Xh0LQ==
X-Gm-Gg: ASbGnctlfX5NuP6m8x/PiUKLnAuml31HPD7WeHYKO7T1/De2PPaMmWcMl24VhjmhyHV
	VhKdOdWfVvZ//LEQpbDPafBzTZ4srW7JjrjRUwDPMB/aHZtqAwC4tQOgkPI/20wreDElNBpOZys
	cAcBb0GLjFIppq8gM0qM7X1w==
X-Google-Smtp-Source: AGHT+IFs/nUVE9ZHpBsM9ISeqvfrNgJXQKoiGQRya625PualetasE53RPjloI8lyn4EgmyL5PlrCTCKXaoZAKNCtz2s=
X-Received: by 2002:a05:651c:146c:b0:306:10d6:28b0 with SMTP id
 38308e7fff4ca-310499b5baamr48649081fa.1.1744703746535; Tue, 15 Apr 2025
 00:55:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
 <20250401-gpio-todo-remove-nonexclusive-v2-2-7c1380797b0d@linaro.org>
In-Reply-To: <20250401-gpio-todo-remove-nonexclusive-v2-2-7c1380797b0d@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:55:35 +0200
X-Gm-Features: ATxdqUE321qDjf0iPOYzjELC5SbNbPWdhKHQ6bsHvDdXjB1_8CjTFcaqogQt9nM
Message-ID: <CACRpkdbV=n1BjiTni44BbNnLqPtE+oirX4wbmHcGvdhi_3Va6w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] gpio: deprecate devm_gpiod_unhinge()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 2:46=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This function was introduced as a workaround for an issue with resource
> ownership in the regulator subsystem. Rather than passing the ownership
> of a GPIO, we should make the regulator core be able to deal with
> resources it didn't request. Deprecate this function so that we don't
> get more users in the tree.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

