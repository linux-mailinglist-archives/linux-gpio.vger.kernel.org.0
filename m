Return-Path: <linux-gpio+bounces-22242-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE7AAE9556
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 07:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D98C517C306
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 05:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F9F218858;
	Thu, 26 Jun 2025 05:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JykuT3X3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D24F1A83F8;
	Thu, 26 Jun 2025 05:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750917057; cv=none; b=fhGU3NL4X4YT69laqjmkIC4W5BiiQ98UHAQpRndt8IEWJh5vRYyjBr2ho5aQON81np06OhSR6wDorsPtIWntLdyDujaLfZpy/Q0+5VDbhO4Ysk9ZGXDMPH7aTuQK43cw/oVZ9gaeNsnp3chGpMotZUY5XHBgGPeM4D/hRPqZ/WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750917057; c=relaxed/simple;
	bh=vsAT/YiM3j1PCJE36m3WDvcuBKvCL2PorqcKAsi5Nck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jeGicfEtZiwVOQXF8JAAalQpb9Viu9mZX9cg+yGcCZLIH3pkqnUtz4KfBfFRMEHTwUlxPGBNDItp/mQi1CY3xQEoAKeDriJOD5ZmVYrrhS/f/VBbrPolcF/CxmzRdb/jj0tvvYK8ga3J9C0kSoi1zowuslhTwkUhnCubEkU8hyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JykuT3X3; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235f9ea8d08so6517685ad.1;
        Wed, 25 Jun 2025 22:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750917056; x=1751521856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dO1Gfk+XICQekepN0WGtaykP0qulc4tWEnEUlOsymuE=;
        b=JykuT3X3FhFdXvWob6cGyAwa0uX7T/veu49e8mQTb95dnSVWAnbnTHl4gDyayMT08u
         dfkAQ5c+jYYCgf3F7yEd6dJwEThN4ZFKLwZGbcpVoL0debnhDtY7OFCniB9PXbNGrI07
         V4qsw93I25KgTsOS0855Y37vRkVDCtGygyVFAJM9mf4atoY5Tt/9HJka8FnqIY0gGTRq
         f+hi1qEXCU79f3CJvwHvR9HSFk1pCYxCZgSXm/8h8h8SJ1BiuvysBgCH11NLMaptTk1b
         z6jgusOkeWVk/Np1s9uMwd0cehz0cd/ye1Sweozdjz0LzE2O6xvB0MbFlrIJaoe3APSt
         gVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750917056; x=1751521856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dO1Gfk+XICQekepN0WGtaykP0qulc4tWEnEUlOsymuE=;
        b=nnMGtxO4ZZ+s4ypg+zF3sINHJl4PpqCwGjtJxohMBOhlWkezs/PMabS59eEyYUoae8
         sxhvi3ovxp/0iyF5nSWjQnltY5cZmF4RqjBLx1Gj9ZDRyA9cIRlZoJYgIA54z5DJerp6
         CmI9l6AaWgAGxHrN2ZgYU9xeD3Sl47rw8uQJ8AUzDoXBpBWzhIJcuqys/LFD+U4Lvv+E
         +B1ZvWBNVAR/e1XK4815MSd2U/CkCwMbLuLb6Xosq9Gbe/3QHZ3rWzedr6wHhzSUycYK
         nxe3IyDj4DW2AAJ2UKHYCfb+7NuxGZ4UtT3frNvH03bfxDCEVpVvdmyr9VZHDRYZdTqh
         9GHw==
X-Forwarded-Encrypted: i=1; AJvYcCVjnwcy+/ry9VeyR1GeYTJ8w910oGw0eOSw1JmrQtYNDOAo2wUHkNu+Mv4LSE/Q8Yq3oYwxKu2QKHH/@vger.kernel.org, AJvYcCWNxZM4VsApxfZRQKIqBVXU3aXxnCSaVs6Jffr3hleJalnnvgcKLQbs7wAcUoHxhEXb7Gprh6djn/X7m60+@vger.kernel.org, AJvYcCXpS/zL+c7sizQeDIeOdu4N0Jo5+MxJR6EDhPwadtFU4+r8D/DuvZCWSWnRA1s/ghL183GDOf31L3z7Fi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ5vMzJ46X2wg9Kf5hv5DdGERD12EoIeCdnXNo9KlE50zPfAMQ
	YBV+BAZS91CO9i5Ecsvuzwjp1do5R+gv0wvhNoZUMzsfFfUWOyhtwnbJIQmwhw==
X-Gm-Gg: ASbGncv8ILNsLZi9bEhZwfzJit+V7uBf3I6iK+EfQ+dyhV+utL9vaDvja1qUaLjKMTe
	JIP6paTwztOdUSgm16eo7ceWYc7V9mBoz/ZETuWexAHkowMkEakkbhn4vNB6I1NmeIJwUHHH/TH
	axMIsYoxu+G6IfpavVPjJkri141j3JeKtSaP0NQLZVGIk3r9omeelA7QeT8XDuWw5VEgMTOFyCr
	AxBawnKPcOMpSKNKav3kGk4yM7czeTz91Zgx1A3+zZHWPJGyEC/r/PoaQ7fziNyYRpHV+OwnNpD
	57de35oIvthjCMG3ZC0wVnYh0eaLMRaPEmun3kfeKuJKUkNwRooawcSpsxPBGwdMcQX384b0SQ=
	=
X-Google-Smtp-Source: AGHT+IEbWtEww8ETL/eMwAJFi68QvX3nru2u6fH7ysgdTvNlFr9bKRnrgWfJuHaIQKUXtEI4coYCcA==
X-Received: by 2002:a17:902:d48b:b0:234:d2fb:2d28 with SMTP id d9443c01a7336-23823f873e9mr100816885ad.2.1750917055745;
        Wed, 25 Jun 2025 22:50:55 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9c8f:acd3:efcb:bc3d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393571sm147619375ad.19.2025.06.25.22.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 22:50:55 -0700 (PDT)
Date: Wed, 25 Jun 2025 22:50:52 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RESEND 1/3] Input: ad7879 - use new GPIO line value
 setter callbacks
Message-ID: <cavfhsyqqykfp67x4dsf5y4pubtfkg7y5l5xe4jvspmhi77rxu@5yqftptgech7>
References: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
 <20250610-gpiochip-set-rv-input-v1-1-5875240b48d8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-gpiochip-set-rv-input-v1-1-5875240b48d8@linaro.org>

On Tue, Jun 10, 2025 at 11:39:58AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

