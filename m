Return-Path: <linux-gpio+bounces-25198-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C60D1B3BC8A
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 15:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 411515845AD
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 13:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4E12F0690;
	Fri, 29 Aug 2025 13:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="o/H42RQ0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266582F28EA
	for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 13:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756474517; cv=none; b=LASXbXF2aqyYldDASUpusokorDK/8IQF6oZcN0Aiw9pOMm9S1EgBbE/jYFLY7Xovl0CBLFwDQcqnx33M47LMoV/C7IfwKF16fRkgSw1htymw5bLReQzFU2OC4Cc4iNZNuSFd7pWnXCkbyBzXq9dmviYWR7PDDtr86wGz/bO3aV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756474517; c=relaxed/simple;
	bh=MdEjQuuTVOakhQ3efvBMkwe4JuiDM4Zne0x//dRhJQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGdSFndzUQpINd0FjGPpN0/I06/zXqKYrLMMkV4fhOGO+hgeWCG6E+Cly71jgPFkdyBWeBlYUX8ZWPsU2VoVv5J5bzQxBYZMLsO2kOOJk2u7wOmONXsFMVhdbD2F7pph6fAFUs9J/W8ofRAhWyPihml8LV3QJRTT6IQ834rq1hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=o/H42RQ0; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afcb7a7bad8so291886566b.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 06:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1756474512; x=1757079312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdEjQuuTVOakhQ3efvBMkwe4JuiDM4Zne0x//dRhJQk=;
        b=o/H42RQ0wF8iv3FReFgSFY40Faq4Z92o+dbUqUY6ava8NaKmFsg46SXcBTQ4R/aCt4
         GyE/Y9mnYGYCBwKpnxvqbXumBQpLJ4ydns97yLcmu+5YHiV8GywDV1r0OHqCRRKjvpqg
         Kt+Q6Ac0YoOPthgiJT1akBbv9LLQ818MHAxyDRC6JX2S6nS3B9Uk8tiwc3BZ7KSYRAxh
         mHEZYTL/P/u2Gq4DGnP6DlsjOtTrSuao3RqhDhJAEn0N6VwsTSetd/QuBySgrhsNpuuR
         kH0wHU4GwlmFlXTATH+4ED9jSfGF6CZjMlPWZSIpNbqhrSqd25Mk5i2/1MY6GqwS6x8h
         xz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756474512; x=1757079312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdEjQuuTVOakhQ3efvBMkwe4JuiDM4Zne0x//dRhJQk=;
        b=D4LdE8osF7DZ6eDkHwql2uLa7VSZIdNxdePmHR6cY4aVcoqpwtrB38eRNuzql99y9d
         jvzUj2hIecFKLJAAhFHS+x7GdYUOX8MelNitFZQl49G8lAgaAsuz9boX4FPthmJrydEP
         AbVvVGaAaQgZl5LJUJqPVNYj8d++etb15Gj5M/IYqhZhWLeFwYN8ox53CK8iN7+UIIaB
         NWS1tezLbEC/wy/I/Cbe5q67cVWkYLDbqY8lSVC8O4TbiQgpsk/o8SSOpy9GERTI0v8F
         JnCpG13vOzWpTTE2RUHle+02UteChAS685KVi0UJ9Uh+upVaaz36jaq1u8AV3n2ekaWG
         agaw==
X-Forwarded-Encrypted: i=1; AJvYcCXCp8lZ0cb/ieDuCZslUYX2PnVLQaqv8VD2Ee04lkXBj0UpyneP5HGx+dpDRbxMH5QEdkEQhAWZSpUH@vger.kernel.org
X-Gm-Message-State: AOJu0YwA7PHxL8rUa2VeeNG+rQ60dqsXs96nZSRl3u3su7r/w5RjgYfO
	Toua3VcID1iQhME3zqt6y4qXktpnTUkgLWE3Tq9aq4ed2XVmBLNvCgVLwOSqYv7OcGbPefV4YGD
	iKOCAaVoYLr3hSvpzR9MSbx1KAnUhnCSSe7DTaezVYQ==
