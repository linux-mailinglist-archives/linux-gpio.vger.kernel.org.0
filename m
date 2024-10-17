Return-Path: <linux-gpio+bounces-11542-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F509A22C5
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 14:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 148A81C22002
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 12:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE3641DD894;
	Thu, 17 Oct 2024 12:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDk5dpaJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DAD770E2;
	Thu, 17 Oct 2024 12:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729169638; cv=none; b=c8g549mLrUb6WLRyleu8JTMA/y8wPT1DmvPkMYfMJYQO3+SzfAZmVc9kY6twRKzhCrBVsaot+c00p60W9BA9+4crmwEMJtRxvaAbod4JhE6E4EMfEvX6ovdNvmr0HJcSwHKCLzigWea9jRkpjSyMQ9RUp1WzIbSSmCRT5QxxPgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729169638; c=relaxed/simple;
	bh=OI6E1ZdG5U4QiGhkBayUIy9Eq/w0C9aNzQcnITz1/LA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EewOAD9njhl0+rbCABbwXL7w8pqvCiZOr18UWxzoGZ2q0W19bgHY29RY0ckVP439455+SDRadV4QppIFBlZ+lTemhR2dP2HDVUUlCOadhm2fZ4b38R96W8Ia/xiN8ovEqtAf+jy4vRe+BZNI6+dePu2srobzwEKmFGR4XozQ0oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDk5dpaJ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20c714cd9c8so9372795ad.0;
        Thu, 17 Oct 2024 05:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729169635; x=1729774435; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ftGLp4qSFOJhCRAo4sB3olJpGzNRj3QrVjrXCjsbKo=;
        b=HDk5dpaJEQS7ynt45TkuZye6i3DyGSAVklfaq0u+asO68uROVBSa2YqLxYlza3OQw7
         4pNXglKfVRoJfEU6IEbbLgw7KEytQ3wpWJf3rrJaC5qo1JWfaAREoTkLcdD+xu9Djlpk
         wZp5oWa8RQXuaglak/E8RePVtMi/GyP/Nw5VE9tAA0mWLzgD0eqiRE72dhVqvQ1SkpmU
         rHR8lt/4m6ljNgWSqcNPpjgArkkO3QoRvICfBZwuKlyKJgtMW8IYG/7URinXMku1hHmA
         swPECThq3gGLHTDS7xsBJwcZYSCait8wH58/cCStZSkwxvpdhD9wUsyq52OItGTg3kDt
         ACcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729169635; x=1729774435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ftGLp4qSFOJhCRAo4sB3olJpGzNRj3QrVjrXCjsbKo=;
        b=iaaL0+13/5cDFydytUIL7Mfw/ZNKo3AYDckQt5nZGJQ5/z4aHXPfWi0+2LRp2TpGKf
         IT6NKO1pN9ShM+JCubWODdM7vb1En3FtIrYjs9xsSDW6dDkuRJlwuCG33sqqxrcdytDH
         CDc7a+8+HSBeixa0eb9IL8RjHfoba4fFwyzakLEyyVEm1InlKeuyup+tzfrdvrBwtq7/
         3UL5Eq3pfNdOPlatUCGrOvAso+N1qGuYFDNGgIgAmsoBlnuaMjtz94ja1NuGzDpYyeM/
         xdqshvK5Qja//C39VE87ahpY++yiZfNhrKsq3nCr9b8e/AMc94R/6HFITsQCQMBrEUjd
         AiLw==
X-Forwarded-Encrypted: i=1; AJvYcCUH+D3J6XeK7jhyV1yLkl6ItmsA7QoQ2whQ8qXcgnNWOydGp2S0HIQaOjoWgO3BBPYC/yythvWA8VB1Trwn@vger.kernel.org, AJvYcCVD9BHIuP2NmN3jjGly1MDOYgQLShANbzZHfu2D3GhzXzIfi2PUHLr5lAuc4FY/ucQYhtsUD+aF180f@vger.kernel.org
X-Gm-Message-State: AOJu0YxS4dC9ifSrkZnkDKGOYnHavh8l4FTOKIvZXhokakwhCQIZzvoW
	zZarz/RyEJ1VUtCLzD21uW1+f3qp3yXm5xNdkRMRuvRlNYZ+5yIdPN8uQg==
X-Google-Smtp-Source: AGHT+IGGkfpQ0QbcG5tihgqthqs6i3UnkQO0C3Yufxkmxlf56fL+oyfHiBA3Q5czqCner9Ry+NQe7A==
X-Received: by 2002:a17:902:e54f:b0:20c:7898:a8f4 with SMTP id d9443c01a7336-20cbb2694e6mr253403145ad.60.1729169634715;
        Thu, 17 Oct 2024 05:53:54 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1804b5dasm43559235ad.201.2024.10.17.05.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 05:53:54 -0700 (PDT)
Date: Thu, 17 Oct 2024 20:53:49 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 8/8] gpiolib: notify user-space about in-kernel line
 state changes
Message-ID: <20241017125349.GB221864@rigel>
References: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
 <20241017-gpio-notify-in-kernel-events-v4-8-64bc05f3be0c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017-gpio-notify-in-kernel-events-v4-8-64bc05f3be0c@linaro.org>

On Thu, Oct 17, 2024 at 10:14:16AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> @@ -1447,8 +1450,6 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
>  		}
>
>  		WRITE_ONCE(line->edflags, edflags);
> -
> -		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
>  	}
>  	return 0;
>  }

I still get errors from this when reconfiguring lines with debounce.
You should leave this notify in place and use _nonotify when setting the
direction.
i.e.

@@ -1436,11 +1432,11 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
                        int val = gpio_v2_line_config_output_value(&lc, i);

                        edge_detector_stop(line);
-                       ret = gpiod_direction_output(desc, val);
+                       ret = gpiod_direction_output_nonotify(desc, val);
                        if (ret)
                                return ret;
                } else {
-                       ret = gpiod_direction_input(desc);
+                       ret = gpiod_direction_input_nonotify(desc);
                        if (ret)
                                return ret;

@@ -1450,6 +1446,8 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
                }

                WRITE_ONCE(line->edflags, edflags);
+
+               gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
        }
        return 0;
 }

Given that, all my current tests are passing.

Cheers,
Kent.

