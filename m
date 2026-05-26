Return-Path: <linux-gpio+bounces-37504-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCHOLjpjFWo9UwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37504-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 11:09:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5B35D307E
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 11:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4DDF3045E3B
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 09:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758F93D3013;
	Tue, 26 May 2026 09:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="gfVL8AOw";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="nY/9wepO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0CC3D1CC5;
	Tue, 26 May 2026 09:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786447; cv=none; b=phhL2SlTM/iny1gFsVA/F166rteWHFOhlzHLWjLde9T7v2mDmKmkGrouA054J6AcH0KQOh3zzTcGyab1x4aa5vquG+KMJpEMN8RrfLrgVjn+Rhd0GlKF+CdsANHvPEfAD+rc9D5P5+2QZcIeIhW9psR+dtwHUtWENHHX8hMhXDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786447; c=relaxed/simple;
	bh=y57EO1rsH4ucNWooWXT1hqzndfnlqSbet0Yr1W3BZdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eoLXAOHl/2V5tUKplN7w3WBPl3m8+GzQUb1TjtbpeVr5zOe1uLLL3MdwThq2AOyVuMq+jsR8nVUrpr/dPLHu+HXIaFgqurYpb7IUj/xWjvR/eh/1aX745HXqthGQ1xw7EOKamLLXr6KUbn0DcNJsaR/ZprPSSthhtDS05E/dJ4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=gfVL8AOw; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=nY/9wepO; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1779785889;
	bh=y57EO1rsH4ucNWooWXT1hqzndfnlqSbet0Yr1W3BZdc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gfVL8AOw4jtF4bzowSDSxB2Cb3qeMMw0CdWFQ50FSw/+U5gbegRjhvf4kGIQ91lx9
	 Ve1anqEkViHp21tRSfwB/IY4SKsxIoLYIUcX8LejUJaalUemd4JuXObZPFs8ex0SNE
	 jB39G+OQMDEJkT1wLees6iAhdokpRaGW2B76lk+SADyFduh4I2jFz04yQ958qrGNWa
	 mZzsVwoDPCJve6ft/sjAvbdPuK1kxSe3LmDLZFtqce4n7agoWLOxm4Mjjp0u50ewYT
	 tbwe5yYeMZvaHaeZHFbfYsinSyzqntghit5SvzAWWY50HwdILcPCJffGG1cgEhBQGc
	 AdEszcf0TB1LYA8m4e4m/grmhVVeeVEPKVMfwLN2q0WoUYHorP60IrG9+uRD5r0AKA
	 bhFberAauiiKWv9R3FVyoN1ct/09JWyKW9dSMaXlH3nmaPsDNGZAAKrTM7diZUMFFm
	 4DHJAF3dTLvrnef+sylgi6hQYtq5yHbQtQwJcIgEHWIefHK9ibs2qvy1/txVMRS1jP
	 4CYZq8fYp24iEeqItpig0lduke+2TGwqL0+lqHJMRfOJQrHBUg9DIDJTWSNtT4Ij8a
	 XHUOESDbH/4f+VHgXAKf2Yy5c0v8af0wW2xzoemg6gVf7KOYhmUmeeNeQc1QvjHn0V
	 zW5Sh7upL2mzNVqB7YgyYpoI=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 63DB21E9C65; Tue, 26 May 2026 16:58:09 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1779785888;
	bh=y57EO1rsH4ucNWooWXT1hqzndfnlqSbet0Yr1W3BZdc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nY/9wepO5QFmQtpoRPQKtfiV9LebS224stq6qE6RLLBnIP0R+W5Lsb41kDNNGR/zi
	 lg9rgKSCvb353z84KeOlM/5GUs40VYr8fF4CAUgx3+bzUZh6ummvVqruks2/U1b4kC
	 c0SdIXnrAbrfZiUYb4asSzM+e9JsF4TQDSc5Vc9iJ0mLS209YqNR2LZSZkjQG2+dZk
	 JMsgK81+nbglcQNZjRMEIWUoZOQq8eeVBQqD0JU+s4iEzLjUH7kEI2DbFs6KZsbMFT
	 dR9kjAsQ+d+WQlBqkaQtlTL3y4XfxC7JyDxKv4fPg6pPsVL68gKwxCmwWkw0DVYJJa
	 5HCcJVENWnHnYN4o/5wW0PUtpGtgP1jg0rJq2ZTzH5djYKQsd7Xkxgn+1y3fQOSkOI
	 /TB1zTstwfgWXKBiSYz/OChXTDk3pfP4yzubs6PGK/oEpGqW39nbAV9fzjmK1sD8vR
	 F1DXnze1dlPe52mvfUmfFVYyxy5GXppGkvANK/Lm8GgVeEVR3LKHuSTO1z1Kpo7Ll0
	 ZrrE8UMWmbywkLMHI1x6a7vNuTDDq85Ek9rkqX7Wxl6ECiyh466jgVrfTFhkxsTru7
	 1s+SyFBXOtDMDlUZ0C6GYjkLyT+EJaWHKBfJw5j0QQQNoxWMyJLgiyMoPN0rjnCmWU
	 TYUhR7kWkOIx5SgVNgxdQjXk=
