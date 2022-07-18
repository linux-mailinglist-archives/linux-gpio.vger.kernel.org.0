Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DECC7577E8B
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 11:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233865AbiGRJYl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 05:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233098AbiGRJYL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 05:24:11 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A5DB6384
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 02:24:10 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id y8so14419137eda.3
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 02:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lvoARXVtfF7A5hOwKpACX9CK0G3DRgFceztlwnuv75Y=;
        b=D7TbIEoBJuoHo8mOmNp5BfPAFmNuD/IA6LOkcBELV8S0s2YGwYPiXRTHhru4YIhVtL
         0Ptji1nAVqkAX445vCixQ0D5IBfS16QxRLWcRbsGw5oiRaL81ScXuyuw6rDkawMB4lVB
         oeFb/Jikr7c6/Klg//pe/s+0NuRhxboe+bRVEIDtCXKqu+6SsTF7Pqlz8rg2PF1uwmgV
         XBCUhS929YuahCq00kTcUzlQkFQtHL0pVcsVYgHmTWi/IpKzb5MrpQp93dGp1Dc16yjr
         F2QMGTBuRqP493T7XHqF0trt+E8Wm5Se24gubR02YIjGxwGm8TVIZJDmyHU+NOKi7QEe
         b3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lvoARXVtfF7A5hOwKpACX9CK0G3DRgFceztlwnuv75Y=;
        b=JlPYp2iiWynpREPr5H0UA8nhsBKexKw2ssimdGsvtXUwuBH5KtLSw7J7ieKut/LjMZ
         zsHol8jLPr72Ombx62FQi2rQed0dUp3UmU3yX2tPbgQerMqTaWHKqofg8H9PYSpE15RO
         56+b1aHkO3nfuAH++xx/N9TNfYllnM4+hsDmy1OjGwmDuqAMvYDuhq4UKIJAFkaNlcIL
         YhQjYsH9r3tlAcl6dUXctNoghkju3ae81B9I18r/IXr7AkQveV1MkFl771ZUWKlgL+mj
         aIPJpBxmeD8kjciDd0jS3frhznbZOsf45MJ1MAEgKefoc6MsEMOEaPvew5pG53tgU6Zu
         AlFQ==
X-Gm-Message-State: AJIora/btTqnMZM5ZnUpE/Hqgp0+05Cj4oq9p62hbdOlbPcpQ8lVCECw
        k571FpVIzQNxyrlv942LdVXgoQ48wnkFLvgkIIfiKQ==
X-Google-Smtp-Source: AGRyM1uGi4Q4mleJl5vMkSM6KeV5yMhwkBxtFvSuW3ZnAAtQm5CDgDrdoOT1oRywfbzc5hXMSLaj3EQytWfkXAXLSUo=
X-Received: by 2002:aa7:c0c4:0:b0:43a:20cf:3c68 with SMTP id
 j4-20020aa7c0c4000000b0043a20cf3c68mr36090978edp.172.1658136249130; Mon, 18
 Jul 2022 02:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220713193750.4079621-1-horatiu.vultur@microchip.com>
In-Reply-To: <20220713193750.4079621-1-horatiu.vultur@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jul 2022 11:23:57 +0200
Message-ID: <CACRpkdawTmo2HW6kkkg=+rdCxM4EhghhgTahX+ZLKGdj8cYdmQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] pinctrl: ocelot: Add fixes for ocelot driver
To:     Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        alexandre.belloni@bootlin.com, kavyasree.kotagiri@microchip.com,
        colin.foster@in-advantage.com, UNGLinuxDriver@microchip.com,
        maxime.chevallier@bootlin.com, michael@walle.cc,
        andy.shevchenko@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 13, 2022 at 9:33 PM Horatiu Vultur
<horatiu.vultur@microchip.com> wrote:

> The patch series fixes 2 issues with pincfg.
> - first issue is that on lan966x uses different offsets than sparx5
>   so it can't use directly the ocelot_confops
> - second issue is pincfg stop working when regmap support was added.

v5 applied for fixes!

Thanks for fixing this Horatiu!

Thanks to Andy for the usual first-class review as well.

Yours,
Linus Walleij
