Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8DA71B3E47
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2020 12:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730803AbgDVK07 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Apr 2020 06:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730797AbgDVK06 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Apr 2020 06:26:58 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34DEAC03C1A8
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2020 03:26:58 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id w3so761462plz.5
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2020 03:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=6gdINTWw5qbNqv+goCkAx9WxOclB6kfMGhupWamyF/Q=;
        b=XNRaT88T1nqiUZ51J9UejP6i7hnQv7eU7Uue7ieUv0Az3LPOAyUC97V8zUzOY7UV3P
         7vS9knLlETaJKXjxoJO5Nd29sCjQR0b5lVKY+ZUpsO/rQYe7B0eMZZ9OhMsOoHv7AAnO
         lj7bnr88UGowfAV2pYpeiEXswsaPg8GYpgJOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=6gdINTWw5qbNqv+goCkAx9WxOclB6kfMGhupWamyF/Q=;
        b=YazTJTHrveazjmae0CIFWVNvQwjD+PePpz2TR2t+bN1z8Q6wTLFI9Ifqcx7/7GL322
         5aPgWyPaaOXxeKNaMgTdtXS/u1G4cqVLc8fY9grh1IosJ09Dxc/E7Jq+bJbTjWjAuCtl
         9VzltYljiAUm5mGw1kMmCrh6F7am6DLBRqRTcghl6JlJM0XLbZa8tbWBfe0rocarL0DT
         q06qCJIiqDjWX+bxqia7XtXHV8sP2SozEE7jr2za3YgUDbfCkmi5uNK167pu2CYFfRzJ
         xCvnRUiUEjqpClbPf+LrStA3FCf24Lpdcgbr/YUxO7JxIATboTojVq52suBfkedNhF2Z
         ta1Q==
X-Gm-Message-State: AGi0PuZgX9cehzxV7ypl47GNwvdi3NQLbqoxzC0rotaJlZDp32DTNM7q
        xO+nIg0dwSH7Ba9lig/0TNrDkw==
X-Google-Smtp-Source: APiQypIskeEJItuLaEBjMhbnRTsFEb0DYilPaPMtUzz55q/ztGTMyUgTbonADiaJsrnVUd76J6a9Uw==
X-Received: by 2002:a17:90a:cb09:: with SMTP id z9mr11612172pjt.120.1587551217755;
        Wed, 22 Apr 2020 03:26:57 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id p2sm3994378pgh.25.2020.04.22.03.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 03:26:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200420220458.v2.6.I89df9b6094549b8149aa8b8347f7401c678055b0@changeid>
References: <20200421050622.8113-1-dianders@chromium.org> <20200420220458.v2.6.I89df9b6094549b8149aa8b8347f7401c678055b0@changeid>
Subject: Re: [PATCH v2 6/6] arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     jonas@kwiboo.se, jeffrey.l.hugo@gmail.com,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        jernej.skrabec@siol.net, bjorn.andersson@linaro.org,
        robdclark@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Laurent.pinchart@ideasonboard.com, a.hajda@samsung.com,
        airlied@linux.ie, bgolaszewski@baylibre.com, daniel@ffwll.ch,
        linus.walleij@linaro.org, narmstrong@baylibre.com,
        robh+dt@kernel.org, spanda@codeaurora.org
Date:   Wed, 22 Apr 2020 03:26:56 -0700
Message-ID: <158755121629.159702.14849607096816306080@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Douglas Anderson (2020-04-20 22:06:22)
> We don't have the HPD line hooked up to the bridge chip.  Add it as
> suggested in the patch ("dt-bindings: drm/bridge: ti-sn65dsi86:
> Document no-hpd").
>=20
> NOTE: this patch isn't expected to have any effect but just keeps us
> cleaner for the future.  Currently the driver in Linux just assumes
> that nobody has HPD hooked up.  This change allows us to later
> implement HPD support in the driver without messing up sdm845-cheza.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
