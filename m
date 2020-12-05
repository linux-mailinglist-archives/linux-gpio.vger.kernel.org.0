Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBC662CFF47
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Dec 2020 22:37:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgLEVgd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Dec 2020 16:36:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbgLEVgd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Dec 2020 16:36:33 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EBA1C0613D1
        for <linux-gpio@vger.kernel.org>; Sat,  5 Dec 2020 13:35:52 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id x23so3701183lji.7
        for <linux-gpio@vger.kernel.org>; Sat, 05 Dec 2020 13:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S6yDFs+MOk2PtIoISDQLgO3LlwE7ZoVUixw+MtDWOT4=;
        b=WgW7YBiOCD+LJQM2IQJpa+jsEsAzvq5DYcY74cBIBQMW7q0cgpBp5dZIdy+VXzs6F3
         PGCzj6p4yBIbKK0W4AY01a79X/H0sRvA2veSM0MMm7Cnv599qf3sRdAaNbtj6PFKlXUq
         NEsJV0DQPU9ZKgFwancqtdBUaRiBWoXdJm/wP/sZ/2nazc/XDErRzdD5J2smHrKLKQtl
         vEVB+g6mp9vWbvO8RbakziFlGrmodgji56bU/GdEEau/SZaZDxNR1V+V43ukHdywSlb1
         wZj5UpsRC1zYCJEUidd9mYVrp2HSPGDF/vyx7VZCIDXLMOq8XD+ssCAk3lISpwz7+RjY
         K67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S6yDFs+MOk2PtIoISDQLgO3LlwE7ZoVUixw+MtDWOT4=;
        b=kK3MtDn38yuY8WitDitHGeCGSFyBSaWoUYXp4p7h8td7fyqt/Djle7jp+yVyTLqikF
         9GO2vkEXJFozrOA/VXsfV8at9+Y0IBcyA/sXyYSxSwWiOheWdAeC9EO973XFxyIDUxEV
         0OplwqHCUhAsG3617euZbtZIScclfB7vthE7z2DlNT2RfyQGV5sPczATAXESUhbybpk8
         q6PSkTvIpJFcxJkiYEdC2QoYXtQi2G7MedP9XsW22uadTNq7JNOrxUkSlbu/iYuniKuc
         m0OncZmBr2x7eYjvnLibeCsMGZCxr0qhjjwIsRS9FmKPd1ANyLKHstRdzfLyCE2Y84B9
         rbng==
X-Gm-Message-State: AOAM531fNSaSaXV/K0Z/8nl1h0BmYTix3DJf/V1eJ0b+DtMG3EcVz9zY
        NgCrgUFRa5wosLNldQbZKkqzC4EDjBHrmfcnCFDSarIPRyHBQg==
X-Google-Smtp-Source: ABdhPJxKTF3dU+xB0xBIpJKLMg6prHGMhqYwxnR9SzXhGrUGwCuiMg9nPL71f0IsJwTwEHW8snGIYf1ghEYUZ52PxgI=
X-Received: by 2002:a05:651c:c2:: with SMTP id 2mr5672345ljr.104.1607204151129;
 Sat, 05 Dec 2020 13:35:51 -0800 (PST)
MIME-Version: 1.0
References: <20201127140852.123192-1-thierry.reding@gmail.com> <20201127140852.123192-2-thierry.reding@gmail.com>
In-Reply-To: <20201127140852.123192-2-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Dec 2020 22:35:40 +0100
Message-ID: <CACRpkdY4-RN8KYn1scmoEHQucb4+FJtcpNX0TDYhUMLFiS3gGQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Use Tegra186-specific include guard
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 27, 2020 at 3:09 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Use a unique include guard for the Tegra186 GPIO DT bindings header to
> avoid clashes with the DT bindings header for earlier chips.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

This patch applied!

Yours,
Linus Walleij
