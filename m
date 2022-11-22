Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD76D6336F0
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Nov 2022 09:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232700AbiKVIY5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Nov 2022 03:24:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232731AbiKVIYz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Nov 2022 03:24:55 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D2CB40442
        for <linux-gpio@vger.kernel.org>; Tue, 22 Nov 2022 00:24:54 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-39451671bdfso111833017b3.10
        for <linux-gpio@vger.kernel.org>; Tue, 22 Nov 2022 00:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kb63W+UIsuIrJz3AXei8J+4cfxCV44ANkMXV9cCXccg=;
        b=mH3OJYCvcyiKq8qtqJs/nYHURgE0zFOMnwKbBA4doL7OTC+Bxtbq4P7yK2l1D/UuvN
         ANKZM0yAo0iINKoNVgjnUzbNgIWuqxYh1X/xuZiT8mSUoDlyeN0Lg8SU7M3+lTrVDYjS
         iHouLEschtv7HO2nz9Lzpjav0eSDfmIgsT9Nn4hsNchVesmK4Zu7ZDmwQ2K4TpwokokN
         a5aGK7yB03Ia45Ew8rOA5MugsI7VZS6F9h9VmiM/Mdefw1TNhTs49q1dDZhd3IqKIyxx
         /r5PDA7TDx5CqBoR5hHQUR+MR/DydEW04bG7M5HO5mz3YOvwpFBisdBX5D1WZe761Mf5
         sgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kb63W+UIsuIrJz3AXei8J+4cfxCV44ANkMXV9cCXccg=;
        b=KpUD9bUzzDY4+igW8Nw8kfNWhsBQz/kPsjfVE6v40WX3IOo9WkngsOo8Fn7kinOf6B
         ccpGM8dF0JVIgJ39/dzfF3udcOAdQj2OVpztRtkbM5DWGxO8M5UDs+k4f57VkCFlloeI
         W+RKOU99SGVI2NKDtJiEVBeTpEOUZVH4GhW9zJPhJjZ2W4btRcBs9KKecyF+xAp9xzcS
         erYjpitO9Zqdc49FxACjWiVmYuCv24GJVE7kWEQBkdJ7+kt04kI9Dzy70+d/ttT05JO+
         EHkAy0VMnEn0Cm4LHNwkj0X7ZBWF39JKJRA2GziUi9wwZV3JUyjsDTXw4MqaWU10Jocp
         eraQ==
X-Gm-Message-State: ANoB5pmsbneLHqg0pU5g1MJOia+uEVJg/QrdMQ3LRRml0qSoYntMQS7B
        CH07+ncFttOEmKCgyadJhGpvrqHqxULa3gr1LUkA1g==
X-Google-Smtp-Source: AA0mqf6v4Oku4YPWYpKZedL/YubM1du4LxGnRE3pB9Srgo4LCWZJDt8YSfISwjZdRDSTk8Jimww5m+PQcWGnpt8ZpOM=
X-Received: by 2002:a05:690c:285:b0:3ab:189e:3465 with SMTP id
 bf5-20020a05690c028500b003ab189e3465mr1206489ywb.343.1669105493788; Tue, 22
 Nov 2022 00:24:53 -0800 (PST)
MIME-Version: 1.0
References: <20221121-sx150xq_bindings_fixup-v1-0-e754f183b611@linaro.org>
In-Reply-To: <20221121-sx150xq_bindings_fixup-v1-0-e754f183b611@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 22 Nov 2022 09:24:41 +0100
Message-ID: <CACRpkdb+y=tkFQHLFdKmYDrBhz3h-6zyJ3EDEgxo6eT8Tew2-w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: semtech,sx150xq: fix match patterns
 for 16 GPIOs matching
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>,
        linux-gpio@vger.kernel.org, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 21, 2022 at 3:12 PM Neil Armstrong
<neil.armstrong@linaro.org> wrote:

> The current pattern for SX1503 and SX1509Q with 16 GPIOs only matches
> "gpio0", "gpio1", and "gpio5" instead of "gpio0" to "gpio15" included.
>
> Fix these patterns to match the whole 16 GPIO line names.
>
> Fixes: 29c10bcec50a ("dt-bindings: pinctrl: convert semtech,sx150xq bindings to dt-schema")
> Reported-by: Sander Vanheule <sander@svanheule.net>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Patch applied, thanks for fixing this up so quickly!

Yours,
Linus Walleij
