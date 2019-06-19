Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B31A4B777
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jun 2019 13:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727314AbfFSLyF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jun 2019 07:54:05 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40338 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727244AbfFSLyF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jun 2019 07:54:05 -0400
Received: from broadband.bt.com (unknown [IPv6:2a00:23c5:58d:db00:36ee:cfb1:e0d:7749])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: martyn)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 73AC0260195;
        Wed, 19 Jun 2019 12:54:04 +0100 (BST)
Message-ID: <e344f5a35e314ebcea110ba082b74659de5b0e5e.camel@collabora.com>
Subject: Re: [RFC] Addition of kernel
From:   Martyn Welch <martyn.welch@collabora.com>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, kernel@collabora.com
Date:   Wed, 19 Jun 2019 12:54:01 +0100
In-Reply-To: <e6ca74e2-fc51-3f24-c5e9-18c22d6f87ef@metux.net>
References: <dd30c34a83293926c072f6a3fe612dcf134b7620.camel@collabora.com>
         <e6ca74e2-fc51-3f24-c5e9-18c22d6f87ef@metux.net>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2019-06-17 at 14:39 +0200, Enrico Weigelt, metux IT consult
wrote:
> On 17.06.19 10:29, Martyn Welch wrote:
> We are currently in the position that we would like to pre-
> > configure
> > some GPIOs at boot time and be able to later affect the state of
> > GPIOs
> > configured as outputs or read the state of GPIOs previously
> > configured
> > as inputs.
> 
> what's the actual use case you've got in mind ?
> 
> I've got the feeling that these lines aren't really so "generic" in
> your case, but attached to something that has a particular meaning.
> 
> So, maybe something that deserves it's own driver ?
> 

You're right, the lines we wish to use this with aren't generic gpios,
they are primarily control lines for specific peripherals on the
device. I believe you are right, in an ideal world we could write
drivers for some of the functionality currently being exposed to user
space. But I'm fairly sure some of the lines don't have a sensible
driver model in which to fit them, specifically I can think of the
reset, boot mode control and interrupt lines for the GPS unit embedded
in the device I'm working on.

We are also not in the position to make major changes to how
functionality on this device has already been implemented and whilst we
are hoping to move to using proper drivers in some places, this is not
going to be tenable in all cases and we would ideally like to avoid
utilising a home grown (and certainly unlikely to be upstreamable)
solution for exposing these GPIOs.

Martyn

