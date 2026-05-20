Return-Path: <linux-gpio+bounces-37170-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKOiC4ZGDWrvvQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37170-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 07:28:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C726C587C10
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 07:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC69A3046057
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 05:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E254367B67;
	Wed, 20 May 2026 05:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYNJtPac"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A8833DEE5
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 05:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779254864; cv=none; b=mr4KOl3R9sC9jwx6FHtRi+hYnbZ4UvsvUsvzgeGPZ+RFjXUjX8yYH517ywT6LETr7wS7WyeI8SvKkL5kzAXncHOKYxGq+pCTPY4L8DUSyyGZh1qDJkRw40jwxFoKMTCfRPPxzErE1+2Dgi7aJ5pY04MVIk6MC29tO0Dpjf5GRnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779254864; c=relaxed/simple;
	bh=l0zRM2r+AQUNnb8A268apqaIB3mS80ht+d+1M1KKNFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3lZUOO+ZcgWk6xGJcoPBdU9PczCMMdq4SLwS5MvoDve6/i0WTAQkSZ8icAT1D00TaCluG4ovA/o4FoW1rSa9gavxsfMuDrVfPdY9PPM0uNbYyaRIEKAXM7cQDHmaXxqQuo/FJicFSG/kZL6QBsyzC1wGQfCp16tkQDUoCYlk0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYNJtPac; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12ddbe104ccso3128058c88.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 22:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779254862; x=1779859662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tWnObvvYz2jxVvNJZ4O4Otjd3qRMPJxYo5uUEck8zsM=;
        b=VYNJtPacffiX92QpyrOU3Lyjiq8y8ThCuoAAkgBCYCptHiXE1n9o72gsaMSUmdzi+C
         3RCRowkltdAC1/1x2ZA5jwW6rbRQYvxJ9x1v0xrJMOqh7uLemCY5uJH8ve7LsEjNnGlx
         oV0KNVE0D9y9v/fOltAdg2TFCxTy/Q8GoUQ4QhZld4mXawtyqQkdnTakHz5gIEfuZOd4
         do6LRUIsh+oDtslTnLsjYvUQC6neJwikmm40m8oCBmcDcJv1ZGZmLZrldMqY33lxxRQQ
         laXNIk/ukJBcX2qLKsBrLmT/XTSnOB99uU5iOuZZS8ZGXpoL05YHG1w6L/BoiN7/7QIn
         rjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779254862; x=1779859662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWnObvvYz2jxVvNJZ4O4Otjd3qRMPJxYo5uUEck8zsM=;
        b=tXLes+N/7iP0KXSKQeihTWkGq0pKMbLdp8myIGZeDzX/0kLyxSxLT/qKvqSrnMM2q3
         YkxPtIuccisl5Ozy+V28YduQHzFXlCe63RtkWRWCsQCf39lip841D+LAm3Rka6mFKIVb
         VvDKsNhEeU4pSwqJNPWVyuy58flT+BGysVGhU5FcknGp/MenfH8EmuUENZd49sF1D4Sx
         LTGenqGO+Uhigm36cl+FV/cmPAXTfFGgi7l2YZf0JnI8HeRVseQpdXAGqjqBrFRGY04T
         ApKYP+iEH5GHKUYJUA6XASK/GxwGTVMH3bkiNJeTVyEZuD7txWZrzNLaNb1k5goymufY
         8RIw==
X-Forwarded-Encrypted: i=1; AFNElJ8c3mC5RVCWXTBK8PzF/jCoLxBnOGj+HFWViDKu9Ec9sxPq/P9SMra5nL4W2tEaM3Di40AteKIubVi9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7w9q/aCjtweYtaKNmMz3jryyfm7T1CjKjm3DAYVspbeTDTYVT
	3BTOmlH/QuSO5YsRo8yHmeowIK3U+lorinMWFpz7dzQAuYy0h/GYTMjb
X-Gm-Gg: Acq92OHoUMtGUgUdyZkgTC5lMDSZ/I7COp3Zm/iN5pDsfsCiUwoLNUPuvQ2SDep4dKq
	Ms1VSdXCjk4INtuBkndiD/vOSyRxBngNRpjWrc/Or1d0qRo+WEYqqZICxsysriu6FwaTOjDivEa
	Jp/Biv6l4yRsi5UGDuBMqIEyJV3BHQdxE7UsH7De3EB8ZHgiABKhPROeKHyTuVQjuwtMgjhLn3A
	LAxkmUsNTcbGnWOisj366SWAAR64PFXNEjxvtZToVdvdzIyIHv3CGrsusddpf/za/yheB56p8bA
	VorXMNZm1K4JNXiiKcswvkFSw50OvZbOKANzKQo5bVbNRJg55D17lHapRqP2ST64MPuufB91tsO
	TfPH1BRxiMs/RvNRDRkRtOTX2I431BnnRDpvtyrTjSHvaunms4t84deJwzOyXiocfgZSyTzhPDq
	RJebVqibP9f6VOm4p2PqELJLr7/xsghz1B3NRyBowkI1QQcJURqEoteBb0O9siSAHQ
