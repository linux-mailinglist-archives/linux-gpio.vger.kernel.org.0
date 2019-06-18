Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0529F4A6D0
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 18:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729491AbfFRQ0d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 12:26:33 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:7599 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729308AbfFRQ0d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 12:26:33 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0910b80001>; Tue, 18 Jun 2019 09:26:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 18 Jun 2019 09:26:32 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 18 Jun 2019 09:26:32 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 16:26:30 +0000
Subject: Re: [PATCH 2/3] gpio: tegra: no need to cast away return value of
 debugfs_create_file()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <bamv2005@gmail.com>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>
References: <20190618155047.16894-1-gregkh@linuxfoundation.org>
 <20190618155047.16894-2-gregkh@linuxfoundation.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <06e0fa20-7bf9-7e5d-93a7-efba1379f74d@nvidia.com>
Date:   Tue, 18 Jun 2019 17:26:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190618155047.16894-2-gregkh@linuxfoundation.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560875192; bh=Rhj/X3ALWCfaekV+4J24yq5Xi5sZtL/j2ZdMAq4thlI=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=IYlwwYt5eiT9sVTH8HE0GxZPOiQIB0Ii6XWwx7QQo6t02Vk4nNxbWG7h7pZ7406Ep
         47KXxp4UpOcuoBW3gxATQlmYtfIHki/lbZcAIlRp9wl/GqXz9i6c6mvVI74dniVvvU
         ACUc5MkDkvVXusOGYyfw9px/C6T75yYrSf+e5xLcRqIRU06O6CL9kd+FtZIm1C+VVb
         T5/Ez0DOVu+Uc2AiX1G/Gtbs+Xfh8r0UmbZPrWpwJXH8wmv3YSiE5YatgRWg6+hNM7
         kOopepyfwVTXcFqSMWlubQmKyRlP+rFjGGlMa8rTcUf4/gkJSfv1a5iLDHhJslHt0t
         goPatj+4A2OOw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 18/06/2019 16:50, Greg Kroah-Hartman wrote:
> It is fine to ignore the return value (and encouraged), so need to cast

I assume you mean 'no need' here.

> away the return value, you will not get a build warning at all.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/gpio/gpio-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 6d9b6906b9d0..a54bba1bda6c 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -550,8 +550,8 @@ DEFINE_SHOW_ATTRIBUTE(tegra_dbg_gpio);
>  
>  static void tegra_gpio_debuginit(struct tegra_gpio_info *tgi)
>  {
> -	(void) debugfs_create_file("tegra_gpio", 0444,
> -				   NULL, tgi, &tegra_dbg_gpio_fops);
> +	debugfs_create_file("tegra_gpio", 0444, NULL, tgi,
> +			    &tegra_dbg_gpio_fops);
>  }
>  
>  #else

Looks like we can get rid of this entire function and just call
debugfs_create_file directly to simplify the code even more. We can
handle that.

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic
