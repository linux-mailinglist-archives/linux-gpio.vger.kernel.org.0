Return-Path: <linux-gpio+bounces-36199-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDRyFTrm+Wl1FAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36199-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 14:44:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDC94CDCFE
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 14:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC8673038BAA
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 12:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B621F436371;
	Tue,  5 May 2026 12:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3mrubft"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D59842E01A
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985048; cv=none; b=ttOA5d6cxnDFh7j+twxGbLjUJydpkEyVceResuo1LGMb5nsxymIMTk11WOHuOxctaVJiZUVVdhA4IHPmZstv8uMfYNi4WZ0lbLR1asX5nPRZNbdSOTUYPb90YdWgvrUYSlH1QDA/MNLU/BXfCk7E2jEiIUKDFLe43HaMmHrQuDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985048; c=relaxed/simple;
	bh=C5keBJkPYx5ZgoWalnHhunPGrhbaZ7oanxcpIt+4S58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XLTP6hNWU4U6Jkbdq1vDZrvxUOJNzH9niXw+K5ZwMxb7HEPn9r4uCogN5FvK3vkyLok4ZL7CFJXSxddEGZZ8mBRcHH0HX/PcIu92WbwQdyC1xWoaK19Jx8KilC7XW5xMBPepy4WhmnmDgsXsidpTiJG84L1UG3YK+HDFrIiS7uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3mrubft; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2894FC2BCFF
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777985048;
	bh=C5keBJkPYx5ZgoWalnHhunPGrhbaZ7oanxcpIt+4S58=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n3mrubftJoorIZKutX4S1zhhjIuNHUvJlv7rUoNqJLfRGuJ+bKO8lNjMtCMFfLL3m
	 bDrJUr3ZhYnAC7yadKg6EhYl1QG/SuDDODEetH1XMNHYQo9COZaLkbHUPDFp8I2oqI
	 MoDYf1pp4imRyN6cTL6JnbT/vEoKy9wJTSoW8kyLRapxaBGok9fhfo2a2D39HmqfeF
	 T1lTBJ8QUkoAY15u83/6TDGaaSpa3zuj6Yom3Vktq3BwUh4FZimgUdef0gjTO75c73
	 NzYYRykj7q/fddMWbB0wAMh+OZhGXTUZjjxhDmKmnIF0yWtRYrqAxlqSte4PgF5yhm
	 ZZnge9oTbVNBg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38e97e73234so50380301fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 05:44:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ82uqtyR02GHGZsC8dmTuk9ZVXKxcqid7W/u7hPp87nq0A/vs112r2u+hcOH5C9Ugs3sxOUavpQ3Zas@vger.kernel.org
X-Gm-Message-State: AOJu0YyhVUUFrvBOkPBjqN0ljcM//T4NLeQSZrwqtj8nbx4jZ4ffcVgI
	GNywv7IqmEzRvhFbLCsDOpy6c05m3wEnuxWzDFTPenGByMAGCJ32FA53kXHSe+RU+uNX9caYGbi
	8YCn+W61jxiFvirEPVNoupc3D0R1gkrU=
X-Received: by 2002:a05:6512:3b8e:b0:5a4:10b5:624c with SMTP id
 2adb3069b0e04-5a8631bad70mr4316816e87.23.1777985046764; Tue, 05 May 2026
 05:44:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504124155.3615001-1-khristineandreea.barbulescu@oss.nxp.com> <20260504124155.3615001-7-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260504124155.3615001-7-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 14:43:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLnOGUOW7e_cp+LTD-U1aAP++8bw4QNLwRPWRnne=3fnvg@mail.gmail.com>
X-Gm-Features: AVHnY4LINDdQBuzYyWghNyWztXZnz__yCp4RhcwGAtZR-JFeHZU18RDafo6lElg
Message-ID: <CAD++jLnOGUOW7e_cp+LTD-U1aAP++8bw4QNLwRPWRnne=3fnvg@mail.gmail.com>
Subject: Re: [PATCH 6/7] pinctrl: s32cc: implement GPIO functionality
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: ACDC94CDCFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36199-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,nxp.com:email]

Hi Khristine,

thanks for your patch!

On Mon, May 4, 2026 at 2:42=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>
> Add basic GPIO functionality (request, free, get, set) for
> the existing pinctrl SIUL2 driver since the hardware for
> pinctrl&GPIO is tightly coupled.
>
> The updated SIUL2 block groups pinctrl, GPIO data access
> and interrupt control within the same hardware unit.
> The SIUL2 driver is therefore structured as a monolithic
> pinctrl/GPIO driver.
>
> This change came as a result of upstream review in the
> following series:
> https://lore.kernel.org/linux-gpio/20260120115923.3463866-4-khristineandr=
eea.barbulescu@oss.nxp.com/T/#m543c9edbdde74bdc68b6a2364e8b975356c33043
>
> Support both SIUL2 DT layouts:
> - legacy pinctrl-only binding
> - extended pinctrl/GPIO/irqchip binding
>
> Also, remove pinmux_ops which are no longer needed.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

This looks good, but if you're overhauling the regmap handling,
have you taken a look at the gpio-regmap library?

select GPIO_REGMAP
#include <linux/gpio/regmap.h>
git grep gpio_regmap_config <- yields examples

Yours,
Linus Walleij

