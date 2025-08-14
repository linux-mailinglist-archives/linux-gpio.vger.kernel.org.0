Return-Path: <linux-gpio+bounces-24393-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDCEB2695F
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 16:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7F35AA51DB
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 14:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72CB1E9B3A;
	Thu, 14 Aug 2025 14:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfApQ2B/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD04F1B87F0;
	Thu, 14 Aug 2025 14:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755180915; cv=none; b=upE+4t7DKE4S9QEBJt8qkzNbQyx64WyY+rCz08I17VVLHKeieP5sS3BfKP8uxaP+GeiNFfFnFzQb4jNZCHcGFjXLCF02Xxk94JcZqK/ff+S/dyKOVWKWpsLAMcGIlSu9m8L3Z/s2KPA1pdMP0yHr9hkqM/RbYiC5it7ZKFc1yLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755180915; c=relaxed/simple;
	bh=yPVowiQqVM3E/dNnPZ3g8sdf8tynSeuFLgbfdgPO6EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xz31bshQHUoVHS1AKxVfji15l860k1Kp3v5hQgZHBQ3xylh/1w5/GN06tb2E2hmuBWkrHrzbHFTZRGLGq78ROQ/gAsyFuBH4qumIWVqY7mJPR1daobAFSeDBHiaG6wxO4yQCNqmXwGeIKxlPQETy3fLPHVHbS/Rk37LueOf2M4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfApQ2B/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45a1b281d25so4132315e9.3;
        Thu, 14 Aug 2025 07:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755180912; x=1755785712; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nBptkyV5QJodqYn42iZ/F2qxr/d9CoCHpSVW2UDctRE=;
        b=lfApQ2B/iZfS9o/itgrnIRX4wLkwmK/HRLoLReGdcB5HbtslxHkYYHufJpPEKe69j8
         LcVFlXKhN/ofHNmf/Ruh8kHm1naGlNpiTiY91l8hdBEVWxu1t/OOvr//SzF2Va8gV2w2
         ArrkYOz/FhVv1kmcBfkiQgntepKIGB4vn1DvvtbLt7zBk8cg3Ek6cYcHWHkyNRg/trVk
         k3VnU0iHkTLGvlBSVh96+PYWgjos1Dlnqiw0qfFlRQxGezvDOM3yAq+UDztJHE94eyQ4
         zFaU4UO2k9V3olmzZ+/GiUAi5clKnvuWQwh7j4s7d6BqeJy1fDWT4+3AtiARA5rwQEVp
         o/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755180912; x=1755785712;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nBptkyV5QJodqYn42iZ/F2qxr/d9CoCHpSVW2UDctRE=;
        b=BtX0FYt7pzPzJvJ6T+7ZkdFWi8Rdl1+PGZR8DE9BMWw+Ttj/Ck7nmAtkFackYWpz7f
         iSjSDMPerv0Wh+aUsEbIihDLvTxl2QlEUDhuLslRXv1zAwzM8u/iEWOwfewxbBnphAZb
         gWWYsbNSD9ddBOmiU8nSa1CVAff1+RFUhu+IfAH63zLLo6inoVsoNs8JhI0tpo0Mh6JO
         3I1dVjzkYtshZUCCU7XEC+cpLQzbGaGk+tsO5mWT4fKFQFmdwTAUeMBx2L32BCwGLiVb
         P9O2LkPir6Q5omBo4cd7p3kg3gztE8XDM5z2pDv5YpAeK2BgwYBflTwQse9+dxBBMzal
         qyew==
X-Forwarded-Encrypted: i=1; AJvYcCW1AILwu4kW0ELfkF1fP0P7Tyel42JN11lbTG+/WJcUDnaFRkTHSmEc+8385ehvRnfi/FI67YD3mXwj4D4=@vger.kernel.org, AJvYcCWfQJXyUnD+CaJbf6ucV7ax736Oxuq2J6+5CUfQD7gVXiR6Xovz7O2UOSc0mRB0YSPfZVWBvJcc9T+Z@vger.kernel.org, AJvYcCWgLXd2HcL4V6Ve5IkAyMkDAoyoOpXRUcVrFQvVAi0HfawD4+UFtTYLsv+MCNGbyz/KJBSYcwGiwCmYSbJ2@vger.kernel.org, AJvYcCXVQudboI83YYkUvV7uwnYAj0spi3XxOpEcfMfZhTstWBnVesu1bs22gBuxXWH2AdhSrETwnIDnFk8Q@vger.kernel.org, AJvYcCXg4vjOoxAATwZ4PnkKwoYIRKwPt8+JdMXROG7cQLTzlAHP3XhI+HtKMeOEc5JoVv7ak/imqs6/WA2lgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN9krdOAZkI+Zibk/BOv6C8HBo7OIldbhdi0CJDFtHXqc8ugAn
	cf8wg8CoAN4aKyYwJm5LGfsqqC14FZV+B1BimpV1XXeAS9szX01DoqLP
