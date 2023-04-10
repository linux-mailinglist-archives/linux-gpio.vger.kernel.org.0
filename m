Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4619E6DCD44
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Apr 2023 00:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjDJWJf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Apr 2023 18:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbjDJWJe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Apr 2023 18:09:34 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4620E6C
        for <linux-gpio@vger.kernel.org>; Mon, 10 Apr 2023 15:09:32 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-54ee0b73e08so127261287b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Apr 2023 15:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681164572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExqCcoy3bWj9jdGV9Q3NacWOqs4Dtk8vHL8H1J12RJY=;
        b=BKqvHMuHlRPIU7wXVr5olsFhIZQX++5QDybdKhcnOhN4x4kl0/zeY+UqXC+V8SjSiG
         jruquk5A1NRODV6/T+RII1S8IJ+qQAEVFbsKDjCQuadaVc8MC0d7fOIH2mzsShe1SHne
         niX+lSoCCi9RrDLsYAqtH4S98S9BKsDGPhfhCOhqgE1QjGuHBarkz9zCOFBKjkba+zDO
         ZAg5AY1YZPOFE5zCKJxCQlUa7nQzZr9GSrziAkjpr6RZetzTNZVqCSQhhE9MxuabRnvX
         LSPqpT9Ua+N+xcIpy/Dtc4Kd+jDSogAAt597r+bscFQ3DGoCFEPhE6hqHWNNiOX659sg
         4bgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681164572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExqCcoy3bWj9jdGV9Q3NacWOqs4Dtk8vHL8H1J12RJY=;
        b=z2bOgfyqRp3jzwFtwUqrDkOPZdclt0aSwXMFWxv50+8uQjO4qm6pXb6mWXzl5/wRcc
         u4vca/ans8OEK+6dNvzI0i4MAPlvCb+9ol2aAo5XB/HhxCKljUDfTBLPZ1obZyQJkc0e
         bPw7zLUrwmWLOAkMD24pPq4HKqVZWJZtJuCqtMBw/UP5qzwx8ua8Yw9X3YyLvc/MWCQf
         oWnBaDt7IcxiSG7LhNKv58E/LCMz4OmMh1u5MwPDwenconrIU9iGX9P17WC/RINlg+NQ
         7r+xCxDL5VdnJdnSGTx4ZGl5nq5q5GhHqP3VYVq6IrSqJ/gTyxF+Yguy/vyoL+Z7xU5k
         VdFQ==
X-Gm-Message-State: AAQBX9eRY1bS1kqsst8P8U7i9dTwRybBJDsxzML2ndexcfn+TJiSvoVs
        dzP5Iap5YodyZDb5N/YHW1nFjxvelBWPw+2PXvriBw==
X-Google-Smtp-Source: AKy350a26EOdXNrw4MlpwtY9Dz/Z+hhGFiC4d9G8eVMorvZSwWjglGmlnnmKRrMbFTj8viOMnnU18qFJFz1Fh/3VdYo=
X-Received: by 2002:a81:c904:0:b0:534:d71f:14e6 with SMTP id
 o4-20020a81c904000000b00534d71f14e6mr6436772ywi.9.1681164572146; Mon, 10 Apr
 2023 15:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230327125316.210812-1-brgl@bgdev.pl> <20230327125316.210812-13-brgl@bgdev.pl>
 <CACRpkdaYHaJMn7w_q12V3Q0WW71-U_kb+XsR1tNsirF35xYEoQ@mail.gmail.com> <CAMRc=Mf3d+ZmRs+Rj2HeWifoL0Vqzszxh_hUFDFq4eyvfgKQ4w@mail.gmail.com>
In-Reply-To: <CAMRc=Mf3d+ZmRs+Rj2HeWifoL0Vqzszxh_hUFDFq4eyvfgKQ4w@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 11 Apr 2023 00:09:20 +0200
Message-ID: <CACRpkdYZj69yVitTGV9h5ytec5pFKKQwGbhPu1Ahc2HBfsqp1Q@mail.gmail.com>
Subject: Re: [PATCH v3 12/18] dt-bindings: pinctrl: qcom,pmic-gpio: add
 compatible for pmm8654au-gpio
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 6, 2023 at 4:09=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
> On Tue, Mar 28, 2023 at 3:24=E2=80=AFPM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> > On Mon, Mar 27, 2023 at 2:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> >
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Add a new compatible for the GPIO controller on the pm8654au PMIC. It
> > > has 12 pins with no holes.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Acked-by: Rob Herring <robh@kernel.org>
> >
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Counting on Bjorn to pick this up.
> >
> > Yours,
> > Linus Walleij
>
> Linus,
>
> Bjorn picked up the arm64 patches but these two were skipped. Can you
> take it through the pinctrl tree?

OK patches 12 and 13 applied to the pinctrl tree!

Yours,
Linus Walleij
