Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4CDF893D5
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Aug 2019 23:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbfHKVBg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Aug 2019 17:01:36 -0400
Received: from mout.gmx.net ([212.227.17.21]:58041 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726566AbfHKVBf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 11 Aug 2019 17:01:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565557280;
        bh=87tUvpcWCQX+/G+ktrp3h7Sag+HQut9DBjGaGXfmipA=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=KF+qdZuDpR4jdp8zljq22F2xq1wbR6ECSnOsVzKWTLsA+HBmMNkVl1AzSAwGwIdyd
         GP1LP8ZjMLvxYS4WNIfvMvaJqF8FDvqL3R232uyyTbHmK34JZ/XeXzvq5mp6GD1yRR
         srjzxsfIs0hCoh3yXSNVFcEooLQW8FyRnnLZ6Ijk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.162] ([37.4.249.106]) by mail.gmx.com (mrgmx101
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MADqP-1i8Eh72FnV-00BM6v; Sun, 11
 Aug 2019 23:01:20 +0200
Subject: Re: [pinctrl:devel 16/46]
 drivers/pinctrl/bcm/pinctrl-bcm2835.c:995:10: error: incompatible types when
 assigning to type 'volatile struct SHIFTER' from type 'unsigned int'
To:     Michael Schmitz <schmitzmic@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     kbuild test robot <lkp@intel.com>, kbuild-all@01.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <201908061021.pQY2TnEK%lkp@intel.com>
 <CAMuHMdU1djc8-c1LvNLFyFa0eH9C3k8nxjN_6F40S43mYZH7Hw@mail.gmail.com>
 <848e57bf-41a6-3e3e-6e72-3c15acd76902@gmail.com>
From:   Stefan Wahren <wahrenst@gmx.net>
Message-ID: <0ef2d73b-c815-e3e7-a037-db7672bbb413@gmx.net>
Date:   Sun, 11 Aug 2019 23:01:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <848e57bf-41a6-3e3e-6e72-3c15acd76902@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:m2szew/42g8JCLKuWouvXxs5Y8qy5+DYG7VMJ9Kk925YhaNkj/p
 w0O5weO6WKII9NqIS5EPtWOZsN785NcOCplOGGROJnPLptQV/w0IBzO8kNoY/3TGg9Un9cT
 USCH7yuqHf7R39o2OTJKiOPZ5CIxVpxNy8LVU3YfhczmlwdTV7LDrwm+0hGnehEp5SBkwmy
 5YeqyOSdgXjh6/d/6Wzhw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HHwBHM09aIs=:fsh3NVqAFvjAJ6zUha1CSF
 o1TeErhmczkY7YSvZIL1Y3dqgg5fzszwfhRTx0ZDsgyOxwS+KPfWf7obOGItkj8rtyo2IJsgs
 2IitojsRe8Piu7ha3Gsylbyx9FQRAUEw7zAnrpO774Fttvrfk7STEagDhLRnxFmWe6ZbpisE1
 0FD9zaviO4MbHInSZWegin+qkAYYy9j+jwxa29co0LMZ74vvOPcI7ZR4bCian9m4tp0cfzbvX
 QLtfGltKlNg1Ou81IciH3F1yMYc0C7uqjwpZNqt4+dZXFoUm3z5Sa6MmYyeRI1/7PVsUaO2Un
 mAsOKnphQMLmyYGEoTJmzorE6mWwDyGe5nZR+a8HmlF9ZvRBCWpEGYz7R610dcb60osIXdQrU
 rRmKOi5gWVzSEajzcheXh5UlpAYnx+qd4Rsx58+1EHZ+rzsX5S8LxC4gR2of0AdF3lYNHpybQ
 +A2RXv84hlQUuqDbCbRtMyPaK7UaVmDOIm0KZm08Zox++leqt81P20HjuGHdL6TAjYQ3V4zrH
 bINLN+6vbe/XTnSqt9rnGVQaQOPZ2ZcZl0F0IiB2+fpOX1Nz/Ff8iZjoILbyV6zZ8ca42aNYF
 f4OFWUXTvgGEC3PlSH9aHnNSY1xOFFS/4DttyWBAUwN5mvVGEfJ1WdZFae844JdPjv8EyTjqk
 Hhnrv/FVYoXiGFpkEyLMpQuKmogP7iDBKUBFqpst0IGCdNd3qHoNB/+gFzXmzWY47gxwx7k+y
 jLhVYqnYtxE1Iknz9SWcS6QW8aaY7FbTfsSdJ9OjLP1aaohNBDXjlpYejpy7oEH1dk4UWi5PL
 V5Up1s/0fzuUpIO4HmB3J/RvF14aYJlcKnJ5LcynRXw/Wfm/cL/Gv/81V5XlTQhpiixFMeVhK
 t7Q8Q81MXzXH13TIbvd9OxYmuFKw/nH5CkRk1bvyh4cc9Js5Jc/mtiGgK4DFVz1gVrwW+p8qR
 NgbvmffcGuZhcJTnTio8F9Kqv3HzBGZhcGksBG5giINPGgAs1EMbgUE6WXfgxWQw3aZDF92pG
 hqra/OskOcN3FrLD7vOE2H+vBfJFiNOw4ht2fH/APmkGJt7XIOA+ko6m52euPdBozSoY/t3Jy
 A8eDLG+x7n0LSkfO5OlD+l2CatxZ5mnlgXbwMWtWgpqNQwc4JGtm3tHKqo91qiYM9sjHfyh0n
 EOFDU=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Am 07.08.19 um 00:41 schrieb Michael Schmitz:
> Hi Geert,
>
> could be renamed shifter_st, I suppose. Only used in
> arch/m68k/atari/config.c and drivers/video/fbdev/atafb.c.

looks like you've come to a solution. Is there any action required from
my side?

Regards
Stefan

>
> Cheers,
>
> =C2=A0=C2=A0=C2=A0 Michael
