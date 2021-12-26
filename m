Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54B3D47F50D
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Dec 2021 04:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbhLZDe4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Dec 2021 22:34:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbhLZDez (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Dec 2021 22:34:55 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D3ADC061401
        for <linux-gpio@vger.kernel.org>; Sat, 25 Dec 2021 19:34:55 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id u21so6555510oie.10
        for <linux-gpio@vger.kernel.org>; Sat, 25 Dec 2021 19:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8KU7qyVWCeCPhrgSi7WlMC4yfAlwyr+FRaOQribuaQs=;
        b=brOuap0t2AD/GGjjhEn5TAeC5+UUW0xmzP361kI7ixJHUVcKIp5lYQjBX7VLjQFIFq
         LCV1OWhaA3Feg9qHemx4H8Gwtqiufe6s6df35XyBAt+LNcfCSHGX88D5sx8CzG4u1CgP
         UhK/zLHFrXR92zRIQkgM0mVpvBX3MMRgLgJQMn8XxtGpgHMVsfqkp8w6yxf5XmqABUvD
         GBB+G1ivvfhHha1CjlZlXVZ7ZBeDUKwEUGnyUPtLbdEjCWKF99dTNuHNkcrni94iJGjN
         yC+F+Df7hfbmxSxb238Os89lCmzjeXp4NfUx0oEs6N2fNA1TKxWE/0sZvd/Fi+yjAe8h
         rRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8KU7qyVWCeCPhrgSi7WlMC4yfAlwyr+FRaOQribuaQs=;
        b=oHRJTcLcCkDY0EkjPJVIlQLXzNPofAhRFcZvdveg0eSD1E4SCFjDxd1ZMwsDOUl1Fp
         sytQllKmHzbh07PpwgRA9gLPtjWV7dcd8KCyxXCAZB6luklwBm39dBVy57Oc/kKnvu6z
         dqYfhOvpOB5kujl0U8WlQrzbhh2Ij7Q9F8FC1tNW4msW7BlAvV6ZwS9tRHDfcZ2+c/ub
         nDiOU8um47pozKjsPjUFcHadF4HrpVu4aUFJxtxDbyO/n+q4tDrXjITmFuEKAdyzcVtq
         YlgCQMjQsIaZOu0mcFKOL/FEL3R1rMJdDCEn1uARixtOYl6+R79so6oJcYoCIO2xdPBl
         wzwQ==
X-Gm-Message-State: AOAM5311B0NVxIZeJ5TSdrp3YlLOWFq6jpSFLHXZCNyHmQ7OkiotNJ+H
        ITJRupoN4UmluLTL5YDsSORWvSiny2idQflIqe1/TQ==
X-Google-Smtp-Source: ABdhPJxsyZ12l/8bne3hB0Nc/6/qpU+8uLgJXjDkYJntGVFZtUPE+k2NElPi6OpYSWuYp7PlDdCDJUCIqE8uXK1g0jM=
X-Received: by 2002:aca:120f:: with SMTP id 15mr9087993ois.132.1640489694029;
 Sat, 25 Dec 2021 19:34:54 -0800 (PST)
MIME-Version: 1.0
References: <20211225104129.56077-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211225104129.56077-1-krzysztof.kozlowski@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 26 Dec 2021 04:34:42 +0100
Message-ID: <CACRpkdbDuC5wbPcQBuP0WfXZ_JtF6Hh4vmY9fxFo57arb4kENQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v5.17
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 25, 2021 at 11:41 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:

> Samsung stuff for v5.17.

Pulled in!
Merry christmas!

Yours,
Linus Walleij
