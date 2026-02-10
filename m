Return-Path: <linux-gpio+bounces-31571-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP9OIAaDi2lDVAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31571-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 20:12:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A40711E88B
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 20:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D2CD3036623
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 19:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4B038B7B5;
	Tue, 10 Feb 2026 19:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g80eRIjv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F162C32E68F
	for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 19:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770750654; cv=none; b=uhjRSwOYb0U4kw0GHujdZudL9fxdQorCleByyNUmwrr2tBj8dhFZrar8vIbp35JyJwSnH6HlOGqvvMo7UGAlUcFEehTFnV16Sy7odNaR96E+j/Sj7DrEVjIpUUwv6T+klJ1gHE+Mj35WvlLqPLVffbN9joV3WlBlOyMuMQYKJo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770750654; c=relaxed/simple;
	bh=2bvZWE7twF61uCF0RbEpKOmJhwGSwwSIQdWQwtDsiU0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=hfTazbul0Fq4y212+7K39pWk1jjbDgJgXDJBN1u/YUh3aM1byrEJ1ivPWwh+EZB99TcLLoiLFCH7ynnr3ZPXXRWPU+itCBGmEzlBcMgHyyIjwr3ITkhVT7nGJh+Wn60AtTBLCo+XIb2iWwBGcpUBrYT2hyMKq+ARQF2Jo6BhLE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g80eRIjv; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-4359a16a400so1143011f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 11:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770750651; x=1771355451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LHqbu9P1+Pumy4rK+s102NKjK+R22eZanNFM4YUrXEc=;
        b=g80eRIjvvWop8WSUIk47kVLCzgsCGz6WQypaQe8O0RVScChidgrgLm+k/H/51YiKem
         xkEPimJDIR1nvbaauO7HCIQQJUl1OxaUG5sVUeN/NdftC/p15t5ckpiLL8g63bG5L7LN
         H8cE1YwK4p7c6oazqgqfKExQW0irm4HBFMYaeAQRqpogYuJ6Sy8kHJqkDJywfrNexd0r
         ZjUbavKzcEGk3Rs4zp11FjaAs4eogI/0WlwHe/L8ZrMatCkLRUmw1qxKChbmK35NwFTQ
         KIQl4VGXqh7prJsK6Eb7MyGy/lwsJzXoE243qAoJPy+0Gr0L9FWVykGGcbym9rCPEfAF
         /mAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770750651; x=1771355451;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHqbu9P1+Pumy4rK+s102NKjK+R22eZanNFM4YUrXEc=;
        b=KB2S/J5feKZ4u0W7fIypsa8dSPHcZoJtpcHxQvOFgqIUmcuRlaO6iq0x3ppXgjJ36+
         J3exwpuavoCNYd7OxF2z/GmnZQcX9YmDd6oVRbWbjUq6wa1CKxwD5CXQGUuMAPoSNFtP
         0hPET92FuGiIr6uroIBuz4bRuxp5iU1awofDR3hFq+XIABCDj04/nWaAVoUtXU1+SXsw
         g9RtVPldU6ArWyfYygroOGj25eW8mtwNCn2UsRvmDVOCCVVCsf3kQZm1jn5VmWT14c/T
         kAy/JY0xeTzpGtnU9bfG+WR9gJs82SlQv1LWfYDy1K/QxDufJo0mNmwgi4gmvjE5jgV2
         CcIw==
X-Forwarded-Encrypted: i=1; AJvYcCW4+9Y7m18QOmc28Pjv2hUnPszpVNVUhaWYispDZv8hZSuGzJP/YN9pwZndBSQ9NdPR9WWvdLY8/khJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwPQ5MhNaPI/YtWtlQppRb9V6ttJmSWDU9TW9ncv7WvmLGuXIOs
	CF6HULyQ5I4O0x+sSDL2WN4KCHAL6FU1WHxaKcGoqIUsD2N62KwkZcH47dbUa42FlKs=
X-Gm-Gg: AZuq6aJUDvW6QBHgN0tLUzSUPz3OsUhsn3PGhHsH5qoLDbEF5gldAm/OfNnuhIRPqf0
	vZZsPYqn/Usm64mSwOeCsOM5qfHJTYNryb4kPFoMlArzuunrp7202EDvwvajTgMI+Xu034e0SEy
	ekEzag+J+pCTw+PEFTcpIYTjc7QMrLhXf0jV6/RtN4hAsuSkBDr/oF6M56G40A0an15lW/za81x
	m8RZADAm1JcP8EcqTEN2ttslfW26z5+geoXgxN4KIGdjcdUhkRDF0EDeHCzaKZNxJhXz0KwSW4l
	E9hTUzD40OmL9y9NZiSvktOEd1leG1Klh0lc/5AqG17YHdBDFsoi55kMwYLEkAAfVdjftGU6B+d
	iZeCiy29C7FfPos4r4GC7MYVvH1KU02cHExJUmxMqJom5EkBSIo5q1CpPVn2fj1NEqkv8dhks8n
	ly82vxyYUkZWDc57+osMxC4sLKDfPi
