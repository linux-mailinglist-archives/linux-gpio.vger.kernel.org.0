Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03EEBEE3E4
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729293AbfKDPdy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:33:54 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43480 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728144AbfKDPdw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:33:52 -0500
Received: by mail-lj1-f195.google.com with SMTP id y23so7198203ljh.10
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DBMbcScUQGQZVNBdTsiLXor9xyXQU7D+1E9hPAM9ZKA=;
        b=Y17/dQyIIuBV7qFVbf3hljdrzyzDXMH3+Q7l6qUsJpgq4TKcHmzgXg3WqeQuOs/Ofr
         mt2X8W/YV22xCxDSI7shE92hjOUSTvROnDYbTxNm1xYEndn+xp9O/ei1MZbUJxV6NJoN
         xZausHHAo7VcDDwOsRj9NvgnwvXaFD92HMPjiSmUcBMYtj9mw0nxOc+p3cXXndAcjDnk
         aGaq3jsRxA2dLzVTii61YjV/gf2b54iJ3BhoYJ/OCVyMlTmGJ9i0FMaiTKNYRj5YNy61
         u2YAwqRk7R6fyPzl2R98OqG+hOyGHDz1J36kBp1LS+6gSTEBnwLs13XR2sHVIs/RcOiK
         davQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DBMbcScUQGQZVNBdTsiLXor9xyXQU7D+1E9hPAM9ZKA=;
        b=r0HtoMP7G0ya2efCf0y7rV9KYePd/VB5m/yCu+VhLWqyac+MlmD+2UB1xLKRL4OeZJ
         IUyibJJWdMvkB0e685Po84oEs5175Ts1bEVDCA6eAGMVqHXNqu4yx9dZ7kikOy4jnGk7
         +PE8ZRrylGLvBQEsti/zyUCbNW5FKr7ymbPW+R1hbOUoN7PKGlgrdxEGR8qzKpM59yUI
         Dk0NN8eMT7PFJ3d7yqfIi/+rRFwws2gvmfd8Z1Po1wcZXwfEgIHB0BAF1boN0/oQyNZt
         IErR8hPG6uE8/Sh92vICM/kU4Vu+NNeCehvMj/jJPe/FxvGSTv49zAAz+vpuuLAsneVJ
         /DxQ==
X-Gm-Message-State: APjAAAVPP6YIaaTg/QeJC/SQ1s88vT3xDnGglM4HKhzyAHLrf4+43XZt
        WPKpI/i1ynLf4TKYRbQhW8NKDrgl2QmNV1+gLBx3+Q==
X-Google-Smtp-Source: APXvYqzeyNb16dPEjCkVmBtMh5caBJBGKo91VcHGLZKHPNSD5nRiCk1pJcF4RPBtbEVrq+xcQYHHZlXiwcUyrN8+Ke8=
X-Received: by 2002:a2e:9a12:: with SMTP id o18mr11818095lji.191.1572881630658;
 Mon, 04 Nov 2019 07:33:50 -0800 (PST)
MIME-Version: 1.0
References: <1572004167-24150-1-git-send-email-qianggui.song@amlogic.com>
 <1572004167-24150-2-git-send-email-qianggui.song@amlogic.com> <CACRpkdZZpc0yrewfseG3PUXgvV3H9XED25Ej21VeMYn8cUxasg@mail.gmail.com>
In-Reply-To: <CACRpkdZZpc0yrewfseG3PUXgvV3H9XED25Ej21VeMYn8cUxasg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 16:33:39 +0100
Message-ID: <CACRpkdZbvdVfLAmfPRXrrZCvyNCJWHkJCE_SBCb9W=O2UpMxrQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] pinctrl: add compatible for Amlogic Meson A1 pin controller
To:     Qianggui Song <qianggui.song@amlogic.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Carlo Caione <carlo@caione.org>,
        Rob Herring <robh+dt@kernel.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 4, 2019 at 4:31 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Oct 25, 2019 at 1:49 PM Qianggui Song <qianggui.song@amlogic.com> wrote:
>
> > Add new compatible name for Amlogic's Meson-A1 pin controller
> > add a dt-binding header file which document the detail pin names.
> > Note that A1 doesn't need DS bank reg any more, use gpio reg as
> > base.
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> > Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
>
> Patch applied.

I see there are still comments on the code patches but that is
fine, we can merge these bindings anyway. Just resend the
remaining 3 patches when you repost.

Yours,
Linus Walleij
