Return-Path: <linux-gpio+bounces-18686-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E280EA85583
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 09:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6B434610C7
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 07:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C17C290BBC;
	Fri, 11 Apr 2025 07:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BvpBoU5v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF4B28CF4B
	for <linux-gpio@vger.kernel.org>; Fri, 11 Apr 2025 07:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744356738; cv=none; b=HZEKP8ExiLt2gXR3AzoTRTjOo6cM9rhcVO0D3Pgxce+gRxGuBrYDky1rbAT2ymBG6KC7CWvTFa1MSM5h8SsbdVUhPXKL62pyVL1WJYEoxb8MkN45i4BI6B3OvKFChxthBn8UdPQf2y+GOQsM9qzNAbvanicH4y/3yvCmojwNjr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744356738; c=relaxed/simple;
	bh=nBLGFemPJhZPnm3zpMpncC63dcrkmEqYhcBjdTuQiNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ghGuEZTfD5qlGOEyjDRVCGrqW0LxJtiDOOshhWV25XZlEcr4biY6kF09tYDxvntP12BqrZuqB0lbpIgWbV7ukWqbHI5BatW0sXuJFgIofYv7QBZuGOXsSFEUw3VKnm5Mc7STUR5vDR3RShftZ7W1oqOj19xciAnLEsXiTrjiDbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BvpBoU5v; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac41514a734so291200766b.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Apr 2025 00:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744356735; x=1744961535; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ed+fUKaNOLbtXMbyz8K/j4DnvFtec3sHru+VveqoiFw=;
        b=BvpBoU5v1MSqA8S2XBHNN3NDPrx707kcprBOgCeEjvEg6gG1iD2BUieakO39gAxF2c
         1qzDZah+aggrHoE5adDRuGtgrVmOixFsSgRmxpmdQOPU5V8r6i6itvKCriZKLF8dXHJP
         Hk3qetuIk9/k906chc1scWYY6wVw/Zjr4UQlzpHBUY9xDmHcF6tKnmse6utnbM6fPYXY
         ZF45ZvW4FohqCN7+UBivqBU+pte56JPTB9VMxBaoKPfYldOUxY0M9WKs1GSibJGsrRW0
         oy/XC0uuM66g3J9pTEMIwZ6By1VXumOVGyOXAlykA+Mk5qMLYSD6OMtFtPL4NX6vNkhB
         lytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744356735; x=1744961535;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ed+fUKaNOLbtXMbyz8K/j4DnvFtec3sHru+VveqoiFw=;
        b=ZDPHPVjCjxlsuACVx8Yah+RRxdPJMNpam49uLMlokfc5ydvBd9/gbtlOX+oSIrD93m
         ahvFtjJr33OPSGmRPZ8WNqUWjgfLwkYWM445HlOzE8e8nkJEf4p7YXJN4DQKAZHunLps
         sskS9HF9Eq4xbGuszDRCevNoh1d05+IfCgxTdMy7HsdTAN0K+7c/Venl180WHFN/fL90
         YMnUqIbg60/FUvdsMGHGb6CdgmGl41PwCjgdb7yprYhrEQ9tzBmLeMvsdR1uQJmea+SI
         m4rqvXTpUn43pJutLed7Wh6ueRcZ97dEITMFRVu16uISJDDpWk6VgjM1Gpk0jd5geNHT
         0gYw==
X-Forwarded-Encrypted: i=1; AJvYcCWvxiHA/cGKLH95rSECC8Ig5DPQQT2ZbHWXlu7vYb83oLtSC8kkoK+wfEVZ1o3H4EeBE4e9gZSF4Qsb@vger.kernel.org
X-Gm-Message-State: AOJu0YwMDCamaMHKhaigP7YKzKEP9dy+6JGDqF0z5sE56J7BDzlLVdjd
	X+5pWUj1vxRWdIRJJaDi+PovPOTIllPWqrr44YD+0PTpICMj6yilDnOV23eQHgi/RWo9RX0bcvx
	WiIMmJzXUmJnrulpXa9SiLxBgpK61tTLmh6vZCA==
X-Gm-Gg: ASbGnctA6bTgOc3njGbD+JG5FqcLonI/pLfROB7XPxwiIi5FarR2+LBlKvLbysob+PX
	iadOTjUFPttuxWvgXq6QBq+4sX3256rjI823D+aluasJenr4jR7ugxdgbv6xnX2IFoNtQ3BsBjz
	qsJMhE0HXpGxqsEbX0li3y9ic=
X-Google-Smtp-Source: AGHT+IGJuFDGAN7XAewJnqBmV1N2irS+7yh9kavWloYhVtqmwA091E2WFS8jmNhJ/A4JihLLILl7EMy9nnUTzK9Da3k=
X-Received: by 2002:a17:906:48c2:b0:aca:d4d0:a735 with SMTP id
 a640c23a62f3a-acad4d0b567mr106452166b.43.1744356734776; Fri, 11 Apr 2025
 00:32:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410-open-drain-source-tests-v1-1-a062d2280cc5@linaro.org> <20250411013358.GA47403@rigel>
In-Reply-To: <20250411013358.GA47403@rigel>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Fri, 11 Apr 2025 09:32:03 +0200
X-Gm-Features: ATxdqUHsBbLbClnm-95qJ-Dw1LHKffe0gtdvFLQhSYFo5_7aUdUu8d7fa-MxGg4
Message-ID: <CACMJSeutWkOe9LB3kj67OwPFCWpns5nmbaPosoWXVVe-+eBUiw@mail.gmail.com>
Subject: Re: [PATCH libgpiod] tests: uapi: add test-cases for open-drain and
 open-source emulation
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Apr 2025 at 03:34, Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Apr 10, 2025 at 11:17:47AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The kernel GPIO subsystem can emulate open-drain and open-source by not
> > actively driving the line for active and inactive output values
> > respectively. The kernel does it by setting the line to input in these
> > cases but this still must be reported as output to user-space. Add new
> > test-cases that verify this behavior.
> >
> > +     ret = gpiod_line_request_set_value(request, offset,
> > +                                        GPIOD_LINE_VALUE_ACTIVE);
> > +     g_assert_cmpint(ret, ==, 0);
> > +     gpiod_test_return_if_failed();
> > +
> > +     /*
> > +      * The open-drain emulation in the kernel will set the line's direction
> > +      * to input but NOT set FLAG_IS_OUT. Let's verify the direction is
> > +      * still reported as output.
> > +      */
>
> My understanding is that FLAG_IS_OUT is always set for output lines,
> even if the direction is set to input for the emulation.
>

Of course, it's a typo. It should have said: does NOT clear FLAG_IS_OUT.

Bartosz

