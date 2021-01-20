Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D97F62FD4BC
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Jan 2021 17:00:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391071AbhATP7Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jan 2021 10:59:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:34444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390825AbhATP7M (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Jan 2021 10:59:12 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D12782336D;
        Wed, 20 Jan 2021 15:58:31 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1l2FsL-008zAu-Rb; Wed, 20 Jan 2021 15:58:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 20 Jan 2021 15:58:29 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Android Kernel Team <kernel-team@android.com>,
        linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] gpiolib: Bind gpio_device to a driver to enable
 fw_devlink=on by default
In-Reply-To: <YAhQzxaHCffpPSdQ@kroah.com>
References: <20210116011412.3211292-1-saravanak@google.com>
 <87r1mjkc07.wl-maz@kernel.org>
 <CAGETcx_5JJ2An=URY=0GwBbZzjfqN4w=-+2BuCsstYePej3sRw@mail.gmail.com>
 <01f733ab81959e4cf847cbf1d521ad9d@kernel.org> <YAhQzxaHCffpPSdQ@kroah.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <2c2950c5bf94e456560704dbfa48ed16@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: gregkh@linuxfoundation.org, saravanak@google.com, linus.walleij@linaro.org, bgolaszewski@baylibre.com, Jisheng.Zhang@synaptics.com, kever.yang@rock-chips.com, kernel-team@android.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2021-01-20 15:48, Greg Kroah-Hartman wrote:
> On Wed, Jan 20, 2021 at 03:39:30PM +0000, Marc Zyngier wrote:

>> Anyway, I said what I had to say. If platforms break with this
>> change, I'll expect it to be disabled in 5.12.
> 
> I'm thinking we can not change the default and will probably revert 
> this
> patch "soon".

I think there is a lot of value in keeping this enabled for a bit,
so that we can work out what breaks, and find solutions that scale
a bit better.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
