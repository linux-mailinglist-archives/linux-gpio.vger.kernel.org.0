Return-Path: <linux-gpio+bounces-15326-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB4BA27266
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 14:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1432F1617D6
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 13:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC652144A8;
	Tue,  4 Feb 2025 12:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="o6AJPwqt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CCB21422A
	for <linux-gpio@vger.kernel.org>; Tue,  4 Feb 2025 12:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738673344; cv=none; b=usYCQhKdE68jHaKSJprDbsCbasze7sByBNQIvhtZDORERNpDBd1aIVFGNqIwvkcNE+4n+EuHkCCwlsCg48N7lu4O4N1hjyD1Uf8zny1jzihGo3VnRu4Dnz4FDtaWYUPj6mu/oXdOkNxpoB3zei9XwrDyiUeKUWwzdJwW/BXd71w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738673344; c=relaxed/simple;
	bh=mzLFYGyzehDRkrpL2rCtNf203OLWIuVzWWcEfWVQNGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z4aTo7g9ZAE0jGszLz6Uw075eYta3/CcC0cp/LXjBdRJWMzXUmGTIVQAIfgSkD6Yqq9Vr5N+vLXoFjzuDqtNbDl4lsMZHqBTydOvoaHIN7Kv4TvDLNJA9NsN3CmiScHI4yYBd2PPVagomgW5n/Co2yImssdhjbcRbDMbGTlvzQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=o6AJPwqt; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54020b0dcd2so7168101e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2025 04:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738673340; x=1739278140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqRA2SBT+SjnAkRh9pVs7Dxhd7dSiZIUx9jsLOe7RZ8=;
        b=o6AJPwqteEQcW/loahGvT6wLEGSoAVLbpW1Wt7altjg7XJLOwVyu6NsdAcTE9H4R55
         O9Mj5jk/Gn0YL1dXPhLx7kvnBkcN9rAK31pQ8+t8EuTJhCVaWsoW8I3xJDbtCXSowxeT
         I2VIV4VDoDtoR1w5YihjN9R8VFl1YDzXJ16Pp5cHeNTUMmmRtPkC0j7tdeXkxQ5zKJnI
         SVKZivJ9Fx5fyzPXlt8Hy2GUvrLvUSs4d8pOxNwT2XaHPkAH410ucJgBVou2n0exa42d
         Jjnb0Pq3nl2jgxujoyWn3fMTaJYwjTsnqeDf8hAqJDdQttAs7ui2GBv1RJp02CNTXAmC
         hscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673340; x=1739278140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqRA2SBT+SjnAkRh9pVs7Dxhd7dSiZIUx9jsLOe7RZ8=;
        b=dm9NKRLKU1a98D46Ixqzq/Ih+rzWJEG8DFFYXUPPczGxreMeLK76bw1IzDWgpR6uOf
         99Y3hbBXnQZAS98sqfQPJMN1hmyYDhPCLFN4yzGA1Q7IvMsYbe/vUemA1+rc6gALyrjv
         BrXQyHL9YZHCQPb9tQXxXR3bOYlx7AakdiMcc5XJJXTbGj9GO0rzc4LF37MFWP7wUABG
         22LJqLh2tCQTGljd86+8qnSx7B5Y2w2GbcI/nzfB2SLgWn2T43dvZC3YhCbVQORox/uD
         qpt3d8aPtudcZ+25sTzjN/Zg/q9PJnx7fKXAMRATMgOah5zC5obE3M8YuyhJprBogG0d
         StSA==
X-Gm-Message-State: AOJu0Yx8aoEK74lVPGC76f7eZpZEOYYOFOqNO5yP2jRjmscPk53TyPws
	YvozWvaK5yXSVoJ3V8FtdPrbsD1Z1bVc5RtbojgK1Oai5stFBpwiWcCbB3LCIWzIT38g/n14mO9
	OM5hSGenBqPipPzrajWFQ8frqlAtB3bBkDe6xRw==
X-Gm-Gg: ASbGnct+r5OunNI29Lmw8/wrOF3+LlQJA5Reoh1xGi/0D1xbIH/4PgxLLOnMSGoJOv5
	MdOXrcnEUmMsbEZCKRSVWr4lRyXJQe1ACWOZdxAYH5lFKBBEZfpL/KhfC6lK4/gePWqfkRMw8jh
	Et3u8FkYbbb3lvL8VXAQGX0TjL2aMS
X-Google-Smtp-Source: AGHT+IFLvExsKG5QWwsqrKqyeOtjHht69G0JC//9fyUYqfAKhgSgDDacyrIGnw0QokpTapXDqPo3VyQdLX5556N9RGI=
X-Received: by 2002:a05:6512:3da4:b0:542:223c:30f5 with SMTP id
 2adb3069b0e04-543ffb489a8mr1265662e87.24.1738673340179; Tue, 04 Feb 2025
 04:49:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203031213.399914-1-koichiro.den@canonical.com> <20250203031213.399914-3-koichiro.den@canonical.com>
