Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A580184479
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2020 11:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgCMKKB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Mar 2020 06:10:01 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:57185 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgCMKKB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Mar 2020 06:10:01 -0400
Received: from mail-qk1-f182.google.com ([209.85.222.182]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MA844-1j1AfV1Fve-00BdNc; Fri, 13 Mar 2020 11:09:59 +0100
Received: by mail-qk1-f182.google.com with SMTP id u25so11506661qkk.3;
        Fri, 13 Mar 2020 03:09:58 -0700 (PDT)
X-Gm-Message-State: ANhLgQ07kEwFBblu2+zNiJgTxSW+grLMAyQqIi7eNwdWV3prvK8/A19o
        LO1mXto2z40T35pyskb08/D3yBe7T+36gPQTJy0=
X-Google-Smtp-Source: ADFU+vvWYzbzswGUwj98LCXyumKjsg6WUR5/OVwtFB1yQQW0GRetsjSX3tCPfS8PNkhlu5bWjtf3hlPAc+3Hny+d/0E=
X-Received: by 2002:a37:b984:: with SMTP id j126mr11430329qkf.3.1584094198024;
 Fri, 13 Mar 2020 03:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <1584070036-26447-1-git-send-email-peng.fan@nxp.com> <1584070036-26447-3-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1584070036-26447-3-git-send-email-peng.fan@nxp.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 13 Mar 2020 11:09:42 +0100
X-Gmail-Original-Message-ID: <CAK8P3a05++P1_0HxTrQueUhjnj83F1QOXES8SnmKkSX0a8fryQ@mail.gmail.com>
Message-ID: <CAK8P3a05++P1_0HxTrQueUhjnj83F1QOXES8SnmKkSX0a8fryQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: imx: drop the dependency on ARM64 for i.MX8M
To:     Peng Fan <peng.fan@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Anson Huang <Anson.Huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:SF+vIPvSuPXQhPAy0GL3fd2jRL1nJGvKosuL+a70acjVAswKbny
 XIEGLIWc6bx6mSz4L3thVNj5gBwixafO0Lw7kWjjDoGD8O8MtAvhL4KGItG1sJdtDPM4PON
 EXWdgJN6bnOgMmiWfJfLQr8nAD2sU8uzagoybNLB7G4/WcqVJt1CsdzUfeWBk0OVtjcWU2F
 JSYXyEqm424a1btEm5h/Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Jj5+MnFUktg=:PKp2rEVklc7oLY9dWI8mJI
 UFYRgERUIP4cuQ34xNxldmbQvd52KwIANaURuNlPhzQFe7qFNkzD9G/TFtWq4tQHPGPqztMPx
 9TPc/b/NviL+syNA7xYlHOOteSw1MS5A+f6+QSaGz7UF0QqyKLQCZMz1esVXYTvmnypknizjM
 Nzi+Gm49dp2UVF/xHiNb0tDAxBYZnHg9FROMnuS4dU52jVlMuXaZ2hw5Oc4YhUK0bj6hYX+RZ
 xOlVg+EZ8D8EU22KNTZJn76Xt9KMimmlo/+8Jjc6SDxFOIBi9q7Lzkoue4mHdPlJG1V/MVqM2
 k1KxetSWVw39veQEJTFaDIYHmBkqGiY1hFF6OgnNLzN3Qq0BW4kp/r/OoyTtQzrik+YV8xiSg
 5dzsUI0jdN8m97rMrlLr+scj438zXbtof9m8oxhtEU5yRVQ/V1kf2Ko+l0MMTGc+vnoSd9tbA
 lxbY/o0f4hr8qWbNqfj7e6lJMXZahivMZ7j/BdryXpCXo/6LMWJaXTBxxGacF6Lr2Njyo0dOj
 j/yXr7uFHKrL829z9a4cQtVnrXn6vu/BZvVpp/ZfCO3IGupl2XqjFLvLdmNWjLxRZk8VllHtd
 EeIpdKbjOOAxt19sDsIwPDV7K3U4eaTZD7DZPesxljy3blmef956RjvBlzgpcIIsA5cI4tn3h
 2NtdB9OVZMkA8DVUF+OexUAg5de8+vHwWBn3tRetspTw7U3uvK/yG0Qvw0qi1F0+1gGo81E/S
 ofNZV9Mcpf9qE6jLhD4K5N0JGcp0Y1/wvJTfXvos4Gr928/OU4kvkvTBZy7XomVqhpIIf4Gbi
 v5F3/BM42guV6URGEAqRDSV/eC5XnsL1HxYDvQzEB9ylZyvAtk=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 13, 2020 at 4:34 AM <peng.fan@nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Moving to support aarch32 mode on aarch64 hardware, need to drop
> the dependency on ARM64 to make the driver could be selected for
> ARM32.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
