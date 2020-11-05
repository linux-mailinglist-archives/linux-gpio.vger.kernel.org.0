Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 482402A808C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 15:14:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgKEOOq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 09:14:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730808AbgKEOOq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 09:14:46 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3BDAC0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 06:14:45 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id 2so1705880ljj.13
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 06:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6nXYKuVORP7B94wEmyN1Arob0akGuTVDIGeIsrS6OGI=;
        b=Qex3rj+m8mIgn2EpmZZ/VWG5tqcDqUORzE2db7lmddvvvCZzDymGaZhVjmJEgNV2U9
         W08NfcBE0aCGSmdKT2Hf7mXdOthV6IyePH8AqwqGW2Oid+liVcGnIhHdSf/G9SfJXNEb
         Ytve7y2RRfVfPk0Q46sZX0NxuLhtfkOLQL7MLlQ+vXTkInEDZehR5REZC1CCAcbVp7BP
         jZVI2Fn+As/dfJvdr+pKjm88Kr1RRgg10zuVL8Sw2gz2Os9krFunCV2sv5f9VSVpR8Bm
         rGVXcrA5sbTs6JafwE9GEgkScGdykRws/V3qQmEbNr3VRQRxDbtjntKiVm9eio+JB3NN
         MQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6nXYKuVORP7B94wEmyN1Arob0akGuTVDIGeIsrS6OGI=;
        b=jivMglpDQCp8+DWgqhbTtyWhprIu+flIamUDedsUIP+6oaBzx95mFoaxdsdnEAp//r
         UUzo+4PO9o9LdafVairw1eRdnIC0uZDy065XLm9tvMeNVUIN9SbWB2b2tQTR8LIPDgUI
         2KJDLoIIS/kSRGfDP2WbxACexfWFSmGZjz1ODV1FhlwfRbv5qNWzNLQrMH8M4AWDoyEY
         txJ3F+Lr+KSotMQNKxJd4tzm8klaFw53vE1BRbTr+k6PXqzWRFSQuYV08BmdSrC8OrDN
         v9GujbF9wJW7DL9Din7wI79XSd96ILje1LTVBZA0EyClg1zlOIwk4bFvi0IbUSFQ9cmB
         v2Yw==
X-Gm-Message-State: AOAM533DruSWH/o8baHMaqarmJEtfaUkSbLVeTimQ4tYvW+cYj6P4Z5z
        kWhMpySh2/aNYYZwbgo9JdIVecOd9ozVcKrBe8fZEw==
X-Google-Smtp-Source: ABdhPJyPhM/gZvET1UQAiPayaB6I2Xc5LLn46i8OY9lmoJZuw/DORHMUXLUUGOa9CeOcUAeZ7OZHCI3PRgklFHEhXrY=
X-Received: by 2002:a2e:9b0c:: with SMTP id u12mr889261lji.338.1604585684224;
 Thu, 05 Nov 2020 06:14:44 -0800 (PST)
MIME-Version: 1.0
References: <20201103055801.472736-1-vkoul@kernel.org> <20201103055801.472736-2-vkoul@kernel.org>
In-Reply-To: <20201103055801.472736-2-vkoul@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 15:14:33 +0100
Message-ID: <CACRpkdYWC_Sn3k0Mk4Dh_ZkkTr0D5f6RYVj0VjZG_6hmNX6_=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add SDX55 pincontrol driver
To:     Vinod Koul <vkoul@kernel.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeevan Shriram <jshriram@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 3, 2020 at 6:58 AM Vinod Koul <vkoul@kernel.org> wrote:

> From: Jeevan Shriram <jshriram@codeaurora.org>
>
> Add initial Qualcomm SDX55 pinctrl driver to support pin configuration
> with pinctrl framewor for SDX55 SoC.
>
> Signed-off-by: Jeevan Shriram <jshriram@codeaurora.org>
> [ported from downstream and tidy up]
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

The v2 version looks nice, but Rob's bot is complaining about the YAML
bindings?

Please look into it when you have time, apart from this the patch
set seems complete, include Bjorn's ACKs on reposts please.

Yours,
Linus Walleij
