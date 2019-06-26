Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF6356F8D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 19:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbfFZRdB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 13:33:01 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:41971 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbfFZRdB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 13:33:01 -0400
Received: from [192.168.1.110] ([77.4.50.183]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M6UVr-1hdirL1gd7-006uGv; Wed, 26 Jun 2019 19:27:06 +0200
Subject: Re: [PATCH 01/30] include: linux: platform_device: more helpers for
 declaring platform drivers
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, grygorii.strashko@ti.com,
        mcoquelin.stm32@gmail.com, thloh@altera.com, festevam@gmail.com,
        linus.walleij@linaro.org, khilman@kernel.org,
        patches@opensource.cirrus.com, bgolaszewski@baylibre.com,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, ssantosh@kernel.org,
        linux-tegra@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        alexandre.torgue@st.com
References: <1560796871-18560-1-git-send-email-info@metux.net>
 <20190626061405.qsqq5na4oactuo6f@pengutronix.de>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <30f541a7-ef9d-d687-ab76-22a4544258f8@metux.net>
Date:   Wed, 26 Jun 2019 19:27:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190626061405.qsqq5na4oactuo6f@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4cVH4PkCtQv/LUwiS6UCMsXOnJKPoFgtu8YIQh2qre1SlC0rID3
 iH0aKQ/MKkZJ2yEuVJpv7mEkC1UjMv1ovjIFymwEqaJMY5AQyXvkOzmTCMq13end5r0f9xS
 yMx11gxpvqiWbWj5JDclzAGEDJ/U+TuS0GJfpPcHqTpNdKo6+6kBrvObB6Qy47Oj5TZ6PPN
 S2g10gMfdY9wpMg6E4Uzg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:p7DzD82Py24=:LTBxbNA+enqTVtVo1asr5u
 fojJY6VPTEzYaSJmnoo2Q08KvoDIOijxX27ZhdAkutA8pG3r2+igrKbf0Fr1hVHFN+0+Zm563
 xU3yBgs2kIQumCzDZakchFcCbHnWcLq1dDjHduz9l5x8WbJ/QjWvztmVLtLec6s3T/7wn9f4b
 hB94PAd14mx2OzyVmlsrfgS6p7iw5JWUcjH465pyFgPXWaa9f8VjH6xW5ux2bE6+rIMbpk5Ty
 junIYo1id38mTc1V85zeagLxg1x2WbqCQ08z0saH2UrLQj0TODg2fH+jgg1nULwKYD1b7QksU
 5zYpMwlRIfQk33Hio6mvEahIFHMzJ4ehYRrJnkkp5az6d1WwBProOdeVWTK2qVW4zI/UFgwV6
 NAeOZfNFAsRJkPSNeywmV1Ms6jLg5J6SLBAW/b8VSQxanNDKjFtGLiUsQPGGrygYRASQ/lYRp
 +u8tbOCLBQKNl9ZVrApeSLLH0ksCfzNH+cZ8GNJCnSQitkHKMCw3t+mOxAGy0aif6rXMPdz9Q
 m6ftp/V4ktJEzSCtvq1zGgc6rxZALGDd1jSCx8umIEuSe4utCYnm2NJIpJ58Mh496OnAihtyD
 CHxFOC3zGdx+8PQVDH4pHkwEXG6nvHZfDaSNdRY6hV/UUbFvjekhcfWq+1Ms87SGmTwRNl2hy
 ec01eIhUZI7jd9eRtU9P3gL6qFG8ol+BFr7lrNRSyVSKVmlZmvsK8AlDOczVKKRXRAsYW9qoc
 AjvunGTjxWWoot/j7F503lFwZ0SKs+7YtXKRyB+QgYf4oTlYrIKhATZrRkE=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 26.06.19 08:14, Uwe Kleine-König wrote:
Hi,

> Would it make sense to do something like:
>
> 	#define __module_platform_driver(__platform_driver, __initlvl) \
> 	static int __init __platform_driver##_init(void) \
> 	{ \
> 		return platform_driver_register(&(__platform_driver)); \
> 	} \
> 	__initlvl ## _initcall(__platform_driver##_init); \
> 	static void __exit __platform_driver##_exit(void) \
> 	{ \
> 		platform_driver_unregister(&(__platform_driver)); \
> 	} \
> 	module_exit(__platform_driver##_exit);
>
> 	#define postcore_platform_driver(__platform_driver)
__module_platform_driver(__platform_driver, postcore)
> 	#define subsys_platform_driver(__platform_driver)
__module_platform_driver(__platform_driver, subsys)
> 	...
>
> Which would be more compact and makes the difference between these
> macros a bit more obvious.
yeah, could do that, but not sure whether it's really good for
readability when we have so many nested macros :p

OTOH, I didn't want to touch the existing macros for now, just trim down
the actual init boilerplate, postponing further compactions for later.

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
