Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 967D66B6124
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Mar 2023 22:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjCKVsa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Mar 2023 16:48:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbjCKVs2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Mar 2023 16:48:28 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69FAF25B90
        for <linux-gpio@vger.kernel.org>; Sat, 11 Mar 2023 13:48:25 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id z83so4485520ybb.2
        for <linux-gpio@vger.kernel.org>; Sat, 11 Mar 2023 13:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678571304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jF4jSS4OasbZk4U9XuZ/wAPD2HfWZvgc6z7TV94mIo0=;
        b=xGxTaeZQGxhou3gJGzNPPC0r1ZSbKzbb96fonKZLFMczDO62qIJwLSfk0Cw5yNgxdo
         e7wKPTskfPixT0ahvxJmEo7SmBqfYaohdVVIwKQhcWzR8COHFQKthSnm2IZOLchQA9Ko
         OEOc3cq1q6BslwpN/Qvxg0dIT52GOUFjMRE41dBs5YsfovcrtQ6TlWGV58Ht5Lgo2aAW
         fbo2AS08fJuj3QeMXXy6Ap03fBMmF2uHvjna4pD4Wx3VmA5N1O+2TTZsvXWo/ugORIgc
         Vzy3jaNfuarZ3Na+WOD1V8EIaJt47Quk/lNRTlOe86A++aXXRe161nyhrAlujgfJGm3r
         0/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678571304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jF4jSS4OasbZk4U9XuZ/wAPD2HfWZvgc6z7TV94mIo0=;
        b=5d3Q2Oowr7BjNyiZIWOCCjzGTO2YEqa1K8syg1J1K1eO6o/iIxu1d4dVAx4eerZZz+
         EHG2JFYHxwrPRZk0kFLW2ZYem+sJbCS0vKn3ykYejG382sxq7xDfSkOe2Tvuw8tCSUvy
         6aDEGPfNxcoO8NAVRFr3YtxAIqlhLV3Kwhw2aZLtuHR2JWGnzGL0XlgMKwfIZvzup5B0
         g+I5ToU8QXuz78fPnaOJSjh49H0TLhked+HZ8VIbvGrfe0rHrMIwvqgNA2NIy8OhvfkB
         3DUUXqXuuhi8Kjxam3ldYmc/JxxJDw4cynBHqLk6vETStbvV4V44PjcBiXCb2KAoAt//
         Ny6Q==
X-Gm-Message-State: AO0yUKV24Y/ZyJyfUmU1nb8AUhhxJff8Ey2kLXdvncRERny1cEI14klh
        7EcQXNtlquKYuYWcGl7M7yUTHxfUdzcfEPheibdWGA==
X-Google-Smtp-Source: AK7set+RBXbsTa+ZxAOTcuKBxqKu2MRGa2ZBNeMZvsqp53WuxZEYmcTvI047DvIsyfSBCmdCVtl5FogFQtNmQitOTGo=
X-Received: by 2002:a25:f904:0:b0:b27:65ca:f35d with SMTP id
 q4-20020a25f904000000b00b2765caf35dmr6534892ybe.5.1678571304594; Sat, 11 Mar
 2023 13:48:24 -0800 (PST)
MIME-Version: 1.0
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org> <20230311111307.251123-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111307.251123-4-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 11 Mar 2023 22:48:11 +0100
Message-ID: <CACRpkdY6Dyq8VHLDqBxfiU6spLdNXOScja7JSe3-hwXqW1je6g@mail.gmail.com>
Subject: Re: [PATCH 4/8] gpio: visconti: drop of_match_ptr for ID table
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Mun Yew Tham <mun.yew.tham@intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Nandor Han <nandor.han@ge.com>,
        Semi Malinen <semi.malinen@ge.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Mar 11, 2023 at 12:13=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).
>
>   drivers/gpio/gpio-visconti.c:187:34: error: =E2=80=98visconti_gpio_of_m=
atch=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
