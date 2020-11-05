Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2412F2A803E
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 15:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730799AbgKEOB0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 09:01:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgKEOBZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 09:01:25 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B74EC0613D3
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 06:01:25 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id y184so2404876lfa.12
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 06:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YTXLlhkJUN9wDt8Jv8WPFw5g42cb2iR5qevTYziYtbk=;
        b=OK14Bnt3+9IeiZ6/M6McIw1LkFDy9LJWahWCHGMdSqbBSVOwLBmGir1yeEiClM89/t
         mvkzJ1x4S9L/syjymwTkxNlizAAYao/MnA3qdsfAyStk6SQL6fZelVeqox0kMIKl5n6Z
         zWgT6iKuOLL65ScYqJ9M5GQOeS5dsGoxshMLkR/qPSjvJvtAVBJaR49hdvDSfovIowtc
         3XNGfaMTuA6XkPTGawdpx563b5LgCrVgSYFmkYUMhjvmWqZMmmYJL2P1zZzHPCgXSEXe
         ivOCZq3p2hVOqsSq0HXrEmRt4VoRkEnVD9J2Gyvpfkc7mBArdUCN/6FJODadaK6LpIt3
         /EmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YTXLlhkJUN9wDt8Jv8WPFw5g42cb2iR5qevTYziYtbk=;
        b=kjs9TfumHZuoJg8s0nR/HQirDWenJgCBF+MfhmEF/NXMtst5rlxJ+NFhfxpkBYZpGp
         OgkXc+kaK8+BCP0wocc6FXf7edAn/fArMt6HnRpbIKoSu7yfbkR1DYzZ0MeAeioU81uy
         APx4OkbR27jSi3f3afDzACMjtUHKHft/keTPEkjP5cLUxOuaqW9IqYC2ykXmrvjIni18
         KgGv64GXoo5EGi13Ad9LbHf1U6RksERi9l76k4iKHk3bipHG/fmX8hxw2FXo4cAeo39C
         U9gc97snULSszS5y1X655RIOTY/9u4JgqFvdv+VCYjbAzTKGjAursLD+iA5Sgi2jhwRX
         x0gA==
X-Gm-Message-State: AOAM531T5zJlCuxGq7z0BtZJMhmbf9l9bhR65vgBQ9voAUKmMveSIKct
        zaKeJVhPDZulBkuLlnGh2k+x9J5xADmvLFdO4yPAXg==
X-Google-Smtp-Source: ABdhPJzvM65+qqxut8Q8K9FX99fxAPBlc0gUibPjENKKmydRQK0QV33V0O2d25Zm7Cor//tf/DGwRsM1lFrKsUhrY3k=
X-Received: by 2002:a19:824f:: with SMTP id e76mr987111lfd.572.1604584882549;
 Thu, 05 Nov 2020 06:01:22 -0800 (PST)
MIME-Version: 1.0
References: <20201007160611.942754-1-junak.pub@gmail.com>
In-Reply-To: <20201007160611.942754-1-junak.pub@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 15:01:08 +0100
Message-ID: <CACRpkdY_SHWbHpsHQiQswQ9DzSLH-P=tAmeHG2JddQZ76_-0mQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: add pinctrl driver for msm8953
To:     Vladimir Lypak <junak.pub@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 7, 2020 at 6:26 PM Vladimir Lypak <junak.pub@gmail.com> wrote:

> Add inititial pinctrl driver for MSM8953 platform. Compatible SoCs are:
> MSM8953, APQ8053, SDM(SDA)450, SDM(SDA)632.
> Based off CAF implementation.
>
> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
> ---
> Changes in V2:
> - sorted SDC_QDSD_PINGROUP entries in msm8953_groups array.

Both patches applied, thanks!

Yours,
Linus Walleij
