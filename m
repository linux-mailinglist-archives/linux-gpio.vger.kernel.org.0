Return-Path: <linux-gpio+bounces-32163-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOwqJSmVnmmwWQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32163-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 07:22:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE59F1924F4
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 07:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A172302A7C8
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 06:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970BF2D6409;
	Wed, 25 Feb 2026 06:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p5OoZT+d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED80C28850E
	for <linux-gpio@vger.kernel.org>; Wed, 25 Feb 2026 06:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772000548; cv=none; b=oSFTD2Ef39Ge6qkwtRahBu0dFE8gVyWrZNPM3QBGviWwVApLN7d6N7pPQtS6XrbuQ6K+CGy8eR8A3vpFK4QB3LXIWvib3vu1wGYFgQ3TdbNIxr0tCvzQxgvzaKOrkgjZ12Tr53ur5WjUcXx7i5HEXCQCzTHwuwur8aM4O0s8S3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772000548; c=relaxed/simple;
	bh=k5U9idvKWqfoPSJ4m2BzIFQV2K6YVjt1yXurBmyIRXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=eIdta4KdMSaQ2jWoNed0fmNvby8Iks/xir+3rrUYUhPNoX1Ksz9c8ntcPt1jmuIxQ6/n+K1ngU6rW+ogGIZrG0lGDshV0d90CeGvieZhLHBsl00JPqt8vr1y1SaTuMa1AedqO9eualrkkAKr8ssxQT81MpkgOB+ZFSi+gurJ0L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p5OoZT+d; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4398e850783so276011f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 22:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772000545; x=1772605345; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J6TQX+cdB21OFB2LhMTn7qAOLA9HXWMn1D8RItFSzVI=;
        b=p5OoZT+dzWi3YZoEsZbkI6djdhGe25SFfuOgmlr9AHPfpbzCCfUBAbucofP/VvxVUj
         hYukNgG9AW7KE0sJvdD9mpxKRfuhTUa8Bv44L5lvUEc4Rs74ShHrxbz0xKfsTTX9+GAe
         +cmZbn13jy+9J6RMQxGfJG/1djyDysZQukd3dxj+CqwmGDJ1uTzzwMwiGhBE62dE3ZEZ
         Zc/VPh9pvR2O1eUWKHEr6pwkVgAssMJTAO/oam8tqeekTYi6ibLxG7260f+erihiBy8q
         ZvnPm1jbJ6xTjY6DyQL3EFVntkWXTOtmGSulF7QNm2LPwofPMba3S9Qh4OE/rPaAlpY1
         HrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772000545; x=1772605345;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6TQX+cdB21OFB2LhMTn7qAOLA9HXWMn1D8RItFSzVI=;
        b=X8Tb2DmKuOiQntnWsLVZRufWY5sKftaNZ8LoVa6vSXMNnBriQ6we6a+ZpT6tkP9982
         57zl+e6IaQZP9STnyyP1cDJ+Iz6PMkke7aCucvIJ2kr+Gfj88MviLTMuwOygino6MtEz
         LpkXwx8kiTS+ldTGTHFGT1R8EwocjfrnOJ+X5f1H/cVmSX6MQKphQsSCrF3qbmyqDD0o
         IfhL47PBHNbwP4pdUhWxhMw2cHKwAw8DhDIOIpwpuqw9Wrj3R70DkkEJqpsPfmrK7fTU
         U2nqg8PJgWY94lYfZ8ckRQYoSqHHJqQludvWjWFwiAc0o1w5qV/DEJZMvY+YLa/Tma0U
         pQwg==
X-Forwarded-Encrypted: i=1; AJvYcCXMylfxMjgo0FAvTwg4TdYYTnammJRSfKGLSR6pVqndCaDa//XiboF/UOGdAJCi5+CqcPB84Uu7sHvx@vger.kernel.org
X-Gm-Message-State: AOJu0YzeW4YiCMYMJD9jRcb7QyVdo7eCcEBiUzxFzfPhiDSvZ8n4jyLk
	pG5+seE4jlXwNWiYCZM/9gngG16pc5OuLtGtcpjJFGtIlzWTNV4AfjuNqstKgZuCeHQ=
X-Gm-Gg: ATEYQzzlbRO4SWi0YMEDjsQMEoADU0FH1AizLhRnI8nP8291gqZS78PYToO0+qIorp+
	PIJr29SPMPsnh03iwe8uQn83cfTMwziQX1I2DbBzcSjihGf0TykbLGtke+HUjnrW7VpTt1J7sjh
	vpnNhWbTVwpjNWE4Y7nF25DpRESyP7jDzTtXxGtoKJUhDUo78n54kZ/Gz/v7ATu1mbZECUbDEix
	mW9ALBa9IFVZrDuUqm+MshczH/7U5wEWljcw2ngHXyDgPaxbyq5yjQFoVDMkQvg2KVFPl1/W5Ff
	57mYTp+xtYYPSbJljf6BOs5opO/PhdJJtp3ZIoGNcfOpJhVkNHgpRC+XkDZyBVpqve0g+iJpqfO
	fHFw9Gn9DfHmjBeTVPnRLwFfU8Cf7/rPhp7mtXJLr3a6IxnsNI4IaGIORaMB59NYpPIGV+WKU5W
	oJie+6eiOnn5ZBtyAPX4I/gov+fdiu
