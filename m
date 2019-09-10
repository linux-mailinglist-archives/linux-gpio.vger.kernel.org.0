Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17FC3AE7AA
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2019 12:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392124AbfIJKLL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Sep 2019 06:11:11 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36421 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392036AbfIJKLL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Sep 2019 06:11:11 -0400
Received: by mail-lj1-f194.google.com with SMTP id l20so15828739ljj.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Sep 2019 03:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ynFXmeLBfKiC07k2+rpb2zC5PgmZfk7HSzPAD6VZEok=;
        b=edyp3LmLYyI4zYaMN8BIXO0VH3Pr3XMiSXnBbsq/3e0dZzhPUToyhQG0vpt1IUHGni
         N+Sw3ZSu9Vy21Fwpvt83G69sbbRQAynyO/Pa6Pa6M9pDIdg5KDLtQQmsoCdD8tbEoaUE
         FlPJkcwNSWAhAkaWbmHK+LXAmFaA6iAtshu+xvQlryjHhTD2ZLw//j6d8lOpDlRRbj2+
         96/33zb2Qs2F1j9djmr0oSg6lgxyne0Sj3pArPVcLlcLV4lvaFKNOTaK9LqaG03jkURm
         0f5pZLS5ufhxR8d0aRc+/rqhEuI+z0d6XqtEJG2mrcO8DByXxe1RkqSPyPF1nAzhJHQC
         JrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ynFXmeLBfKiC07k2+rpb2zC5PgmZfk7HSzPAD6VZEok=;
        b=OJv6+DjYKT89vXhRq2riMLmbOvC8b/vLpVgm9kv+Kn/ItPntF+CmJw3lg5/AHFnxFb
         uolPb7It85caFXdVU5ak9heF5Aujv1Xj6L3IzNg89ibirs+YG5b7I4Ady5qlb9AxcBCm
         NowK9j75NRSJIP7RqVdEYXMedrp2i6pfBJXefYPhta/+HIwvLyK0lq4Q5AnuYlac8qgi
         nRVkm4PjLKSUE56EwaETro2gr6DsiWtlYyqgNWEG4vCbJrkaD0iwIpRLwwPplRVP+reU
         F2siJVJXd4jVvSkh6GC+agyvcQIC+F8Ah0WQBUFZ6PiNk+PU+xlwIeT0TSjsPN0xmiTb
         qReg==
X-Gm-Message-State: APjAAAVVAi/uqDR0gQcpRZ/aKfsQfvc2PRTVSbApOOQVklvJaAC4+qLq
        grbqyZ8iw8ASl+Gf672Bg14sDA6OkgelidxUnR5Nht0ELdGdCw==
X-Google-Smtp-Source: APXvYqxOubfDzFifUxumRe1dwz7xKHG0IWiZy55OmyM2C04lYSja+7z1fHsoiDBGi6h6J3WxBGBq+O2LAAEBsG3t+7A=
X-Received: by 2002:a2e:a408:: with SMTP id p8mr18964063ljn.54.1568110269206;
 Tue, 10 Sep 2019 03:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190909123653.GA4122@black.fi.intel.com>
In-Reply-To: <20190909123653.GA4122@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Sep 2019 11:10:57 +0100
Message-ID: <CACRpkdbgah19c0bwW0BbogTcsnS7fa_N29gqNuC0-6rrT9f=qg@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.4-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 9, 2019 at 1:36 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Small bunch of Intel GPIO driver clean ups.
(...)
> The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

Pulled into my gpio "devel" branch!

Thanks a lot Andy, much appreciated!

Yours,
Linus Walleij
