Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44D09FE5A5
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 20:34:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfKOTeF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 14:34:05 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42346 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfKOTeF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 14:34:05 -0500
Received: by mail-pg1-f195.google.com with SMTP id q17so6444897pgt.9
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 11:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=xLEUh/riVKZl3nidz8hFnBNoktlKjKDj3uK+ry9UxX8=;
        b=AsfKMKZ9ndpJ4sIxnYyEH1N4U+Wl2uLHno30dFzLbAEXcvDzizC9PAIX/TYn7WSt52
         rGs7VKxK+mOsZYoVBFoaPOHSyx8Dh8GN47fHLWSB1Ohb9kDasF3YL6FznaILFDFF+Wzz
         E4sSZdHdQfCxbK9MxIwQUfFMiXZUQBY8cxnOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=xLEUh/riVKZl3nidz8hFnBNoktlKjKDj3uK+ry9UxX8=;
        b=SHX6LTISTwiuPrLDwiRozA5O/2PmOcByD6eL4aaQ9QMiHJhoLW40cAnUjiuHuFBxnx
         biKXp8r5LRjJR0flw79Lxq0Ilch/MY1Erwcphlsl+kCf0t602z6/kvfzhUv/B/h6PIHe
         1KYyoo59gl+9HtDTrgM8ZKJnsNersOk67MkelF0YCQl/FDJQL1K/WgT51+4aBBIlrbmg
         1OEn7/4v6WM1r0j5umxJ7YvX1YVmz7gEiFRQQ6NsaFNdWQrYCf7UHjeL74wxxSIvGhrv
         mijbCbN0+N8hfisFYwzoy/Bf/VlAA8DxSp1VJSFGRyQS6TjjTv+99GdAL6jF4gsOptBT
         QkcQ==
X-Gm-Message-State: APjAAAVJZBvpea3LL9rTs3DZe8OwysLiAzr5ZWGGR0nbgYx7uli3qtLG
        6iy8CMzdopBev4e0k5gXNdpNOw==
X-Google-Smtp-Source: APXvYqxLZRa0pdBNJMyUWus8AtY6DYfVyFRfJsSDK0k4G3/rSZaowBAP8ZcdXr04p+oOmZ9mMtiazg==
X-Received: by 2002:a63:1065:: with SMTP id 37mr17973207pgq.31.1573846444406;
        Fri, 15 Nov 2019 11:34:04 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id f185sm12255392pfb.183.2019.11.15.11.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 11:34:03 -0800 (PST)
Message-ID: <5dcefdab.1c69fb81.1c363.3d12@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573756521-27373-11-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org> <1573756521-27373-11-git-send-email-ilina@codeaurora.org>
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, maz@kernel.org
Subject: Re: [PATCH 10/12] arm64: dts: qcom: add PDC interrupt controller for SDM845
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 11:34:03 -0800
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Lina Iyer (2019-11-14 10:35:19)
> Add PDC interrupt controller device bindings for SDM845.
>=20
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

