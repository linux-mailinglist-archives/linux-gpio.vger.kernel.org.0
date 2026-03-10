Return-Path: <linux-gpio+bounces-33029-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GrQCog5sGlbhQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33029-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 16:32:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7CD253974
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 16:32:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B687433E979B
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 15:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B49309F08;
	Tue, 10 Mar 2026 15:04:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688B53043CF
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 15:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155054; cv=none; b=kjO2aXrorVdXvD0owp+d32JwD2FHryHfuHusABLHOYGafJ7k+76Vr1gflvCX0rdGtoMGUoefLigLckRk+6NpLPH+Ef5LYnzYMy8YPBsEd0ItpONcq4+rnYz6kVAcs/ZNC51oT2jo9hewegY2S/CslYZOjHfDRX57AFWltSy74xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155054; c=relaxed/simple;
	bh=QEW3lhhJANPdrCVBmAIqH1dXUDPD23689ylzZ5dnJco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PSVYpLjJATZzsQ1iSs6RryUN+qfXu5OZufCczOOsQZqtDDhzL4c20OebEpzvP++x5TC68e/dGAhWLiqelolP+yJdzh61bOVJwg+nMdUqXvidjG8n2b7sztbF2NtXRV0xM03zfbeVn1ip2Jcv9TvV3SjVwQWzbAUgO/pftil4N+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5ffd57b6fc6so1134445137.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 08:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155049; x=1773759849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ru18n38/qbgrYN5XhGLEd0K3IukQ/mw6D37X8x0z/qo=;
        b=THY9S0l3ptaEPD5At88r2hFwySH7J8nY4UlR5jhISNXMQez8jqd0dsn+bt1iNcLayJ
         8zselzGJpjM7bUjca4bjTViQiXQM65JfEGFqEX3yYUnk1nIOBeiayP17Teo0OxIMfNCi
         qxDQHVFTCJiX7BhWfpJ6LPJjqGhnxT+uTqHWjYftH0t62idZFcRHUZpxHthIqkljf9KI
         Np3m0ssM7usrkEjjEtrxELIp6t0v8LXyCcqTa6vjouILTAwwTzIh2h6vTBgKWgMTZ8zH
         unAItsOA2f3Q/kuBZ6B17hnBUiyJWsZDmdAF+2KxsjMTZ6zLCr7V8o0apXCcdGJk8QnJ
         zddA==
X-Forwarded-Encrypted: i=1; AJvYcCVABAVeMVP3BFgIelpE6CYcH8z0tmxhOgATcm5dfki74HD9ikhgpIwSryvqdTdgrt5oq/0AkpnjIsG5@vger.kernel.org
X-Gm-Message-State: AOJu0YzRmzBHyZRqncWSvNRv4USiWs3L55oAHUAQbx45px1htyyaTHb3
	SocT9lptG+Y1iiI4Yg4xUtSmfgdpIZJVJ3e714g4Mrwe2SpX//vW3eDPRrLX3p59
X-Gm-Gg: ATEYQzygJFmlCP1bddCnMS7+FQlkF7xspKvcTv3g28PwKcEog5rvAmDrPoreU19k+XK
	LTENBVaDAeOM+vvr+HfwfUbvD4xWXzdHf3X2lBkUj1FKYDpfCouNFenA4AYADp7l0yT/bneeQT1
	9+e16ArDt1+4bZcElImlKut2PrP1pqkxqFxpD5xmkOaX0EWMgiEsLsfE0nzSBnDk/4zXNDeR+A9
	prldr4JCYxJCOZDyYNa+XsoO0ZglYd4R2soVVJT5Olfds0855FlgwF7hIewoduEK7lsWKZzUWI+
	cOX7eKw22FREaOhEPWdAyYZCa4cN6H47LIo60hcGyRFcueTUbvTdfMTjHwl5CA9fHd9k33vE++F
	eYSVCX0AROM+n7C/eilQyrZSKkkL/67D8Rr5kQ7MN9DbjSSM5KCNGUFtxT8EBzPCI5adiVS/M1I
	GopZkQiiDKLrgps9PikVVdm1niiidmEi/Yj4/rboNU7KittrkzeeOgVjifl1Gl
X-Received: by 2002:a05:6102:40d8:10b0:5ff:f4ae:a17b with SMTP id ada2fe7eead31-5fff4aeb84cmr3139946137.7.1773155040150;
        Tue, 10 Mar 2026 08:04:00 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94e7b520673sm9694457241.10.2026.03.10.08.03.58
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 08:03:58 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ffc1e25d6cso1435083137.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 08:03:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWeuRTTR4DUoS6O6zhR3HR9XKu6KIQQCkpYte3qL0iw6fojHFqmrxbU0HHFbYwhtbWF3lRTGtBwcc/@vger.kernel.org
X-Received: by 2002:a05:6102:c8f:b0:5f1:70fe:3027 with SMTP id
 ada2fe7eead31-5ffe6121c90mr5181206137.24.1773155033187; Tue, 10 Mar 2026
 08:03:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227135428.783983-1-herve.codina@bootlin.com> <20260227135428.783983-3-herve.codina@bootlin.com>
In-Reply-To: <20260227135428.783983-3-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Mar 2026 16:03:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVVsEB-xb8Jz4ujBam2NxtxAOb7byYa3VR_eHsbTD5rXw@mail.gmail.com>
X-Gm-Features: AaiRm53b7liJL7XJhyMA-JPl81LkjhC0Orfn04kAcG7__Cf3-wDY5cIOlphhcC4
Message-ID: <CAMuHMdVVsEB-xb8Jz4ujBam2NxtxAOb7byYa3VR_eHsbTD5rXw@mail.gmail.com>
Subject: Re: [PATCH v5 02/28] driver core: Rename get_dev_from_fwnode()
 wrapper to get_device_from_fwnode()
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
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7F7CD253974
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,gmail.com,linuxfoundation.org,nxp.com,pengutronix.de,baylibre.com,sang-engineering.com,axentia.se,arndb.de,google.com,opensource.cirrus.com,cirrus.com,linaro.org,linux.intel.com,stgolabs.net,huawei.com,intel.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,microchip.com,bootlin.com,oss.qualcomm.com];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33029-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.856];
	RCPT_COUNT_GT_50(0.00)[64];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Herv=C3=A9,

On Fri, 27 Feb 2026 at 14:55, Herve Codina <herve.codina@bootlin.com> wrote=
:
> get_dev_from_fwnode() calls get_device() and so it acquires a reference
> on the device returned.
>
> In order to be more obvious that this wrapper is a get_device() variant,
> rename it to get_device_from_fwnode().
>
> Suggested-by: Mark Brown <broonie@kernel.org>
> Link: https://lore.kernel.org/lkml/CAGETcx97QjnjVR8Z5g0ndLHpK96hLd4aYSV=
=3DiEkKPNbNOccYmA@mail.gmail.com/
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Saravana Kannan <saravanak@google.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

FTR, one more user of get_dev_from_fwnode() appeared in commit
9035073d0ef1de81 ("reset: convert reset core to using firmware nodes")
in reset/next.

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

