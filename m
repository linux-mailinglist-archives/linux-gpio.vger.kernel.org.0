Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1775451D4D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 01:24:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349086AbhKPA1Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Nov 2021 19:27:24 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56252 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347430AbhKOT5A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Nov 2021 14:57:00 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: krisman)
        with ESMTPSA id CB6BC1F44AE2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637006034; bh=tgLtuM2qJtP1xBVBZJBIXwAQ4NYiIoRaMxQXz2OLAus=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=oBgcfqneNsAQyDboKwaqZBmVaWz/WCLIhyUEUtf3oFElFTwUCmn4/8oOFxr2tJBj6
         7Tkryc+T4vgTnj4a3L1dvcaGih+Y7DrZLPtBxPmzYfzWh9lY/wmcPSsP0mlYUQKCXg
         19/7QFjU7SH9ntIU+QSwGQYiDX2LqTOhm/E6EEL07a/ietqEkmzSbcsE6hTwGz0+d0
         6O8M0jNvvar7jsHOrnlPYsCBV8XlTuDX5Rvi2ri1okiqsVsDG0/n0IT4juLU3T/0Bc
         f+//6NxItLpqFVPY8lXKqkpzBrk0dT54mo5pAiRb1FCNZo8h6u6GOknJButyPnSpzg
         7QPzMP1H8rQ3Q==
From:   Gabriel Krisman Bertazi <krisman@collabora.com>
To:     Emil Velikov <emil.velikov@collabora.com>
Cc:     Shreeya Patel <shreeya.patel@collabora.com>,
        linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCH] gpio: Initialize gc->irq.domain before setting gc->to_irq
In-Reply-To: <YYp8JzxfLK2u0fU4@arch-x1c3> (Emil Velikov's message of "Tue, 9
        Nov 2021 13:48:23 +0000")
Organization: Collabora
References: <20211108214148.9724-1-shreeya.patel@collabora.com>
        <YYp8JzxfLK2u0fU4@arch-x1c3>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date:   Mon, 15 Nov 2021 14:53:49 -0500
Message-ID: <87tugdxkj6.fsf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Emil Velikov <emil.velikov@collabora.com> writes:

> Hi Shreeya, all,
>
> On 2021/11/09, Shreeya Patel wrote:
>> There is a race in registering of gc->irq.domain when
>> probing the I2C driver.
>> This sometimes leads to a Kernel NULL pointer dereference
>> in gpiochip_to_irq function which uses the domain variable.
>> 
>> To avoid this issue, set gc->to_irq after domain is
>> initialized. This will make sure whenever gpiochip_to_irq
>> is called, it has domain already initialized.
>> 
>
> What is stopping the next developer to moving the assignment to the
> incorrect place? Aka should we add an inline comment about this?

I agree with Emil.  The patch seems like a workaround that doesn't
really solve the underlying issue.  I'm not familiar with this code, but
it seems that gc is missing a lock during this initialization, to prevent
it from exposing a partially initialized gc->irq.

-- 
Gabriel Krisman Bertazi
