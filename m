Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F26DFE5A8
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 20:34:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbfKOTeO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 14:34:14 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45087 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727032AbfKOTeO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 14:34:14 -0500
Received: by mail-pf1-f194.google.com with SMTP id z4so7131456pfn.12
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 11:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=x1XjP2ZN7/tQbjNyJSEeKHhOtBXtyu18zSEBMROs5yQ=;
        b=DviZVcAobf5IxDwNdrF+/D94iZ9/glrY2mr8v9zO+ID5VTM0tOiU0j1v7oSlcWpbwn
         4GWacTjAFjrESFGvUr/NZ6WjnAZYQ90rKNII3V4Z2dxIzPRcY3N3gQtAf7Ufu3z/OtJU
         9QvtFE/D3dvZ/g3Kh6OU4yYAAvSzfKjoqP+HE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=x1XjP2ZN7/tQbjNyJSEeKHhOtBXtyu18zSEBMROs5yQ=;
        b=G4vsyA0cCqzm9JPEAVhoFZr08Aj1GW+Wv21b8SZB3GJhWXD1Edj5Qy1ncV/qBNyn4r
         Wxz/OQZxbzwnWbAPVUKxVBZOUgKrEAPNCWM/hgZ5gPv13pAo5ppiPhs3eQBFso3caBo7
         +OBjwVRCJwmQgNODHdEGjZ3LC9s8Pxhc4U4P/3pTCBHkyldzzps5YWIh6e2m+2Glqmx5
         VkVjn3cMIPqQstaKMoIa2Fg3sMOTd8MzDSsOSwajEcRwhx3TxHC5rD0MSb/VMUQ1ZI9K
         5lEn+Bs8wXXTYLyh+ndq2neBeJ3hRbKvyPM5NKLH0r+qaztKlfMjZhUMRIRMhQKD7UfN
         +cUQ==
X-Gm-Message-State: APjAAAUnYyIoB1i5DAH12omSsUDaJqQSsYW3xJeIpDthfHQHAOEFKpL+
        uBfdTruplFx/f3rAm3WslK/sZw==
X-Google-Smtp-Source: APXvYqzB7awY2WhcJYYDNmFoY1nTBjUQVHfClUslAQJlPQKbySiPMxMH+O64wNtHZXgI0csMLTWP1w==
X-Received: by 2002:a63:134a:: with SMTP id 10mr17963921pgt.441.1573846453275;
        Fri, 15 Nov 2019 11:34:13 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id t8sm9831389pji.11.2019.11.15.11.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 11:34:12 -0800 (PST)
Message-ID: <5dcefdb4.1c69fb81.9737d.c912@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573756521-27373-12-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org> <1573756521-27373-12-git-send-email-ilina@codeaurora.org>
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, maz@kernel.org
Subject: Re: [PATCH 11/12] arm64: dts: qcom: setup PDC as the wakeup parent for TLMM on SDM845
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 11:34:11 -0800
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Lina Iyer (2019-11-14 10:35:20)
> PDC always-on interrupt controller can detect certain GPIOs even when
> the TLMM interrupt controller is powered off. Link the PDC as TLMM's
> wakeup parent.
>=20
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

