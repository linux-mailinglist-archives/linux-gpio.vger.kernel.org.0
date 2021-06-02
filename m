Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78191398660
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 12:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbhFBKX4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 06:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbhFBKX4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 06:23:56 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89A6CC061574;
        Wed,  2 Jun 2021 03:22:13 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 491A52222E;
        Wed,  2 Jun 2021 12:22:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1622629330;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9JjiZVY1G39yLkYo2plpR+nek2Ix2xJGXMP7Q3ED5aw=;
        b=v2RezFrHNxnZUZ1VpIP4uqNw6KTOg8ZHU1Kb9SuS2iu0Ulcvv1//avHR2ebe/r0G1p5JkI
        3KLkSTk+vyyEjpfGDW1gTtpyn6NVbSnzTY2BRqw8fnGijr+iCDD3+7FMDqOCLZoJeD7Wci
        VHHrcyy5EYnpaVpiHRztD1ksEMhOylo=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 02 Jun 2021 12:22:09 +0200
From:   Michael Walle <michael@walle.cc>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Subject: Re: [PATCH v2 3/4] dt-bindings: mfd: Add Delta TN48M CPLD drivers
 bindings
In-Reply-To: <20210601144826.GI543307@dell>
References: <20210524120539.3267145-1-robert.marko@sartura.hr>
 <20210524120539.3267145-3-robert.marko@sartura.hr>
 <20210524230940.GA1350504@robh.at.kernel.org>
 <20210525074649.GC4005783@dell>
 <CA+HBbNFxCKbitVctbUisuZXJWxaZp0cswNNNTgD0UxQZ1smJbg@mail.gmail.com>
 <20210526075255.GG4005783@dell>
 <CA+HBbNGSH9AvRo0Hwa5pWea94u0LwJt=Kj7gWjSAV9fS5VFr0A@mail.gmail.com>
 <20210601081933.GU543307@dell> <50ced58164999f51a8c8b9c8dc01468e@walle.cc>
 <20210601135816.GG543307@dell> <20210601144826.GI543307@dell>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <bb73c46de48094759099e244e09b333c@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-06-01 16:48, schrieb Lee Jones:
> On Tue, 01 Jun 2021, Lee Jones wrote:
> 
>> On Tue, 01 Jun 2021, Michael Walle wrote:
>> 
>> > Am 2021-06-01 10:19, schrieb Lee Jones:
>> > > Why do you require one single Regmap anyway?  Are they register banks
>> > > not neatly separated on a per-function basis?
>> >
>> > AFAIK you can only have one I2C device driver per device, hence the
>> > simple-mfd-i2c.
>> 
>> Sorry, can you provide more detail.
> 
> I'd still like further explanation to be sure, but if you mean what I
> think you mean then, no, I don't think that's correct.

We've already discussed this:

https://lore.kernel.org/lkml/20200622075145.1464020-1-lee.jones@linaro.org/
https://lore.kernel.org/lkml/20200605065709.GD3714@dell/

And how would a device tree binding look like if you have multiple
i2c devices with the same i2c address?

-michael
