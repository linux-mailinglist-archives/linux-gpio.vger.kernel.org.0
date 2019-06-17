Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F01D482A7
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 14:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfFQMjV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 08:39:21 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:54515 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbfFQMjV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 08:39:21 -0400
Received: from [192.168.1.110] ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MDhpf-1hjlaq0Pup-00AlOY; Mon, 17 Jun 2019 14:39:19 +0200
Subject: Re: [RFC] Addition of kernel
To:     Martyn Welch <martyn.welch@collabora.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, kernel@collabora.com
References: <dd30c34a83293926c072f6a3fe612dcf134b7620.camel@collabora.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <e6ca74e2-fc51-3f24-c5e9-18c22d6f87ef@metux.net>
Date:   Mon, 17 Jun 2019 14:39:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <dd30c34a83293926c072f6a3fe612dcf134b7620.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:JrqNXRo4+wsnS/6cfcspmC0MyKAv0lGN88wrOlO3ZdTiMBSzrvq
 0vdS5pqBSlZRXkVKfxiqpu9orkJh7e+MwEtV4smZe2l+nlMFUZr0qvFG5lOI8GxwU1x1tl/
 rPpx4WmLPucYy4wb1T+HmgNWJRLfEytCTMVlUWBfoeYUO5aYv/3WkUl26Cx21i7W5wKbktz
 5+BmdiSwtKFeGg7jQLVDQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:x6UjyeIbt8Y=:9ZBmmP3tWKr1ZD36Hj7XDb
 wgfn2g09fZ/1hOizyO4oaNwFQKqEbouTysRirOJIRPFctw2gT2B7xPjwrea2aQ9JVeVskE7lc
 Zh9k+nrrFkzilndYoQ5+568p4OoM4oRUsZhIOg+g6SmG3TOXVPXmNAinHju18Z5/T3g3WYaYh
 LU7gYwNb/9YGGW4BwFa+zSK0OCY1hijl706Le1Cloo5vdQeh0aAKt3owjlF+2LY3InDiBU9sZ
 Odb3oYaZLG7rcOOWWTmgQCIbzoPP+jkvnrhr/4E18kIkreDYxT6zgs3Z7VkVKla/2SrjRPP9c
 ogntrHIbFpAvzK0IMop4mQvq5gP6C4UAZ4ce+XHHs0qneVwcQffng4ICis6BtZ4Y+MMc7N5ZT
 0BQMqbpIADi66Fcte6NGnDTA0LKOcu+ZbRPdd7oSfA3qZk+MjGm1WjhncnBrjSCPblICZxfTf
 oeufuTptMzpUs8YnU6ZgXbZQF3PJkC/ajGf7LXgcnSyMggTZx9MEipJusf2sGoXCZc+W4gWiy
 l3hTAcnZUiTMohcL1HWS5Se/wttn1iUYTFILEDAL4NkGYJweUizKQHYiGok3R0XlB1WyW/38T
 QaIm+4b79RNOL7VRDpVMgCPZ38aiKpcWJN7f+Xa98YvBaf4w2cyEkhWXKZlzhGNOrQ3LLrlih
 QMdVYG5iy6DkaLtjJNYUWdPxaNSG4wFDpSilC0vLHlKoCmrK9G/+uQx+YFuYN6YxhczzfbN5X
 zrIyGev+Zl99KLHjyfnoYzuwA1zdcRY20q6v3XN9MUuufd1cGor9mb7/tcE=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17.06.19 10:29, Martyn Welch wrote:

Hi,

> We are currently in the position that we would like to pre-configure
> some GPIOs at boot time and be able to later affect the state of GPIOs
> configured as outputs or read the state of GPIOs previously configured
> as inputs.

what's the actual use case you've got in mind ?

I've got the feeling that these lines aren't really so "generic" in
your case, but attached to something that has a particular meaning.

So, maybe something that deserves it's own driver ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
