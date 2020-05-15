Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59C5E1D4E7B
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2020 15:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgEONIm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 May 2020 09:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbgEONIm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 May 2020 09:08:42 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9CBDC061A0C
        for <linux-gpio@vger.kernel.org>; Fri, 15 May 2020 06:08:40 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id h26so1766945lfg.6
        for <linux-gpio@vger.kernel.org>; Fri, 15 May 2020 06:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9pcTgcUegabx9lfpaD09j4PRQ2IapQKdCosijfejNEg=;
        b=fgIN+YVdgfaqIfKSGNCjw7kX+vP9LdnkG0iHhaiB5RGE2rHCxYggs6iE7OoxPurDUM
         QH0O03bp0Vxmy/xeaFiLKgsoPWeYN1Ru6rbwUiWz2a7lWjNfIEdY5uQdPU5MYxtIXoYv
         PVrMa1dlboi1cBgPHC6r0SwCC45bjVFZAeHC6cqV9OHUFOY2k1dF4ZsRKf7N6FR5AN+0
         b+Os7aC5ELzNrRn1UI9KDCldGyGE/Oo4hXxj6TpjnZWD63gEghZtgdvARS4aonYq3WVT
         YLmz9yc/fjnQ6KJRm+0gPAOBxC7WiNdvw7G2I5+GzhgLsloICYM1hynKPtLKFrgPS2bB
         FHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9pcTgcUegabx9lfpaD09j4PRQ2IapQKdCosijfejNEg=;
        b=DhFLVUJgtKGkexGHcs5EzTTdOYS3Ul2U501MRHbf9nGwLdA7EoWmFd81jgkwDhEZNF
         FjnL58H+NluwVqmRYkazSgLXjNVjWeJAYY4rr0NYaV7aavKeWtEgPJS1SC6kzCkhtXll
         xbgRax533KNUm90SXm7jEjdIkZ/RvEmU8SSX+pE1rs6RzTKimhp69kAonJGIdrRDkiI4
         ISCKn1YJj2w5RAlSgbuYNkLELXIWb0ZOUV4UX4QRfJGxX2pbldM5fpi6/42n3dRVKmhp
         UtehxMEUY17YSOKObl0g9bKX+hR2YR4ogFXRjNEZ+i+/kyDKa9LlDjlMH3WzjPWnrjuJ
         nIcg==
X-Gm-Message-State: AOAM5310wxqxHoOOKfFTceo1lg97O+4NMWSBnFxOQXpsQKvSCREW9GNm
        4C3rJ5NSx/DFOcO9ERyXoC3J1elt+ZqBSXqA85xZa2SY
X-Google-Smtp-Source: ABdhPJxT+hUyx/uACJ/hd9vtAK9z5nHT3sNvMOKP73weGjhcgN01GQyhK+l+L9v8/9WHuCrvtrbAhcV3UFEw0epV3iQ=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr2369871lfi.21.1589548119165;
 Fri, 15 May 2020 06:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200514105147.GA44595@black.fi.intel.com>
In-Reply-To: <20200514105147.GA44595@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 15 May 2020 15:08:27 +0200
Message-ID: <CACRpkdbuV+4Mijqr3s=ptY8NBPojXS-o8xZinCCxqQLRoQ-9ow@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.8-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 14, 2020 at 12:51 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Collected Intel pin control drivers for v5.8 cycle. It has all previous fixes
> that doesn't appear in your for-next branch, thus, duplicates.

Pulled in to my "devel" branch, thanks!

Yours,
Linus Walleij
