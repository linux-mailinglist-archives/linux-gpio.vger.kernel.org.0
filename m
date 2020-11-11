Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6342AF360
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 15:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbgKKOTo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 09:19:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:33916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725900AbgKKOTo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 09:19:44 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F19262072C;
        Wed, 11 Nov 2020 14:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605104383;
        bh=h4WV9Lcvcmda9mj7Yvwdlkfda2VnKDl/S6Wue0cEbww=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=J+gK39itAQr1hKBU/oBohrqJyBNJp+dhObEcEcGN5hENc74Sxjkwn4y83Xr0E0scq
         ZTuNeetHzWbbExckVB+IBU6pDWScsGE04JhlgM3smFXNE3SWRfpGk4Tk3iyVhsVsA9
         lISmyCUIictkOKQOZ3oofavfuSId0rVBpseD76iE=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1kcqyK-009mkO-WA; Wed, 11 Nov 2020 14:19:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 11 Nov 2020 14:19:40 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] gpio: msc313: MStar MSC313 GPIO driver
In-Reply-To: <CACRpkdaTknFRSm4pcSf-v7Be8A_SnMMrhegu6W67gUjOJVLEBQ@mail.gmail.com>
References: <20201019141008.871177-1-daniel@0x0f.com>
 <20201019141008.871177-4-daniel@0x0f.com>
 <CACRpkdZNr6sDqJhg3KcX0bCbcd8fh2gXFYbS1r2H2Sq+vGqjUw@mail.gmail.com>
 <3fd04aeb5047d8059ddecc1eda19c2e4@kernel.org>
 <CAFr9PX=vxCCQgCWe9FPb6Z=0=a48HwGOfM_uOG3SqGN9VSYQUA@mail.gmail.com>
 <71f3632bee262a18e1b7edb74980ae9a@kernel.org>
 <CACRpkdYr+yhyROQzaYfFrGwG74DuZiA=fMVOesgOKrDajhTodQ@mail.gmail.com>
 <bc0ab2f10bb72fe5b455ca12958f6444@kernel.org>
 <CACRpkdaTknFRSm4pcSf-v7Be8A_SnMMrhegu6W67gUjOJVLEBQ@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <40fec073b2423b698ef4d91c499c7c9f@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: linus.walleij@linaro.org, daniel@0x0f.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-11-11 14:09, Linus Walleij wrote:
> On Tue, Nov 10, 2020 at 3:19 PM Marc Zyngier <maz@kernel.org> wrote:
>> On 2020-11-10 14:02, Linus Walleij wrote:
> 
>> >> Probably nothing more than setting the callback to
>> >> irq_chip_set_affinity_parent,
>> >
>> > Hm, is this something all GPIO irqchips used on SMP systems
>> > should be doing? Or just hierarchical ones?
>> 
>> Probably only the hierarchical ones. I'd expect the non-hierarchical
>> GPIOs to be muxed behind a single interrupt, which makes it impossible
>> to move a single GPIO around, and moving the mux interrupt would break
>> userspace's expectations that interrupts move independently of each
>> others.
> 
> I found two suspects and sent patches. I think I might have some
> more candidates down in pinctrl. I do have some hierarchical IRQ
> that is on UP systems, I suppose these are not affected.

Yup, they look good. Feel free to add my Ack to them.
And yes, UP systems are naturally oblivious of interrupt affinity.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
