Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE84609C55
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Oct 2022 10:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbiJXIWc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Oct 2022 04:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbiJXIWD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2022 04:22:03 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D2CA44B
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 01:19:58 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id a67so28244173edf.12
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 01:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wAd+z832IACUb5Z6vyprRMQoZ4Y4EGKURedvnDFnKlM=;
        b=e+g0UrqrJwYjslZSd0zpoEDfRV/pI358mrvpP0B7hfEMNN7VOesX1wGGgxRSuiIAmI
         HUvFPwS1396j4bchEEPCqjFnFgkDBEt7N1ncLttjNMNKtafCLOSEKJrls96OgRLa0GOp
         G4C4jQfZ0Q93RJjGmGBQkdtRKlBIhIPE9uO8hkFhEQKsnIvu6u8ZUjp1GX8Tjt6NoNF1
         vM6f8+xYfWndD+elNvL9dKFiuolNsnjNloe+5/3Bafqv0+aVuwQDSbGIfXfsfBSPNzjn
         8kf0RhXCa+lj70zEL0TZ4hIt48CZ0HhErtN2VmMrmfPcy98gKA7EDLrYX/x7sensPgjZ
         hwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wAd+z832IACUb5Z6vyprRMQoZ4Y4EGKURedvnDFnKlM=;
        b=waD052owRbINcOWOidgPnlYJMjRewYgfTHKUvUkL6vRfWPMMkaSiYbefaoIuUKxVMp
         erwAHl0APWmjfk+TONBpca7cm3fnMdO4PJXDga7aH5FwVGMnEDiGe+ZwNU2LoYimSvfQ
         Jaqx7CjyzzDnLFJEG2DzLQo1i3qoevmv9n5bzeh4wRm8fcZZozZi7WZW8zmuv9L9k5l6
         40BZvbR/LJHFYNPALqf7GSfRLSVSrZY8E/ewQFYGWXfnAlkm9TNJYvQcC6DIseKjVv+U
         1U2RS3KT+6EvPeYihps7X7SDjrzpNDiSGBFwEstftb8/6WeNoRgDLGzYnFt1mx13RkJv
         8k0w==
X-Gm-Message-State: ACrzQf1YESiq32VLPd3Q4fd+biKYvthsUeI3t0vaG6sWCQ5IxOtcWCbH
        ELxCCymGaapDXDHKqp0pHc6862TUSU6PxyYQ539lgg==
X-Google-Smtp-Source: AMsMyM7OKBSA0PuzKW0IEF7bPcUhITXsCcreBHzkHZGbNqsKHgI7OkOEbuJMq+EVIC2V5/A7bH/4eUJzVlfKS3Er2Q0=
X-Received: by 2002:a17:907:7606:b0:78e:61d:757e with SMTP id
 jx6-20020a170907760600b0078e061d757emr25038174ejc.690.1666599562289; Mon, 24
 Oct 2022 01:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20221020075650.1031228-1-yangyingliang@huawei.com>
In-Reply-To: <20221020075650.1031228-1-yangyingliang@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 24 Oct 2022 10:19:10 +0200
Message-ID: <CACRpkdZtk-DuoWqqVAW-HUPKj4h2aDAUmmxs_tqYx0ROxC-Y0Q@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: qcom: sdma670: change sdm670_reserved_gpios
 to static
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-gpio@vger.kernel.org, mailingradian@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 20, 2022 at 9:58 AM Yang Yingliang <yangyingliang@huawei.com> wrote:

> sdm670_reserved_gpios is only used in pinctrl-sdm670.c now, change it
> to static.
>
> Fixes: 61164d220f52 ("pinctrl: qcom: add sdm670 pinctrl")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Fixed up subject and applied!

Yours,
Linus Walleij
