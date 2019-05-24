Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96270297A6
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 13:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391257AbfEXLx4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 07:53:56 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45950 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391245AbfEXLxz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 May 2019 07:53:55 -0400
Received: by mail-lf1-f67.google.com with SMTP id n22so6903114lfe.12
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2019 04:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ArzXIkFbICKV9szOeGfzmIhB8Bq88PwXMETYybb74ok=;
        b=jzEE+tTJPbcrtJ4L4eQdnvHMcevMqqx5FcY5sYaJi/hIwBRhZf/eda7UvoUBQsKPrF
         3m4yW6UvhCwqrLuTnJoHBQGDRuV5vuBC3s0BZDXXgyU8F63o9UUhp4aTVAhdsNPaC4f7
         U/Z2i3KAEq9rF7xHmkGh9bWREmGY2xB+DYAEEucYsFhkF18+R2fckx2ZSQgFVQJL8rLd
         2lPdfoYC0Z2KMEYKi9xauWIqUDH5QN/xPrx/qgz8w4juGGoqw22wrxY2EnESQ3qhRkUz
         dvCTi8jOREMhc3LMNJU0DkAGs87Al91/0vpDJ65HmSkGn7dBP1FWLTlYTEIE5hK+7K4T
         jrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ArzXIkFbICKV9szOeGfzmIhB8Bq88PwXMETYybb74ok=;
        b=IYhOvuW5T7RtXSSt98q0gE6YNE6B0Xuc2R6hez+7FC/CV+TrFBUOL+M1u0nfuWq8Mz
         TChmvQUGlN4Xf6xgGjcSoEL9MGz2sdelhzw4ZIF7J0xvjeB9Aj4QY90SPIyxQk0vCoKF
         8zNrPEc9ItL4hDRpnHiYyl8gULmjy31lFamnzQmVAwBQRyH1XuvBCw3bog+8nDVIhlVO
         ITbwyLlSG6jA7pPLv6vnPCsE4VjTNuAwE/vq1nqBJSpPYtnaCefJM43WN6c9SVnibko0
         +IeiNeN1kSUIHdUTRmzExgx14zLXl+TqHQ2GvWhvg5Hjt6J8+gobuIRO57xyiS53t+fJ
         zldQ==
X-Gm-Message-State: APjAAAWCyKXqgLZ41XsYH1l9tpY6ion7djBQH+VEkDqQbNVBfUVqN5MJ
        336hN/mJMCJnbtEouasdSScKuMt22U4vE61t/liqbg==
X-Google-Smtp-Source: APXvYqzE7BYn50MEZEoe+sHHjHC8sPLW6Y7wfn3iSsAAhDLZMksxZFIgx0M3J1CenXT2tXKspxlHD8pFNqWzLwTn398=
X-Received: by 2002:ac2:4919:: with SMTP id n25mr5435050lfi.114.1558698834149;
 Fri, 24 May 2019 04:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190520083101.10229-1-manivannan.sadhasivam@linaro.org> <20190520083101.10229-5-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20190520083101.10229-5-manivannan.sadhasivam@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 May 2019 13:53:42 +0200
Message-ID: <CACRpkda3zvFfEzfVkUT3_zvoL-fTNxF+59T0f8dZtBGV9kQVAg@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: pinctrl: Document pinconf bindings for
 BM1880 SoC
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        alec.lin@bitmain.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 20, 2019 at 10:31 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Document pinconf bindings for Bitmain BM1880 SoC.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Uses standard bindings so completely uncontroversial.
Patch applied.

Yours,
Linus Walleij
