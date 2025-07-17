Return-Path: <linux-gpio+bounces-23418-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80573B093ED
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 20:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F9ED3A75BC
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 18:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796DF2FEE0A;
	Thu, 17 Jul 2025 18:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Wgponx94"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FB42D1F7E
	for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 18:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752776963; cv=none; b=E5da01f2dOT2Zk7+QFAagfLd66iYR48t9aLHbgCs3DLpB1fEV6n8mTU1lV0ucJCayDOuTzzHp3wFgerEyB6mXPGTqR3b+0vXP2RUh8LR7q1x8UNzETdNNDp842c6YVH6fWIwPjKQwjBQDao1js8y2nPwxr87AhPzBrOKFAgQJak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752776963; c=relaxed/simple;
	bh=s9KWXPuVzpechZ9wxE9UyrtfQwW4ldRnELbyV9NeSmk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sg6XZPVTMyNHr51Hx11EdXWa6eJ3NQXoHzI4ZSRDu2OTc04bwAuBhN0ki9ev0/6i72dfmosbZeVHt6x+DkZ9zT/4MS4YC5B8iKMmRoKRyVh/w4PBOIEiKYvA/wNGZqUT2aUo9JYOvcPPYytjlElLZTdjscNnRFPJsUD6Kkmsibo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Wgponx94; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae0dffaa8b2so257742366b.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 11:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752776958; x=1753381758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UnPkrh7Td7OEqLas58nLl+SzPw9IrgLbf6OBLnf7ieU=;
        b=Wgponx94IVcLmImZI3t48Xwh0WEHCV5aOOSH6QD4QBCxDQSHLiDmg+o3upbVHdQaH4
         /WPzuWFxP+n2UBeJOZVFbo2Hb5sQO11yq2n7Em397/NKyyA0bS1MO9SFYtratBkPY+Zg
         z+9oZOqua8WLqEou/+rUTLUiDqQ/tzWwoZ3gUnKaGopNmyhz79vEVFTNyM9h9WdBFg0W
         gdqWg0gLOUoojNFbKCzVnX3pnA9XhsEe0iQYZH2579UoDa6nQ2IQG5OwgBdBoUbTkUWf
         /g2iP4OIIAe2QKAIxQSms/5Xfz6QsVB5UwTMihE11jGKbxNfPnKORI/sAhnRthmKrIDL
         HSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752776958; x=1753381758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnPkrh7Td7OEqLas58nLl+SzPw9IrgLbf6OBLnf7ieU=;
        b=BDNXjc2JBWS6Pa8AqVmEufA7zWS4K8YQdQlEXqAOdh68IXky/lTzHY6oB7nAwPYk9l
         88YrfIZDYhBniYPydM2idZU05RGt0kg9LGzpnq+mRRUOMPVF1YzZ7MBikuPgquoD9gkK
         HOLnZfQlhPgqcRQNGMBj3UHi76E6PAoUseYsODdKGpHZYqXJBpYJq5nZYtr99PWTg/TV
         y9PhCfUQSdSJz+Q9GQWf1bpWbqC8/YnX+PRdJ7o5Xg21mCJKzh8psdkSJAcgNlu4b3ul
         uYQ7Tk+ep6BIpJnnfMnvBzDf42IgX1wPQKn3uJFA9b5iRBbpZvFCc54JSi0oRFV5SZx5
         CGkA==
X-Forwarded-Encrypted: i=1; AJvYcCX/gYPmTuTIjDKEvoMmlDT2l/H74kg1cWjJ1uvS3isQ+NbYm0pKGJCKpZBbyb/ut/OMRKb0wHSflklw@vger.kernel.org
X-Gm-Message-State: AOJu0YzQVsgYsBP9njPvieHVu98GtGpxJU7hjxwGU6vlkSt9RHoJ7Yv/
	r5pBCnhX8eOGnfqGYEug3MMPzd/kFIYomcHOLrcC4uQRgAhwF0XJ/pux2/hvhQ+jqm8=
X-Gm-Gg: ASbGncshG6R3thOECSpSqi+P2unyT2RLBIUCXjTIECnffznJ13ztVd+TqKTexaDuvNP
	rz4JVs/RkdBjQlu8B7tJRZVShe/z004T+AJXVoO4puKioiGC9zjD1+lWGxkT7TyNM+v/8YCAFVI
	EmUuWVZZuyzHtnM0NXIcTTGwQC7YBE3BMLsq9qoHXSYgXNb7QIgweTymVImr1ufLWUJbgjIfBZl
	/biTH+mFENn/iUTwpBp6B5qBDf/EKwGU0O2ccklsLw42QOJNdUwgWeeJzquorhTesmRmYh76IpP
	Z+sHA5vBpzgKF7nq4OamDk2IH0PovMJdcbx9SJ3EeDrISowOB+IsUyOs7af2r8Q7ToBpdNUawUi
	FVMmmzzZPH5mB/kVOslYqmaT8x6+mX7GGiPYWBuCXioLZTTQ+W2viGSfoSxYdFDtiF5Oy
X-Google-Smtp-Source: AGHT+IGIlkOCc+got8eZilH4YkyOZ7M6w9t9HW09vMz5wIZRJ5qB6YDgMTRbE0xwRMu3XsZ1b/Gu9g==
X-Received: by 2002:a17:907:d582:b0:ae3:f28c:753e with SMTP id a640c23a62f3a-aec4fa45ab9mr359310766b.8.1752776957828;
        Thu, 17 Jul 2025 11:29:17 -0700 (PDT)
Received: from localhost (host-79-47-155-191.retail.telecomitalia.it. [79.47.155.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae98d9361c6sm961490066b.66.2025.07.17.11.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 11:29:17 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 17 Jul 2025 20:31:01 +0200
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [RESEND PATCH] pinctrl: rp1: use new GPIO line value setter
 callbacks
Message-ID: <aHlBZftbEphBYC83@apocalypse>
References: <20250717131349.54074-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717131349.54074-1-brgl@bgdev.pl>

Hi Bartosz,

On 15:13 Thu 17 Jul     , Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Resending with linux-gpio correctly in Cc.
> 
> Another driver we missed, that should be the last one under
> drivers/pinctrl/.
> 
>  drivers/pinctrl/pinctrl-rp1.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
> index d300f28c52cd..6080b57a5d87 100644
> --- a/drivers/pinctrl/pinctrl-rp1.c
> +++ b/drivers/pinctrl/pinctrl-rp1.c
> @@ -779,12 +779,14 @@ static int rp1_gpio_get(struct gpio_chip *chip, unsigned int offset)
>  	return ret;
>  }
>  
> -static void rp1_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> +static int rp1_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
>  {
>  	struct rp1_pin_info *pin = rp1_get_pin(chip, offset);
>  
>  	if (pin)
>  		rp1_set_value(pin, value);
> +
> +	return 0;
>  }
>  
>  static int rp1_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
> @@ -849,7 +851,7 @@ static const struct gpio_chip rp1_gpio_chip = {
>  	.direction_output = rp1_gpio_direction_output,
>  	.get_direction = rp1_gpio_get_direction,
>  	.get = rp1_gpio_get,
> -	.set = rp1_gpio_set,
> +	.set_rv = rp1_gpio_set,
>  	.base = -1,
>  	.set_config = rp1_gpio_set_config,
>  	.ngpio = RP1_NUM_GPIOS,
> -- 
> 2.48.1
>

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

