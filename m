Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0122F5BBE89
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Sep 2022 16:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbiIRO5d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 18 Sep 2022 10:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbiIRO5b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Sep 2022 10:57:31 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 572532018C
        for <linux-gpio@vger.kernel.org>; Sun, 18 Sep 2022 07:57:30 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id y3so59219749ejc.1
        for <linux-gpio@vger.kernel.org>; Sun, 18 Sep 2022 07:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=dyWurCv6umTff7vcMJzhKPxGOrO7Im/vE4FnLmopayI=;
        b=py+uqmM2y+DHXQXns/qqCb3l7AXNQasq9XD93G7XbAR9QQv3q5oyGJtXTqT34Vvf51
         xteKNPjjHEpK13pUtnGQ96BPNm9dE8/q9Dc/Wb2I67/G07Mv2oqzx177Cqt9RlzxtOQP
         L3rEWs3HRxcMw6sIMHQSSA+mgEy14aHMVxNfC1b2G1zS+NfK/bawJNY8X2MzMM8gE79R
         T75w3FSVsQdpgZ5bLKnQ2CxCIWiIHYl6r9ND2pkxUb45FbOLcFpeBEpMXt/1bzsF818H
         7U7IbNk0yiVsvSDp2Hy35SuLi3KLfxVyuZ66HrqQ7COcfrMT/HFQSFygCHvsfByZkRzX
         Ft/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=dyWurCv6umTff7vcMJzhKPxGOrO7Im/vE4FnLmopayI=;
        b=JFyXIwezMvJyx4zxh2KrQGoUDMQPYQMe46uaRYd2N2G3YPf0RRzMgp4GU50Su4kzEo
         a+ile4+0agDGJ26cgBGlrslE8ohE7mPt9cQjRtP9+Cgbcs0ZdG5M2f4ooDRneAmortfx
         ZnpknJd8dsDbMnv3mV3omM2s4R6hgnNTV3GhGjx7yNINxHxPQ1RqUzF6ThKhOBAwT8oX
         eyvkYKTbiDkoHTzBueF4Rc982qB3kLeOHeCUO4CzQL6pdOmpjYW/sxH9/5e/iUvJ1sdp
         w9H/gAvKI77SqdddobyRVVWOSNEVTxp1+uUzcHZdeTLUPMHkTCHtr6gFUyt59Dl0vMxs
         huHQ==
X-Gm-Message-State: ACrzQf0azBtawlTSnz+uReGRlXurdenSGbrYgpLcTVoGwWIjfFZl9uj2
        letckcXaNtbNjzdB9OXfYbwtN2Kw4sTPJLV7JG8J4A==
X-Google-Smtp-Source: AMsMyM4gHCdoCTZOpAzWE3ZHy04U3dFyvJdXBikAiGPHZsPCm1QjzXgnd1p3smxr22qT8omxuxygwWfQhAF72ibaRHk=
X-Received: by 2002:a17:907:e9e:b0:77f:9688:2714 with SMTP id
 ho30-20020a1709070e9e00b0077f96882714mr10108201ejc.208.1663513048951; Sun, 18
 Sep 2022 07:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220914071306.3254881-1-s.hauer@pengutronix.de> <20220914071306.3254881-3-s.hauer@pengutronix.de>
In-Reply-To: <20220914071306.3254881-3-s.hauer@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 18 Sep 2022 16:57:17 +0200
Message-ID: <CACRpkdZumA8=dFZ6CzvkQ_SYO62V5YB9JJ32M3-Ta3_6WCheCw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: gpio: Add gpio-latch binding document
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 14, 2022 at 9:13 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:

> This adds a binding for a GPIO multiplexer driver based on latches
> connected to other GPIOs.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
