Return-Path: <linux-gpio+bounces-16231-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0F6A3C24A
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 15:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 316A13A31BC
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 14:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A02251EFFB3;
	Wed, 19 Feb 2025 14:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QmE2mOCO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35291EFFA7
	for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 14:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739975763; cv=none; b=YRkDEr6TeSGlbKIhZPgocV1cs4fuClKrsCAfpB0fRUEucV6TxigCKb2o0sFo6icRAbADs6fYC52OXihRAJlrwoKOYKTdrfLzP6okHjxRFkOaGOk7ZWTDND9J0tNY5mbVHlfGc+euOJngP4A+9x1uuAnscZbu2GZi8vdmbpufEJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739975763; c=relaxed/simple;
	bh=EH9pF0bmKJbUbYy6pLydxngVLwM8z/4zuVPHp1uETVk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ETYlpxOLhtolMiJiVluYxH+/KtMHjtESYJm/1Q0eCOD3CwPNA8jialcEKkEKezYBIGwaEaDrW4aJkrAbEg/r27y0S01tDE+/zbX9Szr5OD6DTjzqg2SYpchfsr6uiNQzCOkUYHBrCpxmgaN2c7v+weh3+Ulm8cfbctE6et+abIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QmE2mOCO; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30737db1ab1so62435331fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 06:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739975760; x=1740580560; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SBUcuHhcoaE8QYDwj9P7DHCnYF+LbVz/GFms3n5h0yI=;
        b=QmE2mOCOv2rxcrhKLIb+2RQSO/A6fpQguy8XV/uMwtixQ7KdyW+MXuHAdQbH1zxvgU
         Z/lonwS3MlFwqepCLSPjL1Y8SSaYTAAuaFkZY3j9Soar3M57339djQKyHwrQvCZHnHyE
         AQU4m+kH2Hg+7mz4+cjI6OuDz80YS36w6lSRu5G8pr5i0wlec00buu7eYnEl9Z4cfTJ7
         VJe+wAFbDcA0YJRABrF1KkjcpISNWbiEpGuykpmgCKSFHalmFLw0vZb0M947IRyBxSDm
         edWkyoX4Rh6dZNF4o1ekOsEUH7F+KAXeEgXbzluNorVD6ZmMtsQVh2ribkVgd1njVn68
         9a+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739975760; x=1740580560;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SBUcuHhcoaE8QYDwj9P7DHCnYF+LbVz/GFms3n5h0yI=;
        b=KLvVlA8KzHRcZPheC5byxtMkUKPHSGbP4Fw6aG95Dom0l23yTK6WBcA1ArOyAtVJMx
         FSvdb0Tc9LD79wK9TESK+HrOAOxCjs6ulmYRnHZKtVZ3eRrqZUQOP0HQD99j78vhUxWj
         WBMm4hrvDBjOKJQ4DxCbmpe2GXAZDalBnpvsIiPDQG6w/EAthxWs3tx0jDR5fmCGxdaZ
         ETjUaoB1t7YXnzdlfMDD9KRiWdsjFx6ClGBXWiUZ5YWlvxtF9u2SwIPUvjMNPLHttEG/
         VvBmTapHtTSC5ae3xRqIploHC8HXEqDiaEH7IU2px5ef3neBorQ0Ve/EK/EP8fneyGpF
         Bilw==
X-Forwarded-Encrypted: i=1; AJvYcCUhaPur1V7EjqiEC/kW90CIJsP+o2WXT1D99EUa1/cbAIG3wgZ//HPNGn55w+3cb2nrWgJefcwDd5Kd@vger.kernel.org
X-Gm-Message-State: AOJu0YwcXhAZD0D0Hk0mHvHUGiX5wgI3bWHeWrM0IUUcDI/8WLo751Zj
	pd/JGMCyXPIlzHZWZ77hdOQ7kKrk2u9wIvNc4e1hDaKcUIulGHbv5hJ5Dbonu5IV7mVpzgk1xU2
	Wkq2V0A+LEgVz9rayDCrlFx1oq22SJbSGfXum8A==
X-Gm-Gg: ASbGncsZiw4NIqQWDBCeOwOTTNfr0P80SWcimAxVr32QZkW2/oj7J8X8u4cVor/gxio
	IUWmnSN0JSJ5A4BEQfLTpnShx030PQMqeyw+6HmPcTVGfAWZf9DZA/I8usYmeVfg2jVfLjZiX2K
	WvyVLIX2SfVBCgg1qBTxQzHVXL2kY=
