Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91C21FE29D
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 17:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbfKOQUx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 11:20:53 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:34634 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727423AbfKOQUx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 11:20:53 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 44D1A60C68; Fri, 15 Nov 2019 16:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573834852;
        bh=eJ1ougYZsdOPNkP0r+wBt4GiBFElVZxrJfz13RnKkZE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ReeTudINlbQwbtqQ5r/zUJlv0s9UFKBNC9KntcUDvbjzJSSR4lMbiHeh756LkaWAW
         2aUeRlpT4CSjO/B7pedGuhtcFMJ/nuuWBd36TbVaN7x7hzJPLgIE6TQhuf8kAGcNlu
         DVTZuR9ZR9U/wbzZoNRQc80ibS8tWoUSSZB5Ipw8=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A93D660264;
        Fri, 15 Nov 2019 16:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573834851;
        bh=eJ1ougYZsdOPNkP0r+wBt4GiBFElVZxrJfz13RnKkZE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XXGtOSzKx9trGixqE/Y27xNMkIPR1FsEd/hu8loaMI1Ri9mcal41N/RV5vCAlN4mh
         HzkSC0cv0oF7g+nOS0+rxqh1KEnYbKo1DcrUs+Ye2bx+nhJ5WeoUOa/vlrb+6YS9GL
         /NNJ2T8fxcWrNEwxQmmncUVFS0RjZaDpPMga5TiE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A93D660264
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Fri, 15 Nov 2019 09:20:50 -0700
From:   Lina Iyer <ilina@codeaurora.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     swboyd@chromium.org, linus.walleij@linaro.org,
        bjorn.andersson@linaro.org, evgreen@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mkshah@codeaurora.org, linux-gpio@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org
Subject: Re: [PATCH 00/12] Support wakeup capable GPIOs
Message-ID: <20191115162050.GE18786@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org>
 <54da99976d9bd2d543d2341ad9eb982e@www.loen.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <54da99976d9bd2d543d2341ad9eb982e@www.loen.fr>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 15 2019 at 03:36 -0700, Marc Zyngier wrote:
>Hi Lina,
>
>On 2019-11-14 18:35, Lina Iyer wrote:
>>Hi all,
>>
>>Thanks for all the reviews.
>>
>>Here is the next spin of the wakeup capable GPIO support. In order to
>>facilitate basic support available in the kernel, I have dropped the
>>SPI
>>register configuration. The feature was added when this series was
>>restarted based on new hierarchy support in gpiolib. But, the SPI
>>configuration can be done in the firmware. This would avoid a whole
>>lot
>>of code in linux that serve little to no purpose. Users of GPIO never
>>have the need to change the trigger type (level edge and vice-versa)
>>and
>>the basic configuration can be set in the firmware before boot.
>>
>>Changes in v1:
>>	- Address review comments
>>	- Add Reviewed-by tags
>>	- Drop SPI config patches
>>	- Rebase on top of Rajendra's PDC changes [6]
>>
>>Changes in RFC v2[5]:
>>        - Address review comments #3, #4, #6, #7, #8, #9, #10
>>        - Rebased on top of linux-next GPIO latest patches
>>[1],[3],[4]
>>        - Increase PDC max irqs in #2 (avoid merge conflicts with
>>          downstream)
>>        - Add Reviewed-by #5
>>
>>Please consider reviewing these patches.
>
>It has been a long time coming, and I'm minded to take the first 9
>patches into the irqchip tree. Anyone objects? The last 3 patches
>can go via the platform maintainer tree.
>
Sounds good Marc.

Thanks,
Lina

