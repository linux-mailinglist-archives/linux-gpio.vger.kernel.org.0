Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47A781D54AF
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2020 17:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbgEOPal (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 May 2020 11:30:41 -0400
Received: from foss.arm.com ([217.140.110.172]:58186 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726249AbgEOPak (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 15 May 2020 11:30:40 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26C1D2F;
        Fri, 15 May 2020 08:30:40 -0700 (PDT)
Received: from [10.57.27.64] (unknown [10.57.27.64])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C26B23F71E;
        Fri, 15 May 2020 08:30:37 -0700 (PDT)
Subject: Re: [PATCH 06/14] arm64: dts: sparx5: Add basic cpu support
To:     Lars Povlsen <lars.povlsen@microchip.com>,
        Marc Zyngier <maz@misterjones.org>
Cc:     devicetree@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, SoC Team <soc@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        Olof Johansson <olof@lixom.net>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>
References: <20200513125532.24585-1-lars.povlsen@microchip.com>
 <20200513125532.24585-7-lars.povlsen@microchip.com>
 <2d230dab95ee96727a42f9c242c93c18@misterjones.org>
 <871rnlp740.fsf@soft-dev15.microsemi.net>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <18c0d9ef-9a2b-31d0-b317-f051bb26a907@arm.com>
Date:   Fri, 15 May 2020 16:30:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <871rnlp740.fsf@soft-dev15.microsemi.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-05-15 16:09, Lars Povlsen wrote:
[...]
>>> +             cpu0: cpu@0 {
>>> +                     compatible = "arm,cortex-a53", "arm,armv8";

Side note: only one compatible string for the real CPU please, running a 
DT bindings check should complain about that.

>>> +                     device_type = "cpu";
>>> +                     reg = <0x0 0x0>;
>>> +                     enable-method = "spin-table";
>>
>> Really? This is 2020, not 2012 any more. Surely a new platform
>> boots using PSCI, and not *this*.
>>
> 
> We don't currently support PSCI. The platform does not have TrustZone,
> hence we don't use ATF.
AIUI, part of the purpose of ATF is to provide a nice standardised 
platform interface regardless of whether you care about Secure software 
or not. It shouldn't take much to knock up a trivial ATF port that just 
uses an internal spin-table for its PSCI backend - in fact I suspect 
that's probably just a copy-paste from the RPi3 port ;)

Robin.