X-Received: by 2002:a05:7022:e14:b0:135:d5d1:514 with SMTP id a92af1059eb24-135d5d1061cmr2290514c88.14.1779254861871;
        Tue, 19 May 2026 22:27:41 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:7677:c3e6:c92a:e780])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdcf140sm25863329c88.5.2026.05.19.22.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 22:27:41 -0700 (PDT)
Date: Tue, 19 May 2026 22:27:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Frank Rowand <frowand.list@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 5/6] gpio: remove machine hogs
Message-ID: <ag1GJygtLgngKQqj@google.com>
References: <20260309-gpio-hog-fwnode-v2-0-4e61f3dbf06a@oss.qualcomm.com>
 <20260309-gpio-hog-fwnode-v2-5-4e61f3dbf06a@oss.qualcomm.com>
 <ag0Dn66ZVnbTc7J2@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ag0Dn66ZVnbTc7J2@google.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37170-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,linux.intel.com,iki.fi,atomide.com,armlinux.org.uk,lwn.net,linuxfoundation.org,vger.kernel.org,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: C726C587C10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 05:46:50PM -0700, Dmitry Torokhov wrote:
> On Mon, Mar 09, 2026 at 01:42:41PM +0100, Bartosz Golaszewski wrote:
> > With no more users, remove legacy machine hog API from the kernel.
> > 
> > Reviewed-by: Linus Walleij <linusw@kernel.org>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Argh! What is the replacement for this? I have patches for rsk7203 to
> use them to get rid of legacy gpio use, like this:
> 
> diff --git a/arch/sh/boards/mach-rsk/devices-rsk7203.c b/arch/sh/boards/mach-rsk/devices-rsk7203.c
> index f8760a91e2f1..5bbd3b31cffb 100644
> --- a/arch/sh/boards/mach-rsk/devices-rsk7203.c
> +++ b/arch/sh/boards/mach-rsk/devices-rsk7203.c
> @@ -12,7 +12,7 @@
>  #include <linux/smsc911x.h>
>  #include <linux/input.h>
>  #include <linux/io.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/gpio/machine.h>
>  #include <linux/gpio/property.h>
>  #include <asm/machvec.h>
> @@ -165,6 +165,19 @@ static const struct platform_device_info rsk7203_devices[] __initconst = {
>  	},
>  };
>  
> +/* The base of the function GPIOs in the flat enum */
> +#define SH7203_FN_BASE GPIO_FN_PINT7_PB
> +
> +static struct gpiod_hog rsk7203_gpio_hogs[] = {
> +	GPIO_HOG("sh7203_pfc-fn", GPIO_FN_TXD0 - SH7203_FN_BASE,
> +		 "TXD0", GPIO_ACTIVE_HIGH, GPIOD_ASIS),
> +	GPIO_HOG("sh7203_pfc-fn", GPIO_FN_RXD0 - SH7203_FN_BASE,
> +		 "RXD0", GPIO_ACTIVE_HIGH, GPIOD_ASIS),
> +	GPIO_HOG("sh7203_pfc-fn", GPIO_FN_IRQ0_PB - SH7203_FN_BASE,
> +		 "IRQ0_PB", GPIO_ACTIVE_HIGH, GPIOD_ASIS),
> +	{ }
> +};
> +
>  static int __init rsk7203_devices_setup(void)
>  {
>  	struct platform_device *pd;
> @@ -172,12 +185,10 @@ static int __init rsk7203_devices_setup(void)
>  	int i;
>  
>  	/* Select pins for SCIF0 */
> -	gpio_request(GPIO_FN_TXD0, NULL);
> -	gpio_request(GPIO_FN_RXD0, NULL);
> +	gpiod_add_hogs(rsk7203_gpio_hogs);
>  
>  	/* Setup LAN9118: CS1 in 16-bit Big Endian Mode, IRQ0 at Port B */
>  	__raw_writel(0x36db0400, 0xfffc0008); /* CS1BCR */
> -	gpio_request(GPIO_FN_IRQ0_PB, NULL);
>  
>  	error = software_node_register_node_group(rsk7203_swnodes);
>  	if (error) {
> 
> 
> If there is no replacement maybe we can resurrect this? Or shoudl we
> have add swnode support for hogs?

Hmm, I guess it is already there so I should simply switch. Sorry about
the noise.

Thanks.

-- 
Dmitry

