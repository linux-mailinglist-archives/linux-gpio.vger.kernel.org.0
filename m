Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABD601A62B7
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2020 07:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgDMFqJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Apr 2020 01:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:43510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbgDMFqI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Apr 2020 01:46:08 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52939C008676
        for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2020 22:46:08 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id cb27so10643730edb.11
        for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2020 22:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FlXaTOr+kqY8flt8h5iVXY9Br/kqLO22K8KEByA6izQ=;
        b=tc6UrvOXwr3sXjeRrbWvKAa8Tlze9SysPRyOZENraq3tE4I0I/tBPhJG2EBV9hh0Fj
         gxiVIkO3ELJsAWl/FjrQeUkLDFjKKvknUqC4do40feBzjfef2B+aYOeBj2G1H6ZleXLa
         zqoiWKEVEtYed5vFpDV57oSul37uvT5xMRrWAIHxmVaP5UKLbJFSYqt4adESQC/Fdgol
         Yx+RlMFYtDnlyDnSbbwEX4KSdh/kwLhIT7Bq6SjDvLp1K7Rjv/UwNMJuiZSpoOCV4Ryn
         TWU4Oy/HH61rj+3hP6PGB1bdf48FFHS/i74A/uuTSXltzQyxdYS2Ovnh970wz9jFFKhN
         Gdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FlXaTOr+kqY8flt8h5iVXY9Br/kqLO22K8KEByA6izQ=;
        b=BL2Z6YOdVgoiIGH9Cs1ep7PPJO4q+uj2wFlP01jkuAWZ+jiuUy9mqGxPXixCVDCZvY
         svq82zvnfnNnNx1YANPjsU3qRpbWBWfGB4S1KAJ4CoZhBDmruAJeTZeoG4xrLQLhq5jG
         FW3SWo7OG2iOoxXP2s92vvX7UOM/IxR4poebAFgE/IbYMkqF9ZGFe9WN6njD6VW2VmtT
         O7eI0vXD5atO+/Khm4jpsw83PmrZ2AmT0mRi5HyQRHROycCNneZtY742Nv+zj9HkZcrV
         Cg+v9dhfxESXTHfAHso+ZKRhwPDUiS0K+Qv/W4jf8qinIGiIkoZPwmxL6ecLM6H3ZcZs
         dGlA==
X-Gm-Message-State: AGi0Puaa36ToO1kCZFpR9cfV4FyUk9O1Xu9BvK3Do9bqSp34uckuLKpP
        uJOSw2QOBT4mBH7LCQjqfI+xB8OrCVfy9jaky26WqryupCQ=
X-Google-Smtp-Source: APiQypInrvlU5bGjQlx0jw89DxxNYX+O4NcAzxruo5nm5KOED5jzqWzENORa8AnHwL+1rP6V+Lu2MrtiqCa8KYrLssI=
X-Received: by 2002:aa7:d588:: with SMTP id r8mr15358689edq.17.1586756766896;
 Sun, 12 Apr 2020 22:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <1586702060-3769-1-git-send-email-amittomer25@gmail.com>
 <2d629e23-ddb1-6033-5ea3-fe9e02476e18@suse.de> <20200413044959.GA3071@Mani-XPS-13-9360>
In-Reply-To: <20200413044959.GA3071@Mani-XPS-13-9360>
From:   Amit Tomer <amittomer25@gmail.com>
Date:   Mon, 13 Apr 2020 11:15:30 +0530
Message-ID: <CABHD4K_HS9QmL+X6hS-4gHfMYr9UW7_J0KL+byR1Wt4V5mvpiA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: actions: fix function group name for i2c0_group
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Andre Przywara <andre.przywara@arm.com>,
        matheus@castello.eng.br, Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-actions@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Mani,

> Amit, you can use something like this
>
> git log -1 --abbrev-commit --pretty=format:"Fixes: %h (\"%s\")%n" <commit-hash>

Yeah, I already had this enabled in my git config:

[pretty]
        fixes = Fixes: %h (\"%s\")
        picked = Cherry-Picked: %h (\"%s\")

and then I generated it using:

git log --pretty=fixes -1 6f87359e8bcaf88381b9c9c038929e0e6872d308
Fixes: 6f87359 ("pinctrl: actions: Fix functions groups names for S700 SoC")

But seems to only generates 7 chars for commit hash

Thanks
Amit
