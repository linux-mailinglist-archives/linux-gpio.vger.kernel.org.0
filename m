Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1D2321C656
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2020 23:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727793AbgGKVLh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Jul 2020 17:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbgGKVLh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Jul 2020 17:11:37 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA66C08C5DE
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2020 14:11:37 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id h19so10334449ljg.13
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2020 14:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hG5d4MXKH7j0YNeql3XedgUwA1S+hEFx8UFAusowRpQ=;
        b=dXthr0xg2XCQr65fG0RuhCL5iGIPi6+nsbmgiARFHbGL/Uf99W7FHXpins4+smK3oF
         SFZmDcxc2/w/y3N1xYxVegkxHeSq1ZYEtGk75cap3MamCnrhYMawKCxHTNulHFKjfxfk
         +tfF1aUGFmC1OG+EAsNulGF3Xo/n7r/jsWUp3DCdLP8LHfZfruyiZZ54/T6yRf+wdB3A
         1FvI0tUfXAxjNb3MTyOhfhe09ygOEDK2uxGqcAhIHcj7EP771rr08bSPhvyv8E5yH0aC
         O2J+AcruPCugrhoevCMBpiiwQlrao1hH++RpqOb/Pv4ffC4DNQKk4EFR0tD5R2oxMMvg
         3qAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hG5d4MXKH7j0YNeql3XedgUwA1S+hEFx8UFAusowRpQ=;
        b=j+Hw441YZqgt1haWdrBTdlESWOhW0pOpRaAt5jfySA24I/H3J+HVhIjr2vo1VUnAUL
         Avm3zBOGc3RkmvL/EotfCHPnOeODkHj7ge56pbOa+1wq5qznJXVvnG6eIzN75DzBPD2/
         VdmxhICf0ihUKApu68vzmSK56/91ZHuNjW7bZBuqCZpLrba9yo2hCpxoavNelEaqApi6
         qzrSQNbgWBo9gbRfuusinvEkCIRpZxT0G4P5piNkKCW3YReHPeVZPafkwBpoXLsK5XDC
         Jo8jfeRIk6M4yT8SwW1rtktYoNHuB5We4R6Dri4I/cgXCMbTSaV2WmNWsKuJ/fygPnUe
         LDIQ==
X-Gm-Message-State: AOAM533ALPPnqTHtmUJ12UxyaqYEYvbDlMECXLRonQ2tkbaCfZenfUzu
        4wL5os8q7WsIg/+pVsE5pHoDoapBisuqQDjRlqC7eQ==
X-Google-Smtp-Source: ABdhPJykUdIN42EDfkU5cG71+oDSmBrVADO8NS9vM4JO9vrSCCvxVJAsXra7VIel2SQ5Kgi8SMViUfehC/nyjHr2+30=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr27378268lji.338.1594501895501;
 Sat, 11 Jul 2020 14:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <1594107588-17055-1-git-send-email-kathirav@codeaurora.org>
In-Reply-To: <1594107588-17055-1-git-send-email-kathirav@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 11 Jul 2020 23:11:24 +0200
Message-ID: <CACRpkdbZWrpqtQKZeX96-MtvwR4ak9E9hF43fURpZ50MVtWwig@mail.gmail.com>
Subject: Re: [PATCH V2] pinctrl: qcom: ipq8074: route gpio interrupts to APPS
To:     Kathiravan T <kathirav@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        srichara@codeaurora.org,
        Rajkumar Ayyasamy <arajkuma@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 7, 2020 at 9:40 AM Kathiravan T <kathirav@codeaurora.org> wrote:

> set target proc as APPS to route the gpio interrupts to APPS
>
> Co-developed-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
> Signed-off-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
> Signed-off-by: Kathiravan T <kathirav@codeaurora.org>

Patch applied.

Yours,
Linus Walleij
