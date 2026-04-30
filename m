Return-Path: <linux-gpio+bounces-35864-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBNLDQQp82mwxgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35864-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:03:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBD84A0729
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 62CCA3006451
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 10:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6701B3FB7C2;
	Thu, 30 Apr 2026 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fbm7bm/t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2648A3ACA42
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777543425; cv=none; b=I/bJa6XJ6TIXanwD6ipatXpWlRxLdHUwPtoSVg+lI5X3vbEMmWEXt3vu7nzAMH7qc+76IZHkNa0qq9dbZkkEC52d4OKJKoyMOTHfJAO0yrM6Yv5GJakvq6HmXRUH5WUO2H8pnYKlu/LkoPlW1d+/ZB/qwCUVHw5HyY1bX3jGftU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777543425; c=relaxed/simple;
	bh=24SUM8XNpgpD/jIkyrnqaESV6KB3r9PWuq9baM/oPwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KC7MLsvfY5oLiDLIolinxp0CpZfNGSQ6GLoF0bOBV0lTEw288W4uyI+ya9yki7+HlGffworcbWEZNV3Hhejq6tG+x4GHlujNDzZn55iPRxlDbptJ4QT+LJl2GDqt20svZI5iIYSylfZbLnedqcoKJCin8YXpZROwIVEoVyE78+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fbm7bm/t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09CCC2BCFB
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 10:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777543424;
	bh=24SUM8XNpgpD/jIkyrnqaESV6KB3r9PWuq9baM/oPwY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Fbm7bm/t+vu34+9t7voUW+wOOxbMCkLpxRdCIh99peme7yF2xulZ4cKP5EXb+2VzC
	 Na+wpuETQ5x14dQJBJzo7rvklFJzOPeGYHO8rl0LUk8cZ3Uzib9TxhE658iCRzfM5f
	 mq4oOK/NZeuMww+eKDCVvZz3ZbP1dEuRZ2S4kz++hJmsEb0UfGLGNdDfqGxQFRrL+t
	 dF0jNT3lrD7+4/Zl52hk+xHKr4EFZL/wQMaoUU+LlYmZxuJ2eGnghCkj7+6XVm3R+M
	 4EOmrnHGa6rhUqo4kt8iAEg+4pVCob+Dsyc0S5UR8W7FDyp/+q5oBig5vcpNJuc6IH
	 M8CvFJxUuPTwg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a40cfab24dso821642e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 03:03:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8QWNZSPgr5z4ARdl+bX/bH4JofGDPM2OhGHa8/r48dqd96aVN5mYE+PcBuxUOqlrTucp6FxakgSNNY@vger.kernel.org
X-Gm-Message-State: AOJu0YxpdVtELf+Fn2earRMYCgMZbz70rtfK2DwYI/bmx4zu7nbjH8E4
	RWjKbYJI2zcvYTXkR/kdUci5GgmNsHT+UOVLrySt7X4F/O9fuiLSjWgs9b3n+m+34hRgNGqx7fs
	a42npvL7sY7XEWXjDk+VOKj49CanYJB8=
X-Received: by 2002:a05:6512:10cb:b0:5a4:157:5354 with SMTP id
 2adb3069b0e04-5a8522bc5ffmr780440e87.12.1777543423188; Thu, 30 Apr 2026
 03:03:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-baytrail-real-swnode-v4-0-767bcda6667f@oss.qualcomm.com> <20260430-baytrail-real-swnode-v4-2-767bcda6667f@oss.qualcomm.com>
In-Reply-To: <20260430-baytrail-real-swnode-v4-2-767bcda6667f@oss.qualcomm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 30 Apr 2026 12:03:30 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hs98RHqZxcMjsnQDB5JJ2gKQGG6c38y3vR3WO1aLgf3w@mail.gmail.com>
X-Gm-Features: AVHnY4LRkqUG78amCXaKPu70AEG71fakKJrwqW9j-y8MndL15_3hAR17pY87BOk
Message-ID: <CAJZ5v0hs98RHqZxcMjsnQDB5JJ2gKQGG6c38y3vR3WO1aLgf3w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] platform/x86: x86-android-tablets: enable fwnode
 matching of GPIO chips
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
X-Rspamd-Queue-Id: EDBD84A0729
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35864-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]

