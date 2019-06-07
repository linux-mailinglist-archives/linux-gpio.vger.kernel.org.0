Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E70F539776
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2019 23:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731077AbfFGVNo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 17:13:44 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43993 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730992AbfFGVNo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 17:13:44 -0400
Received: by mail-lj1-f194.google.com with SMTP id 16so2903606ljv.10
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2019 14:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=buV+QOyxzNDlDJH8veXIKdL2iiFBfuvxwZCwvBEfDTQ=;
        b=PbA+vTjbgf9IPXeh/acYRqrHgQ/Cjj1yrQprtGznL/es8T3gCcNRwDa3YZdRJ/uF/v
         32h/I3BSs26eSDvUTKOdMkrK+uYPnnZTsZv5z4EdDPgVzhWZqXBKVULLsGZX0xqNpcAn
         SVhfqA2WQ90XxZnoYxFuvdF0bCBSWXYCLUVaO3+zVqn8HY2gFJ5AzkFFpTp5JR0fU0wc
         1hDS5MjiNH0JecOnCuNnqbqaS88kPpYSRSdW/XiJwMe1fSSEPUqs9fgRQz23dlySJ18o
         CApFNcY1FIynSD0OEVggMunh4iBVIRm6OK6zhhZGMmD3SOfb4tiBA5WpvkZmiUU88aCC
         TCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=buV+QOyxzNDlDJH8veXIKdL2iiFBfuvxwZCwvBEfDTQ=;
        b=j4y7mNGVCaU1jrvyV/Q/+8u+n19VBLkzxYZrXP/o5FEwwQf8y0cra0bmBkqZIjMk53
         qwfYN7JB+XNVLOtVp9+dKP2sLfkc7tB3VsxEsW3M6QVj4JvlMTf1Ex9GMNMYJc/kl0Ij
         mpGkWFT2diVFWEnGkq1fGm0ECMj4+WeVQ2km9Axt0LYQYWMPM7BNVfOhjecgre0yc5UH
         15Y96w9wDIuv7ytBuT97galFhE58dweRIbuLLO2RdpaKwxSmIzV/moyKP7y8M/yfJ61M
         Aqc7sB8pgX8GYoG1N1Fyi/9/11Cy8fjxvo8GOyutXiXdOY0AVXNkpdrOH/QCf6rjjTXc
         69GQ==
X-Gm-Message-State: APjAAAWFCh4m8qFHYsWuOfgefz4FnOuvHf/Wlwe/uaX867qLCAqIhC2U
        JTn42uGf7zFCGPkTl07rZGmFhkRMMtlNsbC6joqy6KOT
X-Google-Smtp-Source: APXvYqwcF6ADHtl33t9VDfzL225Zx/JgITfxxEzGI9UwCFCbx97hu3h2mIvOoT6ew9/mRJxwXE0v0pl6avRqO2cwvZ4=
X-Received: by 2002:a2e:8902:: with SMTP id d2mr29179625lji.94.1559942022414;
 Fri, 07 Jun 2019 14:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190603073421.10314-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20190603073421.10314-1-manivannan.sadhasivam@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 7 Jun 2019 23:13:34 +0200
Message-ID: <CACRpkdZcwZks6eKOb=Mq1EfCP8Kir+nPC1r9=FrA=si5WpwQww@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Document drive strength
 settings for BM1880 SoC
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

On Mon, Jun 3, 2019 at 9:35 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Document drive strength settings for Bitmain BM1880 SoC.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Standard bindings, uncontroversial so patch applied!

Yours,
Linus Walleij
