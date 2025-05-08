Return-Path: <linux-gpio+bounces-19805-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBAFAB04B9
	for <lists+linux-gpio@lfdr.de>; Thu,  8 May 2025 22:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ADFA1BA280C
	for <lists+linux-gpio@lfdr.de>; Thu,  8 May 2025 20:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E014728C01F;
	Thu,  8 May 2025 20:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JVAD62Em"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA70228BA82
	for <linux-gpio@vger.kernel.org>; Thu,  8 May 2025 20:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746736637; cv=none; b=sJhZPC++ZffbhY9dVVMLdDvVebyR5MGAJK939nXf3PSCVGOq2gjodmSR2qJCIi17WA3F7WLVKkbeW06EwwDKAODyR8pHE9mNj5Cy/CRQ+qTvhs+D0sFnk7DxcZErfLZtIiTcFlJCo2d7TmOyJ288OHpMx5GlPzHADCI/hui1/4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746736637; c=relaxed/simple;
	bh=A5FEGp8r+5od+JlaprBQcT/Ywrc2ivb4zcsH9pA1f9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tv3k407J0ks0Fl3gBhsDT+N433WUGKOC3MMt1A7aFBmquKfTdWUipREz6nuginOwhnJroTKbSVIdItYyBoEFPeE/nkzZpqmConx7YSosczQWVwW7oukBg2nhrEyJp0GPLY9aWdckxmI/i2fhkryyJ0/12UO1hWBFVeuJ12VssSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JVAD62Em; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30de488cf81so13046291fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 May 2025 13:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746736634; x=1747341434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5FEGp8r+5od+JlaprBQcT/Ywrc2ivb4zcsH9pA1f9I=;
        b=JVAD62EmfLHsumDHR0bQxa0np9QDUeruNBACU35Qk/clh1cAeTAxmP9NjOSLEuVxXN
         0CVYCfGxNcbUYy1Ujev3hCnkwdiUcRMrQIh4G/N/pxOu1keQFTsaxRKidBXpZObj/lqO
         l3uIuR5klgbhXGwVVUS0vXSD+fQ5LLl1E5283iLO7pT02kuzDQbUmcC9WbQvofe8JW4n
         JHmE6AaqL7PjEBlK//liGKS1Gwrlx0nTeYlSC5BO5jQ9ObZsOohwHcititi/Hirt8JOW
         2aN5H3a8rHQgch6VMhnJbvcN5oLQ3atUSoLI6+cZ7y74wX3zv3SAV7ntkt2gBGgSQxdc
         UGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746736634; x=1747341434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5FEGp8r+5od+JlaprBQcT/Ywrc2ivb4zcsH9pA1f9I=;
        b=VnEv0K3nBKQ1O5ufR8cfoRgk9DgX/1Axi522t3adkQ7ZxazgVSksnXKhgs7DCa2hiW
         550XufN1zOcOAdSKcyUtpCH0/1YZnEmCCUwcIOxgXEcX9nVk67P22al+J6G43Sw4Rbt0
         P2JOmkz5ecJdg50K6AcyRssBkbLmqDN0ZecH25J2voavtvS8UJcxljbaxXfwN8BkE90x
         9z1FkyLJHH9cpMMri92Mu8/wsrNeCLOmd7pWybbKqBmNZQQIO/OF/4A6dwxL9zsM3Y+L
         4DpTJMvnK20KWoxlxhjdxVRpY2Cr/26QRtpFyBPeOsNVr6F730Jt4EqsFIzChjcbT1+1
         dL8w==
X-Forwarded-Encrypted: i=1; AJvYcCWhuOta5hGRYV1n7YvKunrw2Ow4kN7csGj7LY4crhPN8K8Z3LgwsFogQSCOSGRGuyamxJP+UhJtFwXq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2yhk13E4DZKj+Fi6pTlBpyZeZuQjZ3LA9WpPEmV2nNk4LsEf/
	jlR3mdnYBpkpy/HS5Hg/IqodN64bWhoWh1MDH+qRJ/Ht+xL4YHJ7l55xjziJ3Ycf7k4n6f+zUja
	dN5Icexg59lMrFmtZ7sLA4ftzZG+fFaiOQDsEzQ==
X-Gm-Gg: ASbGncuZWll9uaSdtokVQ7UhHV/CZZ4uBQe5cBu9WtTdQ/9uds04rCn7REr64mmNpCr
	r95sy7yiITA8PmH3cbxKLA1WhS+ttYZwCp+gBaM5igRL0MNhzvJy0XlkTI/2/LyOCXEV51T0E2K
	rsGY+NNe75uvHtGgPkeXDw6A==
X-Google-Smtp-Source: AGHT+IGVs8OBs3YrTtONe3XV7US68XWWpLWC5HM5bRwwTzVW+hZBYesbymsxYB94plP/2lMdY5IxGudKdxOVmw3MRXA=
X-Received: by 2002:a05:651c:885:b0:30d:e104:d64a with SMTP id
 38308e7fff4ca-326c46b2b7bmr4152421fa.38.1746736633880; Thu, 08 May 2025
 13:37:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502100841.113091-1-brgl@bgdev.pl>
In-Reply-To: <20250502100841.113091-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 May 2025 22:37:02 +0200
X-Gm-Features: ATxdqUGIytDrG-RZcZQg2XJ82RlylEF1rDHHrGyUvjJm9IxmZt1ZkIxiitbTU0Y
Message-ID: <CACRpkdZ+K8gw_L3TT=UmSEYo7fA2feYkaP-YAf5QaOrWywHu2Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: at91: drop unneeded dependency on OF_GPIO
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>, 
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 12:09=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This driver does not use any symbols from gpiolib-of.c. There's no
> reason for it to select OF_GPIO directly. This addresses a kismet issue
> reported by the build bot.
>
> Fixes: 8e86af65f39d ("pinctrl: at91: allow building the module with COMPI=
LE_TEST=3Dy")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505010447.kUlI61vt-lkp@i=
ntel.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied and pushed out, sorry for the delay!

Yours,
Linus Walleij

