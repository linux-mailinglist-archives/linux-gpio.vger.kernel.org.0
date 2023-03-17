Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 175946BF350
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Mar 2023 21:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbjCQU6V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Mar 2023 16:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbjCQU6T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Mar 2023 16:58:19 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5BD399DC
        for <linux-gpio@vger.kernel.org>; Fri, 17 Mar 2023 13:58:16 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-544b959a971so82163937b3.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Mar 2023 13:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679086696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78yALmTsSciSeto27pgZIDoTUCcCZg0Xi7D0VKEquOI=;
        b=ReNqhlEAqD/sjcsPCojeM9w+k8jN3tbhjOvqFb5lB6b1itAJPunkb/lHyjF8e2zKyT
         JDo7lBArgVDBe0QdACN1oz12hmgq1mcaaUzJ4pX6igZKfxBSsbueysICZR/nxsoSeLsA
         fW4NL4S7AAmQIppB1LVJeo0iFltJzFmISdTpePZCIZ11udmbpU+XWOkvLaItCnrEkg4Z
         aTvXk7Lcfan9TvvbJWh7rPgUQb+TkyC7tDJGoX56xfEqSsDHiVzT0IO97mCFgLOjsSQt
         Y29K+xdi48dUhkt7rp1yj+yvJ/BL+7dUci2Po0wG2FDdQttm7+3Vlx02uUlpYCt0YDf6
         Btnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679086696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78yALmTsSciSeto27pgZIDoTUCcCZg0Xi7D0VKEquOI=;
        b=7guav78SJBrqtDDO0SqedT83QLgocEhAY4MbbSZEsJ2BlXqaYccIOqOPjeN9bk5E4M
         YcoiwrgqrMSe34FjrInRRe7D4VGD5YuAOyuLsePspw53qTH/tFS5UVjJiSnjEUuRknMi
         9JdKvBgF0wVd6Pw6iIKUFqTR3AoJ9k0eSd/7/N7RMp/s1soYoBZWGKWYIRJnrPDvvxQ2
         p2/NHwUqQyQStJer2T1GSf75Ckmq6jHPBOCu8yJlTTAZXT/uTcpm/oZxhc26TJh5HUOH
         tnGoLsVq+cJh6qSQFVbxcHTUMy3fJj9ZKgeLoQsAnF547PcC1ks7c2hBNL9mz9MvOJoQ
         5cVQ==
X-Gm-Message-State: AO0yUKWhlXhZj2hjoqmQncSmh5DtqO9g65eLwzQAYgA96ZdxIzZsPewN
        a9JbDFEXmO3SdltG1qGvvAVoitnWpOJnjK8mXK0B7g==
X-Google-Smtp-Source: AK7set/ZRWZmr4fK9BRzq5dNAUC2K47cgi7Bwlzsv/gVUp7p6JUstQoJ4CPHuimwv8Pv/cAkKKJ7oBLmS6UNDDVaUFQ=
X-Received: by 2002:a81:c645:0:b0:53d:2772:65d with SMTP id
 q5-20020a81c645000000b0053d2772065dmr5177050ywj.9.1679086695996; Fri, 17 Mar
 2023 13:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <1679070482-8391-1-git-send-email-quic_mojha@quicinc.com> <1679070482-8391-3-git-send-email-quic_mojha@quicinc.com>
In-Reply-To: <1679070482-8391-3-git-send-email-quic_mojha@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Mar 2023 21:58:04 +0100
Message-ID: <CACRpkdbA27buNiOTz6ad4gyS4FCvcoYru6QB5k9Lqwiu72sf9g@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] pinctrl: qcom: Use qcom_scm_io_update_field()
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 17, 2023 at 5:28=E2=80=AFPM Mukesh Ojha <quic_mojha@quicinc.com=
> wrote:

> Use qcom_scm_io_update_field() exported function introduced
> in last commit.
>
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>

Fine by me, but I want you to first consider switching the
custom register accessors to regmap.

Yours,
Linus Walleij
