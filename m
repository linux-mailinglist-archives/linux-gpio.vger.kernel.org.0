Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B25401745
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Sep 2021 09:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239548AbhIFHtd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Sep 2021 03:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239505AbhIFHtd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Sep 2021 03:49:33 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971ACC061575;
        Mon,  6 Sep 2021 00:48:28 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id me10so11676009ejb.11;
        Mon, 06 Sep 2021 00:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=jNCadg78ZZbTw5rG5vcUAeu/57QdK1VcpaVIJeax+Zo=;
        b=M2Pp/NOoc1wCUokzrD3FlfithOVNSX0oHrMleq5LO6tawwL+sQrfx0sgzwEFCloPkU
         sEAU9DvYAsc6CNg1gPl+gRSjKnB7QRW2uSdfyscl9VGwZYF9a6Y13Y2xgsNcq4BxXb62
         z4ZI/eox1ZxsJzU08pVtxIZd/LTcA23z7gAmPGJpGD9VepkEXB6daIRR1AgH3M6rXFCB
         Dnl/Gf1Udb6PO5+DVSk3h3Atc9DcoB42NXKcJNYeJYGvyWL9vcNUKWL85Zzx6PnO8MDM
         yf/SCJK+VtQYKz65FW+hhUTfXz28ItcKotD8URPP1BK8tfelM44K0BLT+hjdzg80Tlge
         +//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=jNCadg78ZZbTw5rG5vcUAeu/57QdK1VcpaVIJeax+Zo=;
        b=mvsKObOmQO7YaxIL1ywMZ+mk8aGb1/bC95TviZItfx/FTCpOiyGM38Mi/3dX6O5aQ7
         IHlOXVDEGgHkksAlyoaSuZgmtb/uET7IxE5gQTcwoY9gX/xzkcaJT6KlipgCByk48cZb
         +SHKYyvW05kkGcHpreFBij0vrHeXWpvJRL6YC5hAEf/ttPTrPdI7xAr3mC4zjoKaTXqn
         OMoG5N3EtYb4oOFtTCgSACZJEAiuIablmwShqF7mDLIbDsYWAmlzeMoIONxjKswe9/r+
         5Iz2Wy+5iq+juvvIkoM2CfCGSYklr3zc49eOruGcQyQ8bThmm4UTLCfchAVp4gP1047N
         9t/Q==
X-Gm-Message-State: AOAM533aHBAgOt1s5WkqfkyO0CmCQFTCYx0GBt0346oXkXmKZdvUdXcu
        Ed+OcxhGdvIBM5yj74m1Qsn1plle8R2HRaOZ0dw=
X-Google-Smtp-Source: ABdhPJyQK0ZZfRUjLcpFEz4qUOksA0fPViZuTEBschVEytlyqhKrwPskK0GFLCBKA1GyuH0eePZ8Sm4aql6OeL2Zeqo=
X-Received: by 2002:a17:906:1707:: with SMTP id c7mr11781226eje.377.1630914507040;
 Mon, 06 Sep 2021 00:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210901194549.3999-1-wsa+renesas@sang-engineering.com>
 <20210901194549.3999-2-wsa+renesas@sang-engineering.com> <CAHp75VdNnvUfMEL3gMrJOFix3AATL8LAiU18LXJJVL77feBRow@mail.gmail.com>
 <YTXFh46EBghq8lyq@kunai>
In-Reply-To: <YTXFh46EBghq8lyq@kunai>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 6 Sep 2021 10:47:50 +0300
Message-ID: <CAHp75Vc6E_ZJxGn_qjY5kr3QSCjMmhdddUNJSZwpbkF2-ShF+w@mail.gmail.com>
Subject: Re: [PATCH 1/1] gpio: add sloppy logic analyzer using polling
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 6, 2021 at 10:38 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Any reason you are not cc=E2=80=99ing me? ;)
>
> Yes, your reviews are too strict ;)

Ha-ha!

> No, seriously, since you always
> responded to the patchset anyhow, I didn't see a need.

Thanks to AI behind Gmail :-)
I would appreciate if you Cc me explicitly.

--=20
With Best Regards,
Andy Shevchenko
