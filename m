Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31CAEAD21F
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2019 05:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387406AbfIIDLh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Sep 2019 23:11:37 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:41573 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729790AbfIIDLh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Sep 2019 23:11:37 -0400
Received: by mail-qk1-f194.google.com with SMTP id o11so11680617qkg.8
        for <linux-gpio@vger.kernel.org>; Sun, 08 Sep 2019 20:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ysUHgmNu9WMA8zL7iVWv/ObdOdJAcInEBYKpkc9uysc=;
        b=EA0bJFIwM2SjnvAUk8RI0nFyjwZcV+73V6hkW0nl/potXqj6JTUzUTyaQd7OEzizOv
         vyHEimncQN7YnHnfEUPp8I/UtaRujv1i5W762CvcziFum4ncZsXhYe+XQRxyw1WeLOLN
         rSLD8ldV0GUgjGPCvuI8Y4KehrU3PVeG49DxLr19tTb/FohzTLCBu83AEL/ZXJ2smw/L
         8s3EOcTJ4h7EQuTEMeFuq4y+mUCxkUEBTC4ggjorkPNRtmxMcf76UDUkfV424/Qy9i2h
         Bwn92bWrujqZCt04DQmiu+pBJm03Q9wELvxVN+EtcPDS3ikIFtBmOAuQNpEsnIAorRMC
         8dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ysUHgmNu9WMA8zL7iVWv/ObdOdJAcInEBYKpkc9uysc=;
        b=NEhkSL+jjYx5lh7DTuA48CMyHo32bZnu2y+AklszP3c25l/A2xZXwdh5ViGGDNbUBK
         UVxnVOBDx6G8mJG3pQxFvZZgWFZD1qusiZkwaRt7BPbxS17ww0Fr9rfJPrPFZqVbNvdt
         AjfqHQ/uSq3j6q4DmwdNlri51VSWopclNwzlwbSprDvzA7IqzOGafs5RWkCnNpLAP/cE
         Vsl2ASp7JjpXRDAfx5LTFVB0Za64rjMJ31WYJPhFUWz1dpEPR515VQ2jlsX4vg2Z+4lF
         gGrBK30XiFgMA1Z9dXdIE7KDzoxO6ljj914JhsU1cun/KANM/i8oJuiYKBX099jX/NnQ
         MheA==
X-Gm-Message-State: APjAAAWBb52wNC7nXE4P2EsLsBBgJiHNjMuDWrOUcRHwBlN6SLBQKDK/
        OSKVHFxOFMB66nqtRuqCyNcV3Skc9PaqbIyObOaqwg==
X-Google-Smtp-Source: APXvYqxX0B/GZlqSYxDgtH13jNbbY+d3/QJQCEQPxrTROPkHoAlfS/Qfoz+sw1btsfsESznBrLnmdvq6rUNtzvgitZI=
X-Received: by 2002:a37:9c57:: with SMTP id f84mr21728192qke.250.1567998695029;
 Sun, 08 Sep 2019 20:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190906185231.1081695-1-arnd@arndb.de>
In-Reply-To: <20190906185231.1081695-1-arnd@arndb.de>
From:   Chris Chiu <chiu@endlessm.com>
Date:   Mon, 9 Sep 2019 11:11:24 +0800
Message-ID: <CAB4CAwfvPpdhp0oCnAkZEY9GqE+PA8OcD84wtR_P44CZ12p8-g@mail.gmail.com>
Subject: Re: [PATCH] [v2] pinctrl: intel: mark intel_pin_to_gpio __maybe_unused
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 7, 2019 at 2:52 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> The intel_pin_to_gpio() function is only called by the
> PM support functions and causes a warning when those are disabled:
>
> drivers/pinctrl/intel/pinctrl-intel.c:841:12: error: unused function 'intel_pin_to_gpio' [-Werror,-Wunused-function]
>
> Mark it __maybe_unused to suppress the warning.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Chris Chiu <chiu@endlessm.com>
