Return-Path: <linux-gpio+bounces-11462-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6DE9A122E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 20:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B01C71C2219A
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 18:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CC1165EE6;
	Wed, 16 Oct 2024 18:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UfDcwXoP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD72212F1B;
	Wed, 16 Oct 2024 18:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729105142; cv=none; b=KZfaFTd8SWH1sAWVj6QuvhEMn681gLsJmg1J9cUn/UGn0eNp5Tf2dbBXWVOLjpRgxuO01hJRFW4MJ79akfvXRRAso5NU4T3T2czWrHv30qnIKPeBOFuSBdnC6sgiCbRXtlNPI0NRfGbOUQAdSCKlzj0eWudPSxN9g185JSdg3y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729105142; c=relaxed/simple;
	bh=klf5SjuprcLqVDYIR3SMzCltGesvjuzkyvSQ88MHUYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KRoN3QLPfplDJQEqN4c6qMn3Gqb9T94Cr4Lcvl4OHAVTeucwYcqiB4uORvzifAc75ugXJVMoc1LllTn5YZ7r80FH9VPZ8eNS3xp9vwr3zU5DAtq6Q1cL6XIkhncA+cuUL1GUWEbE+G63OlxZaxxVvwrIjZVUhGkhpxeEYWmkICk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UfDcwXoP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961B8C4CEC5;
	Wed, 16 Oct 2024 18:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729105142;
	bh=klf5SjuprcLqVDYIR3SMzCltGesvjuzkyvSQ88MHUYg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UfDcwXoPWsklZh/BDdMMbYnXeqAJZEFEdJ/z/5P1if1TNXRMOzhzpyctenlv15dKX
	 RqR83GBbnxIcoU3CBGqUcgCmMbhEzCXZrEh9Y8WhxwUnm9lfmlQVnRbDz73aU0q+aR
	 1uJFx+2ieIFmLs9NtCkwM01vEHgqSqJdC1kWa591lVRAmXBI1zQ9V1zssAR90Tkr0i
	 plbJqbuLz2sSEga8AtuPF4SVaYLnLURgIx9v2j6gZmwvBIROLwQsXlIlO3GCyVgI9Z
	 hjT6XD64EEAlAqaenQLL4IjCdW8FI4cHXRwKJb2OEzxaXLhA5GQ8iPOmzMlbe9M/qr
	 1pAi8+0aDALwQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f8490856so172473e87.2;
        Wed, 16 Oct 2024 11:59:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZNh9d4g/IZLZzns8HxGXx+HqT/8o5IyG2OpKUg1NMSD8XgpTAmo9hPkoPIb9e610LRpEvvjy5FJJKKg==@vger.kernel.org, AJvYcCWYvU6YvY3NWR91l8rPLweC5UOaAQYvIGTORlFqajbGugstS2zj9tTA7cG1tP+dZYad9aMkXo1W4ljm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2z/pttRqm9XP84/8xvMFvaXIxldxbhQpt6zJzUIid/5hY+Fis
	Z1a+aelabkzbp9Z22p5IQCJhMwD5iUP5Zwv3WFjUwhpmHDSpqCzUTPdd83pbfkd5lipvFwRHx8e
	pgdbqcDzh3bspS1WfN6uKd04cgA==
X-Google-Smtp-Source: AGHT+IHtlrEgt0r69dpCrTPd3nuH/7CCHU8/e5JIabUE8kTKov8lwieVe9ZP3vdgA5WAyWa/vYh8tYuiRU31iFqhYSQ=
X-Received: by 2002:ac2:4e03:0:b0:536:553f:3ef9 with SMTP id
 2adb3069b0e04-539da4e0b9bmr9960301e87.27.1729105141006; Wed, 16 Oct 2024
 11:59:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016-gpio-ngpios-v1-0-f16cf154f715@linaro.org>
 <20241016-gpio-ngpios-v1-1-f16cf154f715@linaro.org> <CAL_JsqK-Nd6izk6RFf4NyoOCkobDwye+QPsRKHBDwovxO9NTDQ@mail.gmail.com>
 <CACRpkdYipbtgW1odod288fEV33SqoJo8vcN7=c+tSRUsR4dE6Q@mail.gmail.com>
In-Reply-To: <CACRpkdYipbtgW1odod288fEV33SqoJo8vcN7=c+tSRUsR4dE6Q@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 16 Oct 2024 13:58:47 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+5r3Ep7oSHtL=mKe-Vmmkkx7A7+Wk=Uzmbk+iGhwDMfg@mail.gmail.com>
Message-ID: <CAL_Jsq+5r3Ep7oSHtL=mKe-Vmmkkx7A7+Wk=Uzmbk+iGhwDMfg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio-mmio: Add ngpios property
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 1:32=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Wed, Oct 16, 2024 at 5:47=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> > On Wed, Oct 16, 2024 at 2:21=E2=80=AFAM Linus Walleij <linus.walleij@li=
naro.org> wrote:
> > >
> > > This adds the ngpios property to MMIO GPIO. We restrict the
> > > property to 1..63 since there is no point in 0 GPIO lines and
> > > we support up to 64bits wide registers for now.
> >
> > Why does it need to be restricted? Is something bad going to happen if
> > for some reason someone tries to control a non-existent GPIO?
>
> Unlikely. But the biggest inconvenience is that non-existing GPIO lines
> gets exposed to userspace which causes confusion. It's a bit like
> saying you have 32 harddisks on your system just because the register
> has 32 bits.

I would love to have 32 harddisks.

My analogy is we don't define how many interrupts an interrupt
controller has. That's generally either implicit or you just don't
need to know (other than validating used interrupt numbers). Of course
interrupts aren't exposed to userspace.

This property has shortcomings if you want to prevent exposing
non-existent GPIOs to userspace. You really need a mask because what
if GPIO0 doesn't exist?

> > If there
> > is, maybe there should be a specific compatible as the h/w is not so
> > generic.
>
> The gpio-mmio is quite generic, it's the most generic GPIO
> driver we have.
>
> The ngpios property is also generic, it is in:
> Documentation/devicetree/bindings/gpio/gpio.txt
> (commit aacaffd1d9a6f8e2c7369d83c21d41c3b53e2edc)
>
> At the time (2015) I just documented the already widespread use
> of this property.
>
> It is also reflected in several of the new yaml bindings, a git grep
> ngpios will show you.

Yes, I know. You can also find push back on using it.

Anyway, I did my push back and what's one more user (sigh), so:

Acked-by: Rob Herring (Arm) <robh@kernel.org>

