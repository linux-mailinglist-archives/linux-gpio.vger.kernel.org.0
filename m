Return-Path: <linux-gpio+bounces-16023-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5E6A35ECB
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 14:22:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55DAD164CD1
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 13:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8E2264A74;
	Fri, 14 Feb 2025 13:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdp7JUJG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D26522D786;
	Fri, 14 Feb 2025 13:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739539060; cv=none; b=bYuhse5u8u0km+L7lFhfKHlgWU49QaIO3L0w7AwXEgg6QGPyRIYXsZSzNlCczvgsHX2jlJt+xo87n9rcBt6ZMczlXEVpzY6nNL3V/gFtSK3AD9quWc3e9Whl3XLjVbwCm4yRD2cC1Ujq7nBetc/0W/tnzOvM2AkMQjiIYssTtRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739539060; c=relaxed/simple;
	bh=wcqxiM95B/GRrtyRxgWdk8ExdCoBWVIhCEM/dUh4wjs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lqWMxmmBc7VJQQzf9I8MT5tLS7H6GtgyBSdb/s5WYvogX/1/r4ZJJ+EC69HiW8B+L3KqlSthUUlHAL9saPbZcIRqDQMkmxYhofMo95IxgbLSeGM/EXyktxKxcX0mdNBF+jtwjCBhFG2iDxDPR8aj2a+jKUs0WJszGXva9lvE1qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdp7JUJG; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aba868c6e88so44522166b.2;
        Fri, 14 Feb 2025 05:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739539056; x=1740143856; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wcqxiM95B/GRrtyRxgWdk8ExdCoBWVIhCEM/dUh4wjs=;
        b=fdp7JUJG3tUTK4kyeUfzDZNO4O1s8s5aTjBZ/KsX6NpARFwRb6tV9DENEQX7XvaXk2
         1lXfNK0cv1AV9UGDd/+8SjZG7u8VWllmcqu5OMGNyvVZZ6yfJIKUT3SbEDVYsP6A86UR
         Ee0bthxoibop9FzElwH0fxhAHtwwTcMprXFngbuJfvOGdyM6wCZ5v1KnlQvf867xyGap
         ZqldtlQZrNchsHnjoBSFAJG504FSfFaKFJRrqRzUgkuaQjN97pBRUa5kysSnruS0x7Ov
         iND3nNuXTQ90jwg+UkNburpV4EDiHijVya7rQXNbNiKWL0Ys4dXI2xVvcDDBzuE5Efbu
         Gd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739539056; x=1740143856;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wcqxiM95B/GRrtyRxgWdk8ExdCoBWVIhCEM/dUh4wjs=;
        b=oGLQpc6QCDUBM3lm6UzNVu4Bjjws1wG9nrcQBBoGTSkw86FZRyRF/nHvM2LdXNZQSV
         YkU2MRL3eKnRjI0lM5GF1a5eGyrBS5phPMH6HqbLBbLYtf/cyshFjeSzog3UDT7C2Xhs
         g2i1UChvyqQAApPji2vrlM4MS2QSTlnU9JolUJM283A1p3YnDFZoJcn2rt5HnHYi0fdZ
         oeyKhx3HJS8Lqj/LkcRoeTktNrAOIPdgboFvX7fAiRzLXQnmczt5hU5grDTR3Q4x9p5b
         NlWUhKTYKSy11qv0S3ARcDE6enQ9n6ZKqoZc3Aq4fOkdPCLIzVBffc1pnku3WH8+eyM2
         k6/g==
X-Forwarded-Encrypted: i=1; AJvYcCVgTFeF/phES8I9AkgE+xjS10IfswyY43JKbFT6N9dOBADPiYaKokQkY5Ka0cg0IyrbrllMPvMlL/iCJg==@vger.kernel.org, AJvYcCW1fcXbq3zU/jgOqpCwUXnGGeLdEj1Xdq43n7wkgumwNYCNt563VfwzAzjI29tGjkP6h9NFS02URzD5@vger.kernel.org, AJvYcCWwA43X1iUm85Hy6EQ9yh7+weS7s9sP3VOWyx/PDgFqifZaL6GsI5BjW78K7Nwz7i6rh9usRtA4s0OOKx1m@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/ikD7vbNVAGtm8v8kHM0kq6eTwEj020iVdz7DBgkvPAzNDAr2
	afZmox7lL8WhIAe+W+4KiUmG3lwFp8NnK20qTlYFo1v9RQLPeKTE
