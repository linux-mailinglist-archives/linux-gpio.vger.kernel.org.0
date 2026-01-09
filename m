Return-Path: <linux-gpio+bounces-30324-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC42D0880D
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 11:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9384A301A1DE
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 10:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251D63375C3;
	Fri,  9 Jan 2026 10:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5HWPIYv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BC933437B
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 10:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767953955; cv=none; b=boNUAqbkc7pBziiV71+yfLmGf373SiRwXlh9luXslAxQS2BGDIiwKEjbD3F5Gwb/xWYr7XmUwdqG/za6xmS3RPT0tprIzT8PuJUsQyQdI1vrrK0GKQZQrQR7oRdMwujqJE+fhWI4Q2zyES+0jXYWcywhtFG+QcsOQzxpWuEK1zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767953955; c=relaxed/simple;
	bh=9hbsjUn6eYASbfA/oJT6XWtugpXGlLNjh8EPRyD3m04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LbmC2ovQzAxjkG44Yi5/6C1aep36amU2sU070DGR9whU7sXk926JC+lys/rdNqcY1PVmPWsCX3MiyxtpDq1tXs0DpKv6V4OehqBT+R9Ixk635K+LJChvE/2B6cqoUV5F7keVERpl2+BmNAcPBHD5TAAAdJ6vxLXWTgX4O2GgoV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5HWPIYv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F770C2BCB0
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 10:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767953955;
	bh=9hbsjUn6eYASbfA/oJT6XWtugpXGlLNjh8EPRyD3m04=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q5HWPIYvfN0g+8t2ODLZ6RHYqLOPxZyUqAO8jXrlFFXbJfNk5PkQzNacBCGeWlOI4
	 zVWxIN+v/ND+H67OS1j4Vi913awzUf4IrWnMQVfD2Dpr24wELqnc2MFBMKJ1ZKLRm+
	 JVsn9pBwtUqBGoql22eIC2pTaZn/uEE9cygO2yg+h9puAJ1bsbFUfn6tnq0irE8nUt
	 /FagBI3fN0qA257T3lWotje4TpFQ1+rWcTinV80/YofYEx4LczcmTg2VUYLrf15CVW
	 3uX7arvzOc8Tv0ed/zvkpT7cPQwnGPex+YpZh2r/HPuz3I/px64pkGw3UDhomvDchG
	 HZz+igJUYk/GQ==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-644715aad1aso3533019d50.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 02:19:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXVvRdcxIG17rASKKvswrEM4n1wjkGSNvGZArcsuS0PvpFEJX+Bxo5BnmatP1yQgMljplBq2LulYAnM@vger.kernel.org
X-Gm-Message-State: AOJu0YxNB8S1MiNm3kLN/KCKVwPFQXtcHglEbgtXX4NXLkdYxx5aW/VH
	v4axRa9IMT120LgKpPXEOALJfNSwPbwGTwVedeUgp0fCFK0mjVYwI6/H294uxr+EMlx9ytO+H9P
	oSs0fUDvuM5JIogtHYpqviiWwOWnltKU=
X-Google-Smtp-Source: AGHT+IF5GjxrLmuSZaExZjLaPOUjC/EsSoVJYPQqW4W2Vxtf6X+8zRZ62bSAxQ72fQzNPB0kphD/sc5lbPKYGJNdPlA=
X-Received: by 2002:a05:690e:130e:b0:640:ce59:128b with SMTP id
 956f58d0204a3-6470d2437b1mr10650880d50.2.1767953954886; Fri, 09 Jan 2026
 02:19:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
 <20251216112053.1927852-7-ye.zhang@rock-chips.com> <CAD++jLntu4LY=VHOMSXeLKXOBD9MTNziv47B0qkDjxUa1xAsng@mail.gmail.com>
 <85032ae4-4d82-4884-aa7c-b69fee76d509@rock-chips.com> <CAD++jLnH2vLNxTLj8Lw8RnOHxfitwi3G_8WCBtu+_=XL3ryH_w@mail.gmail.com>
 <a2f5c2b3-2168-41b4-917f-183ab72a4499@rock-chips.com>
In-Reply-To: <a2f5c2b3-2168-41b4-917f-183ab72a4499@rock-chips.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 11:19:02 +0100
X-Gmail-Original-Message-ID: <CAD++jLkmieQpkJnAYyr7ys6m+v-=qNZaMoyKCtPFo+qjGwm8DQ@mail.gmail.com>
X-Gm-Features: AQt7F2pjRZjybV4xPqr9Y0E2i2C1kVX68rvkdaRtoGr0Zh5amDZGu50_yar2YJk
Message-ID: <CAD++jLkmieQpkJnAYyr7ys6m+v-=qNZaMoyKCtPFo+qjGwm8DQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] dt-bindings: pinctrl: rockchip: Add RMIO
 controller binding
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ye,

thanks for agreeing on using standard bindings for
RMIO, we are making progress!

On Thu, Jan 8, 2026 at 1:19=E2=80=AFPM Ye Zhang <ye.zhang@rock-chips.com> w=
rote:

> **Regarding the primary IOMUX:**
> However, the RK3506 pinctrl support is built upon the existing
> `pinctrl-rockchip` driver infrastructure, which was originally designed
> around
> the `rockchip,pins` property. Refactoring the driver to support the stand=
ard
> `pinmux` binding (and the suggested nested node structure) is a significa=
nt
> undertaking that involves core logic changes and regression risks for old=
er
> SoCs. Mandating this refactoring as a prerequisite for RK3506 support
> would effectively block this SoC from being supported upstream for a
> long time.
>
> Could we allow RK3506 to follow the existing driver's style for now to
> ensure
> consistency and timely support?

"timely support" is of lesser concern to the kernel and DT
bindings which are more concerned with maintainability and long-term
longevity. The ambition is to work predictably and impersonal, such
as like the planets, or the plants.

> We agree that migrating to standard pinmux
> bindings is the right direction, but we believe it should be handled as a
> separate, dedicated project in the future rather than part of this
> enablement series.
>
> Hi Heiko,
> Do you agree with this?
> 1.        Use standard `pinmux` for RMIO in this series.
> 2.        Keep `rockchip,pins` for the primary IOMUX for now.
> 3.        Plan a future refactoring to migrate the primary IOMUX to
> standard bindings.

My main concern is this:

foo {
    rockchip,pins =3D <...>; // For IOMUX
    pinmux =3D <...>; /// for RMIO
};

I don't want to see this, because that will be *hopeless* to migrate
to both controllers using pinmux =3D <...>; how should you decide
which one to pick for each?

In that case it is better to do:

foo {
    rockchip,pins =3D <...>;
    rmio {
        pinmux =3D <....>;
    };
};

Because then you can later migrate to:

foo {
    iomux {
        pinmux =3D <....>;
    };
    rmio {
        pinmux =3D <...>;
    };
};

Yours,
Linus Walleij

