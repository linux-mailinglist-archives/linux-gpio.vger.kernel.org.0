Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E74D832D88C
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 18:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232359AbhCDRZI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 12:25:08 -0500
Received: from ssl.serverraum.org ([176.9.125.105]:37729 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235312AbhCDRY5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 12:24:57 -0500
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 140B022234;
        Thu,  4 Mar 2021 18:24:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1614878655;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8leGGOIllg2Pcj6YAxzqPRQC7qBgzYYE3S5qurTfY54=;
        b=srDRU9NNYJH4B+t8TOFUb5PW7UcEAjU98lrAXmgbkznEudWIwmObRJsvwekZn7YgZMLH+7
        clIfjZWB0StdARntUPAVDUhjiHk7yFLYJUBp4f8fLWihVRcYe0yp6Kw+zqhekFJdcVLylm
        eqdsc4ojmqpvjJbxcuqUSbX/Lzxn6xo=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 04 Mar 2021 18:24:12 +0100
From:   Michael Walle <michael@walle.cc>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 02/15] gpio: regmap: set gpio_chip of_node
In-Reply-To: <CAHp75Ve9uW6+kpNmsG2BaaOymoAKXPdebNCfRnxUpAZoQnfZ0Q@mail.gmail.com>
References: <20210304085710.7128-1-noltari@gmail.com>
 <20210304085710.7128-3-noltari@gmail.com>
 <CAHp75VcpGNaQDR5puEX3nTGOQC0vHNjCje3MLLynoBHdjEi0_w@mail.gmail.com>
 <9A8A595D-2556-4493-AA96-41A3C3E39292@gmail.com>
 <CAHp75VdJGh=Vy=kJr2CemPbSa-amYykNoYd0-jaz0utdC_bkbg@mail.gmail.com>
 <0504ADC2-0DD5-4E9E-B7DF-353B4EBAB6B4@gmail.com>
 <CAHp75VdkCxBeh_cWwN9dKRpEMntMp22yVjWRCuYumhMzrWi+SA@mail.gmail.com>
 <68F60F3F-33DD-4183-84F9-8D62BFA8A8F1@gmail.com>
 <CAHp75VdJ0=EewuHW2Ja5MQ=e9q0njGun8iN5Q6JWUxe=CLB=MQ@mail.gmail.com>
 <CAHp75Ve9uW6+kpNmsG2BaaOymoAKXPdebNCfRnxUpAZoQnfZ0Q@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <4839e31730b22004f1ebe9510d3823ce@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-03-04 17:46, schrieb Andy Shevchenko:
> On Thu, Mar 4, 2021 at 6:33 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Thu, Mar 4, 2021 at 5:44 PM Álvaro Fernández Rojas 
>> <noltari@gmail.com> wrote:
> 
> Let me summarize what we can do this independently on any of my
> patches and be okay with.
> 
> In the regmap GPIO configuration you supply struct fwnode_handle 
> *fwnode.
> You can you fwnode API in the actual GPIO controller driver.
> Inside gpio-regmap simply do this for now
> 
> gc->of_node = to_of_node(config->fwnode);

If doing so, can we please have a comment saying that config->fwnode
might be NULL in which case the fwnode of the parent is used?

> The last part is an amendment I have told about, but it can be done
> later on by switching the entire GPIO chip to use fwnode instead of
> of_node.

-- 
-michael