On Thu, Apr 30, 2026 at 9:34=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> In order to allow GPIOLIB to match cherryview and baytrail GPIO
> controllers by their firmware nodes instead of their names, we need to
> attach the - currently "dangling" - existing software nodes to their
> target devices dynamically.
>
> The driver uses platform_create_bundle() and expects all required
> providers to be present before it itself is probed. We know the name of
> the device we're waiting for so look them up and assign the appropriate
> software node as the secondary firmware node of the underlying ACPI node.
>
> Scheduling fine-grained devres actions allows for proper teardown and
> unsetting of the secondary firmware nodes.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

I may have missed something subtle, but overall it looks reasonable to me, =
so

Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  drivers/platform/x86/x86-android-tablets/core.c | 78 +++++++++++++++++++=
+++++-
>  1 file changed, 75 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/pl=
atform/x86/x86-android-tablets/core.c
> index 021009e9085bec3db9c4daa1f6235600210a6099..8fd0cffe351577182f31c90c1=
04b616cec78c481 100644
> --- a/drivers/platform/x86/x86-android-tablets/core.c
> +++ b/drivers/platform/x86/x86-android-tablets/core.c
> @@ -13,6 +13,7 @@
>  #include <linux/acpi.h>
>  #include <linux/device.h>
>  #include <linux/dmi.h>
> +#include <linux/fwnode.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio/machine.h>
>  #include <linux/irq.h>
> @@ -360,6 +361,76 @@ static const struct software_node *cherryview_gpioch=
ip_node_group[] =3D {
>         NULL
>  };
>
> +static void auto_secondary_unset(void *data)
> +{
> +       struct fwnode_handle *fwnode =3D data;
> +
> +       fwnode->secondary =3D NULL;
> +}
> +
> +static int acpi_set_secondary_fwnode(struct device *parent, struct devic=
e *dev,
> +                                    const struct software_node *const sw=
node)
> +{
> +       struct acpi_device *device =3D to_acpi_device(dev);
> +       struct fwnode_handle *fwnode;
> +       int ret;
> +
> +       fwnode =3D software_node_fwnode(swnode);
> +       if (WARN_ON(!fwnode))
> +               return -ENOENT;
> +
> +       fwnode->secondary =3D ERR_PTR(-ENODEV);
> +       device->fwnode.secondary =3D fwnode;
> +
> +       ret =3D devm_add_action_or_reset(parent, auto_secondary_unset, &d=
evice->fwnode);
> +       if (ret)
> +               dev_err(parent, "Failed to schedule the unset action for =
secondary fwnode\n");
> +
> +       return ret;
> +}
> +
> +static void auto_secondary_unregister_node_group(void *data)
> +{
> +       const struct software_node **nodes =3D data;
> +
> +       software_node_unregister_node_group(nodes);
> +}
> +
> +static int auto_secondary_fwnode_init(struct device *parent)
> +{
> +       const struct software_node *const *swnode;
> +       int ret;
> +
> +       if (!gpiochip_node_group)
> +               return 0;
> +
> +       ret =3D software_node_register_node_group(gpiochip_node_group);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D devm_add_action_or_reset(parent,
> +                                      auto_secondary_unregister_node_gro=
up,
> +                                      gpiochip_node_group);
> +       if (ret)
> +               return ret;
> +
> +       for (swnode =3D gpiochip_node_group; *swnode; swnode++) {
> +               struct device *dev __free(put_device) =3D
> +                               acpi_bus_find_device_by_name((*swnode)->n=
ame);
> +               if (!dev) {
> +                       dev_err(parent, "Failed to find the required GPIO=
 controller: %s\n",
> +                               (*swnode)->name);
> +                       return -ENODEV;
> +               }
> +
> +               ret =3D acpi_set_secondary_fwnode(parent, dev, *swnode);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  static void x86_android_tablet_remove(struct platform_device *pdev)
>  {
>         int i;
> @@ -391,7 +462,6 @@ static void x86_android_tablet_remove(struct platform=
_device *pdev)
>
>         software_node_unregister_node_group(gpio_button_swnodes);
>         software_node_unregister_node_group(swnode_group);
> -       software_node_unregister_node_group(gpiochip_node_group);
>  }
>
>  static __init int x86_android_tablet_probe(struct platform_device *pdev)
> @@ -427,9 +497,11 @@ static __init int x86_android_tablet_probe(struct pl=
atform_device *pdev)
>                 break;
>         }
>
> -       ret =3D software_node_register_node_group(gpiochip_node_group);
> -       if (ret)
> +       ret =3D auto_secondary_fwnode_init(&pdev->dev);
> +       if (ret) {
> +               x86_android_tablet_remove(pdev);
>                 return ret;
> +       }
>
>         ret =3D software_node_register_node_group(dev_info->swnode_group)=
;
>         if (ret) {
>
> --

