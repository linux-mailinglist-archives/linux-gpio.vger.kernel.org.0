Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA99647E6CE
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 18:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244438AbhLWRSv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 12:18:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244396AbhLWRSu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 12:18:50 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33314C061401
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 09:18:50 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id j6so23865780edw.12
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 09:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2B/nkqjXkPkDnxaHMj3AetaN9P0sOrShulnPbhaYdts=;
        b=Z34O3HMLTBglkBEnSy6xuM/tDB+/CXIdDJ9z3wZ3pfH/xu5TP+u/1AZMyiQo6cRVeK
         26bbBkMu/u4hlih+SQYQf+bp+jKshKPeav6NjSHGVVIMyKhTWDJaDEQmqw1liIlhkMB8
         2nn3gswkVS/9gUIp8MybGoQ8KTvUJlmJugUko40INhV9Qfj4Zxc2cKidkAgGCcdBY9Fd
         TuBb9HFsZkJCxQPD95uPY4CtKRFrcgKvJXed6xIwnzMvfpvWBCseopx8OdQS21qkYtuQ
         yI/UlUUCZpTphmifHOAKErnFChbRzqTm1EyGr8dMEZfRGE3pwvTWzZSWjVq/TYd+1App
         N5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2B/nkqjXkPkDnxaHMj3AetaN9P0sOrShulnPbhaYdts=;
        b=F/YowkhyUIq8frkjPFvnSzMkXwxYYXD7xzwm/kZhA9PhzzAe46olGmkNEzqw/5HfXs
         HDW1caU/Aet0uwhfogI5s0usfzzBYfLt7Ao27nwQ4wKOn2AQDndyveBASsJZlvdS5cgb
         8EbRn33AVwn6xqDEjkYCenw0+DSCQ8ONAkvFg/9r28/GGc3EsewMFWYhU6B2fJhhmsyl
         aRQ/8RO8aoGkFdvwza3eDVxymQkzf2y3jJOLPpO+bM9QnlN4yXL/5Ab68iRoCWxmmMw/
         aoxcAhKadDmWIOj5/WFI/sFy1O84OwzWQIP107Bs2Cp8UnPlVsGI1SvzhHxH6iTqHz/Y
         m/+w==
X-Gm-Message-State: AOAM533bD7XIIgj6D5hZoj7ElZy02QRUWv37T//AULI6bwHv24lBAI1I
        2nn10s6Ptoe6tHh29HgA+YOpRTY/JC9IhiS+x3E=
X-Google-Smtp-Source: ABdhPJxXAsIhyL43YhkD/3gdEMLKqRFy3Wd5tf0ORfBUfLul40zhfS/gK3pqOEbyQaM0tsaQSuPb0arSxxc9LS3d0Zs=
X-Received: by 2002:a17:906:249a:: with SMTP id e26mr2606651ejb.492.1640279928640;
 Thu, 23 Dec 2021 09:18:48 -0800 (PST)
MIME-Version: 1.0
References: <20211222212807.27122-1-zajec5@gmail.com> <YcQrtObo2+9Ym9DU@ryzen>
In-Reply-To: <YcQrtObo2+9Ym9DU@ryzen>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 23 Dec 2021 14:18:37 -0300
Message-ID: <CAOMZO5DOCEebuy0R2uLFo4tb+ZdYU+LbyPNZ4D3ORp=k352-qg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: fix allocation result check
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 23, 2021 at 4:56 AM Abel Vesa <abel.vesa@nxp.com> wrote:
>
> On 21-12-22 22:28:07, Rafa=C5=82 Mi=C5=82ecki wrote:
> > From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >
> > Fix code to check correct variable value.
> >
> > Reported-by: Abel Vesa <abel.vesa@nxp.com>
>
> Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

After applying this fix, I can boot an imx7s-warp board on linux-next,
but there are
several "invalid group" errors:

# dmesg | grep pinctrl
[    0.072510] pinctrl core: initialized pinctrl subsystem
[    0.169977] imx7d-pinctrl 302c0000.iomuxc-lpsr: initialized IMX
pinctrl driver
[    0.176003] imx7d-pinctrl 30330000.pinctrl: initialized IMX pinctrl driv=
er
[    0.379887] imx7d-pinctrl 30330000.pinctrl: invalid group
"brcmreggrp" for function "pinctrl"
[    0.381957] imx7d-pinctrl 30330000.pinctrl: invalid group
"btreggrp" for function "pinctrl"
[    0.399802] imx7d-pinctrl 30330000.pinctrl: invalid group "i2c1grp"
for function "pinctrl"
[    0.405120] imx7d-pinctrl 30330000.pinctrl: invalid group "i2c2grp"
for function "pinctrl"
[    0.414204] imx7d-pinctrl 30330000.pinctrl: invalid group "i2c3grp"
for function "pinctrl"
[    0.416103] imx7d-pinctrl 30330000.pinctrl: invalid group "i2c4grp"
for function "pinctrl"
[    2.552967] imx7d-pinctrl 30330000.pinctrl: invalid group
"uart1grp" for function "pinctrl"
[    3.527187] imx7d-pinctrl 30330000.pinctrl: invalid group
"uart3grp" for function "pinctrl"
[    3.548179] imx7d-pinctrl 30330000.pinctrl: invalid group
"uart6grp" for function "pinctrl"
[    3.923545] imx7d-pinctrl 30330000.pinctrl: invalid group
"usdhc1grp" for function "pinctrl"
[    3.949302] imx7d-pinctrl 30330000.pinctrl: invalid group
"usdhc3grp" for function "pinctrl"
[    3.958183] imx7d-pinctrl 30330000.pinctrl: invalid group
"usdhc3grp_100mhz" for function "pinctrl"
[    4.657275] imx7d-pinctrl 30330000.pinctrl: invalid group
"sai1mclkgrp" for function "pinctrl"
[    5.201507] imx7d-pinctrl 30330000.pinctrl: invalid group "sai1grp"
for function "pinctrl"
[    5.866850] imx7d-pinctrl 30330000.pinctrl: invalid group "sai1grp"
for function "pinctrl"
[    5.889662] imx7d-pinctrl 30330000.pinctrl: invalid group "sai1grp"
for function "pinctrl"
[    5.907229] imx7d-pinctrl 30330000.pinctrl: invalid group "gpiogrp"
for function "pinctrl"
[    5.936451] imx7d-pinctrl 30330000.pinctrl: invalid group "sai1grp"
for function "pinctrl"
