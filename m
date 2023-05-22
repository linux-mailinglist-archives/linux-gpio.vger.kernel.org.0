Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3993670B690
	for <lists+linux-gpio@lfdr.de>; Mon, 22 May 2023 09:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232549AbjEVHcc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 May 2023 03:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231820AbjEVHcb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 May 2023 03:32:31 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A82AAC
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2023 00:32:29 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-b9e6ec482b3so8279724276.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2023 00:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684740748; x=1687332748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3nKRFXxsoHjfjdv323ChY4z/ZbZPhs8kEfFA/b0p14=;
        b=ZQBKBNbhyGusoEZNZncEPEovCz9ZtzvSsUhyhSUHyzXTHxM4pTaAFa4m9WSjXG3JtY
         Cpp4VN1YENR0DDoAf99GIkp0+KSSIAUV1PwqgbOIsE9KP7QESHwE7bijzkNwtxOt8/jn
         SRTJr71ARxr7S7iyMsJ3cjvugn0Cz9iFXxkA3+AHQ3tea9YqTKuKM1srZu4dZuuH81d8
         +x9dVC95WW8NMbrLtdS5OzsQAQmLeaHPPYQe5WZ7mtTE3QqkdIlUDVHfXjPa53ZHk7iw
         HFOT6bsAmfR1jYA1L3yy1st3FFa8IuXPvy9PeMAo1IzzdUKSAE1R6PFef1EYITbTHGpO
         Ka/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684740748; x=1687332748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3nKRFXxsoHjfjdv323ChY4z/ZbZPhs8kEfFA/b0p14=;
        b=TlPRuioQhJ3I2jjki6NkD211peOEJ6yTXTUiHVT2NyiOG6pAhEYGD1okGwLW9iLQet
         KSy+J1QeizJaJ0PUkHZhT7355Pxm4+g4FzZPl2MYsjcKduwyVf9XNmwJNEzGXjTywf0+
         i5UOrgDkEQahtz+Lkf2u4PNjosO86CWTR1OSOtlyDjM27MdJBDT3Qf0203Zy1xYbvqBD
         j6C7sQIzcapnKgZ9lM6E8zMZ/3dc0PgLfx090G8uHYTWubfDB4sYS9yhmxg8RbCv2CIi
         YY4E/KUxzgXC8O+UcWUz9dGSgtlgAyS7NxJkFZfwe25aWgRYhIFhSlSH6kzH61pcdxdx
         k4kQ==
X-Gm-Message-State: AC+VfDwK1mJgem0VFaPF/NYLaSxAk7Ne/1rkzzc8z0OYzrmrayFnKOED
        Cjg7URMG+B+38EQqQC1xZ/XKGzOP0nBBv8de5yjk9w==
X-Google-Smtp-Source: ACHHUZ4FkKkNnOjIqxj6cR6guYodDfCoBUf70rR+UN4AF9syzuN5i3kPXu5WUGJ7anEuu333nuhHkKPkvWZV8hR5tx8=
X-Received: by 2002:a0d:d595:0:b0:561:e910:52f5 with SMTP id
 x143-20020a0dd595000000b00561e91052f5mr12470156ywd.27.1684740748447; Mon, 22
 May 2023 00:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230519125409.497439-1-quic_srichara@quicinc.com> <20230519125409.497439-5-quic_srichara@quicinc.com>
In-Reply-To: <20230519125409.497439-5-quic_srichara@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 May 2023 09:32:17 +0200
Message-ID: <CACRpkdaX3i-O3=8XbLYJ1hXT8dOE7WJUUT6JxOKmWTJwru_24Q@mail.gmail.com>
Subject: Re: [PATCH V7 4/8] pinctrl: qcom: Add IPQ5018 pinctrl driver
To:     Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robimarko@gmail.com, andy.shevchenko@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 19, 2023 at 2:55=E2=80=AFPM Sricharan Ramabadhran
<quic_srichara@quicinc.com> wrote:

> Add pinctrl definitions for the TLMM of IPQ5018.
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Co-developed-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>  [v7] No change

This looks mostly fine, but I want you to consider Andy's remarks.
With those addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Can this file and the bindings be applied independently of the rest
of the patches? In that case I can apply v8 bindings+this patch to
the pinctrl tree.

Yours,
Linus Walleij
