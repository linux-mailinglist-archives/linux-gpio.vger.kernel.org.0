Return-Path: <linux-gpio+bounces-11209-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F8699AC9E
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 21:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72669B23D82
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 19:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6E51CF7C8;
	Fri, 11 Oct 2024 19:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eKYCAS/z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D10D1CF5DF
	for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 19:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728674906; cv=none; b=ss0gcn9xXiNorrKovVsQh8gvCm8P1NYCIaBWNtGJYEIy4agS9B8eGHOLYkYBKoMY+6BiuQtgfT+NpWES4a7DylKPeq2bHctHdj3xVuejrlJXOaX+FGVKNnVBrg04a5q7lgbTt5Wck0/Fx4K5N4PfO7NwZaWxmXon703JlPTev1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728674906; c=relaxed/simple;
	bh=bCrM0ifBSlVXk6QQFecaM58N9s/5IKOpuSb72C4+e6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNnwr0WFfBlyCHBaHxDPZ3KE7pHEu/2O50joaSvXSBEfSE2SQ7zimXEm5Av0fehuOzN0Id5ZVnivvnyxG+gGhrUnld3SzwUSo6dXhcjTxFjo+dyDkiULEJzcoQlOlsyHWbwkHOlyDUnNedoRpkDyqSu0gPmn4m2n9sjc1TbfLKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eKYCAS/z; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fac9eaeafcso26793051fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 12:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728674903; x=1729279703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ib9PFYzvaqKheX8msfR0z/jz+7hM5FTJQOY9PaaT2U=;
        b=eKYCAS/zPP/DNP4X/TYDyaorgM4AZaaZpUZd4L2tGiTitNFjjCG+WaUQhUV4AnNlR4
         eYFc8sbeK/vLeJrti4B3sdBxY1KePFaBK3W5xD/axS/yvHqR7yP705fyT+mxpuHlv3Gi
         g3r32GphcKtWC+AUJ5kh+qXgsYUuhfgqnpgWLAmGvM0MjpqerTzrRWhFfDIOexO1i8hL
         uXfsz1PBn0tw76/MYqikGNHtIVIhW21vt9T4nF6TZl4qexxjsrI7zbeQ/LWlpLNzgGZ3
         x6ci16cWbC9/7C0yzuAX0ZQslnBOTCjSf9jBUYh/MPjKqYdtgpEk/p4peNXDdMa/tRjK
         Ymbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728674903; x=1729279703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ib9PFYzvaqKheX8msfR0z/jz+7hM5FTJQOY9PaaT2U=;
        b=I5Y3J24WQhLuzFtnOsHnQleyj4mtFuEj86kvHSp0ez6ek+T5oMwDwce/zcNsHhz0Qx
         exj1SZUO0tRbWW1tss9pue7bLWp6jxwIKWJ0Utl4u4tBQtMsWXiiACGij58wjl3sFyhj
         BpcRDMbbTbU5iEkAGGHW35QXIvMnn7fsdfpX+B3E1KQ3Z4SaMxM6K1tIJZRzTc0nMoTY
         nr1v3kikyrMjNwUzQV/4f4TIn/2G3qNJ0bTX8dyBaYXXnzi8irkDwngNSnhiffs+bidf
         /EOx7KWqY5DzlQfd6EIRSa4NroE72EcCxUIquxR+Vf6glolvlgF0klrFviM+9jnRa6qU
         q1kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhei2aGSbw7AncYFhOW08iyfoUMndu5Wkg0VuNxSJk1Kbg5ZFKmMIq/VmiE7oyn3SgdLAMn4Y+ydvS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/NoWfi0HsynlFhoWQpvkvBdjnk/KyWHy3hEc3qYiNYi/Eofr5
	nQ99QFoTlqgrtLgXMWJVXl87MPFJsbMfDlCy8BshP7OY5ksOaUKPFQrZqw5kdqrOkqVQYvWjIfe
	bW8wIXScaW61scPRxXcaSEr6Q9inS1UjExq3W3g==
X-Google-Smtp-Source: AGHT+IHlWWYZkL7hRcimo9K372QrNGbFn3mXFWV+V/AQ1PzC7xBBqLXpG6DkMtKk+v5931tSyYIzbc46u7Y3dONqlR0=
X-Received: by 2002:a05:651c:b0d:b0:2fa:e7f2:764b with SMTP id
 38308e7fff4ca-2fb3f2b0d19mr4483581fa.33.1728674902415; Fri, 11 Oct 2024
 12:28:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011144826.381104-1-emil.renner.berthing@canonical.com>
In-Reply-To: <20241011144826.381104-1-emil.renner.berthing@canonical.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 21:28:10 +0200
Message-ID: <CACRpkdayc=5ee_D-t_xpOe3hSNHKDYN63J_6WO0HECNUH36hrg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] pinctrl: th1520: Unbreak the driver
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 4:48=E2=80=AFPM Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:

> Here are 2 important fixes and a code improvement to the T-Head TH1520
> pinctrl driver that was either introduced or missed when Drew took over
> upstreaming it.
>
> It is based on Linus' pinctrl/for-next:
>
>   6dbd1577b7dc ("Merge branch 'devel' into for-next")

All patches applied!

Yours,
Linus Walleij

