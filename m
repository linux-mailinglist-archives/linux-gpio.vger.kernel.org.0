Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC329B9999
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Sep 2019 00:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730018AbfITWU2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Sep 2019 18:20:28 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41355 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbfITWU2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Sep 2019 18:20:28 -0400
Received: by mail-pl1-f195.google.com with SMTP id t10so3822456plr.8
        for <linux-gpio@vger.kernel.org>; Fri, 20 Sep 2019 15:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=G6ArsEBvUBRFvndBKzVZmq8gvZ8T+N7qYPjPD+3Z5yo=;
        b=nRlHbGH5wNwG5+TmN8Kv4+cFBbowXlpJ1u8t4kt1EkGEUblzPAiKYRS3o8mTTeSuWK
         jiQgSAlVukgSn/p9gKZzwOy0fFtmRQdU3027Bytif2lW1DugSKor9x03okTp0yc2RCXH
         +AUJjbXZcdcM1CTFdNGGh1ksWA14j1kdNkTgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=G6ArsEBvUBRFvndBKzVZmq8gvZ8T+N7qYPjPD+3Z5yo=;
        b=B5m0ng787GP/lD6stkRkbXbid6gL6zWRHBYJF2nRym7mATElyddnKd7NGUAix4Tim4
         CF8D7YLEJE93FawWqqRyof4IPADFXDGfar8Xacshq444tt7IYV/TBCxzrnZlDyKhJPK2
         uNNVV7m/FQHHmmpC602UERyGiWmHkYixqjAUi7PyEvjM+YOy2o+rtvNtcDOaXRaw3g9s
         Zhc8+ex/1R0givyx05dTvhlABBxHsUeq44haRDfWi8Ww6rNcJdB/WV7rKH4LfFFiy3XP
         88kR8oAPasdl7rJmU7HeLKZtxjyNvbat7cQw6jnObXX0kZFz46+jdSK2CkGKWbQ/HTMn
         If7g==
X-Gm-Message-State: APjAAAUJRLYW1wVDKwMheCYX4pbICkL3yi28mL30qGEFPVyqSLMJ0siL
        VzGnAt1h+P3xizRbSRLa6FAjWw==
X-Google-Smtp-Source: APXvYqxPOvFQKjjFVKyK+RgTiwbSXqMoV+qulfuBR8SdTO6EJKRGIkHEVxF3TOJ3gdJ4DQZv4biPHQ==
X-Received: by 2002:a17:902:a9c7:: with SMTP id b7mr19438785plr.133.1569018027798;
        Fri, 20 Sep 2019 15:20:27 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id p88sm3152333pjp.22.2019.09.20.15.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 15:20:26 -0700 (PDT)
Message-ID: <5d8550aa.1c69fb81.39edc.83fc@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190917215020.GA15853@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org> <20190829181203.2660-6-ilina@codeaurora.org> <5d6d1b72.1c69fb81.ee88.efcf@mx.google.com> <102c9268-c4ce-6133-3b0a-67c2fcba1e7a@arm.com> <20190903170722.GA31716@codeaurora.org> <5d71a247.1c69fb81.2146f.7ed2@mx.google.com> <20190913195326.GA3293@codeaurora.org> <20190917215020.GA15853@codeaurora.org>
Cc:     Rob Herring <robh@kernel.org>, evgreen@chromium.org,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        mkshah@codeaurora.org, linux-gpio@vger.kernel.org,
        rnayak@codeaurora.org, devicetree@vger.kernel.org, maz@kernel.org,
        sibis@codeaurora.org
To:     Lina Iyer <ilina@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH RFC 05/14] dt-bindings/interrupt-controller: pdc: add SPI config register
User-Agent: alot/0.8.1
Date:   Fri, 20 Sep 2019 15:20:25 -0700
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Lina Iyer (2019-09-17 14:50:20)
> On Fri, Sep 13 2019 at 13:53 -0600, Lina Iyer wrote:
> >On Thu, Sep 05 2019 at 18:03 -0600, Stephen Boyd wrote:
> >>Quoting Lina Iyer (2019-09-03 10:07:22)
> >>>On Mon, Sep 02 2019 at 07:58 -0600, Marc Zyngier wrote:
> >>>>On 02/09/2019 14:38, Rob Herring wrote:
> >>>>> On Thu, Aug 29, 2019 at 12:11:54PM -0600, Lina Iyer wrote:
> >>>These are not GIC registers but located on the PDC interface to the GI=
C.
> >>>They may or may not be secure access controlled, depending on the SoC.
> >>>
> >>
> >>It looks like it falls under this "mailbox" device which is really the
> >>catch all bucket for bits with no home besides they're related to the
> >>apps CPUs/subsystem.
> >>
> >Thanks for pointing to this.
> >>      apss_shared: mailbox@17990000 {
> >>              compatible =3D "qcom,sdm845-apss-shared";
> >>              reg =3D <0 0x17990000 0 0x1000>;
> >But this doesn't seem correct. The registers in this page are all not
> >mailbox door bell registers. We should restrict the space allocated to
> >the mbox to 0xC or something, definitely, not the whole page. They all
> >cannot be treated as a mailbox registers.

Well the binding is already done and this is the compatible string for
this node and register region. Sounds like this node is a mailbox plus
some more stuff in the same page.

> >>              #mbox-cells =3D <1>;
> >>      };
> >>
> >>Can you point to this node with a phandle and then parse the reg
> >>property out of it to use in the scm readl/writel APIs? Maybe it can be
> >>a two cell property with <&apps_shared 0xf0> to indicate the offset to
> >>the registers to read/write? In non-secure mode presumably we need to
> >>also write these registers? Good news is that there's a regmap for this
> >>driver already, so maybe that can be acquired from the pdc driver.
> >>
> >The register space collection seems to be mix of different types of
> >application processor registers that should probably not be grouped up
> >under one subsystem. A single regmap doesn't seem correct either.

Why isn't a single regmap correct? The PDC driver should be able to use
it to read/write into this register space. The lock on the regmap will
need to be changed to a raw lock though for RT. Otherwise it looks OK to
me.

