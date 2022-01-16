Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A51348FF2E
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 22:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236216AbiAPVia (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Jan 2022 16:38:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233771AbiAPVia (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Jan 2022 16:38:30 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0474C06161C
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jan 2022 13:38:29 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id r138so20919003oie.3
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jan 2022 13:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HR3K23prsUMyCbrYWQNTlRCKaozXns392za1xGffNJE=;
        b=PTHBntgNGcGtWqPyxE+jOxDaAOgIU1CCwc/x1QaLJzZTV6FEBjdXStTwqKGbaEaYhG
         mQO0wuQgpopoZtaDw2iBlltBJUORg8pOj9HZFBKhbMd+wZ9UV6fM+ixKICzz5P7rpacO
         7tjv0XHvP+zuM8nq1+JtNz0LZZUBMBuJeNAtwLef2i+Tow+kHGFjzOtdB9itBx9PNvbT
         KH+md7dVrwj5mLisM6UK7NnzFd78TyeOsPop5ZbQqA5bealuon23ZOdWg9C6Z656L8b/
         xrY3FlQkm16UNgKCX/Hno4CicAOkjMMkkz/xDWdQo1eurfJOeqiAMCxsEYLYrRKCNPkj
         RNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HR3K23prsUMyCbrYWQNTlRCKaozXns392za1xGffNJE=;
        b=0fddO0vrRayy4aceC24kTpnBNUKri2rdr1h++qcWdGoqo3TWHcvl87SogRV6uMx3BS
         UsRG7OjVV+iLY5cP2u5qSg7yWKK/0ivrxLfayn57Lpn5wOFallsn4CDzhPPA1uIdH7qN
         +vH2xvYwH6h0Pv/Q26uCAUZczorFhcEqm3YdhUfXGrATU8qD9Z3HZBo/JilcK7m6OjQ6
         W3kECNJ5+Csa/U/Mw8OgzKIKLfE+uKPyl7FI20LMAR9DX6o0rlvTsny3t2/6JPXCO4wS
         DiapC0lIXTkVy//cyRm/gW37PsWPHX4ZUVWJVj3hU8UCjpQVkxVYJteFNyig7cX+kO1I
         7Jsg==
X-Gm-Message-State: AOAM530gkdutS2EijkjTEFANeSz9va8OIYS6NWfwQ4Y9kQQmu89N3tGn
        0HP3J5zNWLV44QPxzfuy2bY53Ka3amavwM1ULKCA2w==
X-Google-Smtp-Source: ABdhPJzgjCBYMq6KY6MkbuygV1J/mBuVzD/YEm2ImA0kCK4gMfbXNFUBiT9ygVZV6q2XvrLyOHltZrObbbdPpw17Vxg=
X-Received: by 2002:a05:6808:2097:: with SMTP id s23mr10857559oiw.132.1642369108822;
 Sun, 16 Jan 2022 13:38:28 -0800 (PST)
MIME-Version: 1.0
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
 <20220111201722.327219-18-krzysztof.kozlowski@canonical.com>
 <CACRpkdYTXSOW+sOX3wVtF4jj6xm0jr-F3HKQPGHOdAVjbasP3A@mail.gmail.com> <5047da7c-d3a6-5472-b0ca-7ed3dbe8a5fe@canonical.com>
In-Reply-To: <5047da7c-d3a6-5472-b0ca-7ed3dbe8a5fe@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jan 2022 22:38:16 +0100
Message-ID: <CACRpkdbhmJ91EW395C5F2WYjWJQdJ-SBHaDm7XnQsxMuyoMmLg@mail.gmail.com>
Subject: Re: [PATCH v2 24/28] dt-bindings: pinctrl: samsung: convert to dtschema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 16, 2022 at 6:10 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:

> Anyway DTS and dtschema will have to wait for one release, because they
> depend on samsung pinctrl driver change (patch #2).

What about I put that (and maybe this schema) on an immutable
branch so you can pull the commit into your for-arm-soc branch and
put the DTS changes on top?

Yours,
Linus Walleij
