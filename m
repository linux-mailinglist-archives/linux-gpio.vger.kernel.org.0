Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B328663A4C
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jan 2023 08:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238069AbjAJH7M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Jan 2023 02:59:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237682AbjAJH6o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Jan 2023 02:58:44 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4B7D49168
        for <linux-gpio@vger.kernel.org>; Mon,  9 Jan 2023 23:58:02 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-4bf16baa865so143836427b3.13
        for <linux-gpio@vger.kernel.org>; Mon, 09 Jan 2023 23:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qq0p1nbItdJ6ml7TEiox7aLYzhDtYgaXKvEnkphIMZo=;
        b=zl9SYem24/egt7KSne70ItzNplyc4RaeOVz1ikEiBN+vCJ6ArWdyXQ3CC5DeiOSGt5
         48KZchtk+ZywqgNIP00ff61UyDjyYq+PoP+1C8vVnuFPDdne/wlyntqZD4pAjCYaDBtq
         JKYTYDyKClhl2ubziUCoFSgJAw/6m9NqE4LWGoLaavx1p1T3pEsw195uwINdkVWFtZV4
         R9RL4hDPfH0l2zpJHmGwiRe2/Kr7naAwhEb9Qryxl6G3WC2k7lu81jnTxervAetelWkN
         Aq8QpA0vcoAAPH1ZKZ+PhJSdvC18g524m0QIMo2DS29blcoDou8hdM36s7pvYiqanMx+
         0Cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qq0p1nbItdJ6ml7TEiox7aLYzhDtYgaXKvEnkphIMZo=;
        b=wI0RO1mVNoff1XIv/ahomapGicYD9LX9geEHXKOepw58Vv/16JV9GFw3Q+r8dEH15F
         JGYNF4SVCaBhEdjH/oKu2RpHT+S/GCJrm95wtFwjIhgN8qtcbbSOjcX2rIXKONTmxhrY
         5umklLIaZr5nFxWG5ml3Q8gj54SVHuqTdYuprnQmrMbb+7lrAEcQC58E7bJKRuWSSKT2
         DhckA2b8Oy/LJaVedg3rPUvM6SQkUTxXzS34+WJyiUh72y63fSkMF4YSZTjKljqTxJb8
         ndNu2Lts+hAmzVHePwSAobcfXwcp0jVMEBOX/qwRUiuX2I34LXbrPE2ZusmhhxvPLhlL
         4qpw==
X-Gm-Message-State: AFqh2krvrj1GkVADBdJkvETcN+kx1L9naJLagChKwgNIviDSJ2NPOUxK
        jtk5xDOdMfd4JdmrN3P26eHGv9i5HIkvGyh8DZ5f68ivKyAm2Q==
X-Google-Smtp-Source: AMrXdXvTMMm7Ub8ElIqw+FOLuZZsoiGCIUIi++horW7FXhTzxh4aBm0Fjpi2NKH3Iuh09zUB6LR28K+m29XyYe1cdQc=
X-Received: by 2002:a81:9c52:0:b0:368:e8a:3b1d with SMTP id
 n18-20020a819c52000000b003680e8a3b1dmr1195100ywa.469.1673337482073; Mon, 09
 Jan 2023 23:58:02 -0800 (PST)
MIME-Version: 1.0
References: <20230106114403.275865-1-matti.lehtimaki@gmail.com> <20230106114403.275865-3-matti.lehtimaki@gmail.com>
In-Reply-To: <20230106114403.275865-3-matti.lehtimaki@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Jan 2023 08:57:51 +0100
Message-ID: <CACRpkdYa3=UnzeYeFgurFH8Dyq+NBQazSFK4qiUP==+zdmYRKw@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: qcom: msm8226: Add General Purpose clocks
To:     =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 6, 2023 at 12:44 PM Matti Lehtim=C3=A4ki
<matti.lehtimaki@gmail.com> wrote:

> From: Luca Weiss <luca@z3ntu.xyz>
>
> Add support for the general purpose clocks that are found on MSM8226.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> Co-developed-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>

Patch applied!

Please funnel patch 3/3 thru the SoC tree.

Yours,
Linus Walleij
