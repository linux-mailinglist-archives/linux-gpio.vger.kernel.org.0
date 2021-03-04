Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E60B032D808
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 17:48:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238315AbhCDQrs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 11:47:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233320AbhCDQrR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 11:47:17 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14221C061574;
        Thu,  4 Mar 2021 08:46:37 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id 192so12334849pfv.0;
        Thu, 04 Mar 2021 08:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6Rk2foZ0joo8zW1+GRn0pyh0ek8eq+0AnIdr4tRBx58=;
        b=AgCwHqQwPe61JjaEYkIGwVPz43Ic9LhNEfkOl9tMNTxbrjcVnLiijqY5xGshch1FuF
         oTNvjemGzV6/o6gUkeMCAGtxxbAShWKHi4Z3pecR0ufNL4GB2dGUUwsl2KGZdL9LyGm7
         WwzNN/VxcP2cjXY/Noq9PGApkA7bgOFd7CgRR2qWQPNyIDaqAae6sXImS5AoNsF+kVRg
         MwwJoRA4g1c2r3IsuOkoy2JZMCDRKoITolaChCaDRTBk6lnH7UVg48em+N9eidk311KP
         1MT7kLOu/VF7ZCaxnn5JNJzRvH5oW9pjKAgTfDgXCdbRS2FdZcY7WJumsYrgzYCpXSAB
         Faug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6Rk2foZ0joo8zW1+GRn0pyh0ek8eq+0AnIdr4tRBx58=;
        b=MYODzr+//GdFdMlg5zC78uNfkXRJKCfXjLIpx+f5JnhKJVBVja4OAG2/CfqOPk/noa
         Jx/p2BsogEdTsubsUdBuXy+ho3KIuE/rcuXD/IP/R7WUa8+qRZb2ky3HLN1NOyCv2z33
         W9ESNShKMi/WzKePBndhR2aVjoRbOOnIJuIrXXT9duM4sBnZp521DnXUeaTKtSPQcDG0
         Skens9QKqd6h8m6ZD9Hz+0tEfX+lHZN1TEZcPQW7r8j/rbPDcoxR6bskBzfVh6bLHpZF
         ySCNiSUuoFlQjAteg03bgiWJEdqcU2CXYbqLK0gdLh/6EV6dlXljZ/qp+2TP7TQkAOiC
         NC9A==
X-Gm-Message-State: AOAM5337+oCcfz582wxDUtviSEKe+opV0ooiBSlhjCixvLokKARkx0rz
        cSXBNKrl93YDg0WVrsIgt6vASv/oU4LqnGyk0+g=
X-Google-Smtp-Source: ABdhPJyUCKAmwZGFOVWC83aTt17r+nfX1XcVZYzSamHZ4q32ECJlBF9Z+5MGBsJJwBpLYfkwpq4irxO3BAjfg7+P6g0=
X-Received: by 2002:a65:5ac9:: with SMTP id d9mr4343451pgt.74.1614876396217;
 Thu, 04 Mar 2021 08:46:36 -0800 (PST)
MIME-Version: 1.0
References: <20210304085710.7128-1-noltari@gmail.com> <20210304085710.7128-3-noltari@gmail.com>
 <CAHp75VcpGNaQDR5puEX3nTGOQC0vHNjCje3MLLynoBHdjEi0_w@mail.gmail.com>
 <9A8A595D-2556-4493-AA96-41A3C3E39292@gmail.com> <CAHp75VdJGh=Vy=kJr2CemPbSa-amYykNoYd0-jaz0utdC_bkbg@mail.gmail.com>
 <0504ADC2-0DD5-4E9E-B7DF-353B4EBAB6B4@gmail.com> <CAHp75VdkCxBeh_cWwN9dKRpEMntMp22yVjWRCuYumhMzrWi+SA@mail.gmail.com>
 <68F60F3F-33DD-4183-84F9-8D62BFA8A8F1@gmail.com> <CAHp75VdJ0=EewuHW2Ja5MQ=e9q0njGun8iN5Q6JWUxe=CLB=MQ@mail.gmail.com>
In-Reply-To: <CAHp75VdJ0=EewuHW2Ja5MQ=e9q0njGun8iN5Q6JWUxe=CLB=MQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 4 Mar 2021 18:46:19 +0200
Message-ID: <CAHp75Ve9uW6+kpNmsG2BaaOymoAKXPdebNCfRnxUpAZoQnfZ0Q@mail.gmail.com>
Subject: Re: [PATCH v4 02/15] gpio: regmap: set gpio_chip of_node
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 4, 2021 at 6:33 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Mar 4, 2021 at 5:44 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@=
gmail.com> wrote:

Let me summarize what we can do this independently on any of my
patches and be okay with.

In the regmap GPIO configuration you supply struct fwnode_handle *fwnode.
You can you fwnode API in the actual GPIO controller driver.
Inside gpio-regmap simply do this for now

gc->of_node =3D to_of_node(config->fwnode);

The last part is an amendment I have told about, but it can be done
later on by switching the entire GPIO chip to use fwnode instead of
of_node.

--=20
With Best Regards,
Andy Shevchenko
