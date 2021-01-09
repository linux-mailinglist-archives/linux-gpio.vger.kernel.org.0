Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26BDC2F0407
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Jan 2021 23:13:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbhAIWNW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 Jan 2021 17:13:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbhAIWNW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Jan 2021 17:13:22 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96AE9C0617A3
        for <linux-gpio@vger.kernel.org>; Sat,  9 Jan 2021 14:12:41 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id u25so11016620lfc.2
        for <linux-gpio@vger.kernel.org>; Sat, 09 Jan 2021 14:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pWNdgAB7F54905PSxndcuizQFvWz899oT1UF8mQCigE=;
        b=VoWkuuaRzIcof6rg6fCj8gUuVQmk4mX+M7w5MsOegPHy0wlbZN0g5y31EVEOCG+JFc
         nZe3HayAOiuIRSWyGrg3Kw+lXX5mzU42uxaKbudkmwFyjtUHFjFsAk3586c4vTmyCImp
         AArWIZlmcpjQVnfPPRFpfGGDDoh5ITf8qYBeLNtsIamK0ewbrxav5lk/vDozVEbyrT2q
         iQ3QcUfMyEmh5m4HCZzaEhesRxcdlPDbuHZlNQwNxNIJ2dQmaPdt4YzwwF/YqMC9vP7+
         vXN8AE3jK+j2PoFDezpL6samXXmDbIJLhf4vK2s/Z3jvdmUoiZPiZEhpnxMqDUvtpBO3
         YpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pWNdgAB7F54905PSxndcuizQFvWz899oT1UF8mQCigE=;
        b=sgXY8H4qLitXVcLc5chUXGpmHdXEIC3AvO3QxVNF4HxqUQgwtyT4Obw42djKf8KntU
         SiBvVZalI/+niP6heSzOS2juhMBTDyT+yAAxiAiJbsMihwf5bgj/SttVgqlXOeRKnSTv
         yTr9Cn2r8OqrsDNBhpp0zyPNg6KdU9v+8bpMDaKBJm2q1ys+hroXlLhW4A+58aJqjqyG
         nKBZ8L9q6xMLZYzTtJO5caOxEuryRb80QncDvEvv6CKP8abWvSGgWo4dnLn1wDK7Hmw7
         DjQRmHz32BarV1Y59QHglkalIgX5MrpFkj5P0CjetNJ2SXhLAGS071pV9UtxEHLaWX0s
         BLpQ==
X-Gm-Message-State: AOAM530SbTmKDKEZIrlhZnQJ63G2VboY6jD8TTfykophvBuOz04ZF3Q8
        DJX6oMuKIFGEJdROqrtxQewHiq6YgGplvKzbNGhBMw==
X-Google-Smtp-Source: ABdhPJxACc9VPGH/iTwCxT+Lt9jPUgWD6ypR+Dmax5NfonZfuWTmjtMwb90HF88pUYCiu4Mx2CiDj4k+fDhIva0v5qw=
X-Received: by 2002:a2e:85d1:: with SMTP id h17mr4095505ljj.438.1610230360062;
 Sat, 09 Jan 2021 14:12:40 -0800 (PST)
MIME-Version: 1.0
References: <20210109140204.151340-2-angelogioacchino.delregno@somainline.org> <202101100151.3ojnIrPg-lkp@intel.com>
In-Reply-To: <202101100151.3ojnIrPg-lkp@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 9 Jan 2021 23:12:29 +0100
Message-ID: <CACRpkdbT6tv5ArKRLPh3hE-3fuYHotqG5tNwkF4vftSQ1T=wNA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander
To:     kernel test robot <lkp@intel.com>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kbuild-all@lists.01.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 9, 2021 at 6:24 PM kernel test robot <lkp@intel.com> wrote:

>  > 880          gpioirq->parent_domain = NULL;

The autobuilder is complaining because your irq chip is not
hierarchical and this is only used for hierarchical irqchips.
I think you can just delete this line.

Yours,
Linus Walleij
