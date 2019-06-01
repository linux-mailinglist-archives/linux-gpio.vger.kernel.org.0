Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 425ED32011
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2019 19:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbfFARVn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Jun 2019 13:21:43 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34001 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbfFARVn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Jun 2019 13:21:43 -0400
Received: by mail-lj1-f196.google.com with SMTP id j24so12559907ljg.1
        for <linux-gpio@vger.kernel.org>; Sat, 01 Jun 2019 10:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tccTfkPaCkJqRCXrpmp0F9b3WbVNC0IPQMXCiDJx7Zw=;
        b=UZtlyyL6Ejbc3chPwsjMtIJrr+PXyz7LxaO4UIZFJt2+uxLH5ykzqraVFcICHhrsY9
         pGfOa7MQ2C6zVn3ddiQXwce6RVhQcO8AvhM3d3OmVGP9AlXxqoOqMNQtxdd+fsYhSoZ3
         6mdjty69zdNWY2S+vzaOoG3QQSTu3k9QJSCFac1JleRtSBsrOUd+FLpqegh+BbUlPfG2
         Ih1/6yKSKGQVyfe/wYgbkqaXy7OEU0wvX176nvmmPqyDNm/VH5RLolti/OKrXLhwTs5D
         U5ApdQK/AFDljwY6mE/ZUvu9SXcqTwmt1oX4FzuSMHFmNkx9doAwynnQDftnnTzwdz2t
         T8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tccTfkPaCkJqRCXrpmp0F9b3WbVNC0IPQMXCiDJx7Zw=;
        b=uFe2elRPthXusWiG1Vq1e4UFKoYZF1ykUE7txHx6OlRF1oBKvbKCuefn3ErT7Wb1Gl
         6LGaPEF+1cz8rnVWUTpwYxj2BRWYfGSTnAKFRas4ugE4bhY/Cst+DgUf5gZFwLSE3/Oq
         a0lH1h3UK6KtfyT06+8AFg6Yz1WMGhL82ZAgz8R9PE8QbEy7UvrIHJ7U3E0NdyP40M9w
         01e653QtcMb08epgalQuJRfrQQ4ySwe2aCYVC4qVqOzj6bCSfvXNZ5AB1rJrD5fYvFhD
         7uiMPryo2kdakZvd54fhJMX0hAPngvOeRKVZz1bBNc04nv3QxIfncQk6vWmlh7CaMXJ4
         UG1Q==
X-Gm-Message-State: APjAAAU+qbdwoeWjEhyHKUynA2WSfg3rPPL6D80Zl3Vu1PVr68t3zHY6
        BQEtAALrTTuGO70bRSfn9p3ky+MwmmLiPmZE5yPyqQ==
X-Google-Smtp-Source: APXvYqy7Mf/XaWFq/LXOzPSf1s6Jcjn+sKV/HBkrnZUpN8ofis3WnAWx2KOtRgDlC08AA+7Y/pJ1KFcI15Rf9GhIu2A=
X-Received: by 2002:a2e:9018:: with SMTP id h24mr2415646ljg.165.1559409701490;
 Sat, 01 Jun 2019 10:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <1558007594-14824-1-git-send-email-kyarlagadda@nvidia.com>
In-Reply-To: <1558007594-14824-1-git-send-email-kyarlagadda@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 1 Jun 2019 19:21:30 +0200
Message-ID: <CACRpkdYMx9obZV70EsieU_3eVVxqu9jVFpCO3Fk4t-2PUya97Q@mail.gmail.com>
Subject: Re: [PATCH V3 1/4] dt-binding: Tegra194 pinctrl support
To:     Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>,
        Suresh Mangipudi <smangipudi@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>, vidyas@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 16, 2019 at 1:53 PM Krishna Yarlagadda
<kyarlagadda@nvidia.com> wrote:

> Add binding doc for Tegra 194 pinctrl driver
>
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> ---
> Changes in V3:
> remove optional fields not supported by pins published here

Patch applied with the tags.

Yours,
Linus Walleij
