Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2926F434A1D
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Oct 2021 13:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhJTLiM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Oct 2021 07:38:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:55052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229548AbhJTLiL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Oct 2021 07:38:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB8CF61361;
        Wed, 20 Oct 2021 11:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634729757;
        bh=10z/ZkyAmg9VU0wYgZ1jfMj3KdrMRtiICFx5TCEX90g=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=W5u6IOr4iWbNyarzuuqIQxpwWOZlnI1hSRhk8Db1p2xwz/1VwuxJEMIZKUpKLkzdv
         GIp3wBR4rJoa5vPSzq9G8EuUlz9MZwsQcs/8AeWawmoizjWGE+ZyoxRnDnA2zyBmFu
         uPUJcz3RKRjUYUVjbaFE+M/G30OoWGQ6zskgVckAmPcU+PWXOmyBwwyhwRkK07Z1rd
         tZIYRWaLDyYIpjTUbNLhRj05W6SfoSZ+IPHwStS218a5aiWzZHgMrV4oqJVrkIJKUN
         OkAXrRJMfUkXklSXhQaOddItQSHWTl2VRyFkgUSED+4fb5dBt+D0AuxbiS8lHbu/Zk
         OERCplFb+OCmQ==
Message-ID: <39c6560dd9f3fe09355cb2247f33762c1dce5f64.camel@kernel.org>
Subject: Re: [PATCH] pinctrl: bcm2835: Allow building driver as a module
From:   nicolas saenz julienne <nsaenz@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?ISO-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Marc Zyngier <maz@kernel.org>,
        Jason Wang <wangborong@cdjrlc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Phil Elwell <phil@raspberrypi.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Date:   Wed, 20 Oct 2021 13:35:48 +0200
In-Reply-To: <20211019221127.1953001-1-f.fainelli@gmail.com>
References: <20211019221127.1953001-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.0 (3.42.0-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 2021-10-19 at 15:11 -0700, Florian Fainelli wrote:
> Update the pinctrl-bcm2835 driver to support being built as as a module
> by converting it to a module_platform_driver() with the appropriate
> module license, authors and description.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Regards,
Nicolas

