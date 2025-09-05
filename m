Return-Path: <linux-gpio+bounces-25662-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB99B45314
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 11:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EF2E7A9872
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 09:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749FD27932D;
	Fri,  5 Sep 2025 09:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FvnOCCcZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F904D599
	for <linux-gpio@vger.kernel.org>; Fri,  5 Sep 2025 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757064270; cv=none; b=RLw9EX4iZ3lnWAdK77YHzMHWTPF0dQf5N19wPTFKyMol6HGp+jL2s+1/nlZu3erS2xIVSMgBjw5NRqMyI5F2SpDU1umSwp6vLfDi8jyVSnsTyPwn+YHEuEZNGoUj7h2ybZbS0JSPI/2iJxPWZqRsgkQobbix1LcWkWaa1AzgS1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757064270; c=relaxed/simple;
	bh=cYCiiH3gm9SqbiIxuEfhcs8IFMHPpd2Rxvg3pb29fjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=baYHCBZjrqqdkkAP5CWJ5yHDb0NLBOGKjMIFWOfHua5UWpstoONnbzUAGAjQ7eISgu6FXtczKq5LJRVNKgrzgu19fc4QrqUfJuY1lbc+UvF0RNEXxYA8vhVLDdLbhRRuWBOkIwL4bKDAmBW3jIe4EvNIiq1Ao063palngH21ayA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FvnOCCcZ; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-336dc57f3f2so18881361fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 05 Sep 2025 02:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757064266; x=1757669066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4iBW7toaydLQ7imUc/GfTyAbD/CCBjwzlb8LKJDuO8=;
        b=FvnOCCcZCYVKlWtrCmrQwyHS+BxFOSch5CoDMvesZzbD7K7PjemItF/j3pCcd2pJhe
         42DIn25za9146IAUKAvk0VaL+kfurESR6UuBwAIVfjAFF6Jr4bF2b9aejvf/D839qP2G
         mDTaNRUd+hJoRZbq2sPGTh/rmpc4z/w2vVo9dcnQCCR3f9NmpYW9z+777yCi0UTtGe72
         mNd3VtcGIsTyGO3uXMoOCRG0r/EqUA2fSeTGXbBN696OKkjqHAWH4k80eDIxiQnIETbt
         VkUQMPdENzgZWxjDs+cBbYQVczNgFI3tWMoUQlCCgJC8yGBJRqVCsYJNW3+xZwAuDaOP
         mp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757064266; x=1757669066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4iBW7toaydLQ7imUc/GfTyAbD/CCBjwzlb8LKJDuO8=;
        b=LLTrTnXVRPEquYXT8+AkeNKfyJ3+yujRZLQAbtO3OXoswzH1lfkK3dgl4GJY4GJh2P
         q29/uG2Zsl0rmGXfHkDDDfWh5RTsGzY/zY38exjnbdBaD4ssEKkCb8ALr6b70qGRjnum
         OR8Uba1EkUX//qWFzPll/VA0eUnIs1owLytCC997CHxhwQ6hN5UrSv9KUkXppiUOqjM8
         u676eQkEVtkBOXre4p40VgA5C3qd91c/6qpdFM42m+uCUngaGaIg0rpVK65imD6bTodL
         kP9RMAn2+8pX5Y67c0uLB5W+QSfFuoqJOX9Y9UPqsDFkJWOGqnP5jASkgFtu1tnmZ7YF
         ufBw==
X-Forwarded-Encrypted: i=1; AJvYcCXxSTlsx+DpCSOp6XLv/Y6+/UawSZ1EGNlTcA1B9IJSSsKwEmuFc1FygyHzYuHORk+LSPwF2wW44WPZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwBGcx9aGGkfjpUm2r/CcGLbHbjSTKLKTvB1r0Rdt6s+zlWvz/l
	c7NcCGqq9IHhWUgOBMU5NkFLEkZvH73c66fHcZjCdrm0fJSMchX3uggVXqtV/LeCTFjfGqAbd6/
	SLwvRVHCgURzKCjN9c6CiHcMVI3TogeKiOEv+rk19LA==
