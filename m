Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE969648925
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Dec 2022 20:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbiLITnZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Dec 2022 14:43:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbiLITnP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Dec 2022 14:43:15 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55A3A385D
        for <linux-gpio@vger.kernel.org>; Fri,  9 Dec 2022 11:43:13 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id db10-20020a0568306b0a00b0066d43e80118so3426490otb.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Dec 2022 11:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O9qpGkCKgXFOxyU0qgXKRH6FfvuG/EK32TWwswTaP7I=;
        b=VCvZEgfeVcxEuLxl3Vf5Aaks+on/Rcc8HKaX1HLy/QSsD6aqVJFvZAnDM6Z+6zOjAY
         NXsjqttOBwq90zvzEVBuVkhWkAw12xJwEJ27uYZeGahjyvg4oxOMXNMrHVgjwkMHOy7U
         q7mVU/0ZmkK+L+UkUJi6gXLn5/fys1utHHWzEm2uUz5YVF5qxaGqavGD4aAACrLHHa1G
         fNNwtld9ZOmKUm+9bPcpv2UAvi60XZpWzlHsIxw+m43XCVCE30aOHBvc+2Lze6dvk3Dv
         O/zkJQIVshLbGso8sSpfGoLnC5QKv7i+jy0DYQ/8c4QW/6k0es2Bc0Ant1UxUx4aMbKq
         /QIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O9qpGkCKgXFOxyU0qgXKRH6FfvuG/EK32TWwswTaP7I=;
        b=5wjtCP7XR0wQTsTeDkpucCc+jDA/McfV7KCn7RnThzqwPP6x/lrv6LDfmTzAdXSqw2
         lzp6gXz5oyBTjbCV1S1RlO9o2lltzoOixELNRevx2CTtwmZOz+j6dFiLK9EDLgHT0TU7
         KviFBH4ODAUP0yBZeIyUGd7+3gTxELTGa3eVrR3Tj9bUff/E55MmHBrMP7HIJKMRvwQd
         qM6/Na3XAOGwxLk4UQmIWeQBmZwTqc+8nv0j730AXTiLdlu5VbFHzMnXTePVX6P9ysvP
         AbBFgrfk/KBDOuKyoo5/l1kDB0F3wkf04FQPXYLJNgMg9xw0H7sk+DdEyRZaKHxqTN2y
         ASnQ==
X-Gm-Message-State: ANoB5pk6NcQpDlXTUJgKPouMvx+Ip4gaHOxT9hlr7t8LFspzS1+lv7LT
        TzKpGjG/i649+NVuy/hX4hsAFCH1kus2RuAqUpgUdw==
X-Google-Smtp-Source: AA0mqf47WmKbtF1kED/nFngCYB/0TEw9NEOJd2hDLnd+RmsXi7mcactDbtQgm3+cVxMjBYmPRokv5kdngvfOmJcg71M=
X-Received: by 2002:a9d:7ad5:0:b0:66e:9c3c:8fb6 with SMTP id
 m21-20020a9d7ad5000000b0066e9c3c8fb6mr11040141otn.338.1670614993297; Fri, 09
 Dec 2022 11:43:13 -0800 (PST)
MIME-Version: 1.0
References: <20221209171629.3351420-1-robh@kernel.org>
In-Reply-To: <20221209171629.3351420-1-robh@kernel.org>
From:   Jassi Brar <jaswinder.singh@linaro.org>
Date:   Fri, 9 Dec 2022 13:43:02 -0600
Message-ID: <CAJe_ZhesrurLB6NK_sVLxPN1vRLtJ8LcoR-7-fmdKZ8Fg=nTFw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: Convert Fujitsu MB86S7x GPIO to DT schema
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Fri, 9 Dec 2022 at 11:16, Rob Herring <robh@kernel.org> wrote:
>
> Convert the Fujitsu MB86S7x GPIO binding to DT schema format.
>
> The "socionext,synquacer-gpio" compatible was not documented, but is
> compatible with "fujitsu,mb86s70-gpio" and is in use (in u-boot
> Synquacer dts).
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Jassi Brar <jaswinder.singh@linaro.org>
