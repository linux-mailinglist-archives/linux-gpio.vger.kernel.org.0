Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E69636BB6A
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Apr 2021 00:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbhDZWEm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Apr 2021 18:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232161AbhDZWEl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Apr 2021 18:04:41 -0400
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA3F5C061574;
        Mon, 26 Apr 2021 15:03:59 -0700 (PDT)
Received: from zn.tnic (p200300ec2f074a0077269aa007748515.dip0.t-ipconnect.de [IPv6:2003:ec:2f07:4a00:7726:9aa0:774:8515])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B21B51EC04DF;
        Tue, 27 Apr 2021 00:03:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1619474637;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=aU/hJRqHjZ8F7n1hURshobS7X/zE5zCFv6/C95FzEbw=;
        b=U1ps3Y0Sj6VYOlvPSfq/53HIzURWgyV9z3Wnpp5EBLgS89nWaXE5cZIFqggv/K0GXDcexN
        T+SJLGukwIq3YnOiCuc0nI7uxROIrhlXmqxN04fHXvqF98O6dQGmSw704mmgTAIumr5PaD
        2H3G9g43D4wGv7gMKxfAMarZrwcUplU=
Date:   Tue, 27 Apr 2021 00:04:01 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     vectorflaredesigns@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [Bug 212379] AMD GPIO chip IRQs stops working (ELN4690,
 WCOM51C7, BMA250E)
Message-ID: <YIc40YXZh4plkhnc@zn.tnic>
References: <bug-212379-6385@https.bugzilla.kernel.org/>
 <bug-212379-6385-VMOjMpWM97@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bug-212379-6385-VMOjMpWM97@https.bugzilla.kernel.org/>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Switching to mail...

On Mon, Apr 26, 2021 at 09:04:38PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=212379
> 
> --- Comment #15 from Austin Kilgore (vectorflaredesigns@gmail.com) ---
> Is this ever going to get looked at?
> 
> Did I need to @ mention someone? Honestly asking since I don't know what to do.
> I don't even know who needs to be told to take a look at this.
> 
> Like I said, if this bug report is lacking information just let me know and
> I'll test, check, or upload whatever is needed. It's really important to me
> that this gets fixed.
> 
> -- 

Grepping through the tree, "amd_gpio" sounds like
drivers/pinctrl/pinctrl-amd.c so maybe Linus might have an idea, CCed.

@Linus, the bugzilla entry has some more info on what happens.

@Austin: in the future, please do not CC everyone including the
postmaster on your bug. Now you're mass-spamming 50+ people
unnecessarily.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
