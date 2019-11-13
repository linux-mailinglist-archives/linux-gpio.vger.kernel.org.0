Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 343C7FBB69
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 23:12:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfKMWMQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 17:12:16 -0500
Received: from mail-lj1-f182.google.com ([209.85.208.182]:36295 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbfKMWMQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 17:12:16 -0500
Received: by mail-lj1-f182.google.com with SMTP id k15so4378197lja.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 14:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I5GYuOsLAMNueXhcdbbgmwBHYzW9b+wKbwOkrDyuLh0=;
        b=rc43XROwFpwLJhzk+EC6VK/zBog8hrUHCIpbevQGNKMMMozOI18991+4c/lNzVs9WT
         uwpkBgs7eGRCuLWYspjdASsi46/UEiQzuRIFOKNn86CRc2PybCfFcY698z5lw34CjIMu
         vQpTLyqb8MzUrXa5tgF3HCThqIQcXPz12UovlO5AorcwVXfDjwXKoLphY4A5X4dVfOCh
         mU+Zi2qd/3NTkOX6YZDVNuHtWB+EL0Fxro0znJAa3R+uXtn9Ge50gok0BMCJHYB0xxAJ
         NNCmAuvcGCgxKy9XeggJoIVoeVafgK6PXVNs3n+K/d9pZwoUDBqLhI65+xk4VQR9AxOp
         9tYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I5GYuOsLAMNueXhcdbbgmwBHYzW9b+wKbwOkrDyuLh0=;
        b=RLtQLCsVcg6q9xOBpSFiykpJ9bNORK4dCUnzrp7x1nDFImX526pSt9Zai6foy5g5zu
         Ov7/DY8kjT0lBeVv9rGkIopeVFWehyDu3YlT3ahwv2tcHcO4R0897LlNXtLBaNPIN+im
         5yWZ8uEG1VEO3fZNHar3E3SuKRzwd11kAP+RV2Tmw0yTap2f84f+qudiQ6a41/cL2xnT
         Boyu3xyHbE2y0rvVuK0SqpU0p9YdycPqA4Dz/FwyH45h+TxUn0k9n8e8KMeMH6QVnbrR
         iaYiqFQGHbgBVenzuvNEuvgF0zbhQCL9hVAaS9Avu48syee2bcvwgEgn1BxvG93UYTeb
         axqg==
X-Gm-Message-State: APjAAAVWZfeWQIRL5sHpZcyp1eOZrCH08E/Rz85O3RtZiFBGlSB+Bg0b
        KcaZMFVzYyLkR/gLDBRa7Qzyv1/YL3Lmid3MyS2eag==
X-Google-Smtp-Source: APXvYqz42IDd2RA6v7o/yBmp5R8jE6DCP+F9sUpUEwNCQbHyQm5EgT9uKeYGB/e2w89lpXdliTMyAS/qGngDVtIt6dE=
X-Received: by 2002:a2e:9784:: with SMTP id y4mr4221854lji.77.1573683134210;
 Wed, 13 Nov 2019 14:12:14 -0800 (PST)
MIME-Version: 1.0
References: <20191113140638.GA78145@black.fi.intel.com>
In-Reply-To: <20191113140638.GA78145@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Nov 2019 23:12:02 +0100
Message-ID: <CACRpkdaAg2c6hqZb85OQSVCjRQ1FOvbEy05BrCeRLckXw65L_w@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.5-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 13, 2019 at 3:06 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Intel pin control fixes for v5.5. Note, some of the commits are duplicated
> due to previously sent fixes:
> - 4973ddc84264 pinctrl: intel: Avoid potential glitches if pin is in GPIO mode
> - 3739898576a1 pinctrl: cherryview: Fix irq_valid_mask calculation
> - e58e177392b9 pinctrl: cherryview: Allocate IRQ chip dynamic

OK I merge in v5.4-rc5 and then pulled this on top, it seems to
work!

Thanks a lot man.

Yours,
Linus Walleij
