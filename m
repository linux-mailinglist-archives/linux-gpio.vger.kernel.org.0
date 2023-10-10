Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8A17BFE48
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 15:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232498AbjJJNpL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 09:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232727AbjJJNok (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 09:44:40 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D301A1711
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:43:57 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-59bebd5bdadso69592117b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696945437; x=1697550237; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHv90yeM59s0sxqLXofNmRkQi512BP/YIHCc5n2XRV8=;
        b=CTyBwscDdXRHfa357oTE1VQHcc+sWJybRzF8l/lDUwTxVNEzcHhFmRPIN7iVX00q5e
         dL9Jv9oWpALsKF3Vy4wCinfh64MMftWPbosuSIXO5s8RW71Mt3gC/6G/YQQrbwJECQ2P
         +8+ezSPRw05/LCXXRoXz/3ghL+l0fg42OEBlXQeluuz76mznXEiapmeeAZFXdo/1GZr8
         2Co7IJtOSlfAl1DwAfrWMaSmrGNXKUWGhvlA5Q5OPTfp2SqJlVIkgWjUdGPEGEI+/eZ4
         U1veRiqf26prKpGFZ2KMqw16DqRp8K8dfl4WaPdUwIS8cc8/iXw05zYoNqD2xfnKqNjX
         Axcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945437; x=1697550237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHv90yeM59s0sxqLXofNmRkQi512BP/YIHCc5n2XRV8=;
        b=hA+fbZw9YzmkNhefUlkLD39X47KUH+WwkjdIB2iQA1SFMsj3G5pf5k/45yuTJg168B
         T8Es+lyz1a12/w/TEHl2/tw6dzAxijrLcoslG9GmlXTMaLcqmE7ldg2TIL28gFMifEpS
         kJcORIV2qXdmpVI8apwtpmnxEX2OblXabWPkFzDlH5aXFwtb7GZBl66fegBfsgqGs0oe
         EekPWTKgORAZvC8r8Q3kqgzkxXuk5lMA5NDPiFYyQWeP1DJkH3Xzu8Z3KpM+FSzmo8OW
         fa4Fe1Zh4OhO7iX7vzvdOK1bN25JgLq9eBGv61NjT/VdKngN4gSeSTs1NWKLRY6803rT
         DSlA==
X-Gm-Message-State: AOJu0Yw7HjDz6pnQWDlotX6M3wS0PDO3JAtA+RwU4lojbXsYccwr+KyF
        UCL/t8c9cYqlVi7eWfRH4senjNbsT0CmTpTBNqaadw==
X-Google-Smtp-Source: AGHT+IFe14EexLrkBZfWNsifbauHwwB0K/+Kizwq9byU1Yt/kNve+L3d4GQbubrht+pN7n07ezMuTgwFSCYBnOdSWxU=
X-Received: by 2002:a81:83c6:0:b0:5a7:b96e:9693 with SMTP id
 t189-20020a8183c6000000b005a7b96e9693mr2720838ywf.31.1696945436630; Tue, 10
 Oct 2023 06:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de> <20231009083856.222030-18-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231009083856.222030-18-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 15:43:45 +0200
Message-ID: <CACRpkdbKDRft2qfpDfxMSfbnnp+NS_3JzpYsJWLnJdtqiFi4HQ@mail.gmail.com>
Subject: Re: [PATCH 17/20] pinctrl: qcom: ssbi-gpio: Convert to platform
 remove callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 9, 2023 at 11:22=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Patch applied.

Yours,
Linus Walleij