X-Gm-Gg: ASbGncuZ1LSa2vnuuO/XJXGwz+kl6zjNyeSLoZ1X3DpD3ChvwNCMdmGeSxg6tcSKd85
	D5EDxs98zMZNQReZC7NMhjGuyuzhgZIf2uDzoRCQ5s5AN6UEtARQuiBJJjUKQlhJBvnffrO/ssk
	LgYbcHJFumV+w3o/En73j8rfvKqD1lgs7tUNGxEkv26GYhIXQtNlY6Xf7ZmNKowO1hDaXvbJEe1
	ZmkuOEv4jV96NCBScHQcg+r9JuFuEgygscTBeZMrwcZdDOz2XJQZ3XU+zDY75YR7c6QKSU5boDP
	yEJIMXRQmxZtc0GKtrLjBPq1auUXWCFMKpQnHGr95RKegWQkKLZa7OMPqeyO8TWu7CVyEJJfLxq
	naNNZJw5/pr0sPanLSV+Nvg==
X-Google-Smtp-Source: AGHT+IEWzjfR1gbJqCZmJrgJqMinjzSs5IctFqqaunulBjBxcuz13GcRmAcP3E1L6fMs9mb0y6MslQ==
X-Received: by 2002:a05:600c:1c14:b0:456:285b:db24 with SMTP id 5b1f17b1804b1-45a2017a75emr440855e9.28.1755180911841;
        Thu, 14 Aug 2025 07:15:11 -0700 (PDT)
Received: from nsa ([185.128.9.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1f7082absm9211735e9.24.2025.08.14.07.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 07:15:11 -0700 (PDT)
Date: Thu, 14 Aug 2025 15:15:29 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 0/6] mfd: Add support for the LTC4283 Hot Swap Controller
Message-ID: <2svr42ee7akwxwj5nizwe4a4hqdk4rslv7ivxraqg3jy6m3mxz@lfpn2nx4jdmm>
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
 <5713bb5b-3301-46bc-b30a-d2e4c58d1036@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5713bb5b-3301-46bc-b30a-d2e4c58d1036@roeck-us.net>

On Thu, Aug 14, 2025 at 05:54:26AM -0700, Guenter Roeck wrote:
> On 8/14/25 03:52, Nuno Sá via B4 Relay wrote:
> > The LTC4283 device features programmable current limit with foldback and
> > independently adjustable inrush current to optimize the MOSFET safe
> > operating area (SOA). The SOA timer limits MOSFET temperature rise for
> > reliable protection against overstresses.
> > 
> > An I2C interface and onboard ADC allow monitoring of board current, voltage,
> > power, energy, and fault status.
> > 
> > It also features 8 pins that can be configured as GPIO devices. But since
> > the main usage for this device is monitoring, the GPIO part is optional
> > while the HWMON is being made as required.
> > 
> > Also to note that the device has some similarities with the already
> > supported ltc4282 hwmon driver but it is different enough to be in it's own
> > driver (apart from being added as MFD). The register map is also fairly
> > different.
> > 
> > Last time (for the ltc4282) I tried to add the gpio bits directly in the
> > hwmon driver but Guenter did not really liked it and so this time I'm doing
> > it as MFD.
> > 
> Nowadays I suggest that people use auxiliary drivers in such situations.

I see. But do you have any issue with it being MFD?

I'm anyways tempted to the auxiliary device idea. The main usage for
this device is HWMON and I dunno anyone would use it only as a GPIO
controller. With the auxiliary device we would only need one bindings file
and slightly better bindings for the pins functionality.

- Nuno Sá

> 
> Guenter
> 

