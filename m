Return-Path: <linux-gpio+bounces-5193-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4684189C87C
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 17:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCD051F22D09
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 15:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B261420B0;
	Mon,  8 Apr 2024 15:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2UZDhr5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8211411EF;
	Mon,  8 Apr 2024 15:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712590576; cv=none; b=hC7kZX1sFHtlMFpRCc+SKW6Xz/bRWhCvtQYZpSfhhKM7L/K6nXtBOvCU2oAEHpDA+qtaR5Z1ha5m0xlgAfczeURbdmDOuln/FcWx6M3lAq4hg8/xvOHuAejm0Ht7OV8Xt/g+QYeBNd7jdQSlNYLv2i5eAv/CDWSDKtFul9mBYhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712590576; c=relaxed/simple;
	bh=ElEBboZZmhHmo+fflG6/dLQkwXH+6/Jt3imK/vp90K0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ldwolADAo0QKK4SKMS6EgQPSgiVoqmrlLT2O/j6/qzS6//lb0NrEPNAPYCn2LOy2yNcmY0Gj+5jlD/fsIkJuHRxlcizMO/f1qCz4sWumH+b+Vmrd3nLcC6t5elNVTBOGlXTChNN570OBKTVP7cXG+gCGjzK1gfeLePY5HEEsbKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2UZDhr5; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a5199906493so440384866b.1;
        Mon, 08 Apr 2024 08:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712590573; x=1713195373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElEBboZZmhHmo+fflG6/dLQkwXH+6/Jt3imK/vp90K0=;
        b=k2UZDhr5+O7cPcFCTb3t1ZzHlYT5/XCnO3pAFI4RbrQ10aOGN2vIdO5jPT5Za7aoAf
         hrMj0ewrN+ZOQ5EaTAD/rxXRwgJ6P2TZnVtB6gAS4YpySxyOsjGci2Li2HUZRcOLmfMd
         uPJk+SO+jz6og6XuPsDI6G106wqJ9HJ+0UAXGlCBzWQpPmCVy8nO4+33+4p7qlLGZkwQ
         ppFSUEtKbZMNxwaVWlj1JIGQLaZUgK0GzoByYMMZODilZmDGuNsvRMFT8fDee2ODKBiO
         t5jxc/fF7BMrdX351KDxz+cqfeMmyRqt5W5qx/OYZ6L/gpWacUkHjUab1Z+Ew59on4jb
         u1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712590573; x=1713195373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElEBboZZmhHmo+fflG6/dLQkwXH+6/Jt3imK/vp90K0=;
        b=f5B0jfa3U/B3U4pqq1i5MFshNvmKdec0rP0Ldy8X6CBdBCntLImLbR1b02VEHv6u9l
         sjqZYEqFnu2Hffd64/p+znMp+aCoQJZqp64Lg2KEKRw9kE0Oc18LgBKhz7edCTUwrrPO
         3LY5iitHgRhihmOAXfMQlY+76rLl1aC09UHTLcSq/hKmcz9kre7YQ4oRB7iF34DNV/3Z
         ThBu/2W7kdAxytdeizkkXLgftO8lCMUd9FblGzmXUIkqs1PhzJQ1kskdZmxaElk+J7t8
         1GJqbBcHSMz95sQ++BkLbhH4jQ0q9NQfWjMw7eWD13pSCS/3rpuEKW/IDDjkDt4Gs2H8
         6RSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhra7sye9srUsXSUCcGvoBLoHM7ACqErXqRVqisWrQhaRkdo4J0SMRraIDu+z4UaJyOXQrXU7fj3lcqpYmMhoVPnt7oLMaSX5i2uLPXONBU3Yas7M4vGvXSml5e+Vk06Wk9BZstA==
X-Gm-Message-State: AOJu0Yz1zqUkHUDi370N5dTI1bq7jOrtEc789/XpQJPcJFjU0T5BGbOU
	qnFREyMqisVzFNVeWile20hcYCbn7mNBAyfgarARv99FW/11WdaYJLZp7yholP4QuWLoM0JO6UB
	WEI7hT0biL1rjhw2Yslu5jqn3iWw=
X-Google-Smtp-Source: AGHT+IFVf4lpZN05DBhUUba0o3Qn7pGE/745rbeti1y5rvdlMmYVqhhSf2HIdl3wBA8Ote60ZMibrzXmtZ9XY7qZkGk=
X-Received: by 2002:a17:907:9708:b0:a51:18cf:b776 with SMTP id
 jg8-20020a170907970800b00a5118cfb776mr8601571ejc.2.1712590572856; Mon, 08 Apr
 2024 08:36:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240407200453.40829-1-hdegoede@redhat.com> <ZhQL7KmvVYgRpz46@smile.fi.intel.com>
 <01494b5d-b7de-48b7-b68b-69a32da9fa5b@redhat.com>
In-Reply-To: <01494b5d-b7de-48b7-b68b-69a32da9fa5b@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 8 Apr 2024 18:35:36 +0300
Message-ID: <CAHp75VcVdvWux=3rxBjHisMhKC=69Ldhrn-eZiBgMgm0OHs23w@mail.gmail.com>
Subject: Re: [PATCH 1/6] mmc: core: Add mmc_gpiod_set_cd_config() function
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2024 at 6:27=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
> On 4/8/24 5:23 PM, Andy Shevchenko wrote:
> > On Sun, Apr 07, 2024 at 10:04:48PM +0200, Hans de Goede wrote:
> >> Some mmc host drivers may need to fixup a card-detection GPIO's config
> >> to e.g. enable the GPIO controllers builtin pull-up resistor on device=
s
> >> where the firmware description of the GPIO is broken (e.g. GpioInt wit=
h
> >> PullNone instead of PullUp in ACPI DSDT).
> >>
> >> Since this is the exception rather then the rule adding a config
> >> parameter to mmc_gpiod_request_cd() seems undesirable, so instead
> >> add a new mmc_gpiod_set_cd_config() function. This is simply a wrapper
> >> to call gpiod_set_config() on the card-detect GPIO acquired through
> >> mmc_gpiod_request_cd().
> >
> > FWIW,
> > Reviewed-by: Andy Shevchenko <andy@kernel.org>
>
> for just this patch or for the series ?

You have no cover-letter, your choice :-)
(yes, for the series, but really it's better to have a even small
cover letter, `b4` can use it for good in a few ways, although dunno
what MMC maintainers use)

> > assuming you considered addressing nit-picks.
>
> Ack will do.


--=20
With Best Regards,
Andy Shevchenko

