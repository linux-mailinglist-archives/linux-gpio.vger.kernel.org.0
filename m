Return-Path: <linux-gpio+bounces-32059-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGG7LuuUnGnRJQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32059-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 18:56:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5221617B2C4
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 18:56:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D619304ADBC
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 17:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2D7339856;
	Mon, 23 Feb 2026 17:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFWyeOK2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71589339870
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 17:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771869228; cv=none; b=Syoxg9xw/OizJv3Kt14RaIi7ehn6VFN6rNHbZbrTLmqn8tyVxZ1oaOy4KJUT92kWd778iDiJivI6jOb7CvdARN62+YcR6ZdCaCpTobo4j6dMhLrbWPzA/kofOlPDGYrHokxNb75IoUCWfRr927bXhx3f1wDvmPu2bj2nANvBWMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771869228; c=relaxed/simple;
	bh=dD5OihsWQ7cuMdc/Bwdk5AKbu7MUQ+Q2mqg0J477YFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OTW7fJjST3Wo0NG5p3en3es0Reb8Vv20edyHRlOFi95ynpkrEmgbcCz4NORMtkT7kNYoFspOS7qpAClUhqHnhYo3M5AVZODVmrmUhzTw4stEMDUUZB/5G9eKiH4Z3vG57R9yGgSG3VblYRKZu6wAEYx7ooLA98ZTXhErVSzwlzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFWyeOK2; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12721cd256bso5252771c88.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771869224; x=1772474024; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=McVEYiWQKsUH8yffi2lamClhWSj5cXVz2XtqQUlFdkg=;
        b=WFWyeOK2nknodkNLQaYB2ntd1rMlx/njzAYVM3QRJyE5TJXlq2eQTZbBcxyqEypMt6
         c0bdDHlVwXAFWZW+eM4sx+MZcTGQcI+hxCXLzHFLTyLeX8TCNmvA9u0UAcVxuME/b8Yw
         eKR+miNe7vi2kaGCRvMFmKm+WJpIIwso8xcttVOj6Oar/Bm7OuGQGpCfpxNJuHcVGy5M
         12H9wb+kzaeO3+FZLpQmB9ukmdccniPwpgpHlOIc5oAdXtS9QzCdCOOzJP3N5TLoYdpw
         PaLVy9ThzCS3b4AvCc7HODxaBMkVEJ+CEk28zcajP82oiIOFOQBq8mZVfXBa2bAA7+6B
         6S1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771869224; x=1772474024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McVEYiWQKsUH8yffi2lamClhWSj5cXVz2XtqQUlFdkg=;
        b=SzHnQ5QTUfEzVhMakCVGZojrDg4l8B+4akT1Df1EK5mcBCTlZVDp8TDrm8RMFGgbag
         eiHThQ4uyfRytqxbE012up+pRr0ttACYGMEBWt+1fhS3VQzqDGflC2JmJFsRxWhYu6WU
         gFKw6THmsFe3a369q920f2yxRNwQbsiaCeJBNg0sXMUUhICklFfj8P1sK7hkVwpu77/K
         sfWSIe7bQAx9YgDYylyf+PiDN4oxqiSPvwW900fOsH8LzU/PgaOMEE2aaawA/VWgV/En
         5b99r/ntR8DPcbFMELxoRZdvdNanHEzQtjFX7Jd8W/yZ2EqWEIxvJfyWJMFbs+KddTJV
         TsXg==
X-Forwarded-Encrypted: i=1; AJvYcCV7WP2iqX9+7Z9nVEsruUc1/T5W8sZmZsyBnseiLoQoCO8MbXs/ctdquyWpNYOcuyiVL0z10FDLTCrj@vger.kernel.org
X-Gm-Message-State: AOJu0YxP5kQj451muxdsVQcFeCO/pQoEs2HDc2SoZ1MWckTUb7UY3JxG
	+aBB6JTl0TYNdrHGxg2XYpSxviC9rpxGQSwQxMY3lkBGTgRL/9oq86vP
