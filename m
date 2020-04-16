Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 535471ABEB9
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 13:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506054AbgDPLF1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 07:05:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506036AbgDPLEr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Apr 2020 07:04:47 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49468C03C1AF
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 03:53:50 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id u6so5694495ljl.6
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 03:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QgaYHDB+V/P8sJggA7Iblc7jogxqawaSl+yzOQ0/Rn4=;
        b=jU0ibB7dsoTTJYnbq7KJWD85iq65azWfsvxPzehE8nANACAg+Xlc06OrsGr3JWXvou
         +BdxX7QH+4uNZZbRVtz1Sj5e+iyJNk2NR2lC4/RCe86BW3cGHIDvCNTX4J/dPtYe04lf
         6G4J+hPkIZtAxrYdOwtV3czWB9x44QZehux9ei4JpD0kcovDb37m9XVWZZTzjLFfwNz1
         pXypwEZ1sJqzrhLWKG+b6tys3DKV0kCeJ+YEnh9bqHbsd74k+JfGJVnkqjpGTBVdXuYF
         n/RjND8rmIlYPVAQhR1gEvwX1ESXbgBH96blAk4ykcIl0nkMrwLci8W9mA/QX0ri65aj
         hw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QgaYHDB+V/P8sJggA7Iblc7jogxqawaSl+yzOQ0/Rn4=;
        b=LUCMxmy9h8UKnFHwOGyqI3dQRo1V0cj00YOK9VoCxnrRdIpxlGaXMqnbdwvPgAd6Z4
         Ix/Oef/3k7W7Ed4X8eT8jhvy9XNe6e0k4eOb7Ijqb2rkcqeMRVCG/Mkxx1dv0FvvOFqv
         83iamz/ylKd7fL5gKz54b5CjB5v9lnivV05dee00is6ZmOtFgHhR6NKQjlkoZZ+71eAi
         /v5MY1XTF8zjyDvZgqVvLMKLTeqW6ntxX4pcWeehhX0lo2dx1XdNZ/Zhz/oIyq7u8DvX
         c8rRonQ4NwA7jQoLUmOnp93oJZwxfU1tiI9L3tcD6GZ4gLK6MepraCd8YST255Ltrd/w
         P4HA==
X-Gm-Message-State: AGi0PubR0W6lpCFoiveeoA9mZkq3M6N4CxIm+dC6DZWvVpokrFUC2Q76
        I3ElPxVp6B6l2sksBHb1FGpqw1Vi4RfzvzJ5b6BKcg==
X-Google-Smtp-Source: APiQypK6nkSTANaZW+1a43XoogM3H6sNnq4kMI4xqLyVIWS/PF6q8zPv4riQVVKMftU1hlwobUdBnlrK6GlVZzGsIdU=
X-Received: by 2002:a2e:5048:: with SMTP id v8mr5601989ljd.99.1587034428690;
 Thu, 16 Apr 2020 03:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200408070504.134847-1-yuehaibing@huawei.com>
In-Reply-To: <20200408070504.134847-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 12:53:37 +0200
Message-ID: <CACRpkdYUX5EuRQMj_c+0wJa2pP13MF1jd8T8AjpifeR22kc_pA@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: qcom: Remove duplicated include from pinctrl-msm.c
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Ajay Kishore <akisho@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 8, 2020 at 9:02 AM YueHaibing <yuehaibing@huawei.com> wrote:

> Remove duplicated include.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied.

Yours,
Linus Walleij
