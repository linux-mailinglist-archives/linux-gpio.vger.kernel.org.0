Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC231B6E36
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2020 08:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgDXGcb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Apr 2020 02:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726383AbgDXGca (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 Apr 2020 02:32:30 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650F9C09B045
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2020 23:32:30 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id o10so7086801qtr.6
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2020 23:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZfalPoSXKo9q0R3u5YacVZM0E/8yC0Ybzm+slRaoGoU=;
        b=g3uOQH0idGBVgEk048SkkeOsgA/xdWQ2iNwANlO1BXN3j2437HGewffDpRP3eoRsRZ
         bBG/R7SOusyv7SzO7b5tEobbUP5nKbQqySyGDLA/FEGhc2APu7J4DZXaamGW5Q1cUUh9
         am0PcwTDSpUc4aHO0xsYGHWNe85GXZoRlujZiTvA7aTlbUGqFSDV9asF7jDNI+CwkNNY
         sDjCiojSOX3ci2+qUcbwEc1Vjx7t07zE5PoV6Br1Y+fgUVoK8nHMs+V5SSFoZpAjtGLY
         zb4HDjqFYfVpcQowpRHNhOnYMji5P6tSlWMYGPZ2OeQS+mVEiJwUoHjw6zN5cTa1x6Kv
         bbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZfalPoSXKo9q0R3u5YacVZM0E/8yC0Ybzm+slRaoGoU=;
        b=tCzlfoStzdMVynx6cgJdyi3O4aq0OInmn68qCU3lSIsoh19xmQQYyeol+Ft943j1XG
         hx39Isbwl7qdGUQQ6vqkK4Us/zHxmBYfaHJGj+sFVoF4Q6wUCE1I1Kh7/hZUx2atOQip
         yQhl1Qq4zuhqREbSawW/8+cQSyS71SotZk4RdUYUeZqXNNdP9f75CQAjzmuID0knNHr2
         rYBwiztHGO6APk+C/kGaT3j9aUGqvxuxzlRwIKRRDhwB/uEifZYGg6+OxUV4DCDTPUVU
         kpTMxmJ6KqNl1w7aB9AC+ogow0vdHt4QHmnS8qR0UmxOJoJEDtUm2/mOF+vseLa8Ip71
         dJwg==
X-Gm-Message-State: AGi0PuapnGUMnpFU42CdP6Qy+/YVv9E37SpFgVZNziKkY11izHHnUAl6
        SKgbZ++Gxe2Aq2wJGzh3qvaU6w5JXdW7UXPRCmh6dMrl
X-Google-Smtp-Source: APiQypIF1fEmY8JrG1/RT3To/uy3aXBpAxVW0XiDtpp8XTOC21K2DijLuA9tpMc1DBcWYFDF4RchMLg5Npw+q2cy52w=
X-Received: by 2002:ac8:5209:: with SMTP id r9mr7525387qtn.57.1587709949676;
 Thu, 23 Apr 2020 23:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200417092157.16547-1-s.hauer@pengutronix.de>
In-Reply-To: <20200417092157.16547-1-s.hauer@pengutronix.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 24 Apr 2020 08:32:18 +0200
Message-ID: <CAMpxmJUq+iCe2vVfav9QyGGy20G3JoCQx_dpfiDXU9mzXUv7-Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: Fix probing for chips without PWM
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 17 kwi 2020 o 11:22 Sascha Hauer <s.hauer@pengutronix.de> napisa=C5=82=
(a):
>
> The PWM iomem resource is optional and its presence indicates whether
> the GPIO chip has a PWM or not, which is why mvebu_pwm_probe() returned
> successfully when the PWM resource was not present. With f51b18d92b66
> the driver switched to devm_platform_ioremap_resource_byname() and
> its error return is propagated to the caller, so now a missing PWM resour=
ce
> leads to a probe error in the driver.
>
> To fix this explicitly test for the presence of the PWM resource and
> return successfully when it's not there. Do this check before the check
> for the clock is done (which GPIO chips without a PWM do not have). Also
> move the existing comment why the PWM resource is optional up to the
> actual check.
>
> Fixes: f51b18d92b66 ("gpio: mvebu: use devm_platform_ioremap_resource_byn=
ame()")
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Patch applied for fixes, thanks!

Bartosz
