Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52626340451
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Mar 2021 12:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbhCRLMU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Mar 2021 07:12:20 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:34993 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbhCRLMB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Mar 2021 07:12:01 -0400
Received: from [192.168.1.155] ([77.4.36.33]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MZCvh-1l9O8s3yIz-00V96z; Thu, 18 Mar 2021 12:12:00 +0100
Subject: Re: replacement for persistence of values written to sysfs files
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-gpio@vger.kernel.org
References: <af518806-f473-8979-6d32-38c94a29b762@rasmusvillemoes.dk>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <0d35c328-600e-60ed-1bc2-a65ba4530509@metux.net>
Date:   Thu, 18 Mar 2021 12:11:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <af518806-f473-8979-6d32-38c94a29b762@rasmusvillemoes.dk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uDCg/8NdDMoanGecnZkL5eUPdYREjascbO4kQdzPih27yBAhUII
 W1QnVqQmq+bvqnqVHcu94ZxztbR7/i4UyHUqbocZ9eQTwlHuuJ6dGht1oiNqiMCtSVxgOlR
 iZchdpQ5bPIWe8AClAdEYpzGziO/LsLYq2j0HuaPmby4UnfJFeSGK0UL4XtdgVAVJ11NmFA
 VI9QXYNHEClWe4u04sQuw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dfOXJPGbA+U=:pgHrFm6Dvx53sWUxE9eA/S
 3f4eBJzggRkmMfCFZOZWYh1V4sp8iTnOSDYDZHwNmSwu3hthDBnGjarqCiz+ZQ4eNE532YbhZ
 e1UrqD8LftBy9qEiRmwD+NgKgqyI8L8jfB4kCHI03wMfdInun57A7274R1NvIBy02RegAnM96
 IM+cQgi5XyceQsuHssfySIX+I+9flEFk2KlqHbcfYM/pHbOC443NKknpgNvwNI3Z8FsoNP5ej
 PbSYsp5Vp/N+nuw65oDrHeo2lPPncBz2vD9Gn6tOrY4P0X6qvly6SirZCnhomNBmoaEBgbDsA
 AJwT4j1fGbcxpdwLGIbvtA7EsG0b6s9yT3RjI+t7I6aWjqcCopr6ScxRzocs3fuj2NG2lUqaj
 R0/oRwItZSG1q5tCIae4JvirTAORq14I/K4v0lNpkjaI6TVTUiuwCdxzCeBK5
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 15.03.21 12:46, Rasmus Villemoes wrote:

Hi,

> So how is one supposed to get the kernel to set and maintain a value for
> a gpio, without having to keep a dummy process around? Also, with the
> sysfs interface, another process can later change the gpio value; I
> don't think that's possible with a dummy process hanging onto it.

I've got a few remaining legacy systems in the field, where I still use
the classic sysfs interface for exactly that reason: separate 
short-running programs (shell scripts) do certain things on the gpio and 
then
exit.

For newer applications, I don't use raw gpios anymore (except for rare
things like generic PLCs, where I have no influence on the actual
workloads)

> So, for example, one init script we have first configures a temperature
> sensor with a high-temp alert threshold, and after that value has been
> written, sets a gpio that will make such an alert trigger a reset of the
> board.

Bind a proper driver to it. Either IIO or hwmon (depending on what that
sensor is actually for).


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
