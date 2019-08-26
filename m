Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9215F9D08E
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2019 15:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbfHZN3U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Aug 2019 09:29:20 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:43823 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727261AbfHZN3U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Aug 2019 09:29:20 -0400
Received: from [192.168.1.110] ([95.118.26.153]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MUXh8-1hboEp2oAy-00QVfP; Mon, 26 Aug 2019 15:29:11 +0200
Subject: Re: [PATCH v1 1/2] vsprintf: introduce %dE for error constants
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20190824233724.1775-1-uwe@kleine-koenig.org>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <a5f535af-09f7-e65b-1527-7d6dd8553c1d@metux.net>
Date:   Mon, 26 Aug 2019 15:29:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190824233724.1775-1-uwe@kleine-koenig.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:G5RzoUT+mkDb1PhnP98I+bnT7IxJGLBn4rohV3XwBzi53At0zak
 XcOTukvSzyaBBwsZ1w2ZujXAufGApITFPz0S4cWo7R3lqmCNqIFDeGRZD9DmC6cGsCR2tPt
 d+nI6a8iLItPYFPvYiZV+K8AfGjXbPSof67D3AC5yr97eGz2Bph6IsZepjClB8ur4BEGWv7
 xFIVgT5A686Qcno5zVZDw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8GFIGhsgunc=:7a0+kvbhjTR0SzPdhb2FBq
 0aZGTQ/xMkx/2CVPktdHSCy/5yrVc3+CxhPal/o5HYKD1TV7a+E0ySQCVpJxQ2VBCJ0LoKc2h
 3u5nnRRVkx1xGrBPj9bmLuqTXS/V59vCh/Q8vnZlb0wqnsb/bgssMUt9SPWkqGxf4BIN/s6+p
 x5nvkg4Ko7aTLhKxglGWh/3oIMXrwHFaRoI4K8LF3B8R51G8y+q22S+qIJslbPXyu18RbtUB7
 dT8JEMx9zAr+BbtQgQz2/I6TakCS5Ew+hUxMEuWFIrGFTI+BaBW8xmI2GOMrjBZMY5WceIgYW
 Gr62SvMxSpIlyc6WA7hmCFg1lO9HzTGtjs/QpNwpVyR3iUYiFkpYhs7/ezUKDSydWL6lLqMSw
 JWe38ZzeDEbUQsW2gnyhuhx4bfgBP3+X3HoBNMQOBMupTRCxLxhOzc+CmiqTbQzr3ajoRcvsG
 aXRl51ojDQxFeZFl/zWTgNK0odlc1MgUqt+CytK/Qh04DZ5g4Fm4cXFzx5/Oatpbseb1qET1l
 +fNL8dvP7xaoh0OkueaEtIQy80/eYhLiC076SQgUr6UgBUb6UkEdFDoyjy2MOlP62hc4wvSb9
 GDMb4At24eLTqYwu5FVHwuJY+wiVyAvcxlHJkAGI5MAxHKWzG0Pg2y0T4ytrf/ddn53b5t5Ad
 p0ciMlEiNq0icMcWHhUkwO7RZtKFLo3hEM/BALrY1yyo/6SeRJ6lvQAj3h/dnT4aUvMChX9/D
 jknX7Or4qQsP4N6b9amBPa8UhHLjDjic5HR20K6wrG4lJnSUmWVAgCdD+y4=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 25.08.19 01:37, Uwe Kleine-König wrote:

Hi,

> +static noinline_for_stack > +char *errstr(char *buf, char *end, unsigned long long num,> +	 
struct printf_spec spec)> +{
#1: why not putting that into some separate strerror() lib function ?
     This is something I've been looking for quite some time (actually
     already hacked it up somewhere, sometime, but forgotten ...)

#2: why not just having a big case statement and leave the actual lookup
     logic to the compiler ? IMHO, could be written in a very compact way
     by some macro magic

> +	for (i = 0; i < ARRAY_SIZE(errorcodes); ++i) { > +		if (num == errorcodes[i].err || num == -errorcodes[i].err) {

why not taking the abs value only once, instead of duplicate comp on
each iteration ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
