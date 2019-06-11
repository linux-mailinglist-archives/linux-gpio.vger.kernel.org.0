Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0B5D3D5B8
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 20:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392029AbfFKSrW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 14:47:22 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:46105 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391484AbfFKSrV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jun 2019 14:47:21 -0400
Received: from [192.168.1.110] ([95.118.191.213]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MgNlH-1gstWx27VH-00htGo for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2019
 20:47:20 +0200
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: RFC: generalizing gpio register set types
Organization: metux IT consult
Message-ID: <1512f451-8cb6-0f30-6640-27a22f1a505f@metux.net>
Date:   Tue, 11 Jun 2019 20:47:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:hNEHvokux82pqCXaefBtiAav3iYh3Yt9f9Uqg2CZNqkfm+tDCyL
 wUvgqPWSR+5uV9k8h8S0vxtCEukUsXGV0bVur8KrPlA28nUu1h/bxdWEzG/e2TTxlgFie/z
 KgwUGJKZeRqp8FTvuhvireNFGjOGRYMFyOZtb1qtNE+ioPV5k8NbkrNb/uHW6nromxDmYxE
 Tn0dIsnpXAn22GeclH67w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eitmiQSQtcU=:cBjmOFkoWRCDwIb5wJZgyk
 4GUat6J3xcrCqwlRPYfYqZ+Nyl6Qa2v6mohuRzMZ6KNMjesLYocaY/Ufhvq4X256v/45clzGj
 MQ/y3HFaoHSA2/YGXI4HE8vwbjaTPWZaNtuHVFC/AiK8hGFrwtUHNygM8M5EkYGbjBXi4Dxs2
 T4UpI6bJH1+SypHAu3msboGIjYLhMUVvrVpEZfySI1WL25HIX3NpK0R/L84YjeblbmrR7DMt4
 nj77k0D9bSoTQ51Pjw3vDEiZ9HlNTM1tGXw/CSXOAvdb4xuYbWZzS1madK1ZJ10IJooYUDXCq
 sCkkhQMXo6NggF6a0x1c3dKU75rNjDGJM9Pk8jHB10otRSPNWmE8FfzAtH4rtILkF2F34sloF
 TAqyA7/iQOHw+6xcQh8dHXhpSJpmZV97kKqnd/qPyC7UF0OsxShhWlx+rIdqGKdrkBg0s+hTA
 T0EPtpsbIhKqJn3w02+r8TtMYwG1nnJ39a7O1BfAsrvwKzdjhDBVLrLFAwwHz+t3wlZUQrZWn
 cM4XrGy/FfTcvx2sbBo9g9cpkkqJhOd2Nc7TYtT/SvTXYXvP/56SBBlqg23UCSLiUlxFyCkm6
 nS7EcdWBl9x1VTQ3+0LsDGbe9qS/9GQo5IQLvBtn9PvJbd01W8lKDbwHKZc79AJw2KHw4SScm
 kZMl9y2oKSpOgemahDqXiNoTwQHL3VSqWoVhy9Xdbs3kGR5wHe2u1Ydb26v3BEYVaRBFwtnpa
 Sml/fC4d497CDic7Dmzj19Qka0gk2jrEuyc8Mg9TWmC9Lx2Xv7LPfKmfxz4=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi folks,


I'm curious about what types register sets the various gpio controllers
have, in order to find out whether there's still room for a bit more
generalization. Hopefully I'd like to find some formal description of
(most) gpio controllers, so we could do many drivers pretty much in
a declarative way. (eg. by just filling some structs)

For example, the AMD FCH's gpio controller has one 32bit register per
line, which includes control and data flags. The actual register banks
don't seem to be linear, but that might be an misinterpretation of the
rare information i've got - perhaps certain gpios are just used
internally for not aren't wired.

This is an example of an what I'd like to call "one-reg-per-line" class.
The controller/device specific attributes here are:
  * control register width (eg. 32bit)
  * direction flag: bit# / mask, polarity
  * io/data flag: bit# / mask, polarity
  * map of gpio names/logical IDs <=> registers (relative to offset)
When generalizing probe/setup code, also:
  * register base address
  * oftree / acpi match tables
  * device name

I'm planning to write a generic driver, if we have more consumers for
that and solve the problem of generic passing of platform configuration
data, w/o using driver specific pdata structs.

There's another class, which we IMHO have a generalization for, is those
devices that have one wide register for all direction and one for all
data flags.

Does anybody know other classes that I didn't mention here ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
