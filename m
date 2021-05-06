Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62510375883
	for <lists+linux-gpio@lfdr.de>; Thu,  6 May 2021 18:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235757AbhEFQf2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 May 2021 12:35:28 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:46415 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235793AbhEFQf2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 May 2021 12:35:28 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id BDD8E2224F;
        Thu,  6 May 2021 18:34:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1620318868;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4kkxr7jWiTaMo+USElly45/R3D6WZD6JStzkFFn8KcI=;
        b=lJUYzWJTJQiUHa/2rPI/I9EIVFH3rWqE+4YE/OJ2SqzTvBHNKdR63WYao3BLI/7/8qF+iW
        sxuIQu5bUtN6MDbqqcmS0IxXsVGv/myPzmOjrvkypr+KNoop2BsOs7HjlO7zMKssO9z2bQ
        OeGSV62MNa4qDg3WVZdjlb/oIbNLleg=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 06 May 2021 18:34:27 +0200
From:   Michael Walle <michael@walle.cc>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     lee.jones@linaro.org, robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jdelvare@suse.com, linux@roeck-us.net,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
        luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de
Subject: Re: [PATCH 1/6] mfd: Add Delta TN48M CPLD driver
In-Reply-To: <20210430123511.116057-1-robert.marko@sartura.hr>
References: <20210430123511.116057-1-robert.marko@sartura.hr>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <af4923ef1ed0693fcd67d7986348b164@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Robert,

Am 2021-04-30 14:35, schrieb Robert Marko:
> Delta TN48M switches have a Lattice CPLD that serves
> multiple purposes including being a GPIO expander.
> So lets add the MFD core driver for it.

Did you have a look at mfd/simple-mfd-i2c.c?

-michael
