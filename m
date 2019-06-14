Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A13E45DFE
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2019 15:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727696AbfFNNVd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Jun 2019 09:21:33 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:58123 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727686AbfFNNVd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Jun 2019 09:21:33 -0400
Received: from [192.168.1.110] ([77.4.92.40]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mr8O8-1iOb1z0gXG-00oGea; Fri, 14 Jun 2019 15:21:29 +0200
Subject: Re: [PATCH 1/2] pinctrl: remove unneeded #ifdef around declarations
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-kernel@vger.kernel.org
References: <20190613015532.19685-1-yamada.masahiro@socionext.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <cc68b375-6011-6bbf-8f0b-c2963237a743@metux.net>
Date:   Fri, 14 Jun 2019 15:21:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190613015532.19685-1-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:168YjOKWpt67/p7AHoIIjNzDbPrZ7/yHr+w4DvyJOMOslvJZ2H3
 rGRIkE+3BWsG/5/48NVxYVofD6evB7tAxsHqPha/tpo5pCkWHhD2uPeMHXuDQJlGln0BeTW
 0lVmjr6Hn75z4Nc7cUK/zLLWHOdoKmZxPkVLE25iKKj8w9R+yLhuz9YQ56Q+K/Txw6dO/OA
 reCUM6RRlcCiOpeIWCX2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iGUQU66y6io=:WLiyvShT7KDQuCnYlioR+/
 l5LUFmuxtWdQTrTOnmaq8Jmib65fXEFQj9K37JHxSo2OxhmOYY+hYNqZ/o62b/M+b8bwWLw1O
 sLCW46HC2T2JyP9xbYKjuFalX58k0oWQ28ydWTLN1z5DdfHo8zAC5duy2cTFpVPmwT72W349Z
 jbvZ8PZAfTKfnXE9avmQEqrtEBSZvV9S7mZjYITd2HXThidwGobnEvYVYAKkS0tqUBCUfsZu1
 xWvzZNYv4lnC0Ku/h0yRITVqLWQGolIheookTUXju+00yXt9W43alhCJoaF4hRjxPOvt+xU4X
 JE5KMZis0n5pEmQWSL9IXaFGAvY5uk12NDHYlBnVN3/nk76+piJHaY0KTTObzALuO/7x4HRGZ
 dnRqUU2tBTR9q2yN0AbKwDy/1cJaxm5e1PTCpN2I8EtrWgsMuVCiiWIFxGovNQQVeLI3BpeKp
 lchfUcbti3mxQo39x+iKtr/KLlIDWbQYKkDArc8fpmI9aiEMQYDXxYuxpp15Y9r6O6wzR/fox
 qZNmQ2joY2phJ6v9v5EnhXo6DIe9kZ3n/4hzn4GnFl6nkfRomDsiT8CMSAXFLQAoRQ7EuY9na
 voIquH2KjxOZUtMEUWvCmsldXxcIgeqAiMx9ReGejJd6RUlZu2jKdHslx2yLISr2QoLg7LLRF
 eh88g1SxoRVwqk5vzIA0o8rHvBdllJ6zNGUJ3poL7RasQnZw8e+vwFVesy8aJB4knLsElI6zo
 9H7bk5QSkCKzN4bVLkCjG21/CxsEgQ8SqV3rJU52YQW3bsKFIiFNTK7Wvk8=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 13.06.19 03:55, Masahiro Yamada wrote:
> What is the point in surrounding the whole of declarations with
> ifdef like this?
> 
>   #ifdef CONFIG_FOO
>   int foo(void);
>   #endif
> 
> If CONFIG_FOO is not defined, all callers of foo() will fail
> with implicit declaration errors since the top Makefile adds
> -Werror-implicit-function-declaration to KBUILD_CFLAGS.
> 
> This breaks the build earlier when you are doing something wrong.
> That's it.

hmm, in general I like the idea of breaking the build as early as
possible. depending on your available cpu power, a kernel build can
take a while, and it could be a huge waste of time when having to
wait for link stage, just to find out about missing functions.

@linus: what's your oppinion ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
