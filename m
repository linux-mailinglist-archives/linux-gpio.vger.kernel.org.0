Return-Path: <linux-gpio+bounces-3253-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB77B85437F
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 08:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBDF11C221FA
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 07:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6008D1170A;
	Wed, 14 Feb 2024 07:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Conq4Dfc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C9511706
	for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707896180; cv=none; b=qxIpSD7Uvh4TVCek/qYZhC2W6CXYFDOiX8LzwZsVR29X9p55TLzQx8JPkJs/5W2Z643+SXfndbExUdKCt0wT1yvynmC5WbkXvz93zu+3iEZ7+xpWPaStsfL+hhV60GWqhumnJdsyGZmomF0VfZ9OkN5vERgjOomMJIdGrW0FyhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707896180; c=relaxed/simple;
	bh=jQgX0GlVgWEgxQYpVTyJl+PI2nDdd92BraBDYVn4Jqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fmPCWZLpXJI+r5qUabiW4CxiENL1OgEOW+kLTuuza9D9Z1TK3jh0w0AIz0qTde9jb43HLPq5PpSNvcCsMMpiNPLm7fQuRKJIkUGQv0rFhUVRuJLi9tnpySRl+a0MGZHtqKPgbfMHKDowhzekzvyq2w8Le2K66nCAIpmLxgVMXiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Conq4Dfc; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a36126ee41eso701631166b.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 23:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707896176; x=1708500976; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bO8otpsYynvgUbv3/tGdQxi/CXHAJp2KAjHCoy7P0BY=;
        b=Conq4Dfcv0SUSvfABV3WGgyRZQKDaTS8dHUi69i0lvFGOly8vVfkfhKY5T29pasIDy
         SThInh4iaKCqciyIwoYmhX6MbBN2HIi8r6ZJnFssJ/mQkQIl/PgSA2zYt9rbGXumDq1X
         fWIcbT50l5RHHaCpqBzgB3OWCT+6xBP9Lx1rjimW/CUd0QE5mgwlK4kuatFKlME1aMwq
         p9FL3pHmyJwSGY4duQ29NbnMS3ypV2hAdKadpVFFH5Zqx9l7a07kwzLlKMb4vmRlGvbz
         jbKiGc96cO7KA7MrksQWLTsNLS6kRqpytW1fMd5AIWeO+s1t0vDsaz4OTZYmIJEz7jso
         KeXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707896176; x=1708500976;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bO8otpsYynvgUbv3/tGdQxi/CXHAJp2KAjHCoy7P0BY=;
        b=IQ4XCvT9b5OEz+QVuW+JjmeMu2HI7E1+pOlPXDtS9RubN/iZ+SGQ9McxCsg6bV6joS
         e/dswIra6vy7r1ZYbIb9cOTx4lKSrxuVWz0JL/9VejB/aMLwVKMdXr5OrqMw2mdx81eR
         2RQD/OwAFpFACDcuHO/sWZbuQ3bPC5gBrdcTliR7D5hXIsT/9daxESgkJU2xeVSZ4bb4
         BB7xCHlBs6YQvD/LXFCQuUME38q4D9wSm38xfD47psYUDECgHCpbu64SgUW+ahRo6bU6
         S7UV0yujoDcZCHFjzIFvWg2+U2O0v9xb50lsDp9EEDzY70UBIUNWYjuF4dKPccJAV16o
         5ZgA==
X-Gm-Message-State: AOJu0YxzYRYvGqa2m+75cP2ssYbdPTBWF5myDdFWax5MbTbKQVUIJv+g
	UqZoXuHtzEdzGjQt8akiifmiURSTD3Yjy1MOTgaqt1SotKs07qP30XT9/18EFrhEaakOhwdH/kQ
	h
X-Google-Smtp-Source: AGHT+IH238ClREE+8W5t/c6MT/vZSHBmn3c+3P4FkB2x+DVhpvacfbwyb/lmYGuaYAtJ6fVnfzfMSA==
X-Received: by 2002:a17:906:c285:b0:a3d:293d:ed04 with SMTP id r5-20020a170906c28500b00a3d293ded04mr1049961ejz.19.1707896176281;
        Tue, 13 Feb 2024 23:36:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVpj42od/QR2BlvoyvHVzk6Cg+vTKbAQLHeAEAzXriYsYDYwkPRQZQwrQFdlce55AjWkOxwGV5yOPmk+ikyruPo8ncuoghnNow=
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id fj17-20020a1709069c9100b00a3cfcd8772asm1419878ejc.155.2024.02.13.23.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 23:36:15 -0800 (PST)
Date: Wed, 14 Feb 2024 10:36:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: bartosz.golaszewski@linaro.org
Cc: linux-gpio@vger.kernel.org
Subject: [bug report] gpio: protect the pointer to gpio_chip in gpio_device
 with SRCU
Message-ID: <15671341-0b29-40e0-b487-0a4cdc414d8e@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Bartosz Golaszewski,

The patch d83cee3d2bb1: "gpio: protect the pointer to gpio_chip in
gpio_device with SRCU" from Jan 23, 2024 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpio/gpiolib-sysfs.c:808 gpiochip_sysfs_unregister()
	error: we previously assumed 'chip' could be null (see line 804)

drivers/gpio/gpiolib-sysfs.c
    786 void gpiochip_sysfs_unregister(struct gpio_device *gdev)
    787 {
    788         struct gpio_desc *desc;
    789         struct gpio_chip *chip;
    790 
    791         scoped_guard(mutex, &sysfs_lock) {
    792                 if (!gdev->mockdev)
    793                         return;
    794 
    795                 device_unregister(gdev->mockdev);
    796 
    797                 /* prevent further gpiod exports */
    798                 gdev->mockdev = NULL;
    799         }
    800 
    801         guard(srcu)(&gdev->srcu);
    802 
    803         chip = rcu_dereference(gdev->chip);
    804         if (chip)
                    ^^^^
Is this test reversed?

    805                 return;
    806 
    807         /* unregister gpiod class devices owned by sysfs */
--> 808         for_each_gpio_desc_with_flag(chip, desc, FLAG_SYSFS) {
                                             ^^^^
NULL dereference

    809                 gpiod_unexport(desc);
    810                 gpiod_free(desc);
    811         }
    812 }

regards,
dan carpenter

