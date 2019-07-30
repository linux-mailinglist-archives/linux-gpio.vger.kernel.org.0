Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 037827AFCB
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 19:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727303AbfG3R0Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 13:26:25 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41376 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbfG3R0Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 13:26:25 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 91CF2606FC; Tue, 30 Jul 2019 17:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564507584;
        bh=8StxuggoIs45HX8ym7rEZ3Hw73lcJ9iRCwmyC3/vdbQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m6ti1UufnfRNIGjgKGB9lvqQzblzSCsPUHxIGr3FgkBrQggE6RDtsx1lxiSHlc8Dr
         UhUcJtCWJRt+xBEtRq3eWGpUD2tpHGe/eI07DwjZRl9Qeiu5wzp9cIBS5GYLqZoBDY
         tYgFZ0PAC9V5rrDKvwZVYg/KsQfIpD2HN/eL2xMM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B501260258;
        Tue, 30 Jul 2019 17:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564507584;
        bh=8StxuggoIs45HX8ym7rEZ3Hw73lcJ9iRCwmyC3/vdbQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m6ti1UufnfRNIGjgKGB9lvqQzblzSCsPUHxIGr3FgkBrQggE6RDtsx1lxiSHlc8Dr
         UhUcJtCWJRt+xBEtRq3eWGpUD2tpHGe/eI07DwjZRl9Qeiu5wzp9cIBS5GYLqZoBDY
         tYgFZ0PAC9V5rrDKvwZVYg/KsQfIpD2HN/eL2xMM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B501260258
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Tue, 30 Jul 2019 11:26:23 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] pinctrl: qcom: Pass irqchip when adding gpiochip
Message-ID: <20190730172623.GI18620@codeaurora.org>
References: <20190724083828.7496-1-linus.walleij@linaro.org>
 <20190724200007.GO7234@tuxbook-pro>
 <20190725151603.GF18620@codeaurora.org>
 <CACRpkdY=LdfOMc2Cnw23hZA5-WZ0trFewSzHGyq9j4soNqtPTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACRpkdY=LdfOMc2Cnw23hZA5-WZ0trFewSzHGyq9j4soNqtPTQ@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 29 2019 at 16:43 -0600, Linus Walleij wrote:
>On Thu, Jul 25, 2019 at 5:16 PM Lina Iyer <ilina@codeaurora.org> wrote:
>> On Wed, Jul 24 2019 at 14:00 -0600, Bjorn Andersson wrote:
>> >On Wed 24 Jul 01:38 PDT 2019, Linus Walleij wrote:
>
>> I had something similar in mind [1] as part of my series reworked on top
>> of Linus's GPIO hierarchy series. This patch is not far from it.
>
>Sorry for constantly doubleworking and stepping on your toes here :(
>Adding a Co-developed-by: since it is pretty much the same.
>
Oh, no worries, it is not necessary. :)

>Indeed the hierarchical irqchip will need that the set-up is done
>with this contemporary method.
>
>I will try to respin the hierarchical GPIO too with Brians changes
>so we can get that merged and create a Perfect (fingers crossed)
>base for your development.
>
Waiting on your series to post my next revision.

--Lina
