Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B77B360092D
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 10:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbiJQIvz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 04:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbiJQIvj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 04:51:39 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C88A4D4D2
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 01:50:57 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id y14so23246584ejd.9
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 01:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4WEVYazpln+Lxr0NdQpmOEi4ONTPjmDRCzetzWeTg38=;
        b=zyBu8DQrZTbPzWGlRwWZj9SwbQoqfayeoYDSmf/U7hVPbVYolsJjvoTvmboF94/wDh
         wAtbfpWPHMZYLa1FdLOiETMP5S6Bd2k4jPoE0DE0VMV96GN6xeH8boDbrQqPOBjHXS81
         h2zQVYJd/Rq5DQt5HsmSw7nCjtSfKncIjb+u1VRz7euACsZjjBygQJWwfnD6JLHkDiaL
         LONDTC0ZG+e9XWLo+MO5VAm+7pqMpI8jSNZCsVgRuwQnArkyjL96wIm2HnH3y6/GBnTS
         oj+d2YCDA5nPHO9Zbthe4EBWugeKyrsmGFBwVf0hTwANAibgQj5MghQHrKrY96C5ZjUg
         QF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4WEVYazpln+Lxr0NdQpmOEi4ONTPjmDRCzetzWeTg38=;
        b=sOBSmdGPucCxnYVjmZL2bTJ17GppZ8RGcYN1Twt/Qmk9Mf1Yh4NC9jSmz0vurRdkxE
         hJbthkW5cMwg33u2YDTlPlcqxpDgg8ai73YuBiujM/Sh73XgoJIA43BYwek8b+p+AyO+
         In6xRW/t7xAJlMq6rlV6BE2/q5Q5N4CGE5/1oT+0wu21PEE0xLnUS0SmdRIihnSYMMBb
         1IlwJ+Va5DhTts3YOCwavlLK89mHEmCSAtLL9B0TJn/wyGfuqYghT5CZQ843PmeuPJWW
         V9L1DWgiTqydMgGJnoeyCXYnL7NiFcuKmo8vVwPswCxEWrWoUmjwfD0ZIq0dnZJqRUdS
         lToA==
X-Gm-Message-State: ACrzQf0L22VC99i28ZW+fscQMme5OdA2jcmwf/hK87SnKkq4FY7YIDX1
        /yK50HA0MnDysaiNYuuNUrHpX3bcEpy5TPZxbBeuFg==
X-Google-Smtp-Source: AMsMyM55YYUNsJN5BiHD5wHpcXqrztop1+jX5Dm23A4mskfjAnyYZ2QreG0m49JAtDm+uWow7233VHOFqgblVhqC+rk=
X-Received: by 2002:a17:907:1624:b0:78d:d61c:2b4a with SMTP id
 hb36-20020a170907162400b0078dd61c2b4amr7651986ejc.208.1665996655433; Mon, 17
 Oct 2022 01:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221007114647.2723457-1-s.hauer@pengutronix.de> <20221007114647.2723457-2-s.hauer@pengutronix.de>
In-Reply-To: <20221007114647.2723457-2-s.hauer@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 10:50:44 +0200
Message-ID: <CACRpkdapjEt8g7zMw8smvJVpvf3TFNNH8hJge1cSp==qYcU2ZA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] gpio: Add gpio latch driver
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        kernel@pengutronix.de, Serge Semin <fancer.lancer@gmail.com>
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

On Fri, Oct 7, 2022 at 1:47 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:

> This driver implements a GPIO multiplexer based on latches connected to
> other GPIOs. A set of data GPIOs is connected to the data input of
> multiple latches. The clock input of each latch is driven by another
> set of GPIOs. With two 8-bit latches 10 GPIOs can be multiplexed into
> 16 GPIOs. GPOs might be a better term as in fact the multiplexed pins
> are output only.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

This looks fine to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
