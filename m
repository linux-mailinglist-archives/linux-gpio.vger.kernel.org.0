Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D105C831E4
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 14:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729554AbfHFMxA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 08:53:00 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44894 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728560AbfHFMw7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Aug 2019 08:52:59 -0400
Received: by mail-lj1-f193.google.com with SMTP id k18so82120288ljc.11
        for <linux-gpio@vger.kernel.org>; Tue, 06 Aug 2019 05:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2PudYazJ0p3KTshxoeOZExo9Ln2hf1lM+uINGK+J0Ck=;
        b=XmPnGWMndnMrMuzBZVSfKS4EQshJtycIvTBhuBSO30h/RjY+6dhLgfW9Z7nmmD3Ecm
         /fcDcNZDMcmQoq5sM8NNmI396PiD0tLuTq4yqjEmQtj0ncAGnIdFrnMP4Qm4w2XPqyf1
         ZIF97Kq+EdUx68qrz/MyquyvhbhudaiL8eRbFS3M1B4Km4nhTIRCwU1XF1P/puVBOKIx
         d6HKO4Rf6Ky+IP9hdshuos5u7HeSschI9iQYpsKbW0K0NMhVhJVOpFdXV/jq/A3O+7Jm
         jSCvJ56hbv/A1TjKxgdGS9n99NVWYGzjYUBjGVzLEjvZwntLKOLdwOlqpt2FDfdlU3nJ
         /ZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2PudYazJ0p3KTshxoeOZExo9Ln2hf1lM+uINGK+J0Ck=;
        b=Jra4yDiyda0cpu04I8FREYtZ66SzM8/7wo2pAw9fTgVQW8j5KlK+lEf1NWPIkfEq/R
         E6hydXFcB+Fpat/jrG71yuVcwlUrdBahu/NzBLzSN26RfTVl+OP5JkV69GmSLU15BnlQ
         9n+WaPo32NOrhcGgivw7WeU5GOetDs8NJNGHB7uFZAaipPjQdDYc4cpY4cNIJNsP21pm
         1rKrM+zaOnxUZjugxIjeU1VaZhq9kRhIWNA1bjJ9qCbU9XApXO9O0pOIlY99XLS9vtrv
         8MYDgjr3GJay7B5GNvOxxqUuLSbaJATUfhOzEZKi4l+7hAzQUbXD9bfRIQeKDtZkoLHj
         V1yA==
X-Gm-Message-State: APjAAAVbjzECKQgp44e7g1EZ9tF4xDn5BNlj4G9Zezz9JSqiH6GYtC3J
        N0z8Lv4kjcb+1qsdSDjh2hr2IwGXf09FcMprpXPfvZWx
X-Google-Smtp-Source: APXvYqzfgGq/ZYQsfFCK13Rsb+YD1BLFA2AtGY1Qijrs1rJf+sW5Vx1O3pqqyeyDuUoUDkQ8qwRhMK/zKY34TJ3pNvk=
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr1734115ljo.69.1565095977930;
 Tue, 06 Aug 2019 05:52:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190804160420.5309-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190804160420.5309-1-nishkadg.linux@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Aug 2019 14:52:46 +0200
Message-ID: <CACRpkdbkdGL-dsHTns3GUKOXF5ci-sYMkWKEEMgjBxJp5CgByw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: freescale: mxs: Add of_node_put() before return
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Stefan Agner <stefan@agner.ch>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 4, 2019 at 6:04 PM Nishka Dasgupta <nishkadg.linux@gmail.com> wrote:

> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak. Hence add an of_node_put before the return in
> three places.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Patch applied.

Yours,
Linus Walleij
