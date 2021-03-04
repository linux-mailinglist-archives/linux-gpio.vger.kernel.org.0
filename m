Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09F7932D6B3
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 16:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234916AbhCDPcE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 10:32:04 -0500
Received: from ssl.serverraum.org ([176.9.125.105]:58297 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234913AbhCDPcC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 10:32:02 -0500
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 306F822234;
        Thu,  4 Mar 2021 16:31:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1614871880;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DA30murhEvgKpAf+gX5S/ctkqDo3ACRWN/3NimWCRKk=;
        b=hXXJHypQ4ojCx17slQ/Qf+ED9+PcbAhcz3rt1c8l/U7N1ONSuf9iRqgpzoNFCkqz+ayjHh
        dbxmUiJew4zIa1w3FVpIqu4O+Ysb7wWaA9WM1ZkYRNTFEVBB7Zk9a3eqNNP4GWqb7U2UFz
        uO/4YP4adt8M2Hx3wDSbA4kNd5hVnHc=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 04 Mar 2021 16:31:20 +0100
From:   Michael Walle <michael@walle.cc>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] gpio: regmap: set gpio_chip of_node
In-Reply-To: <CAHp75Vc6azROSAc=ZUjY+VhAjZDMsukr2ZY1fQHMFwncL7_AbQ@mail.gmail.com>
References: <20210304071506.18434-1-noltari@gmail.com>
 <CAHp75Vc6azROSAc=ZUjY+VhAjZDMsukr2ZY1fQHMFwncL7_AbQ@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <7b12985726c898d63d882486f01a60d7@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-03-04 16:22, schrieb Andy Shevchenko:
> On Thu, Mar 4, 2021 at 5:18 PM Álvaro Fernández Rojas 
> <noltari@gmail.com> wrote:
>> 
>> This is needed for properly registering gpio regmap as a child of a 
>> regmap
>> pin controller.
> 
>> +       chip->of_node = config->of_node ?: 
>> dev_of_node(config->parent);
> 
> After a closer look I have no clue why you need this patch at all.
> The second part, i.e. assigning parent's fwnode, is done already in
> the GPIO library core.
> The first part, keeping fwnode in the regmap configuration puzzles me. 
> Why?

You're right if chip->of_node is not set it will eventually be set to
node of the parent device.

In case of the BCM driver the parent device is the pinctrl device and
the node is a children (if that is correct I cannot say). So, in this
case you cannot use the node of the parent, because that would be the
pinctrl one.

You could just use
   chip->of_node = dev_of_node(config->parent)

But then it is not obvious that it is optional. Hence my suggestion
to explicitly set to the parent of_node if none is supplied.

-michael