X-Gm-Gg: ASbGncteHm9HQ79FoWdz+1JzqwF7BVEW1QaHUO9rzhXvJlV7eaCLuEbeOPI9ARarHJO
	zGVjnrfeZdcPz2+/929ndZf8n2dJ+0B2T6u08azuPYktyk2JuReAem179OCmhIoZKXAld5dpLlF
	cKnEi6CAik2iT9pfXYoLGNpk/z6UZ6hWcH8vTk0nEboshbQqTKOA/IAlJYxGdgTgDIWjw6wBMgL
	6QvmgpEuK7DrOJJkA==
X-Google-Smtp-Source: AGHT+IHf8M+zGLz7Z5SlYPw0WPpQqAm9QKyvMQ2dhbv1sQOwJcfYvYdYRxdgHr8ORJ09bjn8JpTeTz4W49oHRu491HM=
X-Received: by 2002:a05:651c:4183:b0:336:95e1:9583 with SMTP id
 38308e7fff4ca-336cab04db0mr57663561fa.21.1757064266436; Fri, 05 Sep 2025
 02:24:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1753039612.git.dan.carpenter@linaro.org>
 <6f732f53-7e00-4f0d-82a3-480bc81497bd@sabinyo.mountain> <CACRpkdZ9EHoHiKit+T-ur0xDKMEoN_=TydzTfoggNBQGdra2bQ@mail.gmail.com>
 <CACRpkdY3_ifPsQOTqa2e-kHR24Khy0axrZ=K+vO4OJB+FjdB2A@mail.gmail.com>
In-Reply-To: <CACRpkdY3_ifPsQOTqa2e-kHR24Khy0axrZ=K+vO4OJB+FjdB2A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 5 Sep 2025 11:24:14 +0200
X-Gm-Features: Ac12FXxefXSGz6SnyspKuWNLPpG5rs79kfLCyyMTukP-5craFHKIm7xv9A9F5nI
Message-ID: <CACRpkdaJNK4+Viv+kdZUSXH6r6jRfGt0KixsTuRTP56qwQccYA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 4/7] pinctrl-scmi: add PIN_CONFIG_INPUT_VALUE
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, AKASHI Takahiro <takahiro.akashi@linaro.org>, 
	Michal Simek <michal.simek@amd.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 10:31=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Fri, Sep 5, 2025 at 10:27=E2=80=AFAM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> > On Sun, Jul 20, 2025 at 9:39=E2=80=AFPM Dan Carpenter <dan.carpenter@li=
naro.org> wrote:
> >
> > > In SCMI the value of the pin is just another configuration option.  A=
dd
> > > this as an option in the pin_config_param enum and creating a mapping=
 to
> > > SCMI_PIN_INPUT_VALUE in pinctrl_scmi_map_pinconf_type()
> > >
> > > Since this is an RFC patch, I'm going to comment that I think the SCM=
I
> > > pinctrl driver misuses the PIN_CONFIG_OUTPUT enum.  It should be for
> > > enabling and disabling output on pins which can serve as both input a=
nd
> > > output.  Enabling it is supposed to write a 1 and disabling it is
> > > supposed to write a 0 but we use that side effect to write 1s and 0s.=
  I
> > > did't change this because it would break userspace but I'd like to ad=
d a
> > > PIN_CONFIG_OUTPUT_VALUE enum as well and use that in the GPIO driver.
> > > But in this patchset I just use PIN_CONFIG_OUTPUT.
> > >
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> >
> > I tweaked this patch around a bit and applied: removed the second comme=
nt
> > in the commit message and wrote the docs to be more generic since
> > in the future other things than SCMI might want to use this
> > config option.
>
> Then I thought about it some more. ...
>
> Isn't it more intuitive that we rewrite the curren PIN_CONFIG_OUTPUT_VALU=
E
> to just PIN_CONFIG_VALUE that can be used for both reading and
> writing binary low/high instead of having two different things like this?
>
> I will look over current users and maybe propose a patch.

I discovered that several in-tree drivers are already *reading* the
property PIN_CONFIG_OUTPUT_VALUE to get the logic level of
the line.

I sent a patch renaming this property to PIN_CONFIG_LEVEL so
it is clear that this can also be read, and you can drop this patch
and just read/write PIN_CONFIG_LEVEL instead for the GPIO
driver.

Yours,
Linus Walleij

