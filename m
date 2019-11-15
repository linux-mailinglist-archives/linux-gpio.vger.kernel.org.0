Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2625FFE773
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 23:13:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbfKOWNU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 17:13:20 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:45988 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfKOWNU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 17:13:20 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3A51860C1B; Fri, 15 Nov 2019 22:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573855999;
        bh=44HhLxAT1m9ZyzYHe+uEYQs75rOZOAP5IkByaWQou6I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Frg8F22e8q5ujPwhzKs1Yx/jsLKDxEIsJdsu6hyDfLXQyWEkBfERKklguHjec0/N4
         VGgbZQMRgRWQFfCl39jpkhM/yhOA9uvph/78QxwXUja1lTs0G1ZKPMgg3mUgStC4aT
         aE7ViNH50NmAQV+iUoQx3CsBLG19zhkkQmx+GxR0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 61E9660C3E;
        Fri, 15 Nov 2019 22:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573855998;
        bh=44HhLxAT1m9ZyzYHe+uEYQs75rOZOAP5IkByaWQou6I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BH8fp8S4TeVuokHpW8eLbZx4jQ+2V5gZG2p81n4WJ4SskYUGqT5P6nW3gimx7bT8S
         SdgqBU6aZJCJzH12K06bMh0vkkXBGl6c6V94q3ciZiXIZLvlBkBv2rgZU899Q28EpG
         g74i1KbEeQEEiV8RamAuQqumnff20Pke9zFMClUs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 61E9660C3E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Fri, 15 Nov 2019 15:13:17 -0700
From:   Lina Iyer <ilina@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        maz@kernel.org, evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org
Subject: Re: [PATCH 08/12] drivers: pinctrl: msm: setup GPIO chip in hierarchy
Message-ID: <20191115221317.GH18786@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org>
 <1573756521-27373-9-git-send-email-ilina@codeaurora.org>
 <5dcefd86.1c69fb81.c72c8.07a1@mx.google.com>
 <20191115205555.GF18786@codeaurora.org>
 <20191115215737.GG18786@codeaurora.org>
 <5dcf2213.1c69fb81.1e0ec.f500@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5dcf2213.1c69fb81.1e0ec.f500@mx.google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 15 2019 at 15:09 -0700, Stephen Boyd wrote:
>Quoting Lina Iyer (2019-11-15 13:57:37)
>> On Fri, Nov 15 2019 at 13:55 -0700, Lina Iyer wrote:
>> >>Quoting Lina Iyer (2019-11-14 10:35:17)
>>
>> >>>+static int msm_gpio_wakeirq(struct gpio_chip *gc,
>> >>>+                           unsigned int child,
>> >>>+                           unsigned int child_type,
>> >>>+                           unsigned int *parent,
>> >>>+                           unsigned int *parent_type)
>> >>>+{
>> >>>+       struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
>> >>>+       const struct msm_gpio_wakeirq_map *map;
>> >>>+       int i;
>> >>>+
>> >>>+       *parent = GPIO_NO_WAKE_IRQ;
>> >>>+       *parent_type = IRQ_TYPE_EDGE_RISING;
>> >>>+
>> >>>+       for (i = 0; i < pctrl->soc->nwakeirq_map; i++) {
>> >>>+               map = &pctrl->soc->wakeirq_map[i];
>> >>>+               if (map->gpio == child) {
>> >>>+                       *parent = map->wakeirq;
>> >>>+                       break;
>> >>>+               }
>> >>>+       }
>> >>>+
>> >>>+       return 0;
>> >>
>> >>Shouldn't we return -EINVAL if we can't translate the gpio irq to the
>> >>parent domain? I would expect to see return -EINVAL here and the above
>> >>if condition to return 0 instead of break.
>> >>
>> >Good catch. Sure.
>> >>>+}
>> >>>+
>> Looking into this, we have been setting GPIO in hierarchy with PDC and
>> the return 0 is appropriate as it would set the GPIO_NO_WAKE_IRQ as the
>> parent and setup the IRQ correctly. We fail to setup GPIOs otherwise.
>
>Ah ok so by default we will set the parent irq to ~0 and that means
>bypass pdc and go directly to GIC?
>
>Where do we fail to setup a GPIO otherwise? It sounds like we can always
>translate to either something in the map or to ~0.
>
We do not, may be other architectures can use this check better.

--lina
