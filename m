Return-Path: <linux-gpio+bounces-33324-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCWjKuncs2mzbgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33324-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 10:46:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6B0280B5C
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 10:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5AB83166FF1
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 09:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCCD377030;
	Fri, 13 Mar 2026 09:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CVJB0EpM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17463093BB
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 09:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773395054; cv=pass; b=uEkRY6HBvCEUAWgurOKfK9sNspoijWfKLv55M2JR0gC+1jonkYzZlgHUDp5gEopfiUaMVQLqJ1vQ1vXAUdDFyVS0ZoQuQfwZ7rNLSGCC2OLQJvwCIicGb3AOTd/JwLlKN4tfccBiQcA30Aoc9KMMxhfPGcufCbY8DfHYlLGqh3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773395054; c=relaxed/simple;
	bh=a4PkyDJIX7KyCPscZwhkhXLXTwGONJMI97/AnswuOLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJwRIsodF7yAI3IQW36KAecCVC0jwdbp02uEtSJdZshuqLIcxsE9JMiMgRuynCayi1JYW8EjMCuFZsj2znWc+kOai6Nhg/ahx6MLzLkfEo/ku9pvK9rnBneIg82zMJcomLnc8qA0VEd9d2tVc2SfPnKJ2cUsnNHFMJiVZrV34R4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CVJB0EpM; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a107b387a5so2608505e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 02:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773395051; cv=none;
        d=google.com; s=arc-20240605;
        b=WER8dd7dMh22GYrKRdWG4411MA4Gf+2VhojqR8ymCWCW8gvVKLhkX3xfxfUOCLazqR
         gYU6vhCvhHHWHgrINeAuOzwd8SesoMTnFCPWY2b03DOWqnu8LH+xzvR5dXTJO0UcxgiT
         E4eZR+kE1w9e98J4gzKScvNkIPjLV9SG7toXwAmV6h70KiEQGxS/lYFLqCqCoSuOzx/y
         B+rb68/SwQmHTfYyLm9kxXj+N3Jmw/C/n6rKrdi363N1gLulsnkd8HY+O/t0vQkxGJCr
         bHx7pqYL871Z0q7Mg3i/2tNaGO7iUEsKsDvzhxaWfToq/ODQq8QNJPTEZGGixLSj6vnM
         gw3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zhNoTkJIeGg7k6SX7++UNulbkoe8PKd3t4WsYSulIm0=;
        fh=Vtt8gDeYfU0gH4sVvfAuOR8H4V0W/mF/wf3zpHsiuvA=;
        b=X35OlWDd64yq4wxiIMLo+FGv+FWJohbn2XpUOn0IEdIzdNQqF9/+whSFComzCF24Kw
         EIy0nJOSGMfL5fkSrxHkssqxQcYgJ8d/h8VqtK5AszHihucyIk0mQoT+xGAmhsQdjSAy
         7eMAK1fv+/qX4/lcuAaQP4D9Glj/QwCMVgfb1nfSc86CxH+DlY12/DDIaiV3UbvFUfYd
         tFeq2CpcLOsXbw5oeybybzTkjbLU4hWkbrmZ1gHe1PxnUz1i9LavhTrRoUaDuLZ+jYMa
         c6NwC1NJodLvdKuqx4zMdpidwrXgmm7S8UYKDiYigunOEk0AmMvXvXtEoQ0vCr178crR
         7A7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773395051; x=1773999851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhNoTkJIeGg7k6SX7++UNulbkoe8PKd3t4WsYSulIm0=;
        b=CVJB0EpMEVa6sLzbpbpZgC6oxzg2jOtTdosOr5xZNtsl8bsqrxagaYbJB1fdwaFsDi
         MU38WYuy9AWHvdgCpCuHaIpr0k74xYGQOeELdWDSwcfyzs8cqYkIXiRIRrqyxiibpEVP
         wMrz3HxyzbyPSSjmSzWbKbBJgizyZo+BgjwH4r+2CXA44MTS6E41EE0YnfUJRp2yUitr
         rl9LQ9jslbZWwEoeHXtCnBIpFBQl7bMUoyyvJJ1DVrzW8G12l73vTupZQjGfuJkAAf20
         jQIIgy05OQGFnn5ib4SoM+EKD7qPNjwSuIvoucoWtcAxJOQaShYcNfKbcoRIEG60ZMKr
         agpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773395051; x=1773999851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zhNoTkJIeGg7k6SX7++UNulbkoe8PKd3t4WsYSulIm0=;
        b=QCtejG/IwhIPrJPd8tS3yPsvMiXUIK6U7nFURt9rniyx+oZphiZ0a4/KRJjJvGpUiG
         WgGrWarTooO7ye0NkJEdsfy7atnoSuRTS+htlkjOKsSccKUqQs7ZKTwKHzz8zzeeKaK1
         /cDxqRvII8J+9IkfTo3q8v1oGzwA3umlACJHeedPKHcfSmno61rMFYJvqtRliXH8dCp2
         YTlfiB7INn66JrFUhg3AfX574bDcRuhUKEkUMphftFmXbSLUthmEc06rAjiFBSybPs31
         Nn4esr9KDm7cURw9iymiRXBlGiAMMMCPF1Pz1wF2lkJDXQG0gJL33/5gBySfkX1an+nV
         qbCw==
