Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B09F304100
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 15:55:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391355AbhAZOyi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 09:54:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405826AbhAZOyF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 09:54:05 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B9E6C0698C1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 06:53:25 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id q12so23044556lfo.12
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 06:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2FZjycms5gnBCIpvZP+ctIDCiLaUF2g3Z9pOjKVsdC0=;
        b=YC1EV9dV4gLXUfWerPjvjrjQdSJ+wwfVBcUDEIaM0flplCFVLxlAChsv3hzwWoy7iz
         Hi0S30M8VFmQ8BsE4iPn7f80s/c66XPGgfA2t01Mjh484dbNXrOpb2yVjTqtAWqQ8cRk
         mJPIODGZR5ngh8wJEIT1rYkNxEj7xy4zsGH23iGkEgzlXHb4YaNKMTbsEVlAIrHaH4hL
         p6GCSBNLjPJML3NJMc4PO7Ae3TbHCp5XPliFMWLGLT4LLDMNDN2snpJhaqoqZRs6RmuQ
         0+eMcBEjfyuknWpS8iMeqRNP3VFSQbHl0Yxb4FuYt/+hFHftJxrFFgZzJHMVB5HPhr3d
         slSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2FZjycms5gnBCIpvZP+ctIDCiLaUF2g3Z9pOjKVsdC0=;
        b=ftqLvtoeICAldgBN88Tac8k29ALJjK9/6gZjdCpPK70yMXr5j95+jv8Lddk8DxXxin
         Rq7fXco6dmlLNraIF8zuh0N82UB6HfQiFaJdpKkrbamqqhIAT06YuDqAfuQYnelqBX6l
         YTLEfjQUXyLoieMaakABc8CS5W/65IhHh6Fdd/C+FGiLZiSv9iHkODP+BNH+aOryzLNo
         zFyFx7m8qXS55xKpbm+75ZMpzKjhcNJdbdM44s4s80uqleBZogNrhcIPlybBdvVNSAF6
         Apsgr8sAhsolUNM5ONGoYJ6iRyueTHU2u95dFKuTZhAThsGGHvMJtpoBRmZaR117MBC+
         0vRg==
X-Gm-Message-State: AOAM5321FxmIu6jX47gj/VfPaTeIrMj+4xalwjdGyZT3TSN06eW9kG72
        b921nbJP5xSobOjgeZb7PeI4n0mn8fZqMU1yY5luYQ==
X-Google-Smtp-Source: ABdhPJyaXqdBSRbne+mx+lif6Cq8WwZOJakN0nseaAW1Q7KoMw1ocidpAn9dDfM8IO/W87GNbGvCW6b3/uPSuBZrfGs=
X-Received: by 2002:ac2:4285:: with SMTP id m5mr2653252lfh.649.1611672803601;
 Tue, 26 Jan 2021 06:53:23 -0800 (PST)
MIME-Version: 1.0
References: <20210115171115.123155-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210115171115.123155-1-konrad.dybcio@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jan 2021 15:53:12 +0100
Message-ID: <CACRpkdZ46OSTNited84091XzikVA9HFncmrX_iXZ62mGUJEmVQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom-pmic-gpio: Add support for pm8019
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 15, 2021 at 6:11 PM Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:

> PM8019 provides 6 GPIOs. Add a compatible to support that.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Patch applied.

Yours,
Linus Walleij