X-Received: by 2002:a05:6000:288b:b0:435:e493:25f with SMTP id ffacd0b85a97d-436293818d5mr22821986f8f.34.1770750651166;
        Tue, 10 Feb 2026 11:10:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436309ed238sm35212929f8f.19.2026.02.10.11.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 11:10:50 -0800 (PST)
Date: Tue, 10 Feb 2026 22:10:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: swnode: restore the swnode-name-against-chip-label
 matching
Message-ID: <202602110128.BInRI9un-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210094806.38146-1-bartosz.golaszewski@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31571-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[lists.linux.dev,oss.qualcomm.com,kernel.org,linux.intel.com,linuxfoundation.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:email,git-scm.com:url,01.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2A40711E88B
X-Rspamd-Action: no action

Hi Bartosz,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-swnode-restore-the-swnode-name-against-chip-label-matching/20260210-175012
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260210094806.38146-1-bartosz.golaszewski%40oss.qualcomm.com
patch subject: [PATCH] gpio: swnode: restore the swnode-name-against-chip-label matching
config: nios2-randconfig-r071-20260210 (https://download.01.org/0day-ci/archive/20260211/202602110128.BInRI9un-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602110128.BInRI9un-lkp@intel.com/

smatch warnings:
drivers/gpio/gpiolib-swnode.c:62 swnode_get_gpio_device() error: we previously assumed 'gdev_node' could be null (see line 32)

vim +/gdev_node +62 drivers/gpio/gpiolib-swnode.c

b7b56e64a345e7 Bartosz Golaszewski 2023-09-27  26  static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
e7f9ff5dc90c38 Dmitry Torokhov     2022-11-11  27  {
b7b56e64a345e7 Bartosz Golaszewski 2023-09-27  28  	const struct software_node *gdev_node;
b7b56e64a345e7 Bartosz Golaszewski 2023-09-27  29  	struct gpio_device *gdev;
e7f9ff5dc90c38 Dmitry Torokhov     2022-11-11  30  
b7b56e64a345e7 Bartosz Golaszewski 2023-09-27  31  	gdev_node = to_software_node(fwnode);
6774a66d0e103d Bartosz Golaszewski 2025-12-15 @32  	if (!gdev_node)
216c1204757190 Bartosz Golaszewski 2025-11-20  33  		goto fwnode_lookup;

gdev_node is NULL

e7f9ff5dc90c38 Dmitry Torokhov     2022-11-11  34  
9d50f95bc0d5df Charles Keepax      2024-04-16  35  	/*
9d50f95bc0d5df Charles Keepax      2024-04-16  36  	 * Check for a special node that identifies undefined GPIOs, this is
9d50f95bc0d5df Charles Keepax      2024-04-16  37  	 * primarily used as a key for internal chip selects in SPI bindings.
9d50f95bc0d5df Charles Keepax      2024-04-16  38  	 */
9d50f95bc0d5df Charles Keepax      2024-04-16  39  	if (IS_ENABLED(CONFIG_GPIO_SWNODE_UNDEFINED) &&
6774a66d0e103d Bartosz Golaszewski 2025-12-15  40  	    gdev_node == &swnode_gpio_undefined)
9d50f95bc0d5df Charles Keepax      2024-04-16  41  		return ERR_PTR(-ENOENT);
9d50f95bc0d5df Charles Keepax      2024-04-16  42  
216c1204757190 Bartosz Golaszewski 2025-11-20  43  fwnode_lookup:
e5d527be7e6984 Bartosz Golaszewski 2025-11-03  44  	gdev = gpio_device_find_by_fwnode(fwnode);
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  45  	if (!gdev)
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  46  		/*
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  47  		 * FIXME: We shouldn't need to compare the GPIO controller's
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  48  		 * label against the software node that is supposedly attached
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  49  		 * to it. However there are currently GPIO users that - knowing
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  50  		 * the expected label of the GPIO chip whose pins they want to
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  51  		 * control - set up dummy software nodes named after those GPIO
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  52  		 * controllers, which aren't actually attached to them. In this
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  53  		 * case gpio_device_find_by_fwnode() will fail as no device on
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  54  		 * the GPIO bus is actually associated with the fwnode we're
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  55  		 * looking for.
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  56  		 *
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  57  		 * As a fallback: continue checking the label if we have no
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  58  		 * match. However, the situation described above is an abuse
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  59  		 * of the software node API and should be phased out and the
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  60  		 * following line - eventually removed.
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  61  		 */
4a61b0b6de0480 Bartosz Golaszewski 2026-02-10 @62  		gdev = gpio_device_find_by_label(gdev_node->name);
                                                                                                 ^^^^^^^^^^^^^^^
Unchecked dereference

4a61b0b6de0480 Bartosz Golaszewski 2026-02-10  63  
b7b56e64a345e7 Bartosz Golaszewski 2023-09-27  64  	return gdev ?: ERR_PTR(-EPROBE_DEFER);
e7f9ff5dc90c38 Dmitry Torokhov     2022-11-11  65  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


