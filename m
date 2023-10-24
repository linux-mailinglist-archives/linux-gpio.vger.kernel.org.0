Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43E317D54B4
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Oct 2023 17:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbjJXPI4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Oct 2023 11:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232167AbjJXPIy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Oct 2023 11:08:54 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7426393
        for <linux-gpio@vger.kernel.org>; Tue, 24 Oct 2023 08:08:52 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5a7e5dc8573so45977677b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Oct 2023 08:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698160131; x=1698764931; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L6YEOKFZgnFFaFZTb2aWNTq5tspoBeefaSbm2PKin5I=;
        b=grWbncdaFAmgIa+rADUOXCvA1kgEps1HSgMbXt9/fZyUZJvlHbvAhYJyQrzkevsM25
         EvujKf1LibhOl7eYRA+2OLk1n8ehyJJyMzsNZa6qOjyKbLQgFxaZmNF/yqbooEKBEbPm
         nBSz0C8R4sSLtkLtAaKs5V/qHBzQ9ufULgk9fMQFgGx933mMzYUKomCwovAIjtK0GTOq
         ub/3vybhVHGoQHoB7103/mKFXztt6WCgCUtvSo0z1oU/H+orDfv/UMvRkAsjiBjZbRHr
         zil/x+6MoX6db9D4QhOJUGvmGkw2IVA+YdCIMyy9ZbkVMCndPWg8bVn45GpAdMebC1+R
         k6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698160131; x=1698764931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6YEOKFZgnFFaFZTb2aWNTq5tspoBeefaSbm2PKin5I=;
        b=UqWMpO6hiY0x8KdUdjqdlTX2awDpMi6LKXoAcTW9q9TuzBHWE9ng4k1LwK5fuog+go
         VFereK0WZ4GiRe+YuGBcLOzdLWDgkkocurLKc3D7HzqeICFjD+pSgzKsVYLRPWWjCzaJ
         4NVhT8mPFJQzdk3OntSIOyeJjJrsILUnTeGxNY4G6tJ+DwYsewmPGzmObMInSoyDhof1
         6BtjUeJ/Um192VtuXQPDkNN07tvfFCPyF/ene8TqGK2StwtDN/x+2jCH8kakvaFxPUB/
         9CJCEf0UobDD6TrEk6ChkNwVPSugbyyPsToc6r2guJftAuRfAyneKeW5C+gft+u2mY7Z
         Lb6w==
X-Gm-Message-State: AOJu0YzjkOW5O4pfcDeRCieuYifALCtBqE0SARIQIin2xEGXzHRaqkyS
        JgPNnlquQPSbuZ5KEXhu9bW6oahM2MIAMAxvgPpzcw==
X-Google-Smtp-Source: AGHT+IFdzxMRbfUafGldLvc0HICTqC1JOkySRW6UQmufXP4xHsBx58j8IAM3qrN6y3CJMnHbyWV5ul2UEmW+AdgnJ3I=
X-Received: by 2002:a81:4814:0:b0:5a8:e303:1db2 with SMTP id
 v20-20020a814814000000b005a8e3031db2mr13315604ywa.23.1698160131018; Tue, 24
 Oct 2023 08:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <1696440338-12561-1-git-send-email-quic_mojha@quicinc.com> <f3a4c114-b430-47ce-a746-4a840994dc58@quicinc.com>
In-Reply-To: <f3a4c114-b430-47ce-a746-4a840994dc58@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 24 Oct 2023 18:08:39 +0300
Message-ID: <CAA8EJpr0Nnn5Tr=2CBAADYfNU6cnKuq==x5L5YQoko9C=3q2tg@mail.gmail.com>
Subject: Re: [PATCH 0/3 v7] Misc SCM changes
To:     Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
Cc:     Mukesh Ojha <quic_mojha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        p.zabel@pengutronix.de, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 24 Oct 2023 at 16:31, Kathiravan Thirumoorthy
<quic_kathirav@quicinc.com> wrote:
>
>
> On 10/4/2023 10:55 PM, Mukesh Ojha wrote:
> > I have given version to this series as v7 as it has already
> > gone through v6 and later got added to minidump patch series
> > However, these 3 patches can go independently and has no
> > relation with minidump hence, separated it from minidump series.
>
>
> Mukesh, Can you rebase this series on top of linux-next, since there is
> a conflict?
>
>
> Bjorn, after rebase is done, will you able to pick it up for v6.7 if
> there is a time? These patches(#1  and #3) are required for the crash
> dump collection on IPQ9574 and IPQ5332 SoCs.

It is not obvious that they are fixes for the crash. You did not add
Fixes tags, you didn't follow
Documentation/process/stable-kernel-rules.rst. Cover letter is
useless. How can we guess that they are urgent / important?

-- 
With best wishes
Dmitry
