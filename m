Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5760AD8FAE
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 13:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725856AbfJPLiT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 07:38:19 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44882 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbfJPLiT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2019 07:38:19 -0400
Received: by mail-lf1-f68.google.com with SMTP id q12so17161027lfc.11
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2019 04:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x1A3+tqNV7AYA4a59t+LdEpQ+YRhTrtSX/lkWTCc5aA=;
        b=gEr0OsMUO42QmRud/vzrOlYanxa4sfjkAyxLCKgvsdqUfqXAoUt+tiS1TPireqKriE
         ws4vPwfAN77DItT9lQbR6Fap+9iRmyAtBB6T3aKJudnGliLlZQ/iww6wOwaemWC4JKJq
         p8s4akWudtEYtlkDL5kIqBSOlt8M/Kii6KiiJzuaeWIBykPNF0Y58XJCgGr6a5rV43G4
         zKlTZWFZIYw2zRHKkC0yDLyNk9DqmDpu/1qcfXYULl94N40t5dJD1SsVuVG168GgGI5w
         VIPcvQZPkQTBT6Itvy1co5UiD0KG14To3UCosSI4lN8Lm+Pbg+N08g2/G+NId08GcpLQ
         KEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x1A3+tqNV7AYA4a59t+LdEpQ+YRhTrtSX/lkWTCc5aA=;
        b=GjLeu6RZDfYtW7IyYwz1qaWhS43kdtYdqY/CnbRR/m8hmeYfVkLIipGvk7h2M4u8gp
         Td7sK2xW7EKArJ6/MU4H1EOZ6bgFIHC6n8X5nMGRe2dFEcouWB+iKjyFcio1zFs1KpFs
         49RGZtABGhrLXsP9gNPQlyCfRvg7M8Zqb+ZWfv17mqAoxffMm7FfJ6zmfvA08ovgTdm8
         /Rdu9pVJBuFBc6AFuF8YV0ROl1MiVgUnHYnS519MrkQ/VtSJOsHkzLC3strzTYgaCcAn
         xM0QipPtXljrF36OSC1oQoTY2maeXx+TVTxG32MtkWn11C1eqZTyIHH3icIemCFTH5wc
         biJA==
X-Gm-Message-State: APjAAAXEQS025qp0q2KZczggbu+rKUXdDMv01Z6/wkMAMR7hXwf2F8qV
        2nLAGseDBsu4JmbutULbby1gtyHWSp0SXewuZolItA==
X-Google-Smtp-Source: APXvYqz4VZ8pkIj/84BAbLEZVxdaC1MBP7u2OgExYYc5cBJj+teQam9Hko5lojbIWznirNWs14DOf9zwkzW+TpAGXGw=
X-Received: by 2002:ac2:43c2:: with SMTP id u2mr1918135lfl.61.1571225897295;
 Wed, 16 Oct 2019 04:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <66d373ddee61e8be2fcef49aac5e80bd58f14915.1570596606.git.baolin.wang@linaro.org>
In-Reply-To: <66d373ddee61e8be2fcef49aac5e80bd58f14915.1570596606.git.baolin.wang@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 13:38:05 +0200
Message-ID: <CACRpkdZbEjWVK5-VN9jPvA8iNmgkGfyq4c9vDnpVMxkP7ENQGQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sprd: Add PIN_CONFIG_BIAS_DISABLE configuration support
To:     Baolin Wang <baolin.wang@linaro.org>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Lyra Zhang <zhang.lyra@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 9, 2019 at 6:53 AM Baolin Wang <baolin.wang@linaro.org> wrote:

> Add PIN_CONFIG_BIAS_DISABLE configuration support for Spreadtrum pin
> controller.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Patch applied.

Yours,
Linus Walleij
