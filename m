Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C36E2FE1C1
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 16:48:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727567AbfKOPsL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 10:48:11 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41649 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727443AbfKOPsK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 10:48:10 -0500
Received: by mail-lf1-f66.google.com with SMTP id j14so8351429lfb.8
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 07:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tKS6rtCZj8IaErcUrjRP92Wgp74E5JlJ2MHPseDiEWo=;
        b=Pic7rPYcvUsXNNtxBunu7WIK/Gtn4aqprOS1rk1gJIxywYezckGtII0nqrTVIGPXBu
         7MsWQumzkSuy4YEAkpMGQAplLbZ60ovggZ1uzw1W5aSK5lHxgNC2Wgh4POqh0FUZjHyN
         3tLPOHQNm0o9KZCS/W8rM7+FhMHSaLHt0pi2HExHuH450Gp4nOnsgb9ldXtZktmZXuHr
         hXfZXQlO6pzFI32s5eowebPHMceoXvtHTNZ5+x6iFaDAL1kwPjpoiesNixWvmRnUnpyQ
         06YbbNurlYG5puRjR/FlE7wEHtrep1feCMKcoSmeBgzheWPwwYyiZqcFqusneo1YmGJB
         3RDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tKS6rtCZj8IaErcUrjRP92Wgp74E5JlJ2MHPseDiEWo=;
        b=Hz+MF1rDIqUuwCQkgeryFio6uKMGhaKA07JfZ4eC2d+CYAOfu9JjbWC6emaIIEyW/s
         JFT4NwnHJlC/PcM2J/qCbHOv2rO091mLp3ekw6XfsVbRe+oKgVFQU3NQadLTBqnD1+0w
         0jcxWXtQcuNSw6XtbbA7PL/XMq8/z18OUJa1j3yuRPzSfj5T4T7bkYfBYQyAEcUlKhL6
         nW/HCoNN4aC4r2VAD8MrJEsUmYjYiSOqGsgwgjomVFZTsGRCuqut6gHyqd+csMZMv9cZ
         FwqejaLpLLV1EENGLoUrZswe29bVki5nlF7TYWwG8+V/hUIIKRRMGWr/bHZHuq+5Pbqc
         lpgQ==
X-Gm-Message-State: APjAAAVB+1BywKqf7SBgaqXK2AX4bTDHCS0bjwyRgqAjEUvlGc0RSn0G
        HMwceUk1tMIRQxa4KH9wfHCZnnxtOD4iSgMdG4ulDA==
X-Google-Smtp-Source: APXvYqyZoqBIeRRXE6Tp+xEkPnpvBKDFdlWGPub1qxgpSvfSx0sWfBaGbFbMN2YsYEXanF1TNEKAivdJG/k7sxcjKQk=
X-Received: by 2002:a19:651b:: with SMTP id z27mr11532990lfb.117.1573832888693;
 Fri, 15 Nov 2019 07:48:08 -0800 (PST)
MIME-Version: 1.0
References: <20191114102600.34558-1-hdegoede@redhat.com>
In-Reply-To: <20191114102600.34558-1-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 15 Nov 2019 16:47:57 +0100
Message-ID: <CACRpkdZ6otZOsN++qTm1ZBPxSmd=T5NcyZKYfWDScuB1YrHiFA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpiolib: acpi: Print pin number on
 acpi_gpiochip_alloc_event errors
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 14, 2019 at 11:26 AM Hans de Goede <hdegoede@redhat.com> wrote:

> Print pin number and error-code on acpi_gpiochip_alloc_event errors,
> to help debugging these.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> -Take into account that pin-number may be 16 bits
> -Also log the error-code

Patch applied.

Yours,
Linus Walleij
