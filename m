Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6276B4D919F
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 01:32:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343944AbiCOAcg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Mar 2022 20:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234920AbiCOAcf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2022 20:32:35 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F429BC09
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 17:31:24 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-2dbd97f9bfcso184133307b3.9
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 17:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7eWWAIq4GOD2TDjB3wTVzuO15Vfksobxiuw1mavkPNE=;
        b=ANxWNMjShIHor0BITAU53mQIjLb9XmteDZSn8rv5iqZP6Oa5DRn5yb+vy9CA1UW0RL
         vqEsV/7Y/REu+3V89owkeo9JRj2n2p8/Uc9s+pCO1V/y1huk1heGDDo9oikdI5aNbjD+
         dREYz4sE62mL2kDPSHJLnaKZT8GsbaWta+ayGQEFKUZ+EVJ3oP/TJQLATtKupBFcizhp
         PlMKyovbFnqTSBBiv7QffXZ6P3nC7et8a60Fw708RbH9qywIxeUYPeIzDwWueHbK32Hd
         NnPFlWlKWl+fB4aS9e10AqKuFVS4aRjr9sHoEuZ/8i61rAK76AhwHrTh9J+SgjcAhvj9
         UJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7eWWAIq4GOD2TDjB3wTVzuO15Vfksobxiuw1mavkPNE=;
        b=2OvjLKOwIN1qJmPHQY8KbryHatONk+sRoVfckAYIgaMqsCmnoEO64UueLbn35vDHmb
         dgfA3Ts8f3AssdMJvyqc5bqz3Vaqe/LezyZOaqlmT4GSrbA5NhrCNhoH/roGJD0Zb7ri
         ZVNtoOItxzHjDhwUGJgY6gA6yhDh+fm9OHxL3OVRor8rZMbSwsianPGza4H1f2b5wYCU
         IsH1zEMbTwVUecyeA8vXyzAYL7XyAkI061ChXOZTGMbpjZuYsrecATkdG+0zEdzdc06n
         TVnGIptYmKKxscg2/Ws1cDcJYLo2Qq3vI1rBDRlto3qS9+5lMGc2064hZbWslHTKrjFq
         5otQ==
X-Gm-Message-State: AOAM532VVOBqKqFmKXGIOL8y3uigUcRY8Xsy5uXTROQrXZ5mKruWc1Ry
        kw3FQoQudTft2aiv/rMfsIridTSLyfS0GzrcE7iLpQ==
X-Google-Smtp-Source: ABdhPJwRuBglSdMYHlRyDi6I0V4WTw1liBNuu4TwmelKISlpf17Xaq65fPRfdD4AFRt4ddNiRs9p9jZQfi4lNqjmVHY=
X-Received: by 2002:a0d:db15:0:b0:2dc:b6e4:cd2f with SMTP id
 d21-20020a0ddb15000000b002dcb6e4cd2fmr22611124ywe.118.1647304283915; Mon, 14
 Mar 2022 17:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220220162355.3594831-1-trix@redhat.com>
In-Reply-To: <20220220162355.3594831-1-trix@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Mar 2022 01:31:12 +0100
Message-ID: <CACRpkdYQ9K1pvXBaeXQNJGFEON6ya6i9-5KsG0=Rpta9t6YJXA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: cleanup comments
To:     trix@redhat.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Feb 20, 2022 at 5:24 PM <trix@redhat.com> wrote:

> From: Tom Rix <trix@redhat.com>
>
> Add leading space to spdx tag
>
> Replacements
> voilates to violates
> sepearte to separate
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Patch applied!

Yours,
Linus Walleij
