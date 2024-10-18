Return-Path: <linux-gpio+bounces-11620-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFD89A3D84
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 13:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B326B25C7C
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 11:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30FD19476;
	Fri, 18 Oct 2024 11:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u45hZqJo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E36F9F8
	for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 11:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729252195; cv=none; b=mCjTiomQ+lAEr2XZ4dUTT8kc07PmBoCMRg44yWUbDjB5rIF3gqzVOWpUokI7JrLizRnt6AWGR+CWmUi9gj+DqrSy4SE265kI64V87fCd40b3Z30fhNhvm/rZ8rno7iHl5jVeAzlW8SfjQ3Mfp5pWbg7+siwE6Te/oN/n2lmRfHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729252195; c=relaxed/simple;
	bh=x8264GlX4CVxen110AJuRI1evTFgL5Lnszek+ggi2+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNS7OYa2jYyT0iGrwLrZbrPz/TS12tPYB/XliEC7g23x6lgvuyosdhvw94D/cqW7dofOPj/Lge699dc10GkaizDJUA5wmm/9NJNoSF9GQT/J9+vzSo2qJnCxgu0Gtp4qFdBsSeEGRDw3Qf0AGP1i1ya0DLmxNBwzbaxoWk/VfPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u45hZqJo; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539fbbadf83so2662906e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 04:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729252192; x=1729856992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gruTW7IeagTi5sJeA9ebW1N47SmkEh16ZSSnf4PRDcU=;
        b=u45hZqJo/mnV07Hb+aM5xehgB19OmQZMeqjKnWsGvceBUC4haTGyvI70xgPNg6+XU3
         rwwtyqwKhPmfizJD1mT+oWN5WaIzqPpwOtJKT6SY3PC+OE8oi4CqPpNp5OoF5VtuZ+Fo
         VgoCEcTyfyxQYtTVcFGj2TyIVQKwVAqA45VEfG8r2qFJVNZ1Bay4fQvixqJpEn9JHf/G
         f/fZa6WC6/8KtEI8BoMl7jHVpAo9y3jVK3/76oua9MB+Lsxv5vIfD+kY9iIwnQNJrUoV
         CrRXqDM1FbqkNJqsHxUT7aKEmWB+8tVPHeuMM6KmMHRlbzps+KhleImFi3+qvg9OLS1Z
         Xg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729252192; x=1729856992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gruTW7IeagTi5sJeA9ebW1N47SmkEh16ZSSnf4PRDcU=;
        b=KC5Ee9WC4rC43eZtEFcLnIXnfwkBXq/FpmOoJxlItsuqn9N+/15iEDttXzl+raxeZU
         1tBeZrFDSJq/osogV55PLvuosN2BsI0Ujj1iMTLMgevBQTkI9JW3XtgNL4dkXyqKIxlL
         wKPqNv6A+2jUiFrDY83FuZhQNEp1L0FvJy2BgjTR/UINoeOYZtOsvOvv/3UAxSCJ6hEq
         14khzk9mFcLQRj4dDqr4Qf70Ert+L+B7qTptRcUGgUMqefcKZPwvKL6Q1QmouERZWoCI
         L239q+xtDatuOwj9LuSKyajPjK4vwtt00gm+fs4bkA91Y6bbM/Uk7yGmoDJunmczD0TO
         GNbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWwe3YRWDDhB0nIFYk26AwIp/VFrzlRw5OdJUKtAvOILcgS5tWywXVZI32yA53tixyLWwllrZO1h5l@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvzgje3Yer/znrEd9iTcCqHfWXS2HPcQPZ3vtqhRqh8e9g/SNr
	U4wJqBJh+WBntoyALL9FIgmtXW154xpjllic/tjIRpq/dT1Whw5KH4ed7vviCBjc7yuobWvZQvp
	D8Lc4pKGQEMtgFvkzXmUd05xxGZrO5rFjXdgQ+wyVDM6hCaNDH88=
X-Google-Smtp-Source: AGHT+IETWUqpU2b4hJOBO5m4uSTjDpaAKxv2uRGjcBCV9v7PRYsS1a3uFwxq8tX0amrHIGW5u3uHPP2Je/u50YZ6WYI=
X-Received: by 2002:a05:6512:1291:b0:539:f035:e158 with SMTP id
 2adb3069b0e04-53a15467874mr1363901e87.18.1729252192243; Fri, 18 Oct 2024
 04:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017-gpio-ngpios-v2-0-cecfdb38d40e@linaro.org> <ZxJGxXNl29i8d_fA@black.fi.intel.com>
In-Reply-To: <ZxJGxXNl29i8d_fA@black.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 18 Oct 2024 13:49:40 +0200
Message-ID: <CACRpkdafFs-p6ikk7cfSWc6=C=8J6Gh+oe4TagAJh0EypWg3Og@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: mmio: Support ngpios property
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 1:30=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:


> First one is why? What the *practical* issue you have? Can you elaborate
> on that?

Sure, there are these hardwares that probe directly from the
gpio-mmio driver:
Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
properties:
  compatible:
    enum:
      - brcm,bcm6345-gpio
      - ni,169445-nand-gpio
      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO contro=
ller


The practical issue is (similar to what was responded to Rob
in patch 2/2) that non-existing GPIOs will get exposed to userspace.

For patch 1/2 (adding the DT binding) it would be that without
ngpios we do not model the hardware properly.

The objection "it makes no harm to register GPIO lines
for all bits in the register" can likewise be raised to the
other 28 (if I count correctly) GPIO drivers that use this
property (git grep ngpios drivers/gpio) and I think the train left the
station long ago to object to the property in general, people
don't want to expose non-existing GPIOs to the GPIO
framework.

> Second one, is there any other way to avoid duplication of the code so
> we have one place of the property parsing?
>
> For the background I have to mention this commit:
> 55b2395e4e92 ("gpio: mmio: handle "ngpios" properly in bgpio_init()")

Oh well spotted! I completely missed the fact that we already
added ngpios parsing elsewhere in the driver.

Bartosz, can you please drop patch 2/2?

Patch 1/2 is needed however: it is just documenting the behaviour
that is already implemented.

Yours,
Linus Walleij

