Return-Path: <linux-gpio+bounces-14259-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DDB9FD211
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 09:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EFEC162935
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 08:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A4414AD3D;
	Fri, 27 Dec 2024 08:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J+0zEQxU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA2914B06E
	for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735288772; cv=none; b=UmifzJKN8ZqmK/1n87M7LWjFA2NzfdomD0HcgfAwaGOjKVTeEApNSXc1iJ5SzpLLA1FI7yvzUzfXZMMdWXelrl7hZyJYfy3EBUeoc2HRgMo5pdeWyjdTrL0GzQWfMYzgHPu/O/Lw521tJyG4d/YvIkqxr9mSR/makr1+E4GHBBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735288772; c=relaxed/simple;
	bh=A15i3klOsyYjYgNtuvTUq0Wifo3iCtb3EBomnXvT858=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7doVbg/2xzViHsgpNmJYyUVSkiFkHV9Hqton2PQQaWFGAX6LJ64OMrV0XwdAgTJM/0gHQsGYkJdi69kxI4SHOPQgV8o775hIjwvUdgkJT9aIiYZLl/sDqHGrc7F1W0hn2p0kKKHy69z8UdcDTXI0yYuhuMYazL6cAVrZoZBxBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J+0zEQxU; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3003c0c43c0so80808261fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 00:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735288767; x=1735893567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A15i3klOsyYjYgNtuvTUq0Wifo3iCtb3EBomnXvT858=;
        b=J+0zEQxU4ldVFWUh36D7Q0I1x7QVlf/IdmJ+nreJEv9kWUB4KqaJoMIcpn+AZI3sqQ
         KuYhM+ZZ9fIaL1IEI/h/SLCyfuQ84yCYI5EgcXK92l6prODmgwlP0LCliH7zWsMdQtNE
         dZS9e/4BRNjrVVuqpoG4DDgsSBqAA90qK7XZ9v9R8vg8eOVGZC8BwhngV1fmuctYQV8y
         PR9QKNjJLpAGt7Jwpp2xKs2mg8lmQuo0YzK6LbqjGcE2Jo8zo3EawjkP2lbOaLo998SV
         SN5LWpJ9MfsC9DoANaZLFxRqW2SGOMEEIYDjD4LAHgrGVVMtEkrlnQAe2iD1eBFKX3z3
         En5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735288767; x=1735893567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A15i3klOsyYjYgNtuvTUq0Wifo3iCtb3EBomnXvT858=;
        b=eUg3fnu1BcOLSRMPEUFeWFNxN/vjuDr7na8BLwZ6LhaZeawnFGRH/KoHCy7vRUC3Gh
         anDOT9PlCWmkm30EIpHW8ykn5GFvsJdAGmCzUNoffJucw6HNCAjRo6M3//M9rlEJbwMS
         +Vg+oVABYeSuzsKGqm/Lb3q+g54afAEerwzn98EjOgaHAbKEf/mPSIp3Fiox4QAFWL7t
         Q2/hh+nsZHuTKXQozUWGU4d/z08Lu5BJGc0V+a0DgBv2sQlxpq0xXdgFkeOQsRWr4ejG
         YDKPsMId5ml9nOgEPQQzJpD867ry0HRuGwWFSW7GjVSmQWC35WsJMLQ5qKuSFnDyg+Wp
         RNFA==
X-Forwarded-Encrypted: i=1; AJvYcCUq/qi3TOY48+7opO4wf7y5s8+4qsNEpdSZXjblGAny7kUylFxnf5wsDzF3SgQFL5FhPu6O+VO+sfd7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3gbixL73qA2j39WCZtlIROpS856073IEKwsdjHOrA5b0DSyfm
	qAzhSdKApZvAdRNBD5TBOBdjwFyHQ0m3D4ho/wb03GwKksWoGmXKabsJJzbtt+j7tqHxzJF3Mj9
	jJcabcocRZ7Dp3msAr9mNyY3s4+eDGP10HhueE0xUCQ8McUcA
X-Gm-Gg: ASbGncvVowXDtlSZUIwWa2pk7gehzpKQ87lxWAHXACQPPCa+/i4XSCk0vI5RnIBv2++
	GWWoZJYAj0AXc1I+533IFttcSE5bGShGqVjqC
X-Google-Smtp-Source: AGHT+IEFvP4aHqvLT/ZwzhAuo6N6XMHoelpJz70iyOhnLcdqXcV9mpxAoGDxsITkdEJvPswzQjqrJ90uUfwUoxDuWoc=
X-Received: by 2002:a05:6512:3ca8:b0:542:29e5:7322 with SMTP id
 2adb3069b0e04-54229e573d9mr6287692e87.2.1735288767102; Fri, 27 Dec 2024
 00:39:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241224-gpio74-v2-0-bbcf14183191@posteo.net> <20241224-gpio74-v2-3-bbcf14183191@posteo.net>
In-Reply-To: <20241224-gpio74-v2-3-bbcf14183191@posteo.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 09:39:16 +0100
Message-ID: <CACRpkdZwN0reH7K0e0wN9d30DJkyHVoBAaG9tk-+MELjOHeh_w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: gpio: fairchild,74hc595: Document
 chip select vs. latch clock
To: j.ne@posteo.net
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 24, 2024 at 9:02=E2=80=AFAM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:

> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>
> From looking at the data sheets, it is not obvious that CS# and latch
> clock can be treated at the same, but doing so works fine and saves the
> hassle of (1) trying to specify a SPI device without CS, and (2) adding
> another property to drive the latch clock[1].
>
> [1]: https://lore.kernel.org/lkml/20241213-gpio74-v1-2-fa2c089caf41@poste=
o.net/
>
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>

Fair enough!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

