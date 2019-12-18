Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D164C124BAE
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 16:28:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbfLRP2Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 10:28:16 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33685 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727402AbfLRP2P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 10:28:15 -0500
Received: by mail-lj1-f196.google.com with SMTP id p8so2631096ljg.0;
        Wed, 18 Dec 2019 07:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NGB0Bht5iuAhGYY8+BK8lXynDdbbH0NCySaOeUZsF9Q=;
        b=CElXgf2Klb0noNFucfG1GDOjLqnMBNcOXXqZdVOK6xOVs3KX9bggRS09lL5rsfFVtm
         yXEywA9e5CfLlR0B2XhQyzUMJ9L83+aaXAO4v/mxfrwtQF/J8vTUouACtLVHSTq/RSMI
         gUHTSBrg2ZvU8dy7xidG8UQptYGyBozEXoeaA8KCoDSpGSc+SC+eh9AqZXixC3d0Ic5d
         N4I9FKec8Z/VeCi6whOwWsTE2jHgM2Pm/DvHM9lFERLNdaQtzoAU+O+sCqgb8MTXN59Z
         KyLnvt3x+fgtbmF6b0dGBbUmXrUmbhL+DHQBY+MSpQrIULmHt2ZfnM7GpTDUMwQgEJr/
         72Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NGB0Bht5iuAhGYY8+BK8lXynDdbbH0NCySaOeUZsF9Q=;
        b=h+h6jrwsgx4Gkzchzgf3CTKNwFtgQgoaYk1RFuOrMHoBcz0aT0NnA0IdUNZ/oKqDIY
         RL/gas4D/ulPLQFJrpRcM2Thw3q8X70rl/WcZmk4w6dHK1zB+pQzSRTA3A8MttMB/bU0
         6huI79G1C0nZUkNFdiGvZXIjxLrCOCJpv/ERVfpJqyfyhJoFYCjVS61CFjnX/Lt+/n6s
         Vp3dq18bfK5ChvdRk7erCQY6aGZg7/QnXx0FecDxAeg5YflkiYLv3gBSiFuQZWnlALqY
         rANoEBeD1Klurz/9u6vkA+vfah4zdo5KtOs1tRe+vxDeFJzpReoLujAp/VIoY2bvSLtv
         12vw==
X-Gm-Message-State: APjAAAW0/iQKkWLoj1JblRdeeqWX2ZP9GKRwQuT8XcxIaRbZgnzfNrc6
        qZlbUdXQQoR9dZSNNNnunfEc+km6sOPK6Ts5NNI=
X-Google-Smtp-Source: APXvYqwRXR6SYoiNPvwbThVTZFiIWXv19mPiee7yYheOO2EF59zuRJmhpBpkJVuauhHrW8NUK5B5sny+ZKnji/BawQc=
X-Received: by 2002:a2e:6e10:: with SMTP id j16mr2223416ljc.202.1576682892704;
 Wed, 18 Dec 2019 07:28:12 -0800 (PST)
MIME-Version: 1.0
References: <1576672860-14420-1-git-send-email-peng.fan@nxp.com>
 <CAOMZO5DeA24EUjr-E=V=tGNaZ7UkOEi+F5-kEBqEB288DSNSoA@mail.gmail.com>
 <AM0PR04MB4481B3EAB2DDC42A137E8AAB88530@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <CAOMZO5BK0Pa6Aw6n7Tf+C6+Fg15WNbEUOzKCQTaWqTUu6yoPjA@mail.gmail.com>
 <20191218145955.GE26938@lunn.ch> <CAOMZO5BibF5A9sw=fLr3DXLf9LXYdxWy=aK7KCE3L0bt5eX+9Q@mail.gmail.com>
In-Reply-To: <CAOMZO5BibF5A9sw=fLr3DXLf9LXYdxWy=aK7KCE3L0bt5eX+9Q@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 18 Dec 2019 12:28:07 -0300
Message-ID: <CAOMZO5BOv2e2_NWHxXRQk0v6Q10FgKLQO-HvTgi5oF_bwUEphg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mvebu: armada-37xx: use use platform api
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Peng Fan <peng.fan@nxp.com>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "wens@csie.org" <wens@csie.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 18, 2019 at 12:09 PM Fabio Estevam <festevam@gmail.com> wrote:

> Yes, I think that returning the error like:

s/returning/printing

> dev_err(dev, "Couldn't determine irq count: %d\n", nr_irq_parent);
>
> would make the code cleaner.
>
> Maybe just a matter of taste though ;-)
