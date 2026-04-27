Return-Path: <linux-gpio+bounces-35612-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK7rBiG672knFQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35612-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 21:33:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B96C547954A
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 21:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 276093074114
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 19:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F84F41C311;
	Mon, 27 Apr 2026 19:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OOE7miFq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A3D3FBED2
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 19:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777318363; cv=none; b=IdJrvupxpL1ZyLkmr3INjIoZdYVoKghSiGvl+tRd/vMVRwZ55s565cFCb8VfonwPPL22y5PyZAVPHWz6B0l40F6bhy4EIvdiSaq/S3z+68IhyD9YiNA6Qvet4iqjWae89czs7t20WmOWvXpXKi9LsaVAnDTUUU5Yt7y4JzlaQP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777318363; c=relaxed/simple;
	bh=GcVXS9DHM5KxSH9pj/UKoe1HEQEMUMwCF6ORNHkDtWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eTLQh1/qc8oG73jL77C5b2ntrMGRH7lFjFuZ+gs8rx/L+WDuwpAf+cUpCVwYXhHc+j3oVFhim+OA9DZTaULmBM2Itn50iWg2BKbMdGz3ZriguC33D3wHvPX2fCceakkm1gHj2+i1dCLhK7AEYIzo9wf7sZAvcDNyFPzXdEdKti4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OOE7miFq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2405C4AF0C
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 19:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777318362;
	bh=GcVXS9DHM5KxSH9pj/UKoe1HEQEMUMwCF6ORNHkDtWY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OOE7miFq3mxasU1R85/vcilbMy/53K8jtyZ7HUsOiO4Oqvsbxd8FSMidIoQm43/jn
	 734CPhh9uggVwsTcRz9E2+HFDa8e/X3nIe3XYlthRdXp0EHuT55uIE+VaXHD4p/Nam
	 TkRPmmp/wN42yYCIfWJVQ4PsLY0m8ZSZhW57NnlUtymqhDWTZeroAM9uM4A1pqwUaG
	 lFIG1Jgr14IGn7lXYqjq3jsdfHzcbG5W6PBRV17v77HE/L/OCmw+kwULfGtIlSJ34b
	 8JqYb6JfQnjY9+CM8rqysaX2lcD3j09PrM3Y6G49rCAQ/rTMcdjKDjNYgdWJw7knI9
	 Vq2u2uIAgIPDw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38e8292423fso94122051fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 12:32:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+CoKdrFHvdeDriSGMknmLhE8k84nxWwMDy5MMawqdziaNSSa+pSBo4etK56WPrBdwaZWoWBiuq1z8I@vger.kernel.org
X-Gm-Message-State: AOJu0YxthI4FvvOj79K/xuKlnAiDvDo0vwwObeDve2FS+YeGUG1x/Thx
	9BC5Oy5RrHrJUZuSKibnvNN1op9ze8lKmPUD7d4kUlhhpkvOv65kJZziBM22ytf1Nk42J3TmoOP
	RAzV1yRYV+WUaCiC71Ol3zjzjHIATgyk=
X-Received: by 2002:a05:6512:1256:b0:5a3:e7d7:c67 with SMTP id
 2adb3069b0e04-5a7466035femr65340e87.5.1777318361178; Mon, 27 Apr 2026
 12:32:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-baytrail-real-swnode-v3-0-0003e4c1708c@oss.qualcomm.com> <20260427-baytrail-real-swnode-v3-2-0003e4c1708c@oss.qualcomm.com>
In-Reply-To: <20260427-baytrail-real-swnode-v3-2-0003e4c1708c@oss.qualcomm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 27 Apr 2026 21:32:28 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gR=wvgFomQzjS6rzoJYxwT2sxB60EM52PA4j-iwcXocw@mail.gmail.com>
X-Gm-Features: AVHnY4JhHwVpV2lDxM_tmrikNutREbg4Pf9PEzlXufNxh7vs1vpuoZx2mRT4OyE
Message-ID: <CAJZ5v0gR=wvgFomQzjS6rzoJYxwT2sxB60EM52PA4j-iwcXocw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] platform/x86: x86-android-tablets: enable fwnode
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
X-Rspamd-Queue-Id: B96C547954A
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
	TAGGED_FROM(0.00)[bounces-35612-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]

