Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7C505ABAC3
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Sep 2022 00:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbiIBWUI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 18:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiIBWUH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 18:20:07 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF10B65251
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 15:20:05 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id p16so6413393ejb.9
        for <linux-gpio@vger.kernel.org>; Fri, 02 Sep 2022 15:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=MnthNxIiFeaOCUSOEozywdNetMkLAmt+YGycE0QV4QM=;
        b=NfXhAeOjDbvXltWBSu37ZF/YA3RYAZaaGHMDc1F2/Dysb/I13Qzon5Xh9xqzY9gk7u
         BakD0wloYQbP1+LabGCwbdoA4AS2EXA+weFBzebpHBpzQ8V/b2lCntgfsfQBusodLwrt
         TMFMmRD8U6LSGYaX1sZ3z4LaV7tfj2MKGoWoyNJLhiQ/Jy+uRm0kTpLmLa5xY9wntnsK
         /eQbetP61njkSrUJybrFWqp+CnGbWclTH1EqOe9aI+Z7FTneOVHDRWqm1dAJuJPKpsdZ
         FAvKsgxrKX0JqZR2NQG4BoM36lh7bX9RrZ+VPBez9gNtDcYCKZ1TeRTXytnCSZjjhvB0
         f1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=MnthNxIiFeaOCUSOEozywdNetMkLAmt+YGycE0QV4QM=;
        b=qu8xtP8wMS46yEr5SR7b2toRcGaeDPXIb/VSLZG2cSQvVcIbO8PP/W7qXFeIbffW1D
         439EAbRicOTNxFZebmZA8mp5Kj8y+5OLlsK9OQcmaAXYBuYFZtURU/aN58YVe0Ht3vbl
         NPPaadh65zKfTfgL7MUyy84gudlHjCRpnUZfQCkeW67F9/i5iuXJOb0tQz4rhJlAk3oT
         6Y7LQjrU5kY8CIDHsFTec4hBLC5cAH+Ki3X+UAeYMQfb7VP9Pg6rS9tLcMx4OD2Sejr7
         PPzj8RYv+KUXxH64A57d3cy2Cju8n04E1LRd9TNQYCMU89W9b55SbSmNHeejsAbXbN2V
         wA4g==
X-Gm-Message-State: ACgBeo292E4ApGcLd9RBDkBXEobZxblbVxLo6Er1PbZSY1VbqmH5bLmV
        LXWM+e4TfolEpRmzsJY1abWlA5cZxHUBnJmsIIM3dw==
X-Google-Smtp-Source: AA6agR4iRgKtyOZNhp11XLNwwluig/zcoqFih0licH++8iY0fBbsO8qKVZh8mZRl9lWXjgFGrMdJ/Rm9O2NUbut4tqY=
X-Received: by 2002:a17:907:6293:b0:73d:b27b:e594 with SMTP id
 nd19-20020a170907629300b0073db27be594mr29165863ejc.526.1662157204499; Fri, 02
 Sep 2022 15:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220831135636.3176406-1-claudiu.beznea@microchip.com>
In-Reply-To: <20220831135636.3176406-1-claudiu.beznea@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 3 Sep 2022 00:19:53 +0200
Message-ID: <CACRpkdbz7YmThCa2-q2XWrvN3diB_TR+dntL2YTGXCsmaYP-wA@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: at91: cleanups
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 31, 2022 at 3:54 PM Claudiu Beznea
<claudiu.beznea@microchip.com> wrote:

> Machine specific PM code was calling gpio driver specific code to enable
> wakeup interrupts. Moved this code to the pinctrl-at91 driver as close
> as possible to the moment machine specific code is executed (in .noirq
> member of struct dev_pm_ops). The code has been tested on sama5d2_xplained,
> sama5d3_xplained, sam9x60ek, sama7g5ek.
>
> Along with it added 2 cleanups.

Patches applied!

Yours,
Linus Walleij