X-Gm-Gg: AZuq6aK4EA8XBRKwfPLZv9vQpkKYM0cGvaiH6GnlVG+jdsc0U+OkPnFX9HgF1ZY1R0J
	IjbBBNv5GkdIJg9VfVgJ4O+4XWqRSZoZp9AMvGmeMgc7xp01YcaSZv87szd1fSVtAIwaovNN2zf
	uaLpIdo/wH9onTc/DCaV7NzqyUt6vu2C6X2GFz44emVG84jA68Pz0oinMqqluJy8+nu+UV2+fjE
	XJVGYyKP5t9OOhgo9RFx/tGH8UzrXXla1zxJ70h5dsrN51jvE89ul5HviooKg8QoV3cuZD4qaHo
	HHy1v6dR47mLWEbZQCYqvbARArPysq86NASnWJf8hyxwv4LLZcnWFG7Rkg6rp8Xx2xDLjy5Sf3o
	qJw4U8G+lD/JnuNHwFp+PAYDd4GQGcfG9C79WjIx4vBEw8GiKxNUNwmZd9Zi2D0zcreAZ1esyct
	aKdj48rT+WAZO4D17MnV/DEh0NuSfCSuI8nunb/yA4vPhncResBCAsH3S06OwKlVjg
X-Received: by 2002:a05:7022:40f:b0:11f:2c9e:87f8 with SMTP id a92af1059eb24-1276ad4317emr4177636c88.34.1771869224454;
        Mon, 23 Feb 2026 09:53:44 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:1b48:5d6e:ab6e:5287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af20fc8sm9029506c88.6.2026.02.23.09.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:53:44 -0800 (PST)
Date: Mon, 23 Feb 2026 09:53:41 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Len Brown <lenb@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v2 1/2] driver core: make fwnode_is_primary() public
Message-ID: <aZyTvZblnyMgDlYp@google.com>
References: <20260223-device-match-secondary-fwnode-v2-0-966c00c9eeeb@oss.qualcomm.com>
 <20260223-device-match-secondary-fwnode-v2-1-966c00c9eeeb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-device-match-secondary-fwnode-v2-1-966c00c9eeeb@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,linux.intel.com,gmail.com,lists.linux.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32059-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5221617B2C4
X-Rspamd-Action: no action

Hi Bartosz,

On Mon, Feb 23, 2026 at 04:40:52PM +0100, Bartosz Golaszewski wrote:
> Export fwnode_is_primary() in fwnode.h for use in driver code.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/base/core.c    | 5 -----
>  include/linux/fwnode.h | 5 +++++
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index f599a1384eec90c104601422b04dc2b4c19d4382..2e551bbe591b09c66b113b419ba63f17e8bea94a 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -5122,11 +5122,6 @@ int dev_warn_probe(const struct device *dev, int err, const char *fmt, ...)
>  }
>  EXPORT_SYMBOL_GPL(dev_warn_probe);
>  
> -static inline bool fwnode_is_primary(struct fwnode_handle *fwnode)
> -{
> -	return fwnode && !IS_ERR(fwnode->secondary);
> -}
> -
>  /**
>   * set_primary_fwnode - Change the primary firmware node of a given device.
>   * @dev: Device to handle.
> diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
> index 097be89487bf5c5a96f01d569c1691088db4f0ca..04db7f3ea50cceb9025c82c6449ba342d0e1b4a4 100644
> --- a/include/linux/fwnode.h
> +++ b/include/linux/fwnode.h
> @@ -230,4 +230,9 @@ void fwnode_links_purge(struct fwnode_handle *fwnode);
>  void fw_devlink_purge_absent_suppliers(struct fwnode_handle *fwnode);
>  bool fw_devlink_is_strict(void);
>  
> +static inline bool fwnode_is_primary(struct fwnode_handle *fwnode)
> +{
> +	return fwnode && !IS_ERR(fwnode->secondary);
> +}

I think this is a bad API to be exported for wider use. It is surprising
that a standalone node is not considered to be a primary. It is also not
great that the argument is not constant pointer.

I would suggest having something like

bool fwnode_has_secondary(const struct fwnode_handle *fwnode);

Thanks.

-- 
Dmitry

