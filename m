Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7572DB0135
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 18:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729178AbfIKQQx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 12:16:53 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37970 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729149AbfIKQQt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 12:16:49 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 2900760C72; Wed, 11 Sep 2019 16:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568218608;
        bh=tn8EIOlw52p10Je+it7oNkaaHTfUPXTl86tPFg9hjf4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ojylFW7dnyYRTd/m6Je9Pflrh3J/HiQswu7GR89Oy0hd9ICzLsjlBLdHrXU4Oc1vH
         crQ+JZ9X+/YAM94thTMlbDpLjAOhF5IpNLuwRAg/MpzSqrB2eeY6GyxvfVnK0P4Jsk
         LJB6id1yKoAMBNZzhE8QeudvPbXBHEL7hjq63mrk=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 099F8607CA;
        Wed, 11 Sep 2019 16:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568218607;
        bh=tn8EIOlw52p10Je+it7oNkaaHTfUPXTl86tPFg9hjf4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kuou501Yo7RboC4JSk3MoJZMFT5F2MdaLY69J+9td8eHy5AUlddXETD4NaMngglZH
         hGYp7phS6po6tVrVSqrTxerKL4tgX3IDdo+23t2Cdebt09QAw975vUKh+d2RHu3/wB
         OGka20x77a2XvwIyS8hSV65fbtCyUEF+8rSy+J1s=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 099F8607CA
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Wed, 11 Sep 2019 10:16:46 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        mkshah@codeaurora.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH RFC 09/14] drivers: pinctrl: msm: fix use of deprecated
 gpiolib APIs
Message-ID: <20190911161646.GC30053@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org>
 <20190829181203.2660-10-ilina@codeaurora.org>
 <CACRpkdbhNY8N=LMG6wwYw9bAnL4HmAqj8WMpsLsqvh8PvaQ52A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACRpkdbhNY8N=LMG6wwYw9bAnL4HmAqj8WMpsLsqvh8PvaQ52A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 11 2019 at 04:19 -0600, Linus Walleij wrote:
>On Thu, Aug 29, 2019 at 7:35 PM Lina Iyer <ilina@codeaurora.org> wrote:
>
>> Replace gpiochip_irqchip_add() and gpiochip_set_chained_irqchip() calls
>> by populating the gpio_irq_chip data structures instead.
>>
>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>
>This is mostly fixed upstream I think, but:
>
>> +       chip->irq.fwnode = pctrl->dev->fwnode;
>
>This fwnode assignment is missing though.
>
>Sorry for the constant churn and required rebasing...
>
Not a problem. Will rebase.
