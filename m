Return-Path: <linux-gpio+bounces-11463-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ADE9A1257
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 21:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A28AC1C22227
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 19:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C543B213ECA;
	Wed, 16 Oct 2024 19:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WuRV52OG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23BB20FAA5
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 19:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729105949; cv=none; b=E4KGxMaT+WJ8JbjslW27P7DBEDGS0BQb2vTjoaZbWul1Mi0HxMkyr1DNVqqkPFiz7CmjkGvBUQZMy5adm1t+7NuUNrwqqoBbSwJtWtVK8DffDLxkjkp0sJZSbUTKolnEqHOJLokCEpMEOh56vJw7lHLi2iahkO0wbKpcWp8Boy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729105949; c=relaxed/simple;
	bh=Fz4288MkDMSFgYaP8b77Lu09kgyulAy8P2y7fn/s4nM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RnPLVkZ1ADzt4H6JNXaUQJjSacKyFAULsojhPyuRQXSQKPufQYAcAf4kpEB301okunci922HWJ8OF3ju8uYdwwSQEVR6wMEXF35SYekwef6+h+6Ko8ydU+YpOHM3FDu56xp3SY3JYnbC8wKbgnHtod+njMzy8w3T+7rjxamgNVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WuRV52OG; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so1965711fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 12:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729105946; x=1729710746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fz4288MkDMSFgYaP8b77Lu09kgyulAy8P2y7fn/s4nM=;
        b=WuRV52OGMNJHioawxa+0s5X7T3jNRTtHCQhmfVwjcjyOg0/4f6bhtFMCH/uI2IhUyU
         JEQ9EqO9iXY7h3B5dZkG9GekGduyl7Lnvf/pbNtjZN2wHevco1Ae5WCQov1SClYtC9N2
         0kTK7Yx6UDXNPFIqQ6Z53qdb6Vhtv3MLbwH86XAvgQBcG8q8qPRwfsQpgsoamx54NWdT
         83PkpeH7oZDG3iFEs0mZvVtzZcsimLP3Mcy4D8/7efRWKDiSthR25733AHkdN3/K7/vi
         QYzDoBDgMGJykNH88Kfhg+PI8CKwsQ1oPpAKhPeXWtaX8IvX5zcGT2fU08DKlVFPwt4K
         OC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729105946; x=1729710746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fz4288MkDMSFgYaP8b77Lu09kgyulAy8P2y7fn/s4nM=;
        b=TKAZObIpa0TVXjY9rGBUbKwZe+1L1UrsDU1zNgLTSs9uEwvYaMYo0peNSyfwTfyseI
         Wx3uLLDbc6MW6SEUlpAGeFPaJo9v+KFKPgxkKDkKjgsQiSyJFC3O9oOFnVqryZv7oXmZ
         SULWe/dxgN+xFb0WKryvAhINGO4seCQaHZQqofoR3QAPs0jeoJflODdwFyZFdZVASu59
         +0BpEoFp+R8hog+4Am3YNQg+s+hPkpmtBddnXEClpwVOh0NsAZ6hUgrF5bbAKeOTuKVx
         k4JEAtpEqJjHrpcynQZVzhVWZsD6hRSBuBWY5j/gnCqHSZof3kRjEiqTrJ7CgdhSJc4g
         lHpw==
X-Forwarded-Encrypted: i=1; AJvYcCX8+b63muPagT+5sgPzoOAh3+rPnJiG6Yg71ZrZCRo2/3JGEFmrzS7s3FLIKcZoSYJoADOweZQX9JlO@vger.kernel.org
X-Gm-Message-State: AOJu0YyHC3MwFkoIDH5qT7mLV+rtp1EKewpeZ4nozUFBnxx91wZiuB5n
	3sp9Gim4KGrBD3A8+cn+eIHNYbGDl5tbdDDFQ2P97ArmriBAzQCW9nocqikIfR+kMOVbpBAP8ad
	bgsLjCpaweoVi7F2r74wZp/KIzNHPm8EbBkq8hAUquhHpMfZI
X-Google-Smtp-Source: AGHT+IGx8jru7dhdlOa8TcMliZqBtrqf1YvklmDHRLLqRwEGUC9wxoKNXqw5uTj7MDTuGQxmPo5a+bJNerjtQx/dDUU=
X-Received: by 2002:a05:651c:2126:b0:2f7:4cf1:d6b1 with SMTP id
 38308e7fff4ca-2fb3f164ffdmr94210581fa.1.1729105945732; Wed, 16 Oct 2024
 12:12:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016-gpio-ngpios-v1-0-f16cf154f715@linaro.org>
 <20241016-gpio-ngpios-v1-1-f16cf154f715@linaro.org> <CAL_JsqK-Nd6izk6RFf4NyoOCkobDwye+QPsRKHBDwovxO9NTDQ@mail.gmail.com>
 <CACRpkdYipbtgW1odod288fEV33SqoJo8vcN7=c+tSRUsR4dE6Q@mail.gmail.com> <CAL_Jsq+5r3Ep7oSHtL=mKe-Vmmkkx7A7+Wk=Uzmbk+iGhwDMfg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+5r3Ep7oSHtL=mKe-Vmmkkx7A7+Wk=Uzmbk+iGhwDMfg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 21:12:14 +0200
Message-ID: <CACRpkdapSL-hLJpEm82=sfC+5EU+H_6Zs_BRD5UpF02wdduN1Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio-mmio: Add ngpios property
To: Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 8:59=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> This property has shortcomings if you want to prevent exposing
> non-existent GPIOs to userspace. You really need a mask because what
> if GPIO0 doesn't exist?

That does happen in $OS (DT hat on), a famous OS has
such sparse masks for GPIO chips. They have not become
DT bindings (yet). As it turns out they are mostly used for cases
where firmware/BIOS/secure world want to "steal" some GPIOs
out of the pool and as such has nothing to do with hardware
description.

It has been shown that in practice what HW engineers
do is line up as many IP instances they need and just truncate
the last one, rendering the upper bits unused. They are practical
and least effort-oriented people who have yet to be seen
doing something crazy like e.g. connect every second bit to
an actual pin.

> > It is also reflected in several of the new yaml bindings, a git grep
> > ngpios will show you.
>
> Yes, I know. You can also find push back on using it.
>
> Anyway, I did my push back and what's one more user (sigh), so:
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Thanks Rob, some push back is always good!

Yours,
Linus Walleij

