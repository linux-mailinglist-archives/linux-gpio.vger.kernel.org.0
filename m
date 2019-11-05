Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF3D6EF9E3
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 10:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730615AbfKEJrD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 04:47:03 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33993 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730592AbfKEJrC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 04:47:02 -0500
Received: by mail-lf1-f68.google.com with SMTP id f5so14612232lfp.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2019 01:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oDNWILhILXF6mm3H8oNcRKPRc083ULdV5HXXzp1YeDc=;
        b=AFaRIlMMQwRPRvs6hBDvvglJuPWks9L1fmgOScjoJ/K+WcuKcrtV6SmSdIYBovyIy5
         HJPQ50rNGla80V9nO70LfoT38gOPHKRHDJ7EAUk2tAty8u6jhaTFk3wz8jJR9YI/CSd1
         MyHqQdGBqXLO4S1WrLMR6xTqUPGKLqwytU8ezk9JDoycIQsMFVnhbdyOkAPNiCuC1EY5
         i9JfQZxKfWmzkiVkyxHgGWRMRypI5vzTMHRokDc3dKCP7fGMBKsOUHwBgwgpy0jAuOY8
         sMnwYJTy3BFjsVzUF4ZErDbqnEzVVMv3KlcEJPM0qsMG9F5YbxRIESz1yh+dGVrtp4dX
         YvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oDNWILhILXF6mm3H8oNcRKPRc083ULdV5HXXzp1YeDc=;
        b=luTkFrzNDyy4pPKbLc2ga3D8WQ1A1DqgfcUk0oUpGHtj5+TAEeEclsYzOu3Ol21e3l
         cDS8DAFT0C22e9sDqSCcH96RagWk6STJKXyzb32Tg6zce7yDTz/R7F17DG2kHGxwVI9I
         PvWP+bKhB00krj7kSygajPkXYqGBeLpkiMSH8BHMNuWVMkz3Gjzu0xgAyB/zOLLHzyXE
         2kyzhYibgqszKygRV1WujYEQYxutRtBCffL8ScuI7PSj2Fr281Rnp3QEX3dOwvLcdgpK
         TtaTMQZ3oPwR+cX86qiMaZzeYoz8StT7lAsy44L08h3kb2njAMUnbA65aUoWHLxTKiV6
         exww==
X-Gm-Message-State: APjAAAUItQfPwErwwHJqSoH9FP/FqLx+H8kfvXMpe2BqgkhuF1ykvfhF
        3+dLa4ga62N7UcyrvHUj7is88cNnH+OPrib9i0Fz9zBEC2I=
X-Google-Smtp-Source: APXvYqwfZqIhef589Sh7H+bqh1w3hb9xsL8VjAw2n9TDnV6oj/Lqb7qFfvrsz1pjeeXvoCktgzKbjc7xIdbUvbZlrCY=
X-Received: by 2002:a19:ca13:: with SMTP id a19mr19713764lfg.133.1572947220669;
 Tue, 05 Nov 2019 01:47:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1572926608.git.rahul.tanwar@linux.intel.com>
In-Reply-To: <cover.1572926608.git.rahul.tanwar@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 10:46:49 +0100
Message-ID: <CACRpkdZWJ_4h_+QapgH1bP7EhMwBTy-6DRpv_EaWDzFutWHKaQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] pinctrl: Add new pinctrl/GPIO driver
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Andriy Shevchenko <andriy.shevchenko@intel.com>,
        qi-ming.wu@intel.com, yixin.zhu@linux.intel.com,
        cheol.yong.kim@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 5, 2019 at 7:49 AM Rahul Tanwar
<rahul.tanwar@linux.intel.com> wrote:

> This series is to add pinctrl & GPIO controller driver for a new SoC.
> Patch 1 adds pinmux & GPIO controller driver.
> Patch 2 adds the corresponding dt bindings YAML document.
>
> Patches are against Linux 5.4-rc1 at below Git tree:
> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
>
> v3:
> - Add locking for GPIO IRQ ops.
> - Fix property naming mistake in dt bindings document.
> - Address other code quality related review concerns.
> - Fix a build error reported by kbuild test robot.
> - Remove deleted structure fields from comments.

This version looks perfectly acceptable to me, any remaining nits
can surely be fixed-up in-tree.

I give the other reviewers some days to consider it and then I
will merge it for v5.5.

Yours,
Linus Walleij
