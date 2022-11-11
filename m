Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 363CB625669
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Nov 2022 10:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232815AbiKKJRb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Nov 2022 04:17:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233113AbiKKJRa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Nov 2022 04:17:30 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 153B1102C
        for <linux-gpio@vger.kernel.org>; Fri, 11 Nov 2022 01:17:29 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id v27so6831635eda.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Nov 2022 01:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3EhuZJKcfqgOideY8G1CAKPADnpCK5zmBaGB0ykMFd4=;
        b=mIYZVugbueEvwAQ7ja6b6HCFSsDyCVI4gN95UXrBhemGMKJmqCskOHO+zJQOsQU3jY
         yOnqGFh3WLZpXWipvH4zBJEsKGUWcsSrn0kzKJ1Bldxfb8HHZ5eT0tR5YsaUEv5wK8Ni
         +t3u3npbHASmEL+7y+LAdtZ0ihCZ2OlRbjQKRhSm11asZ/mJGtH/l4wjqXKWQCqzx+2v
         O6ssHngAPXgjQlbE6fYOwR8vVBLBG4nsOFKMdb06NadNdiGP7bPaEsklbBYKIC+YVV/5
         uMuT55w7/ztQrgBVilMBbPCZenK5/toJWLvAo843oxoT/ih+uv70PDGX2ZGv2KCS8YXG
         g+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3EhuZJKcfqgOideY8G1CAKPADnpCK5zmBaGB0ykMFd4=;
        b=u4moGi8zgpXM9V2VIlzF8HCfm2rTvTPq13wHZH/5rSQ9M8pET4BhSivptGaNuqgcEi
         ZZqAyTRfhzCieZy89CaTZF8aJi8e3YxMvh7xcj2/1BDZewXw9Va+tHudt0Ojy6Gj2fnj
         INwSg8QWP8gBOpk/S4UElMoUtAFjm5oNbkNF4L9zc1nWcmI9qi87YI7mn2ri8eqwtwm9
         By0IN/ILlaAdCH6AeND0z5BYgGBQ67hhBt1G5PkHoteHujZm8Fqf6jv9HyPQdj6Go9Du
         upnP7u99EQCfGXwiYzQTnnkUk5S/8bkOmSpQnR1l+NJ9vk/OZhrkQJkBdXDnuFRJ9liQ
         pmvA==
X-Gm-Message-State: ANoB5pmRZGVlCUn3ooS/RvASjroinDBsaxTs0a9jG5DNyskGQiXJKlmc
        nckWh7j0CcIpCAEnnrQEWlepiw1a72we9k7Eozaienbii+Fm/Q==
X-Google-Smtp-Source: AA0mqf6gk5Hvf9Jw7i6DujBTyiymfFRH7HTZ9QPzYMCJ9TBBX7y5GuZe29ptTJD5KLAomQPXuiPaN/C14L9E36DVz6o=
X-Received: by 2002:aa7:d3c6:0:b0:463:c64e:bc75 with SMTP id
 o6-20020aa7d3c6000000b00463c64ebc75mr693347edr.205.1668158247630; Fri, 11 Nov
 2022 01:17:27 -0800 (PST)
MIME-Version: 1.0
References: <20221110191258.1134378-1-niyas.sait@linaro.org> <20221110191258.1134378-3-niyas.sait@linaro.org>
In-Reply-To: <20221110191258.1134378-3-niyas.sait@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Nov 2022 10:17:15 +0100
Message-ID: <CACRpkdZCrdHttbk7j2reBgYPfYqYr1GTMNortcE9sQV4GdMwhw@mail.gmail.com>
Subject: Re: [PATCH RFC 2/3] pinconf-generic: add pull up and pull down config
 with resistance
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Niyas,

thanks for your patch!

On Thu, Nov 10, 2022 at 8:13 PM Niyas Sait <niyas.sait@linaro.org> wrote:

> pin configuration types have been extended to include a pull up
> and pull down config with resistance in ohms.
>
> Signed-off-by: Niyas Sait <niyas.sait@linaro.org>
(...)
>   * @PIN_CONFIG_BIAS_PULL_DOWN: the pin will be pulled down (usually with high
>   *     impedance to GROUND). If the argument is != 0 pull-down is enabled,
>   *     if it is 0, pull-down is total, i.e. the pin is connected to GROUND.
> + * @PIN_CONFIG_BIAS_PULL_DOWN_OHMS: the pin will be pulled down with value
> + *  passed as argument. The argument is in ohms.

Hmmmmm hmmmm.

When I designed this, I definitely intended for the argument to
PIN_CONFIG_BIAS_PULL_DOWN to be used for this, so I would just:

- Use PIN_CONFIG_BIAS_PULL_DOWN
- Augment the comment to say:
  "If the argument is != 0 pull-down is enabled, the value is interpreted by
  the driver and can be custom or an SI unit such as ohms".

Yours,
Linus Walleij
