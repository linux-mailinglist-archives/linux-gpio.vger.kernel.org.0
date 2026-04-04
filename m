Return-Path: <linux-gpio+bounces-34667-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP2oALhX0WmFHwcAu9opvQ
	(envelope-from <linux-gpio+bounces-34667-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Apr 2026 20:26:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 612C839C076
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Apr 2026 20:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F7EE300B77C
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Apr 2026 18:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D00336EE1;
	Sat,  4 Apr 2026 18:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dasMaZUC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70CC3375D5
	for <linux-gpio@vger.kernel.org>; Sat,  4 Apr 2026 18:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775327156; cv=none; b=rlglZrtsmQJFy8k1R9NAe/iaSvNKsRdLA+YgmeBH7Dgw2Yy7/yNpdJkrELTlAwbsfRbQI/eN/biRiOPZ0mfwnO0Q2OE7WGu2ksPX7VrlrRz9sG/fCUio1RKjRZzMR0auicizaC9n3oK4eJDygkc5m3SbJlmDX2hLK/sIjtQdLb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775327156; c=relaxed/simple;
	bh=HmVC8HG22vzlAHr9b9ZKLVJ7JJhmrXnAN67usYKy5N8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TMbX78TLoczr1nH8VC8fcor99Hc23FO9tUqD4s3RddRMT2lPL4rSi7+zrdbtIQgc5a/GeidLBLL0S4rXILwijH8N7+SUe5e6H39Kp1W6BMh4UM8HfAHBO44xrDhOaLThbnftitfZDDb+Ak8EXyyncljJMWPrWRny+FPVfib2jjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dasMaZUC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E93C19421
	for <linux-gpio@vger.kernel.org>; Sat,  4 Apr 2026 18:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775327156;
	bh=HmVC8HG22vzlAHr9b9ZKLVJ7JJhmrXnAN67usYKy5N8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dasMaZUC5EkFDx2TKERqqeWNVyhb4oojm4rJGiJ9uG9TX2ZtFQD2I1hVwM+pTTTrd
	 9tPcYq+2jwV0Qivdi9fSOJW6BeFkNIwz+X1QGStle9Jw6Zevcu64IRjVvjOAPHPivn
	 JRjZdFuXb/Ihk1ZohNIu78gmuMMCX517ZR6hfp2EDq1NqgdHS0tGD3fwuQ774gCwjq
	 rlIUxqgfdfTT/Wrs3C5Dja7FvXcNICUQ0YDPqsLK/ZdVwZtVbciurRWtyLwaOllJkt
	 Q06x1xz4ukp6eVZWok518Fas4+/dsxqW8QOr+84yLM3ODguMdz/+qWwXjfrl8VuMsJ
	 +GC4opymnJkPA==
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-470145d7df5so749438b6e.0
        for <linux-gpio@vger.kernel.org>; Sat, 04 Apr 2026 11:25:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVb5MP9s7gpdUj8cvcwG5KKNQ60G6XVIDg+VFtZwaDBg2uQuqD8JXMreucc1Y1yWBm1r/8hAaXFDWjt@vger.kernel.org
X-Gm-Message-State: AOJu0YxQE/R0GJqeZjmA/zYtv1/UHhjDWLiU1/UsFcfI2pjOgosRrp4K
	dRDaHi/B/0PMoQCyGDLec96jePGCfXb3J+hEGSWnCVhhKJ89MK8lljCCiJU4YBilXbLK7Ym28g9
	6RIKAYpbkrc2pMoEamITtrhRwHMGwin4=
X-Received: by 2002:a05:6870:21d3:b0:417:3421:13ff with SMTP id
 586e51a60fabf-4230ff4f728mr3820411fac.29.1775327155442; Sat, 04 Apr 2026
 11:25:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com> <20260402-baytrail-real-swnode-v2-4-6f5054a4cc07@oss.qualcomm.com>
In-Reply-To: <20260402-baytrail-real-swnode-v2-4-6f5054a4cc07@oss.qualcomm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sat, 4 Apr 2026 20:25:43 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iwfZPcFtM7Jv29bXFmh3zN0OaG9UfNY5iC5RpzRzp07w@mail.gmail.com>
X-Gm-Features: AQROBzD6YmXrnAzgz9aL6fqWq1iOyolotQRnTtrF6brMuNKBBNGJLMNRaP4UCiA
Message-ID: <CAJZ5v0iwfZPcFtM7Jv29bXFmh3zN0OaG9UfNY5iC5RpzRzp07w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] platform/x86: x86-android-tablets: enable fwnode
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34667-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 612C839C076
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 2:54=E2=80=AFPM Bartosz Golaszewski
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
> +}

Instead of exporting acpi_bus_type in the previous patch and defining
this function here, can you define

void acpi_bus_unregister_notifier(void *data)
{
       struct notifier_block *nb =3D data;

       bus_unregister_notifier(&acpi_bus_type, nb);
}

in the previous patch and use it here?

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

