Return-Path: <linux-gpio+bounces-22968-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20031AFE2B9
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 10:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFDFC1C42E51
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 08:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2069427510B;
	Wed,  9 Jul 2025 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGo62AK4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FCF22A7F9;
	Wed,  9 Jul 2025 08:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752050000; cv=none; b=NbMfMqY1CY4lKrruqZ7P1sW6MG8vx0/t+ktdEGOCE4mLtl5kGTFA+OZ+HIdzjJ/dWO+SB4efd4R+k3JHaIHtPu1HvozssjAwNqeA+9ueOuRqjG2Y2bkLS/K8Hk41deYfbwxUYn/Flg74GPYmlSvDFDbAa48M2SwyID0QxKUGw+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752050000; c=relaxed/simple;
	bh=9+WyfIJGHjg13rme9Flpy+sQDjb/Qfg+lpK+DYWwHoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CnGdfCCY5BPa9mJ9xnK13NkE0B4jzlXAQGMtItd6zCvIUlw8hzWeI85svfj2boskOhIlT78HsL82Ng48ubHY7mwGJyfyu90hO2QtSuRR4rfktTf2WPlVKoDyh6OXqsPzFkjrpJXyJweILahl9VMEQVWJCXOjbdHK93VHvgPheyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGo62AK4; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae0de0c03e9so907680366b.2;
        Wed, 09 Jul 2025 01:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752049997; x=1752654797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSx8Je+RgwnMEIAcCKMHtWK8TOYZz4SAUO07h86htJM=;
        b=CGo62AK4I44IDGFQVYWvGs79ewEJYzlEsVV7i1echo6H5X4WnOysKiphS2ASauaaad
         V0DdojLsLyoyxCiZeL04PYeEgBv949J9dom2dbRp/S4Wb69t+uhvumzSciscbc1Y3Y8o
         YMJl/6ljBM6hdynem6Sf+yBRIrKSFg9BXgBRkH5Bb1gLEqOrgW7w54T/m61Cx/EILsjI
         mnAe8txp0Hm5GOqVeyWIzNj24ZREkUmvOtD03/AJZuZOFgyMPj6fupn9nbUKsCVRllxy
         VMs2g6RUxE0/lykNyMTnbGcBzP50SkwI/HE8qW6EhDeD22eaT8XLppXwnv2aHHn53ZNo
         125A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752049997; x=1752654797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSx8Je+RgwnMEIAcCKMHtWK8TOYZz4SAUO07h86htJM=;
        b=Ko/F0HrcJTJaf9jBLiw1BxEpfBKwi5I9oRCSqP4i9NonJ3voWJc1NNOLujSN47ahc/
         p8schXVwf1y5NgvgGYIDhsk8SgRDePM3U0xWBY7z68dm+XBeDfezZdo0v0cvK7aCiLr8
         LK0+AmTrzHiTbKfiMZluRJsCzizJm/T6bHJbhTuhgZzOUbh8NuaxejWRw3ohVddFliqv
         C1c0m85MJE7C278luNdRcxiAc9Q3766Y+XkctVQIxgnXOsak4H0DJ2zrEy5vKFDHv6MX
         l0l7xJneW1jb7j7g4iLyG9L9sTL7l4nX8LbA9nH2vpBISDk23dHQZuMRuQ6MNhf3WF64
         qoYw==
X-Forwarded-Encrypted: i=1; AJvYcCUNtY5Fr2gx/tTMuyWfv+CivujD00q/FP1uzx7jXB0QeK0s3LFtfBu/fmMRYIvnWe+4GhQjY/lkknOBj7Nn@vger.kernel.org, AJvYcCXP+suH5sffBazhYvQm7askazsJSOWlAUxmhKwh7L8yROeQCQMBgO1Kt80yPRIXvcSPlDkpkM2BB+lG@vger.kernel.org
X-Gm-Message-State: AOJu0YzNNKYTPFc742LPdQbLhZpkJMnPtVKWOTk8KXhm6w5D1e41Q6ln
	lVsKIN9kdBVWZ5dSAViMtl0GZFfSTFYhpXB5jfYN0+cn0SPIloC+OcEopnSH5n5yYz4ghxYC1EK
	jNydkqCtKxl8K40Jq6lwrGVdeaghzowk=
X-Gm-Gg: ASbGncsY0msyI2REGllh3qJm53CLn/rAT25+RmN9Nnw1IGCiIHCBkcb6HOu0xDncr2q
	a0qjoWq/H2Y49Gav86YSxijvehwAF2N4eCAzDfnzQ+Ohwu3m03wmdCX1J+eLAyNQM/rNdXu2E5z
	UAmpEuMYrPKduktWIgXekYjQHo+jAonA0wjP++e5xGoe9dleenu3y0P5KL
X-Google-Smtp-Source: AGHT+IF/ot5abuPWaIOwiRC4JZt3VIY7aaAsHT4N9dAkO57tMuiiTFRQbOKdu5Dhl8ZD0DF4+QEKTtLhXBuMHBQgEMU=
X-Received: by 2002:a17:907:7fa5:b0:ad8:87a1:4da8 with SMTP id
 a640c23a62f3a-ae6cf5d79a3mr174652966b.14.1752049997183; Wed, 09 Jul 2025
 01:33:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
 <20250709-gpiochip-set-rv-gpio-remaining-v1-4-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-4-b8950f69618d@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 9 Jul 2025 11:32:40 +0300
X-Gm-Features: Ac12FXyhWxVavHHS1_aYBkGHdup2qwUn7gx7FkWSFs41ui6Np3n3cHuITzjjqpU
Message-ID: <CAHp75VckSCyDiAtP+q8nGGiJBuMFi3Nke7Puh0SE9nBX4vUX+w@mail.gmail.com>
Subject: Re: [PATCH 04/19] gpio: wcove: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Nandor Han <nandor.han@ge.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 9:42=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.

...

>         if (value)
> -               regmap_set_bits(wg->regmap, reg, 1);
> -       else
> -               regmap_clear_bits(wg->regmap, reg, 1);
> +               return regmap_set_bits(wg->regmap, reg, 1);
> +
> +       return regmap_clear_bits(wg->regmap, reg, 1);

return regmap_assign_bits(...);

Otherwise LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

