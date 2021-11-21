Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E11A4586C8
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Nov 2021 23:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234278AbhKUWwq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 17:52:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234211AbhKUWwq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Nov 2021 17:52:46 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F4F5C06173E
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 14:49:40 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id q25so34323333oiw.0
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 14:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X99/qOPdJ+WUbWBBOwNYpUmngjvM1PDWHkQjo0ad32Y=;
        b=Q44svvAiadlk8aMSRveyGTPXRA5oCYbxFmT+IhIUTIN2fwuIw52DehmCszaMmv5M7t
         mo1dASbLVJt1oJ5uYp5n+1c/QqzKMbyE/hmBiNoxaEufxzhfelf5KD2Z8d9M5inU4S9y
         FuERCfwcJdOG0DZbzcbVXCE5/f/5K+0kk6Q1q0Ast4WisWpKmjB5mvyrrkVcHnaeT4hS
         1i20p3nA5Xsk5zB5b7tazj+rpqTz/yMPuIawvy1D9eTl/Cum/pPAbzKERJAo2sGeu7uc
         /PBtXxWpdWAhP+DwcgjeeZFk3iiwZGM8JT7MWqhygcvPtbAfM5/icS9l1cBkeJSBxsNO
         FIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X99/qOPdJ+WUbWBBOwNYpUmngjvM1PDWHkQjo0ad32Y=;
        b=vSKOcCwTApFAXddO0WQGY5L9RdNcMeFkBoMxnJfHi59hMvpYwYn69h1s1AjY2p9cEE
         nHX/ZbfX2YBgdHSU9xn2Siip3k3mthOvunLooUuArcMhy5JKPMyNZBOUfbGVG363MCu1
         p960kjKcpV2LmVs9qhejU22AUUuJwbpUbmTxgZe955r4V6CzbEXlEV+GwHTChPM0+2BC
         mH6+m/vgm3mEZ1J1YnU6rHvc5XyCVa6Y4DrVNxJkuOIJG036Gv92+GwhBcJNRX6JgoJO
         41DieHry2nJkySAV7DI5MviLpZI++r6CE/pj929UpU/j8PshdArY2pESBGJGaCkcbPRk
         0R3A==
X-Gm-Message-State: AOAM530yKA5VW2Sbi4fgPEERrxQbIJvjaAS03Kms1KAil7Jj0wUGacYo
        hxWncK7/G5CLeI6hlyzapslxLRQ9I2W+f1psxAcYPw==
X-Google-Smtp-Source: ABdhPJwgaKcMuYgYCnXAWZszLJBD35nrr/psdZgwCLa+EINWN49QQKsj71cxw3YkXzLW9+ZE2BbOlleDjfZ50bFaefI=
X-Received: by 2002:aca:120f:: with SMTP id 15mr16999633ois.132.1637534979818;
 Sun, 21 Nov 2021 14:49:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637048107.git.quic_vamslank@quicinc.com>
In-Reply-To: <cover.1637048107.git.quic_vamslank@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 21 Nov 2021 23:49:28 +0100
Message-ID: <CACRpkdY7h2ff8Td_iV03Bq2F=UcSOJj5W+5zB+UAA8uWK8z12w@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add pinctrl support for SDX65
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 16, 2021 at 8:40 AM <quic_vamslank@quicinc.com> wrote:

> From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
>
> Hello,
>
> Changes from v3:
>  - Addressed comments, fixed dt_binding check errors and collected reviewed
>    by from Bjorn
>  - Rebased on top of v5.16-rc1

This v4 patch set applied for v5.17!

Yours,
Linus Walleij
