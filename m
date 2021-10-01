Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6A041F84C
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Oct 2021 01:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbhJAXpz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 19:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbhJAXpy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 19:45:54 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E26C061775;
        Fri,  1 Oct 2021 16:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=RMYHColBopcvyuHn4kHSlDz8z/ORk1+XyuKRN8J5Sm0=; b=bIdgvkWkyCG4m1R5OCBXp1Ji8E
        xlG1775vhz67aITqA5sHQw0XHwdrNot7/T4q2cwALiRN3wsXq54g0FvjOUIguhaMXNms2bBXfiJ7Q
        9eTVP6T6aBiTpwIvrPeF9nB1OthrWyScT8Z2WvlLuM/dg4ehWI9N3fHy7+eWejd/1VcUYcErjxl1H
        apxd8UjpbZtD+M2+vimkConOw10/ku/b/9YnbVtiK1ZYXY7XXHIdJ+YRaU49FkYxY4fPxctYwH21Y
        BXBBbFr3nfLbmjkGpz0VFLPcWlXhshe1ny1JtebC0kLED9KJ6kL/FRLK2E7APUIVeY2OPL9C17u2v
        eeiJwEag==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mWSCE-001UFE-RV; Fri, 01 Oct 2021 23:44:07 +0000
Subject: Re: [RFC v2 03/11] hte: Add tegra194 HTE kernel provider
To:     Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        warthog618@gmail.com, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
References: <20210930232617.6396-1-dipenp@nvidia.com>
 <20210930232617.6396-4-dipenp@nvidia.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c16a75ee-b0db-5433-1902-762d29bd854c@infradead.org>
Date:   Fri, 1 Oct 2021 16:44:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930232617.6396-4-dipenp@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 9/30/21 4:26 PM, Dipen Patel wrote:
> +-----------
> +The Nvidia tegra194 HTE provider driver implements two GTE
> +(Generic Timestamping Engine) instances 1) GPIO GTE and 2) LIC IRQ GTE. The
> +both GTEs instances get the timestamp from the system counter TSC which has
> +31.25MHz clock rate, and the driver converts clock tick rate to nano seconds
> +before storing it as timestamp value.
> +
> +GPIO GTE
> +--------
> +
> +This GTE instance timestamps GPIO in real time, for that to happen GPIO
> +needs to be configured as input and IRQ needs to ba enabled. The only always on
> +(AON) gpio controller instance supports timestamping GPIOs in realtime and it

Here we have text that tells what AON means, but in the first paragraph above,
there is nothing that tells us what LIC means. Please add that.

-- 
~Randy
