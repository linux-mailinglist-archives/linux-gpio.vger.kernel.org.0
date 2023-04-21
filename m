Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD4FA6EA5CD
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Apr 2023 10:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbjDUI06 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Apr 2023 04:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbjDUI05 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Apr 2023 04:26:57 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8A955B2
        for <linux-gpio@vger.kernel.org>; Fri, 21 Apr 2023 01:26:55 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-b992ed878ebso1200123276.0
        for <linux-gpio@vger.kernel.org>; Fri, 21 Apr 2023 01:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682065614; x=1684657614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAuTtwnqd4lYOEj0afl/oqM3QX+uTDaG/z7kPpmXMgE=;
        b=FnAG5n9T3CD6MkdDL3/tPICCqZcLHI/s4UBGK7V7gpdZvmEqzDQGicUK9q9/3S3+Xb
         nRCokJZNgnJYEtFgUY45U+1/ZPKdE3FghOazEEoYcSL8o/BU6yUqJeZMnlJVI8VSrnTq
         3j+yfjW10H5AajWw1gYYA/SdMdSOeyKigcAFySQ4Os3JD1v07pg27apxg+EWC0Xjyi7h
         wg1ZZokiPn5Tmw88ZXN4MfHOm4yNQDlIGgwp3Ui3YzZ4X9I9bX7H+9J2V47HK65xN9sF
         gorzPCtNRDANru/Auc4m9nQ7vB0vnQ13COO0+tBNk5isKTUQ5U9GdAYiqmIvupvmaOfm
         XY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682065615; x=1684657615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAuTtwnqd4lYOEj0afl/oqM3QX+uTDaG/z7kPpmXMgE=;
        b=QNYWE2S6A4743B5gATVjTyHi5FO96u/keNnkg+5lAMzyCYKR0N+UPWzQ7VGh9wOMzw
         CA4oT/kNhtpdTFsyiW0xMdjdO2UWOkwQGnLvec+YB+gQjsuYYvRC3s8KzhrSEmwWmYNQ
         0xwxH7wkMnD7Zt7IeB95Yg6x0p2UX5xWWUHyd+3KFNj55ounJTODmTz13Gv5/83AKinR
         YXlJWnqPvKtaQ88vuJp48nrhSLwLVn/jox8H5wgkXkcmZB4cVwXYZtEsLboHsVQM/UiI
         1W0AZw/vAxtSJEsTNu7Aef1fK6HacS8ujDiXNOgk3tYN0oIZ7JOvdaEnj/juUoVchZmb
         ToJA==
X-Gm-Message-State: AAQBX9cxQqH2HD1FJfA/PzfQ6B41kqMMApKqva8pyuTwNGfCWuOoeHKB
        J7wDTboYl4z/Sb1n3c2wtArysGdo6Du+aaz6yBhb8w==
X-Google-Smtp-Source: AKy350Z8XcyFNX2JboNAaFrt3oSnc7DS4Jc7Id9gYXDPevkIo3K9uThotJdC51FnQkL/TPRP4jQP8FzcMgBbAAn2v24=
X-Received: by 2002:a81:12d3:0:b0:54f:54c5:70d with SMTP id
 202-20020a8112d3000000b0054f54c5070dmr1414029yws.20.1682065614765; Fri, 21
 Apr 2023 01:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230414-pmi632-v1-0-fe94dc414832@z3ntu.xyz> <20230414-pmi632-v1-2-fe94dc414832@z3ntu.xyz>
In-Reply-To: <20230414-pmi632-v1-2-fe94dc414832@z3ntu.xyz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Apr 2023 10:26:43 +0200
Message-ID: <CACRpkdb0oncz5UB8vtu3csvBQXojvdxxfDMPrnGeH3qRBr6=AQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] pinctrl: qcom: spmi-gpio: Add PMI632 support
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 14, 2023 at 1:18=E2=80=AFAM Luca Weiss <luca@z3ntu.xyz> wrote:

> Add support for the 8 GPIOs found on PMI632.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

This patch (2/8) applied as uncontroversial.

Yours,
Linus Walleij
