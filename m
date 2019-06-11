Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0A33C92A
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 12:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387793AbfFKKl2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 06:41:28 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55006 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387527AbfFKKl2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jun 2019 06:41:28 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7147960867; Tue, 11 Jun 2019 10:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560249687;
        bh=NIPocidbUzKW1UAUmMATkDaYTOpSt3NLzDAHqU5KKE8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=M8fLZt8p1m4ozVYK2UOLmCARbfMCnLv7Cm7OJOKioaChmGXnzg8nECV2EZQozSEWW
         56jPr4kxxXpRwpbkMDIR6akQhOlcm8j7ZYtzvFqo8NhhQdlmERn71jGhZqyrfQ8yAj
         qTJmmCNhaweHyZgCo73TgVzqt/TxXLsT1SXheq1k=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id C305060213;
        Tue, 11 Jun 2019 10:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560249686;
        bh=NIPocidbUzKW1UAUmMATkDaYTOpSt3NLzDAHqU5KKE8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dN1VdMiCS9IFLgKwCYTEczI/InfJzjPEWsGCBagFet8HB4x1TCxtpz88dwYRBB6ob
         bHC2/B5vVuRtUQbIGPzLpzP2mQZOGcoDVA9T8T3OQ68FrVAa8yoqPbsirNGR65wI6m
         pA5dQH1caDKll3TD72lYnwwUxJoJw56mROwlBT/s=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 11 Jun 2019 18:41:26 +0800
From:   tengfeif@codeaurora.org
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: Clear status bit on irq_unmask
In-Reply-To: <20190610145132.DD1132085A@mail.kernel.org>
References: <1559285512-27784-1-git-send-email-tengfeif@codeaurora.org>
 <CACRpkdbdkbSofrvJ0hSV66DX+DcwWXp0ONDjx0265Pz50yE8TA@mail.gmail.com>
 <20190610145132.DD1132085A@mail.kernel.org>
Message-ID: <46b715974766d5c557685a1ab9131abe@codeaurora.org>
X-Sender: tengfeif@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2019-06-10 22:51, Stephen Boyd wrote:
> Quoting Linus Walleij (2019-06-07 14:08:10)
>> On Fri, May 31, 2019 at 8:52 AM Tengfei Fan <tengfeif@codeaurora.org> 
>> wrote:
>> 
>> > The gpio interrupt status bit is getting set after the
>> > irq is disabled and causing an immediate interrupt after
>> > enablling the irq, so clear status bit on irq_unmask.
>> >
>> > Signed-off-by: Tengfei Fan <tengfeif@codeaurora.org>
>> 
>> This looks pretty serious, can one of the Qcom maintainers ACK
>> this?
>> 
>> Should it be sent to fixes and even stable?
>> 
>> Fixes: tag?
>> 
> 
> How is the interrupt status bit getting set after the irq is disabled?
> It looks like this is a level type interrupt? I thought that after
> commit b55326dc969e ("pinctrl: msm: Really mask level interrupts to
> prevent latching") this wouldn't be a problem. Am I wrong, or is qcom
> just clearing out patches on drivers and this is the last one that 
> needs
> to be upstreamed?

Your patch(commit b55326dc969e) can cover our issue, and my patch is no 
longer needed.
Your patch isn't included in our code, so I submitted this patch.
