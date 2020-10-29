Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD33429EDC6
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 15:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgJ2ODN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 10:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726578AbgJ2ODL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Oct 2020 10:03:11 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA440C0613D4
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 07:03:09 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id a9so3444539lfc.7
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 07:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=92Wvsa8QeN5oXBJQBgSBXtwtg0x+2FMYvo64EHUo00g=;
        b=myoxkGc4nH0UwcnEdAdThIJXXyu5AYXIxCiqvNsG3zJefwbWiIjt7BDjTDjgOqCeMV
         vpV8/pRUqT1IU/z1tIR09QZxo1L90FUoZoKIlMB9V2m1e75EuDGU/1d5MHyHGTsXriis
         qel5M4rKVY8HFype+DFBb6fn9CAEXrzjVutpK9TwgY8DB8XSyyyCimubSpIgO9oV7fYv
         0/xt7A+J97tgHfCFRNuWs9HR6nDhaoL3O4+XOi3ThfN8ECf5gPax5o0i6/CHdw2ZDhmu
         8rX7376FCicQ58AA2Buq7mrFkkhZ/7/aAs/27/ZFb556RYVR55pZdIeu0okYmfLrwD21
         VRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=92Wvsa8QeN5oXBJQBgSBXtwtg0x+2FMYvo64EHUo00g=;
        b=IytHftr+uq5V+O3ilvQAHqZwEgpIE9d2ZBXuQT6+XKC0EDn//YtTTUHaeE5nIkk9PO
         yhXDAoASoVaeet+WKFqUra5gAyo7XD+pTXzd30Z+Icp7zWEM5s7EEKWdZmDNx5gEBgmF
         UXvKKfXsWFuRbs+qpTKh8KyqxXqfh3ouJppZctL0LP22Y/AmmVfgdtURMq2PcvG3G5bQ
         D2OSF11vYhBU31z5iIegqfN8p4YzeAThLa2QClYA0VKi8AX480b7dasrE4iIJBUmyv8+
         PBK4c8MDP6JfVmD1gOuWV/oF49Xv0PU8N0heNUtoGL1O+GUoNCTct2oeMvo5RpuT4vA1
         HHfg==
X-Gm-Message-State: AOAM531rV3klu/8UY3SoKFnnITx1nhC7dr6efjcQckIsKayygoqzSKNr
        84zs3cvGslsg7gMyEjTLi7fJzkXleuNpU+gFDLykvQ==
X-Google-Smtp-Source: ABdhPJw5f+pbm+OCagVx13Hp7rRSTnDM2rKzYJ0oz1US7r1kPYSzVzcaUKCONaqZZFCt0KqI/bJrCI92slLADNyb38I=
X-Received: by 2002:a19:191:: with SMTP id 139mr1536310lfb.502.1603980186701;
 Thu, 29 Oct 2020 07:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <1602831532-24818-1-git-send-email-rnayak@codeaurora.org> <1602831532-24818-2-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1602831532-24818-2-git-send-email-rnayak@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 29 Oct 2020 15:02:55 +0100
Message-ID: <CACRpkdarjBLJFtM7-Cq=G40Bo9dEEgxuny=QDh5y0LogD3CQqA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add sc7280 pinctrl driver
To:     Rajendra Nayak <rnayak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 16, 2020 at 8:59 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:

> Add initial pinctrl driver to support pin configuration with
> pinctrl framework for SC7280 SoC
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

This came in during the merge window I think, waiting for
Bjorn to have a look at it.

Yours,
Linus Walleij
