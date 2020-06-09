Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80CFF1F3DD9
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 16:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728472AbgFIOUb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 10:20:31 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:50607 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbgFIOU2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jun 2020 10:20:28 -0400
Received: from mail-qv1-f50.google.com ([209.85.219.50]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MQMmF-1jMRR53xQn-00MLCd; Tue, 09 Jun 2020 16:20:27 +0200
Received: by mail-qv1-f50.google.com with SMTP id fc4so10156583qvb.1;
        Tue, 09 Jun 2020 07:20:26 -0700 (PDT)
X-Gm-Message-State: AOAM533QwtnNPkXPNWdTYqLAM44N+BL7lkWIj+I4tWZY/pv9hwkPNd7f
        AdFQUH/XJPFXnU6bvg+licBhwO04hLAbWO6oMfM=
X-Google-Smtp-Source: ABdhPJyWzFtHnwzSbAkz4GLh128cvHYFtPFkfQHnN7U7/MQRzq8WnypIUxaJviPlXrxIobRz1sKlTQMOyvY2voqN0S4=
X-Received: by 2002:a05:6214:846:: with SMTP id dg6mr3927330qvb.210.1591712425576;
 Tue, 09 Jun 2020 07:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR04MB496691DDA4447CD5624EE6E680850@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <20200609104642.GA43074@mwanda>
In-Reply-To: <20200609104642.GA43074@mwanda>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 9 Jun 2020 16:20:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0TivBERWMZcs8Kndb4=Fc41JH6vkxJzMp1FHsazvLfdQ@mail.gmail.com>
Message-ID: <CAK8P3a0TivBERWMZcs8Kndb4=Fc41JH6vkxJzMp1FHsazvLfdQ@mail.gmail.com>
Subject: Re: [PATCH] lib: devres: add a comment about the devm_of_iomap() function
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Aisheng Dong <aisheng.dong@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Tuowen Zhao <ztuowen@gmail.com>,
        Denis Efremov <efremov@linux.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        BOUGH CHEN <haibo.chen@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:CAWD5GLUF7L9M18Z7RQteb7Y4M+JH0zHIMqhfGakm/LaCmdP1IL
 b/w/8iQ7sOifOs17DaEz/3ArZd1TSNmoSa9m1p8XRPEGHunOYZbWwEGCcJ68NYVI6iAgnTu
 6IcRZfcXhvEeyBeujwYW03evGEqB6CA6s/uyuoTdxMxMyJbHtwNtm1Roj3qip0GK07DvTOR
 nBGYvJThXdcZ5mpXZhhiw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QD82GElkA6U=:FHxeeqIehjZLyzBNNZzXi+
 OaHh5Zgpu4fcSnq76Vf1PKZcmdfmH15OI71eZ/Eq3RKA1M8yViF0L/WrmB6fLRLp4H4MYZrCZ
 /BT0H4TilXPMC76EzPnZjG/zEV5GYWKgjlUcxnvNi+N+nuan7GtLifwq/FWPDznW0LqU7Ml68
 4ByYIQGrBgfWT0P2Zvo23FJhBlsVFc1jlDcgxeJJ4FGOQfrtQaRRL/+81v/8jWz3hEf/0ASai
 bcHc77PFvzqurGwoRuK09N2ZSyv9SaGBXJpfoP1+QXxf6ZBa+/An9bxCQs4LdGlEP2rwB7tat
 tRLjCCHXX+1hqwwCTXg7IOxk4Ex09EjMiKAvMi5uKnWpfvgd4qvWYkTccbb9VT5Ify7ONRb29
 RwPp1nTpz/yeSqpMLxpuZapWwhS68Oiipdb0CK7eEq+kO1BP9KuuojS5MyA2wY+9gTvl9MCRx
 hlew5iusOaePR8EQRPcLhtPpf/izzX5GZpbqMzEsQc+woUQDpPc/ynp1dGeEBHO313cObUdhm
 AjjuJyOQGw6LHHi6RDnXmIyaqzoL0sGsCVm+8EKhrGHE2G3xvLS2cCJoO/GKTPqEiHEEjpbNe
 B/v+/jGzPSjQO11nlnBjBoYju9TTdNMelj0hrhddWQ1q/xYrn9Dys8ApnLNTLcWbknEU8mveR
 hfd6MxGOXxhoSvO8IEcCCiSdowZ1mHWBDps2dqsuoOxr6JH39GPnCKfsSgXE0p4apf9F4RaCz
 h5hrs7bZfvHgZkasHrCkNMbXQcYSczzVoYI3g6m2z7rixYBC/0WuxXGjUkFUeI+zl0Rrl4Lne
 gBUxuN+FHM4E5O5PEruddxo6ZOsDznSaQA7W7z7g/jOB2d5ySw=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 9, 2020 at 12:47 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> We recently introduced a bug when we tried to convert of_iomap() to
> devm_of_iomap().  The problem was that there were two drivers mapping
> the same io region.  The first driver was using of_iomap() and the
> second driver was using devm_of_iomap() and the kernel booted fine.
> When we converted the first drive to use devm_of_iomap() then the second
> driver failed with -EBUSY and the kernel couldn't boot.
>
> Let's add a comment to prevent this sort of mistake in the future.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good idea,

Acked-by: Arnd Bergmann <arnd@arndb.de>
