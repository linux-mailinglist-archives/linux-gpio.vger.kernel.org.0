Return-Path: <linux-gpio+bounces-14389-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F279FF575
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 02:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 543153A2581
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 01:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12874522F;
	Thu,  2 Jan 2025 01:30:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B46E3C38;
	Thu,  2 Jan 2025 01:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.61.185.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735781420; cv=none; b=Roo8frQI1VsZZgXfTN2LYirfG9qsfcipkRCD3f+3KX4ezKrUReVEUmS1SE5JInKuCLynShOg8BCHg/F/KYv7nKMdX9D3Teo3O9Of6R5hhAAA+T5dKkS18Kqqf02jlok/Y305XLu/bPwXtmyCtn4r0tacmJnJ9BER4pNVJ2yY+xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735781420; c=relaxed/simple;
	bh=xDDgwG3j6nWpMTY27UZcR3A7l4IAPXtG5qKiWGEzskc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dh4CfcihUu2TPg4lEP/U1EOt9dRX1YZmFE27CvwX6Qv9OLdXxeKy874apRFlKS7gTEn+i+cPZc6uEPIR6U9jbPLr/ZCSBYXkSdI4eK6HP2wQNGbj7OvxwvVxwtEMLxNETjE4tgqGAxyrSgCL3xrE8O9CKILe39+NrVesgJi/+0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn; spf=pass smtp.mailfrom=189.cn; arc=none smtp.client-ip=183.61.185.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=189.cn
HMM_SOURCE_IP:10.158.243.220:56388.1357920828
HMM_ATTACHE_NUM:0000
HMM_SOURCE_TYPE:SMTP
Received: from clientip-123.150.8.42 (unknown [10.158.243.220])
	by 189.cn (HERMES) with SMTP id 5DEEF10055C;
	Thu,  2 Jan 2025 09:25:55 +0800 (CST)
Received: from  ([123.150.8.42])
	by gateway-153622-dep-5c5f88b874-f78lq with ESMTP id 4e6ba08f48154a32b125ee86f8cad7b1 for brgl@bgdev.pl;
	Thu, 02 Jan 2025 09:25:56 CST
X-Transaction-ID: 4e6ba08f48154a32b125ee86f8cad7b1
X-Real-From: chensong_2000@189.cn
X-Receive-IP: 123.150.8.42
X-MEDUSA-Status: 0
Sender: chensong_2000@189.cn
Message-ID: <ec5531e5-6fae-431e-bc58-73bb816d477d@189.cn>
Date: Thu, 2 Jan 2025 09:25:53 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] drivers:gpio: introduce variants of gpiod_get_array
To: brgl@bgdev.pl, linus.walleij@linaro.org, corbet@lwn.net
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20241217085302.835165-1-chensong_2000@189.cn>
Content-Language: en-US
From: Song Chen <chensong_2000@189.cn>
In-Reply-To: <20241217085302.835165-1-chensong_2000@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear maintainers,

It has been a while after this patch was sent. I'm not sure if i 
followed the idea suggested by Bart correctly, see [1], any comment will 
be appreciated.

Best regards,

Song

[1]:https://lore.kernel.org/lkml/CAMRc=MfpwuMh-MH1UEHKky09iAs4g9=iGFPptARXzoZrVS8hdQ@mail.gmail.com/