X-Received: by 2002:a05:6000:3111:b0:436:1934:d234 with SMTP id ffacd0b85a97d-4396f16e524mr30347224f8f.3.1772000545179;
        Tue, 24 Feb 2026 22:22:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4cc81sm30929164f8f.26.2026.02.24.22.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:22:24 -0800 (PST)
Date: Wed, 25 Feb 2026 09:22:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pranav Kharche <pranavkharche7@gmail.com>,
	linus.walleij@kernel.org, brgl@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Pranav Kharche <pranavkharche7@gmail.com>
Subject: Re: [PATCH] gpio: gpiolib-swnode: Remove deprecated label fallback
 for GPIO device lookup
Message-ID: <202602251030.c7iVKF8b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224163234.653438-1-pranavkharche7@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,lists.linux.dev,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-32163-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lists.linux.dev,gmail.com,kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,01.org:url,intel.com:mid,intel.com:email,git-scm.com:url,linaro.org:email,linaro.org:dkim]
X-Rspamd-Queue-Id: EE59F1924F4
X-Rspamd-Action: no action

Hi Pranav,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pranav-Kharche/gpio-gpiolib-swnode-Remove-deprecated-label-fallback-for-GPIO-device-lookup/20260225-003353
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260224163234.653438-1-pranavkharche7%40gmail.com
patch subject: [PATCH] gpio: gpiolib-swnode: Remove deprecated label fallback for GPIO device lookup
config: csky-randconfig-r073-20260225 (https://download.01.org/0day-ci/archive/20260225/202602251030.c7iVKF8b-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602251030.c7iVKF8b-lkp@intel.com/

smatch warnings:
drivers/gpio/gpiolib-swnode.c:45 swnode_get_gpio_device() warn: if statement not indented

vim +45 drivers/gpio/gpiolib-swnode.c

b7b56e64a345e73 Bartosz Golaszewski 2023-09-27  26  static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
e7f9ff5dc90c382 Dmitry Torokhov     2022-11-11  27  {
b7b56e64a345e73 Bartosz Golaszewski 2023-09-27  28  	const struct software_node *gdev_node;
b7b56e64a345e73 Bartosz Golaszewski 2023-09-27  29  	struct gpio_device *gdev;
e7f9ff5dc90c382 Dmitry Torokhov     2022-11-11  30  
b7b56e64a345e73 Bartosz Golaszewski 2023-09-27  31  	gdev_node = to_software_node(fwnode);
6774a66d0e103d0 Bartosz Golaszewski 2025-12-15  32  	if (!gdev_node)
216c12047571906 Bartosz Golaszewski 2025-11-20  33  		goto fwnode_lookup;
e7f9ff5dc90c382 Dmitry Torokhov     2022-11-11  34  
9d50f95bc0d5df5 Charles Keepax      2024-04-16  35  	/*
9d50f95bc0d5df5 Charles Keepax      2024-04-16  36  	 * Check for a special node that identifies undefined GPIOs, this is
9d50f95bc0d5df5 Charles Keepax      2024-04-16  37  	 * primarily used as a key for internal chip selects in SPI bindings.
9d50f95bc0d5df5 Charles Keepax      2024-04-16  38  	 */
9d50f95bc0d5df5 Charles Keepax      2024-04-16  39  	if (IS_ENABLED(CONFIG_GPIO_SWNODE_UNDEFINED) &&
6774a66d0e103d0 Bartosz Golaszewski 2025-12-15  40  	    gdev_node == &swnode_gpio_undefined)
9d50f95bc0d5df5 Charles Keepax      2024-04-16  41  		return ERR_PTR(-ENOENT);
9d50f95bc0d5df5 Charles Keepax      2024-04-16  42  
216c12047571906 Bartosz Golaszewski 2025-11-20  43  fwnode_lookup:
e5d527be7e69848 Bartosz Golaszewski 2025-11-03  44  	gdev = gpio_device_find_by_fwnode(fwnode);
ff91965ad8b214e Bartosz Golaszewski 2026-02-11 @45  	if (!gdev && gdev_node && gdev_node->name)
7969c87da8f4a6f Pranav Kharche      2026-02-24  46  		

Strange.  The tabs are there but no code.

ff91965ad8b214e Bartosz Golaszewski 2026-02-11  47  
b7b56e64a345e73 Bartosz Golaszewski 2023-09-27  48  	return gdev ?: ERR_PTR(-EPROBE_DEFER);
e7f9ff5dc90c382 Dmitry Torokhov     2022-11-11  49  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


