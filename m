Return-Path: <linux-gpio+bounces-29214-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C4DC9C45E
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Dec 2025 17:43:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C12F84E35D7
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Dec 2025 16:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1A9292B44;
	Tue,  2 Dec 2025 16:43:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BF228D8ED
	for <linux-gpio@vger.kernel.org>; Tue,  2 Dec 2025 16:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764693798; cv=none; b=j0OgDhJkS/9yD4waf8BNwIiG/gUmpyZCTC446lepX1KAxIVEL7BeWf0+y/shL7eR2GQvQfR0DCFJOt/cDqWb43yvVaynO2g3nxEoldLZD000fhaTiXn+bx0Ug4deS46PrfFvfNWzzlaSJY/omyQNmKig6QA0XTpvpcTpgU0kI6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764693798; c=relaxed/simple;
	bh=7JWQpNMMWls0pEOEbb/qFxvVCdKg8LNQq2xwgx7Zjik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJAgk3Yd8EQZM41a380m7zBldyLzYqFrOXvVxnhDvgofccNpB9+YPmFUwG+SAbra33cgPXMeSdmFK9MSbM6G1yo8NVOXTMibvknNpPbGc4rm1O105weYJ4hVgKJRuYvqrnZwvgBg5OhGO1mIku0e5H74D/Z8EkO+vy5eqcWvP4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4eda6a8cc12so54971951cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Dec 2025 08:43:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764693795; x=1765298595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yo/Q77iM2dxCsDJX0wSMsdkdBK/3CM2tnqmsgemQ55M=;
        b=DdelhgyVaLKYzIqdpN3WT7CtDGduWc9qsyK2+A5jO4PTGb6r1sKp5tPyD8sEo+Erzz
         LhrEaytbfywknvnkvYF7M18CrfHC7z+YPrvkIIFzWhF76vQVBfU4dwsvnNNlyyhCnbzX
         SsGtPhyX1x2oFuMpstg5E9+3tuuPBSM+wjD8UuLDuxBpcqt/JFE1bcGl2+BE99BdDJgZ
         apsbB3vbvD3GkHgVX+DVZfeqqNiEQzIRaR5KRfACL7CeL8JTI18YBRI67d6ub5ViPNfE
         sQrA4DjyUTl+ndqNPxQGNi+Ihu2p0bZXtQDGDztZHxL7q04K3y9bjY4U/2BXa15F3bvv
         4wug==
X-Forwarded-Encrypted: i=1; AJvYcCVYAmOFrrxltgS0QrEkUTWK+UpH801/Bmq5gc6u19MSHEa3H8dGb8bF+9lrY9c6F7u5nOTok55F4qRO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgx3rgHRPORTQ1AXcg5zXw82K1JJuZPRmEh6/H+wWx8JPkZ1+c
	7O5DYhouWmPBx+EriIYdxnVcGRYXP3sSkKv4xFLBlMoxa6QO33mmaq7F/B+kk6qu
X-Gm-Gg: ASbGncvN11P/DfzXiGLc1CpWAB02n3rQzEdTniZkxZyI/iYiRyZL13BsVC89xSO+sWA
	0vDVjmEESZNdQLzGYqFwClQJbDxIIYO703hhuVe0X77ShDUQk9r2REXbeddQ5R0IwZxw04A4Z8I
	J/eSu66/4TlMLQQM/AVTLjtvAEtRMp9e69aRZvF2lL1ZagFjIP2I8U3zTYRvUDVamneDticS2yN
	8mkSikaoVv7bKW+uZvz6hbBHOpzm96a7FyakrNotW/LsqUEnwQSZaB9xOZl+8ZSmK0OfAjp12cB
	kyHx2NGzAPHINWyXYTadY+YXQ6PqYUDz/Xvd+LrEUthk0f5lc3q3ggPwBfMQTXYbxriQdMjJ9TE
	c5Fv+xSL/HBBl5fkaFNKJ/UDTpMTQCFdh9OUBmgpbeyoxX2A//XAXqpkeDCXrCgoG////2NQHVN
	p+UMakVI3BGIzWhXFXCBp7vsgL3X9uRNO5FePFxY/u/0q2EdqliIV2
X-Google-Smtp-Source: AGHT+IEQsQfn+MrHjtGWNojqCcp5puGxEHvMF0EeX5KoJJdh429AmtfjLQPRwR9u9clikKQ0lARfqQ==
X-Received: by 2002:a05:622a:40f:b0:4ed:66bd:95ea with SMTP id d75a77b69052e-4ee58862c76mr613179701cf.29.1764693795337;
        Tue, 02 Dec 2025 08:43:15 -0800 (PST)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-886524e5cf0sm108490236d6.20.2025.12.02.08.43.15
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 08:43:15 -0800 (PST)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b1bfd4b3deso425856985a.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Dec 2025 08:43:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6MRRD2YuJqP+XVnVlZjruVKMXRyoKzXjntqmpBYwTJDRJgrjl6eT1vnxnaCRbLSFKklgYWT8oam/N@vger.kernel.org
X-Received: by 2002:a05:6102:3048:b0:5db:20ea:2329 with SMTP id
 ada2fe7eead31-5e1de370617mr15734527137.35.1764693347428; Tue, 02 Dec 2025
 08:35:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
 <20251015071420.1173068-2-herve.codina@bootlin.com> <f74ab0a2-b74b-4b96-8469-a716c850e230@gmail.com>
 <CAL_JsqJDOYuzutMHMeFAogd5a_OX6Hwi8Gwz1Vy7HpXgNeYKsg@mail.gmail.com>
 <5cf2a12a-7c66-4622-b4a9-14896c6df005@gmail.com> <CAL_JsqJjm12LxpDg6LmpY=Ro_keHwnrWiYMLVnG=s_pSP4X2WQ@mail.gmail.com>
 <072dde7c-a53c-4525-83ac-57ea38edc0b5@gmail.com> <CAL_JsqKyG98pXGKpL=gxSc92izpzN7YCdq62ZJByhE6aFYs1fw@mail.gmail.com>
 <55076f4b-d523-4f8c-8bd4-0645b790737e@gmail.com> <20251202102619.5cd971cc@bootlin.com>
