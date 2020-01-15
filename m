Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1EFC13C841
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 16:44:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgAOPou (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 10:44:50 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36910 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgAOPou (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 10:44:50 -0500
Received: by mail-lj1-f196.google.com with SMTP id o13so19067136ljg.4;
        Wed, 15 Jan 2020 07:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j6qO9VzKyk7Z93B4IKp3Dn6tsqDnHK6bXBO21eqtHYE=;
        b=n+Pzcz1+IOcutRo3c4azf501upOdSlYmce/1ymEaSU6taxHi624WfiWl9E/PkPeU+W
         zmoCV4mhSe/ekbBTOH9rK0ZM6b9XJX3eVDFdg+Ib26+TKokfrxEk7nwKpqs1Vh/p9lV2
         zkfUyZfCadMpObcqAzsGxLv5D6KHqplT+ajemtqeJm0NFLAKjAsOfBTna07EQGagbaks
         7k7sN0jXSpeS6WXYZ+hSlGl4ZcnQ8+cJRknLwrE/fUyhbFZuNRTlfYkRlC26VFWGooM7
         yO/2VPpkq7lN9T6KED6EN9smTRVKCdSFW9sGphDnN4R8oSFXQS5n7Ljxist1ok/Lzam7
         kQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j6qO9VzKyk7Z93B4IKp3Dn6tsqDnHK6bXBO21eqtHYE=;
        b=XDKMSVbsXkUTudcl60Yvu7vj2rvHuHFlj4LZm9CQMk4dFAoOhBITzEFtnxRXBWc7iL
         /MEZktUNQy2VoEECSFgEWzbZx8eqNMfhO8bilwktz8HFpK8tzJxseiieKYPgxgQ2UUdu
         8yasJcQS4GEJmxFm2ZgYfLGSElRtdpfRW62hyoxExfVKLXTAMD9FMt62vknwIDCTRFFB
         nu9fRRbDE1KI+5DkpG6/n8vC10hPY2IS6wPT3LukMiKfAnqLEn57hMMzhjnURSy+7xuq
         GDWctsO6YOpDKBDv4PonGHmuK9961xuRidLremZoo+hQiePNeCY1mQGFQtGgeutc/INQ
         CIPA==
X-Gm-Message-State: APjAAAX8p9Ohonb3yHYwyoTOpzfsl2UbAAJk59jCxUibiOAewbVi92oC
        cF8DFxVydfdqEB4ob11U/wYAPYK+Ospr022nVLQ=
X-Google-Smtp-Source: APXvYqySLu2yqOOpQ0eFNaIf6kY20xHX68+A3EN+yMINPWehdz7Nm1bbK7aAWTU/lZY/OfC9pZD+rINYCV6EB0c4GDk=
X-Received: by 2002:a2e:8197:: with SMTP id e23mr2177769ljg.250.1579103088404;
 Wed, 15 Jan 2020 07:44:48 -0800 (PST)
MIME-Version: 1.0
References: <1579052348-32167-1-git-send-email-Anson.Huang@nxp.com> <1579052348-32167-2-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1579052348-32167-2-git-send-email-Anson.Huang@nxp.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 15 Jan 2020 12:44:35 -0300
Message-ID: <CAOMZO5C7wKF8ojMBPuQZYtBK8W+vwXe8PaL5n-Mo74gF1HD6Tg@mail.gmail.com>
Subject: Re: [PATCH V9 2/3] pinctrl: freescale: Add i.MX8MP pinctrl driver support
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Abel Vesa <abel.vesa@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Olof Johansson <olof@lixom.net>, maxime@cerno.tech,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        marcin.juszkiewicz@linaro.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        NXP Linux Team <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 14, 2020 at 10:43 PM Anson Huang <Anson.Huang@nxp.com> wrote:
>
> Add the pinctrl driver support for i.MX8MP.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
