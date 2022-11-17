Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 205A662D619
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 10:12:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239627AbiKQJMC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 04:12:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239784AbiKQJLv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 04:11:51 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E625ADC8
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 01:11:50 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id f7so1610464edc.6
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 01:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+F5iWVcgnrdzqTiY9j1QAUnZy3iVsRC/Wh3sHGCZWi4=;
        b=LtX/g1RMQt9cXSVGVKP2MDWN/mkziWFTZKiIJ7o7mBkv9dOl7AWs6ncE364jyZC3/s
         i4fLe7LgA9RebQlMYnJb/mmNer/NvTtD47XChEughsfBHOjVHSe8ZeTot75HEF+F+HSa
         GAICHpYZWfWF/bH4Z0sAowijk7vY4kn/89NQHZpTDCLxVwlreQO6Pz0L6eHnkvl+qvFu
         7zmCRpd6EWGARfEm9duTUOWY799ji5srlcmX93hogx/MR6Hy/tARrg1eHeDKuEZz/8eN
         /BFoAbWI7Vavbp6K8WZzBLt5wO84dED+GCxiGVSfrk2RXAqZRE7gnhCYO5s0jUDmk1/k
         QqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+F5iWVcgnrdzqTiY9j1QAUnZy3iVsRC/Wh3sHGCZWi4=;
        b=ZxnRimc/vHfrm8cGucfj4r65luhrgcMIrlOchUY1UUpNQ84j7Z0kjg1mWf2xf4sbMC
         Q3O/7klCnuK9ripepTzinGP5qilaT7D9FnYzBZNdE8uurdHRatryP7MhEqndFo2K7apL
         FUSFds5EquNHPt1RpRxsb/yovLTbZ7Sn5EbFwzurPgIGG98mzaaifKASl5P68cJAiumh
         aiTQQKc8AYm2MVWPYU5QdrmPuXR5+egHEr0wAtYwej9PJD/ef+hBluJBqKtL4AJiqYkj
         a28DbBMLwXhpJ1NSpM3qiKhNPmxYkRSmo49VTz0JrN9B9yn2Ldt/hzLoEqaVKZvLfamH
         kYIQ==
X-Gm-Message-State: ANoB5pkc8mzL668+2pH/s9vzATJdMVolgDUe4YibwrlkYL2MLq7MbhD2
        5Rjh99Uo964EOGou8qZZNXdf7OF09iRv424sVXTBxA==
X-Google-Smtp-Source: AA0mqf5DYdrMDRZrvgQEFjePMZc8XLtptBPspZwl6bU4dGYxj8+nqW7gHSkJWAsBBEQqNHFdnkwrNIe+8V0lQ3SebxI=
X-Received: by 2002:aa7:d5c9:0:b0:463:c64e:bc75 with SMTP id
 d9-20020aa7d5c9000000b00463c64ebc75mr1361975eds.205.1668676309518; Thu, 17
 Nov 2022 01:11:49 -0800 (PST)
MIME-Version: 1.0
References: <20221116093939.20111-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116093939.20111-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 17 Nov 2022 10:11:37 +0100
Message-ID: <CACRpkdZ36JLN_Y7QV5agoCMBf83AH-TCwAvo+yzX6NdkSDS1iQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: dt-bindings: qcom: Second convertions for v6.2
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
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

On Wed, Nov 16, 2022 at 10:39 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Continuation of my cleanups - second, last round based on previous pull request.

Pulled into the pin control tree for v6.2, thanks!

Yours,
Linus Walleij
