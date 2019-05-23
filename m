Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 946B828DAD
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 01:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387950AbfEWXQe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 May 2019 19:16:34 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33140 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387693AbfEWXQe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 May 2019 19:16:34 -0400
Received: by mail-pg1-f193.google.com with SMTP id h17so3928498pgv.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 May 2019 16:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=j+Ahz19ex7XWr3oM4b0BCZwJfhnPqDV5faYvx64bSeU=;
        b=UtoHRf5H+B8tbnt8kZF9MvzYAtUulMnruTQER+hkGMhFALT26ZBE7ZhMyokvRx8Gc6
         C+qsTl6sA8tPuMi9sHQu6SGqNJQevnN+gaLII+38iiP0YEKGeBM1z0pV+/M7wD8wKX1J
         ZbOkWdDGkZPR4KT2fvj6ZQxHyF6DCGos5riXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=j+Ahz19ex7XWr3oM4b0BCZwJfhnPqDV5faYvx64bSeU=;
        b=d9r0Z9OIIDSVnzskKeCXZoe0T8s0HZrqvTNv/a7ruqiwyyebaEWiuuEl71PWjyBXsF
         9wLZvX6fto22orF9hhKOFxTQ4FO2d/0lpyZc51tgpa3WsQJC17ySwzDS7CpqOlwUOQCy
         jbg8CYz8vtbReYVdyowvoZf/CvPyHH50m6ESx8BDnPtnTFOj9sINOONfQDvDTicJb6qb
         wjHL7wPkCXwfIRU18gvtE15ANtJIfcAHpJ2N3XXRvIgbO7XmxxGWWbdgrmZUf5p4cA7y
         8cPD+kR3xXtY9ZU+8NloL2aw+UjW81Hx8IKhUZIyHczo4kACw2C2e2a1Yg8ggIp3+9Fd
         5IEw==
X-Gm-Message-State: APjAAAULJKWNkTUPsbm3KxszEeusFwjJfBtDv4mcRSc8QoHpZ7uIrZ12
        Ghlo6wPSuA6Ii7tN7qZ9ekwRtsTbnWgk4g==
X-Google-Smtp-Source: APXvYqyd+Vfl8CD95Lr+fbVnDk2VK7U6gH1Rln8P7sr0LpSzqfMtQiy8RbHDamb2j+0jDl2SFrXeog==
X-Received: by 2002:a17:90a:1a84:: with SMTP id p4mr5138443pjp.15.1558653392450;
        Thu, 23 May 2019 16:16:32 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id o2sm402344pgq.50.2019.05.23.16.16.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 16:16:31 -0700 (PDT)
Message-ID: <5ce729cf.1c69fb81.83da5.1b6e@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CACRpkdZ95Np43+mbGAmWBTN1b=sE0Tos9h3_xNhEM5yZ_EMJgA@mail.gmail.com>
References: <20190523080654.19155-1-linus.walleij@linaro.org> <5ce6dddf.1c69fb81.8efac.03cf@mx.google.com> <CACRpkdZ95Np43+mbGAmWBTN1b=sE0Tos9h3_xNhEM5yZ_EMJgA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Enable device links to consumers
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Evan Green <evgreen@chromium.org>
To:     Linus Walleij <linus.walleij@linaro.org>
User-Agent: alot/0.8.1
Date:   Thu, 23 May 2019 16:16:30 -0700
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Linus Walleij (2019-05-23 12:26:20)
> On Thu, May 23, 2019 at 7:52 PM Stephen Boyd <swboyd@chromium.org> wrote:
>=20
> > Also, what is the usecase for device links in pinctrl?
>=20
> Most prominent is a device (such as a GPIO block or I2C
> block or something) that need to suspend before the pin
> controller itself suspend()s.

And this i2c block or GPIO block is using the pins from this pin
controller? Wouldn't the i2c or GPIO block have probe deferred if this
pin controller wasn't providing the pins yet?

>=20
> > Doesn't the
> > driver core reorder the suspend list when probing devices so that
> > devices that probe defer get moved later in list and thus suspended
> > first?
>=20
> AFAIK it does not, the device links however can do this so that
> the probe order does not have to use deferral at all.

I'm not too worried about using device links for probe ordering. I'm
saying that this probe defer logic in drivers/base/dd.c already takes
care of reordering the list so suspend/resume will be correct.

                /*
                 * Force the device to the end of the dpm_list since
                 * the PM code assumes that the order we add things to
                 * the list is a good order for suspend but deferred
                 * probe makes that very unsafe.
                 */
                device_pm_move_to_tail(dev);

Basically all providers will come before consumers and then suspend will
run through the list in reverse and suspend consumers first before
providers.

> But the
> links can also be added later at runtime (like when pin control
> states are requested by drivers) and that is what this patch
> does.

Ok, great! So if some consumer is only informing the provider of the
driver dependency after probe succeeds then this will help by fixing the
list order. This is what I'm looking for. It's unfortunate that devices
aren't getting all resources in probe so this could be avoided.

>=20
> By way of the chicken-and-egg problem we cannot really use
> these device links much for probe ordering, but they can
> readily be used to control suspend/resume sequencing
> like this.
>=20
> >I can understand that runtime suspend may be important because
> > order of suspend isn't fixed, but system suspend should be unaffected,
> > right?
>=20
> AFAIK both runtime PM and system suspend use the device
> links, this was implemented especially for system suspend/resume
> and tested with the STMFX driver on STM32.

Yes that's my understanding too.

>=20
> > >         pctrl->desc.npins =3D pctrl->soc->npins;
> > > +       pctrl->desc.link_consumers =3D true;
> >
> > Why is it an opt-in flag instead of a mandated feature for all pinctrl
> > providers?
>=20
> I am afraid of breaking stuff. (OK maybe I am chicken...)
>=20
> We slammed in device links in the DRM core and it exploded in
> our face. Because of fear of causing a similar debacle and
> having to back out all drivers that definately need this,
> I am making it opt-in for the moment.
>=20
> Once we have a feeling that this is not breaking (on e.g.
> qcom) we might just make it default to link all devices
> getting pinctrl states to their pin controllers.
>=20

Alright. Thanks!

