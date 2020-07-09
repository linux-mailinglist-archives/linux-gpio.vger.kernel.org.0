Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A12B21A2F2
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 17:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbgGIPDi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 11:03:38 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:17855 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbgGIPDi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 11:03:38 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0731bd0000>; Thu, 09 Jul 2020 08:03:25 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 09 Jul 2020 08:03:38 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 09 Jul 2020 08:03:38 -0700
Received: from [10.19.64.157] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Jul
 2020 15:03:35 +0000
Subject: Re: [PATCH v3 5/6] gpio: max77620: Use irqchip template
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20200708202355.28507-1-digetx@gmail.com>
 <20200708202355.28507-6-digetx@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From:   Laxman Dewangan <ldewangan@nvidia.com>
Message-ID: <db6c0e3c-505a-6ce8-ec52-a1331dc5a1a8@nvidia.com>
Date:   Thu, 9 Jul 2020 20:33:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200708202355.28507-6-digetx@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594307005; bh=WA0Hc1Bmgkm7tjyfkdDpk4Pgpzcd4AVZYEuUhiRRU6k=;
        h=X-PGP-Universal:Subject:To:References:CC:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding;
        b=AtfD/Bm2Ia2gOJjfOdEbGwPx7fQ/gFH30jRLpvEf/fNv5H1+bExjPpG858/mSVQ2X
         pLKmP2Xs8WG6e1vJ1yYlWV/DEpVPfLMRqJf3OhyKy5Dpqe7aJKcjfs7RZa39NZetLg
         IYnZQeoIQmg/sa2jOA0rCY+wwbmuduu0rtR/9DXKO7B9aNJWdsJQ38Ox01/mnqOMbY
         wDGeNyyvpkzrOOe92EWXT0wKAxLn8lzAE68fSbOA54B9nFSLpKbDUPCfZW9EhME9yd
         D07QZVk8V+5sviCYI7z0Cpvy2EnRHBIfJuDEbBsOaNTeHmzX9Wi3n8THjsjF8ogu+w
         HNGZaA5Mz7U1Q==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Thursday 09 July 2020 01:53 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> This change addresses one of the GPIO-core TODOs for the MAX77620 driver
> which requires modern drivers to use the irqchip template. Instead of
> using the GPIO's irqchip-helpers for creating the IRQ domain, the
> gpio_irq_chip structure is now filled by the driver itself and then
> gpiochip_add_data() takes care of instantiating the IRQ domain for us.
>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>


Looks good to me.
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>

