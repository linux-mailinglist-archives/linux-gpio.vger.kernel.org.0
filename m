Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8B0D3CF57
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 16:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389733AbfFKOni (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 10:43:38 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:37555 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389454AbfFKOni (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jun 2019 10:43:38 -0400
Received: from [192.168.1.110] ([95.118.191.213]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N7yuz-1gVleB46rb-014zyL; Tue, 11 Jun 2019 16:43:25 +0200
Subject: Re: [PATCH] RFC: fmc: Try to convert to GPIO descriptors
To:     Alessandro Rubini <rubini@gnudd.com>, linus.walleij@linaro.org
Cc:     federico.vaga@cern.ch, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, riehecky@fnal.gov
References: <CACRpkdaCFZcQ8VMjKJkXAm+TRH+=DY3j5Udh0mcYR7YcDr8VtA@mail.gmail.com>
 <20190603230604.30938-1-linus.walleij@linaro.org>
 <22282873.PltXLBtAh5@pcbe13614> <20190610061325.GA9668@mail.gnudd.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <fd1ad233-62aa-8545-a01e-511ea3db9f83@metux.net>
Date:   Tue, 11 Jun 2019 16:43:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190610061325.GA9668@mail.gnudd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Ao/0KqjiO8yj3H9pHSlG+mVMR5ElzppjMN+dIMSnwVAHoIarEaH
 06PTeSQOlcDTqDA33YJXPrAJgieuqHHgK2qK2uLrAOs/+zda2SGTJXqH2fodK8H+0d8YNtV
 jpMDuLRqyl6dWthjQxrlLvxoZrybi/8o0woop90bR9CLnMZZb5YMAUEdt71nN6M5n84Yo1t
 AOEv8TjRmzIbJPmx03Btg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K8lQ5FDcxck=:AjJqo/QDoVwxdnbsJw7vok
 B3BG1y01lwycQDpYVKNDi9rJTxDAmPHvPI1hxQlCdqq9kts+NdLKzVvEBlbox1ZUiYLKRlI+E
 BKZNfCLReS5vNR+67NrgQVNy8kdZelxCeGyocV5qSioPe6B/q3sYrS3wM9T8DsNrIP+2G9koS
 aaV42ap9l72+MpxY4AQ7Jaa5rLSMJCtCmjal4RbGhbCm5L09DMXaQbMLW09iGALfQ+Y8iTt88
 8VGbmtGTz+i3APSOt1C1Aala5GQSBCjb2E91meoYU6xxiIB9wyS+ELDQZ5hGFQSb6B6zrfro+
 QEH5632qFcTBmyY3Ggrx58E6jhq1QrdTo01e2L7yr32d1cQl3c/WsumUI6YrIVDOYKuxCEF2s
 Yd/uuqRa+8BxjWKNraW+fxFrjxGmDkHZ0+DttcJKFQYQajTLSuiqWqtVZdUD2BGufW2gfCErv
 rRwpwA5CAOoMbleEkic3csWff4Q+wq+q44klHxA70O1XIy01Id6NNtCA+sr082VZmUh3jaGfR
 hvX00FpCS08nLN5xavyhNujMmolf0eaQYFVqHC4Er86GIRNbgyq00QUG9e3I0Ki1L0aKRZvi9
 g2GK16kM070lBR7EDK0v1Daf6d9N0h06n+ehRmOS9g655aSc7kMPy1mnMoL2ev+FlM7bEERuh
 K2Ixa2c7G6wq7Ck8ThC6bf9t5wWKgrPHkUzxF5ZLpzUkPfNGqgcx0fd8fSgA/YwVLW6EnfpGK
 IBRQo8ppsP9yQ1SG76mTmao2qaqq4JnWXTDfRC1MFs+Q4QOVw7uCJMpet70=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10.06.19 08:13, Alessandro Rubini wrote:

Hi,

> I found the fmc-bus a good idea at the time, and we also talked with> Lars-Peter Clausen of Analog Devices, who was using fmc hardware and>
told he would use our framework. We pushed it shortly later, but I>
Never heard back.
Do you (or @Federico) recall the original design goals ?

Leaving aside the purely electrical / mechanical aspects, why not
just using either pcix or vme directly ?

> I don't know if there are other users, besides the various projects> that split off cern open-hardware efforts (e.g., the Zen board by
Seven> Solutions). Maybe they could just maintain the thing off-tree.
hmm, OOT drivers are usually ugly to maintain - I'd rather prefer
maintaining downstream branches (which are rebased to mainline releases
from time to time).


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