X-Google-Smtp-Source: AGHT+IGWf0KFGTQRiATMpVUQQe4aBiZSWkdJsR2tvlLkcSCO4pmtWlYPyfFpX+bXdzxU+JJPQ8UtLbjhTUd+ejUTMyg=
X-Received: by 2002:a2e:9cd1:0:b0:308:ffa1:8915 with SMTP id
 38308e7fff4ca-30927a62b9amr55470761fa.5.1739975759790; Wed, 19 Feb 2025
 06:35:59 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Feb 2025 06:35:59 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Feb 2025 06:35:59 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <Z7XPcYtaA4COHDYj@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217103922.151047-1-brgl@bgdev.pl> <Z7XPcYtaA4COHDYj@smile.fi.intel.com>
Date: Wed, 19 Feb 2025 06:35:59 -0800
X-Gm-Features: AWEUYZlDfKC76FvJo02GQQdn2c3-Q0CRK_MYWCBSiSKiScyorPBTfditmsDbJu0
Message-ID: <CAMRc=Mf6HLoORvth1O=DLGXcSvq75-mbmPR0zXg6cm6VV-LVWA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] gpiolib: move all includes to the top of gpio/consumer.h
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dipen Patel <dipenp@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	timestamp@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Feb 2025 13:32:49 +0100, Andy Shevchenko
<andriy.shevchenko@intel.com> said:
> On Mon, Feb 17, 2025 at 11:39:21AM +0100, Bartosz Golaszewski wrote:
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> We have several conditional includes depending on !CONFIG_GPIOLIB. This
>> is supposed to reduce compilation time with CONFIG_GPIOLIB=y but in
>> practice there's no difference on modern machines.
>
> It's not about modern machines. If every maintainer will think this way,
> we end up in the complete and utter dead end with the headers.
>
> I believe you at least had read the cover letter for the infamous Ingo's series
> about headers and how it speeds up the build (in some cases up to 70% on as you
> said "modern machines").
>
>> It makes adding new stubs that depend on more than just GPIOLIB harder so
>> move them all to the top, unduplicate them and replace asm/ with preferred
>> linux/ alternatives.
>
> NAK.
>
> This makes dependency hell things much worse and this is a step back on the
> untangling the current situation along with the slowing down the speed of the
> build. Please. consider to revert or discard this patch.
>
> ...
>
>>  #include <linux/bits.h>
>> +#include <linux/bug.h>
>
> Okay to replace, but not okay to move.
>
>>  #include <linux/err.h>
>> +#include <linux/errno.h>
>
> Please, double check that it uses error codes from it, otherwise err.h includes
> asm/errno.h with basic codes already.
>
>> +#include <linux/kernel.h>
>
> This is definitely no. Please, read what's written in the top of that file and
> here is just a proxy for should come in the future a kind of might_sleep.h.
> Do not move this one at all, please.
>
>>  #include <linux/types.h>
>

Fair enough. Does this look right to you?

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 0b2b56199c36..38e313fd0e9a 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -3,10 +3,6 @@
 #define __LINUX_GPIO_CONSUMER_H

 #include <linux/bits.h>
-#include <linux/bug.h>
-#include <linux/err.h>
-#include <linux/errno.h>
-#include <linux/kernel.h>
 #include <linux/types.h>

 struct acpi_device;
@@ -185,6 +181,10 @@ struct gpio_desc
*devm_fwnode_gpiod_get_index(struct device *dev,

 #else /* CONFIG_GPIOLIB */

+#include <linux/bug.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+
 static inline int gpiod_count(struct device *dev, const char *con_id)
 {
	return 0;
@@ -549,6 +549,10 @@ struct gpio_desc
*devm_fwnode_gpiod_get_index(struct device *dev,
 int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
 int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
 #else
+
+#include <linux/bug.h>
+#include <linux/err.h>
+
 static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc,
					       unsigned long flags)
 {
@@ -615,6 +619,8 @@ int devm_acpi_dev_add_driver_gpios(struct device *dev,

 #else  /* CONFIG_GPIOLIB && CONFIG_ACPI */

+#include <linux/err.h>
+
 static inline int acpi_dev_add_driver_gpios(struct acpi_device *adev,
			      const struct acpi_gpio_mapping *gpios)
 {
@@ -640,6 +646,8 @@ void gpiod_unexport(struct gpio_desc *desc);

 #else  /* CONFIG_GPIOLIB && CONFIG_GPIO_SYSFS */

+#include <linux/err.h>
+
 static inline int gpiod_export(struct gpio_desc *desc,
			       bool direction_may_change)
 {

Bart

