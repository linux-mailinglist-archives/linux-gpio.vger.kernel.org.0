Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 258C232E72C
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 12:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhCEL0E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 06:26:04 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:51983 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbhCELZm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Mar 2021 06:25:42 -0500
Received: from mail-wr1-f72.google.com ([209.85.221.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lI8aT-00036C-25
        for linux-gpio@vger.kernel.org; Fri, 05 Mar 2021 11:25:41 +0000
Received: by mail-wr1-f72.google.com with SMTP id g2so914796wrx.20
        for <linux-gpio@vger.kernel.org>; Fri, 05 Mar 2021 03:25:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nj2PrFHb6kGq6ooWb10NVgoyTadWZycXGzOn28nDuhA=;
        b=SdFXWLOuKriRdMdu4L6gup6DZ1Lkhsi8pf67/oawxoBGu15q6cqGrPd5IJPf1rnyIr
         ZraifclntlsR9OKL0/b3VSHyj3NVxQcovbCLs+b7ZDJLGtso+e3hZbdlD4dnafhuuaMM
         8ZooOPp/oJ/OWrrmuCSUIgZfJvwIxjsaglAP1Re31aMA6w5FqEOb/jny2slRqx0hKS6D
         VjK19t7nWbXSW5lxpOCR5SidfeQYKvU3OxJNRU8rDUgdmKDhMpBI/RAf+LxxBNAX5n1K
         /gn+UX5YJjG9aI+WXiqHjQGQi9GYSkt5P0mdIZBKibU2Y/8VcAKROpy2rFF8A33wsdlM
         PzaQ==
X-Gm-Message-State: AOAM531arV1onzarKVcdOS52lVCuImtLUfwwUeqF3CtOZNQlUGIpGVvv
        wbB3Inl5Vq+Mm8aKcF04Ewkx6I+IA2HipdWuQf7xGP3lnbn8HKuc0qJuQZhR8KQ4qiVmyYk65/V
        AkIuCq/B+fHRqlq2/bZYUnygTrXW4rcjy97o+cC4=
X-Received: by 2002:a1c:2e56:: with SMTP id u83mr2579089wmu.122.1614943540840;
        Fri, 05 Mar 2021 03:25:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJkdDADi29npR5jm6uaXHLDmTZ2JOEJEIdQVKiI0LHTOo9fZorrcqw7Wzeekw0PSc44FlBMw==
X-Received: by 2002:a1c:2e56:: with SMTP id u83mr2579081wmu.122.1614943540739;
        Fri, 05 Mar 2021 03:25:40 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id u4sm4256737wrm.24.2021.03.05.03.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 03:25:40 -0800 (PST)
Subject: Re: [PATCH 1/8] gpio: Add Elba SoC gpio driver for spi cs control
To:     Brad Larson <brad@pensando.io>,
        linux-arm-kernel@lists.infradead.org
Cc:     arnd@arndb.de, linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        broonie@kernel.org, fancer.lancer@gmail.com,
        adrian.hunter@intel.com, ulf.hansson@linaro.org, olof@lixom.net,
        linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210304034141.7062-1-brad@pensando.io>
 <20210304034141.7062-2-brad@pensando.io>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <605880ad-6c12-bf1d-45f8-ef70181e4eec@canonical.com>
Date:   Fri, 5 Mar 2021 12:25:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210304034141.7062-2-brad@pensando.io>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 04/03/2021 04:41, Brad Larson wrote:
> This GPIO driver is for the Pensando Elba SoC which
> provides control of four chip selects on two SPI busses.
> 
> Signed-off-by: Brad Larson <brad@pensando.io>
> ---
>  drivers/gpio/Kconfig           |   6 ++
>  drivers/gpio/Makefile          |   1 +
>  drivers/gpio/gpio-elba-spics.c | 120 +++++++++++++++++++++++++++++++++
>  3 files changed, 127 insertions(+)
>  create mode 100644 drivers/gpio/gpio-elba-spics.c

(...)

> +static int elba_spics_probe(struct platform_device *pdev)
> +{
> +	struct elba_spics_priv *p;
> +	struct resource *res;
> +	int ret;
> +
> +	p = devm_kzalloc(&pdev->dev, sizeof(*p), GFP_KERNEL);
> +	if (!p)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	p->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(p->base)) {
> +		dev_err(&pdev->dev, "failed to remap I/O memory\n");
> +		return PTR_ERR(p->base);
> +	}
> +	spin_lock_init(&p->lock);
> +	platform_set_drvdata(pdev, p);
> +
> +	p->chip.ngpio = 4;	/* 2 cs pins for spi0, and 2 for spi1 */
> +	p->chip.base = -1;
> +	p->chip.direction_input = elba_spics_direction_input;
> +	p->chip.direction_output = elba_spics_direction_output;
> +	p->chip.get = elba_spics_get_value;
> +	p->chip.set = elba_spics_set_value;
> +	p->chip.label = dev_name(&pdev->dev);
> +	p->chip.parent = &pdev->dev;
> +	p->chip.owner = THIS_MODULE;
> +
> +	ret = devm_gpiochip_add_data(&pdev->dev, &p->chip, p);
> +	if (ret) {
> +		dev_err(&pdev->dev, "unable to add gpio chip\n");
> +		return ret;
> +	}
> +
> +	dev_info(&pdev->dev, "elba spics registered\n");

Don't print trivial probe results, unless you print here something
useful. If you need it for debugging, keep it dev_dbg.

Best regards,
Krzysztof
