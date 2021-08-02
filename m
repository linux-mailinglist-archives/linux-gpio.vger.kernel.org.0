Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 562D53DDA66
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 16:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234477AbhHBONt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 10:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235705AbhHBOM6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 10:12:58 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F8D1C044007;
        Mon,  2 Aug 2021 06:58:44 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id bq29so8292350lfb.5;
        Mon, 02 Aug 2021 06:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lUrLfWKHwEhlXNu+G+ug5oDQiGH2kq3pcgFyRRDl+Po=;
        b=DuiizHMIrtaxRR9PWeYyrgAjcEkkLcAh2CDMqXaZUN6T9kqeDYCwMqni+hLezeJUZP
         QW6tIm44eipXWIerOOZoKTMnQqNHRdcY1WXG8U+XHrIowsaXsxSA9Y2xr1dE3P6cS3M3
         yDsEvLb5QKpI9Fqm33EMAxzABXRxwDKMM3+Qb2UpW64E4jb9vG58bieij1xmFK4OEc5S
         3qZh0cFTL8DYUL7dCpcapw3L3GqW/WEmbXSAVf+JvRDIHaDhwlPdWpKe3mjGUTcFiwZ6
         edFdtvkKulBR4RTEfl7nzUFoslDXz2JLX3QBqS87MtEb0oGKqQvB10Zed3X5fwI+5DA6
         +OvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lUrLfWKHwEhlXNu+G+ug5oDQiGH2kq3pcgFyRRDl+Po=;
        b=TnRvM2lcHUFgJbUVsDw7Bt8fnS9Yq8sN+mg81EfgOLdOFl3tMEtu01V8Ysa2NV1iHY
         ak1iv5sS/AjauQhL+hkf7azwGs4Mjca11+fUX1Fhzn5p7EniRDShWiKg2ziA0bhzCwso
         k7hgEd+mGOvmQDMJSX7vm0vAC+6ZYJBY0ICbjuIIIx2+N456ROxlHIC85Q8yewZ8a56N
         36k3bPto5002DnlMp4WuGzn3eV/PN77jGpoG0D+XSrq7MXmUOZNCvKNl0tWtiZIrDh9F
         h0GHWuIBAYzXo0tgOd8TZ4pRsrjX3JJnSIkkUAR/ilu73wFdzhYFjUXTByPDdW0Z76Cb
         g5kQ==
X-Gm-Message-State: AOAM532+s7BFO5UqPbC4QL+yxcZEoZYRWtFBd9cGTbSSK6vByzwGZrY5
        O/wke3lvoRK3oqxu3c7hOT0=
X-Google-Smtp-Source: ABdhPJxxC5kwQl8bk0MXIADHQnZjmGCGtons4lKKmkx7ojsSH/ec5mrPjiGZkqwDJlbHiwJorl6X8g==
X-Received: by 2002:ac2:4ec3:: with SMTP id p3mr12355176lfr.556.1627912722499;
        Mon, 02 Aug 2021 06:58:42 -0700 (PDT)
Received: from mobilestation ([95.79.127.110])
        by smtp.gmail.com with ESMTPSA id o19sm961005lfk.299.2021.08.02.06.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 06:58:41 -0700 (PDT)
Date:   Mon, 2 Aug 2021 16:58:39 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1 2/4] gpio: dwapb: Read GPIO base from gpio-base
 property
Message-ID: <20210802135839.4clqd34npppwasyh@mobilestation>
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
 <20210726125436.58685-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726125436.58685-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+Cc Rob

On Mon, Jul 26, 2021 at 03:54:34PM +0300, Andy Shevchenko wrote:
> For backward compatibility with some legacy devices introduce
> a new (*) property gpio-base to read GPIO base. This will allow
> further cleanup of the driver.
> 
> *) Note, it's not new for GPIO library since mockup driver is
>    using it already.

You are right but I don't think it's a good idea to advertise the
pure Linux-internal property "gpio-base" to any use-case like OF
and ACPI FW nodes. Especially seeing we don't have it described in the
DT-bindings and noting that the mockup driver is dedicated for the
GPIO tests only. What about restricting the property usage for the
SW-nodes only by adding an additional check: is_software_node() here?

@Linus, @Bartosz, @Rob, what do you think about that?

-Sergey

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index f6ae69d5d644..e3011d4e17b0 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -581,7 +581,8 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
>  			pp->ngpio = DWAPB_MAX_GPIOS;
>  		}
>  
> -		pp->gpio_base	= -1;
> +		if (fwnode_property_read_u32(fwnode, "gpio-base", &pp->gpio_base))
> +			pp->gpio_base = -1;
>  
>  		/*
>  		 * Only port A can provide interrupts in all configurations of
> -- 
> 2.30.2
> 
