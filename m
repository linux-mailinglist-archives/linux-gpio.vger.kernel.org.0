Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86A145619C1
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jun 2022 14:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232946AbiF3MBh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 08:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233863AbiF3MBg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 08:01:36 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0F0F74789
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jun 2022 05:01:35 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-3177f4ce3e2so176591427b3.5
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jun 2022 05:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IvKEIjzjU4LPTr3SH+n5s231w0NrZo/WhcQOyoRJxbo=;
        b=a577l4Vwc0EvrQPcjQ592IpDDOqs2LH+70gy+iEjdBsvx/M+bx4LDU/okbZz+EzTqi
         xSieK68x+/jTJbzDuRhio2KXcNXf0mkhWxYirTxSaHR6mIMshUGdnfcgCiZ9AwdRQSgO
         25NyP8dFEV3pN3d1oHjNF6ZqiAFATjrBn6Egx98w5UfA20iSIrbR6ezgv9/C7D7PlpcL
         30bbGK+9O72XSPAJ4koLw6SCMjBK4qMLY3vvYmD2EBRMEibfqNTR/vBb7jSifBVshGc8
         Eeex8qLNzbVVxBPymsKqZ94yfUM2QzbBq+r67bcDv/t8Ql9tJPkhkYXnrbi5mGtDoEFP
         XgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IvKEIjzjU4LPTr3SH+n5s231w0NrZo/WhcQOyoRJxbo=;
        b=hJ0dJSjb2QQEoV2g4SqCjT3UjfnvvczmYzrRJMrEp7bCix+9noBL4KDzlWvWKoaF2o
         DlhGI/7qZsWXgV39NqXaQKbQ5TOuxWaanNrrfv1YAP1zSh9xlQ8iR794IA97VeB14AiZ
         8seGyrB5Wc6NsLjCgAaSRckTnIBUQB2evbyWqqmLkDV6pqoes41yUGz7Ox26pB8ykabK
         lOpZ4atUg7O1QJVchzJv0cD/4dDLHLRzV8gxP9u6moVi4X30TNtuOyVW9l2S7i31RonE
         hE0vAmgNa9/zmnzl0wuyIyXKaAYbT8bMBsBIhA/gnlJBi7VmourhQ7WUA+JaptkeSzVk
         7aVA==
X-Gm-Message-State: AJIora8USZ0MIzMDpVZ2Ja1+3uGuW25KZs0qz/nDJWebhWPo6o+lTo76
        h3lGjBuebRSYnqjtQGQXhUgQhu9gGigc7zDbyx1s4Q==
X-Google-Smtp-Source: AGRyM1sAv3huAMlZJPo1fFK7z2myKSXoujboeKvI27J2j4nuaqNB9V7fuVMOuLmlv2hgqaEtUA8aZivsjOqi4VQlE0I=
X-Received: by 2002:a0d:e20a:0:b0:317:ce36:a3a0 with SMTP id
 l10-20020a0de20a000000b00317ce36a3a0mr10375298ywe.448.1656590494542; Thu, 30
 Jun 2022 05:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <1656489290-20881-1-git-send-email-quic_srivasam@quicinc.com>
In-Reply-To: <1656489290-20881-1-git-send-email-quic_srivasam@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 30 Jun 2022 14:01:22 +0200
Message-ID: <CACRpkdYPQoDQ6oUBfB__pBvqMUD7yBaeuDcLfOqRKHm6sFkc7Q@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: sc7280: Fix compile bug
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, quic_plai@quicinc.com,
        bgoswami@quicinc.com, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, quic_rohkumar@quicinc.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 29, 2022 at 9:55 AM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:

> Fix the compilation error, caused by updating constant variable.
> Hence remove redundant constant variable, which is no more useful
> as per new design.
>
> The issue is due to some unstaged changes. Fix it up.
>
> Fixes: 36fe26843d6d ("pinctrl: qcom: sc7280: Add clock optional check for ADSP bypass targets")
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Patch applied, thanks for fixing this!

Yours,
Linus Walleij
