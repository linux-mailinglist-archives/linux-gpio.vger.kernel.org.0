Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2DFD37588E
	for <lists+linux-gpio@lfdr.de>; Thu,  6 May 2021 18:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235881AbhEFQjn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 May 2021 12:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235617AbhEFQjn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 May 2021 12:39:43 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFCDFC061574;
        Thu,  6 May 2021 09:38:44 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 22A5A22264;
        Thu,  6 May 2021 18:38:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1620319121;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gVkMrQ/iSFng03q+vYord5gGnO9YCbe1HWJWRJRnKCw=;
        b=tZRv7ehGNivRylG+i8rjxXn6P3Oet0VvP3pgg0iiMgBi01bNy8aVimYNhElPhS5tNj6RHC
        xLY3+Pam7GGhH/1/XVL1qkYSCuAry3mi/ax18dB4tAqCHi7N8jfmGbtY/KuGGJalr8UubP
        Fn+UTsg3La1ERywSoB/SQpBaBRcu6Lg=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 06 May 2021 18:38:41 +0200
From:   Michael Walle <michael@walle.cc>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     lee.jones@linaro.org, robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jdelvare@suse.com, linux@roeck-us.net,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
        luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de
Subject: Re: [PATCH 3/6] gpio: Add Delta TN48M CPLD GPIO driver
In-Reply-To: <20210430123511.116057-3-robert.marko@sartura.hr>
References: <20210430123511.116057-1-robert.marko@sartura.hr>
 <20210430123511.116057-3-robert.marko@sartura.hr>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <10b67a4dce693f013eccfd6f46ecb4c4@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-04-30 14:35, schrieb Robert Marko:
> Delta TN48M CPLD is used as a GPIO expander for the SFP GPIOs.
> 
> It is a mix of input only and output only pins.
> 
> Since there is no logical GPIO numbering arbitrary one is used
> along dt-bindings to make it humanly readable.

Can gpio/gpio-regmap.c be used here? See gpio/gpio-sl28cpld.c
for an example.

-michael
