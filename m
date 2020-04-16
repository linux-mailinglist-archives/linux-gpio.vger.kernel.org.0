Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5181ABF21
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 13:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633187AbgDPL1d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 07:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506274AbgDPLQn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Apr 2020 07:16:43 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 869A9C061A41
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 04:16:43 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id h25so7342585lja.10
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 04:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SMyype6pheH6p2B+meThOWdIwkgayOziZmviW73TOhc=;
        b=G11PTYYbg1ocBkCFQdd0WZXWBNANuFHYcy3Q0hhd1bv4erB3jLCmyws8c3lC3wfILN
         aEjQAMcNSSjZZ6VYLsP3RjLmeeQ38obVAOp2FdH9Hlkb8BMxpeq3nwMChdscaoxLphO8
         18kcnImbDmf2F/hY8mCF7NtGP/QOU7TJwbMgnElSglmUjALRd4is/kaKoJKq40iCMbPA
         C1QwlcoOo3YW/zqzVF6bz/vrgujFNn9QGK85RYjnFtqO4MxCkihbN9IwBEIKIAYnum09
         8ZZmTfW3LKVQrk/WFYzTTBtn+gbVGGOmr1fFaDOez9a9KTwK5u0sO836VbnhsXxjs2/u
         li7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SMyype6pheH6p2B+meThOWdIwkgayOziZmviW73TOhc=;
        b=I0F5PHNqOuY77KtLgo7uPoBpX3uJCXmmoOMRyzc4mm54RItwgL5JYNCziiDOmx3AGo
         MN9g6C9rDgnGKqX0FvoqT2xAYrueQoa9u5pzG4rUSQNT9poLOr4XvXjj7aPWB+3Vb7pa
         W+FgHEsFKqxICvWb7s+nmWXPE6dlehE20fn9MS1HshEMPy3kvsUriNfquAywaUzhGgO5
         p/C5X4s8JYO1QyRpEEuNMbjXs/4InCA79t8OCFAxYMrM11fm0uihhhKb+S9bu1WScpwC
         Jq2RO/J22tbxTPF7DwO8pzdysEJ+zfDxMIYQGYYTCZsJeGv4SBFRsAlcrYFuGiNUj5F2
         R7sQ==
X-Gm-Message-State: AGi0PuaH9X4XoApfBZhrpoJN779IIpX09S9rHdLDAj22kFJhDrqBMul/
        r7zzKgw5iZ4f4DdmY00IsvPa1M7LU8I1Kh8xct0/kw==
X-Google-Smtp-Source: APiQypJtQonKD3jh+va1+KhfBd6fpkD1BkWgrhEcoubjUXb3Sm75zbBsDipOQ9OsoADIUiMNpnQEpKxU7Wdf1AH6W6s=
X-Received: by 2002:a05:651c:23b:: with SMTP id z27mr5910865ljn.125.1587035801960;
 Thu, 16 Apr 2020 04:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200414003726.25347-1-ansuelsmth@gmail.com>
In-Reply-To: <20200414003726.25347-1-ansuelsmth@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 13:16:30 +0200
Message-ID: <CACRpkdY-t5GPdUg4uf-1W6VXBcgSL5MSPe46Aj93hPSdWDbwCw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: fix wrong write in update_dual_edge
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 14, 2020 at 2:37 AM Ansuel Smith <ansuelsmth@gmail.com> wrote:

> Fix a typo in the readl/writel accessor conversion where val is used
> instead of pol changing the behavior of the original code.
>
> Fixes: 6c73698904aa pinctrl: qcom: Introduce readl/writel accessors
>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Patch applied for fixes and tagged for stable with Bjorn's ACK.

Yours,
Linus Walleij
