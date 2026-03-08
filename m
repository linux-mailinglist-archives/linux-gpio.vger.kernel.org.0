Return-Path: <linux-gpio+bounces-32773-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WdL7BlZprWnv2gEAu9opvQ
	(envelope-from <linux-gpio+bounces-32773-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Mar 2026 13:19:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A56582302FF
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Mar 2026 13:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 699203003828
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Mar 2026 12:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C286307AF0;
	Sun,  8 Mar 2026 12:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mgOqRnwW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA9E242D76;
	Sun,  8 Mar 2026 12:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772972364; cv=none; b=F2CRMN4y2ea6XM+22yA441XshNk5xa2pcOGrILXCG0MJXUWzb9q+ExWIXi8RTujlVCtPHmQP4UwpKLSst8WoSzceITlZRwd843YBSzL8BMKUIuE9ilmvYNcwsHzJ+rFrsDjnKPJkDvSGRPiF/R+AnbfS79uqsbAC9C89sI63V1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772972364; c=relaxed/simple;
	bh=LGYvL1XKpclUw7Iw/Y4pTkGPq9k0IHun20SYEwRhl00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEsM4uzS/ZPVEx8vomeoFcu2ElYFy13FbjObYND+1pzvAa5YLskohVSrKGMRrQw1+6eGyuoS1C7jgUokwhSVknC/NTldFwEoQd/uOiccR+tdws70z192ac0Tg3Pl/iH+HnGsF4c2Lwz+oQJtRYVs9RFXHCqbTIuDmnJdOUaMbII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mgOqRnwW; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772972362; x=1804508362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LGYvL1XKpclUw7Iw/Y4pTkGPq9k0IHun20SYEwRhl00=;
  b=mgOqRnwW4/y8/x2pCKECgRtM1erksYljn9r/8Sgjr6sID04U0qGeigza
   dNcmu6Q4XgF2wm/RGLHg8uK66LQagSDIdd89XQJc73SHTOR5dBex1gMct
   SZxOkrbrry9caSLNSO6aLM7V5AvAbaO6A8Zxq50CWJdTVw1biLSGz45fC
   o+sCl4Ucsz5OVK6lMFzuxaA7VuxdEKEsrPSmMqMEI8VPPSXsQ30ck1FD0
   fDNFFis7kNJweDB26w+C//PqiDJD05yo9DUVmbC47/36t8waXycuNH2JS
   BOjwVbscxIGCk9GWx+kmtk/sC6RgKuG0tyo3dIwCdldMhiTitw37r+j96
   Q==;
X-CSE-ConnectionGUID: YFfkdQj4Rgup5dfJWvbcGw==
X-CSE-MsgGUID: Ep+JIDkaRjmd4rZ6btOIHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="77869173"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="77869173"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 05:19:21 -0700
X-CSE-ConnectionGUID: 3mTMHS4vT5GqrvbwIkDnHg==
X-CSE-MsgGUID: yHxTnwQgS7y/onyAe3JHNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="219602381"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.88])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 05:19:20 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D06F4121D15;
	Sun, 08 Mar 2026 14:19:49 +0200 (EET)
Date: Sun, 8 Mar 2026 14:19:49 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>,
	linux-hardening@vger.kernel.org, gustavoars@kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpio: ljca: reduce struct allocation
Message-ID: <aa1pZdYEU8QkI_8x@kekkonen.localdomain>
References: <20260308021201.47820-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308021201.47820-1-rosenp@gmail.com>
X-Rspamd-Queue-Id: A56582302FF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32773-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Action: no action

Hi Rosen,

Thanks or the patch.

On Sat, Mar 07, 2026 at 06:12:01PM -0800, Rosen Penev wrote:
> Convert connect_mode to a flexible array member to avoid calling
> kcalloc and to combine the allocations.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/gpio/gpio-ljca.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
> index f32d1d237795..a531aaa0425f 100644
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
> @@ -72,6 +71,8 @@ struct ljca_gpio_dev {
>  
>  	u8 obuf[LJCA_GPIO_BUF_SIZE];
>  	u8 ibuf[LJCA_GPIO_BUF_SIZE];
> +
> +	u8 connect_mode[];
>  };
>  
>  static int ljca_gpio_config(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id,
> @@ -400,22 +401,19 @@ static int ljca_gpio_probe(struct auxiliary_device *auxdev,
>  			   const struct auxiliary_device_id *aux_dev_id)
>  {
>  	struct ljca_client *ljca = auxiliary_dev_to_ljca_client(auxdev);
> +	struct ljca_gpio_info *gpio_info;
>  	struct ljca_gpio_dev *ljca_gpio;
>  	struct gpio_irq_chip *girq;
>  	int ret;
>  
> -	ljca_gpio = devm_kzalloc(&auxdev->dev, sizeof(*ljca_gpio), GFP_KERNEL);
> +	gpio_info = dev_get_platdata(&auxdev->dev);

You can do this assignment in variable declaration.

> +	ljca_gpio = devm_kzalloc(&auxdev->dev, struct_size(ljca_gpio, connect_mode, gpio_info->num),

This line is a bit long, I'd wrap it.

> +				 GFP_KERNEL);
>  	if (!ljca_gpio)
>  		return -ENOMEM;
>  
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
Kind regards,

Sakari Ailus