Received: from [IPV6:2001:8003:8810:ea00:ed87:ca88:5326:e11d] (unknown [IPv6:2001:8003:8810:ea00:ed87:ca88:5326:e11d])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id F1E731E9C5C;
	Tue, 26 May 2026 16:58:07 +0800 (AWST)
Message-ID: <5ea00943-4979-48d5-9b7b-351a5e87f011@davidgow.net>
Date: Tue, 26 May 2026 16:58:05 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] kunit: provide
 kunit_platform_device_register_full()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260522-gpiolib-kunit-v3-0-b15fe6987430@oss.qualcomm.com>
 <20260522-gpiolib-kunit-v3-1-b15fe6987430@oss.qualcomm.com>
From: David Gow <david@davidgow.net>
Content-Language: fr
In-Reply-To: <20260522-gpiolib-kunit-v3-1-b15fe6987430@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[davidgow.net,none];
	R_DKIM_ALLOW(-0.20)[davidgow.net:s=201606];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[davidgow.net:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-37504-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@davidgow.net,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7F5B35D307E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 22/05/2026 à 9:42 PM, Bartosz Golaszewski a écrit :
> Provide a kunit-managed variant of platform_device_register_full().
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Thanks! This looks good to me.

Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David

>  include/kunit/platform_device.h |  4 ++++
>  lib/kunit/platform.c            | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/include/kunit/platform_device.h b/include/kunit/platform_device.h
> index f8236a8536f7ebcee6b0e00a7bd799a14b345c1b..8cad6e1c3e7efba862862b579089f2f317784a73 100644
> --- a/include/kunit/platform_device.h
> +++ b/include/kunit/platform_device.h
> @@ -6,10 +6,14 @@ struct completion;
>  struct kunit;
>  struct platform_device;
>  struct platform_driver;
> +struct platform_device_info;
>  
>  struct platform_device *
>  kunit_platform_device_alloc(struct kunit *test, const char *name, int id);
>  int kunit_platform_device_add(struct kunit *test, struct platform_device *pdev);
> +struct platform_device *
> +kunit_platform_device_register_full(struct kunit *test,
> +				    const struct platform_device_info *pdevinfo);
>  
>  int kunit_platform_device_prepare_wait_for_probe(struct kunit *test,
>  						 struct platform_device *pdev,
> diff --git a/lib/kunit/platform.c b/lib/kunit/platform.c
> index 0b518de26065d65dac3bd49dd94a4b3e7ea0634b..583b50b538c79599ebbf33e261fe2e9ced35efa9 100644
> --- a/lib/kunit/platform.c
> +++ b/lib/kunit/platform.c
> @@ -6,6 +6,7 @@
>  #include <linux/completion.h>
>  #include <linux/device/bus.h>
>  #include <linux/device/driver.h>
> +#include <linux/err.h>
>  #include <linux/platform_device.h>
>  
>  #include <kunit/platform_device.h>
> @@ -130,6 +131,36 @@ int kunit_platform_device_add(struct kunit *test, struct platform_device *pdev)
>  }
>  EXPORT_SYMBOL_GPL(kunit_platform_device_add);
>  
> +/**
> + * kunit_platform_device_register_full() - Register a KUnit test-managed platform
> + *                                         device described by platform device info
> + * @test: test context
> + * @pdevinfo: platform device information describing the new device
> + *
> + * Register a test-managed platform device. The device is unregistered when the
> + * test completes.
> + *
> + * Return: New platform device on success, IS_ERR() on error.
> + */
> +struct platform_device *
> +kunit_platform_device_register_full(struct kunit *test,
> +				    const struct platform_device_info *pdevinfo)
> +{
> +	struct platform_device *pdev;
> +	int ret;
> +
> +	pdev = platform_device_register_full(pdevinfo);
> +	if (IS_ERR(pdev))
> +		return pdev;
> +
> +	ret = kunit_add_action_or_reset(test, platform_device_unregister_wrapper, pdev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return pdev;
> +}
> +EXPORT_SYMBOL_GPL(kunit_platform_device_register_full);
> +
>  struct kunit_platform_device_probe_nb {
>  	struct completion *x;
>  	struct device *dev;
> 


