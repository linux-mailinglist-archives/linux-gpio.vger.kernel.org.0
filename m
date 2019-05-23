Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E63428552
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2019 19:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731450AbfEWRwd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 May 2019 13:52:33 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40650 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730928AbfEWRwc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 May 2019 13:52:32 -0400
Received: by mail-pg1-f195.google.com with SMTP id d30so3515985pgm.7
        for <linux-gpio@vger.kernel.org>; Thu, 23 May 2019 10:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=UrXnnQ33Tfh0IwHhrolHqHt7nDIlbIW0sSrF3BDtDyw=;
        b=nnUIGQYXFqnYY/knr+uDdU89mgV4My2CcFgP9MqSRPaPYV+rAYNivd8oaH/QX5US8q
         vkWLVZO2geUVh17cjilv2/rJMkYQ+0UWQMPSeNmxKqU0CMxD89vpptm36l9oFiJ3xRkc
         osmDdk/bTOKhNUxoczD3kdAjTNUKBeDcfYYh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=UrXnnQ33Tfh0IwHhrolHqHt7nDIlbIW0sSrF3BDtDyw=;
        b=SInSvHSH7j8/xbAjosHToZtu9TZSW9sV0Mm/xq64oDuDpttQIgIFTzp0L/Y0+6VyTo
         KYZ9FNpL/4txAcBm4fuBWpFetiRDwf2YxuDeKd+T39gTr6NlLiRUVfi311QwLMADeQf/
         1vS/1bi4/yoAUxtNYfvGva8pEQPNafKY+Gzve/XNMZy8HII57PFTvyPByT/0h5Tg9oVq
         pjhQ+MHd8fUvCtEe1EBKQ4H3eLZLOXCGSVAsQbUVLqntv5gS5qitG0WUvLFZRDHtaolE
         ti4jMrdvSnkpMHLYNDuhjX9zzOuPKkCC3sv43Kix0inG85mKUb8YACmWb25Pm43/PMXp
         KR4Q==
X-Gm-Message-State: APjAAAXwA+Qmg2SLdqrcf0x1mOKH/Q/RvCy0Lo43e0/blSDrbvCXUK4u
        Dbah0QqS+3ppoRrYQcs/ZtyfmA==
X-Google-Smtp-Source: APXvYqxNcC9D8jcVwGCdDqIQCwIkhiDst9LLsg5JMcXhi8uWHiwEOSGgRIuQBid1v8gmf89vGseuKA==
X-Received: by 2002:aa7:9203:: with SMTP id 3mr107005266pfo.123.1558633952091;
        Thu, 23 May 2019 10:52:32 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id z14sm71707pfk.73.2019.05.23.10.52.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 10:52:31 -0700 (PDT)
Message-ID: <5ce6dddf.1c69fb81.8efac.03cf@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190523080654.19155-1-linus.walleij@linaro.org>
References: <20190523080654.19155-1-linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: Enable device links to consumers
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Evan Green <evgreen@chromium.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Thu, 23 May 2019 10:52:30 -0700
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Linus Walleij (2019-05-23 01:06:54)
> A recent core change makes it possible to create device links
> between a pin controller and its consumers. This is necessary
> to ascertain the right suspend/resume order for the devices:
> if a device is using a certain pin control state and want
> to switch that before/after going to suspend, then the pin
> controller may not be suspended already, and conversely
> on the resume path.
>=20
> Make sure any qcom pin control consumers are suspended before
> the qcom pin control is suspended.
>=20
> Since Qualcomm is one of the few pin controllers implementing
> suspend/resume I suppose you will see this problem sooner
> or later so let's see if we can just fix it right now before
> you run into it.
>=20
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Brian Masney <masneyb@onstation.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> You can test this patch by pulling in this branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/=
log/?h=3Dconsumer-links
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
>  1 file changed, 1 insertion(+)

I don't know how much it will matter for qcom right now. This pinctrl
driver just forces over some suspend pins for the hogs during suspend,
so it's not like drivers that are suspended after this moves hogs over
will break, unless somehow the hogs change behavior of the pins those
other drivers are using which doesn't seem possible.

Also, what is the usecase for device links in pinctrl? Doesn't the
driver core reorder the suspend list when probing devices so that
devices that probe defer get moved later in list and thus suspended
first? I can understand that runtime suspend may be important because
order of suspend isn't fixed, but system suspend should be unaffected,
right?

>=20
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pi=
nctrl-msm.c
> index ee8119879c4c..d4a6edbccdb9 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1139,6 +1139,7 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>         pctrl->desc.name =3D dev_name(&pdev->dev);
>         pctrl->desc.pins =3D pctrl->soc->pins;
>         pctrl->desc.npins =3D pctrl->soc->npins;
> +       pctrl->desc.link_consumers =3D true;

Why is it an opt-in flag instead of a mandated feature for all pinctrl
providers?

