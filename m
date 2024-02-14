Return-Path: <linux-gpio+bounces-3274-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0A7854766
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 11:42:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BD79B2483B
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 10:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FAD171CC;
	Wed, 14 Feb 2024 10:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S46/b+kW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D6C18021
	for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 10:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707907339; cv=none; b=b6cdesLMG71Mer34DI+2Jt6i9hFBiWrfEQLeDlntaWS674o6I/QGrMhxsE9P6AitpTPjSBEI//vd+m7HiEngK2CiDVs7708t+Z/aKyBhaDCdYFa5SL6RuWtlPbPPZOu9IxC0EwtznpVV8z3qTk1dqDjK5+Ft8wuzwUCU5kyr1zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707907339; c=relaxed/simple;
	bh=0yikU4zkapQmRRrvEYZ164RRm1PDnmlrOVqbaO8X/8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHgc2E8x/V04mk3O7IQ9JMHpYiXiA/iMqL/gVoPlwTLyFKxAo/+tOEIu1QOLKSah/IG5jhRT6tC68PNO/nZx8A3qClGCUK8574FKqnLI5NKblXPtFgXA1nsZT0k5wkEb0VJF9w4ePv57Y0H05RRluMahU8uRVWABHrxZfmCLlTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S46/b+kW; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5638d0b93cfso185722a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 02:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707907336; x=1708512136; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TlBRunIV9FJtQYS6hVWnBr+F/GaOVY+CB3vs7UQi9C0=;
        b=S46/b+kWSFrGYrLNEHfj/4YnT5IUZDW4qf3S2PIpGbDotaSZfiioEDsBYoiaNdCPpu
         rJLuSlcb44AupQKiuykTKVEnPI7dQ+cdWyAwi3+hKD/YxIBlnVUX2JLSBLZG/MSimYTQ
         KHyWZpLoiy2T+9xfPibcA4HVu51uZXevuqbJpQVLfsJkKDk2zd5WF0w3F3s5vAjEA7Zf
         ebVFAB1o/vu97jNfgbFoC5K0YOr/jBdtYZG8TlIPON/I3KhbrPCfr5MlijqRyUGmxQsp
         4u9rKin80Wur6GSS+Aytw+w9z5zFqkaZX3iLk5/pAQsbfcZ4zPTcoQ1sQmaIRz9uB1Iz
         ctWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707907336; x=1708512136;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TlBRunIV9FJtQYS6hVWnBr+F/GaOVY+CB3vs7UQi9C0=;
        b=n1vTH1kINUAPj0UeqtE0YZN38eaTQk7Fqpb+cgDWS2uObON+EeA3ylCwbbe4ZFPpUP
         kOBz8f5zZacp87t6KvVjKYy6OrJIvGf8/b+cGsaQ9tT05LAJ2CXXjmOQC+DfW5Clzr38
         RN2e7f7dyKhRILJAsNT/lSLfiJPIfupa1aYj/Twr6YjXZRGW2DHiDJq5KrTrx3Z/DQXV
         ei2FgCLvYfVzoMoHCbQpQxIui4Y+YtKmvnhPVpWqjDkfH0Hw2Q9XlOukPrp4z3IJRO/M
         4sxrgRDYRpa5H90JqgLgE9BQ0GgyUSIU9Aj6lb1v3jotnGOpLkNGt/FTrPgSs8wLfAzm
         ZMoQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+4BGYUEYji5ZW4Q39HmAYIgvj7bZbkfIUpaNWJ9+NuWlvii47mRXCo/iAr/ns8DUUK0WKskFn/kXX294DCn5y2X2iZIL/KCaXXw==
X-Gm-Message-State: AOJu0YyE+QRfH1FC9Vbmttmfmz+/iEKSOxqE/NWSRh8FHs9KRrMbuT0e
	+7/qJdsOEl0Hyif0MVMiQAL5XVG0T2ZZsJBJO48ROFor3qi0SpoF7Mv9M7TML7w=
X-Google-Smtp-Source: AGHT+IGkuA2GWli+5I32d5DEo99N4VTsRlztoDfBBkaRh6jF3B2MHqkTeAnEWMMMVHEL0hHwL/rxyA==
X-Received: by 2002:aa7:cf11:0:b0:561:c157:8074 with SMTP id a17-20020aa7cf11000000b00561c1578074mr1691014edy.0.1707907336137;
        Wed, 14 Feb 2024 02:42:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXWrXA54VqqJYtiBN5WXLrEtpBbUOhoEH5pG6nub3ovo0r3N85PiSD9841CPsLBxKeGSd39ItcsC2VHOFbFRJspsUbUZpPP3zLlpOviJKQx4W9n6FDv0F/D5kU510cDDWVdcWzd
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id t37-20020a056402242500b0056104738371sm4580083eda.65.2024.02.14.02.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 02:42:15 -0800 (PST)
Date: Wed, 14 Feb 2024 13:42:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: bartosz.golaszewski@linaro.org, linux-gpio@vger.kernel.org
Subject: Re: [bug report] gpio: remove gpio_lock
Message-ID: <f4c17b4e-5111-4ad1-a077-85fb3c548e05@moroto.mountain>
References: <deee1438-efc1-47c4-8d80-0ab2cf01d60a@moroto.mountain>
 <CAMRc=Mf+ffh0AvYRgNzAhvE63ZxNXmuxkMrdu+e_NAZE_9drvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf+ffh0AvYRgNzAhvE63ZxNXmuxkMrdu+e_NAZE_9drvg@mail.gmail.com>

On Wed, Feb 14, 2024 at 09:55:17AM +0100, Bartosz Golaszewski wrote:
> On Wed, Feb 14, 2024 at 8:31 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > Hello Bartosz Golaszewski,
> >
> > The patch 35b545332b80: "gpio: remove gpio_lock" from Jan 12, 2024
> > (linux-next), leads to the following Smatch static checker warning:
> >
> >         drivers/gpio/gpiolib.c:120 desc_set_label()
> >         warn: sleeping in atomic context
> >
> > drivers/gpio/gpiolib.c
> >     115 static int desc_set_label(struct gpio_desc *desc, const char *label)
> >     116 {
> >     117         const char *new = NULL, *old;
> >     118
> >     119         if (label) {
> > --> 120                 new = kstrdup_const(label, GFP_KERNEL);
> >                                                    ^^^^^^^^^^
> > This used to be GFP_ATOMIC
> >
> 
> This not being GFP_ATOMIC is the least of the problems, we could
> simply change it back...
> 
> >     121                 if (!new)
> >     122                         return -ENOMEM;
> >     123         }
> >     124
> >     125         old = rcu_replace_pointer(desc->label, new, 1);
> >     126         synchronize_srcu(&desc->srcu);
> 
> ... but this synchronize_srcu() call will trigger the same issue.

Hm...  Smatch only triggers a warning for the first sleep.  But then
Smatch doesn't consider synchronize_srcu() as a sleeping function
because of the first return before the might_sleep() so if it did
trigger a static checker warning it would be inside the synchronize_srcu()
function.  And unfortunately I ignore synchronize_srcu() warnings
because there are some kind of old bugs which trigger that warning...

Sadness all around on that count, I guess.

regards,
dan carpenter


