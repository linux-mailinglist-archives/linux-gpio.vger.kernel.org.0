Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26F0A32030
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2019 19:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbfFARlc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Jun 2019 13:41:32 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:32902 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbfFARlb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Jun 2019 13:41:31 -0400
Received: by mail-lj1-f195.google.com with SMTP id v29so1266710ljv.0
        for <linux-gpio@vger.kernel.org>; Sat, 01 Jun 2019 10:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rHjJzagrI2w6CxzEMyI3YS1Fy3fUOHjBVJQpvV06gF4=;
        b=kNKo1PJp5JY8FyKD7JkhadL2uuwGlRwXyBzur6y5fdsxiydbyEgL0yjSnj/Ex6vBKV
         m91afAFfI15VdDMK9Zfn7vRNKG2F0OlQhgZcdfwH1WdJS/+fB//hckYTGPJAbO1ERb4K
         HyAxPI2RKz2bVOmVcIHmnjJRBJ7zha/dHpZkNggiMM6m0cGW79yQVu5hgFKOmcog6a/X
         hQs3OUaUJOD+266aTLeyUt6aplfIXQOZtfyQz94Xlt0MZhseWtud2aHTOzF2cCpB5s4s
         80eAyy08uKq1gEL3GyhM5xQ4EG9xJyOOnryKvPiD/uGps9VmxiPapZa7RSqZOrdEj4sK
         Y6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rHjJzagrI2w6CxzEMyI3YS1Fy3fUOHjBVJQpvV06gF4=;
        b=abBAS6CdzGab//czPds4hyEjconwxvOk6yb7iE6hq7lXWmxoF5zDxsE+T941xYEX6F
         JEILTS3o+Q0gBe0n0PDVYt23u5vj0qWs2QjwNCOS//3k9/MKjLJDhZFXRFssh7LygJxh
         Qm2lvvg2wRpBWHSqv2QXZRMq8hxKRG23KSfCo1YaHo+vM0KILUMuf7ls6DCT7g0Tnta0
         ynChZt1uH3caXw5XCTp/gkPW/KmNDPN3Yk5H9h1rQsWT0oRj6vvc2uBKwLGKCQHLst1H
         4scLlg4bELm1snhl3/c6WepI5BhYk05PO3tzIw2lDS24EedvOepHmTTb+0Xi41QVPWSl
         +JIQ==
X-Gm-Message-State: APjAAAV23TcIDXxmfLI75+oxySUqm1pCNsK9oZdOkL47IzjfjkPmkq4j
        YOUo0I9HoKN86Txz2F2QvIPgalECvSrQzJPlByIAqFUc
X-Google-Smtp-Source: APXvYqyMs3a2CNuuQZwXewGMpnWnrvA5Em5qjXrSELyADIL3SbiyiL6hwwGk0M0RbgN9+6Gp3Y2EroKx7Y7np874/U4=
X-Received: by 2002:a2e:9018:: with SMTP id h24mr2448110ljg.165.1559410889721;
 Sat, 01 Jun 2019 10:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190508073331.27475-1-drinkcat@chromium.org>
In-Reply-To: <20190508073331.27475-1-drinkcat@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 1 Jun 2019 19:41:18 +0200
Message-ID: <CACRpkdb1cfQts-CshwgoSXDv5JM8=miy4=2FhKpOi-jZL6OTxw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: mediatek: mt8183: Add support for wake sources
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chuanjia Liu <Chuanjia.Liu@mediatek.com>,
        Evan Green <evgreen@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 8, 2019 at 9:33 AM Nicolas Boichat <drinkcat@chromium.org> wrote:

> This adds support for wake sources in pinctrl-mtk-common-v2, and
> pinctrl-mt8183. Without this patch, all interrupts that are left
> enabled on suspend act as wake sources (and wake sources without
> interrupt enabled do not).
>
> Changes since v1:
>  - Move changes from mtk-common-v2 to mtk-pinctrl-paris, as
>    recommended by Sean, to keep better separation between eint
>    and pinctrl-common features.

Both patches applied with Sean's ACK!

Yours,
Linus Walleij
