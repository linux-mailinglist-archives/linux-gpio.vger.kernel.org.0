Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DBBD2979C
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 13:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391256AbfEXLws (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 07:52:48 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40322 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391096AbfEXLws (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 May 2019 07:52:48 -0400
Received: by mail-lj1-f196.google.com with SMTP id q62so8395090ljq.7
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2019 04:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q0Kts/0fjXS1PAYHGJKdlU6se3KA5XKc0egkbyyI/dg=;
        b=zadfwpf6mMh8AzqN6OHd8hRdjnqFMxEX6zMtMQo3Rf7CsHiESKkYa2RFtfnG16tsx4
         TIDu1DesFaUFM3gimkOQDcb2K8ZC0R9Q9xABtgGWuMRdpfaq2mRNbzI/NCNF8qkCzt8/
         s6iHDRKSk+WAko+qOj/8Ms4xEaYSg22u6soAnT4W4QvYijEAOiOGOPNieNEtG8QPb7w/
         HkN2X34NymvS9+kKXXVhxh/Mbz3bBWwRBWmKQhGSPnTBpfdqEWCP3+wO+sOgsKXBKfGq
         EfjqfZv1uzj2dZIHXlYSO5z2qyrHeAdO/EEdSKIv+O86wHv0U57qP7uDU/L+nfX/u91J
         oayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q0Kts/0fjXS1PAYHGJKdlU6se3KA5XKc0egkbyyI/dg=;
        b=PZEqCJVgKXD68me+IIpScnkHTUIlwnJ2jo5lB5ePWYw7lgDM6SKw2qAwsBRbCFuyc5
         o4B8w5DN4o3i1v1Ls8a2/+tWRi1czif2KFKBA6T93xFnuzmCso5YwLuGJclTQDfKVcXE
         ZFV/jMn8yAVeg3jUO4OTH6u3M21Y1SB7sQf2ZSOBm56wrRLHOm0TfnSgXpkMU0covP+/
         PtHQttN60KzaghuMnBj59tGW4h9ptyR4GucSUPrn0crWfvqqzMhQS4UI0JyZ39LoSXO8
         JhXqYG0Ep82jHQwivWzyPcjhzflYNJBuk8Iq2SjVYsBbacwIXq1nQhvoAVkL+BOtpAh3
         pMVQ==
X-Gm-Message-State: APjAAAVIh2CD4O7Ftp1jOVBzx0x4oHwC44OIxo/6cPnzPCbilmA36cqa
        2k0UzcgpcwN7K9SAoi1R7Q4fQKX3R96peUJQb4AeGQ==
X-Google-Smtp-Source: APXvYqzLxiN+avbq24R1b9TWzEF95PSP6H4ILV+zwdhuAGkfwsLyWdUlcnWC3l/I4iShVVyAItRPYEgwEsqo8Dp4H34=
X-Received: by 2002:a2e:9456:: with SMTP id o22mr2636564ljh.56.1558698766270;
 Fri, 24 May 2019 04:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190520083101.10229-1-manivannan.sadhasivam@linaro.org> <20190520083101.10229-4-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20190520083101.10229-4-manivannan.sadhasivam@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 May 2019 13:52:34 +0200
Message-ID: <CACRpkdZUR-8Q+tD3szv+=QBJ3h-Mdue9ooj_OY-NkL4MGt7YGQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] pinctrl: Rework the pinmux handling for BM1880 SoC
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

> Rework the BM1880 SoC pinmux handling by removing the
> BM1880_PINMUX_FUNCTION_MUX define and merging it with the
> BM1880_PINMUX_FUNCTION definition. Since the PWM muxing is handled by
> generic pin controller in the SoC itself, there is no need to have a
> dedicated code to do the muxing in PWM registers. So, lets club all
> pinmux handling in the same per pin mux handling code.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Patch applied.

Yours,
Linus Walleij
