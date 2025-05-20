Return-Path: <linux-gpio+bounces-20372-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9795ABE6B5
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 00:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E2BB7B424F
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 21:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD4121FF4B;
	Tue, 20 May 2025 22:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eGQInvxQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CCBA94F
	for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 22:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747778456; cv=none; b=fnycU1kzTAFcQWbgUNJTU827+NWyIE2HsVHDcHdDKptbU6NI9BaO/YrY+M8opa3doX70e9yzt+XrpsYJpUwZgrjGd2E7W452vNN03N2xQWzhBAK7YdKTAVLHDowVYEsSztSyIgPLSJHTbRLDJ+ik/SWxlEk/EZFMcBjjY8EpmuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747778456; c=relaxed/simple;
	bh=aesLXUD8kkfuC4JloYbEc/GKhln/5QM06KKNgtCf/ds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXaVFN7+Dlj4QgcEV1pu3mEpufFwpuwg+BEagBAFYDdvfSzapWdcVa5ZxjcKYeNSj5iYGrD5tCB/fkXk4QDKCfik5r2t8HwoyQedF69LdA15433H/+0BeIskoMgOfC1Gxdc6hodX5SQt5nORdiz2C+vRvoWHt+D2YgDRT94ZWxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eGQInvxQ; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32925727810so15701401fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 15:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747778453; x=1748383253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aesLXUD8kkfuC4JloYbEc/GKhln/5QM06KKNgtCf/ds=;
        b=eGQInvxQKSs+gUkpm2yg0xgBm9nMhukoGPCGzTRakA/R0mRFo+OHpNwEyDf2sFq+Ds
         zVNt7oBCcRCHsPvLggTj+cJ1ryLrtyQ8ASUSfBsLE7Zd9CXERyPXMq3VK2FaTUJ2Tqnm
         3TdHJh36RG+nMkORN5W8T+sP9WpWunAi5QpkDxFy2qU1GD5clii2CpohT19DgZKC7SHC
         4PWGBUymgtAHG/aM2Juxjhs4Y7wxdU23eZkedpvWijG5oGSgzp7SSnyT8/4dmrI7zfs+
         hBdBN0UvkW4h4S3TrimxF8XqVfu0PAF6+gfaVX3fMEdO+wmuI1caj0BXyQ9GF2j81ID1
         QDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747778453; x=1748383253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aesLXUD8kkfuC4JloYbEc/GKhln/5QM06KKNgtCf/ds=;
        b=JSDGQ/a5bAn/5x/rWwCRWjWCtYH+z0qqs6qECiyEkmul5B0Dtra6Uly1dgTv4qBWag
         mARpkQ0U1w1f306xxUi0yay8IWkHWI26oFy1xJONe1AiWlfyH++BU59iQreY5NmRqZ4N
         OAoImZszfStVnIb/dsoudD+4ss+4Qw+EJm/wPvM58po1QBMgG3Rcklvw42D75KA4njwe
         7dXE83zQjkoNmdwC/dT/C3dVnHQ8K4YxOS8wVF44rdM1oZeQRhQ+zzAcmIwQIxZT8Z+f
         XOnkRiFy5q8jbd1U0mvMmFLA/qLQ55IlkAAxw0242R0UYFXaAF9+BsADP6tZEiu/oSRq
         zH2w==
X-Forwarded-Encrypted: i=1; AJvYcCXzrblzIAt2rVMUMfZBgJHbMOU98BiCUDdZVF05Z//LxaxuRMbhe5ArHwlbtnIzm1ix/W9fgXOv+A5c@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo92vIwTyPNF795LH0J7B73XXDb5DRPrCyn1euSM92KxCunhpM
	Kx2VfS56GYc53l7TvpErHSF0nY3cr9pQI0sBa94wKR0y5TlqvKQrGfEWgQ2hhc/K4SB5Ppux3lu
	cNHFVYUuLdnUx30ij21y91uyAGuQLAN5g/4gIoiVDXg==
X-Gm-Gg: ASbGncu9mWPujAZ/mnxfCp9YfFutI0vfbVGQMa0TP7g9+y39FeSzjkJVriYd4+GynpG
	J6cO3YCSb8k/WDDns+czY6Yrg8NLsE0EkADOWSmiK1E5RQP03INZIJL4JTJ1uTc7XChtmBHBDE1
	8cLn7PbeBjKFD67N3UT7Ucxv+5iMpOKPZn
X-Google-Smtp-Source: AGHT+IFRaW2vDPoGKArEGCC85gqp/UqP4HhB8TBT8BAvg0ex5Yy8tSCcFqTUaGysfB97COhylbd9nsb75PXw2X6SrfU=
X-Received: by 2002:a2e:a98e:0:b0:30c:557:72b0 with SMTP id
 38308e7fff4ca-3280771da2amr55544521fa.14.1747778452945; Tue, 20 May 2025
 15:00:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org> <20250519-gpio-irq-kconfig-fixes-v1-3-fe6ba1c6116d@linaro.org>
In-Reply-To: <20250519-gpio-irq-kconfig-fixes-v1-3-fe6ba1c6116d@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 00:00:41 +0200
X-Gm-Features: AX0GCFuCqHZdJEQm0AkAirailI8wcv3Jij3NbSgeMGH1BEok7H84BTeN_mldAnk
Message-ID: <CACRpkdZjrjxPL_275PzFgcXgWo7TCNDYf39d6QkupW1L2=4zMw@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpiolib: remove unneeded #ifdef
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peng Fan <peng.fan@nxp.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 1:10=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We are already within another `#ifdef CONFIG_GPIOLIB_IRQCHIP` in
> gpiochip_to_irq() so there's no need for another guard. Remove it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