X-Gm-Gg: ASbGnctiLrMxzIw+iYzsqryDKYXng5uUb9PFZ5K/770BSHUY25Tcol3yWXj5/XcfCq5
	vinL0FfTsxBfFzokJjlMN19eZU8GlOGFSBwej5JTufym4KgbuTBe7J5mqntUyJsfXf0pgNzR1gy
	H8gA67uq6KwzAp0oho20gEKbRM5R36m9v2u/O2xxOW+wMSOD8XBNfUS55oPCnFagtP8Bf+g8jbJ
	FIN9VBGIJ9ztyaqXiXrIYg2w34R9EWsERPTl2c=
X-Google-Smtp-Source: AGHT+IEZKPtPBhBR/4/eFh+CXcXzXUKAFIaLAMIA51HRHiZxW6kXKyMLn5CUW+Iu4h/ZQuW3yQR+BqR4Tl79osBgkaI=
X-Received: by 2002:a17:907:72c9:b0:ae0:cc5f:88ef with SMTP id
 a640c23a62f3a-afe29048ce7mr2651803866b.32.1756474512264; Fri, 29 Aug 2025
 06:35:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMEGJJ06_3bgiWfPjQy3JRgtzq5vcr4FgR9JrzTFrGKOxTe52A@mail.gmail.com>
 <CAL_Jsq+_aYAM8V7UmhCP-74BRpwv_vfzHeFrWvxmc=TLT+7oQw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+_aYAM8V7UmhCP-74BRpwv_vfzHeFrWvxmc=TLT+7oQw@mail.gmail.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Fri, 29 Aug 2025 14:35:00 +0100
X-Gm-Features: Ac12FXxVTLCCOkFXwjZNf3DPBHgzyMbjJ6S3yJDP732pL8z-RYwoW9M-vqrYBoA
Message-ID: <CAMEGJJ1gOMhe3-+6UD=gzPOqCpbuXmA9aSpytJ66JbpJ9w3fvA@mail.gmail.com>
Subject: Re: pinctrl, probe order, and CONFIG_MODULES
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, 29 Aug 2025 at 14:25, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Aug 29, 2025 at 5:37=E2=80=AFAM Phil Elwell <phil@raspberrypi.com=
> wrote:
> >
> > Hi,
> >
> > A Raspberry Pi user recently asked us why I2C wasn't working in their
> > custom kernel build. The primary change they had made was to trim the
> > number of enabled drivers, make them all built-in, and to remove
> > CONFIG_MODULES=3Dy. The end result of this is that the pin muxing
> > required for I2C to work was not being applied, leaving the interface
> > talking to thin air.
> >
> > I eventually traced the failure back to this change:
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/drivers/pinctrl/devicetree.c?h=3Dnext-20250829&id=3Dd19c5e79d46efdf8930=
6be99f3c8824cf58e35f6
> > It introduces a requirement for CONFIG_MODULES to be enabled in order
> > to get an EPROBE_DEFER in the event that the pinctrl driver has not
> > yet been probed. Without CONFIG_MODULES, the pinctrl requirements are
> > waived. Removing the IS_ENABLED(CONFIG_MODULES) clause allows the
> > probing of the I2C driver to be deferred, fixing the user's problem.
> >
> > Is this requirement for supporting modules reasonable?
>
> That's not the requirement. If CONFIG_MODULES=3Dn, then we only defer
> probes until late_initcall because after that point no more drivers
> are going to load. If CONFIG_MODULES=3Dy, then deferring probe is based
> on a timeout which can be disabled.

Thanks for replying. I'm probably missing something here, but if the
pinctrl and I2C drivers are both regular platform drivers, what is to
stop the I2C driver being probed first?

Phil