In-Reply-To: <20250203031213.399914-3-koichiro.den@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Feb 2025 13:48:49 +0100
X-Gm-Features: AWEUYZkM5jQaBKP5J2U5AWw7Z9Gvy52Ww6wrmmyt2rxzTmv_Mxr367RTSyTf7d4
Message-ID: <CAMRc=MfcooZXBqVpbQ0ak+8LGsPDzwKSN3Zfb0eZDx1Bx4duzQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] gpio: aggregator: introduce basic configfs interface
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 4:12=E2=80=AFAM Koichiro Den <koichiro.den@canonical=
.com> wrote:
>
> The existing sysfs 'new_device' interface has several limitations:
> * No way to determine when GPIO aggregator creation is complete.
> * No way to retrieve errors when creating a GPIO aggregator.
> * No way to trace a GPIO line of an aggregator back to its
>   corresponding physical device.
> * The 'new_device' echo does not indicate which virtual gpiochip<N>
>   was created.
> * No way to assign names to GPIO lines exported through an aggregator.
>
> Introduce the new configfs interface for gpio-aggregator to address
> these limitations. It provides a more streamlined, modern, and
> extensible configuration method. For backward compatibility, the
> 'new_device' interface and its behaviour is retained for now.
>
> This commit implements minimal functionalities:
>
>   /config/gpio-aggregator/<name-of-your-choice>/
>   /config/gpio-aggregator/<name-of-your-choice>/live
>   /config/gpio-aggregator/<name-of-your-choice>/<lineY>/
>   /config/gpio-aggregator/<name-of-your-choice>/<lineY>/key
>   /config/gpio-aggregator/<name-of-your-choice>/<lineY>/offset
>
> Basic setup flow is:
> 1. Create a directory for a GPIO aggregator.
> 2. Create subdirectories for each line you want to instantiate.
> 3. In each line directory, configure the key and offset.
>    The key/offset semantics are as follows:
>    * If offset is >=3D 0:
>      - key specifies the name of the chip this GPIO belongs to
>      - offset specifies the line offset within that chip.
>    * If offset is <0:
>      - key needs to specify the GPIO line name.
> 4. Return to the aggregator's root directory and write '1' to the live
>    attribute.
>
> For example, the command in the existing kernel doc:
>
>   echo 'e6052000.gpio 19 e6050000.gpio 20-21' > new_device
>
> is equivalent to:
>
>   mkdir /sys/kernel/config/gpio-aggregator/<custom-name>
>   # Change <custom-name> to name of your choice (e.g. "aggr0")
>   cd /sys/kernel/config/gpio-aggregator/<custom-name>
>   mkdir line0 line1 line2  # Only "line<Y>" naming allowed.
>   echo e6052000.gpio > line0/key
>   echo 19            > line0/offset
>   echo e6050000.gpio > line1/key
>   echo 20            > line1/offset
>   echo e6050000.gpio > line2/key
>   echo 21            > line2/offset
>   echo 1             > live
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> ---
>  drivers/gpio/gpio-aggregator.c | 549 ++++++++++++++++++++++++++++++++-
>  1 file changed, 548 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregato=
r.c
> index 570cd1ff8cc2..c63cf3067ce7 100644
> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -9,10 +9,14 @@
>
>  #include <linux/bitmap.h>
>  #include <linux/bitops.h>
> +#include <linux/completion.h>
> +#include <linux/configfs.h>
>  #include <linux/ctype.h>
>  #include <linux/delay.h>
>  #include <linux/idr.h>
>  #include <linux/kernel.h>
> +#include <linux/list.h>
> +#include <linux/lockdep.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -34,11 +38,39 @@
>   */
>
>  struct gpio_aggregator {
> +       struct config_group group;
>         struct gpiod_lookup_table *lookups;
>         struct platform_device *pdev;
> +       struct mutex lock;
> +       int id;
> +
> +       /* Synchronize with probe */
> +       struct notifier_block bus_notifier;
> +       struct completion probe_completion;
> +       bool driver_bound;
> +
> +       /* List of gpio_aggregator_line. Always added in order */
> +       struct list_head list_head;
> +
>         char args[];
>  };
>
> +struct gpio_aggregator_line {
> +       struct config_group group;
> +       struct gpio_aggregator *parent;
> +       struct list_head entry;
> +
> +       /* Line index within the aggregator device */
> +       int idx;
> +
> +       /* GPIO chip label or line name */
> +       char *key;
> +       /* Can be negative to indicate lookup by line name */
> +       int offset;
> +
> +       enum gpio_lookup_flags flags;
> +};
> +
>  static DEFINE_MUTEX(gpio_aggregator_lock);     /* protects idr */
>  static DEFINE_IDR(gpio_aggregator_idr);
>
> @@ -61,6 +93,97 @@ static int aggr_add_gpio(struct gpio_aggregator *aggr,=
 const char *key,
>         return 0;
>  }
>
> +static int aggr_notifier_call(struct notifier_block *nb, unsigned long a=
ction,
> +                             void *data)
> +{
> +       struct gpio_aggregator *aggr;
> +       struct device *dev =3D data;
> +
> +       aggr =3D container_of(nb, struct gpio_aggregator, bus_notifier);
> +       if (!device_match_name(dev, aggr->lookups->dev_id))
> +               return NOTIFY_DONE;
> +
> +       switch (action) {
> +       case BUS_NOTIFY_BOUND_DRIVER:
> +               aggr->driver_bound =3D true;
> +               break;
> +       case BUS_NOTIFY_DRIVER_NOT_BOUND:
> +               aggr->driver_bound =3D false;
> +               break;
> +       default:
> +               return NOTIFY_DONE;
> +       }
> +
> +       complete(&aggr->probe_completion);
> +       return NOTIFY_OK;
> +}

Suggestion: this is the third time we're seeing this mechanism being
used (after gpio-sim and gpio-virtuser). Maybe it's time to try and
abstract it as much of the code is shared?

The rest looks good to me.

Bart

