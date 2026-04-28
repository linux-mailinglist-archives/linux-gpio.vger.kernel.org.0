Return-Path: <linux-gpio+bounces-35669-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOUmDZZ78GkaUAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35669-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:19:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D06C481395
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7003130371FF
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 09:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706D02FF675;
	Tue, 28 Apr 2026 09:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TfLq+sHl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257422DE70D;
	Tue, 28 Apr 2026 09:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367772; cv=none; b=LBq5Szs1mRmq2tPGXG2RKuUushk7i32pNoBdEYwMGG/2BFT4ccY03cOWRjQ/mELmA5edc1pBNcLBi81MaD3TEWnYGCtFUvqsLfMCN15ET3/72xYiIcbWSJMMb+21lHF1SY9XTk4aqqxc3kPiYsg76KWB59gGjyQDOe0u8cfy/e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367772; c=relaxed/simple;
	bh=d7nQyxp5R2nQ8E6FB8Ki2Z4lRNOguQ70LNdUnV0Y47c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e/ZpZveZ1ro7Ut5fkj4HrXOiKqzu4+ecKC7pkJkikMwB89FVizPExUlUezofIniCS9vAGXE2c495NIW7LewxsFM6hiKabCb4vmc779+IBeoGryDqChxOSDQDtzns4tr7JbytGXByvxS+rLVeGCCVaotNKRJfl3Fwc7Bu/EPr2Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TfLq+sHl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B6FCC2BCB5;
	Tue, 28 Apr 2026 09:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777367771;
	bh=d7nQyxp5R2nQ8E6FB8Ki2Z4lRNOguQ70LNdUnV0Y47c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TfLq+sHle2bK5m59V+E5xC2OT1UwN5LVcljCK98cxtqpsmSAcR6bt2xwxxfEkwSA4
	 m+zXVMfxtYQ0TEaDOCJFUIw/+QHSrAfP9hUWJBHG3AiL1KbozRk4N2PM2y/uqddab/
	 62BPzczJn3KLa/08tONykbIC0Dcy25x+wu9C2y+CW2WwsIlAtxTu6TB+zKEzHDEtHf
	 uQs4IONZZX/68ue3WVllwON8NqhYQjn42flebgIddMZ71rs6a6kRGhspnY7hp95HkW
	 3sa7D1ph5fLHWnQsvJlQp7s+NUzWqeAF1H7axxLJJetQ40+ueuCtJiqHjrJ2LhetCS
	 1IaOW5TQYNhsg==
Message-ID: <f100e787-f45a-4d72-9664-a75b1181763e@kernel.org>
Date: Tue, 28 Apr 2026 11:16:06 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] platform/x86: x86-android-tablets: enable fwnode
 matching of GPIO chips
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, brgl@kernel.org
References: <20260427-baytrail-real-swnode-v3-0-0003e4c1708c@oss.qualcomm.com>
 <20260427-baytrail-real-swnode-v3-2-0003e4c1708c@oss.qualcomm.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260427-baytrail-real-swnode-v3-2-0003e4c1708c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1D06C481395
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35669-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.intel.com,gmail.com,linuxfoundation.org,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]

Hi Bartosz,

On 27-Apr-26 14:19, Bartosz Golaszewski wrote:
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

Thank you for your work on this.

The x86-android-tablets.ko kernel module uses platform_create_bundle()
so its probe() cannot return -EPROBE_DEFER. IOW it expects all the GPIO
pins which it needs to already be there when it loads (which so far in
practice holds, since these x86 GPIO controllers are always builtin
for various reasons).

This means that there is no need all the notifier stuff. Only adding
an acpi_bus_find_device_by_name() helper as suggested by Rafael and
then finding the GPIO controllers and attaching the swnodes is
necessary.

And if the acpi_bus_find_device_by_name() fails it is ok to fail
the probe() just like it currently fails when gpiod_get() returns
-EPROBE_DEFER (or fails for other reasons).

This should nicely simplify this patch.

Regards,

Hans





> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/platform/x86/x86-android-tablets/core.c | 127 +++++++++++++++++++++++-
>  1 file changed, 124 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
> index 021009e9085bec3db9c4daa1f6235600210a6099..9e6e8f272dfe16cda421b569802045c3d94fc0ab 100644
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
> @@ -360,6 +362,124 @@ static const struct software_node *cherryview_gpiochip_node_group[] = {
>  	NULL
>  };
>  
> +struct auto_secondary_data {
> +	struct notifier_block nb;
> +	struct device *parent;
> +};
> +
> +static void auto_secondary_unset(void *data)
> +{
> +	struct fwnode_handle *fwnode = data;
> +
> +	fwnode->secondary = NULL;
> +}
> +
> +static int acpi_set_secondary_fwnode(struct device *parent, struct device *dev,
> +				     const struct software_node *const swnode)
> +{
> +	struct acpi_device *device = to_acpi_device(dev);
> +	struct fwnode_handle *fwnode;
> +	int ret;
> +
> +	fwnode = software_node_fwnode(swnode);
> +	if (WARN_ON(!fwnode))
> +		return -ENOENT;
> +
> +	fwnode->secondary = ERR_PTR(-ENODEV);
> +	device->fwnode.secondary = fwnode;
> +
> +	ret = devm_add_action_or_reset(parent, auto_secondary_unset, &device->fwnode);
> +	if (ret)
> +		dev_err(parent, "Failed to schedule the unset action for secondary fwnode\n");
> +
> +	return ret;
> +}
> +
> +static int acpi_auto_secondary_notifier(struct notifier_block *nb,
> +					unsigned long action, void *data)
> +{
> +	struct auto_secondary_data *auto_sec = container_of(nb, struct auto_secondary_data, nb);
> +	const struct software_node *const *swnode;
> +	struct device *dev = data;
> +	int ret;
> +
> +	switch (action) {
> +	case BUS_NOTIFY_ADD_DEVICE:
> +		for (swnode = gpiochip_node_group; *swnode; swnode++) {
> +			if (strcmp((*swnode)->name, dev_name(dev)) == 0) {
> +				ret = acpi_set_secondary_fwnode(auto_sec->parent, dev, *swnode);
> +				return ret ? NOTIFY_BAD : NOTIFY_OK;
> +			}
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static void auto_secondary_unregister_node_group(void *data)
> +{
> +	const struct software_node **nodes = data;
> +
> +	software_node_unregister_node_group(nodes);
> +}
> +
> +static void auto_secondary_unregister_notifier(void *data)
> +{
> +	struct notifier_block *nb = data;
> +
> +	bus_unregister_notifier(&acpi_bus_type, nb);
> +}
> +
> +static int auto_secondary_fwnode_init(struct device *parent)
> +{
> +	const struct software_node *const *swnode;
> +	struct auto_secondary_data *data;
> +	int ret;
> +
> +	ret = software_node_register_node_group(gpiochip_node_group);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(parent,
> +				       auto_secondary_unregister_node_group,
> +				       gpiochip_node_group);
> +	if (ret)
> +		return ret;
> +
> +	data = devm_kzalloc(parent, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->nb.notifier_call = acpi_auto_secondary_notifier;
> +	data->parent = parent;
> +
> +	ret = bus_register_notifier(&acpi_bus_type, &data->nb);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(parent,
> +				       auto_secondary_unregister_notifier,
> +				       &data->nb);
> +	if (ret)
> +		return ret;
> +
> +	/* Device may have been already added. */
> +	for (swnode = gpiochip_node_group; *swnode; swnode++) {
> +		struct device *dev __free(put_device) =
> +			bus_find_device_by_name(&acpi_bus_type, NULL, (*swnode)->name);
> +		if (dev) {
> +			ret = acpi_set_secondary_fwnode(parent, dev, *swnode);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static void x86_android_tablet_remove(struct platform_device *pdev)
>  {
>  	int i;
> @@ -391,7 +511,6 @@ static void x86_android_tablet_remove(struct platform_device *pdev)
>  
>  	software_node_unregister_node_group(gpio_button_swnodes);
>  	software_node_unregister_node_group(swnode_group);
> -	software_node_unregister_node_group(gpiochip_node_group);
>  }
>  
>  static __init int x86_android_tablet_probe(struct platform_device *pdev)
> @@ -427,9 +546,11 @@ static __init int x86_android_tablet_probe(struct platform_device *pdev)
>  		break;
>  	}
>  
> -	ret = software_node_register_node_group(gpiochip_node_group);
> -	if (ret)
> +	ret = auto_secondary_fwnode_init(&pdev->dev);
> +	if (ret) {
> +		x86_android_tablet_remove(pdev);
>  		return ret;
> +	}
>  
>  	ret = software_node_register_node_group(dev_info->swnode_group);
>  	if (ret) {
> 


