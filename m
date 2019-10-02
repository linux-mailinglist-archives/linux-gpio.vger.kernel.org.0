Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBD90C8E58
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 18:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbfJBQ1L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 12:27:11 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33544 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfJBQ1L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 12:27:11 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so10659257pfl.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2019 09:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=0+DSqW87gNjtxwRUkSu5B39M7fq7s1SU2DBpFCKQPIU=;
        b=UmjLkl5ZTCX7NlC+qBayte0C9W/RFDkq2t9lhAk8TYQ+tQ5L6fx0elhCAfgvajP9Sz
         IHHVu6cj7HKcmm5le4pl62ccdT34ICCIsqGWOjGL5ylvzXlAn0PL4KJm1dTlaIfjJNKT
         /Ps1sa9bIHw+CWOBpP7z/qdx5Jxtj6W8y5kh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=0+DSqW87gNjtxwRUkSu5B39M7fq7s1SU2DBpFCKQPIU=;
        b=i2gdv7XdhW/m1LwyE+R/oYZmCtA72lADCwdiBL1FhqGi+vIIEAXcl8kqRgVHerzKqL
         +P8w8XTcoiTB5ZhmfN7YUYqVPmOPA4lJwBeCpSItMPz1HhQj4h3ZUTxm9Ocx54IhtfRG
         YZPPUjsYQnz1d0A7iAbo5gfx1kp17XBKjc7pL19/Iq9YD24qPitSPN0C8apvfqT6P/rS
         1cT6471RYhD9rpX7SvAbUzXApHuCCU2A3/98PT4S0ueQ+Ozh6En5r08bH+a2LaTizi0A
         rBD2iSucuJMaA6ESEuKl8Wo42afPYzT7Q4rcLwX/8xr9PdDJvEJLfi0YivQscnGMWYNl
         EYNg==
X-Gm-Message-State: APjAAAXTzsLfcdY1WHWGFdRCQDJw8ACEiXCK6vcGRabY/+2wYDJeM4oV
        IDpYbRx2vIkz3ETXg1Tmw5beGg==
X-Google-Smtp-Source: APXvYqy+OleRPHf71cX9SCIyvsS+a6RJUvdP+tClz/ATA33UKfXeg38M9PMLt2KbiZ7H2XLrO57KdQ==
X-Received: by 2002:a62:3342:: with SMTP id z63mr5515517pfz.222.1570033630607;
        Wed, 02 Oct 2019 09:27:10 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id b22sm19291593pfo.85.2019.10.02.09.27.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 09:27:10 -0700 (PDT)
Subject: Re: [PATCH v2] pinctrl: bcm-iproc: Use SPDX header
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Pramod Kumar <pramodku@broadcom.com>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
References: <20191002130217.4491-1-linus.walleij@linaro.org>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <40d3bdf1-48b0-55bf-f4e0-a8b14f6313ae@broadcom.com>
Date:   Wed, 2 Oct 2019 09:27:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002130217.4491-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

thanks.

On 2019-10-02 6:02 a.m., Linus Walleij wrote:
> This convert the BCM IPROC driver to use the SPDX header
> for indicating GPL v2.0 only licensing.
>
> Cc: Pramod Kumar <pramodku@broadcom.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Scott Branden <scott.branden@broadcom.com>
> ---
> ChangeLog v1->v2:
> - Don't merge the two comment blocks. Broadcom
>    don't like it.
> ---
>   drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> index 6f7d3a2f2e97..61352cc6c0d3 100644
> --- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> +++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> @@ -1,14 +1,6 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Copyright (C) 2014-2017 Broadcom
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU General Public License as
> - * published by the Free Software Foundation version 2.
> - *
> - * This program is distributed "as is" WITHOUT ANY WARRANTY of any
> - * kind, whether express or implied; without even the implied warranty
> - * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
>    */
>   
>   /*

