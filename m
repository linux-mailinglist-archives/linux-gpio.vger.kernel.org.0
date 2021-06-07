Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4C9D39D594
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 09:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbhFGHKl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 03:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhFGHKl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 03:10:41 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41454C061766
        for <linux-gpio@vger.kernel.org>; Mon,  7 Jun 2021 00:08:49 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id f11so24461486lfq.4
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jun 2021 00:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2sChFupNDISguJdQ93OuywrJgFnASQqUTk66QD3fheU=;
        b=jEdpGpSxxxc/JBejLPt2hZOkIv+v1lW0s2dtES7baLoyk8uE+J2fBiI78gXF1g2VV8
         sWn9RQE+J6fcHzxhHQiiGKf4pw9GkqkwLHFAbpXNUQSjEpRVq/KgDCHwaxhyQm1AbUw8
         7ZHPZf3VsTW/zc/7ZJU3FIoChYlNF0rAH/UW3hivtdq0i1+jth0eYLf+LnBczxwBtSQn
         VLK5LwPCSuEV7JU9bAF1lqn5Ft29DTFDkowoh1YIvR/+S9J1Q7++w3aFK+NOTs+isWJV
         9L5qbqSlsrqch+MhXomb/3BJI3vONZtF+dkksWjxjrI8jhSRcKvpbJclAZYPbdBBmKeX
         VcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2sChFupNDISguJdQ93OuywrJgFnASQqUTk66QD3fheU=;
        b=LubonVkEtksqJLcDbKpHl5nLo1RJkSGFHem2wxwyAB4GjpaR5u7XZGtqe32CeQAtxJ
         9WFzVuISgSk4QJkSArY0uFzRCm8S3gNH1ejT0tB0WZ90kXES0IQuiHP8rOy7pjJXB3EM
         4f9U/s2OFofDovU30vqPmZ+esXFJBOo2yKuEZOrxDD53VYVmyOHcrqT7jCTyW2SOx93Y
         YAfoydWyEfxQmab3sZ6NPhO33iC4aXUhD4IZaxprbPwumKJo5N0n0as1LSgP2lyHPMbx
         Pw5m7LVttunDOAeu7JdCoAZVy1AVNKD3ffQBMwXDFV6UqqNNaopQT6GAnSVlP6uqsp4Y
         TdOQ==
X-Gm-Message-State: AOAM530Zt1n9d5XNuku7QcJW2eQ6Ru46hRPKiBxJyOobyEMUcqY6F7+P
        F2AuhNqZgShFHTxG/jygCC2zyrs0Qi9PQQ2OqzLwqw==
X-Google-Smtp-Source: ABdhPJyi+8lO2eHOnf1EGT4R9C29fTCmfSZeXRtPWCzMV0LR8z1giBWDeA783U1aC4FGoaA9oN6Iint77xKwduKuttQ=
X-Received: by 2002:a05:6512:2105:: with SMTP id q5mr10699515lfr.649.1623049727938;
 Mon, 07 Jun 2021 00:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210604055337.20407-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20210604055337.20407-1-sergio.paracuellos@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Jun 2021 09:08:37 +0200
Message-ID: <CACRpkdYLwdgws+fDcb_hNz2=WD4+qkHiwWQgpgFNfWLU=PwSiw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ralink: pinctrl-rt2880: avoid to error in calls
 is pin is already enabled
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 4, 2021 at 7:53 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:

> In 'rt2880_pmx_group_enable' driver is printing an error and returning
> -EBUSY if a pin has been already enabled. This becomes in anoying messages
> in the caller when this happens like the following:
>
> rt2880-pinmux pinctrl: pcie is already enabled
> mt7621-pci 1e140000.pcie: Error applying setting, reverse things back
>
> To avoid this just print the already enabled message in the pinctrl
> driver and return 0 instead to don't confuse the user with a real
> bad problem.
>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Patch applied for fixes.

Yours,
Linus Walleij
