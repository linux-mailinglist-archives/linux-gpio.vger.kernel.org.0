Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE3647FCA6
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Dec 2021 13:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233684AbhL0Meb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Dec 2021 07:34:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233041AbhL0Mea (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Dec 2021 07:34:30 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A5D3C061401
        for <linux-gpio@vger.kernel.org>; Mon, 27 Dec 2021 04:34:30 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id l5so26491076edj.13
        for <linux-gpio@vger.kernel.org>; Mon, 27 Dec 2021 04:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kDL4/ZM1Hmnh5oYIPoU4vZe66noVMu1PR8VyIXYKcS4=;
        b=IMU/XB/JIh/22rS8ERkqU+P9wRUZCfQ8S5p4ab0p5dK0Roor3+I8nAZRVND2sP5hMn
         Fi2vjkwicywiQuhaYWZ65vQlPjbY9MQui9W/TPDskkJXYFXgTBEHCS5ObcqgjVek0yQm
         2vootvePqpslbHdYwc2owJIiyIznt12HdqA9OZWrTEmWbjhqqMMbUYFKVR+c+DIvXOAx
         OXGBoaZzZm6/93Ojc91wGzE9bugWcZ4uBisFdy5F8ppLipkpfHHvxh97i7q1pRjyXZSN
         Gi2T3hgTwyDiDkxkQ90RsgmYxBGifpWk31aZRYdjSRHoEuw0NHVBYU4l/kJhEm0XN5CR
         Ro7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kDL4/ZM1Hmnh5oYIPoU4vZe66noVMu1PR8VyIXYKcS4=;
        b=GdQdC3pk8oamj+TdBk0TC9GhqMfwSj14ZpnPLqTQdSfTuSt30AOx7pVId8MwxKTYKK
         GGaeyLJQX/L658uJO9YEPFnoSgc0M9YmlBSLKibXUxdOUvOHvTsXf3fPfp7cS0Agrj9y
         qon2kh0Qp2MVgQ6HHL/Zvlnlcpg9MIupwClhBytIYzDMm6uYrueZMXXf/AS4uQ0aPova
         67eAz+8RW14uAX2Mq6zeWxpvPftis4HbvUWF5KGhJ37XBNY9VdiQZAqRcku0loiWuKVk
         pW3izR1PT7WNcJ4l0bbcYwSA6oG6rk/xHi9xlLdLWUXnm36D61GP4aFctlxkdhI2tcTh
         DpfA==
X-Gm-Message-State: AOAM533KwsOPjocVs/aaED0v0Rs5Ar7uMYBxVmMgrrdniOi3gN2bcuQR
        oG//luVWjdDkwp7JsIHaWQvz/O465btqrhAZRms=
X-Google-Smtp-Source: ABdhPJz1EpENSMQ4mjXbzUyR+XzMQeuQ1W9B7VF7WXO1qWkM9csxp7LL1Yv3srFHsuROWAefCS267AjE+MixE/bKHmw=
X-Received: by 2002:a17:906:5948:: with SMTP id g8mr13681427ejr.4.1640608468707;
 Mon, 27 Dec 2021 04:34:28 -0800 (PST)
MIME-Version: 1.0
References: <20211227122237.6363-1-zajec5@gmail.com>
In-Reply-To: <20211227122237.6363-1-zajec5@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 27 Dec 2021 09:34:17 -0300
Message-ID: <CAOMZO5D_kKCUhU6S86-4KNPyGjXOiFLbOG3+k-mqA8nWd1qOcg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: fix assigning groups names
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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

Hi Rafa=C5=82,

On Mon, Dec 27, 2021 at 9:23 AM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:
>
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> This fixes regression caused by incorrect array indexing.
>
> Reported-by: Fabio Estevam <festevam@gmail.com>
> Fixes: 02f117134952 ("pinctrl: imx: prepare for making "group_names" in "=
function_desc" const")
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

This fixes the "invalid group" errors I was seeing on an imx7s-warp
board, thanks:

Tested-by: Fabio Estevam <festevam@gmail.com>
