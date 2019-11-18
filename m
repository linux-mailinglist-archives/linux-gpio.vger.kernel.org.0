Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7300100F75
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 00:36:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbfKRXgg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 18:36:36 -0500
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187]:37160
        "EHLO a27-187.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726795AbfKRXgg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Nov 2019 18:36:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574120195;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
        bh=TvlxPY6SnVIMe+RazQy8bs89LJQ6zB0OJ9f/kliZgWg=;
        b=ndrbU5nkSFYjmg4i95bp+bwwTJ8tSeWA8EsgX6FSVIwdxW/1n1/9GIaPx0VMqpy0
        LKgNuA6a1qw9zXdBtdYHQc/IE5MR83P22ob1wS8kGoTeiBhgerfb+XmooQarCI37gaq
        rIs032+6f5eguxI6qzX1qb/qptnShM2t170KDNJQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574120195;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Feedback-ID;
        bh=TvlxPY6SnVIMe+RazQy8bs89LJQ6zB0OJ9f/kliZgWg=;
        b=XpDRhaWoypffs8ccilOsaPYG+jU7FMlDjvesYB4EuWJGKmphD+9RoD+/oOPqbc8C
        ItKr4gnXAdJShCUr6HGfoA2vTQf+AiWrr6t/T3DdfNqrjV94TfpBgpwDC+W4uKTIQ6Z
        jItnRzewOBSU0Br5xqKGz5jm5skGJxEjSdzeBQwk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 13FD5C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Mon, 18 Nov 2019 23:36:35 +0000
From:   Lina Iyer <ilina@codeaurora.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     swboyd@chromium.org, linus.walleij@linaro.org,
        bjorn.andersson@linaro.org, evgreen@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mkshah@codeaurora.org, linux-gpio@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org
Subject: Re: [PATCH v2 00/12] Support wakeup capable GPIOs
Message-ID: <0101016e80e00412-b1afa29f-17cc-4eae-90fa-7ac1c0e08e59-000000@us-west-2.amazonses.com>
References: <1573855915-9841-1-git-send-email-ilina@codeaurora.org>
 <86bltcxges.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <86bltcxges.wl-maz@kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-SES-Outgoing: 2019.11.18-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Nov 16 2019 at 03:30 -0700, Marc Zyngier wrote:
>On Fri, 15 Nov 2019 22:11:43 +0000,
>Lina Iyer <ilina@codeaurora.org> wrote:
>>
>> Hi,
>>
>> Here is the spin of the series with the review comments addressed and
>> Reviewed-by tags added. Thanks all for your reviews.
>>
>> Andy/Bjorn, would you pull patches 10-12 in your tree? Marc would be
>> pulling the patches 1-9 into the irqchip tree.
>
>Applied 1-9 with some minor subject refactoring and series reordering,
>and pushed out in irq/irqchip-next. Any late change, please provide
>fixes on top of that branch.
>
Sure. Thanks Marc.

--Lina
