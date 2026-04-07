Return-Path: <linux-gpio+bounces-34833-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNK1AZJH1Wk44AcAu9opvQ
	(envelope-from <linux-gpio+bounces-34833-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 20:06:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B94673B2B75
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 20:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C450302307C
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 18:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B718C3D1CD7;
	Tue,  7 Apr 2026 18:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8zxshHr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7409C3D090D
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 18:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775585158; cv=none; b=mx9My88f5gogdUNY2jM1m/VhrWtIbHcDLaKuidxo6oiMqO34uUmCydID4qbX7VF69sMkdqYlGjZLswrH8lWIxb2yHO9PZB3dqbjHc2zWqLGEe1qZPtML/NI9X08nh6SrlburM2hvqZrTRi0yH1N/aIZfOUA3VKBWEFft0+XJxGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775585158; c=relaxed/simple;
	bh=uFO0xP5YCzidCQEHhppwCpm47278XPfZ+3Ibhoo3yo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ah99qUpPLXsw9kXefVntihRNi4iVlFKRT632RE6/LQBKP1TBMVpROHCV5UBqxuXlpOPnOvFvcRn7qXSxxCxUhXiQiwjwSy1kPL+ypB3ur0TECE2dE/qYC801WC/WK3m+uaHz5Rz9/BQGzNu5QWWeFx6Yj1vWj6zc5aOpup9m7sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8zxshHr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E826C2BCB3
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 18:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775585158;
	bh=uFO0xP5YCzidCQEHhppwCpm47278XPfZ+3Ibhoo3yo8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=U8zxshHrIJ7nqH4SP+pcvwOTRW50fm15Ihcl1CeqNxAnFUo6k7LfIht57qhQk5syD
	 5BFzyX4cm3j2TwXVmkfbDm+r8dEVzV/ffp6OZkYundsFl/Y7AiAMVRMTUKJvX4JBJC
	 jEnGzxhKih1btRTpc3B3Dki+Q9NSWUvjnYa+leLacEVzPIww+b7Z9r3YACi//6I9or
	 arEloYyrYoNZVW1A+L0WpTc6pX8zk9tphjcttSGllR5Yj7zMrfg5PLJKG4wxAuZXTQ
	 8fbUh9YuL4J4AlBiltSA3kjuKFN8gSdMeOz1bUuTKE4aQXXqXO5ghPUnJN6UCHuG/b
	 R1Ezh5o3tvJYA==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b9841aecf72so769002966b.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 11:05:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+EAMI8IpCcMmBeGXWaPWLOojn37pQw5UDvaOS7X9ILfCHZQ8YR1g044f/ZZTQDZ8Aao61Sahnw44g@vger.kernel.org
X-Gm-Message-State: AOJu0YzkR+QFtM3dWpoGbjXvPT741TrAI+MmEEPiohkoyxOBqgkZ84jP
	eKqUPD1jo5rMcof882fxxnn5Z15/LB72ESLGz6rddker9CbYeg42WbFJ0vPOEdxcBfYwv8TKPnk
	TP+9hUqdjTnmP7bAyWSu9+jdgqtXqdQ==
X-Received: by 2002:a17:907:960f:b0:b9b:38d4:2cea with SMTP id
 a640c23a62f3a-b9c676c8812mr866811266b.23.1775585155532; Tue, 07 Apr 2026
 11:05:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325143555.451852-1-herve.codina@bootlin.com> <20260407180315.GA3175985-robh@kernel.org>
In-Reply-To: <20260407180315.GA3175985-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 7 Apr 2026 13:05:43 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+vuQba8kSfD7YvBADRMG2FVcWqTvJdsyAOZ3b2CPTUPA@mail.gmail.com>
X-Gm-Features: AQROBzDYXYYcVJxX1hhqK2Tcju9IchSU1-kXz0rhO9iaVymSVAahX9Zn0Xa7GiQ
Message-ID: <CAL_Jsq+vuQba8kSfD7YvBADRMG2FVcWqTvJdsyAOZ3b2CPTUPA@mail.gmail.com>
Subject: Re: [PATCH v6 00/27] lan966x pci device: Add support for SFPs
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kalle Niemi <kaleposti@gmail.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linusw@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>, 
	Shawn Guo <shawnguo@kernel.org>, Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,glider.be,gmail.com,linuxfoundation.org,nxp.com,pengutronix.de,baylibre.com,sang-engineering.com,axentia.se,arndb.de,google.com,opensource.cirrus.com,cirrus.com,linaro.org,linux.intel.com,stgolabs.net,huawei.com,intel.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,microchip.com,bootlin.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34833-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[62];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B94673B2B75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 7, 2026 at 1:03=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Mar 25, 2026 at 03:35:27PM +0100, Herve Codina wrote:
> > Hi,
> >
> > This series add support for SFPs ports available on the LAN966x PCI
> > device. In order to have the SFPs supported, additional devices are
> > needed such as clock controller and I2C.
> >
> > As a reminder, the LAN966x PCI device driver use a device-tree overlay
> > to describe devices available on the PCI board. Adding support for SFPs
> > ports consists in adding more devices in the already existing
> > device-tree overlay.
> >
> > With those devices added, the device-tree overlay is more complex and
> > some consumer/supplier relationship are needed in order to remove
> > devices in correct order when the LAN966x PCI driver is removed.
> >
> > Those links are typically provided by fw_devlink and we faced some
> > issues with fw_devlink and overlays.
> >
> > This series gives the big picture related to the SFPs support from
> > fixing issues to adding new devices. Of course, it can be split if
> > needed.
> >
> > The first part of the series (patch 1 and 2 ) fixes fw_devlink when it
> > is used with overlay. Those patches were previously sent by Saravana
> > [0]. I rebased them on top of v7.0-rc1.
> >
> > Also I added a call to driver_deferred_probe_trigger() in Saravana's
> > patch (patch 2) to ensure that probes are retried after the modificatio=
n
> > performed on the dangling consumers. This allows to fix issues reported
> > by Matti and Geert [2] with the previous iteration patches.
> >
> > Those modification were not sufficient in our case and so, on top of
> > that, patches 3 to 5 fix some more issues related to fw_devlink.
> >
> > Patches 6 to 11 introduce and use fw_devlink_set_device() in already
> > existing code.
> >
> > Patches 12 and 13 are related also to fw_devlink but specific to PCI an=
d
> > the device-tree nodes created during enumeration.
> >
> > Patches 14, 15 and 16 are related fw_devlink too but specific to I2C
> > muxes. Patches purpose is to correctly set a link between an adapter
> > supplier and its consumer. Indeed, an i2c mux adapter's parent is not
> > the i2c mux supplier but the adapter the i2c mux is connected to. Addin=
g
> > a new link between the adapter supplier involved when i2c muxes are use=
d
> > avoid a freeze observed during device removal.
> >
> > Patch 17 adds support for fw_delink on x86. fw_devlink is needed to hav=
e
> > the consumer/supplier relationship between devices in order to ensure a
> > correct device removal order. Adding fw_devlink support for x86 has bee=
n
> > tried in the past but was reverted [1] because it broke some systems.
> > Instead of enabling fw_devlink on *all* x86 system, enable it on *all*
> > x86 except on those where it leads to issue.
> >
> > Patches 18 and 19 allow to build clock and i2c controller used by the
> > LAN966x PCI device when the LAN966x PCI device is enabled.
> >
> > Patches 20 to 24 are specific to the LAN966x. They touch the current
> > dtso, split it in dtsi/dtso files, rename the dtso and improve the
> > driver to allow easier support for other boards.
> >
> > The next patch (patch 25) update the LAN966x device-tree overlay itself
> > to have the SPF ports and devices they depends on described.
> >
> > The last two patches (patches 26 and 27) sort the existing drivers in
> > the needed driver list available in the Kconfig help and add new driver=
s
> > in this list keep the list up to date with the devices described in the
> > device-tree overlay.
> >
> > We believe some items from the above list can be merged separately, wit=
h
> > no build dependencies. We expect:
> >
> >  - Patches 1 to 5 to be taken by driver core maintainers
>
> From a quick look, can't the first 2 DT patches be taken by me?

Err, I guess patch 2 is really more driver core than DT.

Rob

