Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBD51FA852
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 07:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgFPFg3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 01:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgFPFg3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 01:36:29 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B448C05BD43
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 22:36:28 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id e9so8698286pgo.9
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 22:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vNONwGn8ulStXKOjpSgFehwag/eoaUPF++02kvDIXt0=;
        b=HHhpZSlOGcQMqCBSTAzyEwj2aZ2h3qmIlih0/AMwxbtxzgs7fs5glNrQDsCz6V8NZc
         5+qhyWIjDXhDSJaO+Y8WCx9hCwNxD4KMv+0a0hE9C3488blwLAUdohHiWE/KPpTJDspZ
         dlPwO1etHxa9LoUm1F5nhyuf6QqIGO2TllJrtcDrmwwfE4l0XMtzf4RKAvwUHT/v70zF
         AlflkXSH/K66GiQmDLXO42PFEUEcGioBeviCf9e9FOnrObDN0W2+rw5DRZfC1cHs/rIz
         lZcvLup7G44ORWsdLnmoZEIv5Vzi6bdyma9YW2Y2e3tn4vJsp0tyme12l6uC5x49cRK0
         87LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vNONwGn8ulStXKOjpSgFehwag/eoaUPF++02kvDIXt0=;
        b=osqM1YihkjTpzNH/JpnmZpBWVt3uWhU/N4Zm3dsnkaNoqunOwgbcp/aijs2nfML5Rf
         mpNmpPPS733gszMkVWRflrxr+Cd0XTRj9CIVB//AMraQbRggHdeQ5R/mk1SvWOcNb8zR
         ek2QYqRGpCDLUfq2lxTbJvK3AZmiLVPFG9i4WosESfdfZMBZ+PVzQwfQQSDhO+Lq4s09
         rESJjgicQWoZfYVKqPBCpUHSdINDVMmfO9dNI5Q5rK5R6b6zFN/XeD/GDfSc/HIIBeVl
         IWQkgFhH9wPGRRN2DjihI7fVEaPv0HQ6s1Q41/tJcRAeE3JNENz3IJBNqrf5uTj5CeM3
         4S1g==
X-Gm-Message-State: AOAM533hKWHZGobkrjRDFIB/lSY2t8jwZx/c6vdmTR7zRQ1KGuSz6WD4
        dsCd7MCdpcSZ3ppQYqb/W6M3VCSz81VrOsVBq6NZXiAF
X-Google-Smtp-Source: ABdhPJxtbYAP6qHg2a0rrf6a60DKm6bKE2cwcHyJ8Av5iR2H1iC3IVR64Ge3TQKDQqAwpXqavywWSSvybhnKewVGpPY=
X-Received: by 2002:a63:f042:: with SMTP id s2mr844539pgj.4.1592285788104;
 Mon, 15 Jun 2020 22:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200615151353.88194-2-andriy.shevchenko@linux.intel.com> <202006160949.aOLXxFhV%lkp@intel.com>
In-Reply-To: <202006160949.aOLXxFhV%lkp@intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 16 Jun 2020 08:36:11 +0300
Message-ID: <CAHp75VfnNAUUK1nUyJbBEQxYLp5zc1pC8ASjg8DtOfGtrk7DVg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] pinctrl: intel: Make use of for_each_requested_gpio_in_range()
To:     kernel test robot <lkp@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        kbuild-all@lists.01.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 16, 2020 at 4:18 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Andy,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on pinctrl/devel]
> [also build test ERROR on v5.8-rc1 next-20200615]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

Is there a way to tell kbuild bot to use another patch series (by link
to lore?) that should be used as a base?
In any case this series has such links in a cover letter. Can kbuild
bot parse it (perhaps some special tag, like BaseLink: is needed)?


-- 
With Best Regards,
Andy Shevchenko