X-Gm-Gg: ASbGnctUOcY2nO7/B1BiFXisdJb5Q6D8nTZ6lT5+RmRBxxIXG11tiQeZwJzWfZ6734H
	9EAdosijr26bnKi7bAIoKDnDFiGKrePCk6VVmCFYBa08yDeFbEXpwor5vgFfYEtwGxK6LssDdsF
	IMlo7W64zQu6LAOd1Q2kGWkaq7H/8DsQu8YaGaew1aCF/a90sJHncOHais5GzAj//AL5Oh/e/kP
	Is+zrDkU5pyhUQ6Fn0SdSp5K6NF3xiI+QU1pVkDyYLi24Ni/nr8CJ6IzHlG+7C5i9lR5Vax3yF0
	lUGPzgxOgpyGvQUo7UUyo+MiIGqtO5WRAnvM+rrMQMlkgOr5ETfBwbMKoSdFu+E=
X-Google-Smtp-Source: AGHT+IFkvgOCYEe2YEKX6fQB+Duy9AyngG8MXNBsW3u+f4FhwqOoMxXk/TbrrlrRxG+W16dPW4DKCQ==
X-Received: by 2002:a17:907:cf8a:b0:ab7:b878:e8bc with SMTP id a640c23a62f3a-ab7f387457fmr1212167466b.38.1739539056345;
        Fri, 14 Feb 2025 05:17:36 -0800 (PST)
Received: from ?IPv6:2001:818:ea8e:7f00:2575:914:eedd:620e? ([2001:818:ea8e:7f00:2575:914:eedd:620e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53231f5bsm339050466b.7.2025.02.14.05.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 05:17:35 -0800 (PST)
Message-ID: <880631da17a6d8ed4afe5a8c453fd4f7d0e4fca5.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: gpio-adg1414: New driver
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Kim Seer Paller
	 <kimseer.paller@analog.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 14 Feb 2025 13:17:38 +0000
In-Reply-To: <CACRpkdZR8X17Bn-i2anqjxf0Gk60V175F7Xfwytkhy7_K+LsSA@mail.gmail.com>
References: <20250213-for_upstream-v2-0-ec4eff3b3cd5@analog.com>
	 <20250213-for_upstream-v2-2-ec4eff3b3cd5@analog.com>
	 <CACRpkdZR8X17Bn-i2anqjxf0Gk60V175F7Xfwytkhy7_K+LsSA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Linus,

On Fri, 2025-02-14 at 00:25 +0100, Linus Walleij wrote:
> Hi Kim,
>=20
> thanks for your patch!
>=20
> On Thu, Feb 13, 2025 at 2:17=E2=80=AFPM Kim Seer Paller
> <kimseer.paller@analog.com> wrote:
>=20
> > The ADG1414 is a 9.5 =CE=A9 RON =C2=B115 V/+12 V/=C2=B15 V iCMOS Serial=
ly-Controlled
> > Octal SPST Switches
> >=20
> > Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>
>=20
> OK so I looked at the data sheet and it looks like this:
>=20
> A=C2=A0 o-------/ --------o B
>=20
> It'a a switch.
>=20
> Why is this switch a "gpio", other than that it is convenient
> to use the GPIO abstraction to control it?
>=20
> GPIO is usually devices that can drive a line high or low.
> This is very far from that. This could switch some analog
> line or whatever, right?

I would say so yes but Kim should know better...
>=20
> Now, the kernel does not have switch subsystem I think,
> so this is something like a special case, so we might be
> compelled to make an exception, if the users will all be in

Exactly, since we could not find anything, the best fit seemed like the gpi=
o
subsystem. I was the one suggesting it since a new subsystem for a simple d=
evice
like this looked excessive. If we had more devices that would fit such a cl=
ass
of devices, maybe it would make more sense to start thinking on such a
subsystem?

> say userspace and make use of this switch for factory lines
> or similar.

Kim should know better again (about usecases) but I would also assume this =
is
for userspace use.

Thanks!
- Nuno S=C3=A1



