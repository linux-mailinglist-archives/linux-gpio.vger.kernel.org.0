Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2756E4BC4EE
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Feb 2022 03:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241128AbiBSChS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Feb 2022 21:37:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241124AbiBSChR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Feb 2022 21:37:17 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC9D654BEC
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 18:36:58 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id k13-20020a4a948d000000b003172f2f6bdfso5851653ooi.1
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 18:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=k7MibnFlGnXWaoyuZc5fFX+hxS1DyD57HaegQF8+k5M=;
        b=Bk7rZo63WFjFUSnO4tKCyrWj6rYnFOp7yPp/BHupJggG8IRXcqYgB8LVXZ8YwNQ97K
         e9KEHfdxp2/cJNO42Ry1qQGnp6/duq13w3fLU8f4Z/54K4iIJGyyYEiCCrjSEXaWnKrl
         uGIqwTLNcA0+cr+eIUof3oq363RdQrMaapM6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=k7MibnFlGnXWaoyuZc5fFX+hxS1DyD57HaegQF8+k5M=;
        b=JJpk99qWjF18M0jI2sZA+MV+z2XwGhbJZfE2NRtZq8WJWsqyctidNPIO49pE8RsyZy
         Yr/dV3hgA3vwugmIlWWfqbqIp/uXuQRRvcWOMi25AuEpNA8rJqAd+MPI6Y2t/sQKRBfA
         kthWWkFdldPCBAHArHn/UCC9HeaYHNukrwSAfz//6Zu9skMYwg+cPD5nrY9U6ky+jcy5
         1WCKje/lBxGalKF6EBLvxVdVYROkbb30LlGR6PTb/YgqcLbCzP/5kVjEyxaOcRrZNIMW
         uWJgNtcYTeWrhiAgru4f30hOrvI/41qg+WDO/BRA+zA/IimDxq2aHJgA2rUYQj9fI4wL
         Qwkg==
X-Gm-Message-State: AOAM533Vjbr4YANe9qUmCMPPwLtfRsuus88SutPZ9qt0H4QSEH0n9JTT
        4tfhBl92eliW57PymGr37tSDSNimnJdW7Tmdw2QX4g==
X-Google-Smtp-Source: ABdhPJzqlbIZ9/jzgYSBbZJnFgkexJgnaPi6xmRk2KUZIo43z8DVRDJDT73d9tERc88r8QLDQD6Sgey3RUqQPzCI1OU=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr4185776oap.54.1645238218057; Fri, 18
 Feb 2022 18:36:58 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 18:36:57 -0800
MIME-Version: 1.0
In-Reply-To: <1644851994-22732-4-git-send-email-quic_srivasam@quicinc.com>
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com> <1644851994-22732-4-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 18 Feb 2022 18:36:57 -0800
Message-ID: <CAE-0n527fs5rfPG1HonW_9ZTugANnWNYSs_0+wts+zDK=zcZjA@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] pinctrl: qcom: Update macro name to LPI specific
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz,
        quic_plai@quicinc.com, robh+dt@kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-02-14 07:19:50)
> Update NO_SLEW macro to LPI_NO_SLEW macro as this driver lpi specific.

Is this to avoid NO_SLEW somewhere else?

>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
