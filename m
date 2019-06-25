Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FFBC5250C
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 09:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbfFYHnV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 03:43:21 -0400
Received: from mout.web.de ([212.227.15.3]:49643 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726668AbfFYHnV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Jun 2019 03:43:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1561448570;
        bh=mxsK/Q3yh+HbCMrd3ZV9922DvmB/ieej60+vQvCk2pA=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=m5pTnCX2kKDQgD61VbOn6JTYlu1jg5L2Bm6FyY2UeF34UXc1Vn895TigwKqCgQjX/
         NiWEXF/GEzrdi2Xq0Of2XmNoLzXPfap6lWv2RO7v4FTv/QImG+hEbLF13JeK93QVve
         8j2mH5mG+Wo41/Pvap2VYmTMku7G1sdfMF8Nm3/g=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.103.88]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LaCWE-1iRRAq1m3y-00m1kz; Tue, 25
 Jun 2019 09:42:50 +0200
Subject: Re: drivers: Adjust scope for CONFIG_HAS_IOMEM before
 devm_platform_ioremap_resource()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Enrico Weigelt <lkml@metux.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Keerthy <j-keerthy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
References: <20190221162627.3476-1-brgl@bgdev.pl>
 <9efcbce2-4d49-7197-a3d8-0e83850892d5@web.de>
 <CAMpxmJX-wXQ-ff1RWkPmJBWSsP_v2MjZrA3fhj3HQX0_zM0eZA@mail.gmail.com>
 <39ae399a-c606-c6de-f84d-35e39d0410c0@metux.net>
 <CAMRc=McepqowJNi6ay6x9KKoHOC8aCxP_ob12SgbsnJU_sKQng@mail.gmail.com>
 <1dd52704-0e41-db31-33f4-c9f446a47344@metux.net>
 <CAMRc=Mfp85diy849r_8UHKS9eao26djrsMF0_iwE--d62mQ5jg@mail.gmail.com>
 <20190625073016.GA18381@kroah.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <cc61e17a-1a0f-1839-8200-a36ddfdc2a39@web.de>
Date:   Tue, 25 Jun 2019 09:42:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190625073016.GA18381@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dG5GkGxuHYc1stMrypODNoVmKP2MVXxv6zhB6w/1HhsrSWJ/Mul
 3IZ+xFVkwLhkMjmqYheLq7nm/1esQIsHzDCBjtxSXZysQiqE7Cc566I0tptbYRT65+1F8Ub
 vvx5jECK5o72g+EPDESPZlyh2BHdS+Bhg+kENG6Y5annfONNIvCZ2NfQNr0NmYtGkgUSUls
 hL/rhyZlZuSECk+43fmBA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cmx+J05A6xg=:b+8B/iTzAfOPcuc+Nb+E1f
 z592W9Zidy5L2Lb93I/I85t7AC6P4sYgzAIAoAi6iWTaetiSX94apamh8v2kz6/jfsxDv8Sih
 XOCsHjTgjac+p6Qc1s8eQL7m6qVtYVXTjGq/2Yhkv6DrOLhM5OIERNBw2ZbYtxl7jsu2ATFgZ
 VZ1mRTUUkctTf1iw9ai8NDVOFQpS6p71QdWWQcObJpn2Sqc/0LPSceuHIW9fP3Ha75WGiLOeM
 qI8xUAv+dyFrkYj6vnl92iIqqPfX5pl4UKl3zPTD3fcm6XQBCqF4JDfmlD/iGJZQpLvQfmWN3
 uCuvgnOuu0QdKkahogP6VzhpOe8e/TS/nryVcaqsaunrvd/Cl8Hs0cStyhq7lCQ1Vg6XKoCyf
 OTEBWAASX2fUkP3NdamgiE5GlSkqdf0taTed0AC8r+fo/Tmy32tCcuBAxujPkvtrJUr2eqiER
 JWf2jtcn6SvEWFnZHYURX0LjZh4HHbfT71LZwF9dWxif/GP/I4EhO2kQ+emq90Beh38gnU3cR
 pn1m8KI/14by0TFPGG1QMUIhsyIWTSq2lnzQ5ihgEai28+MQ9+39y1j/8w8DVoomUAh8wyRnW
 1Ox4V89GC8WZB4Kx55ANYLePvsxiEsdn1W/oQHnoYqqWy1UQqVMlOgW8mdf0m378J+pHjGXsO
 U5pwvS/WPFw4OjxW1CM2BFqYC7eEs7s2ClQKHI916klfRJAnN8knXHtCrKuZGQUnfZU/iEXhT
 vjlxepHdAfMjJMlbUrfFPuJhHT5pJO1y7EeJpr9WNwNaxwIVW5GMbybRxmM0wqMZ/8XmnPGHb
 gqWxqGwuSIBMQ07CrNXAkhOB/icKWBtwGhIIIh+5fu78h/XUhZOL6lx7jSial9ex8J6d8MKOV
 PLo1LTwx5dXInj+U5qE5yirr9j3dx/sD9iC2w+Rsdk2ZY1LIBLKoOHoa2l88V31N32To1oFZ/
 DlXcE+MleeJwUcg+0o2keVsIlUZbtb8IeylWy/FIDUFuzeduSooCcqYjBYQRcudHmGibpJz5Z
 YemwD7JEqHWYxIogo7N18UMCt9dbIwEtc4TmZm4R/1czSeALqxCBQnohX8aHUe5glgNBCgzui
 wMck6GaHXZXy7h013UUgxW41GwJqVaWf3Ah
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Why are you all arguing with a all-but-instinguishable-from-a-bot person=
a

I am curious if another meeting at a Linux conference
can adjust this view.


> about a patch that I will never apply?

I hope that you can get into a more constructive mood a bit later
for the reconsideration of the position for the preprocessor
statement =E2=80=9C#ifdef CONFIG_HAS_IOMEM=E2=80=9D before a function impl=
ementation.

Regards,
Markus
