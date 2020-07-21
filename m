Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09DC4228198
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 16:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728342AbgGUOEq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 10:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgGUOEq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 10:04:46 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1C45C061794
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 07:04:45 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id z24so24176817ljn.8
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 07:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UtktXB94UoE1zwpGw4L7DaOAMB9VthZKcyfMWewtchM=;
        b=yLLccylqygcGxLogT7uDUU7Zoo5Gf+rgoWnJxkrvtrNuUUC2Rm99zffl7dgXLUcsxV
         JUsR4Mi/ot+fvK33v6Uu9vN0B0j5hKnXMEescl1VOpltOAT9W+Gc7AkhEo0n8b2nQ3N9
         d/+3tCKJOzeU0p9NOt2e8P3KvgBHGGWOMJu6pZa/vhd+Kz+Aay2PlVhVJ3TIu9jZxoPC
         r0KQv2Q360/8fCEcxHhs7RkvZv/6qZQ6+getRlZ//wMfZEIDwVEjPXekSUXa5CcHoapM
         VtDgPKHLENtTXQEZU/5R51RZaY8KybsI0FcI9GKc9mCGpjhucIPruaTfi5edb2oyHwpN
         f/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UtktXB94UoE1zwpGw4L7DaOAMB9VthZKcyfMWewtchM=;
        b=fhKc08vDcbAxu+gbpmqxOCoKr5RFJUuGrAclYS7CDGPdRWHMmiNnxfwvDIiqieYeYY
         t27KRJ2QwSfitKb61JhpqxjlI0c4yPGNEg6zX+bV5w25MmiZNlNZLI8NEdi94W4MnwLh
         0E9n8neqts9YRLGxYmeRcPb2a75MZMfheP3n8c3cDnOURLmoCs5LXO+El8A4EK/v9CsT
         AhTOEI2fM+ueWiM56wLmLS4PQoR21gcmH7F1h7+N33yBTpfyt8M9pAAZsgd804KcTpA9
         FVFnJcndEhSYl9eKqUHrRevc/X4i2QdbThmv4ZiWIPlOGi0vWD5XbOQIYY2/CpEmk5bV
         rE5A==
X-Gm-Message-State: AOAM533p1V1efZI6SJ3jBi/PfVe3zp5NCyO0lF6e6bQBNl2EC8alRz2t
        eNFq584rDzjHurV/k8t4GseSrtDzwIHPFBfeGULDmg==
X-Google-Smtp-Source: ABdhPJypCfBIap1qfVyDPf9GKnF6IcierHr4eIXAb39wsTOTb1+XEiOppOE1PPcvOhD3UUXSdtIpISL/xoX/eMJE4Q8=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr13595138ljg.100.1595340284205;
 Tue, 21 Jul 2020 07:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200720154548.12453-1-paul@crapouillou.net>
In-Reply-To: <20200720154548.12453-1-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 21 Jul 2020 16:04:33 +0200
Message-ID: <CACRpkdaqOFgjNkD0m0A3XTXYfh10YuAVYKxd-8cFk0WDsC0mZQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: ingenic,pinctrl: Support pinmux/pinconf nodes
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Rob Herring <robh+dt@kernel.org>, od@zcrc.me,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 20, 2020 at 5:45 PM Paul Cercueil <paul@crapouillou.net> wrote:

> Add YAML to describe the pinmux/pinconf sub-nodes of the pinctrl IP on
> Ingenic SoCs.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Patch applied.

Yours,
Linus Walleij
