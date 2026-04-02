Return-Path: <linux-gpio+bounces-34618-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FeJBQfazmmGqgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34618-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 23:05:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB8D38E3EE
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 23:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A41730267B9
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 21:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A8C392C40;
	Thu,  2 Apr 2026 21:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pidkZMHp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950FB38A71E
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 21:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775163887; cv=none; b=hSlSKEbt3xh11FSPhl5O6S5Kbsn2P6wfzUrcd2KSQbGVXgpYoVRG+7N3pe2hvjP+XY33LCBln7JUGA4zlIldDrpCryvDA3He/r/4t0aizgJ0mS/maBeQVYyvFKwQSR9jRItaoo5CVq2KAVGoxzX1WpHxXrEvGttnNZA9MrX+gas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775163887; c=relaxed/simple;
	bh=9niybiFB5IVgmN0LDSpn+N1s08D0u5vGDHQCV7xvlbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJntciK5GI3DK4WXRmLgJMju1tuN3X5TDMN99/1Iy7TxFXu7YrIG5zK6pUPmMyrZ0a6OQm+nneIW4MMIzU1xs6otfa4Nmf6BOVLPDSFGz+r3bD4+YS8BeMYXCCzcpBk7OoHYZDpTPj+GeZkRIr2pxEllrojcPyxAWQjZVzBpnUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pidkZMHp; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1271195d2a7so1660140c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2026 14:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775163882; x=1775768682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YkigmJHvp4GgElx409CeKFIXm/H3rAfVDHZAfLtsfrs=;
        b=pidkZMHpIrSmQSbDRL8P8vnV09rQbwkTBwk5gtoF9VJCE5GaZ7TjqDK8ehQpGpnBr/
         bt9ESrBk2w2mb3nYGWxR51WKtOaseRIm8yfV3eCpdrQ5u16E1oErngngCgOyqm6FCnrz
         iT+y16nhiUu3C8s6poXOAATYHzU0n3ssDXtkoW5LKfQ+M42HuDQEVl5fRSGMxWllFZxN
         VoKf1I2MUv0Gcx/C6RDdraV+UQluUFiiZLT8CWp909yK7gpR3sA4hdDxWT+JCIjDRDK1
         3pizrRFONH6bcmiVkTfsO+MndY4Xzkpvx8JfXsCSPCYt9e8+evkl/yMZnPu8e4qOsCVH
         xvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775163882; x=1775768682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YkigmJHvp4GgElx409CeKFIXm/H3rAfVDHZAfLtsfrs=;
        b=HsIONMUN6aGUQBZr3FZGDFVlnWoQaGaILyOlyAEBF5TCxxuhXCWM4fCWC6uwP6/3OR
         0xuAXjp/dYBxR6QXm8tX7cNPR9OQ1CUc0ScZhL4xmcMpwZCpAu8Jjyf6RU81FFVuym95
         hK4C7kpOpewD2oH770Jk5qmViTCATi5o0jNH8oRFtAqDmlrZKc5LqMfghewd6/+3CsfG
         gMYZPCYrNzIwjkedHEDN5FhGp1/TeM7Gel/4q5BjZ0Maw5j4+7TqiXHgFjceSCmFA1P7
         Yb7G8Syl8T51K4ECGdUgqVMSMiZY2CrxVT7thQt/XZ83QRQLgSPr/K6t6CxdfLcCoOS8
         OW3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbpNmtcKQ1/aMcwOdun1m/FZZBeBA06ylUQ525CTF6PeeYpYJF+XcaAYf69AW7LyQEsVsh8v4k+UOw@vger.kernel.org
X-Gm-Message-State: AOJu0YzEMlvUhN2mCs7y4UNs8ux4U/XycTnC9tQIzXi7CUVZuNp29aPI
	YuHgnuVHsgTAcRzrTSCMiOgqoAu5Gf8ZRjvQwkRO/3vCg9RxLwxJPEjU1qZvrw==
