Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5F63E5A41
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Aug 2021 14:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237785AbhHJMoK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Aug 2021 08:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239007AbhHJMoK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Aug 2021 08:44:10 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05BDC0613D3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Aug 2021 05:43:47 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id b6so24870560lff.10
        for <linux-gpio@vger.kernel.org>; Tue, 10 Aug 2021 05:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rOi0FzJnU1WuNHAREyHt3NRP6amd/ZUjldzq+Pj4Qwg=;
        b=PgxtWQmKoEM2unN+JYTi6YU4uufVUt5SoE3Y0CqtBvDox7f/OWllpXL3er56FDo1s7
         EMgmYSt9+RTo1FQn0Sw6UQxwpqHYoJz9obk5QTSXYbrJk10+udCbCdbCHL2GT6siwFHn
         nbrxmGOF8GOh0bqYTPxwCGIWMY80rrTZoAWP5ZNHYwII+hBdqXNZhZ5RTKuPCOmr+sZ6
         2uxu7NtQuXI4Dy1Tb+RTt0ciEZSpI9osu5tI4SxAODD028SXvXmgVYUj5ngkZ5ONelDV
         /AeVyaL7O7yH7Eh4t6L5scgsaWKk/PiK+m0eiTHFiVHWDEGJfiBVS+2i4E6jELwPus9F
         9a0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rOi0FzJnU1WuNHAREyHt3NRP6amd/ZUjldzq+Pj4Qwg=;
        b=XhnoM/qfEqIzL3c72hCYZ96TTSBsX+4anGHgdWeoXemLAEI+DxYwGzc8uPTBk8hjDl
         rq1sK0mVAkxevPPGeikt+XyDpwIfrblvThnfbXZHbC/VXvgTOBV7dZn6EFH787YrxWfd
         snU+2ZbxwcdUa1oaiz1qJvKU8SlFqe5ngwcOKE43vMnawvW6OT7r26lFSRmUlhzp0uVU
         ouDU0kV5qS1MrHJpcFK9Gk+dyGuEc6eS65Y+VU+k0nirjqRhueBeHYl8kK4ROTl+7Ymu
         oc9oDFF9HFb+CNMm17kQnRgDD4H1mcycq4Z9L9XVdXYoehZhgA99IjHjls+ewWQ9Hm3r
         ZpKg==
X-Gm-Message-State: AOAM5312W/EXJBUjaH4izgIL1oaJxWdmWVILvUduaJ3aC81Yu8s/itf/
        7EYPE+0L2oAJx1nQ5qJGoG3ueNUq33IhTHS73Hd8wQ==
X-Google-Smtp-Source: ABdhPJxbF1bBXolhzTgqSiZogGeQ/LtVQ5tXYydF5PKis8x8K6NIU/AkGspTNHz97t9pSfFBm7Le9MEdxNZ0nsKHYRI=
X-Received: by 2002:a19:c7cd:: with SMTP id x196mr21283639lff.465.1628599424634;
 Tue, 10 Aug 2021 05:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210722033930.4034-1-thunder.leizhen@huawei.com>
In-Reply-To: <20210722033930.4034-1-thunder.leizhen@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Aug 2021 14:43:33 +0200
Message-ID: <CACRpkdaHDZpHayo+ytHJik6CAkx2NhYrmxoObxQiu3ELRxCBQw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: single: Move test PCS_HAS_PINCONF in
 pcs_parse_bits_in_pinctrl_entry() to the beginning and fix its return value
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 22, 2021 at 5:40 AM Zhen Lei <thunder.leizhen@huawei.com> wrote:

> v1 --> v2:
> Split bugfix and cleanup into two patches.

Patches applied! Thanks for fixing this Zhen, sorry for the delay.

Yours,
Linus Walleij