On Mon, Apr 27, 2026 at 2:19=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> In order to allow GPIOLIB to match cherryview and baytrail GPIO
> controllers by their firmware nodes instead of their names, we need to
> attach the - currently "dangling" - existing software nodes to their
> target devices dynamically.
>
> We deal with devices described in ACPI so set up a bus notifier waiting
> for the ADD events. We know the name of the device we're waiting for so
> match against it and - on match - assign the appropriate software node
> as the secondary firmware node of the underlying ACPI node. In case the
> event was emitted earlier than this driver's probe: also make sure the
> device was not added before.
>
> Scheduling fine-grained devres actions allows for proper teardown and
> unsetting of the secondary firmware nodes.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/platform/x86/x86-android-tablets/core.c | 127 ++++++++++++++++++=
+++++-
>  1 file changed, 124 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/pl=
atform/x86/x86-android-tablets/core.c
> index 021009e9085bec3db9c4daa1f6235600210a6099..9e6e8f272dfe16cda421b5698=
02045c3d94fc0ab 100644
> --- a/drivers/platform/x86/x86-android-tablets/core.c
> +++ b/drivers/platform/x86/x86-android-tablets/core.c
> @@ -13,10 +13,12 @@
>  #include <linux/acpi.h>
>  #include <linux/device.h>
>  #include <linux/dmi.h>
> +#include <linux/fwnode.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio/machine.h>
>  #include <linux/irq.h>
>  #include <linux/module.h>
> +#include <linux/notifier.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/serdev.h>
> @@ -360,6 +362,124 @@ static const struct software_node *cherryview_gpioc=
hip_node_group[] =3D {
>         NULL
>  };
>
> +struct auto_secondary_data {
> +       struct notifier_block nb;
> +       struct device *parent;
> +};
> +
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
> +static int acpi_auto_secondary_notifier(struct notifier_block *nb,
> +                                       unsigned long action, void *data)
> +{
> +       struct auto_secondary_data *auto_sec =3D container_of(nb, struct =
auto_secondary_data, nb);
> +       const struct software_node *const *swnode;
> +       struct device *dev =3D data;
> +       int ret;
> +
> +       switch (action) {
> +       case BUS_NOTIFY_ADD_DEVICE:
> +               for (swnode =3D gpiochip_node_group; *swnode; swnode++) {
> +                       if (strcmp((*swnode)->name, dev_name(dev)) =3D=3D=
 0) {
> +                               ret =3D acpi_set_secondary_fwnode(auto_se=
c->parent, dev, *swnode);
> +                               return ret ? NOTIFY_BAD : NOTIFY_OK;
> +                       }
> +               }
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return NOTIFY_DONE;
> +}
> +
> +static void auto_secondary_unregister_node_group(void *data)
> +{
> +       const struct software_node **nodes =3D data;
> +
> +       software_node_unregister_node_group(nodes);
> +}
> +
> +static void auto_secondary_unregister_notifier(void *data)
> +{
> +       struct notifier_block *nb =3D data;
> +
> +       bus_unregister_notifier(&acpi_bus_type, nb);

Please introduce acpi_bus_unregister_notifier() and use it here instead.

> +}
> +
> +static int auto_secondary_fwnode_init(struct device *parent)
> +{
> +       const struct software_node *const *swnode;
> +       struct auto_secondary_data *data;
> +       int ret;
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
> +       data =3D devm_kzalloc(parent, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       data->nb.notifier_call =3D acpi_auto_secondary_notifier;
> +       data->parent =3D parent;
> +
> +       ret =3D bus_register_notifier(&acpi_bus_type, &data->nb);

Please introduce acpi_bus_register_notifier() and use it here instead.

> +       if (ret)
> +               return ret;
> +
> +       ret =3D devm_add_action_or_reset(parent,
> +                                      auto_secondary_unregister_notifier=
,
> +                                      &data->nb);
> +       if (ret)
> +               return ret;
> +
> +       /* Device may have been already added. */
> +       for (swnode =3D gpiochip_node_group; *swnode; swnode++) {
> +               struct device *dev __free(put_device) =3D
> +                       bus_find_device_by_name(&acpi_bus_type, NULL, (*s=
wnode)->name);

Please introduce acpi_bus_find_device_by_name() and use it here instead.

> +               if (dev) {
> +                       ret =3D acpi_set_secondary_fwnode(parent, dev, *s=
wnode);
> +                       if (ret)
> +                               return ret;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
>  static void x86_android_tablet_remove(struct platform_device *pdev)
>  {
>         int i;
> @@ -391,7 +511,6 @@ static void x86_android_tablet_remove(struct platform=
_device *pdev)
>
>         software_node_unregister_node_group(gpio_button_swnodes);
>         software_node_unregister_node_group(swnode_group);
> -       software_node_unregister_node_group(gpiochip_node_group);
>  }
>
>  static __init int x86_android_tablet_probe(struct platform_device *pdev)
> @@ -427,9 +546,11 @@ static __init int x86_android_tablet_probe(struct pl=
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
> 2.47.3
>
>

