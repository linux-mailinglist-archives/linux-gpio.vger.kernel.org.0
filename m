Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E727B8171F
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 12:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbfHEKeH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 06:34:07 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44265 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbfHEKeG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 06:34:06 -0400
Received: by mail-lf1-f68.google.com with SMTP id v16so3658706lfg.11
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 03:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JGtqwITu2uNu0KF6vt+VLLqwcEMqaP+PiWiHY6OQtsY=;
        b=YDCLR3lXJ7d0Z4YqSLxOVJjSXKF8PSiCsmyC82hOuP2j31RTZ71Jfi1KO2C3/XZXBd
         KQNt15eK9ofwpKOSOcx7bYoa3rQTLBLpFstYZ/qLz2mxDZrlVUtJwXyJx+ItO33Ezynx
         WpdvKBDW/WZ2hQx86yBCUsOt7jRWtlx8pjHekN91U+LLlUkyjW2j3KSb3DOog57r/11E
         XuFvzq1mzUcEE82AT7fBdtAS9JUxMEwuM98z7XNaQVFOK9Bsbnh6zPdNnNnxEZrouQk4
         Tn1osA5l/+HfcEaWZMruPnpCx0m/wXh03YNEis8QlPwSSxC6JG7TeVU/4VtJdH7iPLyl
         W44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JGtqwITu2uNu0KF6vt+VLLqwcEMqaP+PiWiHY6OQtsY=;
        b=I1piOWKrLPgMQ6FOD1RIdZ6O3r8sAgNRlN5LrnMW/XKRTQusQmzZyb1NwJ80stIrqS
         ABqEwlqzpBxXXr/ZQq81OVhPL76oJmugxpLaE8bTH3xoDJp8ijq2xuA01AqJSQfKevM4
         RvNtkhUIluhuHo2utdYxwVoy3jsvp434g8KC2bvSfDv38bsRl6pYag747I7yQE6nirVh
         34INT7OC5I5I9V9PIhwNrEk24/3mCrvl6MSb/bxJJ3TyaN9cns010/4UYz8t3tpf4hzn
         pD51I58fpKIFaumcUhPMBfv3TAJdlJFbWPkKkb/Ho0a1AoxQH1n9s2N+xOYXO5t0WgS0
         mmAA==
X-Gm-Message-State: APjAAAV1ntPkP02dFzVSCz+PGgU/aiavC87x1f5G89JM+WfSqJtQ9iD5
        m0YYZuXVusnA01zUwXEIdHkdPj14NIuSr4JTY1xjXw==
X-Google-Smtp-Source: APXvYqzH+R60ewO8XJ2gzoKiGmqUfBqtDJ2yUJTWbBfcdO++jKdzS/wcmFQSFHQC4vAyafrpnBTKHWgC43U+he1CuA8=
X-Received: by 2002:a19:ed11:: with SMTP id y17mr1890223lfy.141.1565001244892;
 Mon, 05 Aug 2019 03:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190726112816.19723-1-anders.roxell@linaro.org>
In-Reply-To: <20190726112816.19723-1-anders.roxell@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 12:33:53 +0200
Message-ID: <CACRpkdYyEi1Z9a2uz88Rks3QMYzV4W_cJ2FJ4pY1Hn6_qdAeeA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: spmi-gpio: Mark expected switch fall-through
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 26, 2019 at 1:28 PM Anders Roxell <anders.roxell@linaro.org> wr=
ote:

> When fall-through warnings was enabled by default the following warnings
> was starting to show up:
>
> ../drivers/pinctrl/qcom/pinctrl-spmi-gpio.c: In function =E2=80=98pmic_gp=
io_populate=E2=80=99:
> ../drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this stateme=
nt may fall
>  through [-Wimplicit-fallthrough=3D]
>    pad->have_buffer =3D true;
>    ~~~~~~~~~~~~~~~~~^~~~~~
> ../drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:816:2: note: here
>   case PMIC_GPIO_SUBTYPE_GPIOC_4CH:
>   ^~~~
> ../drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this stateme=
nt may fall
>  through [-Wimplicit-fallthrough=3D]
>    pad->have_buffer =3D true;
>    ~~~~~~~~~~~~~~~~~^~~~~~
> ../drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:821:2: note: here
>   case PMIC_GPIO_SUBTYPE_GPIOC_8CH:
>   ^~~~
>
> Rework so that the compiler doesn't warn about fall-through.
>
> Fixes: d93512ef0f0e ("Makefile: Globally enable fall-through warning")
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Patch applied.

Yours,
Linus Walleij
