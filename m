Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFE8E244AED
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 15:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727870AbgHNN47 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Aug 2020 09:56:59 -0400
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:52232 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726196AbgHNN47 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 14 Aug 2020 09:56:59 -0400
Received: from [188.210.212.0] (helo=[192.168.0.104])
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1k6aCW-0003dh-C5; Fri, 14 Aug 2020 14:56:56 +0100
Subject: Re: [PATCH 0/3] pinctrl: mcp23s08: Fixups for mcp23x17
To:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200814100357.209340-1-thomas.preston@codethink.co.uk>
From:   Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <26d33248-c07b-db2c-2989-3ca14aea7896@codethink.co.uk>
Date:   Fri, 14 Aug 2020 14:56:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814100357.209340-1-thomas.preston@codethink.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14/08/2020 11:03, Thomas Preston wrote:
> I'm in the process of adding a device tree overlay for the PiFace
> Digital Raspberry Pi daughter board [0]. It's an mcp23s17 SPI GPIO port
> expander. In doing so, I noticed some errors with the mcp23s08 driver.
[snip]
> They're quite trivial and backwards compatible, although I might be
> wrong about "interrupt-controller". Can someone please confirm?
[snip]
> [0] https://github.com/raspberrypi/linux/pull/3794

Actually I think I'm wrong about the interrupt-controller changes in 
patches 0002 and 0003.

I think Patch 0001 fixups are fine still.

Sorry for the noise!
