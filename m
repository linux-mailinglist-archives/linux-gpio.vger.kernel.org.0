Return-Path: <linux-gpio+bounces-30750-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D47CD3BC1D
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 00:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4184D3029EB6
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 23:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F3E29E0E6;
	Mon, 19 Jan 2026 23:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrUlcXsW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3253BB57
	for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 23:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768866820; cv=none; b=eSndnisTefd2sdpKmsIAZpOhLgYQ2865lrpfjaZPlA/TYbjZ0U81HtsoVne0boJjw+LhwmSnDvI/InP+NW7S3zUc69X77FfEV7N2/BAKCiiy3NyiL5zJzsycYfEd1ZfYsdWfMHHD4eBMohBtKBNOeSNwjC/hnp9AtzjM/tPZ1/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768866820; c=relaxed/simple;
	bh=cGakJU4QjXpVKqVk7iTfLklopa5iarhgK0sVfCXw2Zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pXqamik9FlZl8CENBepHIgrIJIq4snkbcUU2A5YgTbDmySU3CzgKcjpgmeYiNBpUEzQ8zEHHFHz70Na+oLZs3VXJC1TzuwZtfbJCYHSdFfBxeaeUB6NrtBSK5yTEScaXHycGuSF2kv+0rQoz8N73/Vzf7sqplL2TfeBDLELT8ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrUlcXsW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9C2C2BCB0
	for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 23:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768866820;
	bh=cGakJU4QjXpVKqVk7iTfLklopa5iarhgK0sVfCXw2Zc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JrUlcXsWcm3Gep3dMJbs+AmlhGfq4qhDeSk1ypl7KVINik2k7POZsc/6ubyGlAFF3
	 wXvGJ78usnvU6Vs2JHoJWfqsKeRCt6KExuIdYokRSG8FDVupx+u3Mcf5x7LifTEzvq
	 jz9mwLUX6eltjGfef+3JJV+/te/51TYUMhrBi76m7oStoXO7WJEeSIkIGRaOOQStBf
	 9c+PL8npUVgkYCtUliwfFcsAhg/wuhnv/9FPD1Kg8JleEBEuaYqo8KfAE/mRStIFsD
	 2V3M1ZzhJmd0KEylxYM+dQBKLWstjxsFUwJhsZBl+HZYzxQAcmwU/uEMYjsok7pij9
	 tl493tMSjdKKg==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6493937c208so545177d50.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 15:53:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9aUN8gLLN5wqXqXIZ3/j9ECckMmVfKz4PQ/Z53jSQyfI+sL7+rNma7jFPBSZ3HtiEf2A5181ljB5T@vger.kernel.org
X-Gm-Message-State: AOJu0YwTWHAGcRtm8d+t2YelSNePT8XGvyPOn6V+OsohQOLr1tCVqkS2
	P+eL12WXla5pQBAVEyZT+QGvK6zXqNfV+AviVh4I6AlECdsBgnrxo4K9BdbhuSCs1j7nDOhlf97
	itqQr7HCjsVhy32Y4m6dcaGRw3XqVrrw=
X-Received: by 2002:a05:690e:1685:b0:643:2169:d6d3 with SMTP id
 956f58d0204a3-64917736136mr8776075d50.69.1768866819491; Mon, 19 Jan 2026
 15:53:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
 <20260108-kx-pinctrl-aib-io-pwr-domain-v2-3-6bcb46146e53@linux.spacemit.com>
In-Reply-To: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-3-6bcb46146e53@linux.spacemit.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 20 Jan 2026 00:53:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLnmbGN1riUpXGa3kuwVQh2gQ8D9GZgtnJDs2yzouvBY6Q@mail.gmail.com>
X-Gm-Features: AZwV_Qh_eDw0c-w4THoUkVrCkuqzPwqyf9Zz69eeTwoO5y4GUJtui-8WqMWvvzs
Message-ID: <CAD++jLnmbGN1riUpXGa3kuwVQh2gQ8D9GZgtnJDs2yzouvBY6Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: modify pinctrl node in dtsi
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 7:43=E2=80=AFAM Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:

> Change the size of the reg register to 0x1000 to match the hardware.
> This register range covers the IO power domain's register addresses.
>
> The IO power domain registers are protected. In order to access the
> protected IO power domain registers, a valid unlock sequence must be
> performed by writing the required keys to the AIB Secure Access Register
> (ASAR).
>
> The ASAR register resides within the APBC register address space.
> A corresponding syscon property `spacemit,apbc` is added to allow
> the pinctrl driver to access this register.
>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Acked-by: Linus Walleij <linusw@kernel.org>

I have applied patches 1 & 2 in the series.

Yours,
Linus Walleij