X-Forwarded-Encrypted: i=1; AJvYcCXzz/YwUliudt3fwEzDKE/NPtu181QyhOzAkbMfwN61MIWNNqSJJjx34sWQ5fT3HCrtrxPKQ3W2HLoA@vger.kernel.org
X-Gm-Message-State: AOJu0YyyjpPDENapP9knHqmXWyhE1qQQeKQsG/JVdNCMdPddNbwwczZE
	IYcV+911kTCJ1WhYjw0H+B6lOA32X1CaqsRvG9LDWydq2FESuF6T193omW++eDm/oLtKXvH/KBL
	Kcnswf0+1D7j3PnmhCQ1U7HqCfqZp8C8/E3/OKZxpfA==
X-Gm-Gg: ATEYQzwoiqSAYCmLHoPzSoUuXDMWEvdgsnz5zAiLMC/eTlmqzYfRb4x9ZrV/E62nkF1
	TYu8ko1nxuMwTNG6CwL07F+E+rxkKfCRQXrijns7xKEunQkESWtU4UzZ2qOlkTmxEpXG8lKJQtT
	PUymQ4rFOI8e9uxaiiU3ieXIGfBadIW92xZ2Gnu7xx0PxdNHWdEVutwxrOOLESbHN7XbJjBdYRz
	YknpONW6Q97mbqW+snDdu7eBPUVKUYlOObEoFdGYmE6zwHky3TeXfUYLu9Dw6/O81JMWJeUfI5K
	xBhZB2k4
X-Received: by 2002:a05:6512:1589:b0:5a1:381b:fae2 with SMTP id
 2adb3069b0e04-5a162b0d32fmr863539e87.33.1773395050576; Fri, 13 Mar 2026
 02:44:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227135428.783983-1-herve.codina@bootlin.com>
 <20260227135428.783983-3-herve.codina@bootlin.com> <CAMuHMdVVsEB-xb8Jz4ujBam2NxtxAOb7byYa3VR_eHsbTD5rXw@mail.gmail.com>
 <2026031242-debug-aviation-19b8@gregkh>
In-Reply-To: <2026031242-debug-aviation-19b8@gregkh>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 13 Mar 2026 10:43:33 +0100
X-Gm-Features: AaiRm535RzzFrlMRqNsLHd1XM8yzn674dd-38MKB2CsmserIvJfHsK0fUYGtRYw
Message-ID: <CAPDyKFpX3A3r4s72PNjBz5QaZUsq1xaGhn5vXwegue7Tyh_Zew@mail.gmail.com>
Subject: Re: [PATCH v5 02/28] driver core: Rename get_dev_from_fwnode()
 wrapper to get_device_from_fwnode()
To: Herve Codina <herve.codina@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kalle Niemi <kaleposti@gmail.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linusw@kernel.org>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-m68k.org,lunn.ch,kernel.org,gmail.com,nxp.com,pengutronix.de,baylibre.com,sang-engineering.com,axentia.se,arndb.de,google.com,opensource.cirrus.com,cirrus.com,linux.intel.com,stgolabs.net,huawei.com,intel.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,microchip.com,bootlin.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-33324-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[64];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linuxfoundation.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email,linaro.org:dkim,linaro.org:email,intel.com:email]
X-Rspamd-Queue-Id: 4A6B0280B5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 12 Mar 2026 at 16:27, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 10, 2026 at 04:03:42PM +0100, Geert Uytterhoeven wrote:
> > Hi Herv=C3=A9,
> >
> > On Fri, 27 Feb 2026 at 14:55, Herve Codina <herve.codina@bootlin.com> w=
rote:
> > > get_dev_from_fwnode() calls get_device() and so it acquires a referen=
ce
> > > on the device returned.
> > >
> > > In order to be more obvious that this wrapper is a get_device() varia=
nt,
> > > rename it to get_device_from_fwnode().
> > >
> > > Suggested-by: Mark Brown <broonie@kernel.org>
> > > Link: https://lore.kernel.org/lkml/CAGETcx97QjnjVR8Z5g0ndLHpK96hLd4aY=
SV=3DiEkKPNbNOccYmA@mail.gmail.com/
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Reviewed-by: Saravana Kannan <saravanak@google.com>
> > > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
> >
> > FTR, one more user of get_dev_from_fwnode() appeared in commit
> > 9035073d0ef1de81 ("reset: convert reset core to using firmware nodes")
> > in reset/next.
>
> Ick, that's going to make this hard to land anywhere.  This is a rough
> series, perhaps it should be split up to make it easier somehow?
>
> thanks,
>
> greg k-h

I fully agree with the above. Renaming the function isn't necessary
for the $subject series.

I suggest we simply drop this patch from the series - and if the
renaming really makes sense in the end, we can deal with that
separately later on.

So withdrawing my ack from this one.

Kind regards
Uffe