在 2024/12/17 16:53, Song Chen 写道:
> This patch introduces another two variants of gpiod_get_array,
> fwnode_gpiod_get_array and devm_fwnode_gpiod_get_array, to
> return GPIO descriptor array to comsumers.
> 
> Unlike gpiod_get_array, which calls dev_fwnode(dev) to get
> firmware node in gpiod_get_index, new variants allow consumers
> to pass firmware node by themselves.
> 
> It's applicable to below circumstance:
> 
> fwnode_for_each_child_node(fw_parent, fw_child)
> or for_each_child_of_node
> 	struct gpio_descs *array = devm_fwnode_gpiod_get_array(
> 				dev, fw_child,...).
> 	or fwnode_gpiod_get_array
> 
> Signed-off-by: Song Chen <chensong_2000@189.cn>
> ---
>   drivers/gpio/gpiolib-devres.c | 43 ++++++++++++++++
>   drivers/gpio/gpiolib.c        | 96 +++++++++++++++++++++++++++++------
>   include/linux/gpio/consumer.h | 28 ++++++++++
>   3 files changed, 151 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
> index 08205f355ceb..f8b2a3fe02ba 100644
> --- a/drivers/gpio/gpiolib-devres.c
> +++ b/drivers/gpio/gpiolib-devres.c
> @@ -192,6 +192,49 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
>   }
>   EXPORT_SYMBOL_GPL(devm_fwnode_gpiod_get_index);
>   
> +/**
> + * devm_fwnode_gpiod_get_array - Resource-managed gpiod_get_array_by_fwnode()
> + * @dev:	GPIO consumer
> + * @fwnode:	firmware node containing GPIO reference
> + * @con_id:	function within the GPIO consumer
> + * @flags:	optional GPIO initialization flags
> + *
> + * Managed gpiod_get_array_by_fwnode(). GPIO descriptors returned from this function are
> + * automatically disposed on driver detach. See gpiod_get_array_by_fwnode() for detailed
> + * information about behavior and return values.
> + *
> + * Returns:
> + * The GPIO descriptors corresponding to the function @con_id of device
> + * dev, %-ENOENT if no GPIO has been assigned to the requested function,
> + * or another IS_ERR() code if an error occurred while trying to acquire
> + * the GPIOs.
> + */
> +struct gpio_descs *devm_fwnode_gpiod_get_array(struct device *dev,
> +							 struct fwnode_handle *fwnode,
> +						     const char *con_id,
> +						     enum gpiod_flags flags)
> +{
> +	struct gpio_descs **dr;
> +	struct gpio_descs *descs;
> +
> +	dr = devres_alloc(devm_gpiod_release_array,
> +			  sizeof(struct gpio_descs *), GFP_KERNEL);
> +	if (!dr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	descs = gpiod_get_array_by_fwnode(dev, fwnode, con_id, flags);
> +	if (IS_ERR(descs)) {
> +		devres_free(dr);
> +		return descs;
> +	}
> +
> +	*dr = descs;
> +	devres_add(dev, dr);
> +
> +	return descs;
> +}
> +EXPORT_SYMBOL_GPL(devm_fwnode_gpiod_get_array);
> +
>   /**
>    * devm_gpiod_get_index_optional - Resource-managed gpiod_get_index_optional()
>    * @dev: GPIO consumer
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 679ed764cb14..dbb39e6bb568 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4469,6 +4469,33 @@ struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
>   }
>   EXPORT_SYMBOL_GPL(fwnode_gpiod_get_index);
>   
> +/**
> + * fwnode_gpiod_get_array - obtain multiple GPIOs from a multi-index GPIO function
> + * @fwnode:	handle of the firmware node
> + * @con_id:	function within the GPIO consumer
> + * @flags:	GPIO initialization flags
> + *
> + * This function can be used for drivers that get their configuration
> + * from opaque firmware.
> + *
> + * The function properly finds the corresponding GPIOs using whatever is the
> + * underlying firmware interface and then makes sure that the GPIO
> + * descriptors are requested before they are returned to the caller.
> + *
> + * Returns:
> + * On successful request the GPIO descriptors are configured in accordance with
> + * provided @flags.
> + *
> + * In case of error an ERR_PTR() is returned.
> + */
> +struct gpio_descs *fwnode_gpiod_get_array(struct fwnode_handle *fwnode,
> +					 const char *con_id,
> +					 enum gpiod_flags flags)
> +{
> +	return gpiod_get_array_by_fwnode(NULL, fwnode, con_id, flags);
> +}
> +EXPORT_SYMBOL_GPL(fwnode_gpiod_get_array);
> +
>   /**
>    * gpiod_count - return the number of GPIOs associated with a device / function
>    * @dev:	GPIO consumer, can be NULL for system-global GPIOs
> @@ -4731,21 +4758,8 @@ static void gpiochip_free_hogs(struct gpio_chip *gc)
>   		gpiochip_free_own_desc(desc);
>   }
>   
> -/**
> - * gpiod_get_array - obtain multiple GPIOs from a multi-index GPIO function
> - * @dev:	GPIO consumer, can be NULL for system-global GPIOs
> - * @con_id:	function within the GPIO consumer
> - * @flags:	optional GPIO initialization flags
> - *
> - * This function acquires all the GPIOs defined under a given function.
> - *
> - * Returns:
> - * The GPIO descriptors corresponding to the function @con_id of device
> - * dev, -ENOENT if no GPIO has been assigned to the requested function,
> - * or another IS_ERR() code if an error occurred while trying to acquire
> - * the GPIOs.
> - */
> -struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
> +static struct gpio_descs *__gpiod_get_array(struct device *dev,
> +						struct fwnode_handle *fwnode,
>   						const char *con_id,
>   						enum gpiod_flags flags)
>   {
> @@ -4766,7 +4780,12 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
>   		return ERR_PTR(-ENOMEM);
>   
>   	for (descs->ndescs = 0; descs->ndescs < count; descs->ndescs++) {
> -		desc = gpiod_get_index(dev, con_id, descs->ndescs, flags);
> +		if (fwnode)
> +			desc = gpiod_find_and_request(dev, fwnode, con_id, descs->ndescs,
> +					  flags, NULL, false);
> +		else
> +			desc = gpiod_get_index(dev, con_id, descs->ndescs, flags);
> +
>   		if (IS_ERR(desc)) {
>   			gpiod_put_array(descs);
>   			return ERR_CAST(desc);
> @@ -4858,8 +4877,53 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
>   			*array_info->invert_mask);
>   	return descs;
>   }
> +
> +/**
> + * gpiod_get_array - obtain multiple GPIOs from a multi-index GPIO function
> + * @dev:	GPIO consumer, can be NULL for system-global GPIOs
> + * @con_id:	function within the GPIO consumer
> + * @flags:	optional GPIO initialization flags
> + *
> + * This function acquires all the GPIOs defined under a given function.
> + *
> + * Returns:
> + * The GPIO descriptors corresponding to the function @con_id of device
> + * dev, -ENOENT if no GPIO has been assigned to the requested function,
> + * or another IS_ERR() code if an error occurred while trying to acquire
> + * the GPIOs.
> + */
> +struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
> +						const char *con_id,
> +						enum gpiod_flags flags)
> +{
> +	return __gpiod_get_array(dev, NULL, con_id, flags);
> +}
>   EXPORT_SYMBOL_GPL(gpiod_get_array);
>   
> +/**
> + * gpiod_get_array_by_fwnode - obtain multiple GPIOs from a multi-index GPIO function
> + * @dev:	GPIO consumer, can be NULL for system-global GPIOs
> + * @fwnode: Firmware node to lookup
> + * @con_id:	function within the GPIO consumer
> + * @flags:	optional GPIO initialization flags
> + *
> + * This function acquires all the GPIOs defined under a given function.
> + *
> + * Returns:
> + * The GPIO descriptors corresponding to the function @con_id of device
> + * dev, -ENOENT if no GPIO has been assigned to the requested function,
> + * or another IS_ERR() code if an error occurred while trying to acquire
> + * the GPIOs.
> + */
> +struct gpio_descs *__must_check gpiod_get_array_by_fwnode(struct device *dev,
> +						struct fwnode_handle *fwnode,
> +						const char *con_id,
> +						enum gpiod_flags flags)
> +{
> +	return __gpiod_get_array(dev, fwnode, con_id, flags);
> +}
> +EXPORT_SYMBOL_GPL(gpiod_get_array_by_fwnode);
> +
>   /**
>    * gpiod_get_array_optional - obtain multiple GPIOs from a multi-index GPIO
>    *                            function
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> index db2dfbae8edb..7143bf7045ce 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -80,6 +80,10 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
>   struct gpio_descs *__must_check gpiod_get_array_optional(struct device *dev,
>   							const char *con_id,
>   							enum gpiod_flags flags);
> +struct gpio_descs *__must_check gpiod_get_array_by_fwnode(struct device *dev,
> +						struct fwnode_handle *fwnode,
> +						const char *con_id,
> +						enum gpiod_flags flags);
>   void gpiod_put(struct gpio_desc *desc);
>   void gpiod_put_array(struct gpio_descs *descs);
>   
> @@ -175,11 +179,18 @@ struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
>   					 const char *con_id, int index,
>   					 enum gpiod_flags flags,
>   					 const char *label);
> +struct gpio_descs *fwnode_gpiod_get_array(struct fwnode_handle *fwnode,
> +					 const char *con_id,
> +					 enum gpiod_flags flags);
>   struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
>   					      struct fwnode_handle *child,
>   					      const char *con_id, int index,
>   					      enum gpiod_flags flags,
>   					      const char *label);
> +struct gpio_descs *devm_fwnode_gpiod_get_array(struct device *dev,
> +					      struct fwnode_handle *fwnode,
> +					      const char *con_id,
> +						  enum gpiod_flags flags);
>   
>   #else /* CONFIG_GPIOLIB */
>   
> @@ -548,6 +559,14 @@ struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
>   	return ERR_PTR(-ENOSYS);
>   }
>   
> +static inline
> +struct gpio_descs *fwnode_gpiod_get_array(struct fwnode_handle *fwnode,
> +					 const char *con_id,
> +					 enum gpiod_flags flags)
> +{
> +	return ERR_PTR(-ENOSYS);
> +}
> +
>   static inline
>   struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
>   					      struct fwnode_handle *fwnode,
> @@ -558,6 +577,15 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
>   	return ERR_PTR(-ENOSYS);
>   }
>   
> +static inline
> +struct gpio_descs *devm_fwnode_gpiod_get_array(struct device *dev,
> +					      struct fwnode_handle *fwnode,
> +					      const char *con_id,
> +						  enum gpiod_flags flags)
> +{
> +	return ERR_PTR(-ENOSYS);
> +}
> +
>   #endif /* CONFIG_GPIOLIB */
>   
>   static inline

