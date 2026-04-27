Return-Path: <linux-gpio+bounces-35611-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YM7mEre472kbEQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35611-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 21:27:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5B44793FB
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 21:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14833302C6C0
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 19:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682543BADA3;
	Mon, 27 Apr 2026 19:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/jJwlKR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B713D47BC
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 19:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777318064; cv=none; b=MVDlOUXQ78/SraxfTyjDdenz56odMtNj86/rl3C9/jmJ4CQ6InPqblLZd+CIDrKm0WkBZwNCulA+Bx1IAUNp7IpVRb1Yp2UqIGHBL7ns3Zf4nxUr9s57tnGdS4WFCNzuH4doxvfT199H02BUf3Jd3jEPOKeRh/abEaneEuD6GKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777318064; c=relaxed/simple;
	bh=HqYLELgj98iLA7JW98UYBb5EDteJRAkKjyhwdcgbrnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kLTf73ZZMxJE4mTSsdmygv0AiIqK5nuH1gPA6QkiVY5Lcbk3hANcUwKyHoVzpVGvBPZk1SyOTjzJTvY3WM5G9MpSSNNOZgQbU+eRH6r4QI8hB7eRTtVtg/xWkx8m7qU4Gr+7Z5ybn7f+tUDGQabdIc8r9b/XjhoWEF88txwp/AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/jJwlKR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22643C2BCB5
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 19:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777318064;
	bh=HqYLELgj98iLA7JW98UYBb5EDteJRAkKjyhwdcgbrnY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f/jJwlKR+tprJBeHbdJVFSTFctYV+Ihh1TUQpqLLra6tK3LYYaCg3T4XDG9vnq58U
	 2IY3W1MTlIbS597tiPv5sQMb91acSAemtGo1aXPA0fSECaJ2PzRQTPNeCvwVYr47Jd
	 UbDO3W/vWXaEe/vQNlzKGntOhbMsqhlWUJlmuXYkz0juK/3+W5T/AXHXpwG5eHH6Kr
	 RdkiFAFaTOm7unXD09Y3jH2ZUYTUp1FqThR/rIg+X+SpblAUy39GTM+auZL26sHrWH
	 dMefqwCrp3Gg7E36zc2DDm3ZshsdILsEG+YzrNRq01qOO/4KFV84q0qcQeGT7b3iLY
	 o2fezb9Zx8ESA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a283c44478so16781980e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 12:27:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+SPah7Gdp52Kh3DuZhxUz5nDzSlH2M6e1VztZR1LbuH5iVaKco77hLUZf42B+2Kj7PZFBvYoPCxgX3@vger.kernel.org
X-Gm-Message-State: AOJu0YyPYHHULQyGgZfD2PdLA/htuNHlCWbUuAg9JbHpLJSXb0tmq7H0
	bX837pgqK851oFQIOo7AixyhJUDAT3hseEATq9XX0sWg9bIvMNxk/wz9RkwzfSq/6EI1mBWJlFv
	+upnfEa09B/YxwZg0nfb5HV8lDhmfSTo=
X-Received: by 2002:a05:6512:1324:b0:5a3:f25f:cc30 with SMTP id
 2adb3069b0e04-5a74662a830mr53832e87.32.1777318062377; Mon, 27 Apr 2026
 12:27:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-baytrail-real-swnode-v3-0-0003e4c1708c@oss.qualcomm.com> <20260427-baytrail-real-swnode-v3-1-0003e4c1708c@oss.qualcomm.com>
In-Reply-To: <20260427-baytrail-real-swnode-v3-1-0003e4c1708c@oss.qualcomm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 27 Apr 2026 21:27:30 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jv0W=rQXdzLMaMX+xfB2sHbCpQ1921uttyxq6sSsUxBw@mail.gmail.com>
X-Gm-Features: AVHnY4IfDf6M6rzg8a33EYrpiqMEOqTHPOfn9RqnuEXGKZqArxjU7nfpk8B2uYU
Message-ID: <CAJZ5v0jv0W=rQXdzLMaMX+xfB2sHbCpQ1921uttyxq6sSsUxBw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ACPI: bus: export the acpi_bus_type symbol
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: EB5B44793FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35611-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

On Mon, Apr 27, 2026 at 2:19=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> In order to allow loadable modules to access the ACPI bus type struct,
> export the relevant symbol.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/acpi/bus.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> index 2ec095e2009e40b0645f654fb051429e5679dc7c..d4da76607905473de2e25e503=
52450c10f598784 100644
> --- a/drivers/acpi/bus.c
> +++ b/drivers/acpi/bus.c
> @@ -1174,6 +1174,7 @@ const struct bus_type acpi_bus_type =3D {
>         .remove         =3D acpi_device_remove,
>         .uevent         =3D acpi_device_uevent,
>  };
> +EXPORT_SYMBOL_GPL(acpi_bus_type);

Not really (and I've already said that I think).

Please find a different way.

>  int acpi_bus_for_each_dev(int (*fn)(struct device *, void *), void *data=
)
>  {
>
> --

