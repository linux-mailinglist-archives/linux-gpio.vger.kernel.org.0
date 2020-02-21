Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7BB01681BF
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 16:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728326AbgBUPeN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 10:34:13 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43324 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728344AbgBUPeN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 10:34:13 -0500
Received: by mail-lf1-f66.google.com with SMTP id s23so1782750lfs.10
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 07:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hUVfMiXxCwbSjtH9BPcnP06NcLeQvKTFfCk+TkAB1ZQ=;
        b=v90zLbE5oSFF85/nmKa9caaE43xtNO2sg0peoa6K/LaorENVEkOf35lATcCgMyTbPW
         O69VCm2Xttmp1nfwqSxxxy9Z1qj2m0SM9sgeOCvFYl6ECFGp8Z49HGtUdDD7nDXZV52M
         7mVPCdX9y3erbnBlOsk9iMOXmAKwPffElO75JsVMyUHRTzF0K94XzifctntrM7BCB0Ih
         fQWoyZ9Vw8c/u6cRD6ECP8tO3GWZezpVnii5ZYj2mp/KTrGI7hxBaziucNlZ/+MH44i7
         oNQMfu6cTpDPUepThAKF9qA3+I22/r3p1UKcvLrsvEjQ5WzRxqInd4YIw+8dM1T1IxQa
         crrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hUVfMiXxCwbSjtH9BPcnP06NcLeQvKTFfCk+TkAB1ZQ=;
        b=Vqb5y0KXssZ+EkseakgaSXhrgd4UAvkbPVqnTIxyT/2bS96yW+X6TufXIqcQOzmCTP
         SHqAJe5c41XRd5SId6frXzavE3v1811kkXjpcOtFIZqjnm244OYFz+ZtXSrIqqp3Tdw5
         jIiJkPBMULs3ojlQ9a8ugzHJJynwxDQb6QqL2k+1KWmK1dVANND5c5/nGcZM9W8pFT6M
         /LMy6StR1alfiqJKGo3G3sFiuwcRdVEraqy80sPUynX16u/kwXdPIgGU4SlSYHRCdBdn
         WEYEE02+wgVtCse1Mtf1BeZkd0OFQIi6lRB/9QNHqrF2/ZjREojHdfZetnPkhsp6lne+
         p9Wg==
X-Gm-Message-State: APjAAAUvjiKKhADdngPqVwJc0Fv0qGOX5Q2nyUzdqGUXPKCvAqWPHQUG
        IQAQ4At80A3R8VRzCH8QVpUDqXLBipvFlfjm633afA==
X-Google-Smtp-Source: APXvYqxFOhbB45zhwJACKnRWGrffnbDn/50wsrqM8zfRboGUcRtR/fIOZXVdUDsZuFjz9JDddI6CuEa9zN+Z1wPCOKA=
X-Received: by 2002:ac2:5499:: with SMTP id t25mr19779301lfk.194.1582299251375;
 Fri, 21 Feb 2020 07:34:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582216144.git.leonard.crestez@nxp.com> <bd7ad5fd755739a6d8d5f4f65e03b3ca4f457bd2.1582216144.git.leonard.crestez@nxp.com>
In-Reply-To: <bd7ad5fd755739a6d8d5f4f65e03b3ca4f457bd2.1582216144.git.leonard.crestez@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 16:34:00 +0100
Message-ID: <CACRpkdbB0xUF14aG5kVtmQ-AuwZVNKYq8_mW41jdQ_OfcNq8KQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] pinctrl: imx: scu: Align imx sc msg structs to 4
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Anson Huang <anson.huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Franck LENORMAND <franck.lenormand@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 20, 2020 at 5:29 PM Leonard Crestez <leonard.crestez@nxp.com> wrote:

> The imx SC api strongly assumes that messages are composed out of
> 4-bytes words but some of our message structs have odd sizeofs.
>
> This produces many oopses with CONFIG_KASAN=y.
>
> Fix by marking with __aligned(4).
>
> Fixes: b96eea718bf6 ("pinctrl: fsl: add scu based pinctrl support")
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

Patch applied for fixes. KASan needs to work.
Thanks for fixing this!

Yours,
Linus Walleij
