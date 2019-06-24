Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A335250101
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 07:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbfFXFdr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 01:33:47 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:38219 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbfFXFdr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 01:33:47 -0400
Received: from [192.168.1.110] ([77.4.138.202]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MvaO8-1iXnw932v8-00sfNC; Mon, 24 Jun 2019 07:33:43 +0200
Subject: Re: [PATCH v2 1/2] include: linux: siox: more for declaring siox
 drivers
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, kernel@pengutronix.de,
        linux-gpio@vger.kernel.org, t.scherer@eckelmann.de
References: <1560854427-27537-1-git-send-email-info@metux.net>
 <1560854427-27537-2-git-send-email-info@metux.net>
 <20190618161747.65y52fqr6toavdtb@pengutronix.de>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <33a51598-bf79-90a4-5cd8-906498d264e1@metux.net>
Date:   Mon, 24 Jun 2019 07:33:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190618161747.65y52fqr6toavdtb@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ttQ0DNsB4PXv7hh8eeoe97pj/lSopBnCBLsYfA74MXIW6ErCJyD
 be3WUs6JEULh4bu1BjiMcMCb1ZrOPqB5fxLcNBgWghYHoWMo2+XWf3WTTnPKHsbVxh4zF7n
 2SdzegIBGENUgh0T7d2BZqDGScPTQ+4h26W+MDzdKgOXEyhmrQvU83sOZ1RmqH9iJfnr7iQ
 2xvFcCcvFIcSBzkaqj1HA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:98874X0gkJ4=:U/fimL8PjsZ2FDYpggj2EJ
 4E2prPaYrvO92XhO1z0lqOgBnubhuv6qxyzuMsRFOTpAp5mjKD/JcnJey+L3VHGsZi/wl1mbg
 8cAQDBzKJwd7uv0RRx14o2greVqMiFtvPhrzjZuflb3qKxhJu579dMzwnr40/0ASIjVYlVQs7
 i5Q+jBiuGaI01qB82zL0gc5x/TZnB1t2yjAF2gRvSNcS1Y4R8nSw8WCVmJq+53TYqvSBuYQb4
 065K/Nj27gTcysX6ksK9HdMPpTFKqHCda1SACAxyxEs9LT0LF8bi+lhgalWOe8rVCpJZi2wpl
 KRRHnhRjTZubOjt+ELjA0D6ob2ZN1Id4TxrRpjULdnXrHjH7Ckph35SUr7wjZIlcF930fLB6m
 uN9UT3pCo7Qg+CzkPtUXxpKhFRnjXPGuGIYu2RwQZ/TtGr79SfNR7crpBYmeIoy+KgmAH41WM
 sVb47+aMKb9S75d8y/46ncdvlSpUfZW69RiYJ5x5QenBPm3KVVHCRtexVX3mgu7KfDDU1wbem
 Q3shF8G8rNn7EPrZ5qh90XTiZ4onsRYMQbX77xF9NbA0wfcKT+m8tK9YTbkoJJjTKPgTjRY1z
 nCFzNm9ZAdJxXSTTvKnfgkgr07WvJ4Ur6f/flbeEsQB8423h5dSefiKFWFDy/L5MrxPZfevdp
 v+mjiTnJr2UNgDlgMei4oyNSf1c4qdiLh/XyxxCMNrwd9vyOTfuIbsTv0J2PeCj8R4SkLamfm
 ZONhp1sDOnCJ4SYjyHww7PeEGhx+lnxuuV8aWWUhorCEoz5kPtBauBuVTc8=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 18.06.19 18:17, Uwe Kleine-König wrote:

Hi,

> I like the change. Just noticed that the Subject line is a bit strange> though. if "more for" is proper English then it's news to me. I'd
write:> > 	siox: add helper macro to simplify driver registration
Good point, seems I've must have been totally under-coffeined, and
some words on nasty phone interrupts :o

I'll fix that.

<snip>

>> diff --git a/include/linux/siox.h b/include/linux/siox.h>> index d79624e..d53b2b2 100644>> --- a/include/linux/siox.h>> +++
b/include/linux/siox.h>> @@ -75,3 +75,12 @@ static inline void
siox_driver_unregister(struct siox_driver *sdriver)>>  {>>  	return
driver_unregister(&sdriver->driver);>>  }>> +>> +/* module_siox_driver()
- Helper macro for drivers that don't do> > I'd prefer /* on a separate
line as documented in> Documentation/process/coding-style.rst (for
non-net code).
Done.

Do we have a tool to check for that ? checkpatch doesn't seem to care
about it.

>> + * anything special in module init/exit.  This eliminates a lot of>> + * boilerplate.  Each module may only use this macro once, and>> + *
calling it replaces module_init() and module_exit()>> + */>> +#define
module_siox_driver(__siox_driver) \>> +	module_driver(__siox_driver,
siox_driver_register, \>> +			siox_driver_unregister)>> -- > > Sorry I
didn't notice these two things in the first round already.
No problem, that's why we have multiple rounds :)


I'll send v3 in a few minutes ...


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
