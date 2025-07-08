Return-Path: <linux-gpio+bounces-22938-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA42AFCC31
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 15:34:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96B82176E52
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 13:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1F42DECB7;
	Tue,  8 Jul 2025 13:28:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6622F220F5E;
	Tue,  8 Jul 2025 13:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751981299; cv=none; b=hoeckxl7UV5YZYsSmmKCcAMOFs3EZ6RGZqym1zmXUaIInHIrQWHE+VBkIMoLkBmIlPFnIkVuvj7lpKptf510SBDZVxnIswL9Y9A7gY4tjawvhppir3eTnAzKsYDidWOrkSWP90Hqoyrjsj1PcVQYuSQcO8iU3xFxQBWx7/mayyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751981299; c=relaxed/simple;
	bh=1yZpcF/YahkL+DH/T9SpJ6dHIKpkpWwhLdbkP3+hyJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bnI8QLyefaKJz7A5iHnBWwoVx5Hr1CpEtGxkQkQEJFOWVehYSCc3jQ72unHIkobflietq6Holx+GwC3tFI9TZklYde2JaZr+4TisB79WciELhiHqepqmdjwNBuClGO4koKzNrMJMkXg3wtkzB+GilnuXGeFeaDW4GpmohobNIBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-8794259ffe8so51627039f.1;
        Tue, 08 Jul 2025 06:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751981291; x=1752586091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HwXr5JQBPkaBLHWGddnnrahSfTIk8BLpRxGvjvBeRX0=;
        b=uu8rXWcBOq+N9fkwF6BCOMztro6l1L5cN4A+FHMXeDj7f306eam3awgz1ynRbX203I
         328egMRU37561VHPcJ5iE5AVtv3bfNV144GvjP9ACh/hgG9TvEbMqDfjz8UdhQ++7ymZ
         WxDzB6hpdEtEZm8NFABM5yvpIgbr13tq9cKa9sGz73Duh9G/qsyOlHsIaf0qmsAqYLh7
         rWrNhmqRkRtvAhjyg7BX0Mjy3+YrfJtaXsmFRIZcHvnKkvHWWeONkLm2F/aHt6EDTnAM
         0PCp38oNmakNKDIhXtAkdw+L3kF/F7Ct0zvsztyD+WZ0FDsrcaz74ogcg13yZ2mQVfKI
         PJ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5hwsxezmkLnhM2+Zp0wAXJNmdRw5JpsfCU6yLxs0Wqw/vKF2o+ej+f8SKpt1aAU2wfwJxOP/ZGSlDs1KX@vger.kernel.org, AJvYcCX2kd7029HXsiLf3q33LXSlEIBG/pJbdTgmkiIUqjt0zRnOT7ZdiZnaM9GOjyI5THwHPRh2ei/YOvmGaQ==@vger.kernel.org, AJvYcCX5sLfFSe4uLLdSdny1aqJDlkbAcJwngUaSSfEGQ733RahphhjrT+fe5IiXUFrenfWPyHVvpuJectvX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrtk6uZ5PksQEKXKVscFNanxFwIxgzkA1Urpyn7ZBcNMTiHJvY
	b2aJfKmlpBvTcga7q/4XNZ0Q+EPQgZphy76z18k/sskQeBlyfWc4vw8RiCG2cvRqBbE=
X-Gm-Gg: ASbGncuMFf8wVkBKdd9uxze4tDpZaaVk9O8SF90tNCr2jUOSqziJ6kHKnqFWRidsNNw
	uLZDuVjBHkHXzHbVlb+APXrIFPOAXL50FZXv2LQv9KUQ4xqzAyZPoRFDt3H4IKJKif0XhdlAvhq
	Dc7m5ee9t4dNvAv6kzaaJn5PrYkctwjJFfd9vfpBAUQF1etPvJ1VrX3TNIOJqMgRy2ePiWrudqf
	hnZgRjD2XIrkYnOqO5UxFtG6kjZ9NMzQ7bjBWaEl8rCfZn8cPTEFEyhOhi5L2+QPgrZGMIP2lMa
	O3GvUu8hN4sQRSZxyDgwVI7+eJgyV/ygUjPIWbGu7/t3JViq+PNMxH1Tj14vsaR23bJA5TEPwtV
	hs+Saj0txNjEBPB8=
X-Google-Smtp-Source: AGHT+IE7qUsKgl5Uth7T/A1Bp8ngI7sw84zTX6ON9RqZpJk9nkhrzOKKJrHs+sgtmapH1YMqWV+knA==
X-Received: by 2002:a05:6602:740c:b0:876:737:85da with SMTP id ca18e2360f4ac-8794c10a9cemr278744539f.0.1751981291319;
        Tue, 08 Jul 2025 06:28:11 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-503b599b64asm2164119173.15.2025.07.08.06.28.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:28:10 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-8794259ffe8so51622839f.1;
        Tue, 08 Jul 2025 06:28:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKzCotSXFUkHlV7gWY+mZU385I48D1KjG8cLnWqWz1qQtJUTL11nVGtYr0hP9udaHafoYIqTCzhQW3Dg==@vger.kernel.org, AJvYcCW2jxc1fzehiFnB69RogO7kBPze2ExewGIVZcJqUdVEYbCzpOZ1pffkct/5iw4gR+tamLzFAy4RJfZ7@vger.kernel.org, AJvYcCWCM78DAUctphHmzBJBf2SPvMN4ob9BHUE31vT8Fpwd+zYVuNwEZ+55qIdqScqpI/fi+eiHm7kCVN7Pt8eC@vger.kernel.org
