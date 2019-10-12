Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A76FBD517A
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2019 20:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729413AbfJLSFF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Oct 2019 14:05:05 -0400
Received: from mout.web.de ([212.227.15.14]:52785 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729279AbfJLSFF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 12 Oct 2019 14:05:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1570903499;
        bh=rpcs5HwIhbgAv6DGviS0drKxzFwBHM9ergFz9bfzkyw=;
        h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
        b=Gn1iJ0AhCJtUpulGzJdFZ5afKcqB+qKjEGIVwGsN3Rz/OROjqGVWLDOGW3HsuVUsa
         Ezrwrdqvlk92/jp4xVrkm+NomFCU1HaRCS3SI6JAFXyZ/KtqhKSrM+vyFsxUuP0Zhb
         1eQShlxHlRsVcttK1jYsDCvbESljMtX3v8X3cbVY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.155.250]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M3PN2-1i1xMp113A-00r0Fp; Sat, 12
 Oct 2019 20:04:59 +0200
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: pinctrl: lantiq: Checking two kmemdup() calls in
 ltq_pinctrl_dt_subnode_to_map()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>,
        Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>,
        Stephen McCamant <smccaman@umn.edu>
Message-ID: <e0284a24-08f9-01da-98d9-366a45c3c8ff@web.de>
Date:   Sat, 12 Oct 2019 20:04:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8m+8BtPLLZbeutX2FU65cA2TVGfkthGExFTqiQj6C+7VG9noESx
 lYFsTDJpclc9oAl4vGky4L1dVgnLKWyG1gcnvElzjUan9UIpwqZm6Z6x48mecc6fTN429vD
 xIcqIlF6MBbrh4RK6DT2r9l2jBLt1sKa582DlolEd8Io9KUukcQLlBflNd+crzgekvsnS/w
 noHuF9HQXdESb84QDcsgw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BL7ykJp7yvE=:fI114RCF5aIx0CaIGeNU08
 AdWDmTjRCdkCStNY3dmc5UjOmyv4fyQGxKHx3Nx/6diOz7NkKqF6vH7MJg/Hfik4UVPzgUhOk
 HUuFu2m0akHiDzJZk83IngpRQL/Jv4y07nfQ14MHMKqoMa672ElPLRjT8wJkydoBXKSscW78g
 eV/RFx4BbKC2N2bJCXI6guMLYlIQ2G5E9dU2LY/AJkLTeO2/q1ZNIO+K5nssBJsbUsGrnUeiw
 VBTqy7l8udQs8W2eT+0XwBEjjGCEa44ZCJMPMOhWx+ObT+Sm0Rz6hHZDWxnI1y6HG8ACPzWjA
 bG7pX85W9qR9BxHXkIN+WaAUsKJ04RBBeqcKOMb7uX7feKUTOCN0QXveCGIt8ww3ROu+aDc3W
 02JlWgMptj9T6i6+G1ed2raQwwdEI2hHpwLQ9od27m7FTh9JWbWT21OEiVO6jn6rvnRYsc5NB
 oXwrX/0jvDp2xyG+bDKAYaBCnmg+bsRETleC1b65+yyHDbObYAj88jI+xdFg/OsTJhIe3piTn
 9uim6QYOr/fb0WQ2sgvGPyoxVyS2v5xCA5o2wsawU3IlKOoH2Bm0UckRzGOVTkLC3OZYtC6zB
 NsZhwZzoRjdrtlfR69+qqG/4m/+QVB5iFP003zXzghYmFJvTCqclx4VLrvPMJn3KaKuiGAyam
 koGAEJe7oHhT/9S5i5lg8EX9HQSwAG3DnXx4eofoYT3tuaBh11Ray8am+UcC8phocTke9rIMd
 La9KmTZk0xYoZq5XePGHcMzBDjhH1iG+kDjxJM41+bFUB5KBgIewrE+tcz4AiqI2CzvNvbz4x
 OdsYZpqkjPcEVmTLAt3/mWNy2JA06wZ0y2JgjNYmf6MyUUku5hMPNBQqAFymWQTgW9GDASNUg
 TpNysU42XlPFe98mlBrEKLQlFHfIqzUvq+MW2yrY7TT0TeAi5ZjXrFDMWfi7UM+4p5MQnmQgy
 U5YhT3z15SOQ9JNdGlg20zcsbzan6Opprm4zkMVAJ937GOpVWGwi9KWV9nnp4gDvLvlBMoAFD
 HwcQtEOoyVewyLzZhkXZUqG1g5bWKhWkgiYhnrLuZPa+toZrLQnvHGIi5NJCxwHDbHMicQ1h3
 R2RsOSqE3+7MIb+Zz5/VslpDSFKhPYhyr2cgvAYWuDlB+y+2lHD4OOieahMwozD9X+ZH5gasS
 y65YKrtF2yzvlECusy/fZ+EZ2DgwJoPK/PwhqGLGpFoj3rS1zaadMMHPIOiv/vjgkZfZ9jCca
 o/1lQYUb7b4YhFshKWj3xEZD/UFxfTQNnTXrV8ovyecbMX8pdStYoS2jQ8qM=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

I tried another script for the semantic patch language out.
This source code analysis approach points out that the implementation
of the function =E2=80=9Cltq_pinctrl_dt_subnode_to_map=E2=80=9D contains s=
till
two unchecked calls of the function =E2=80=9Ckmemdup=E2=80=9D.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/pinctrl/pinctrl-lantiq.c?id=3D1c0cc5f1ae5ee5a6913704c0d75a6e99604ee3=
0a#n116
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/gpu/drm/nouveau/n=
ouveau_connector.c#L476

How do you think about to improve it?

Regards,
Markus
