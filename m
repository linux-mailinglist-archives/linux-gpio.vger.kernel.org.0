Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BABC6B612C
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Mar 2023 22:49:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbjCKVtU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Mar 2023 16:49:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbjCKVtP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Mar 2023 16:49:15 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9058F4D61D
        for <linux-gpio@vger.kernel.org>; Sat, 11 Mar 2023 13:49:12 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-53d277c1834so169178657b3.10
        for <linux-gpio@vger.kernel.org>; Sat, 11 Mar 2023 13:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678571352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TpdXBJ4tecgiTETU5KnmLKGnqvFo0uE6wI/ZwKi060=;
        b=nE/bwkjay8CbXb4jPjZdl/Xsenzw4L3dSxsKJNwylYD1kFCBR/VR29gvUWor8ha8a9
         28VY66ubXweop+orgHdwvtya2h6b46vDvAGq8/5HMdpUy6HndbuJeZ+WwZmpkJnxTPav
         MX0ZDk1UddZSqZ/ChtapzciOcUAyP+xqRa1gLni8+GvQex7Wn5L+r/meix4mfGaWjH8l
         BQEkhMS1JufERKr2Nz4Gj5LTnVTHWLuPOJzsF6U/WBX2qdeeJa3qhpEn9tc9yCbfV3xo
         Pj/5WWV0AOLzBzELjebOlRM33/gK2NCRG6PPnz7Fs9ifuYTqStjgc2AeFAayc7MoncpV
         DjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678571352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TpdXBJ4tecgiTETU5KnmLKGnqvFo0uE6wI/ZwKi060=;
        b=yI/FF4zIlSYpaeqlmn2UYKsxrjqsoCkITfaqvGzOwCJD9+AQIkByCeTq4o8MFLD/yj
         4KKSDaKIMwWBZnOzRG/7kBFab65YPro2Kr+QzFQwPTf4m3utUh3/wAxYN2ZLRoIDw/XB
         MqSfcLPzAwPGTBAvnpUfrgF4dQIlNe2dr8JfhnMcyk316EP5Vjl+9LNnYvcVsbO6Y5aH
         UPfg9qoq/olRIVFAwnV4BHMU2B5MTi6lt/1VbNnwVYaXLNuSIA2+qtV9u4+8qMYTAWvc
         t9AbVIYHCujwcvQyS6LN2gNVTtw6uci/YwBu43140w7lG55MWCSAl+AF6veonyWUJUQc
         oVPA==
X-Gm-Message-State: AO0yUKU3jSPlQ5i+JkIw4FIX6S+bC6MXTTKKO4UCAFd5chi2Q59tHz1D
        EV8/e0n+qb+cD4h7ZYMoZEG5YKU1O2zmSq+BAmQTLQ==
X-Google-Smtp-Source: AK7set963Uvk9/kPnpPMiLrCaYWls2se8kVKHqPvoVj8mQ7gkyPTgu5X5El+InCrUfj2HTmmNHTNnoloTVd+fRthoCw=
X-Received: by 2002:a81:b705:0:b0:535:fe26:acc with SMTP id
 v5-20020a81b705000000b00535fe260accmr19655281ywh.10.1678571351836; Sat, 11
 Mar 2023 13:49:11 -0800 (PST)
MIME-Version: 1.0
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org> <20230311111307.251123-6-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111307.251123-6-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 11 Mar 2023 22:49:00 +0100
Message-ID: <CACRpkdb_t+RNSaxq-h6nz8R6Z6d=SD75m5w1tzVFn-qa5pdyVQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] gpio: sama5d2-piobu: drop of_match_ptr for ID table
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
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
>   drivers/gpio/gpio-sama5d2-piobu.c:230:34: error: =E2=80=98sama5d2_piobu=
_ids=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
