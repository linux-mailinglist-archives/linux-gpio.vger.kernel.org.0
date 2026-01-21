Return-Path: <linux-gpio+bounces-30872-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOS6GxP0cGmgbAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30872-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 16:43:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC5359621
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 16:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E31367A0289
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 15:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED40D4C0427;
	Wed, 21 Jan 2026 15:05:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EB74C042E
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 15:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769007947; cv=none; b=FD2zT+GOwFXofOeeE0gc/spBOISOU6PUKTif+KrXWcUJSSKZ7Fb/0YmkRxYNNC/EUUeRpCbG58jmKYfbfaHwigqkh4LILGHePmjjI6Ctp2F/PS6a3Ms94ousmKXqM7HzWjf1lQiT7s+t7glw5jcC70+faYrBQWofkB5+0Xntkys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769007947; c=relaxed/simple;
	bh=VpzSOPPipZ7Wk3DVhXqnmZFKnblqi6knYh6FEjxvsEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TIRcrrEhZGKItjrSF+rXPiGGJAtBijUkBI0hqO/RT5I2g7JsTXb8oQJepAyRXpKdlah8E25H2EaroF5zES3g+FeT0cF82ZV4VRSRmNZ0Y4QnHRdKP6pCSFxLvmZfdLgoMe0JnvO/q1gTdjcb84LHsP4bwmRaRNzEoKBu4hFZzQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-502acd495feso53916351cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 07:05:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769007945; x=1769612745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AF6Iy9dgsc5sPND1gabv+P1umCdITLLVFz5zc76lNNw=;
        b=j7zZ8yUFa+ssdoUo7NDZ6AXZ7Cr2y43/x2BREq4+USJoOCC2OzdGULsZJslO8CM4N/
         OOS3h5TwWnwKC17z23WA9DIup1JSbuB3hKiRfL0xsiy4KQO6KGKduc2l/+WkvCND+zeC
         5LgZlfV+NbIkuzFiwg0bkWDxoO8aGHOnEAWiSFOmY4vT7IlNW+0KAu9m1ODfzWVNsbiS
         8pjBrQX2PDs6b3GuvxPtdvbWV5JQGXpDrVeKDrfiVQgahmtG7epcyiYKwFSgTYMzsGdb
         dmxyjbqgAUBNXZG6u9HFNvw6Dzjralh2UKbQ1GLSq60s4RLYi0gKyNjLgyn8srzD5wAu
         vLbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbJUO4Aou2ZQ4/w2fkOHLUbkecLtZUwJbeSzwvPDla1T4fRWJKxknAklprecTOjRVRf2Bgw3JJ11uE@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzt0K7C0pob2nF2Ld9B6hhLRyzdo9rqEqmChYLcL1nnhcA3QGs
	lAl8XjPY2mXeVTLTGZuH6x3Sz1gbnvhTzBvB/aMuVKuvhNP8/bp5mxVENLkafIRY
X-Gm-Gg: AZuq6aJRsZ62aUFXtLQw/nzLjk9OS4mxKgol8WB93wiGx8k4ySdHb3dk3HuCDrDXVdv
	Z7/DEViAYQGLUDpb91nv5zfWxPuTWkCX3fa3iLknUQRNKiIClsY/XacB6r89pEhlsoNvZcI/sY6
	GhsbnGQcG0NFOiuGmItN+PrAJKPVF9l+IS9gXKkUrsEwY/BExC4Ids92bjX4C6VAXaAkROokhEz
	LTQaJd0aIQihbZyF1VQmHqpAh8kGnSsuvgp7RfJvuPb/cpI38ENfe+YauAXPxvSRYDezHJweoxE
	alH2NN3hJTj/e/JQ1JjyuIovd1lj8suq5Ms1i6p/lBh0wZ2i+q46AdHvMLpvP7CgOZIxdAanlHC
	wundq7IifQpA1RYYzdUaaZQiXgcWFKjZzs4t8R3oYhfi48s+lYCkmrKqjxinA0lb5uXcur4zfd0
	L3tpGqwoEKz02BX2yuM2QXr2PeqssboPOsVCC2jdkHA5qB0Q/u