X-Gm-Gg: ATEYQzzUBd9CIKzrapmHS+11irtI/m9hehRuEQQkILislU3zwoU1hUpMWyHjACg1DsB
	1pddM8N0twRNnOkFa4uNL5v0+11I+4iPMhsZlzHMNPI05Psf3Dv8wZu7D7SFsZDhzQCUYlwJQcM
	42AxlsYRrLUMrM8Oz+XS0iVuGMrS37jXWoqKQcZgqptuXE009u7OQp7j3Hdw6iAJxBtRN3EGUey
	RI01dTPdtcFxdwEAK3ENP0k0tna/NudEFbKvNeoBebzDuo0qWIUpSn/+I7nn2HP5ud6+k1Nepzs
	JU9kiIonNtfYxLrKLno4UekVynUKqwb9a5yPc55NnLTlJhCvem8Zhg03aFpjxSCz20NCx+F1xj0
	vI2WABYhuE/xLvBdYa+vDmCjiYhokV8YdpuFF/GqA/FuV42Hi20OOIXQDdpTOT77N6MVbsXMmMQ
	lSNSNx+SADMh+VckZ+GJN3YaWK0B99MfdWf3pQI0jJ0p9x0eGyeOcIo08lzFO9WOFE
X-Received: by 2002:a05:7022:1603:b0:12b:ec96:c936 with SMTP id a92af1059eb24-12bfb70bfe6mr322111c88.14.1775163881666;
        Thu, 02 Apr 2026 14:04:41 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:902a:cd8d:1c0d:8926])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede545e8sm2818277c88.11.2026.04.02.14.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 14:04:41 -0700 (PDT)
Date: Thu, 2 Apr 2026 14:04:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, brgl@kernel.org
Subject: Re: [PATCH v2 2/4] gpio: swnode: defer probe on references to
 unregistered software nodes
Message-ID: <ac7ZA6HJFBhyCROM@google.com>
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
 <20260402-baytrail-real-swnode-v2-2-6f5054a4cc07@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-baytrail-real-swnode-v2-2-6f5054a4cc07@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-34618-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 4DB8D38E3EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 02:54:27PM +0200, Bartosz Golaszewski wrote:
> fwnode_property_get_reference_args() now returns -ENXIO when called on a
> software node referencing another software node which has not yet been
> registered as a firmware node. It makes sense to defer probe in this
> situation as the node will most likely be registered later on and we'll
> be able to resolve the reference eventually. Change the behavior of
> swnode_find_gpio() to return -EPROBE_DEFER if the software node reference
> resolution returns -ENXIO.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/gpio/gpiolib-swnode.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
> index 0d7f3f09a0b4bee0cf1bbdaa8b7b8ae4cd5de581..06d74e9e199de0b91a019e5e15d4b83d330291e7 100644
> --- a/drivers/gpio/gpiolib-swnode.c
> +++ b/drivers/gpio/gpiolib-swnode.c
> @@ -95,6 +95,15 @@ struct gpio_desc *swnode_find_gpio(struct fwnode_handle *fwnode,
>  			break;
>  	}
>  	if (ret) {
> +		if (ret == -ENXIO)


I'll be just sitting here and quoting sashiko all day long ;)

"
If swnode_gpio_get_reference() returns -ENXIO during the first iteration
(for example, when checking the con_id-gpios suffix), won't the loop continue
since the return value is not 0?

Looking at the loop just above this block:

        for_each_gpio_property_name(propname, con_id) {
                ret = swnode_gpio_get_reference(fwnode, propname, idx, &args);
                if (ret == 0)
                        break;
        }

If the initial property check returns -ENXIO, but the subsequent fallback
check for the con_id-gpio suffix returns -ENOENT, the ret variable gets
overwritten. 

When the loop terminates, ret would be -ENOENT instead of -ENXIO. Could this
cause the probe deferral check to evaluate to false and fail the probe
entirely instead of deferring it as intended? 

Should the loop also break early if -ENXIO is encountered?

"

You need to change that to

	if (ret == 0 || ret == -ENXIO)
		break;

because if we get -ENXIO that means the GPIO must be there (the property
exists) but not ready yet and we do not want to fall back to another
suffix. 

Thanks.

-- 
Dmitry

