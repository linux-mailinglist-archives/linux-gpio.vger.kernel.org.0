Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5EA3FE769
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 23:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbfKOWJ0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 17:09:26 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46637 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbfKOWJ0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 17:09:26 -0500
Received: by mail-pg1-f195.google.com with SMTP id r18so6574360pgu.13
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 14:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=HHPDkMqYLRE1UmTcCXc29WF8eT8rU9fO8tUKqDH1bWM=;
        b=FO+N6MSe7PeyfgqsNtfAMKWzchnk8stYlVmX924RBKfFnEVahkLYWSHpVkM48Rd1Q7
         hoGi9nO+Sakv/4CMxCLH1Rp8zwU2NRX60CfV7eU5YVJAtPkJPELbdEgH7mWJ39owgwBt
         j3q7OHpfnYS6S6XItdMPNC1shlSdKSvoHMynI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=HHPDkMqYLRE1UmTcCXc29WF8eT8rU9fO8tUKqDH1bWM=;
        b=eyeFpMagrmOb8SD1Zri2SuoZgqdvUECNb+nvipi0qz7znf5ugThUHk0+zkWSrId1oO
         L8/50HvQSqxkAYItvIaR7jEBcULHHKSYUtx75pGny+selZY6AN9eScxkLllV3bSOOIu0
         /oQ9rvidwWvlrLekLZFikkkVoT5b5Yo2TKpXlHjRAyGwXRNaFAFBvURVUv/Y2XelEalP
         kaFYQzAESBhUDWZKV5+xprmVghpjs/gI+1ZGGN7vyx8ZTnCLYSGCyG+HMxmqcGRE5xv5
         z+6OCR/Gya/0U0fwIRxe/PXRGQFkF3zU9GNY07LsAEwT+udDzJeOMlJSDjKvRNDmCmbV
         1Fxw==
X-Gm-Message-State: APjAAAUKU8aerTQqSfW+Fb4KH/zcV8zjNTwPyGavL1Qm4/pqDsTif+5I
        mQ+8n8oGv4e2gw+BRB64tDfDQQ==
X-Google-Smtp-Source: APXvYqxjkXIKUrRKWqlKT3BM6RRfSPhAVuL99mmoOgGfxld7zoOjsmN41sw578rR+emLjfBA+dl1iA==
X-Received: by 2002:a63:750f:: with SMTP id q15mr19105221pgc.422.1573855764169;
        Fri, 15 Nov 2019 14:09:24 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id k14sm10717256pgt.54.2019.11.15.14.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 14:09:23 -0800 (PST)
Message-ID: <5dcf2213.1c69fb81.1e0ec.f500@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191115215737.GG18786@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org> <1573756521-27373-9-git-send-email-ilina@codeaurora.org> <5dcefd86.1c69fb81.c72c8.07a1@mx.google.com> <20191115205555.GF18786@codeaurora.org> <20191115215737.GG18786@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        maz@kernel.org, evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org
To:     Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH 08/12] drivers: pinctrl: msm: setup GPIO chip in hierarchy
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 14:09:22 -0800
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Lina Iyer (2019-11-15 13:57:37)
> On Fri, Nov 15 2019 at 13:55 -0700, Lina Iyer wrote:
> >>Quoting Lina Iyer (2019-11-14 10:35:17)
>=20
> >>>+static int msm_gpio_wakeirq(struct gpio_chip *gc,
> >>>+                           unsigned int child,
> >>>+                           unsigned int child_type,
> >>>+                           unsigned int *parent,
> >>>+                           unsigned int *parent_type)
> >>>+{
> >>>+       struct msm_pinctrl *pctrl =3D gpiochip_get_data(gc);
> >>>+       const struct msm_gpio_wakeirq_map *map;
> >>>+       int i;
> >>>+
> >>>+       *parent =3D GPIO_NO_WAKE_IRQ;
> >>>+       *parent_type =3D IRQ_TYPE_EDGE_RISING;
> >>>+
> >>>+       for (i =3D 0; i < pctrl->soc->nwakeirq_map; i++) {
> >>>+               map =3D &pctrl->soc->wakeirq_map[i];
> >>>+               if (map->gpio =3D=3D child) {
> >>>+                       *parent =3D map->wakeirq;
> >>>+                       break;
> >>>+               }
> >>>+       }
> >>>+
> >>>+       return 0;
> >>
> >>Shouldn't we return -EINVAL if we can't translate the gpio irq to the
> >>parent domain? I would expect to see return -EINVAL here and the above
> >>if condition to return 0 instead of break.
> >>
> >Good catch. Sure.
> >>>+}
> >>>+
> Looking into this, we have been setting GPIO in hierarchy with PDC and
> the return 0 is appropriate as it would set the GPIO_NO_WAKE_IRQ as the
> parent and setup the IRQ correctly. We fail to setup GPIOs otherwise.

Ah ok so by default we will set the parent irq to ~0 and that means
bypass pdc and go directly to GIC?

Where do we fail to setup a GPIO otherwise? It sounds like we can always
translate to either something in the map or to ~0.

