Return-Path: <linux-gpio+bounces-35368-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGjQKagJ6Wm1TQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35368-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 19:47:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A745544964D
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 19:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BBDC73007AEF
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 17:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FCC155C82;
	Wed, 22 Apr 2026 17:45:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F5D37EFF3
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 17:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776879909; cv=none; b=P+utFtZucGbEXc3vqcekGq9Ks2H/xp6Ql9RsuiHJfFaUaSodzamjEx/oJi3jRlsRkaDWo6nr7H8DidRpERhQOdZOnmhAjDgfv4I9w/nEpq10R71igxYYWelwbSo6j8jHSYyHOWDD1b7W5m178+HjuOT6hEoIrSiIH1tBy/RRfT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776879909; c=relaxed/simple;
	bh=PEC67Z72ISCMHUutb9qe1/Y1CIJmRcte33AN4p2R2vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qdnjePBl0m685KCrxgAeE+2eglSs3CITo5+dMGuYofZIGI8BiXZeLE9C6LewVj79eef8lOVxLia5iGXfyL1JaX9S5Yvskx8T72pYeAJhbKXei9XG7P660QoYBxNlfUxOibL9kYPraeHf1HJlkeTdX9mqSm9r0f9aw9mlTZwMo6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38eab6cf7d8so55734241fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 10:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776879906; x=1777484706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XycB5P8XTGXaeVGqnVmOVfspQ1laZv9fkJpPGtynpSA=;
        b=iBdrE2Vny3ZAY8BRNmox4iZXS+swHykPKskLkO3vkrVHiD24XsOfoHlw2ZvHd08Mcc
         H5rGcbfq1f7TN5EleRLHqpCxr7HWqd6X2/R6YKyjdRq4En1JYxf8VOVPo4htZqJ0Iq6T
         XlWXneDUb4VC0AC4D2ZFHJVZXbvCbJ8Gw0LAdPsU/EQH9lwYILrCAnVFwj3C9PsoW3I5
         eFcBtsNGEwhzMOro1G2y4Cztb+FMFlMJECU02DxDpn6AraoKmGMP7+EiTBWI5/nT4bY6
         AhWamq693RT+vQT/4ka8XhHW8ZwaYJU6JxAwcdbMhTE3aCdiLIliiU9KW4jFqisYF2+V
         AqQA==
X-Forwarded-Encrypted: i=1; AFNElJ93fT6dP5k4wHbg8xUBnZW83LR6WYS5pdW5N1X/3YxLpDWTCs8faDGhmCq/L7L52haeP/UVWos5g8o4@vger.kernel.org
X-Gm-Message-State: AOJu0YxZMDc9Z8ETjktyer1xc1m0r7Lw3ZjbpYn4prhW4+9+fQN/F2s5
	dpP3iOJlQHj5WO3eCK/3lKVyhrVu5r1z7BctyDCG/bly0noZSnE3jlvD/kxWXj3vi2w=
X-Gm-Gg: AeBDieuIH8dpj0/S2SP1ThtWqcBRRoOM7l/tYO/9mjEGNkSRnQDbgx9GuUmizF7jlH0
	Wy8UnC+zy1iK6+kh3PQaJbeBeSIYKRj5TCW7y0z7mhpLU6qv5/YulF6U6Gizp9guMnQIzWmYPPF
	bI3eIqF7rhIRALNfsnTHAa4l4Q2UPlJHquz0OG9f3gU4D/XjYbXbISxDwyamvg1gYSL4SGTpIu6
	5jHZx7gi2BAfVlBrLFj2AcqH7AMzfkjKav2ay5c9efImMdybEnrPaCTtue4wqFnsY1ojIJ5WpyG
	VUbhvtL8jf3VWrjt/sJP36VFNG4hFRBWEyyPX7kcHVVFlDHWx6JmbEDEw9LxkWpGBJNzuqttSlY
	O5wE8WOgMzrsQ7nF/c7z/Z1GkPYsr9tDLBmLlegROxZANOxQx+AIAD+bk83xoWrBL6CU3yIq9oV
	jzVs4GbDfqnICBmFPweb367CBPbisTmQKYfDK2S1oCPdc5jJlorMVXZ3l4OhitNZFVDnn7rRdWs
	B8=
