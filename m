Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C06FE21A2ED
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 17:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgGIPCV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 11:02:21 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:7391 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbgGIPCU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 11:02:20 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0731100001>; Thu, 09 Jul 2020 08:00:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 09 Jul 2020 08:02:20 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 09 Jul 2020 08:02:20 -0700
Received: from [10.19.64.157] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Jul
 2020 15:02:17 +0000
Subject: Re: [PATCH v3 4/6] gpio: max77620: Don't shadow error code of
 platform_get_irq()
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20200708202355.28507-1-digetx@gmail.com>
 <20200708202355.28507-5-digetx@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From:   Laxman Dewangan <ldewangan@nvidia.com>
Message-ID: <ac8496d7-8a3e-9147-fd82-a596e743fc40@nvidia.com>
Date:   Thu, 9 Jul 2020 20:31:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200708202355.28507-5-digetx@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594306832; bh=uX/ItJJp3vriWyJ6cOJHy+oYPRDihkGd3SI13+jjRXg=;
        h=X-PGP-Universal:Subject:To:References:CC:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding;
        b=dQtMXWTMv2FO7iWwF+V3o5h0aZeE+h4GdBau0GNNd8uPt1UqUazMhhuBNv8xZGbH1
         p6axpQ2AV1WGhPSgYpGfO5tQgi15DZRQaatC6y9aJU0M3q22r4NRc6P2Xr44lpB/eW
         hDEsb2S8ZqDdHt7HEsFV6ayeaYiovTeJBI7hZ+lgDJNPfbnUG6E8NbbkfMZWjVfnV4
         5nOJdlxtXLQXzOXpu4aSzO+eBDvOPrJN/1M5YR0m5FC0RYJAC7lZFBM4zHOGah77BW
         RIMdpcdfFj4pHQLo3POLw2t5NAI6LVhnh+7PlpCxZgRYC1RtexhQatj+WAi5P8YugW
         2IoFkouU27bmw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Thursday 09 July 2020 01:53 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> The platform_get_irq() returns a positive interrupt number on success and
> negative error code on failure (zero shouldn't ever happen in practice, it
> would produce a noisy warning). Hence let's return the error code directly
> instead of overriding it with -ENODEV.
>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>


Looks good to me.
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
