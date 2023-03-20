Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8086C0C8F
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Mar 2023 09:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbjCTIya (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Mar 2023 04:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbjCTIy3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Mar 2023 04:54:29 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9613BDDB
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 01:54:27 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-536af432ee5so212317647b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 01:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679302467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VwCsLRx1BqoZCFKmvQkscs5AX5CM53X2foeYLp/it0=;
        b=kTQ2+k4ktXPkorygBmiiPssqIsjIfTv+lp5cN34Qm/XVt8ZAquFzTlEHBSNT7cNQVx
         a3XRr3oIkD3xDMGCZYSuKx25VC+KCKZwuD+FLmsLp+rTaZ9uZ/qj6ukVjqcglVR9pM1S
         iYFfPtSl2S6YFvcpD2YKN8hOP5nMcWC7bH4//qIW6gGbKw9NXAQVLKMULDK13KE556XT
         /ZmoZTcaksoRup1cu17dZWwBjJ2WIJdtiFGVIff/Q6h+HQVQTjKG9nY5WsXDn9rQO5MR
         eejLd9ZpXN41xqpwdOydlRoaWcggBgVvNwV34wVFGhJQa2xWoS4mhTaexYcAJSMjFgq+
         0z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679302467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0VwCsLRx1BqoZCFKmvQkscs5AX5CM53X2foeYLp/it0=;
        b=iTRsdnTy3u7Grl3Qv5wrRxMPaEQnClMPY1yuxSovTRjOBQWPE4T039CoySNiwaYO98
         Z1t79hswjfjh7yPFzF7y/W+3PlvOQ6a+l5MvZ0Q25G49DcMnL5hFT7eTkHn6SV5xWvPH
         b3AaZGwee6UNHKRwW6NvlFDDcg1Ldfxsog5u1XJAM7ZJ3cN0kuQRyNcxT+AWyt+KcXV2
         r658h6cmLtCdp9z4KMOBc6s4hHCMPJndFidJ3FfcQZoOg1UUKKuAeR83WheUlqLgvBva
         VULWDVYQ/Fqyx0d0slrKCSIIjPCgj6Wnml+jC7KRbmingjTTrb5jtgY7D4x2aeBI5fg7
         4UoQ==
X-Gm-Message-State: AO0yUKViUVFuqsr4p6pOt0b+HlQjAOH2UL37dkrNECHTS4I5pIDWA41e
        sYqetvJnWWCBiPk9GJ7ObFsTMzP2UWNwSAwKZrLMCw==
X-Google-Smtp-Source: AK7set9cIGT0nR09rLwg0UKkmrZo3q2jtFt7Xnztz809nAEgzPbiDoHduicc8RaVr7/eQUZ9wKC7+XPwFfILUV0Geo8=
X-Received: by 2002:a81:c749:0:b0:541:753d:32f9 with SMTP id
 i9-20020a81c749000000b00541753d32f9mr10032764ywl.9.1679302466888; Mon, 20 Mar
 2023 01:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <1679070482-8391-1-git-send-email-quic_mojha@quicinc.com>
 <1679070482-8391-2-git-send-email-quic_mojha@quicinc.com> <CACRpkdb95V5GC81w8fiuLfx_V1DtWYpO33FOfMnArpJeC9SDQA@mail.gmail.com>
 <20230320032238.xf5jlt43qebcewm4@ripper>
In-Reply-To: <20230320032238.xf5jlt43qebcewm4@ripper>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 20 Mar 2023 09:54:15 +0100
Message-ID: <CACRpkdYq96d=0hoBhNGYihVJbX-D4WLw3+GdQC5_NDXuBiaF7Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] firmware: qcom_scm: provide a read-modify-write function
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Mukesh Ojha <quic_mojha@quicinc.com>, agross@kernel.org,
        konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
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

On Mon, Mar 20, 2023 at 4:19=E2=80=AFAM Bjorn Andersson <andersson@kernel.o=
rg> wrote:

> > This is starting to reimplement regmap.
> > In this case regmap_update_bits().
> >
> > What about just using regmap as accessor for these
> > registers instead?
> >
>
> I'm not sure it would be beneficial...

Me neither, I don't know the details, I just notice the similarity in the
accessors.

> The regmap interface provides a standardized representation of a block
> of registers, with the suitable accessors backing it. But in both cases
> touched upon in this series, the addressed registers are part of regions
> already handled by the kernel.
>
> So it wouldn't be suitable to create a regmap-abstraction for "a block
> of secure registers", at best that would give us two kinds of regmaps
> abstracting the same register block.

From my viewpoint regmap does three things:
- Abstract one coherent region of registers under a shared lock, with
  nifty accessors (such as mask-and-set with regmap_update_bits())
- Maps access patterns/permissions and permissible access range
- Optionally cache the contents

The way I would use it if these secure registers are in the same range as a
bunch of non-secure ones is for sharing a lock and the regmap accessors.

I wouldn't worry about access patterns and such. That usecase (block
access to certain registers or bits) is partly overdesign in some cases
IMO.

If regmap abstraction isn't helpful overall then we shouldn't do it.

Yours,
Linus Walleij