X-Received: by 2002:a05:651c:440a:10b0:38e:8760:2922 with SMTP id 38308e7fff4ca-38ec7adb81bmr60668231fa.18.1776879905945;
        Wed, 22 Apr 2026 10:45:05 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f64ebsm34889001fa.10.2026.04.22.10.45.04
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 10:45:05 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38e8292423fso50539601fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 10:45:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/XwLJvT/xnTeP+8nLzjk8poVwUZXOBMfAENjE9GpOjz4zOhpxjBDUZV/B1TxIJ9qBHM0hEMUkg5dpf@vger.kernel.org
X-Received: by 2002:a17:907:7295:b0:ba7:3d21:c136 with SMTP id
 a640c23a62f3a-ba73d3108d8mr812474966b.18.1776879429078; Wed, 22 Apr 2026
 10:37:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325143555.451852-1-herve.codina@bootlin.com> <20260325143555.451852-3-herve.codina@bootlin.com>
In-Reply-To: <20260325143555.451852-3-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 19:36:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU7x7LWFkD9xiq+wyOqnn0bdzr+JLfvbBexoiWyv8kftA@mail.gmail.com>
X-Gm-Features: AQROBzDRSuCo9KZmmr5oDnyHv4O1KWNwiPD4Dqbl5BIkN4nUOYnL3G8AwjYfgqE
Message-ID: <CAMuHMdU7x7LWFkD9xiq+wyOqnn0bdzr+JLfvbBexoiWyv8kftA@mail.gmail.com>
Subject: Re: [PATCH v6 02/27] of: dynamic: Fix overlayed devices not probing
 because of fw_devlink
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Saravana Kannan <saravanak@google.com>, 
	Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,gmail.com,linuxfoundation.org,nxp.com,pengutronix.de,baylibre.com,sang-engineering.com,axentia.se,arndb.de,google.com,opensource.cirrus.com,cirrus.com,linaro.org,linux.intel.com,stgolabs.net,huawei.com,intel.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,microchip.com,bootlin.com,chromium.org];
	TAGGED_FROM(0.00)[bounces-35368-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[64];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-m68k.org:email,glider.be:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A745544964D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Herv=C3=A9,

CC Douglas

On Wed, 25 Mar 2026 at 15:36, Herve Codina <herve.codina@bootlin.com> wrote=
:
> From: Saravana Kannan <saravanak@google.com>
>
> When an overlay is applied, if the target device has already probed
> successfully and bound to a device, then some of the fw_devlink logic
> that ran when the device was probed needs to be rerun. This allows newly
> created dangling consumers of the overlayed device tree nodes to be
> moved to become consumers of the target device.
>
> Fixes: 1a50d9403fb9 ("treewide: Fix probing of devices in DT overlays")
> Reported-by: Herve Codina <herve.codina@bootlin.com>
> Closes: https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8=
x6=3D9F9rZ+-KzjOg@mail.gmail.com/
> Closes: https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
> Closes: https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Link: https://lore.kernel.org/lkml/20240411235623.1260061-3-saravanak@goo=
gle.com/
> [Herve: Rebase on top of recent kernel]
> [Herve: Add the call to driver_deferred_probe_trigger()]
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Tested-by: Kalle Niemi <kaleposti@gmail.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -235,6 +235,79 @@ static void __fw_devlink_pickup_dangling_consumers(s=
truct fwnode_handle *fwnode,
>                 __fw_devlink_pickup_dangling_consumers(child, new_sup);
>  }
>
> +static void fw_devlink_pickup_dangling_consumers(struct device *dev)
> +{
> +       struct fwnode_handle *child;
> +
> +       guard(mutex)(&fwnode_link_lock);
> +
> +       fwnode_for_each_available_child_node(dev->fwnode, child)
> +               __fw_devlink_pickup_dangling_consumers(child, dev->fwnode=
);
> +       __fw_devlink_link_to_consumers(dev);
> +}
> +
> +/**
> + * fw_devlink_refresh_fwnode - Recheck the tree under this firmware node
> + * @fwnode: The fwnode under which the fwnode tree has changed
> + *
> + * This function is mainly meant to adjust the supplier/consumer depende=
ncies
> + * after a fwnode tree overlay has occurred.
> + */
> +void fw_devlink_refresh_fwnode(struct fwnode_handle *fwnode)
> +{
> +       struct device *dev;
> +
> +       /*
> +        * Find the closest ancestor fwnode that has been converted to a =
device
> +        * that can bind to a driver (bus device).
> +        */
> +       fwnode_handle_get(fwnode);
> +       do {
> +               if (fwnode->flags & FWNODE_FLAG_NOT_DEVICE)

After commit f72e77c33e4b5657 ("device property: Make modifications
of fwnode "flags" thread safe"), this must be changed to:

    if (fwnode_test_flag(fwnode, FWNODE_FLAG_NOT_DEVICE))

With this change my DT overlays are working again.

I guess keeping the FWNODE_FLAG_* names, but changing their values
from bit masks to bit numbers was probably not such a good idea,
as it fails to catch missing conversions...

> +                       continue;

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

