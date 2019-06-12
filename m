Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED46C41E65
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 09:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbfFLH4N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 03:56:13 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39497 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbfFLH4M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 03:56:12 -0400
Received: by mail-lj1-f195.google.com with SMTP id v18so14220564ljh.6
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 00:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MpVyyIY+84Nucp0CGFI/TVYjVMVNEKw90ADvLXHqdCE=;
        b=ywhFsERMuu6cckroCnmO4n7s8QukIAuyz0zLikfSlsBUYZFkfXANfIGjA5/KhVSGhU
         wsTIS0bWPWJna21j3rW8yvYs+F3NDlNqUUNiwkURwt7WWjHQqvSdAVutVveDLoeATPmt
         YORL3OagMZLOBpPjV+Lzr3Zc5+emLQXq8fBsmzAk+ZzLkaAJi8UAoaKnj+VxyW7Gz8TH
         ZkfgwAA8LK1D47ev74wBPQDWl+uzPcltC2JGYtqEHXKChCSe2HGOK/amvFPZaQpfcYa8
         sP35dsdokzVNIdfr8KF3qAK8nz6YpxVF9GycG2qi5PIFNksCy8C4t63BybmL5wEh/Sng
         wPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MpVyyIY+84Nucp0CGFI/TVYjVMVNEKw90ADvLXHqdCE=;
        b=iA2bHJhmR0+Diwmy4T/dsHkt3D8oKebHWGwmEDi9u75jB3/4ZPITKZpG50Dt+/u8xn
         YgwQhrhfVdPVs0RpAy4FO32C3xK/4OrwKDNmUMPe/IbL3juwtOubtuEyJc/KBPjZG9do
         ENC7qEj/uUBqtZvNixKECQuPfzLYosAY7C+FlcFS0u2zMN0KU8AFriPuSxijm/nkmUlX
         RL2kfadX5uNoifKVVCLW/Bqs8dpdR/Mo7Mw44BOzNiodYH3gTKgUkFfkr4vDcnypM6Ad
         jPs8mv6iVHksOd/h0knBCIAdF1zmASTQGHP1nMyRi9VShfLpaNqcDNJnkl1qMNL72vGq
         UDug==
X-Gm-Message-State: APjAAAX21vZ5i6L7cWEm+zh3raxwIFP3Csk4Mu1Gcbcx/8rSTGmZcM+j
        YW8vEO2w1jhHulmqJtzOykzsG+qgbIuwY0eOtyoDgyZvznY=
X-Google-Smtp-Source: APXvYqwBtvb1aHOu8BGk+6o3Llz+ZVHUG284rkHqlGevLtNgB6RjYMYSnQnZgYw64OXncNMQfXgGGBNNy6xlBvlYPQA=
X-Received: by 2002:a2e:7508:: with SMTP id q8mr26686053ljc.165.1560326170850;
 Wed, 12 Jun 2019 00:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-3-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-3-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 09:55:59 +0200
Message-ID: <CACRpkdZdCxvFQp9xssmqToeT5FrC4quusEgJOAbYo+TxUzGujw@mail.gmail.com>
Subject: Re: [PATCH-next 02/20] gpio: gpio-omap: fix lack of irqstatus_raw0
 for OMAP4
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Russell King <rmk@arm.linux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 10, 2019 at 7:11 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> From: Russell King <rmk+kernel@armlinux.org.uk>
>
> Commit 384ebe1c2849 ("gpio/omap: Add DT support to GPIO driver") added
> the register definition tables to the gpio-omap driver. Subsequently to
> that commit, commit 4e962e8998cc ("gpio/omap: remove cpu_is_omapxxxx()
> checks from *_runtime_resume()") added definitions for irqstatus_raw*
> registers to the legacy OMAP4 definitions, but missed the DT
> definitions.
>
> This causes an unintentional change of behaviour for the 1.101 errata
> workaround on OMAP4 platforms. Fix this oversight.
>
> Fixes: 4e962e8998cc ("gpio/omap: remove cpu_is_omapxxxx() checks from *_runtime_resume()")
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
