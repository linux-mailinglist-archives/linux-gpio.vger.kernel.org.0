Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE5EFE2DF
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2019 14:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728044AbfD2Mjr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Apr 2019 08:39:47 -0400
Received: from submit-1.e-mind.com ([188.94.192.45]:35158 "EHLO
        submit-1.e-mind.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728006AbfD2Mjr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Apr 2019 08:39:47 -0400
Received: from localhost (unknown [127.0.0.1])
        by submit-1.e-mind.com (Postfix) with ESMTP id D6B59835931
        for <linux-gpio@vger.kernel.org>; Mon, 29 Apr 2019 12:39:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at emind.it
Received: from submit-1.e-mind.com ([127.0.0.1])
        by localhost (submit-1.e-mind.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id q5ScIzIXIA6f for <linux-gpio@vger.kernel.org>;
        Mon, 29 Apr 2019 14:39:43 +0200 (CEST)
Received: from qmail.e-mind.com (qmail34.e-mind.com [188.94.192.34])
        by submit-1.e-mind.com (Postfix) with SMTP id E4C3D83592E
        for <linux-gpio@vger.kernel.org>; Mon, 29 Apr 2019 14:39:43 +0200 (CEST)
Received: (qmail 15683 invoked by uid 0); 29 Apr 2019 12:39:44 -0000
Received: from unknown (HELO ?192.168.143.6?) (185.53.252.165)
  by 0 with SMTP; 29 Apr 2019 12:39:44 -0000
Subject: Re: GPIO Character device driver
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Linus Walleij <linus.walleij@linaro.org>
References: <0fb34aa5-60d8-cf6d-ffcf-237298977347@eurek.it>
 <CACRpkdaWGBoV_OFkjj6y0Rayz1hNziDCaA7VXh+1Uf5soh46Ww@mail.gmail.com>
 <7e0af1af-a565-a12e-8356-e9964d8174c4@eurek.it>
 <CACRpkdZs_E=6cjPa+vaNvqcXF1DmtMPujtPLS-nPQqysYhG2pQ@mail.gmail.com>
 <4a854870-d294-8a84-8d82-51a90e20b362@eurek.it>
 <b15d2ef7-c26d-0900-76e2-56c3c3756047@metux.net>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
From:   gianluca <gianlucarenzi@eurek.it>
Message-ID: <48047ffe-fac4-895b-b637-1c03fa8c800e@eurek.it>
Date:   Mon, 29 Apr 2019 14:39:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <b15d2ef7-c26d-0900-76e2-56c3c3756047@metux.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 04/29/2019 02:11 PM, Enrico Weigelt, metux IT consult wrote:
> On 29.04.19 11:49, gianluca wrote:
>
>> Well, in my systems I have systemd disable because we are heavly
>> customizing the boot sequence as we are using sysinit for booting...
>
> Me neither (I dont let such Lennartware anywhere near my machines :p).
>

Lennertware. Fun!

> But do you have udev running ? That's the one who usually does this.
>

yes I do


-- 
Eurek s.r.l.                          |
Electronic Engineering                | http://www.eurek.it
via Celletta 8/B, 40026 Imola, Italy  | Phone: +39-(0)542-609120
p.iva 00690621206 - c.f. 04020030377  | Fax:   +39-(0)542-609212
