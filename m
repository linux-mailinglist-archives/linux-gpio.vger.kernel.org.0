Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6069632320B
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Feb 2021 21:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234262AbhBWUZE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Feb 2021 15:25:04 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:38155 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234231AbhBWUZB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Feb 2021 15:25:01 -0500
Received: from [192.168.1.155] ([77.9.11.4]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MfL5v-1lm58U2uBX-00gqLG; Tue, 23 Feb 2021 21:13:29 +0100
Subject: Re: [RFC PATCH 09/12] drivers: base: reintroduce find_bus()
To:     Greg KH <gregkh@linuxfoundation.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, rafael@kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, frowand.list@gmail.com,
        pantelis.antoniou@konsulko.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20210208222203.22335-1-info@metux.net>
 <20210208222203.22335-10-info@metux.net> <YCen7uHqFJQ/U/5p@kroah.com>
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
Message-ID: <da82c033-3a82-3420-4d06-f5c39c524ae9@metux.net>
Date:   Tue, 23 Feb 2021 21:13:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YCen7uHqFJQ/U/5p@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:K6t2Brz0acFlLE8pKtT6EGZ5DDbr4Gjg0xoO6NHOPqBovg9y0hR
 IJMjqOpjpq5NIsaB9MvbGjthbOf4bgBmXJYMpzI/rzoA02FLiiy0nfhoPf2O8kThWU6d8Xb
 ZR5fi7rP/0aT/JCfJFoeZfwhPChSxOjwNHGzjaE+PT71Xn5oy5kEcG61MawmAWkD4iC159a
 0/4sb2ns8N2cdck7Gvakw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qbsrZD4idXU=:wE73xu0E1ANdDKF1shWBbp
 JbE3hzM8TGBHd6XAG9ZKRYTiKx37+y5kK041SKPg2zs7vblDGEFjCiaCLC/k9AGCmO6PAQprO
 zvZjyX2dw79F17kvZI/6jXrWRRnY5W/0RDLKwvVl8y2tezKbLt7UUSqooYohCi8xivBf0/+/B
 93nJhI9srSjMIoyRBknP7UnWqp5hxodBPMtxKqElbEb6pvn/4rQePJzFXPJ85BP4L66zn+t7b
 xhGRPiMFAjSTfF+TTVFtqYR9OecMgQjV/nNVGeLnIRRoYviGRV3KNitRyJuXc5uk9OEiE6z1Y
 96bHwJ4ioQ+yyrmldMyIr3bwi3TcpXrCeXNCI+zraKUPuSVadAgdy2hsmOfcj6bdXqSdxhVi0
 Mg/5UKWadIfCU3kSgO6u9w6iuMLMpEgrU7azW5TMcrZ9wkynT+YHjHHkgiG10
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 13.02.21 11:20, Greg KH wrote:
> On Mon, Feb 08, 2021 at 11:22:00PM +0100, Enrico Weigelt, metux IT consult wrote:
>> ---
>>   drivers/base/bus.c         | 14 ++++++++++----
>>   include/linux/device/bus.h |  2 ++
>>   2 files changed, 12 insertions(+), 4 deletions(-)
> 
> Um, no.

Why not ? Do you have a better idea ?

What I actually need is a way to unbdind a specific device, identified
by bus name and device name. The problem to be solved here is dropping
devices that have been enumerated in a bad way by firmware (ACPI in this
case), and then recreating it in a clean, consistent way.

If there was a variant of bus_find_device_by_name() which takes the name
instead of ptr to the bus, that would also be okay for me.


--mtx

-- 
-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
