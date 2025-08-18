Return-Path: <linux-gpio+bounces-24505-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 943C8B2ACDF
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 17:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B0401B25FD0
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 15:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D071125CC73;
	Mon, 18 Aug 2025 15:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cVj9yUO3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1AA25BEE7
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 15:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755531149; cv=none; b=snU4mJCg4MgcqI9VZf+pLN4Sv7dkf1nuMPHjYzf/ArEHQmuWPmr7BGikFxhO+/47Zeur2SAdt/84fntQpGlRw7/sab3Mqxf/qnnHnNNc82UnH2TJeh/COcJF9aNvgWTHGc+EOnQiYUWSNZ1AXdq3pPGmQvRKx1K6BnwPHfnBeFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755531149; c=relaxed/simple;
	bh=icHVjjRqRhE4oRabHZs6Zl5XfsDtmtpgy2tt3jycgLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENOwpkfy5B36Ur9tAkxPIjOE/X/NweO3La+HRtyDMIVBgdkFszjYrzXRAW7o+9U33cEtKyJ7hE8JxOqgMrfEQ0jFid6ziZhi4XqZBLdXehA/tPjxTOAqzVJrNpGYxlnHz7daJ2G5+/s4VOpy67vaSUrV5z/ys7Ny7cbV7avot64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cVj9yUO3; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55cdfcc0ceaso4747376e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 08:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755531146; x=1756135946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icHVjjRqRhE4oRabHZs6Zl5XfsDtmtpgy2tt3jycgLc=;
        b=cVj9yUO3/YBoYVQlOI/0T9GXa74iZCsKgxi5pjY6xptA17iKOYJuA1F4fAMZsCln4j
         DyEhag0TlpExgZOh+hTcNlNPuUQVwC+fFGu/UsYy/SIZjLM4uu5EFqMJ9HrEHAlk7Z+I
         KDJ6ofGtsPCpFWYxuX0EofVIv7samzfy9Nnamlw9AtCilekIyBbXh9SHZsTTyOoE5nuT
         0fi7QFIw+Y5BmESCSkpqVmrx4rTEi1g0bcLdbTLdgSIhnJFV1yS+yRE7mbTV/mc+xjxp
         0bTg9bDP+fUGMzfeInRUKhHeY58lWnOlkkBLTpRaF1ZtwvmjRJBI3M7wDQzJkxeuir6b
         dKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755531146; x=1756135946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icHVjjRqRhE4oRabHZs6Zl5XfsDtmtpgy2tt3jycgLc=;
        b=We3akVYtMLcmMDppICfRIsj0h5GSJn0x427h50XRO0SfEwBRPygn0AW8pv5OzwSMma
         yERurQ/ZqER3XqDlBRLzBaBsA3+M0RfHB5bZUDAdFEZhvOjArcn6VKGYGAlRY4hVVk6L
         0t27u383ZYd4wsLFKpfH/siRPi/oSET49bEYW2+bfheHI5MgespQirgu3W8nqWMWIDwP
         x2pG5R5E4JltqSStbL8w8VjShJD4ejnl/vXW4cVZGZhGJ2K6/Q5s4LYYA9uVfXTI+bu6
         DIOf/47zrN1L0Av5V4hDWXta6bsMkEzYg+FgLRLaXQykH75jwfOye0Nl0U1Axe9ZyEW5
         9NGg==
X-Forwarded-Encrypted: i=1; AJvYcCVlptRdkJdGiAZwozuZL8eJeztgH0Qn1g9J9A+uwsm/5PDx2BLX9kD8cEivZ45hzCv3kY6FvpLT2tt9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn4ut3e5xhG2WhInt2yZsR2rSLLaDSfLlsI5QEMHuAwvXjl3tx
	9JIa8Cid62XoeVOgdvgcms/BOoj3V3BFP/OGXmjZzyNd/nl7CuLBL/YbppW3vSuhcXaXf5pQRf1
	tiboog7UatcKKkje1RAZJaEu59zcfweZtfuxkIgdeurwepLyrhBchqpE=
X-Gm-Gg: ASbGncsKb9mwp1adnFrxUTqzpPsXjxKQI9yiTBLGuSO908ibJi1Mlk3O4OaAkHpVL2T
	x1DVC8jHb7aFUIzQFfVu6qqKyxcZ43syOhH8A9CPqmqwVSqV5FcJ2z+xdVhmMjwumNtdxyz7Wk2
	tmuAVePUF7eeM3LxRqr8zQNC5zAcs49dByGEH+Ot46oWAjDqkGOtHF7eUvnzQNsUn/4P45f3pQL
	TzASsBOUC4M
X-Google-Smtp-Source: AGHT+IF2orySIXmfTMPdBSc4u2RQ20PPwC0pgvdtHB2BTHUvv++2TxJJ8Foeb7eufqZD9BSVyHFIxOKmcreERDkEtzg=
X-Received: by 2002:a05:651c:2c6:b0:335:2d26:1408 with SMTP id
 38308e7fff4ca-3352d261634mr832931fa.21.1755531145800; Mon, 18 Aug 2025
 08:32:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813081139.93201-1-christian.bruel@foss.st.com>
In-Reply-To: <20250813081139.93201-1-christian.bruel@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 17:32:14 +0200
X-Gm-Features: Ac12FXx0vB3mITr0yHkMZRFX2ygTlke86KCizQFy_D1MbML6oINtiohhGdzjiEU
Message-ID: <CACRpkdZGaMf1m9UK7ai3KLJBSJtWJagzMMa6icMxEL04w7fkMA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Add pinctrl_pm_select_init_state helper function
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: corbet@lwn.net, bhelgaas@google.com, mani@kernel.org, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 10:13=E2=80=AFAM Christian Bruel
<christian.bruel@foss.st.com> wrote:

> Some platforms need to set the pinctrl to an initial state during
> pm_resume, just like during probe. To achieve this, the missing function
> pinctrl_pm_select_init_state() is added to the list of already existing
> pinctrl PM helper functions.
>
> This allows a driver to use the pinctrl init and default states in the
> pm_runtime platform resume handlers, just as in probe.
>
> Additionally the missing documentation describing these pinctrl standard
> states used during probe has been added.
>
> This fixes a build issue for the STM32MP25 PCIe staged in the pcie tree,
> id 5a972a01e24b

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Bj=C3=B6rn: Just apply this to the PCI tree.

Yours,
Linus Walleij

