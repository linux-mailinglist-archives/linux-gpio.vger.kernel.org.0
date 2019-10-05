Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE43FCCB35
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 18:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729057AbfJEQhn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 12:37:43 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36016 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbfJEQhn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 12:37:43 -0400
Received: by mail-lj1-f196.google.com with SMTP id v24so9530958ljj.3
        for <linux-gpio@vger.kernel.org>; Sat, 05 Oct 2019 09:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=prTkz2BDct+kznOCTl84BP6+isxcds/VL5wpAYcwHBY=;
        b=m2jT+U/AjYzHW1iLL25RrSATBB+XM5O+wb9pHkyxDDzOz+5wGDsqcWYu+xHIj20FMA
         Xwu2HpckrIcTSmbFz4sWXa/wECnqJsrKouRHo8gp5QslS74mYPCyeObXJ6VxItdD/YOC
         ce/yz+2TEzQmEUTxeWuakUD29l/+b5pbv0n+t/YNdn7lWrpgzfmUjaLRamPvaA81a1Zs
         bTJLBgiswBGT+nqqJsALx6ClmKePzLHjFXqbmXRXKl4a6OgkzLIBLODmJg58g4XgC6Sg
         0fJZ8c+uj0/bGFwpeORcThh4OgIe4OKl4jO0bbkLdQx7LlUw15JmDX9Am5AL/OoEzK8b
         kTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=prTkz2BDct+kznOCTl84BP6+isxcds/VL5wpAYcwHBY=;
        b=lEIX8vd0BXxH+NO9z+dfumA0l5m3JZpHQUFRqc9dDCwFpahegigMZrQj4GSQewFPAf
         mggGZWvqii1PVmaAJaNkPmL/ygD6vXJJqkHYDpK+zkNlwetDbe0aeAa7rrPIZ62uwZ9o
         h8gPx0Gj/umIrLiVOuImv3UpgYfYANmTAYSqSS+yWfc9d2HLcAwW7BaF6mDsNvaoh35+
         kOECG20ouQStdaWcegbPef+10rXA2cGPl4QKY4JzyeEH5xaC0cX0xhBQOsxstxk87G9R
         H5nq1IwN5AU2jCDP4JIQwpKxj3MxdwY/20rdvhKSUuy0CcVSxygTtjpMHmjvFYEyPRtb
         KQdw==
X-Gm-Message-State: APjAAAVkS+TKOMsxE6L38kyisH+wk2jjQtPi/q+gV35g84x6Zas1Axka
        JoJ6kfrbgVIHqNqUSrBGO2DErpaIkMzwEbvVyCc1Uw==
X-Google-Smtp-Source: APXvYqxZDMfqx8V17O+f48DGUFf1jTMmQs1PnbGuYwpAD58xGCuDybqkY6PymiQ5pg31cLHibQqXMFRqO2iNX6kIrBM=
X-Received: by 2002:a2e:6344:: with SMTP id x65mr12909835ljb.59.1570293461231;
 Sat, 05 Oct 2019 09:37:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191003000310.17099-1-chris.packham@alliedtelesis.co.nz> <20191003000310.17099-3-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20191003000310.17099-3-chris.packham@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Oct 2019 18:37:29 +0200
Message-ID: <CACRpkdYuJgjLEbYVA-cVxyy6v-L8Hnf2kmZt3S72nFQnrrzMmA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: iproc: use unique name for irq chip
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Li Jin <li.jin@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 3, 2019 at 2:03 AM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:

> Use the dev_name(dev) for the irqc->name so that we get unique names
> when we have multiple instances of this driver.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Patch applied.

Yours,
Linus Walleij
