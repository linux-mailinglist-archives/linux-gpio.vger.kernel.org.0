Return-Path: <linux-gpio+bounces-31179-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id q6zhCg4heWm7vgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31179-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 21:33:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 237DE9A5DD
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 21:33:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BCC6302E902
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 20:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7952FDC37;
	Tue, 27 Jan 2026 20:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UenXtg0H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7A22135D7
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 20:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769545992; cv=none; b=afT2GMlxksJiTyQpvjIAecEl64HcVJsXUwdq1aSzCK7qaJc7T47estPOePgkCNc+FVthZiUp5fkJNQHYLcTVnQBYpqdaapTvF4mgDIEdJqF1Ize3s5Ip0eQRNgpLkBNnlH0tRIkfxjBP3vk6/KJgk5DWjpKdxRCK/l5+oNELqa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769545992; c=relaxed/simple;
	bh=xRBVbS79QYoJBWjyLZhkqZ+QeffyspKgfvBxjH45YH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pUAf31wbG197UzKTj11+VRTMhy/79Uf5DafQIFW5q4FuEGS/cN9GAunrarR2+/C/bsElZwXc+IbQZzOtXlK6d6MwYF1jk23xQnRTQORXI02bZfclCPcaeBq5WxBN9sIowLhsck8q7krZM8VwSiq231gLhju3r0Ch0ggpM/NT8Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UenXtg0H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD53FC116C6
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 20:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769545991;
	bh=xRBVbS79QYoJBWjyLZhkqZ+QeffyspKgfvBxjH45YH4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UenXtg0H34aAl8tmmcKIFrZILglkeGYXV6+i530uPqcnDxOX0mFVXHsJoiVcWxWp1
	 oEMVhN9Y62njCDhzyf/M14kDN39dfHO9bEaytJhCIFyBdj+g54z7QUuuUdxPm+TgP1
	 uIcZ7M/VcAiE3/G8gb9DFbCO8uYKnanceF+bqfH0UBc/TodzlzcWPaTUI+jgkFhjfM
	 1JAtbjTh3AxZF9pK7VatXwLfwxZPsDDURRjqY21S1ArbbE+rMSS14Hgx0o5ZoUaWOB
	 SL4xK2DpiCxU0BZZQ1vhw4zxAdNyDZRhbbsx7zkv47SobMC3nH2LnmEq4nTTUL/5KM
	 RL+t5lMy0qgGg==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6610b05b37dso4883625eaf.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 12:33:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVAJunygTH1lFqkqf2kb2c/T0KcQHnm1FwEyjt1v/Ds/1HszTrq7VPEtYs2PXB4azmBY4/3kn1mr4Ea@vger.kernel.org
X-Gm-Message-State: AOJu0YxY7G0jOu/JNl/bjyRDK1fRX81P46RUVRDSd1p1a2oR7ABTdULh
	P6KlptKwnciFYgQuO4o0X24qsTCMd4Zpb4qU+GJYdTacA1ED7PLCRa7/TcnuZevXGd5ePKRW9F7
	7eS7hFDha4t9fY9CWP3X+S+/0ORQ6l1I=
X-Received: by 2002:a05:6820:4b85:b0:65f:54c7:3c5f with SMTP id
 006d021491bc7-662f203b51emr2100743eaf.24.1769545990855; Tue, 27 Jan 2026
 12:33:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127201725.35883-1-dakr@kernel.org>
In-Reply-To: <20260127201725.35883-1-dakr@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 27 Jan 2026 21:32:59 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hwJB_tYd=sgT2jPm94ypXdEhj0wuGtdOg+TZDRCocVJw@mail.gmail.com>
X-Gm-Features: AZwV_Qj9YAA_prmGKyJDi3TuK9JQuFTSH_BVTfMHVlFVfJ39PRvLmioDDYdThFg
Message-ID: <CAJZ5v0hwJB_tYd=sgT2jPm94ypXdEhj0wuGtdOg+TZDRCocVJw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: omap: do not register driver in probe()
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, broonie@kernel.org, 
	will@kernel.org, grygorii.strashko@ti.com, ssantosh@kernel.org, 
	khilman@kernel.org, linusw@kernel.org, brgl@kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31179-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 237DE9A5DD
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 9:17=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Commit 11a78b794496 ("ARM: OMAP: MPUIO wake updates") registers the
> omap_mpuio_driver from omap_mpuio_init(), which is called from
> omap_gpio_probe().
>
> However, it neither makes sense to register drivers from probe()
> callbacks of other drivers, nor does the driver core allow registering
> drivers with a device lock already being held.
>
> The latter was revealed by commit dc23806a7c47 ("driver core: enforce
> device_lock for driver_match_device()") leading to a potential deadlock
> condition described in [1].
>
> Additionally, the omap_mpuio_driver is never unregistered from the
> driver core, even if the module is unloaded.
>
> Hence, register the omap_mpuio_driver from the module initcall and
> unregister it in module_exit().
>
> Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/=
 [1]
> Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_d=
evice()")
> Fixes: 11a78b794496 ("ARM: OMAP: MPUIO wake updates")
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  drivers/gpio/gpio-omap.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> index e136e81794df..e39723b5901b 100644
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -799,10 +799,13 @@ static struct platform_device omap_mpuio_device =3D=
 {
>
>  static inline void omap_mpuio_init(struct gpio_bank *bank)
>  {
> -       platform_set_drvdata(&omap_mpuio_device, bank);
> +       static bool registered;
>
> -       if (platform_driver_register(&omap_mpuio_driver) =3D=3D 0)
> -               (void) platform_device_register(&omap_mpuio_device);
> +       platform_set_drvdata(&omap_mpuio_device, bank);
> +       if (!registered) {
> +               (void)platform_device_register(&omap_mpuio_device);
> +               registered =3D true;
> +       }
>  }
>
>  /*---------------------------------------------------------------------*=
/
> @@ -1575,13 +1578,24 @@ static struct platform_driver omap_gpio_driver =
=3D {
>   */
>  static int __init omap_gpio_drv_reg(void)
>  {
> -       return platform_driver_register(&omap_gpio_driver);
> +       int ret;
> +
> +       ret =3D platform_driver_register(&omap_mpuio_driver);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D platform_driver_register(&omap_gpio_driver);
> +       if (ret)
> +               platform_driver_unregister(&omap_mpuio_driver);
> +
> +       return ret;
>  }
>  postcore_initcall(omap_gpio_drv_reg);
>
>  static void __exit omap_gpio_exit(void)
>  {
>         platform_driver_unregister(&omap_gpio_driver);
> +       platform_driver_unregister(&omap_mpuio_driver);
>  }
>  module_exit(omap_gpio_exit);
>
>
> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
> --
> 2.52.0
>