X-Received: by 2002:a05:690e:e8b:b0:647:fea:2955 with SMTP id 956f58d0204a3-649176d52bcmr13923278d50.25.1769000745396;
        Wed, 21 Jan 2026 05:05:45 -0800 (PST)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com. [74.125.224.48])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649170d35dfsm7758682d50.23.2026.01.21.05.05.45
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 05:05:45 -0800 (PST)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6467ac59e16so4778134d50.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 05:05:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW3qBe9NO2cxvOBqEPyVBz5WmI/p3AfG9NDt7eJR58A0szRqae1vYFYvYNmSPmKVMUU3aQkRQ7BcEy0@vger.kernel.org
X-Received: by 2002:a05:6102:3053:b0:5e5:66c6:d23e with SMTP id
 ada2fe7eead31-5f1a6fd7b8amr5292858137.1.1769000378213; Wed, 21 Jan 2026
 04:59:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
 <f74ab0a2-b74b-4b96-8469-a716c850e230@gmail.com> <CAL_JsqJDOYuzutMHMeFAogd5a_OX6Hwi8Gwz1Vy7HpXgNeYKsg@mail.gmail.com>
 <5cf2a12a-7c66-4622-b4a9-14896c6df005@gmail.com> <CAL_JsqJjm12LxpDg6LmpY=Ro_keHwnrWiYMLVnG=s_pSP4X2WQ@mail.gmail.com>
 <072dde7c-a53c-4525-83ac-57ea38edc0b5@gmail.com> <CAL_JsqKyG98pXGKpL=gxSc92izpzN7YCdq62ZJByhE6aFYs1fw@mail.gmail.com>
 <55076f4b-d523-4f8c-8bd4-0645b790737e@gmail.com> <20251202102619.5cd971cc@bootlin.com>
 <088af3ff-bd04-4bc9-b304-85f6ed555f2a@gmail.com> <20251202175836.747593c0@bootlin.com>
 <dc813fc2-28d2-4f2c-a2a3-08e33eec8ec7@gmail.com> <20251204083839.4fb8a4b1@bootlin.com>
 <CAMuHMdXdwf7La1EYBWTJadsTAJG3nKQVW6wtBn-bUqshA=XHRw@mail.gmail.com>
 <20251210132140.32dbc3d7@bootlin.com> <c50c40cc-69f6-436c-a94e-94a3a10f6727@gmail.com>
 <20251211132044.10f5b1ea@bootlin.com> <1b9fa77b-d74a-4fa7-b2e7-8b389d59a5a0@gmail.com>
 <20251211161902.11ef4248@bootlin.com>
