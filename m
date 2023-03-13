Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4236B845C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Mar 2023 22:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbjCMV6b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Mar 2023 17:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbjCMV63 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2023 17:58:29 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 043E18FBDC
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 14:57:52 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-536af432ee5so269193897b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 14:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678744664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amuk1a8QJGQKUxtyDQZC4FM9pz93ZMG/0KEcjg0E1UA=;
        b=VyJzqzzmIawSodYjXkJ4zmRYO4U/C1lpaBFeVmsMA/hBXORgoT48/lJ5QxOVBeX6uw
         bs90pYfVaNf8rBC9M/ec1owwz1LkUki2eapvvM3n9tGnSBJnHr7KkyuBUQL9BNdZYa5B
         8KrlucUy1TPNuq/cyKoIncPe13zmti4Y2lGhYphPjPRHcbh3Fy2vG93EHeiVjuNCy3eF
         5LkNl1tviUjlYWhvTrpdsynG5MuMZ6+3sJ91kjQbjsRgTJwB0fARP3+Wx9QXj00RPTSq
         xJh5KYcRRZF+mlop7mtTvCHoXSWCdRsBTfRgIKJNlncqjLq2a2kLLnr3wceGREuUtFZQ
         aeug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678744664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amuk1a8QJGQKUxtyDQZC4FM9pz93ZMG/0KEcjg0E1UA=;
        b=v8pyDhwQSPzQ1MqczMDibMma2db8gmpsPwVyPJz3LtsZwG+sR8oox/X/lh0+1JW6SK
         EZh8Wa1arSSm3wrQMN8F/VL/6///2quTfT1AFAEHzRfAfF9pXNLXtWND6G3zxwtAvPn+
         yN2r666ozGV4RpW0+Qbzb1dpr7chFMR+uP5+WlKqcJzqlh6yejVHNKuE3WXWtgJygrUK
         g+vrKWBEE3rzFo0BjJ4i0unuBdZ4bLcNbvxd0DUDbFx3uapxs1R6UjtFszpAYpWb4npF
         Q0e6n+WXCeMOPrcJtXfi1sViBadVVDt8qZZcvRBWr/rRXS6WRQWsftXKtOg3lnPc2e1m
         xKPw==
X-Gm-Message-State: AO0yUKUD+8q4mFQJE/rpW/dA/0kTeZtgGQ3/mPyAeD0whw8CJQM1ED97
        8DDazh0cMr/hlbFq14uD5xelxagp6iJQpfHufjV5+g==
X-Google-Smtp-Source: AK7set86KxSVTf43Z5xxBccoEu4aIgx/5QqIi/mCylwIRT9EOGgS1qWtl7k5ozzRyBkcgozrGasSrkeNqxKoojdFi1g=
X-Received: by 2002:a81:b10a:0:b0:53d:2772:65d with SMTP id
 p10-20020a81b10a000000b0053d2772065dmr17609048ywh.9.1678744659416; Mon, 13
 Mar 2023 14:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230310190634.5053-1-dipenp@nvidia.com> <20230310190634.5053-3-dipenp@nvidia.com>
In-Reply-To: <20230310190634.5053-3-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Mar 2023 22:57:28 +0100
Message-ID: <CACRpkdYmC=eLiWPPPRG7DYBmQfPNCN4pcDhzTCO=hkQDx2HoGw@mail.gmail.com>
Subject: Re: [PATCH V3 2/6] dt-bindings: timestamp: Add Tegra234 support
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org,
        timestamp@lists.linux.dev, krzysztof.kozlowski+dt@linaro.org,
        brgl@bgdev.pl, corbet@lwn.net, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Dipen,

thanks for maintaining HTE!

On Fri, Mar 10, 2023 at 8:06=E2=80=AFPM Dipen Patel <dipenp@nvidia.com> wro=
te:

> -  nvidia,slices:
> -     $ref: /schemas/types.yaml#/definitions/uint32

I would not delete this, just mark it deprecated.

nvidia,slices:
    $ref: /schemas/types.yaml#/definitions/uint32
    deprecated: true

(And remove it from required, of course)

This way you do not need to explain about why it was
deleted, it's just deprecated, which is fine.

Yours,
Linus Walleij
