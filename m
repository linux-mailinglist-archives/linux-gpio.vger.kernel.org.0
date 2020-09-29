Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBEF227CB47
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 14:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732440AbgI2M0Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 08:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732485AbgI2M0H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 08:26:07 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CC1C0613D0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 05:26:07 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id z23so14647879ejr.13
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 05:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ilnc9lRErTLGwRUB4HFPyYF6CW3YVVZPYLQOJap/2CY=;
        b=PBObQnKCeYlQmX+ppCXiidvlj5kZaNyn66HJEGKsSItxAJbS3f4GRWcCAoD/fkRc/s
         TCyYZiJLpvbCFtAmAQp56BNedoYF5SviUf6TDZOtFmEB5iFyseDoU2k91pwdPNLBwMUM
         cNWTZk/4coV1MHacUBz4iCe7YdfwSqWJDqB+fYEaWqAga/IvbqUfKXSIujqp4UaN+WjT
         I0FqzAqAph41GOCzuGS1/iqee7tzcDYPZHtGhUqmRvBBjiiVkyYvkPg+nbetpkpe1IRu
         Q1ByFC6ny7RLlg8hPDxQYEMMKGUIoh1uuIxaL8s/bBaqUngdWWBwNripByFqy5ha0xSV
         kJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ilnc9lRErTLGwRUB4HFPyYF6CW3YVVZPYLQOJap/2CY=;
        b=p4d4IwDgIhNFZzfGD3n0nRF1FivwMs6sPv3Q+KYxJ53L4dMCk0nKCOxYQ0jLnfVijq
         W6tNxyxfyB6+VSkM9ru+1IhzZjmHmRBctgF2P27zsLYacPHs5ofe7a96OXdSkIv4Qjqm
         658QgNrellbp1N9Lr7AnGxfGEQowacT96co6DlD4qXtonPP+YTs8RLvEvdFeqd3Ewt5x
         /ytZV7r8RUvRNZI5KtNEVumh1CNe2s0VyEgMRBBDWjDJ2J+ZK45BF/6RfFn83x5ONI+s
         85GYhvVk51+g3TL/A82hV8AbGjjorKk1aGb2694aYC5vrupMgzycM17xxJqGehcLkOtD
         GIFg==
X-Gm-Message-State: AOAM533BuUaoGJGh63QAKS5/WHpmqiTHn2cUnZ47x4ZNzJqVyFBVSlvb
        7kpiYvnJvU4+mJcnIe2jTSF/plOxeGm2xrJvRgmuJQ==
X-Google-Smtp-Source: ABdhPJyLuBCaI/z76rq/ffz504IdUDE9QfTuJtstdyt9uN0hf5yxvpSQvQ54/CYy2BsZ9vpzh9BTavQ+/5oaPPvIETw=
X-Received: by 2002:a17:906:c007:: with SMTP id e7mr894474ejz.55.1601382365730;
 Tue, 29 Sep 2020 05:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200909114312.2863675-1-andrew@aj.id.au>
In-Reply-To: <20200909114312.2863675-1-andrew@aj.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 14:25:54 +0200
Message-ID: <CACRpkdaF7LaU_+4FrKGFYnKwLLe-iYkEzh4u3anv+16m6XUi4A@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: aspeed: AST2600 pinconf fixes
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Johnny Huang <johnny_huang@aspeedtech.com>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 9, 2020 at 1:43 PM Andrew Jeffery <andrew@aj.id.au> wrote:

> The AST2600 pinctrl driver was missing support for bias control on the 1.8V
> GPIO pins, and in the process of resolving that I discovered a couple of other
> bugs that are fixed in the first two patches of the series.

All 3 patches applied.

Yours,
Linus Walleij