X-Received: by 2002:a5d:94cd:0:b0:86a:441:25ca with SMTP id
 ca18e2360f4ac-8794c5a73e5mr262803939f.6.1751981289780; Tue, 08 Jul 2025
 06:28:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707165155.581579-1-paulk@sys-base.io> <20250707165155.581579-5-paulk@sys-base.io>
 <20250708003348.58fe509f@minigeek.lan> <CAGb2v650h05aNvsQeQOjg63Ljcarxy2zqXnvNnjJ5+5ooGOELQ@mail.gmail.com>
 <aG0bqasOYUwwgiQY@collins>
In-Reply-To: <aG0bqasOYUwwgiQY@collins>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 8 Jul 2025 21:27:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v64vYEkKm8D_6r_O+fg_tR4zG1Loai1BPVO5AiE-MO=DJw@mail.gmail.com>
X-Gm-Features: Ac12FXxFG0byldtdYQU-R8wlvBgWN23RRGAX9zRQbdtbd5Tg1tBGYvUbeASjhVY
Message-ID: <CAGb2v64vYEkKm8D_6r_O+fg_tR4zG1Loai1BPVO5AiE-MO=DJw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: allwinner: a133-liontron-h-a133l: Add
 Ethernet support
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 9:22=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.io=
> wrote:
>
> Hi,
>
> Le Tue 08 Jul 25, 16:18, Chen-Yu Tsai a =C3=A9crit :
> > On Tue, Jul 8, 2025 at 7:36=E2=80=AFAM Andre Przywara <andre.przywara@a=
rm.com> wrote:
> > >
> > > On Mon,  7 Jul 2025 18:51:55 +0200
> > > Paul Kocialkowski <paulk@sys-base.io> wrote:
> > >
> > > Hi Paul,
> > >
> > > > The Liontron H-A133L board features an Ethernet controller with a
> > > > JLSemi JL1101 PHY. Its reset pin is tied to the PH12 GPIO.
> > > >
> > > > Note that the reset pin must be handled as a bus-wide reset GPIO in
> > > > order to let the MDIO core properly reset it before trying to read
> > > > its identification registers. There's no other device on the MDIO b=
us.
> > >
> > > putting the PHY reset GPIO into the MDIO node is a clever solution, I
> > > was struggling with putting it either in the MAC or PHY node, though
> > > conceptually it would still belong in the latter, I think. But this
> > > might be a more generic problem: for most other devices we activate
> > > reset and clock gates *before* trying to access them, though this mig=
ht
> > > be historically different for Ethernet PHYs.
> >
> > The phylib core has code to deal with reset GPIOs listed under the PHY =
node.
> > It might be worth checking why that doesn't work.
>
> While this code does exist, it's too early to be called when the mdio bus=
 is
> trying to probe the phy. I was also surprised the existing reset gpio sup=
port
> in the phylib core didn't take effect (that's how I tried to implement it=
 first)
> only to find that the code was never called. It's only called once the ph=
y was
> probed and registered.

OK, that's definitely weird. The code looked like it just walked the DT
and registered PHY devices, upon which the GPIO lines would be found and
toggled.

ChenYu

> Cheers,
>
> Paul
>
> > OOTH, there's no code to deal with regulator supplies for PHYs.
> >
> > ChenYu
> >
> > > > The datasheet of the PHY mentions that the reset signal must be hel=
d
> > > > for 1 ms to take effect. Make it 2 ms (and the same for post-delay)=
 to
> > > > be on the safe side without wasting too much time during boot.
> > > >
> > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > >
> > > Despite the above, this looks fine, and works for me:
> > >
> > > Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> > > Tested-by: Andre Przywara <andre.przywara@arm.com>
> > >
> > > Cheers,
> > > Andre
> > >
> > > > ---
> > > >  .../sun50i-a133-liontron-h-a133l.dts          | 19 +++++++++++++++=
++++
> > > >  1 file changed, 19 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a=
133l.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > > > index fe77178d3e33..90a50910f07b 100644
> > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dt=
s
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dt=
s
> > > > @@ -65,6 +65,25 @@ &ehci1 {
> > > >       status =3D "okay";
> > > >  };
> > > >
> > > > +&emac0 {
> > > > +     pinctrl-names =3D "default";
> > > > +     pinctrl-0 =3D <&rmii0_pins>;
> > > > +     phy-handle =3D <&rmii_phy>;
> > > > +     phy-mode =3D "rmii";
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +&mdio0 {
> > > > +     reset-gpios =3D <&pio 7 12 GPIO_ACTIVE_LOW>; /* PH12 */
> > > > +     reset-delay-us =3D <2000>;
> > > > +     reset-post-delay-us =3D <2000>;
> > > > +
> > > > +     rmii_phy: ethernet-phy@1 {
> > > > +             compatible =3D "ethernet-phy-ieee802.3-c22";
> > > > +             reg =3D <1>;
> > > > +     };
> > > > +};
> > > > +
> > > >  &mmc0 {
> > > >       vmmc-supply =3D <&reg_dcdc1>;
> > > >       cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
> > >
> > >
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.

