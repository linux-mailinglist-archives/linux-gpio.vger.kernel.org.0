Return-Path: <linux-gpio+bounces-33075-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHiIGCUesWmOqwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33075-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 08:47:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4979B25E2A6
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 08:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87882304A21C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 07:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611633B2FFB;
	Wed, 11 Mar 2026 07:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RriP0Ga+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC6C286D4D;
	Wed, 11 Mar 2026 07:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773215263; cv=none; b=Rk6jKvurUD6mWvMicf4CIEI4jMHS0eNqjMFjQMmaGnXdnYzUiY8dLJc5Tg45E6g7q9gKQ590g4DQFxD/auGsl3G6AHYQb1T7ZBdOcE1PbYypeUErMG1euWSz4GQFTifuMRrXqnKRGVbZnWWd4Ciqa06G5GF/jblduwyZVwWd4bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773215263; c=relaxed/simple;
	bh=cFF1B45OA71pMfLhiGvpwYfIMj6cOeLdAgO1RQWjBww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNY2SvHrKGsS4DILb5EQI7UJ+wTbn+/ZB3VBpcCwrsXqAso/ybf22l2H1eTyxyEQrpVdc6LjoDGHCP964x403n7U/m7PP1xkLmxcMFtXm4eZvnXAtnfQ/B+wpxK4htHab0Bwlnwpcn7xOENKdQYO8Mz6raBG4v3dAolhVLEQiB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RriP0Ga+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773215258; x=1804751258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cFF1B45OA71pMfLhiGvpwYfIMj6cOeLdAgO1RQWjBww=;
  b=RriP0Ga+WxsJupz4ihq914QEvMnPayzNwuyGybHhaHSFrhHWS1FvS7jK
   QNSDpHmyROYXlR4A3Je7YQq8SmEkR7dzBS8ZAwzi1i5Tz9h3rNviGdtYV
   NRWJ5rGzHqDodm6qZc3FX6ilWvMZmF0d0DhwZegUm3+k4Lhk1lxhAuNNO
   Xs5Wwrf0FZ/lOCRZmpMlGyQNJ8FJk24m9dX2FTOR/PWDHrKAQiaGwt71F
   89kABrSIknmj/darhYaPJSL4FX/OluvpRy1JgV9/Ni1CDNNLwUnqEC80u
   OL8dvWqgGq49tGguR2Btmv24Anyvv6nT4aEpcJHHQsCIZ4zfXlDkaQfK2
   A==;
X-CSE-ConnectionGUID: t+lX5Sx+Sx2kVmPuj2Kkag==
X-CSE-MsgGUID: BkrsxxAxTISMfoKEFQfigw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74188562"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74188562"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 00:47:36 -0700
X-CSE-ConnectionGUID: tiShmRn4SyGNQEEdPQ423A==
X-CSE-MsgGUID: ujUkTTTWR/SJiWXe0x1hnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="225337463"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.171])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 00:47:34 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 59CFC120E92;
	Wed, 11 Mar 2026 09:49:29 +0200 (EET)
Date: Wed, 11 Mar 2026 09:49:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCHv2] gpio: ljca: reduce struct allocation
Message-ID: <abEeiSHcZ9CLJ92P@kekkonen.localdomain>
References: <20260310222040.10324-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310222040.10324-1-rosenp@gmail.com>
X-Rspamd-Queue-Id: 4979B25E2A6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33075-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Action: no action

Hi Rosen,

On Tue, Mar 10, 2026 at 03:20:40PM -0700, Rosen Penev wrote:
> Convert connect_mode to a flexible array member to avoid calling
> kcalloc and to combine the allocations.
> 
> Add __counted_by for extra runtime analysis.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: add counting variable
>  drivers/gpio/gpio-ljca.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
> index f32d1d237795..61252e0eb444 100644
> --- a/drivers/gpio/gpio-ljca.c
> +++ b/drivers/gpio/gpio-ljca.c
> @@ -63,7 +63,6 @@ struct ljca_gpio_dev {
>  	DECLARE_BITMAP(enabled_irqs, LJCA_MAX_GPIO_NUM);
>  	DECLARE_BITMAP(reenable_irqs, LJCA_MAX_GPIO_NUM);
>  	DECLARE_BITMAP(output_enabled, LJCA_MAX_GPIO_NUM);
> -	u8 *connect_mode;
>  	/* protect irq bus */
>  	struct mutex irq_lock;
>  	struct work_struct work;
> @@ -72,6 +71,9 @@ struct ljca_gpio_dev {
> 
>  	u8 obuf[LJCA_GPIO_BUF_SIZE];
>  	u8 ibuf[LJCA_GPIO_BUF_SIZE];
> +
> +	size_t num;

num is unsigned int in struct ljca_gpio_info so I'd use that here, too.

> +	u8 connect_mode[] __counted_by(num);
>  };
> 
>  static int ljca_gpio_config(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id,
> @@ -400,22 +402,20 @@ static int ljca_gpio_probe(struct auxiliary_device *auxdev,
>  			   const struct auxiliary_device_id *aux_dev_id)
>  {
>  	struct ljca_client *ljca = auxiliary_dev_to_ljca_client(auxdev);
> +	struct ljca_gpio_info *gpio_info = dev_get_platdata(&auxdev->dev);
>  	struct ljca_gpio_dev *ljca_gpio;
>  	struct gpio_irq_chip *girq;
>  	int ret;
> 
> -	ljca_gpio = devm_kzalloc(&auxdev->dev, sizeof(*ljca_gpio), GFP_KERNEL);
> +	ljca_gpio = devm_kzalloc(&auxdev->dev,
> +				 struct_size(ljca_gpio, connect_mode, gpio_info->num),
> +				 GFP_KERNEL);
>  	if (!ljca_gpio)
>  		return -ENOMEM;
> 
> +	ljca_gpio->num = gpio_info->num;
>  	ljca_gpio->ljca = ljca;
> -	ljca_gpio->gpio_info = dev_get_platdata(&auxdev->dev);
> -	ljca_gpio->connect_mode = devm_kcalloc(&auxdev->dev,
> -					       ljca_gpio->gpio_info->num,
> -					       sizeof(*ljca_gpio->connect_mode),
> -					       GFP_KERNEL);
> -	if (!ljca_gpio->connect_mode)
> -		return -ENOMEM;
> +	ljca_gpio->gpio_info = gpio_info;
> 
>  	ret = devm_mutex_init(&auxdev->dev, &ljca_gpio->irq_lock);
>  	if (ret)

-- 
Regards,

Sakari Ailus

