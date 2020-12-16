Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3CF12DC561
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 18:31:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbgLPRb2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 12:31:28 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41228 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbgLPRb2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2020 12:31:28 -0500
Received: from [IPv6:2a00:5f00:102:0:b08e:75ff:fe3e:2a49] (unknown [IPv6:2a00:5f00:102:0:b08e:75ff:fe3e:2a49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: gtucker)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3C2DD1F41293;
        Wed, 16 Dec 2020 17:30:46 +0000 (GMT)
Subject: Re: linusw/devel bisection:
 baseline.bootrr.mediatek-mt8173-pinctrl-probed on mt8173-elm-hana
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "kernelci-results@groups.io" <kernelci-results@groups.io>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Johan Hovold <johan@kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        Sean Wang <sean.wang@kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
References: <5fd76cf2.1c69fb81.6f19b.b16a@mx.google.com>
 <483b08f2-09c3-e753-d2ce-4e34fee627f3@collabora.com>
 <CACRpkdbozXM3FHQB9+GcPJZdNT+Vi1223m2uEqqJ21ukY1A4Gw@mail.gmail.com>
 <8e5e0251-9450-5c93-cd2e-c44779a72b0c@collabora.com>
 <CACRpkdb8Bgie3dJME5qQwu_33b6zVYzAayJnHJUCzrkntpNNXw@mail.gmail.com>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <600ff528-71b0-ac02-0266-ddc5e3b6fcf4@collabora.com>
Date:   Wed, 16 Dec 2020 17:30:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdb8Bgie3dJME5qQwu_33b6zVYzAayJnHJUCzrkntpNNXw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16/12/2020 12:41, Linus Walleij wrote:
> On Wed, Dec 16, 2020 at 11:10 AM Guillaume Tucker
> <guillaume.tucker@collabora.com> wrote:
> 
>>> It seems we need to teach the core to ignore the name (empty string).
>>
>> OK great, I see you've sent a patch for that.  I'll check if we
>> can confirm it fixes the issue (something I'd like to also
>> automate...).
> 
> Yups would love to hear if this solves it, it should be in today's
> -next.

Yes in fact it appears to be all fixed on your for-next branch:

  https://kernelci.org/test/case/id/5fda32f92738afa48dc94ce1/

Today's linux-next was not tested in the Collabora lab because of
some infrastructure problem, but that's resolved now so it should
be in tomorrow's results.

Best wishes,
Guillaume
