Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E86EE26B203
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 00:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbgIOWjf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Sep 2020 18:39:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:56564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727478AbgIOQKm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 15 Sep 2020 12:10:42 -0400
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 960C221D24;
        Tue, 15 Sep 2020 15:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600185581;
        bh=XMkMtk/gI2HuHmv1cq2xXt9eQOED93TjXkjDWF8nQGE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DDgFKprJDshmoolsY9k8iSp+epYJOJfxdUBnQKt14knLRveGNCNQhwA0zdxNeHGvU
         3Js9zOsm/ZNzTc14ckVE+pVN4u/URgxtjIoz4fyLbng+qMH/7KbKfP0JVxlxCoGXzZ
         4tXVnHJGIYTGx6c5ngIPBg/uRrICpQjgKcJG98YQ=
Received: by mail-ej1-f49.google.com with SMTP id z22so5818826ejl.7;
        Tue, 15 Sep 2020 08:59:41 -0700 (PDT)
X-Gm-Message-State: AOAM532uZmMLtgaUBDheKOuH2yTc4cBBXOjr2IUlyvWKmzA8UQIyCBvJ
        EfU2TDKZByhCJ+EKPgPXXD/fbSnwHX/beaDcFq0=
X-Google-Smtp-Source: ABdhPJwAuDpp+EHX45RgbdNu7uzZmhVTI4s30E6927Vq0pQ/LgKg1zmNpv30kRLFOr25UoY3E6mkjiYpSvqoLHmgkVY=
X-Received: by 2002:a17:906:af53:: with SMTP id ly19mr20213441ejb.503.1600185580123;
 Tue, 15 Sep 2020 08:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <1600054147-29997-1-git-send-email-Anson.Huang@nxp.com> <1600054147-29997-4-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1600054147-29997-4-git-send-email-Anson.Huang@nxp.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 15 Sep 2020 17:59:28 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdrFUXabpduVEqwSFv63_ZFJ4D1ecb4YhCe=ESSd438CA@mail.gmail.com>
Message-ID: <CAJKOXPdrFUXabpduVEqwSFv63_ZFJ4D1ecb4YhCe=ESSd438CA@mail.gmail.com>
Subject: Re: [PATCH V2 RESEND 4/4] ARM: multi_v7_defconfig: Build in
 CONFIG_GPIO_MXC by default
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     linux@armlinux.org.uk, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
        will@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, oleksandr.suvorov@toradex.com,
        peng.fan@nxp.com, andreas@kemnade.info, hverkuil-cisco@xs4all.nl,
        olof@lixom.net, geert+renesas@glider.be,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aisheng.dong@nxp.com,
        lkundrak@v3.sk, joel@jms.id.au, bjorn.andersson@linaro.org,
        leoyang.li@nxp.com, vkoul@kernel.org, michael@walle.cc,
        linux-arm-kernel@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org, Linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 14 Sep 2020 at 05:36, Anson Huang <Anson.Huang@nxp.com> wrote:
>
> i.MX GPIO is NOT default enabled now, so select CONFIG_GPIO_MXC
> as built-in manually.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>


The same as on arm64 defconfig - please explain in commit msg why it
should be enabled.

Best regards,
Krzysztof
