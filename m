Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14AB4755745
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jul 2023 23:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbjGPVGn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Jul 2023 17:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbjGPVGm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Jul 2023 17:06:42 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B72D1B0
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jul 2023 14:06:41 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-57026f4bccaso41483467b3.2
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jul 2023 14:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689541600; x=1692133600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdfCwih+5dEsklJPwU/YkEF4cHq6v8XcSCOAFgMBsQg=;
        b=x3DeF3yeIoB4iyzvNdtaDUi3o/duhMLvHXaCCUlrp7rfvqxpWc5AW9fVhVjzk5X6oe
         KlZ57RwU8n4v4ckvFDz55IuXCWzw2vDYvtPF9aEYpyO5BIUpqYYHebA9kpmJwggRv8uk
         0uoq4HJlR52IEYx8f/eFZF7hhsNfd5QMMzHjxRAYfDtwR7RKX+dFoDbAA1qkiDPK7avC
         O7euvbdUvCPC5jurm3QcShLN3jQe4l9wUSCknTIj/4AfeXyvgVijtPb8jRVt0/8NffER
         BtoI0DNY/MGZY0paejKtHSwfr2gVf/IweT/NiOmUbJvQkXC6Jo7sxf4JJ/AIo6adLUn1
         IjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689541600; x=1692133600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdfCwih+5dEsklJPwU/YkEF4cHq6v8XcSCOAFgMBsQg=;
        b=ZNkQFpJ8CH7F65EGc1aiRY9mpsanxhzq/RE8SO7W4YQYufbM6kPkCdy35u5SDiDbyP
         PvUOCemJA+LuARmT920VhJwjmf1Vls9x7o2fQyUXzuq46Nsp5zSYPW1tkDGfddWxoxyf
         EPPxGXGgMp/sDZcQioeumWhHfAAwmmyLVi1NZCJ30n1ySSoFub6PCg9YRJJenLUBPeJq
         hz2LquHTojhbMzUgKeJpC+k8GUjge42ZuOY7ec7i5U6pfo/6YYu7Mhu1oGeffT58G27p
         kPMHSRMSsUwpc1beUD9EdnsXNX/kWivBvgrokDXtmJ1FDCttW7NhPJNzCJhb3Uhps6f/
         Q/FA==
X-Gm-Message-State: ABy/qLZRVHduMa6JaWA5jt2zswFU4NDMh/WlKpuvxHk6JsLOl8EIOg6q
        ISQU8MJxVuJ5nu4cwzHt83eCE035Hdo9DQSLBj3MYw==
X-Google-Smtp-Source: APBJJlGYH5otWM7ZH+BmR5IMZZxK6D2cr9NtseCkEkmHNTjTEyYhzBuFRf/ivmKV2OxPDC3n/BN3V9HuKHQ6fNxHy+s=
X-Received: by 2002:a0d:d847:0:b0:570:4646:15a4 with SMTP id
 a68-20020a0dd847000000b00570464615a4mr12170396ywe.8.1689541600343; Sun, 16
 Jul 2023 14:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <1688707209-30151-1-git-send-email-quic_rohiagar@quicinc.com>
In-Reply-To: <1688707209-30151-1-git-send-email-quic_rohiagar@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jul 2023 23:06:29 +0200
Message-ID: <CACRpkda3SeW=E=cdEd7bvdd_DTTXLoyXAPBx0n6wYOk_GnQoVQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add pinctrl support for SDX75 PMICs
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rohit!

On Fri, Jul 7, 2023 at 7:20=E2=80=AFAM Rohit Agarwal <quic_rohiagar@quicinc=
.com> wrote:

> Changes in v3:
>  - Corrected the versioing in this version of patch series.
>  - Keeping the Reviewed tag as there is no change in the patch.
>  - Updated the patch series subject.

Patches applied!

Yours,
Linus Walleij
