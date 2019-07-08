Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29CC961D2C
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2019 12:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728499AbfGHKnj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jul 2019 06:43:39 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:44657 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfGHKni (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jul 2019 06:43:38 -0400
Received: from [192.168.1.110] ([95.117.164.184]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N8nrc-1iXbIp3f9y-015u8i; Mon, 08 Jul 2019 12:43:25 +0200
Subject: Re: [PATCH] platform/x86: Fix PCENGINES_APU2 Kconfig warning
To:     YueHaibing <yuehaibing@huawei.com>, dvhart@infradead.org,
        andy@infradead.org, linus.walleij@linaro.org,
        rdunlap@infradead.org, info@metux.net
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20190704062725.50400-1-yuehaibing@huawei.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <603661e6-8694-4787-6cee-61cc6ba61fc2@metux.net>
Date:   Mon, 8 Jul 2019 12:43:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190704062725.50400-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:k1ASFLMCv+5OWSYUYYtaraIfKomT4nTCcaVf4oT+GAFdybzzBGA
 PMb83RA+PAxxOKE0M8vADo5wuHV1V/hOEXU5l+aZkjda3H4wt8MadTRAVhSMVQqlfXX5wXE
 a+v+66cBXAt2x41H8wI8Yro2gERQGLi6T6V8YQd1IX6QBHvD5CMJLd4BOj3YoWuUstGPf/F
 1kAO0j4X3EQCrgCNrqGrA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Pkz+poKC/9g=:RQzTbx4w0e9jQQHrKZwyOK
 S+jIiWDIfD8snEe3ikdQ3qPoVvo4Xypssgid430xCNfykbAuuGXrrFcO5kUtNsBAAj/VWPtT3
 oasB7iSchd8DoF9OiKKa8LTIILFXQMIgYxrPutmXaECL4np2FESPe0ta7egNgf9Rk4iXBXvzE
 ktl9nXyExrYYIu/0O1b1+72zn8gO6hR54yMUImSBoCfu+H9IZ7Ufx3JZAoYXHew739kjhlOil
 ow5hccagNxFoVO3ekxB14bblysTE9MRpsr4uQrYsc3QqQ6Ho4staeQbG4RPyKK0+5AoyZnkGi
 KKhD2162g7E/59YB/OVpgkuaftPmB0r4H15dgywkQU2uEvtOe2BrH1sbjUbz6AdxXpZxky8XR
 WBNX+F47SHc+iIS3hes2fzMNkMTwGHM3XAi2yXm88wd2jyh976R4ultLTnQUlGz521i/KJQL6
 Cr/iGv9LTbGNE8n0H9tlD1F8FjqUtQ2s/pNDfQPruSVLHlKrED/5+npsaKbEzAWI5yD2866OQ
 m7XNLTZtdQ8MjerXFWgZ2sq1x4A8eeaiwWAIXQgMHfdoia12j9ef2eHAw5A9UxD06q0pI3Chz
 ZQs8qRexnrY+AUJVoPp+3wQsI952+HtfPiLl8SVCAnPvMq0jb3F5bsBibQ0J2gkEwmY+c+bGd
 cwNpe5SdjArjOIKbBAKCFHTNRi9hCI+3CWUcrXBzELjEZL4bx/q3TveG9GlaS4P6g0dNnRjOB
 C1mcgoTbxzFeRkAG4kMamxuzgrM4jkc/QiyB31aZScT485Fj8S8CVAKtjw0=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 04.07.19 08:27, YueHaibing wrote:
> Fix Kconfig warning for PCENGINES_APU2 symbol:
> 
> WARNING: unmet direct dependencies detected for GPIO_AMD_FCH
>   Depends on [n]: GPIOLIB [=n] && HAS_IOMEM [=y]
>   Selected by [y]:
>   - PCENGINES_APU2 [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && INPUT [=y] && INPUT_KEYBOARD [=y] && LEDS_CLASS [=y]
> 
> WARNING: unmet direct dependencies detected for KEYBOARD_GPIO_POLLED
>   Depends on [n]: !UML && INPUT [=y] && INPUT_KEYBOARD [=y] && GPIOLIB [=n]
>   Selected by [y]:
>   - PCENGINES_APU2 [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && INPUT [=y] && INPUT_KEYBOARD [=y] && LEDS_CLASS [=y]
> 
> Add GPIOLIB dependency to fix it.

hmm, I'm not really happy w/ the kernel config system at that point:

If the select on the gpio driver would just subsequently enable gpiolib,
everything would be fine. But that contradicts how subsystems are
currently handled - you first have to enable gpio subsystem before
choosing anything that depends on it :(

Could it make sense to refactor gpiolib in a way that pieces directly
needed by gpio consumers or drivers (hmm, perhaps have separate
dependency symbols for consumer vs driver) can be selected directly,
even if the big gpio subsystem knob is disabled ? (but the other things
like userland interfaces would remain disabled) ?

OTOH, for this particular patch:

Ack-By: Enrico Weigelt <info@metux.net>


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
