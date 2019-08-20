Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD5295C27
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 12:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729736AbfHTKRu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 06:17:50 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:50385 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729544AbfHTKRu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Aug 2019 06:17:50 -0400
Received: from [192.168.1.110] ([95.117.23.32]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M2wbS-1hyukC38X6-003NW3; Tue, 20 Aug 2019 12:17:48 +0200
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: RFC: is SIM connector switch a case for pinmux ?
Organization: metux IT consult
Message-ID: <a1bb9419-c499-dbd8-8e15-e7655b484d6e@metux.net>
Date:   Tue, 20 Aug 2019 12:17:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:K9QtXFy+Jwg/xRHmXFiWX03D01PorpZ+Av3oNTId8elFDHr3RB7
 G+i76VCxf79yAcA2RP0P/rTe57Lbu50yH6/fIYksV25uLorg+hJHUVe5o8uWVmXfyY4tWcp
 oHqIzC4Ghzy/NiL2NkxhyjqzsCmDDibj+hiztWXl6VcS2RJR4TBSXNXKgiIlZo+c3bZyDQS
 RpIYaeqxZtD/CGL3AJ7SA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UlXhfYdJPbo=:BRvPolD53WUtbPBaicI2Gb
 SuKZUGuqgTt2KSBREIkblK+3MJz3qqVpJ4mN55gpNzp0PnvXo4+7qRSbWNR1wjpvRtb9pJbP8
 bFXxF3OZi3AXo/yolrN1Q1kGngQzd3aNrvgCNgpUxVHTgDJp+qVx/7l/E4pZC8AU23wAz6ug5
 r+7C1KnQEBZDiA72srfGaWVBojMMX2NAUmSiHxtjcar3l6wH2otUYRFSZyPvNS/2TUHMsgJ3O
 P4+H+bCYEXMiyk09fCljiYiCfa3a34NR9wcHtiUjjMRQXPtRazVyuS+L5TqJGFvTbn63dXOhx
 syR5Ovd7ijX0Z9pjSIeDi7FdpkI63GqT0jtIn7JAdup+ksg35j8GThUw5IeRdHI4eQuVgJyNk
 gxHA9QFYlHpBCNzq5tIS5YRYeVKN5IaBJlM+SEYIDCDq8j57jq+qTb8Z3yt5iLwRCpOUGlgOa
 G2XBiniSWGv9DJoq7/JzkOMPXvVKUBlEUd0sgHtHLqkatHAGPyQ0ZHLAEr1zQm1E7L7TJz4fb
 wiMiK6strKOGp4guy9PUQidawebKPYxurxe4RQ5/zzyLzbJBimuTSd447w18MXTzHnvGnBOH3
 eIqsaJx/08oldGx37ymrcg5EV9SJg/8iowxDYi2AOcHlUGBbjA6QMAFFiO0hZagJYhv04Hthn
 q6ejXpzlQIi2AKyiRUonnq84Kgnq3Za9nQ0g7HYHxiiVI5JNlGFRAfmuTyT9iwpOp91SDz6SK
 AZs65m/+PNyly6+6YtyPz6HgoTNcpR5XfLdb3LSIGHOTxb4HVZhwhDl7DLM=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello folks,


I'm currently thinking about what would be the best fit for the
APU board's sim-switch functionality.

The boards have two sim sockets, where only one can be active at
a time (the lines are routed to mpcie slot), which can be controlled
via a gpio line.

Extconn doesn't seem to fit, as it IMHO only does the exact opposite
direction - detect what external connector is currently active (eg.
on slots that support multiple conntor types and switch automatically)

Pinmux might be an option, as this HW is some pin multiplexer, but in
this case it's not related SoC pins and doesn't control which internal
devices are connected to the outside.

I've already thought about introducing a new class for the pretty much
the opposite of extconn (maybe call it extswitch ?). There also might
be an semantic overlap w/ other subsystems, eg. kvm's connector
switching. Not sure whether yet another subsystem is the optimal
solution here.

What's your oppinion on that ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
