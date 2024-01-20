Return-Path: <linux-gpio+bounces-2372-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD7F83344F
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jan 2024 13:42:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFB982832E4
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jan 2024 12:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59E9DF78;
	Sat, 20 Jan 2024 12:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j99+ZjTe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C23E55F
	for <linux-gpio@vger.kernel.org>; Sat, 20 Jan 2024 12:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705754574; cv=none; b=Bpaft+/ua628SydTl5ye0C7lW6NINT7jLmTWwNv2X9yq01l68QWN+ZJiZmn36/Xef1UAK1ZtlYYbUGdEhsU6qmVWg450EHDAZPQZJPDzr1Mhe6gvcmkHRDtH+baBLP8IylK7BuFF8wjNDYDn/bm2HcIsBjTYmpie35Yzni8Z0Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705754574; c=relaxed/simple;
	bh=1NNa9BrDR2CGWfLP+EddmhWmIlMpbRoJkZN4wdYZfqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WoGs94/fzS7sywAcC7jEkpjuuIHPkOtnskVfbKK8tAkdaszSfDbTkWf7TWIWPdGbeinCPOep56XZpX/OiDs2tzLN7fXiwiztffhA+whO8SOO9rDYM7L5w+DNRvs3bmTStnm9tziW/+xfTA1Xu71WRnSgRyiN3Z9T0O8VqlwFLy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j99+ZjTe; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6e0e08c70f7so331317a34.2
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jan 2024 04:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705754572; x=1706359372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1NNa9BrDR2CGWfLP+EddmhWmIlMpbRoJkZN4wdYZfqA=;
        b=j99+ZjTe49VK1s3b7TGU5RE460nQE+cDZPHbtN2XxeO1sSBHoi1fdxbhRcwkbQhsBY
         pAORWTMqREXrW3gedHg4SMaAS6rcyWQf+UYDy+018dmYa1ZcYCkhHpZB/uH/P6mq2xae
         i6md0225QTfsHHjfJ3ZswPigLBVHW1KO+OUCpbEJciMWbEXVZJ7+J5WZnZ2ZzS+ol7Y4
         IcBsvGxZhKh724lC9gmU/q25LIPIDdK4Ejwp3kjd1f+kW+0EOPj0FHDogoeZWJZ8s8r9
         sKWPDnCPXRavdoN8ja7v4OPR44cDDTf85KePCSkKKr6yHHzJ7n73zDf2VsAFhZio/KBj
         OQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705754572; x=1706359372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NNa9BrDR2CGWfLP+EddmhWmIlMpbRoJkZN4wdYZfqA=;
        b=asbuWaYi9p0YnHXHvrTqt8mHUMzioTICoCqGKZfA2MEEX5NVn3YsPlFdrfwZPHMGRb
         zIdXVGtPa9fiDaI0VMUnfZ28ggxVynnb5H9C5kt11s27pnA/0q9rvUETRGoCx2E8d0lz
         eS3KqKMMHjrw6nf/pOmmDkPbWSvhK+OsyuCDFqXD5ofJ+wUIFH9sm191EQ8HcAIIXNuy
         0Pl4nJewtJCDXh4qcG/cPk7KcAJP0GsyQIrlWs4/agao2U8air9WhLJw7kRnP0DwnFzb
         /g1M3M8Syf2sj45NVRlhoEb0PEfs38nFuhtFztT9/4sW0Z+sjj0SNUVK4nx2JcX1yA+Z
         4T0g==
X-Gm-Message-State: AOJu0YxOUPROq8Ml7DJDs9RrXVGZt9t0wAEJgNkyX4QhAx+DfRrPajf7
	TBf52ESgRqdwvIAfEj97KkzPlNoNnQsgsxbhDWAFzrJtfbT40++GLu5kcrvU
X-Google-Smtp-Source: AGHT+IGwsJS1ggNWdxlfP8NsSFCOhw2dZh2PIeCfRptgc3OBhS55/XogjB6qqp1h17paLDD6y17/Iw==
X-Received: by 2002:a05:6808:f15:b0:3bd:affe:e449 with SMTP id m21-20020a0568080f1500b003bdaffee449mr357406oiw.18.1705754572156;
        Sat, 20 Jan 2024 04:42:52 -0800 (PST)
Received: from rigel ([220.235.35.85])
        by smtp.gmail.com with ESMTPSA id v14-20020aa7808e000000b006dbc4cb72ebsm2699473pff.201.2024.01.20.04.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 04:42:51 -0800 (PST)
Date: Sat, 20 Jan 2024 20:42:47 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: pinctrl: Questions regarding pinconf_ops and bcm2835
Message-ID: <20240120124247.GB85986@rigel>
References: <102ae999-6574-4b14-a24b-826533b47a5d@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <102ae999-6574-4b14-a24b-826533b47a5d@gmx.net>

On Sat, Jan 20, 2024 at 12:34:27PM +0100, Stefan Wahren wrote:
> Hi,
> i recently noticed that the BCM2711 (used on Raspberry Pi 4) doesn't
> implement pin_config_get, but this SOC is able to read back the bias
> settings of the pins. After looking deeper into the pinconf_ops i had
> some questions:
>
> 1. Are there any other benefits from implementing pin_config_get except
> of a proper debugfs output?
>

Didn't reply to your previous sends of this question (or even read it
TBH), as this is a pinctrl question, not GPIO, so not my area.

From the GPIO subsystem perspective, no, as gpiolib doesn't use the
pinctrl API (defined in include/linux/pinctrl/pinconf.h), it uses the
struct gpio_chip defined in include/linux/gpio/driver.h.

That has no equivalent to the pinctrl pin_config_get.

That perspective also applies to the character device uAPI and libgpiod,
which provide the userspace interface to the GPIO subsystem/gpiolib.
The value those return for the bias settings are what was set by the
user when requesting the line, not what is set in the hardware (as we
have no function to call to get it from the gpio_chip).

And now I have something else I should add to the next version of the
GPIO uAPI documentation that I'm working on.

That doesn't rule out there being other benefits, but none from the GPIO
perspective, AFAIAA.

Cheers,
Kent.

> 2. Since the pin direction of BCM2835/2711 (input/output) is already
> handled by pinmux_ops via gpio_set_direction, how should pin_config_set
> handle PIN_CONFIG_OUTPUT_ENABLE?
>
> 3. In case pin_config_get is implemented should the parameter
> PIN_CONFIG_OUTPUT_ENABLE and PIN_CONFIG_OUTPUT be handled?
>
> Best regards
>

