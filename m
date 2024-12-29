Return-Path: <linux-gpio+bounces-14333-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1774A9FDD27
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Dec 2024 04:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8699D3A15BD
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Dec 2024 03:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E44BA53;
	Sun, 29 Dec 2024 03:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AakbimUD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257F3259498;
	Sun, 29 Dec 2024 03:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735441589; cv=none; b=VEFjqfkPynrR3wwSKHbZg0AB+BtIhUtuljRXjKOOSgUK+J45bb1zeL5mg91rPaLC2szdKoHNHbcNSsA4bRzC6uqrQyXsQyIqvSxI3BVfLVeVaJzEOOu/FNX0UdL0gLDfuXwDKTxFF7e2GMFwwRR01l0T1z75r0mDKkrPNd2oeh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735441589; c=relaxed/simple;
	bh=E3g/atb7onmbbMDijPGbLDOPIHeb7JoRx9ktsYvI3Cg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TvJrJgVAWQJrxwdpKZ/oLhwwYeLGC2paKXGWBo9odPww3A5JKIYuIXDqJoE1u1I1gTuiEi6jj3sbNAOk6+SVAuLmFXHSkw5eEIt68xoyzHLB/wAmJFviEWth98STRluYkf2jTRZbwxS+TmwFfTwh9dFC1V42hXunIQymGQGHDmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AakbimUD; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e3983426f80so9726286276.1;
        Sat, 28 Dec 2024 19:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735441587; x=1736046387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvS7YNSt4194SPSo7TpEkfhz7K0+0F9htsa4Cz12Iw0=;
        b=AakbimUDCOoOaoMtDLuEOtW+PybuR6/itxWQRZOXwCVeHFJtfFRUnYOiqC3y9UM63w
         KOkN/bKh1wcKDU82UNO0gpj84IWWGwS7yMURW20Ef68ABwYWQeLKTeGmnssLU1rZobr4
         +V3F3fq4cWWsVFp2eNnfPLMZjx+P8e+Q7PgLn/bKF6b7U/ndUfoiMcvGYF/Z0j0ol7zH
         uL0Q61JuJeAvM0DdoJQOaJykykyPeBGaxNTnVhn/1aK2QZC176Ijx/IpOoNfCXwchoqS
         oKkck0wfNOakqCxKE1S0JEnhDX8T0T/t2r6BJEM9Kf6bm0hkxUYVRPwHMpkK3JtmY+ww
         2XZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735441587; x=1736046387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvS7YNSt4194SPSo7TpEkfhz7K0+0F9htsa4Cz12Iw0=;
        b=YWYZqcM33jfP0Thx3gSMS+xCdus7q/m9+KjOKPBoZBc+lTNlpAuXz/KspVbdxbiDY8
         Mw42jncQYtVjPhEuo3ZoE0GuIwNyAp0dYMnvjauTk2R2/Bc2wIrCEvGNeFny6LANXRe2
         l0i0DFbxozjRnXiAIzQFwhJUmb3FPsLxC9rdz+WPVqubhQn/E5Ze3yE6P+qMtKVN5cl8
         9saCJDLu/5K4LH7+NJ57oEu7Vibcv5PJBnadRK1YoOfGTXDHPXs/vDmhkW39nCTrDSYH
         YVw2q+iS9Owh21CYtWGV44CsurQcwZVI2a5/JZwh7S3D1j+uSNZm1qZoIDBcZylaz0dd
         41Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVUdEbyO1TaaUu3/ZU6TkLy3IhnJtlUIAhGyErqy2uX4vUB0KpugGMuvgnheeKthl74YIXw4ZEJMCq1@vger.kernel.org, AJvYcCW4Qoj8Edtujhk6VXp8y+nhNSK0DROvyMkd3JIEiN4cilil1CqMw+98ADMpY2P9v1z00/Umo6hSDdNGSom3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs7NvUnS73A6Czjr4OfI77GfRJPGnd43ufEQTV+b7m/WKmgN9A
	+CH1qhGrA/6yMAmWX+2dVVu2viz3ja1jwayHhh5eHOBB7+DYx5QSJj7UZqcnAotPcXR18E4eJIJ
	vw0XCAKszCHkZc7nhbAhKl4WZtng=
X-Gm-Gg: ASbGncuWaSPIfLjjGoeETjuRb4y0+gwkzt9cYU3cwznUTqqv6knwbAzIO1Wlrv/mM7S
	xodQa6glgLVEXqIbvn6alVfOWY1u0U88Md17uZw==
X-Google-Smtp-Source: AGHT+IEuZFbgc5Llr9F1XyJUVolrrX4LfIdqKiGZ/CmsuECBG1D3s/0L8zRWH+FAVcMmnOPLrUjf3fNnlKAEAPaQRvM=
X-Received: by 2002:a05:690c:7249:b0:6ef:6c57:ddc6 with SMTP id
 00721157ae682-6f3f8216b49mr233335587b3.34.1735441587027; Sat, 28 Dec 2024
 19:06:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241225035851.420952-1-gch981213@gmail.com> <20241225035851.420952-2-gch981213@gmail.com>
 <CACRpkdZ8Yve3EPB6E1nrPi0se=rgush60Q=Vce4Ux2w1QW3w_w@mail.gmail.com>
In-Reply-To: <CACRpkdZ8Yve3EPB6E1nrPi0se=rgush60Q=Vce4Ux2w1QW3w_w@mail.gmail.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sun, 29 Dec 2024 11:06:16 +0800
Message-ID: <CAJsYDVJXLjd6ih4C5k+e-jAJ4DvKOPcJ3OwBQX+S=AmohzENmg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: add binding doc for siflower,sf19a2890-gpio
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

On Sat, Dec 28, 2024 at 12:45=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> Hi Chuanhong,
>
> thanks for your patch!
>
> On Wed, Dec 25, 2024 at 4:59=E2=80=AFAM Chuanhong Guo <gch981213@gmail.co=
m> wrote:
>
> > Add dt binding doc for the GPIO controller found on Siflower SF19A2890
> > and various other Siflower MIPS and RISC-V SoCs.
> >
> > Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> (...)
> > +  interrupts:
> > +    description:
> > +      Interrupt mapping, one interrupt per 16 GPIOs.
>
> So from the driver it is very clear that this is lumping together several
> GPIO blocks with 16 GPIOs in each into a bigger GPIO controller, despite
> the instances are identical. They even each have an individual IRQ.
>
> > +  ngpios:
> > +    description:
> > +      The number of GPIOs available on the controller implementation.
> > +    minimum: 1
>
> I would say minimum: 1 maximum: 16 default: 16.
>
> One instance per block/bank.
>
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/interrupt-controller/mips-gic.h>
> > +    gpio@19d00000 {
> > +      compatible =3D "siflower,sf19a2890-gpio";
> > +      reg =3D <0x19d00000 0x100000>;
>
> Just use 4 instances. Since (looking at the driver) it seems there
> is an IRQ register that is "off the bulk" I would do something like:
>
> instance 0:
>
> reg =3D <0x19d00000 0x40>, <0x19d04000 4>;
>
> instance: 1:
>
> reg =3D <0x19d00040 0x40>, <0x19d04004 4>;
>
> (...etc...)

Actually, this weird GPIO controller uses one 0x40 block per pin (The
49 pin controller uses 0x40 * 49 or about 3K memory space just for IO
registers!), and they share a single reset signal from the reset
controller.
I don't know how one reset could be shared across multiple platform
devices so I don't think this kind of split is possible.

--
Regards,
Chuanhong Guo

