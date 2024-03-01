Return-Path: <linux-gpio+bounces-4049-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEE986EA23
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 21:15:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91CED289F01
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 20:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561C43C46C;
	Fri,  1 Mar 2024 20:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n0hhgXzx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C823C08F
	for <linux-gpio@vger.kernel.org>; Fri,  1 Mar 2024 20:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709324146; cv=none; b=p88ojlhYskUuV2VzcvmVm7G7puivi8iydLDYE2dLOJAj9JeTc07Qp1w5ht1XEeUkWzuoiByTXrI2v2z/YShKfW0+7DG94Z05EEOKxkuq97PulR2/Z//bhXvc4fh5YJfQ47HiOjGKZAdewiYokNBgzC3crdLl+1cwHLYxgiQLXG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709324146; c=relaxed/simple;
	bh=m/rG4i/FaFpZq2EPobCeet278rbB92a2rTRXgYLGseE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nLYchjgdxWEuk+GG62cEcP9+TxUGCzfQ3E51A5eQswjdC96ki3Pc8kXbVJ8nB58r1EkR1Qsom00AdXrWpvSxc02wUgpVFzIkjuqZg3uM4savYG8Y/KIL+rN8IS76wBbMGEMlbBLsk2JPX/QvF//2anOZb81HdqeE53zZnJpNLZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n0hhgXzx; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc742543119so2726647276.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 Mar 2024 12:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709324143; x=1709928943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/rG4i/FaFpZq2EPobCeet278rbB92a2rTRXgYLGseE=;
        b=n0hhgXzxAPedWBcLJ0y06BsJcEHZGv5TzG8KnQo+7i09T8CieKlFIeXknl0IhvENqM
         8dxLrDZFfC0OOfFNFHnf0Zqv+wyQ+GOWpBcKbmm2gMbNPUtecHNw7b0cmPmn8OB4oiru
         kv6bnlTbL1VqC83wOk6YHkwdvgOQsmQqC0U9No61Ul6XjiGRo4Hd7L3AMXvDDmrU+/u+
         gdzLIbNHpszXRGb5Y1m6vc2XZXTGX6Iew/JO5SIqE7vLJmAtwdX9uptBPdhaWNRCnZrR
         q3r0gHv9NaFs0JfhKDWVB4HKDoIaogpLlKQEd8MDkhXcN6HFS6yEULIPO7FBVW//GiA1
         /Law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709324143; x=1709928943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/rG4i/FaFpZq2EPobCeet278rbB92a2rTRXgYLGseE=;
        b=YBC6SeQzdvrUDHapaMGRvlkvCjmVJGsB94yIlre36lvOjnhJMl5EExQkIeT/L5o0/+
         fwEGNOAuMsbT48NFo6L5Cr38JvH1j96jSGE5KBKboZS5p3tpAwCs9UHFvk01tra1S6Hg
         C/GmwZ38LQ127VPTiNZtowTUbwFvWNuVkh5gHMZARCAhLIQSLHkbLCPEtbeKs1X2hWe5
         6Kq9gS88YjhW72iHr8gVpcvbzjf67o4zefLTxXk1EzEObDrhD/AGxOQGPyiYX3ip2jGk
         8dj54apptb3Yu6+xjbLpa3SRndIsxRJI4U5Va784gXdcw9uUu5OwcNh3O8V6MdPT1soP
         7t0A==
X-Forwarded-Encrypted: i=1; AJvYcCXMunPCCv7ZHLTocon4nEG0j3PYq8D6TdkT2y2NliqstXL+ueH4wkICjCxs6TNsMAdb4FqGeyc7N15MSnpVIoo3CQqfaxXPywaU4A==
X-Gm-Message-State: AOJu0YyzuT7GWKPEGxLBSlwpGXjuJevf0aRHFMzzR2oiKDe0BrTPvoEq
	++RZcCjALUoHQoF+6rboqPUQp9O6H1MGAdHp2dRhwLFfl29MsYoTkJzm0Jc5BLKmfWBu14rDdnJ
	DYULC9vbtYDP4i2TVvr/VTheTIJtAKHG3MntA7w==
X-Google-Smtp-Source: AGHT+IG7xr46LkkomUvd13YhesA+QshEvloZuL9OF2knlwFUBLnD9lZYmWTiDcSDAJW6K+Oivl24NNdr6iS/RAMQoSA=
X-Received: by 2002:a25:b47:0:b0:dc3:696f:167e with SMTP id
 68-20020a250b47000000b00dc3696f167emr2301713ybl.64.1709324143460; Fri, 01 Mar
 2024 12:15:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227113426.253232-1-herve.codina@bootlin.com>
 <CAMRc=MeSMTnPUYGyJir4fc=6=Gnw_MVP9wfEKMQ6Ck33FYCrRA@mail.gmail.com>
 <CACRpkdZbGUd-u3ZcmmK1POSEq8z9J1aDhbGPAbcR6guKuEpEFQ@mail.gmail.com> <CAMRc=MeqiYZv3ViHRKKUsXTqG5Pc8Ev2jUcN=A4VuX3RU7dDtw@mail.gmail.com>
In-Reply-To: <CAMRc=MeqiYZv3ViHRKKUsXTqG5Pc8Ev2jUcN=A4VuX3RU7dDtw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Mar 2024 21:15:32 +0100
Message-ID: <CACRpkdYWDzu+VMQOYO_Sh1NM2ei=VRC-0df4teAZjirfrTB67A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio-cdev: Release IRQ used by gpio-cdev on gpio
 chip removal
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Herve Codina <herve.codina@bootlin.com>, Kent Gibson <warthog618@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2024 at 8:21=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> Agreed and the big picture - just like with the reason behind the SRCU
> rework - is the fact that even static GPIO chips defined in ACPI or DT
> can be unbound. Unless you want to make the decision that we
> arbitrarily suppress_bind_attrs for all GPIO chips which I don't think
> you do.
>
> I have shown in the discussion under the previous iteration that a
> static GPIO chip defined in DT that is also marked as an
> interrupt-controller may have interrupts requested directly from its
> irq domain bypassing the .to_irq() callback. As long as this GPIO chip
> may be unbound (and we do not restrict this) it means the splat
> mentioned here can be triggered from user-space with a simple rmmod
> because a requested irq does not increase the module reference count
> nor do device links seem to work for interrupts not associated with a
> struct device explicitly.
>
> I DO want to fix it, don't get me wrong. I don't want to just leave it
> like this, especially since we've made so much progress with
> hotpluggability recently. I just don't believe this is the right fix,
> I will try to come up with a solution that addresses the issue
> globally.

OK I trust you to come up with something better for sure!

With regards to the ability to unbind/rebind drivers from sysfs, true.
I have heard about that as a counterargument to many things.

The problem is that I have never heard about a user unbinding/binding
a driver from sysfs for anything but debugging a drivers ability to
bind/unbind. Partly I feel that thing should just be moved
to debugfs given the usecase and because it just looks like a way for
attackers to provoke crashes given how some drivers look.

Yours,
Linus Walleij

