Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F06547D2C7D
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Oct 2023 10:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjJWITf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Oct 2023 04:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbjJWITe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Oct 2023 04:19:34 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE1AD65
        for <linux-gpio@vger.kernel.org>; Mon, 23 Oct 2023 01:19:32 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d9ca471cf3aso2896443276.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Oct 2023 01:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698049171; x=1698653971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HC3BjQKSRGbfGvKwk72buIonbCnddDV5SKhzPxi6MnE=;
        b=spBhu2pfvAg3IGMZDq5IrdF4h+U/n31rcG2nOA2VVtqnQujLGsuY3lUrNQH991hC7r
         3x+/rez/RvyrbF2Ewc+WmtECAov9y+V4pHh2JSnnAhLfShNlS3vWDikg9N0UD+q8e7aP
         BOJgG8OIZkJYDqmBl072tJCBCtWzIH7HHOCc9PVWAf25Q4jQ6gk4WhFZbENiVBfBfdKn
         nnDlE5KyJlTsJcrLYy4lJAv4rd6mnfmkvysxdUazkINTQf8JlLPfXTlLJN9BkBbQ69t3
         FNIvFUBW6Gu3XwT2SnumuOaOu3cLS7raPfoMYdKmtUGGqOcjDzfy5iXZf5tEOfHPlmdM
         ZX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698049171; x=1698653971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HC3BjQKSRGbfGvKwk72buIonbCnddDV5SKhzPxi6MnE=;
        b=Bm1YPUQiIqGlLTuuKpb61C1bbZC8ay+TJ8nHxxYMzSTlg5b7M+v4yucYGPgBtMkyDw
         uGU15qxcJEpBuubVDnY/4OJqSZlCfKWc684v7DltFUl4H+t2ulf9thhHvzqOsXgYUgzS
         V3BEi+O/rT6Mlqex0/xuCKv3ITtNg5lOyXpSkZshH7B5nSpEcwP9Xerq1dSFTvVfQrka
         kNUP+hf6p3SBgJnhdjbf8G7a3Cl4MicGVQ8UNzD3k2/32uHdB5TGZfWoPL8PpxZYKrBa
         Tm2aUnIOt7g5leIany2zcDmgRVOhZsnFZxAdvBox+/Kd+d77vNRQAAgkc1IVHvJPmCAB
         dKzA==
X-Gm-Message-State: AOJu0Yx3M40IpK3JEzgpt3ArEYm2EFOao5t30ERjvNn2sjHjvKyXGmjy
        ux+GJicP8ED8fuoMCamQm81J0nTb7d0EyRzW7KD0YQ==
X-Google-Smtp-Source: AGHT+IFls47LNKk09hu89xcHyz6kQUqlyPLDSWRDcL+rZTMYQ0ze1963EHbVyobakwo9izU/36AdkSpBhIA0fgYRRXo=
X-Received: by 2002:a25:6985:0:b0:d9c:c9a8:85cd with SMTP id
 e127-20020a256985000000b00d9cc9a885cdmr8511428ybc.61.1698049171488; Mon, 23
 Oct 2023 01:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <20231013145935.220945-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231013145935.220945-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 23 Oct 2023 10:19:20 +0200
Message-ID: <CACRpkdZUSkr2MLB870Y5O2Qxvbnz++XUKMm+BXG1yx9vrOEvwA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: qcom: lpass-lpi: allow slew rate bit in
 main pin config register
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 13, 2023 at 4:59=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:


> Changes in v2

I tried to apply this to the pinctrl devel branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Ddevel

It doesn't apply, could you rebase it?

Yours,
Linus Walleij
