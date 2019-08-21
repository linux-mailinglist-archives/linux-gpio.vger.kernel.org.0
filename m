Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6EC977FF
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2019 13:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbfHULgi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Aug 2019 07:36:38 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36821 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726349AbfHULgh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Aug 2019 07:36:37 -0400
Received: by mail-lf1-f68.google.com with SMTP id j17so1543669lfp.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2019 04:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V7SRxxhu6d2taMyrfv7C+/76ZolCosQAbFPgSvc8oqc=;
        b=UkNTd9b92rDM0ZiDi+VNEr+7OKUu7Y0tRRA7ihVNhLNt+IaCkcZP5oY0K9bUCrl/1V
         HKxzhZ/Z1W+wxce98pwGkd+vuv1U/w2kqkvSgHMfOLa7il/LJOMLQOpB9lByZsZdaTJ3
         s8DN4iEinnmMPKYtbuwoWUJC88OLcowNIrnOKfdl9o8m/osvczbD7REAWfl9k9MVInlk
         v8wrnnLa4tLMU8hBwSsL/+YqjS00ha/iXZmgNq9kWvzrUS2+rhibKdcZ+v5/J6F9z/EZ
         /STJL1LK/MgIuFjw1DKK5r8juOSP4CD7EoAjmfg53gQt8VVLXnitKtBE+LJDte9z6ODr
         g5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V7SRxxhu6d2taMyrfv7C+/76ZolCosQAbFPgSvc8oqc=;
        b=tfzpdR1V2J348hBOQnZkBb8hWcs+pTGIPrRY1wyUr14OfOZ2YVybg2lDRRP4hKH6ox
         FW6Rm5xNxmoxwb59N4NAhK4bZD6XaxB4vIo5BBTGFCPWIoln3Havy92vVvzwYdN+0yVc
         RbvN00Vl/gms1lDKZLN2eeLhY5BM1HkQur+rhnxp7v/+xW8zb0lxfkimRgwFK8KGltnr
         4gAWY8IVqsKqD5CQXslkFzHrB7ZHZemL95itAsKZgScI16Jh8c9q+McX6hprmW9OY00P
         XvdW1hAwvpTD5eMZMHOZuOcFC8YGaEm3NgHIghWfQnxdWX7HNsFPXuxE0r/3HLrx5R4E
         uGeg==
X-Gm-Message-State: APjAAAWxKnj7i/gm1hqSiDrJaqxPGHmLL1DoKkyeWDnpqIDGhuD7JsyJ
        /7o1G630c0WilKlqBGhw7lwujKR8oGrubu3FKCVUfA==
X-Google-Smtp-Source: APXvYqxADZOGozKUtUmh+cHBPwFO1HUJ9MgdUMomYKjDxjaaP+vRsWaXIdoI96W57Qvdajhkh0JM7Tz7Eg86PPPFlfg=
X-Received: by 2002:a19:ed11:: with SMTP id y17mr18143432lfy.141.1566387395736;
 Wed, 21 Aug 2019 04:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <201908210839.fFMuc6Yx%lkp@intel.com> <15f11bd1-cde0-4345-8daf-234d61ebc9c0@www.fastmail.com>
In-Reply-To: <15f11bd1-cde0-4345-8daf-234d61ebc9c0@www.fastmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 21 Aug 2019 13:36:24 +0200
Message-ID: <CACRpkdakewyaF4Xp6=2c_h1_T1kY-1MQ3bbZzNv2uHSCndHQgg@mail.gmail.com>
Subject: Re: [pinctrl:for-next 54/63] drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c:2325:9:
 error: initialization from incompatible pointer type
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     kbuild test robot <lkp@intel.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        kbuild-all@01.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 21, 2019 at 3:09 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> This is resolved by back-merging the pinctrl-v5.3-2 into pinctrl/devel
> or pinctrl/for-next as mentioned in the thread on Nathan's patch.

OK I merged v5.3-rc5 into my devel branch, that should cut it.

Yours,
Linus Walleij
