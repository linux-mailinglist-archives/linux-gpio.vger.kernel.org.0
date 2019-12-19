Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEB7712663B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 16:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbfLSP5N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 10:57:13 -0500
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:54632 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726818AbfLSP5M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Dec 2019 10:57:12 -0500
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1ihyAn-0008Km-JD; Thu, 19 Dec 2019 15:57:09 +0000
Subject: Re: [PATCH v1 1/3] gpio: tegra: Use generic
 readl_relaxed/writel_relaxed accessors
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        LKML <linux-kernel@vger.kernel.org>
References: <20191215183047.9414-1-digetx@gmail.com>
 <20191215183047.9414-2-digetx@gmail.com>
 <CAMpxmJUmLOZoKeeo4XMVEOWKRgwfS4O2szVboY-qTTYXg_aTVg@mail.gmail.com>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <b38cd167-4a61-4903-cf44-910dcb66f751@codethink.co.uk>
Date:   Thu, 19 Dec 2019 15:57:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMpxmJUmLOZoKeeo4XMVEOWKRgwfS4O2szVboY-qTTYXg_aTVg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19/12/2019 11:01, Bartosz Golaszewski wrote:
> niedz., 15 gru 2019 o 19:31 Dmitry Osipenko <digetx@gmail.com> napisał(a):
>>
>> There is no point in using old-style raw accessors, the generic accessors
>> do the same thing and also take into account CPU endianness. Tegra SoCs do
>> not support big-endian mode in the upstream kernel, but let's switch away
>> from the outdated things anyway, just to keep code up-to-date.

Good idea, I think I got most of the way to booting a tegra jetson board
with a big endian image a few years ago, but never got time to finish
the work.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
