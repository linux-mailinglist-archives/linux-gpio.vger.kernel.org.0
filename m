Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E624D446B36
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Nov 2021 00:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbhKEX2n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 19:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbhKEX2n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Nov 2021 19:28:43 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 090C1C061570;
        Fri,  5 Nov 2021 16:26:03 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 458D222247;
        Sat,  6 Nov 2021 00:26:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1636154761;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hwVqj2YlRSm88Yl9/rtdKB9RH4VS25SKBR6+J4C5/i4=;
        b=Mcy282jXLjfB1DMqaOkuwKJzJB5kbJcdstl5jwhY0KT9PaSAdQkdHMyzN85Lpvw0EbaHLO
        6noWcFbD1GfuipVS/s4wVY0ukitYJhz65SeAZMvvVB4vSySHVxAB/iIN/6VVhvfTqnLYN7
        o54EBxYRG4cRUKlbG2nI2h67S8Ng2h8=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 06 Nov 2021 00:26:01 +0100
From:   Michael Walle <michael@walle.cc>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, lee.jones@linaro.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com,
        luka.perkov@sartura.hr
Subject: Re: [PATCH v8 2/6] gpio: Add Delta TN48M CPLD GPIO driver
In-Reply-To: <20211105113859.101868-2-robert.marko@sartura.hr>
References: <20211105113859.101868-1-robert.marko@sartura.hr>
 <20211105113859.101868-2-robert.marko@sartura.hr>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <0089ad65c17a5d12e86ee09aaa7716da@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-11-05 12:38, schrieb Robert Marko:
> Delta TN48M switch has an onboard Lattice CPLD that is used as a GPIO
> expander.
> 
> The CPLD provides 12 pins in total on the TN48M, but on more advanced
> switch models it provides up to 192 pins, so the driver is extendable
> to support more switches.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Reviewed-by: Michael Walle <michael@walle.cc>

-michael
