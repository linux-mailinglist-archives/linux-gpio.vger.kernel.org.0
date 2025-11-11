Return-Path: <linux-gpio+bounces-28347-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5897C4D1B2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 11:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84FF042428B
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 10:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B5834C806;
	Tue, 11 Nov 2025 10:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UnXOCB3n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F3134B68A
	for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 10:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762856857; cv=none; b=BRNbVsiki3eiHZKNxmBGy7xJxe9+Ps60LzwiaeYELGyt2ntKdA68SUcm/KFah5Plosj9B1tfZB7Pchycw9GVkrkM+ltALXT4jlv/vnpZGytRJbHLl29PtDui6KXJR4KRgv3aSvHDKDd+KlinQTxe6NCPbDgh5DHT1bZ3O9x8nBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762856857; c=relaxed/simple;
	bh=VZRK3bOsG28vtltYuXm2i797l0KnAcCOqsty2XViQ3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZMPEs1+tXkXm+ZZ1rW/+dXzu4ribQ/Jd3TkctuEmARW8tJjRzgg67nooRYTF5g1KkqgTYx3aupYm+stQU9fZHNm16cQ4J+hw8it7GK3oZmBFowTf9Ll7snuKuRwNearlaNeup8qSo6V9KCnbZHwHqcqSlCE79QsEEOkGjf1Z/iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UnXOCB3n; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-71d71bcac45so37107067b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 02:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762856855; x=1763461655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7khBtzXIp0xZap226+h9tuV9rGquBxGHwh18nz6WYA=;
        b=UnXOCB3nbrh5o6rQpnpZZdB7puAKAMqJbwVuncHooLP8MBfkQqVrEPwlWt8oo+/E80
         VAzZ5GpSxZDl9P3C/Y0OUtrSX+kPrcUsfH2lZlGnq9J2wbiz/aUo7JYuCYHaezCvSBIj
         fTdxxbgMQcwklpNLlNoGlybHiI7x/q6gXMX/N9Qxwa8/b2CW4+Y8ZHLHPP5ZZtJfuSB8
         FOCXloufjsLfeoMZY4nYyZ11edNfmCc6azyW4acykw6NP+75daUIWx7FkpiLFU8CPB6y
         CCwjdw5JGGvRzi9nLDVDjIx2mdp29+GKBcJKvn4d8/SM58fjUw63p/hqE3ZSsqcRVzIo
         mPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762856855; x=1763461655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k7khBtzXIp0xZap226+h9tuV9rGquBxGHwh18nz6WYA=;
        b=OIyp5EL6q4x3nh+4hPJ3Mmmvg3zqfESvp3tT7vpYoMwsVtUKU0k5KNlWpY6/hIrmZd
         r7B8TgKfqqQy67bF9rEurrorHa+3G8R6QGpGoR0PvhvRlq16hZPfj9eEYxvu6aWL7rVj
         0hrjPlz4aLm80ch6EPqLDst04dq1YRMtT12+ucj/60ykjohprgU0O0H/olSRlK6/gov3
         /j2Pa/pIUeNAWZxYhBU2dCRBss7pBN4AYhZS+9GT2pYNKdiUdluzhuDB69/zQEEmdgZ6
         xlEAMeI1jiddUizhCT38VpxQZw/h2ByteWK9lAZmaqezHwvhRHiFpggs9PUUFpSpfZ2e
         Qdnw==
X-Forwarded-Encrypted: i=1; AJvYcCX9CHGGimjgu/Raf+37cFOi5eR1qaD8kPT3vC+juJysksdWYRI5yLZ33Tdx++by2CZgmzucU/JP8ifk@vger.kernel.org
X-Gm-Message-State: AOJu0YxT8/eT5inMcaqnaMJPrtfTNH6byjs5Hg2f+U/EiYYkpvvq8suo
	/PENZzSwJnMk4aF6LRn7MrpCJ0orADNR5X4psTHVtHPqLrMc09KOFguDNRdCxPtjFVWblLcFEd3
	uTSuie+xytLlPROREh4Dta+ScZfnJimEbRVJMm2MVsTEd/XoLAKXNPKI=
X-Gm-Gg: ASbGncveelwHEXT/Aom7BVH1SHbq+fkxY8Vx0K2mFnQSqXj9Rhj/K+zg3gsQWY2Jhmq
	LhQzwV+C+vzMscpOhFtfeNTSh4TJ+QRBPSDBu9Y405paTkqofHKu+HNM9yBHnE+h8CD3D/E+EJ9
	3HbuS/lkkITAJlEsjLedhtx0auR4j91L86RMLdh6ZW3al2SDFFkWkgoQUdjG0pamxB2qi1lW8xv
	c8+Gg/9aeK4nft2WZybVDpN7Qnxd+/6XMuiXh7W1ANVh4iIxk4qgjv7ioR/ddc9v9/BgEx8HIi5
	muWNxQ==
X-Google-Smtp-Source: AGHT+IEk2H2YEsL0xkuLYpOfGFRgLDQ2g6ngSvt7pmfpCRqNXC2Ha8alMkiTsvLp5xWvt7eGkkSPVDpfAeg1vJdOmAA=
X-Received: by 2002:a05:690c:6ac9:b0:786:59d3:49e0 with SMTP id
 00721157ae682-787d53af614mr120208927b3.25.1762856855161; Tue, 11 Nov 2025
 02:27:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251108174055.3665-1-antoniu.miclaus@analog.com> <20251108174055.3665-2-antoniu.miclaus@analog.com>
In-Reply-To: <20251108174055.3665-2-antoniu.miclaus@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:27:17 +0100
X-Gm-Features: AWmQ_blJ-ik6xUXE2LXYUaqjihmL45TeO1-cQ_uCDnErJH-waDrg2-SaMoDOhR4
Message-ID: <CACRpkdZLK722xOMFxYhYyO9LudnKVgmeHNYBha0e-BoBo8sr1w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: adg1712: add adg1712 support
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 8, 2025 at 6:43=E2=80=AFPM Antoniu Miclaus
<antoniu.miclaus@analog.com> wrote:

> Add devicetree bindings for adg1712 SPST quad switch.
>
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>

My comment on v1 stands.

This is a switch controlled by a GPIO:

-----/ -----
      |
    gpio

The resulting binding is not about GPIO, it is about a switch.

There are similar things that have unique bindings already,
for example:
Documentation/devicetree/bindings/power/reset/gpio-poweroff.yaml

I think this needs a new binding folder in
dt-bindings/switch/* and cannot be hidden away
as "some kind of GPIO".

Maybe it will be modeled as some GPIO in Linux, I don't
know yet, but other operating systems use these bindings
too, and they will be confused by this "GPIO" which is
actually a switch.

I don't like the idea of GPIO being used as a dumping
ground for hardware that isn't properly modeled.

Yours,
Linus Walleij