In-Reply-To: <20251211161902.11ef4248@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Jan 2026 13:59:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWGk5ig3v9tGy1cMOg1LmKu3KrxQq2HO1vcQeZPuRxWBQ@mail.gmail.com>
X-Gm-Features: AZwV_QgoZry7Ux_LWaq66D8-Sle9_xFUD1BP9eHkYs41xWjINnCZsHwmSX1GiNQ
Message-ID: <CAMuHMdWGk5ig3v9tGy1cMOg1LmKu3KrxQq2HO1vcQeZPuRxWBQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/29] Revert "treewide: Fix probing of devices in DT overlays"
To: Herve Codina <herve.codina@bootlin.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, Rob Herring <robh@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Kalle Niemi <kaleposti@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-cxl@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Saravana Kannan <saravanak@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.24 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linaro.org,lists.infradead.org,lunn.ch,linuxfoundation.org,pengutronix.de,baylibre.com,sang-engineering.com,axentia.se,arndb.de,google.com,opensource.cirrus.com,cirrus.com,linux.intel.com,stgolabs.net,huawei.com,intel.com,vger.kernel.org,lists.linux.dev,microchip.com,bootlin.com];
	TAGGED_FROM(0.00)[bounces-30872-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[60];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,bootlin.com:email,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2CC5359621
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Herv=C3=A9,

Revisiting his old thread (sorry for the delay)...

On Thu, 11 Dec 2025 at 16:19, Herve Codina <herve.codina@bootlin.com> wrote=
:
> On Thu, 11 Dec 2025 15:52:28 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> > On 11/12/2025 14:20, Herve Codina wrote:
> > > On Thu, 11 Dec 2025 10:34:46 +0200
> > > Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> > > Do you see the same trace with:
> > > - "pinctrl-0 =3D <&i2c1_pins>;" in your overlay
> > > - fragment0 removed from the overlay (i2c1_pins definition removed fr=
om
> > >    the overlay.
> > > - i2c1_pins node defined in your base DT.
> >
> > Just tested. The i2c1 appears and the test-overlay probe gets called,
> > when the i2c1_pins is in the base-dt and not in the overlay.
>
> Geert, do you expirement same results?

Yes, after moving the pin control subnode from the overlay[1] to the
base DTS, the SPI bus and FLASH work after loading the overlay for
the first time.

> > > In other word, is the issues related to adding a pinctrl sub-node (pi=
nctrl
> > > pins definition) in the overlay or is it something else?
> >
> > Seems to be related to the pinctrl.
>
> I don't think that the issue is related to pinctrl itself.
>
> IMHO, I think the issue is related to overlays and fw_devlink.
> The distinction between "a new node is going to lead to a device" vs "a n=
ew
> node is just data and will never been attached to a new device" when an
> overlay is applied is broken.
>
> This is broken with the upstream "treewide: Fix probing of devices in DT
> overlays" commit I've tried to revert. Indeed, on the LAN966x PCI device
> use case devlinks created are not correct with this commit applied.
>
> I am not sure also that devlinks created with a more complex overlay will=
 be
> correct. For instance, Matti, with your overlay not sure that a phandle f=
rom
> the oscillator node referencing the pmic node will lead to a correct
> provider/consumer devlink between the pmic device and the oscillator devi=
ce.
>
> On the other hand, this is broken with "of: dynamic: Fix overlayed device=
s
> not probing because of fw_devlink" works for the LAN966x PCI device use c=
ase
> an lead to correct devlinks but breaks your use cases.

Loading my overlay[1] causes the following changes under
/sys/class/devlink/:

    + genpd_provider:ca53-cpu0--platform:e6e90000.spi ->
../../devices/virtual/devlink/genpd_provider:ca53-cpu0--platform:e6e90000.s=
pi
    + platform:e6055000.gpio--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6055000.gpio--platform:e6e90000.spi
    + platform:e6060000.pinctrl--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6060000.pinctrl--platform:e6e90000.=
spi
    - platform:e6060000.pinctrl--platform:keys ->
../../devices/virtual/devlink/platform:e6060000.pinctrl--platform:keys
    + platform:e6150000.clock-controller--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6150000.clock-controller--platform:=
e6e90000.spi
    + platform:soc--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:soc--platform:e6e90000.spi

Note that these changes are exactly the same in the working and the
non-working case.

Removing the overlay again removes all added links, but does not
restore the keys link:

    - genpd_provider:ca53-cpu0--platform:e6e90000.spi ->
../../devices/virtual/devlink/genpd_provider:ca53-cpu0--platform:e6e90000.s=
pi
    - platform:e6055000.gpio--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6055000.gpio--platform:e6e90000.spi
    - platform:e6060000.pinctrl--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6060000.pinctrl--platform:e6e90000.=
spi
    - platform:e6150000.clock-controller--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6150000.clock-controller--platform:=
e6e90000.spi
    - platform:soc--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:soc--platform:e6e90000.spi

Loading the overlay again causes no changes in the links, but the SPI
bus and FLASH always work.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drive=
rs.git/commit/?h=3Dtopic/renesas-overlays&id=3D383285b905a20d6734bfcbf7bcf7=
15c1c2b45395

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

