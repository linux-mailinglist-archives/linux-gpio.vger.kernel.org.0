Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B30561573AC
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 12:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgBJLsc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Feb 2020 06:48:32 -0500
Received: from mail-lf1-f44.google.com ([209.85.167.44]:41602 "EHLO
        mail-lf1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbgBJLsc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Feb 2020 06:48:32 -0500
Received: by mail-lf1-f44.google.com with SMTP id m30so3961567lfp.8
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2020 03:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aSJzfIkOuNVooD8O1VC4Pyw5PXEqxFUSaZfTLlRTu3c=;
        b=LTlQ+WizeRtuRFYjwRcSYzkuVowXyOXSelYl1fDOwvk1+Wclg2AyhAhRepM1sN2goD
         XBYXuiWpSeOGUKp0cgXtX4SxUu186xxQr+p6BNtVcmHccU+eUMCu1sVplTc4UzNXd679
         zOzeS8LmmtiCosoyDPVkUQz2/Jxav8aXNoj+JJYeLpDWA3q26RmuVJdsWGtrjB7uAl4W
         2Rut024Luh8H8dZlNbNKrv4awX/HrBAXn8hvgfjQoEhz6V2lbBURxGbX0vL4aopJEUo9
         e4jNqSKt/MC7tdCO1ufDLSykJrzTPBXtS1i1S5fiqwPUNS8VoIRt6G5U6lm+VAPgNOC4
         ZhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aSJzfIkOuNVooD8O1VC4Pyw5PXEqxFUSaZfTLlRTu3c=;
        b=Vwgg0tyDGnDnbMtD6t85BAcgH4LQqtyP8Rt14wfvVj+w09/oNk8MqPyvgdNk4xtYsW
         ZMp3nFyFdDeaVlZf2zTEWVT6ZAnvVCJOkL2N/1KR2Eex/JBK/egoq3PPmzqz1Zh6DZwl
         l0rTpuO5Ep5gxV6aHQaA/zaRoSiD9jG4F2EUVY9Fe0WljygfoJ1K1Q0GKvOrXcqVKnHN
         ei/2FlywssceJhRcRCPuykBQJihSZ0tZZ1ugj31g+B7dxRPAttJOIokbngBjk4luBQbi
         vQwcRLJfjdOQkNT0hGZ+Y1EhpxSuz7Z9NLEuvgozJ1OB6dvygLQQpE8ybJeRxU/nvzmt
         SCrA==
X-Gm-Message-State: APjAAAWj+0yxOiAw2gGt+qXI3Nhiv48EpdhWJuNXhRD1uieCKhSa5wJ2
        QDi0T20MoYZTM42EHEuHxqPhVKESL/TKzGE3MAPLoO72ORs=
X-Google-Smtp-Source: APXvYqwJDTpeHrZkWtz/YSlaNIlWh13wzuejpec/1wskJmA4ZjiBqy6vPzjMfo+IUWRzK4K9mT2O1B9dg5Hk8Czx2JA=
X-Received: by 2002:ac2:4909:: with SMTP id n9mr578438lfi.21.1581335310309;
 Mon, 10 Feb 2020 03:48:30 -0800 (PST)
MIME-Version: 1.0
References: <20200210103035.16406-1-brgl@bgdev.pl>
In-Reply-To: <20200210103035.16406-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 10 Feb 2020 12:48:19 +0100
Message-ID: <CACRpkdZJyWNfrzFTB8Z4XCy3N7izghW-Ooo-3a0c4jLXFDBLNQ@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.6-rc2
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 10, 2020 at 11:30 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> these are fixes I picked up during the merge window. Details are in the
> signed tag. Please pull.

Pulled in for fixes, thanks a lot for covering my back!

Yours,
Linus Walleij
