Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E144367D7B
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Apr 2021 11:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234773AbhDVJOs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Apr 2021 05:14:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbhDVJOs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Apr 2021 05:14:48 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4689BC06138B
        for <linux-gpio@vger.kernel.org>; Thu, 22 Apr 2021 02:14:02 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id a25so37699752ljm.11
        for <linux-gpio@vger.kernel.org>; Thu, 22 Apr 2021 02:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LnlDwDG8Mm/i/R1Un2gm91Gn9a/5exeWb7v9JTuCEHM=;
        b=VY5WxWGmvpograTbio+0S8m8AtujYEXfnO30UP2H0fDE3MB/plRoixPyRogbnSLJSH
         Sw/nLYsKGIsoEer08DcYJjk8mBO/e0YULKVyVPuLHgywXpArOOalJqmG+uY5jTcnQntb
         /CjkEN13IEed8euk+/8SH1byNgbjztcdrYVvy8GqKPIdlqAdOrtzHZdSOFRNHgvO9ZId
         hk4RCOiLEcC/1QCezpYWr/eAn9vyyonwqO3ismhTPt4oL4gxlP1RoOCzC2N7ffWucYTp
         ngkaKooiKhSklbpQp0BKtWtbRwcH2FDp6/C2ZCrZ/tDWdXbYeuNK920LGX3oMgeoW8MH
         ingg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LnlDwDG8Mm/i/R1Un2gm91Gn9a/5exeWb7v9JTuCEHM=;
        b=JvkqF/34Grs8rarb3K1H63ERLHiRNlP4NKP/2DE1ObnZMKoaxdman05iPIhUaI8XfQ
         83HVFiW6Y4fvzxGrcn676ISfHzxGxjOz8MnNuQ8gzrTq6TMLUu/KS0UdI2n/QqpaVtnR
         FwPNQnBiMUWvnDga6bcWfQ4Cu+tZKmdFYR7cd3SCAwouKXqOK8Xu2xrH6KYTEcScVvTT
         KVi6Y1JIMNS8oEvtZzu9UQqBw3lnbr1D3OM+nrVHRTPlK3i+LzSbhDyCtlKQu3DT7xBS
         pa0J0x97XWD0nMM4wrfazAi2kVOLFoA9quydvF5j0tWFiQjGOIPgikIcIUlmu5qwCRrm
         v/6Q==
X-Gm-Message-State: AOAM532OV1PMRyDLCpecyy1dYvgiAXyWa8oIlO/O9FREYNAXG14KFSMl
        lFMDh9iErMHzg8XX/ZJPy2PQq+BEa//V+IBuI1XbBw==
X-Google-Smtp-Source: ABdhPJzmterwp+tUWBmWs3aN1UK+xzoVd/9X9cEWiG1ZBkNqcdALRmfaB9Lh1Tw6/0WYboNglZZIJEKTKsXxS1ywotQ=
X-Received: by 2002:a2e:a54c:: with SMTP id e12mr1856840ljn.326.1619082840781;
 Thu, 22 Apr 2021 02:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
In-Reply-To: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 22 Apr 2021 11:13:50 +0200
Message-ID: <CACRpkdaDP+JnCP+go9hZAObnNgmJyJRDFypX2CZGp-UJBh5wNA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Add ZynqMP pinctrl driver
To:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>, saikrishna12468@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 22, 2021 at 10:30 AM Sai Krishna Potthuri
<lakshmi.sai.krishna.potthuri@xilinx.com> wrote:

> changes in v6:
> - Rebased the patche series on 'devel' branch in pinctrl tree and no
> functional changes.

Remaining patches applied! Thanks for working so hard on this!

Yours,
Linus Walleij
