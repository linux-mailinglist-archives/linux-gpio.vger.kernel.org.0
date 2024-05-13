Return-Path: <linux-gpio+bounces-6343-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 946738C480E
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 22:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AF9C283C8F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 20:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A457D414;
	Mon, 13 May 2024 20:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xhFE4XTS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BA57BB12
	for <linux-gpio@vger.kernel.org>; Mon, 13 May 2024 20:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715630923; cv=none; b=GAOfsJR8xJY3QLr53A/lo3zlx2A+plhgQuvwoF7KooUuUyE7uTLMPNxLbh+/KabpwfJX0k94aD8rHzmpnjoGKUU0im/6lHpDBK54xL88ez7GFreJmGqmIgvuZNmc0cIfD8Lu7drTYstpY+gNYwbLSsLxB4c5CqtOdx+8dAQii9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715630923; c=relaxed/simple;
	bh=h++qaq6zP9e9LxDlnuAEc9H3qFDQRQ6CLNWg+o080RM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qrBm9fJ2fpyC0+ZgP+jljnwW4U8vN9+ICeZRyX5kE7xoLy6AIObp7WGN7d6uOsCkyBVtAYfEiHXHXeIISbqEXCn9ZYksZ39MIpK8tba3YrluI0qWv5NsKQx+wHCd4EOTzeZR3B4o6oPhGZ1EIWt1IdCeOBjLFWKhM7JfKdH9g0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xhFE4XTS; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-deb5f006019so5177273276.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 May 2024 13:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715630921; x=1716235721; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5A1GoMGEwyA2ur0YkX2d7Zm3EGSPcQafJ+kxduRrTg=;
        b=xhFE4XTSVGIPB7F5o9ruoD2TkPg8Wapvtiyg6ceDzXX/Z4LfHip5eAPQ54jpO0WGAo
         Zz/BifMuILb3m7o8xNWq/khukXD/li8i9MQBxqXQKk6fGBIeDu1Mgoc45DJq71WeA5NU
         5TCHiqsBJV3HULLZQhIRWR2c+B/QBRbFKYEeLXLjHNAQ666FuzcX6vq4g6fabRWyWDzt
         7ms8KoQ39ZMhWe4fdsA7+4rKMKFNYLp5boqVbiYeZ0KJ5ONbVft0c34iuw514faYHvVv
         iDoCLPGphxJrfnqWA7tI/cSXjodqliBB81KmxO1TPJc+nxrgWWoIDny0zPOctgzd1qVH
         u/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715630921; x=1716235721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5A1GoMGEwyA2ur0YkX2d7Zm3EGSPcQafJ+kxduRrTg=;
        b=kusL89gy9u0oNsOWW2d5piqwziYzaJTdPb02z1JpocVNNk7lTeKpDImdlnMghX3sTt
         KHYsb2CrOlxSWgzztWuShCMbgnUUq9GejpQkejKUjLh7zjYvSgqZB8+MeLUU5T3JEoVw
         PSN1ou5CTF8h1yvi/ExgAypxape04kT67+PFt4MD9PQGWY5RZzsE5ONwXB5f3QUI6Qfl
         +0KM8v5ieKsIRUT567B9c8w8z7hOrY0pPz8l3Ntb24f5ZKbIzqgTr71fUiuqvhYeirD1
         4R165Cl+JrWuA1pc/SJEf0peblXZDzfZG2CpY9YEIhXCeU+c+V3xL76vI1h6fLOeAu2B
         ohPw==
X-Forwarded-Encrypted: i=1; AJvYcCW7zJQfXeKtZ+niTVTcra5lzoq328Lm7usJ6opraypAolBIqqTnAjMUg+NRevFQMSMiuQcL8wi7LfgCQ9bImCFZO1m8NPbES8zn5A==
X-Gm-Message-State: AOJu0YyPHYqoh9HdfwV8OzOTTav7QRmuJ8APuemJ/M7tEr5R+XW8dgMR
	WW1BE+C2UFyPYGJTUReWaBLWtbmdV/sBJN3mRlfoahwydw+bpXEQOsvwQgV8hDCPRCudhUdxWVa
	VU1BGkfKy79VhQ6dKe/0ZpbqGOiuxWzcHHJN8Lw==
X-Google-Smtp-Source: AGHT+IGkSQiveVffIMwCeTQ0Vm8Z7bdjgghLsIABe1CDCxHsQVmDYMB43PdQ98LNA5H1T36BxYRnxD4fVKpeiZOV5X4=
X-Received: by 2002:a25:dcc9:0:b0:deb:42d2:c299 with SMTP id
 3f1490d57ef6-dee4f37b967mr10928052276.55.1715630921527; Mon, 13 May 2024
 13:08:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZiJkxBU3bYNWOdbK@Z926fQmE5jqhFMgp6>
In-Reply-To: <ZiJkxBU3bYNWOdbK@Z926fQmE5jqhFMgp6>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 May 2024 22:08:30 +0200
Message-ID: <CACRpkdb+8=OOx4Gh9+kPrXZE3pYa_bO3t2u9+P-aBc2TjLs2GQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio-syscon: do not report bogus error
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, etienne.buira@free.fr
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 2:35=E2=80=AFPM Etienne Buira <etienne.buira@free.f=
r> wrote:

> It has been suggested to automatically detect if node has a valid
> parent, but that would defeat the purpose of error message, for example
> arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi could then be used
> without gpio,syscon-dev, and lead to funny results without error
> message.

Now the DTSI does have all these gpio,syscon-dev pointers so
this is just a theoretical problem, right?

The fact that someone can write a DTS to shoot themselves in the
foot doesn't concern me so much, there are many ways to do that
if one wants to.

> It has been tried to mandate use of gpio,syscon-dev, but that raised
> objection.

I don't get it. In the example you mention it is already mandated:
Look in
Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt

Required properties:
(...)
- ti,syscon-dev: phandle/offset pair. The phandle to syscon used to
  access device state control registers and the offset of device's specific
  registers within device state control registers range.

Apart from the obvious spelling error (should be gpio,syscon-dev)
it is right there. (The spelling error is a binding bug, patches welcome.)

If this binding is converted to YAML and the property renamed
properly to what is actually used in the device tree then the schema
check will even yell about it.

I don't see what the problem is to let the driver just look for a parent
if gpio,syscon-dev is not set.

Yours,
Linus Walleij

