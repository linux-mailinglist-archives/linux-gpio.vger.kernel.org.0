Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4062047507E
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Dec 2021 02:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238872AbhLOB24 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Dec 2021 20:28:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238814AbhLOB2z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Dec 2021 20:28:55 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91650C06173F
        for <linux-gpio@vger.kernel.org>; Tue, 14 Dec 2021 17:28:55 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id 47-20020a9d0332000000b005798ac20d72so22967533otv.9
        for <linux-gpio@vger.kernel.org>; Tue, 14 Dec 2021 17:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to;
        bh=vsh1MhG90sktMnN9grpR54l4uKx6Z6N5tsDDxbZW6o0=;
        b=JGU0cApMNO/QObrJvFbIIED25d0QAjNji23cp4HxXLFGTpEnaeb2d947VuokTPrJh4
         GxqIDaSVHw/ZVrgLLUJ36p6hc4fc2Ao3NBWHZY9233yxuiRmSq0+VA+k2c7w+AK1ethh
         pIXA/919loix9H/jY9SRtqVmU7bJ5WRstSyhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to;
        bh=vsh1MhG90sktMnN9grpR54l4uKx6Z6N5tsDDxbZW6o0=;
        b=ZKl9PLMUuH80Lpgc8pk5bCSpv8j8FrwHBdklQOk05NQF+Cp2j3crMmfsjpIbQc4lTk
         B7o+JzEzyc3f7RzTK1ZSG3fSN9+c2AcsppTMmSFbPMAA/Y+Zcbk6cEa/ATRwHv7eFDVY
         J7+CvhWj+RKW5Q4ye6B7XTKchwRPIbb7ItupmaaTlKfkL3oGt79cWTH6LfDj/GYiDxbW
         pbWesOv8+mFkmK9tebj1sPF9nqPBs8nv1TB/Qmi9iGk0lUCfxFUDxTxBKNgpqsp1hBwb
         qtmhbOyVURP1xoCSMWZIzfZsMfOP+POe2fDQhqw8bv9HDQ6wI2Ub2WAstcbCeF8miFoW
         QpoQ==
X-Gm-Message-State: AOAM5320BjWWXl2roFC/0R7IJOIO3hofrqUj+bdnDUV3lONgTk2+BtDN
        v10yCM822PIjReWMZ6tSHjkOsgQQJOSU5cpaqPfx3w==
X-Google-Smtp-Source: ABdhPJwVvIEVSzGWkZ6r6tum5sN5c25e8CxEhW4XCE5QW3Fp24XzJo9z3AmfNkACncaxRnmD6mxorka5IqffVKX3Lug=
X-Received: by 2002:a9d:70ce:: with SMTP id w14mr6875613otj.77.1639531734897;
 Tue, 14 Dec 2021 17:28:54 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Dec 2021 02:28:54 +0100
MIME-Version: 1.0
In-Reply-To: <1638891339-21806-1-git-send-email-quic_srivasam@quicinc.com>
References: <1638891339-21806-1-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 15 Dec 2021 02:28:54 +0100
Message-ID: <CAE-0n527T71LPe5R+S+YzEqiid2-QrFdvS2T7MWrakTccyG45w@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Add pin control support for lpass sc7280
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
        robh+dt@kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2021-12-07 07:35:34)
> This patch series is to split lpass variant common pin control
> functions and SoC specific functions and to add lpass sc7280 pincontrol support.
> It also Adds dt-bindings for lpass sc7280 lpass lpi pincontrol.

What ensures that the LPI pins are being muxed out on the pads of the
SoC? There's the eGPIO support in the tlmm driver, which seems to let us
override the LPI pins and mux them away from this pinctrl device to the
tlmm pinctrl device. Should this driver be requesting gpios from tlmm
and making sure they're not muxed away to tlmm so we don't have
conflicts?
