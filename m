Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97DF22D1FAF
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 01:58:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728505AbgLHA5l convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 7 Dec 2020 19:57:41 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:52889 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728499AbgLHA5l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 19:57:41 -0500
Received: from mail-pl1-f197.google.com ([209.85.214.197])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1kmRJK-0004Z9-6f
        for linux-gpio@vger.kernel.org; Tue, 08 Dec 2020 00:56:58 +0000
Received: by mail-pl1-f197.google.com with SMTP id e11so5745846pld.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Dec 2020 16:56:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=WTDz8bK/RWXRCRmsA/3MNXxPAebwOarBfZw4aRZ3Qm0=;
        b=IHG6VP/V5Le78HrtEzGSBcYrwBob6ZsNSrwRBDsm7MzhSSmPsNyexHymprZis47skG
         Sdr8gywmOI0Gh+s7k9r7mUiDa8kzmom0x/eTCcErwh6y+t7XjPOTPtkyE4fwxV+lRN/y
         5OCJDXVBwGIWze3LlGXeSb0fmPMZnamskif7CWcYBYRHLPZ/fDJY69UEFoxLQ9rcaSew
         kC6G60EQ+EHjPMVq6EL90xzMEa6gFsRVPWWssamF8Pg9ljrKkFgoNIYYso7ol0rfkdGq
         MT2i9GngxMEm8uJ3eC7UosUvUX4urikQHWETvlDU6hY5dTsEBnx4utNcv4ZbLv1bc076
         v0jw==
X-Gm-Message-State: AOAM533Kivv/gFKz759YH9gAeXQV9Q+mUWb7C7RZXqQwKoAnzuuiVZ+f
        3CBi8FGiL51M+J9VKhsqocH13+8042yRA/sCpC4j/dOFx4OirLPpFHgcT9riKJSkf2cL3Zu6tdS
        b1NR56dcm9vJVMSYaHm+FpVafXp4gEYLsNearBwI=
X-Received: by 2002:aa7:9606:0:b029:19d:c837:d69b with SMTP id q6-20020aa796060000b029019dc837d69bmr15744544pfg.46.1607389016434;
        Mon, 07 Dec 2020 16:56:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzwzQhD3uhKSAfTnB99/1hdo+0uV0XKuJ+YJfuA5MtWxjd5vgoYkeAHf2GfB45EZsvPNO1hw==
X-Received: by 2002:aa7:9606:0:b029:19d:c837:d69b with SMTP id q6-20020aa796060000b029019dc837d69bmr15744535pfg.46.1607389016069;
        Mon, 07 Dec 2020 16:56:56 -0800 (PST)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id p16sm584368pju.47.2020.12.07.16.56.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Dec 2020 16:56:55 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.20.0.2.21\))
Subject: Re: [PATCH v1] pinctrl: intel: Actually disable Tx and Rx buffers on
 GPIO request
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20201207175940.10631-1-andriy.shevchenko@linux.intel.com>
Date:   Tue, 8 Dec 2020 08:56:51 +0800
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <B9765E09-0F9C-4E1D-A7F8-3D09B81EF4CD@canonical.com>
References: <20201207175940.10631-1-andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: Apple Mail (2.3654.20.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



> On Dec 8, 2020, at 01:59, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> Mistakenly the buffers (input and output) become together enabled for a little
> period of time during GPIO request. This is problematic, because instead of
> initial motive to disable them in the commit af7e3eeb84e2
> ("pinctrl: intel: Disable input and output buffer when switching to GPIO"),
> the driven value on the pin, which might be used as an IRQ line, brings
> firmware of some touch pads in an awkward state that needs a full power off
> to recover. Fix this by, as stated in a culprit commit, disabling the buffers.
> 
> Fixes: af7e3eeb84e2 ("pinctrl: intel: Disable input and output buffer when switching to GPIO")
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=210497
> Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

> ---
> drivers/pinctrl/intel/pinctrl-intel.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index e77145e3b31b..5cd720f5b0e1 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -452,8 +452,8 @@ static void intel_gpio_set_gpio_mode(void __iomem *padcfg0)
> 	value |= PADCFG0_PMODE_GPIO;
> 
> 	/* Disable input and output buffers */
> -	value &= ~PADCFG0_GPIORXDIS;
> -	value &= ~PADCFG0_GPIOTXDIS;
> +	value |= PADCFG0_GPIORXDIS;
> +	value |= PADCFG0_GPIOTXDIS;
> 
> 	/* Disable SCI/SMI/NMI generation */
> 	value &= ~(PADCFG0_GPIROUTIOXAPIC | PADCFG0_GPIROUTSCI);
> -- 
> 2.29.2
> 
> 

