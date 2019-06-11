Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3942D3CEB1
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 16:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388728AbfFKO24 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 10:28:56 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:59719 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388676AbfFKO24 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jun 2019 10:28:56 -0400
Received: from [192.168.1.110] ([95.118.191.213]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MKszj-1hFb59040z-00LCMh; Tue, 11 Jun 2019 16:28:54 +0200
Subject: Re: [PATCH] pinctrl: lantiq: Switch to SPDX header
To:     Lubomir Rintel <lkundrak@v3.sk>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     John Crispin <john@phrozen.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190611072004.2978373-1-lkundrak@v3.sk>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <c1620a51-549c-ad29-ed66-6aecff4f3ad5@metux.net>
Date:   Tue, 11 Jun 2019 16:28:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190611072004.2978373-1-lkundrak@v3.sk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:U+Gm09TsDgBErJu4/IWF2joNL5zsEeJWRUlEUFjwVfBc1MDC4bY
 2tpcRVjGGNBALuQS/X+rRdruvZ7ffWg0XQSQRRHrYt8ThQQQIBjWT06yRW4cyCi6ZaOPa6T
 zgtxgAmpvNeuelc0sA4SjEA+lMi8HK8ACdfPemhNAbSD4ExMkFjR76G4SsP64jfYON0g7gl
 WeRdcDM3kRWsaar9ymZMg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NXuTH7p2CA0=:IoB/tStIYxrD40hzY2OuZY
 TX/Z9AXlG/9YhzcBg8D7vN1/83j0sdsGfY/TR3QrEzoMYjozN7BolHvki4PT0noduNORE0AHw
 2nKQgvDzNyqAnLzyVqeUy1XwuDZFEVoGcvZS4Hi7Qprv+azRJJ8ATikVRxi7QfzWBAsiKqiA0
 4emn0fuTv1QWfnQsE3++0ItSo7ifpQ8JPY9n9ju+18B7VF8gi1Ga7Max26lGgYwITPM1lunAI
 DkAMnGusCYC5kxe0z8cnJD971pOIH1b5XASklBXII7VDMBP3mely/bNEr5NariZ19ZxwQ2MWf
 d4rLCVJ6MB2HQzbQUqW0mpZYkBNw3Hmpq8a5H+hvRdGfKhAGi0giF+fiZFkVQaJNKAPaCyqye
 A1yztiS5T3Df++Keilav402kKYI2a70WVFUfeq4khYqD4+bR+vE4oo8dUImxDbAjz+pSAsSJe
 +nPpZ7Fxa2CcAEGiFO+cGtP4efQkBA+8O6dKJAm5PevgJCBAAnh1H5IwljUpj48ZnsY5E3WPG
 8X6sztXxQ2YXF3HN1IymuTdZZG+tftknNHP10ZW+QduXqTvTWiqiY+/m4+kKrQ+b6VBFRR5TQ
 B0zbyt/giBozSCWML4Zgrq1gewAfHyeZrsogFUiDdYHL8NUYM1c+x1G6VJQ52BJYX3/gfAH2e
 4FMCPdeytE3CnMq+pZ7SBex0sg7Nn05CtbL0rQUKONHu4JpLQUi5M06VR610rM3Msb7s65Tec
 iR/GBMFoxOmnpVdWH8iwKdFLhRUY5GEzRrVM8U9ErWEtjAy0natoBtZ408E=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11.06.19 09:20, Lubomir Rintel wrote:
> The original license text had a typo ("publishhed") which would be
> likely to confuse automated licensing auditing tools. Let's just switch
> to SPDX instead of fixing the wording.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Reviewed-By: Enrico Weigelt <info@metux.net>

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
