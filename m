Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDF631EC239
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2020 20:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbgFBS5D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jun 2020 14:57:03 -0400
Received: from mout.web.de ([212.227.15.3]:33815 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726223AbgFBS5C (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 Jun 2020 14:57:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1591124203;
        bh=OX2/GaYOPz/8P3VUiSxzclj1qVBij8MKYoq+xqGybqw=;
        h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
        b=Bt1qxCsd5EnPqyQlHKt5WhaOa5DFo39sYJatlLMQslcGK2dGIs86TeYtFgXlHh5iS
         9NGN8YXbr7ncKDnmrpEcc+DhxOfgudkMTbZy01nG+YyyRtuu4jbhDJmr+VJxQbxv2+
         h47nUCT9MB3xY3C/swQJF6neunkMPywO3SQyzc2w=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.186.246]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LwqHA-1ivv1P01ay-016OsA; Tue, 02
 Jun 2020 20:56:43 +0200
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yi Zhang <yi.zhang@huawei.com>, Barry Song <baohua@kernel.org>
Subject: Re: [PATCH] pinctrl: sirf: Add missing put_device() call in
 sirfsoc_gpio_probe()
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To:     Yu Kuai <yukuai3@huawei.com>, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Message-ID: <01abac73-2107-daf2-d7bd-bef9d73d554a@web.de>
Date:   Tue, 2 Jun 2020 20:56:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6Eu4eLUr1jktilm0raggdU4v3HrpPYd7LlTluLiUmfElcWCsQ5h
 8niBfRXVuO83KzmT3OKsDpMI/QXRyVK3DfcHKVmWwR50qsfgP13YPrT49MGtjonhJfGa2Hv
 PF6qR5BPFr3jSFDWeUcHc/0gB0/WJlgEvZ3wjPvMXzXM2TwqcR/cbXA4UwvcvBJH+i5sMFt
 GQWlkc58y35OcC3qSTyGQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OfqK+27LJaY=:3omZ1TtJeW2oKaDaT2Qn5u
 VRH9s9KVNImChawhUDXTkJ/u6G0h9hpYV0qgZdk1AtNiFEoVC8LFjdhShHShrdLnLxxHOrG+X
 6hAd3OfvqttPZvfp24+TeyKPg+784FnSVhoGnmMFPwucBQ92jtfeVQcgGu7uZ3JRF6PTboBMK
 iuSz2dfbVLuNiIjtu03K+oLP8zHDYFTVdB0P9ilOsH32SDcKSs8sQMlAG8m1qHfcq0RC+A4Ce
 D7KgykrMbtlL5+F+9D6meJp/Ttxl8p7xVY1GVbGxwv4cLCzT9n0dX4AZc4iG8e8XhiVjCWo/V
 SXeNN9M1OMAmbqr/vn25U9QzTTO6HZrXifjb3ADppSKb0rTXMl4Ff1oavJimBoH3jtw9nczV8
 ONaFith+wrIvBvZm8O1PTVywduRzcVmrvdySz9toLIyvU5MEZJC7X2cerQZHtSuQVX7bjJDm0
 PMY7Z16usffQD+pFP6ok5QypcnfKzZFqoCHOkmlLuJgj2FPXzbqQ/dMF8gg1KepDaWkoSlxIj
 PLMF538ZS5nIT3Jd65eEyG24+p1m5TMWB7vRccRdcuhV9jFQHXVRC0XGXqDSXpX2bXzTo/P8a
 R5c7h07TwFZBjTuXwWc4ml1qjq6anR136fsq9+bCguvIqpfanhx5ZovhsS843A7ikPuEYBUE/
 Fa98Tf2Dn2cM9hf1YyumwY4480oIVOcB6d0DYtaOLeTI3C9Ie2GGS9cWJWtE5J/UzrXCy/N3X
 jOEBwWQqzjRqMJqNZGg85hJRndomdKKlVUkdB7Fic1mlICZhYq0NGyetfvKBKNCJKT91aKuAv
 IUv1su7mqhcYIyk3aW71jISXsFro0HnBInWZhN3hB43XH02E4G/OzSmI+ZL/RX0xo4TQKmoNc
 sOQvwS17Z7kcdq6WiOa6NXlmIGudl6hbZaUuq/BEnvbEBU2WkYbW8B6c0slF09d6r/lfkhG3v
 sjNZ8Mo1p5hNE64Y/Q/KeOtsvToGJGpGZ+wQlALBv9bx/uJgLQwzPSdOujy4FsK7pLGuqvt4y
 dzYGI+6SrXSNNrWKX//Adihfa69JGWOhcEFhBSnLDRsV0J4yeQRZT25/DPeYxqNwHpvAuW8X2
 KqKH90IayW5zXLKYj56JhBWoZCgDmxNFfX+A9Vhlrlw2mSS0Ac3GIG7kUJDq9WXU1saM0aH7d
 J3Luo7OvZBOnRnJN4OVRcESQjsxw7nUSVUIcBTlhI/EPV+hlkGtWTQvr1BuwJvcuIUtRLZaqS
 33j1Xgx9X6zxN/Gxy
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> in sirfsoc_gpio_probe(), if of_find_device_by_node() succeed,
> put_device() is missing in the error handling patch.

How do you think about another wording variant?

   A coccicheck run provided information like the following.

   drivers/pinctrl/sirf/pinctrl-sirf.c:798:2-8: ERROR: missing put_device;
   call of_find_device_by_node on line 792, but without a corresponding
   object release within this function.

   Generated by: scripts/coccinelle/free/put_device.cocci

   Thus add a jump target to fix the exception handling for this
   function implementation.


Would you like to add the tag =E2=80=9CFixes=E2=80=9D to the commit messag=
e?

Regards,
Markus