In-Reply-To: <20251202102619.5cd971cc@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Dec 2025 17:35:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXogrkTAm=4pC0B+Sybr=PR3XovnBgmiEyTvUMmJHvBRA@mail.gmail.com>
X-Gm-Features: AWmQ_blh_df1oI4YfJoUHGn7ADOVOwmOm5bT6QJUN9usi3sbU4oWN1R6RdMkuuY
Message-ID: <CAMuHMdXogrkTAm=4pC0B+Sybr=PR3XovnBgmiEyTvUMmJHvBRA@mail.gmail.com>
Subject: Re: [PATCH v4 01/29] Revert "treewide: Fix probing of devices in DT overlays"
To: Herve Codina <herve.codina@bootlin.com>
Cc: Kalle Niemi <kaleposti@gmail.com>, Rob Herring <robh@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mark Brown <broonie@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Tue, 2 Dec 2025 at 10:26, Herve Codina <herve.codina@bootlin.com> wrote:
> On Fri, 28 Nov 2025 10:34:57 +0200
> Kalle Niemi <kaleposti@gmail.com> wrote:
> > >>>>>> Test system testing drivers for ROHM ICs bisected this commit to=
 cause
> > >>>>>> BD71847 drivers probe to not be called.
> > >>>>> This driver (and overlay support) is in linux-next or something o=
ut of
> > >>>>> tree on top of linux-next?
> > >>>>>
> > >>>>> Rob
> > >>>> Yes the driver is in mainline linux: /drivers/mfd/rohm-bd718x7.c
> > >>> I don't see any support to apply overlays in that driver.
> > >> Ah. Sorry for the confusion peeps. I asked Kalle to report this with=
out
> > >> proper consideration. 100% my bad.
> > >>
> > >> While the bd718x7 drive indeed is mainline (and tested), the actual
> > >> 'glue-code' doing the overlay is part of the downstream test
> > >> infrastructure. So yes, this is not a bug in upstream kernel - this
> > >> falls in the category of an upstream change causing downstream thing=
s to
> > >> break. So, feel free to say: "Go fix your code" :)
> > >>
> > >> Now that this is sorted, if someone is still interested in helping u=
s to
> > >> get our upstream drivers tested - the downstream piece is just takin=
g
> > >> the compiled device-tree overlay at runtime (via bin-attribute file)=
,
> > >> and applying it using the of_overlay_fdt_apply(). The approach is
> > >> working for our testing purposes when the device is added to I2C/SPI
> > >> node which is already enabled. However, in case where we have the I2=
C
> > >> disabled, and enable it in the same overlay where we add the new dev=
ice
> > >> - then the new device does not get probed.
> > >>
> > >> I would be really grateful if someone had a pointer for us.
> > > Seems to be fw_devlink related. I suppose if you turn it off it works=
?
> > > There's info about the dependencies in sysfs or maybe debugfs. I don'=
t
> > > remember the details, but that should help to tell you why things
> > > aren't probing.
>
> Rob reverted patches but I plan to continue my work on it.
> On my side, I need the reverted patches but I fully understand that, on
> your side, you need a working system.
>
> In order to move forward and find a solution for my next iteration, can y=
ou
> send your overlay (dtso) used in your working and non working cases?

Hmm, I must have missed when Rob applied (part of) this series, as I
do an overlay test (using the out-of-tree configfs) on top of every
(bi-weekly) renesas-drivers release, and saw no issues during the last
few months.

So I applied this series and tested loading my SPI EEPROM overlay.
And it indeed breaks, with the culprit being this particular patch.

Interestingly, quoting from this patch:

   "While the commit fixed fw_devlink overlay handling for one case, it
    broke it for another case. So revert it and redo the fix in a separate
    patch."

Where is the separate patch that redid the fix? I assume it is "[PATCH
v4 03/29] of: dynamic: Fix overlayed devices not probing because
of fw_devlink"?  Unfortunately that doesn't fix the issue for me.

Quoting more from this patch:

   "Closes: https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgy=
o8x6=3D9F9rZ+-KzjOg@mail.gmail.com/"

Strange that it claims to fix the issue reported there, as the failure
mode I am seeing is exactly the same as documented in that report?

Do you know what is wrong? The overlay I am using is referenced in
the bug report linked above.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

