Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 660ED504D8
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 10:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbfFXItl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 04:49:41 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:47485 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbfFXItl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 04:49:41 -0400
Received: from [192.168.1.110] ([77.4.138.202]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MdNoW-1iEON12df6-00ZLUh; Mon, 24 Jun 2019 10:49:39 +0200
Subject: Re: [RFC] Addition of kernel
To:     Martyn Welch <martyn.welch@collabora.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, kernel@collabora.com
References: <dd30c34a83293926c072f6a3fe612dcf134b7620.camel@collabora.com>
 <e6ca74e2-fc51-3f24-c5e9-18c22d6f87ef@metux.net>
 <e344f5a35e314ebcea110ba082b74659de5b0e5e.camel@collabora.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <d22aa45a-e240-9d2f-6ef4-ac7bb81f42e0@metux.net>
Date:   Mon, 24 Jun 2019 10:49:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <e344f5a35e314ebcea110ba082b74659de5b0e5e.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:38Iq1DCs9A9gqwsUkBZ+wL6JUIjI/VUYFB4DPQp1MhWqAj49VYZ
 pQg5AzTh0osHAcFmSCatESLOP8STxcECQN+6MgarmdNaxcx8r3PVW7Z1INoCMfcPZJ+Gjdg
 Q2fhOpGJR/qz2/p3UtIJoRnFeHCI/Ycqv8VRdnx7x1pMhTuKwaSr6aztMNvzL0Xx2I+sZay
 fo1tK6YWJYVVWZODvsJrA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:py9zSCeRz2A=:XIqqrAdxKOx+erVuKtOpyS
 sZC11SjoPZlZ4zhOkuY8RnD4Roxem+pjWHtIQZq+GuMTkoKdT/1ms1C/Qd8nWMsZddUuJt/jt
 +UZGDO3k3AxJMScERjhFQ98+0o8D7p2EHmCUxDd8FKGtxoDdmnc1n+unn6qeJdqY3cCziY1zp
 OngOme+RVL+xesCTnmx7OkXTwo5BI1+xvCa69XyLqRkHLWMWLAkDyc47ppWu3BnM3ecDpZ6Vp
 BKTYmoxIhzJeCLpAcr0jnLiL6RKp6qXD6AtZ6bmrk+LMnHYZkjFwN6Ab//QCABkznFvf8MN92
 KdsQHCohZXAHlF0AEbjwyZyB93YAuQveNiuNgwi0uyp8SeUVIOwbZQRyp5U4x8Kiv94GWv0V4
 b7Jda6LILsKdjEnZoiLoAo2cetnuR96cBOw56X2SnmjQ4r0WiypcWsedI3gAZfhXHku6kYOPJ
 +JqrH6KkVK2+ux+7kirjSozrW7qV8/4YPt2OXKQayz39BGjENzdzMV3pIWe4Rtmk4dk9GECZG
 /sRgfTqd4hDkIQcfTmyok8FFJTD6Kut7yoFQNLkgUT+TZ5IZLhSoq7UU1pEzj+8qfoO06Iq6f
 DpfahOLxQurg4UrAittGpbw8WHfipS4B9Vo3DOccpQmgPU0HSps2ycjgRFhpE04Hm4avCKxF2
 qJdFQvSaPTlsQMkNzgqdWczf98sfyD/qQOem6X/ramSESQdyb47jeyLLGNkUERtn4FyBZCP+p
 6ISPlZMd7A8PUSH2FC/Jq1sEm4mzWbSUrJs5wRAfVxL67mTekFHL5SrdTxk=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19.06.19 13:54, Martyn Welch wrote:

Hi,

> But I'm fairly sure some of the lines don't have a sensible
> driver model in which to fit them, specifically I can think of the
> reset, boot mode control and interrupt lines for the GPS unit embedded
> in the device I'm working on.

Looks like a case for rfkill, pm, etc.

> We are also not in the position to make major changes to how
> functionality on this device has already been implemented and whilst we
> are hoping to move to using proper drivers in some places, this is not
> going to be tenable in all cases and we would ideally like to avoid
> utilising a home grown (and certainly unlikely to be upstreamable)
> solution for exposing these GPIOs.

IMHO, the best way for getting things upstream are generic (but
configurable) drivers, or improving existing ones.

If it's just about getting some gpios in a specific state at bootup,
why not doing that in an init script ?

Your description feels a bit like trying to introduce some workarounds
for some not so well designed proprietary legacy code. If your
application directly drives raw gpio's (something I'd do only in really,
exceptionally rare cases), but needs something else to do some tweaks
first, that looks like a broken application. OTOH, I don't think that
applications should do such low level hardware access in the first
place.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
