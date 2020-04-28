Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9D0D1BC028
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 15:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbgD1Nt5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 09:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbgD1Nt5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Apr 2020 09:49:57 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C0DBC03C1AB
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 06:49:57 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h4so7990408ljg.12
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 06:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K8+fuPYkH+puLBJZrUcKcisDj7x840mOx2H/AXTSfXc=;
        b=p5Udw9bpsNiJSRMg3b5y5IhL8YEuFQwO5OsVib3uyjXzhkWGcTlaHtkl3R1HGV4DQ3
         rJl/fnDPJTNEAhDESkXnBYSglWuOOHsQJj6dnYzUkWY2FxQp1kgpJr7VsAPEuQPO+m8a
         0hZvMw8Wf9iE8FQ/CNrOYlPIiDkUjzm37NJ9yJGMQ63KBIcaM3FU+xbGGyw6N+TMOcKj
         CLWt/ZVZdFOpw1VOaM8dUExw/MT6GYZ7Rve+ZabI71dn/3Ryx6XJtAb96ekMVBUdQX6m
         nMlX3tlmq0zGcOHTw77PvFxF7F6NggrItFv/aSZVtFp9D88403vwRShnXvCTKMsSRwEA
         vVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K8+fuPYkH+puLBJZrUcKcisDj7x840mOx2H/AXTSfXc=;
        b=KdoEu3KKXf4/9zMyKK8eTTKiYrDtk5fId9CYeohFQ/1zm7VncYXoLgVrCLpiMN8YVC
         87T8dCHE9aKcrE5juyc5CAyF+nRMsmy3sf8+YcqFswhAlgdGfol/ApbE3ASoJf9WGIiz
         9wVXafZSzyHIZ0Bd7u2bbV48tCY6ke9uQAXjCVZRb0DmSds+JIsxufQtBmqcmmO4hIQD
         XPbJYOVLje7fVTX7Wg5XO14tWByvhXOrMZrGuqbCdIzO2U6cyEzY34UUSC7iQRttgmH+
         gzHShD6n1QVd+03Ce8hQLEhEfSxmlst5jfzNSsE6OIlWvAzWbu1oL6hKIJQBjlNToZzi
         uu6Q==
X-Gm-Message-State: AGi0PuYDbJaKM4Ek6jWydvSWp/Xif/sKDjifyI37Azx03jf96y171KmG
        R78jYqHyWrz0woH4oHOrpPmiLcuCVrI3WeR2mz0OZjiS
X-Google-Smtp-Source: APiQypIc/HQesVeDmCFc8wG0wY/Ggva2NZkJMawXfsozJERv7QuSkzZDCvjIox+R6iueMRpnA9xGQJce2qF7OX0/rpQ=
X-Received: by 2002:a05:651c:32e:: with SMTP id b14mr17807230ljp.277.1588081795589;
 Tue, 28 Apr 2020 06:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200424141517.11582-1-geert+renesas@glider.be>
In-Reply-To: <20200424141517.11582-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 15:49:44 +0200
Message-ID: <CACRpkdah7D7b+-DBnMnh9_WmCK9qXGaA9usK-1jSJ+0nihWC6g@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Rename "chip" variables to "gc" in core header file
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 24, 2020 at 4:15 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Consistently use "gc" for "struct gpio *" variables.
>
> This follows the spirit of commit a0b66a73785ccc8f ("gpio: Rename
> variable in core APIs").
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
